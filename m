Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363B335C7;
	Sun, 31 Aug 2025 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756676968; cv=none; b=Zmpee7XnwJS1BHTkRcZ5iulC7ps5AXe09f67Mgo1FayxN2KXtYzAcmO6BWe/ImYkF3XSZWtWrdl9HZu/rOrcmoJUFvHzBzqd7RxGbIa8xXZUVIvcp+j+/Q838tSghuSzfhBYe3BmrQ7XANhDIMD+W8Y0E7O6iwydoJ4ZFXjEK20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756676968; c=relaxed/simple;
	bh=K0ortl8v/dm7gkYFQqln3Xy3B/ece7VjIfslyPEQv+I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F1dn3P7SSfgL1lT9ytDZh7KBadnqDq79iTRNPZmPOUv77dyFSuFGom02EM5MaV2GRSNfZWrpjrYnRQTNxs1VQX9jKB8kThsP4Mq+3X8+qNNqu+co+m7oc4v1tvK/DuMQYQRwQ+bpNOXRH8CSgsq9I5FYIYSfd7H8GTTkKG3CgX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcRYDm0Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcRYDm0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8BBC4CEED;
	Sun, 31 Aug 2025 21:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756676967;
	bh=K0ortl8v/dm7gkYFQqln3Xy3B/ece7VjIfslyPEQv+I=;
	h=From:To:Cc:Subject:Date:From;
	b=hcRYDm0QyzGucdT/gELRWYRSQ7r7uCetR1CTjctM+E/hic7v395FQngj8Zz61CSOT
	 Fy7QUeb2RsLgPFBkRvXvK0z/ir0W7Js3a9Nc58T/wIg79mn51UgYBXkSD2CGL9S7lh
	 lGaLisMIH/RS9utZ8lAkSFwifFWWhLqjhjjsA1eZ0RSKJHPHDptWD9XE3H/4tzRt8z
	 giNf9lgzQDWpfvcCEnw0PUZQvDQkM82WWPFybgFpAbCg79dzJfqASstakw53dwV9C3
	 c0+0MQcnTqkjMjek7OUq2HwmTr7NdKn5zZXEtUtARAUzJ0D0d6xzSKgZ52z7FlE1zt
	 tj4epSii05+/w==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev
Cc: tpm2@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH] fix(message): correct wrong field type in StartAuthSession
Date: Mon,  1 Sep 2025 00:49:15 +0300
Message-Id: <20250831214915.847041-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
Will be immediately applied.
 src/macro/mod.rs       | 1 +
 src/message/session.rs | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/src/macro/mod.rs b/src/macro/mod.rs
index 782d3f7..2070b62 100644
--- a/src/macro/mod.rs
+++ b/src/macro/mod.rs
@@ -172,6 +172,7 @@ macro_rules! tpm_dispatch {
         }
 
         /// A TPM command
+        #[allow(clippy::large_enum_variant)]
         #[derive(Debug, PartialEq, Eq, Clone)]
         pub enum TpmCommandBody {
             $( $variant($cmd), )*
diff --git a/src/message/session.rs b/src/message/session.rs
index 24c883a..c2e29a6 100644
--- a/src/message/session.rs
+++ b/src/message/session.rs
@@ -5,7 +5,7 @@
 //! 11.2 `TPM2_PolicyRestart`
 
 use crate::{
-    data::{Tpm2b, Tpm2bNonce, TpmAlgId, TpmCc, TpmSe, TpmtSymDefObject},
+    data::{Tpm2bEncryptedSecret, Tpm2bNonce, TpmAlgId, TpmCc, TpmSe, TpmtSymDefObject},
     tpm_struct, TpmSession,
 };
 use core::fmt::Debug;
@@ -23,7 +23,7 @@ tpm_struct! {
     },
     parameters: {
         pub nonce_caller: Tpm2bNonce,
-        pub encrypted_salt: Tpm2b,
+        pub encrypted_salt: Tpm2bEncryptedSecret,
         pub session_type: TpmSe,
         pub symmetric: TpmtSymDefObject,
         pub auth_hash: TpmAlgId,
-- 
2.39.5

