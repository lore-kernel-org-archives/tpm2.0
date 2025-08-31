Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC3330CDA5;
	Sun, 31 Aug 2025 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756652533; cv=none; b=CpP88rNttumgakckLTasrt8MdMtiGxbFEp4+Im5rHC6BX8GZqMsGvcwfM3f/mgEuW/Kqq/PTU1r4z0kFiWAQZR8ENdNm06kM3nWMMpppvK1XjwwaAt4J3j3T2F00RnrhuXtOKKDkyHBF4w2uVft2RSx8kiNZRp9LZCsAE+/hz5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756652533; c=relaxed/simple;
	bh=zfKkijrWlKRwJoVsHn1OJqLMHsDeDnweJLnSwCbjJlg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nksOYgdgrCHQX95LEnLW+LNQe/HrGgq5Bw9Cas/LMl7KFzx3sE/zEg2FIZVVYBOtaaV+MHqUXJCF8u2Pfuwog7DDly/i+C7yW0kC1zRCLsSLYmzWG8byvrOis2lt2+DReTJN1m/fyfC5CxxHCMM0AzT/jvAEGTvOc+IuW0SJDJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYm0Uh5R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYm0Uh5R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A1CC4CEF4;
	Sun, 31 Aug 2025 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756652533;
	bh=zfKkijrWlKRwJoVsHn1OJqLMHsDeDnweJLnSwCbjJlg=;
	h=From:To:Cc:Subject:Date:From;
	b=uYm0Uh5Rtta5Bdk8W9mUwgjfkq+tumhkt50q7ECRm9ECHmVcQOIDwIy57Q5/Gq7FO
	 l8x7PKQF1gFPcEsv3W2k3Y2Vc4oMtYaHnOWw8DvNVRuQXBbmqEzMuriftY/NSEvIn7
	 WqMkKSHRNGSekZc113YPeHBZfDy7bAmYEvCT3ZtarUzAAi5YhEtyxiPgVNcrNlvlE/
	 Lc1OHFrEZHcKxKUVno7nRhRLjAxTy0SyesDEgQ14psk0hWrsjVwkcbpe3DRd20hDOv
	 ZcXLG0yNE9yxV32DueUT5GLYHSRC+fEFqCvYurUwXEn+UYW/wnU0UhyexjQqYckCDX
	 43JKCJ6oXfJbA==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev
Cc: tpm2@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH] perf(message): avoid buffer copy during command parsing
Date: Sun, 31 Aug 2025 18:01:45 +0300
Message-Id: <20250831150145.386502-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`tpm_parse_command` copies handles and parameters to a fixed-size temporary
4 KiB buffer on the stack before invoking a command parser.

Introduce `TpmParseCommandBody` trait implemented by `tpm_struct!`,
providing accessors for handles and parameters in the original command
buffer, thus zeroing out the large stack allocation.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
I plan to backport this also to 0.10.x branch, given signficancy.
 src/macro/mod.rs     |  7 +++++--
 src/macro/struct.rs  | 20 +++++++++++++++-----
 src/message/mod.rs   | 14 +++++++++++++-
 src/message/parse.rs | 15 +++------------
 4 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/src/macro/mod.rs b/src/macro/mod.rs
index 2ca6a15..782d3f7 100644
--- a/src/macro/mod.rs
+++ b/src/macro/mod.rs
@@ -150,7 +150,10 @@ macro_rules! tpm_dispatch {
                     <$value as $crate::message::TpmHeader>::NO_SESSIONS,
                     <$value as $crate::message::TpmHeader>::WITH_SESSIONS,
                     <$value as $crate::message::TpmHeader>::HANDLES,
-                    |buf| <$value>::parse(buf).map(|(c, r)| (TpmCommandBody::$name(c), r)),
+                    |handles, params| {
+                        <$value as $crate::message::TpmCommandBodyParse>::parse_body(handles, params)
+                            .map(|(c, r)| (TpmCommandBody::$name(c), r))
+                    },
                 )
             };
         }
@@ -199,7 +202,7 @@ macro_rules! tpm_dispatch {
             )*
         }
 
-        pub type TpmCommandParser = for<'a> fn(&'a [u8]) -> $crate::TpmResult<(TpmCommandBody, &'a [u8])>;
+        pub type TpmCommandParser = for<'a> fn(&'a [u8], &'a [u8]) -> $crate::TpmResult<(TpmCommandBody, &'a [u8])>;
         pub type TpmResponseParser = for<'a> fn(&'a [u8]) -> $crate::TpmResult<(TpmResponseBody, &'a [u8])>;
 
         pub(crate) static PARSE_COMMAND_MAP: &[($crate::data::TpmCc, bool, bool, usize, TpmCommandParser)] =
diff --git a/src/macro/struct.rs b/src/macro/struct.rs
index d9bc593..01e2cfb 100644
--- a/src/macro/struct.rs
+++ b/src/macro/struct.rs
@@ -55,18 +55,28 @@ macro_rules! tpm_struct {
             }
         }
 
