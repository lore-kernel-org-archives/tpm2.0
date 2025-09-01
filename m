Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E2923B0;
	Mon,  1 Sep 2025 17:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756746278; cv=none; b=oyOVfdla01ZuQEmAtqdllmNk4gwy26OnK3mCjXnXWB47hc/1Cro7H7SenwavCxHbd95rG1/xw+d5nXn7XqAr9GOtXSObqVGh9730w9SLzuVUHg9nojKQuGIHOerZyKf0aVHWixBj7nG3lZKi4imhXJ7tLUUF+MEy7NnBFGpthIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756746278; c=relaxed/simple;
	bh=4aOQQ/KvpkGOWjZN2/4Le9A77sRKlxqmue9BDPh6X+k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VA34uNKGmo3gm9xjwMduoktHVBDPv2lecFj2E3+EINSkh5fmp3NcQ+RJIsREDX7TPzjiRYGSHrG5bxyDsmYwFPCDkySh07mxH1osU6beM/YOsN3FtLSyv4oXkqjP8eUGwImxgkv57B2pfTg034YXiuepL35xMArfhGwE3VfsfPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uj+L+o4t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uj+L+o4t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BFAC4CEF0;
	Mon,  1 Sep 2025 17:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756746278;
	bh=4aOQQ/KvpkGOWjZN2/4Le9A77sRKlxqmue9BDPh6X+k=;
	h=From:To:Cc:Subject:Date:From;
	b=Uj+L+o4t1HmEh2Iipn4Sk6YtCgYpc7nFOPGk1Hy4+IWRxIwAqvo6ZGbTA1Bx7jXDA
	 aIc78/Xl20RXDYUBYk8iVnc7seVq8jWYDRAPm+KEHHc58wy6H2FHx+s7qUjausCx+U
	 DK/UiGxTuIsdmj6PvNa6M914rEB/Hi60mQQq18F8pNktl+InVBi/pvE07w+mKv54lp
	 0dNIKu8mDY8Z5lS9st8yE3/mAYpe+E905sNOjTApz3kw/g0z4Y7I++cNQxE1NozgGH
	 LFzZC1FMPUwxuWRs6SlBn9c5ISAxDSpK52Jdjt9Z9GoV3au5XozmMma9STcmJT9qAK
	 M3J2NXePWs5zQ==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev
Cc: tpm2@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH] fix(builder): add missing rc.is_warning() check
Date: Mon,  1 Sep 2025 20:04:27 +0300
Message-Id: <20250901170427.2194100-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new tests `test_response_build_warning*` confirm a failure in the
response builder. More precisely, `*with_sessions` variation fails.

The bug emits from a missing `is_warning` check in the response,
leading to an incorrectly constructed response.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 src/message/build.rs |  2 +-
 tests/runner.rs      | 66 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/src/message/build.rs b/src/message/build.rs
index 9b72f43..4a48228 100644
--- a/src/message/build.rs
+++ b/src/message/build.rs
@@ -98,7 +98,7 @@ where
         TpmSt::NoSessions
     };
 
-    if rc.is_error() {
+    if rc.is_error() || rc.is_warning() {
         (TpmSt::NoSessions as u16).build(writer)?;
         u32::try_from(TPM_HEADER_SIZE)?.build(writer)?;
         rc.value().build(writer)?;
diff --git a/tests/runner.rs b/tests/runner.rs
index 45140e7..c07bc84 100644
--- a/tests/runner.rs
+++ b/tests/runner.rs
@@ -721,6 +721,70 @@ fn test_response_build_error() {
     );
 }
 
+fn test_response_build_warning() {
+    let resp = TpmFlushContextResponse::default();
+    let rc = TpmRc::try_from(TpmRcBase::ContextGap as u32).unwrap();
+
+    let generated_bytes = {
+        let mut buf = [0u8; TPM_MAX_COMMAND_SIZE];
+        let len = {
+            let mut writer = TpmWriter::new(&mut buf);
+            tpm_build_response(&resp, &[], rc, &mut writer).unwrap();
+            writer.len()
+        };
+        buf[..len].to_vec()
+    };
+
+    assert_eq!(
+        generated_bytes.len(),
+        10,
+        "A warning response should only be 10 bytes long."
+    );
+
+    let (tag, _) = u16::parse(&generated_bytes).unwrap();
+    assert_eq!(
+        tag,
+        TpmSt::NoSessions as u16,
+        "A warning response must have a NO_SESSIONS tag."
+    );
+}
+
+fn test_response_build_warning_with_sessions() {
+    let resp = TpmStartAuthSessionResponse::default();
+    let rc = TpmRc::try_from(TpmRcBase::ContextGap as u32).unwrap();
+    let mut sessions = TpmAuthResponses::new();
+    sessions
+        .try_push(TpmsAuthResponse {
+            nonce: Tpm2bNonce::default(),
+            session_attributes: TpmaSession::default(),
+            hmac: Tpm2bAuth::default(),
+        })
+        .unwrap();
+
+    let generated_bytes = {
+        let mut buf = [0u8; TPM_MAX_COMMAND_SIZE];
+        let len = {
+            let mut writer = TpmWriter::new(&mut buf);
+            tpm_build_response(&resp, &sessions, rc, &mut writer).unwrap();
+            writer.len()
+        };
+        buf[..len].to_vec()
+    };
+
+    assert_eq!(
+        generated_bytes.len(),
+        10,
+        "A warning response with sessions should only be 10 bytes long."
+    );
+
+    let (tag, _) = u16::parse(&generated_bytes).unwrap();
+    assert_eq!(
+        tag,
+        TpmSt::NoSessions as u16,
+        "A warning response with sessions must have a NO_SESSIONS tag."
+    );
+}
+
 fn test_response_build_pcr_read() {
     let mut pcr_values = TpmlDigest::new();
     pcr_values
@@ -1085,6 +1149,8 @@ test_suite!(
     test_macro_response_parse_correctness,
     test_macro_response_parse_remainder,
     test_response_build_error,
+    test_response_build_warning,
+    test_response_build_warning_with_sessions,
     test_response_build_pcr_read,
     test_response_parse_pcr_event,
     test_response_parse_policy_get_digest,
-- 
2.39.5