-        impl $crate::TpmParse for $name {
+        impl $crate::message::TpmCommandBodyParse for $name {
             #[allow(unused_mut)]
-            fn parse(buf: &[u8]) -> $crate::TpmResult<(Self, &[u8])> {
-                let mut cursor = buf;
+            fn parse_body<'a>(
+                handles: &'a [u8],
+                params: &'a [u8],
+            ) -> $crate::TpmResult<(Self, &'a [u8])> {
+                let mut cursor = handles;
                 $(
-                    let ($handle_field, tail) = <$handle_type>::parse(cursor)?;
+                    let ($handle_field, tail) = <$handle_type as $crate::TpmParse>::parse(cursor)?;
                     cursor = tail;
                 )*
+
+                if !cursor.is_empty() {
+                    return Err($crate::TpmErrorKind::TrailingData);
+                }
+
+                let mut cursor = params;
                 $(
-                    let ($param_field, tail) = <$param_type>::parse(cursor)?;
+                    let ($param_field, tail) = <$param_type as $crate::TpmParse>::parse(cursor)?;
                     cursor = tail;
                 )*
+
                 Ok((
                     Self {
                         $($handle_field,)*
diff --git a/src/message/mod.rs b/src/message/mod.rs
index aff0933..eb0d3f0 100644
--- a/src/message/mod.rs
+++ b/src/message/mod.rs
@@ -52,7 +52,7 @@ pub type TpmAuthCommands = TpmList<data::TpmsAuthCommand, MAX_SESSIONS>;
 /// A fixed-capacity list for response authorization sessions.
 pub type TpmAuthResponses = TpmList<data::TpmsAuthResponse, MAX_SESSIONS>;
 /// A trait for TPM commands and responses that provides header information.
-pub trait TpmHeader: TpmBuild + TpmParse + Debug {
+pub trait TpmHeader: TpmBuild + Debug {
     const COMMAND: data::TpmCc;
     const NO_SESSIONS: bool;
     const WITH_SESSIONS: bool;
@@ -77,6 +77,18 @@ pub trait TpmHeaderCommand: TpmHeader {
     fn build_parameters(&self, writer: &mut TpmWriter) -> TpmResult<()>;
 }
 
+/// Parses a command body from the slices point out to the handle area and
+/// parameter area of the original buffer.
+pub(crate) trait TpmCommandBodyParse: Sized {
+    /// Parses the command body from the handle and parameter area.
+    ///
+    /// # Errors
+    ///
+    /// * `TpmErrorKind::ParseCapacity` if the capacity limit is exceeded
+    /// * `TpmErrorKind::ParseUnderflow` if the parser runs out of bytes
+    fn parse_body<'a>(handles: &'a [u8], params: &'a [u8]) -> TpmResult<(Self, &'a [u8])>;
+}
+
 pub const TPM_HEADER_SIZE: usize = 10;
 
 tpm_dispatch! {
diff --git a/src/message/parse.rs b/src/message/parse.rs
index cc63802..f55d7a8 100644
--- a/src/message/parse.rs
+++ b/src/message/parse.rs
@@ -8,7 +8,7 @@ use super::{
 };
 use crate::{
     data::{TpmCc, TpmRc, TpmSt, TpmsAuthCommand, TpmsAuthResponse},
-    TpmErrorKind, TpmNotDiscriminant, TpmParse, TpmResult, TPM_MAX_COMMAND_SIZE,
+    TpmErrorKind, TpmNotDiscriminant, TpmParse, TpmResult,
 };
 use core::{convert::TryFrom, mem::size_of};
 
@@ -94,18 +94,9 @@ pub fn tpm_parse_command(buf: &[u8]) -> TpmResult<(TpmHandles, TpmCommandBody, T
         after_handles
     };
 
-    let mut temp_body_buf = [0u8; TPM_MAX_COMMAND_SIZE];
-    let full_body_len = handle_area.len() + param_area.len();
-    if full_body_len > temp_body_buf.len() {
-        return Err(TpmErrorKind::ParseCapacity);
-    }
-    let full_body_for_parser = &mut temp_body_buf[..full_body_len];
-    full_body_for_parser[..handle_area.len()].copy_from_slice(handle_area);
-    full_body_for_parser[handle_area.len()..].copy_from_slice(param_area);
-
-    let (command_data, remainder) = (dispatch.4)(full_body_for_parser)?;
+    let (command_data, param_remainder) = (dispatch.4)(handle_area, param_area)?;
 
-    if !remainder.is_empty() {
+    if !param_remainder.is_empty() {
         return Err(TpmErrorKind::TrailingData);
     }
 
-- 
2.39.5

