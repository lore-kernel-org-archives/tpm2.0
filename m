Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC2732F76D;
	Mon,  1 Sep 2025 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756743433; cv=none; b=A/a/PmLCFNwfJOzh0sDXxh/w2XHzqKmFojMAGXakrEewIKFOWL4Ye8IpprSCrcRDiKNSEDgivoCtaT69vScuFHHK4nNDIqivuJ4oAAfMcLX+MAobmOEBI12tGacM3HHV0dX7UlzNAy6nRifpvCTbA2ZGkBDdx/8Ik5a5YaSb+fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756743433; c=relaxed/simple;
	bh=KMyG3LSVvVkLLgVydc70+NgHI9ahfPbjFLE7y0oApOU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OrRQ0QyGqDFFUcn7NGuGDfJHAa5DfBOU+kL1trpPRgI70nMdls4hD+H74zjny0d+e5SPrer27bZnE1tc4nr89zuxJEobe0QqkIQUJ2XVlliZkQgVRok4u7S8S0g7l7HxnOZCBXCxxHETqH7KZt+N7ZJGgeFO8fTVRJdVcql/zV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRHF9/tV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRHF9/tV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2CFC4CEF1;
	Mon,  1 Sep 2025 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756743433;
	bh=KMyG3LSVvVkLLgVydc70+NgHI9ahfPbjFLE7y0oApOU=;
	h=From:To:Cc:Subject:Date:From;
	b=gRHF9/tVjn8geWzwNR87cWNrQzkMVthBi/nJGNz6DbHy08J4VHbd0nZoLMGRJjlph
	 FKBCcLLQ4OZx3QeybthEqC/scJFDHNAZMxU9tvbK2ocVxsDgV3NRdH+gWRDiO6/rHT
	 d0iutp2P80I1lvCwLhQIZe4mGUcsHcieoK1q7bfpZAPAMrqEEAz3dZ5tCNgAZH7pHG
	 BDeeL0Jb/IqOHE+dAzQ+ysg1AFYfSRiYd2mCiz1dXWSOmQxuHlZu+0FbDxIGij6bXH
	 nZAaBJBI/8ELgkMOYfWEMBFPCTS1KKkLay7/186jsBatJxm0+hdkNt5Px/u1IEmacw
	 MDXXc7cY7PqFg==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev
Cc: tpm2@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH] fix(message): return `BuildCapacity` from build traits
Date: Mon,  1 Sep 2025 19:16:51 +0300
Message-Id: <20250901161651.2142200-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Build traits incorrectly return `ParseCapacity` when they should return
`BuildCapacity`. Fixup the error code.

Capacity means the value of an architectural limit in this context. E.g.,
the builder and parser detect if a `TPML_*` has more values than the TCG
specifications allows, and return capacity error if the limit is surpassed.

Additionally, updated documentation of these error values to better
clarify their use and their purpose.

`BuildOverflow` is probably the most confusing of the pre-existing error
code. It pre-dates to the time when the implementation had internal
buffers. Right now, the only function returning that error is
`TpmWriter::write_bytes`, and when this happens, it is a clear sign of a
regression in the crate implementation i.e., not part of the legit behavior
anymore.

In the main branch `BufferOverflow` will be eventually removed but it is
out of scope for the bug fix.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 src/lib.rs           | 10 +++++-----
 src/message/build.rs | 10 +++++-----
 src/message/mod.rs   |  6 +++---
 tests/runner.rs      |  5 ++---
 4 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/src/lib.rs b/src/lib.rs
index 65f1220..eb99dbc 100644
--- a/src/lib.rs
+++ b/src/lib.rs
@@ -75,9 +75,9 @@ impl fmt::LowerHex for TpmNotDiscriminant {
 pub enum TpmErrorKind {
     /// A command requires an authorization session but none was provided
     AuthMissing,
-    /// A protocol defined limit exceed
+    /// A built value would exceed a capacity limit
     BuildCapacity,
-    /// Not enough space for writing
+    /// A writer would run out of space
     BuildOverflow,
     /// An unresolvable internal error
     Unreachable,
@@ -93,9 +93,9 @@ pub enum TpmErrorKind {
     InvalidValue,
     /// Not a valid discriminant for the target enum
     NotDiscriminant(&'static str, TpmNotDiscriminant),
-    /// A read count from buffer exceeds the protocol defined limit
+    /// A value would exceed a capacity limit
     ParseCapacity,
-    /// Not enough space for reading
+    /// Not enough bytes to parse the full data structure.
     ParseUnderflow,
     /// Trailing data after parsing
     TrailingData,
@@ -205,7 +205,7 @@ pub trait TpmBuild: TpmSized {
     ///
     /// # Errors
     ///
-    /// * `TpmErrorKind::ParseCapacity` if the object contains a value that cannot be built.
+    /// * `TpmErrorKind::BuildCapacity` if the object contains a value that cannot be built.
     /// * `TpmErrorKind::BuildOverflow` if the writer runs out of space.
     fn build(&self, writer: &mut TpmWriter) -> TpmResult<()>;
 }
diff --git a/src/message/build.rs b/src/message/build.rs
index 41a7fee..9b72f43 100644
--- a/src/message/build.rs
+++ b/src/message/build.rs
@@ -13,7 +13,7 @@ use core::mem::size_of;
 ///
 /// # Errors
 ///
-/// * `TpmErrorKind::ParseCapacity` if the command has unknown state
+/// * `TpmErrorKind::BuildCapacity` if the command has unknown state
 pub fn tpm_build_command<C>(
     command: &C,
     tag: TpmSt,
@@ -58,7 +58,7 @@ where
 
     let total_body_len = handle_area_size + auth_area_size + param_area_size;
     let command_size =
-        u32::try_from(TPM_HEADER_SIZE + total_body_len).map_err(|_| TpmErrorKind::ParseCapacity)?;
+        u32::try_from(TPM_HEADER_SIZE + total_body_len).map_err(|_| TpmErrorKind::BuildCapacity)?;
 
     (tag as u16).build(writer)?;
     command_size.build(writer)?;
@@ -68,7 +68,7 @@ where
 
     if tag == TpmSt::Sessions {
         let sessions_len_u32 = u32::try_from(auth_area_size - size_of::<u32>())
-            .map_err(|_| TpmErrorKind::ParseCapacity)?;
+            .map_err(|_| TpmErrorKind::BuildCapacity)?;
         sessions_len_u32.build(writer)?;
         for s in sessions {
             s.build(writer)?;
@@ -82,7 +82,7 @@ where
 ///
 /// # Errors
 ///
-/// * `TpmErrorKind::ParseCapacity` if the response has unknown state
+/// * `TpmErrorKind::BuildCapacity` if the response has unknown state
 pub fn tpm_build_response<R>(
     response: &R,
     sessions: &[TpmsAuthResponse],
@@ -109,7 +109,7 @@ where
     let sessions_len: usize = sessions.iter().map(TpmSized::len).sum();
     let total_body_len = body_len + sessions_len;
     let response_size =
-        u32::try_from(TPM_HEADER_SIZE + total_body_len).map_err(|_| TpmErrorKind::ParseCapacity)?;
+        u32::try_from(TPM_HEADER_SIZE + total_body_len).map_err(|_| TpmErrorKind::BuildCapacity)?;
 
     (tag as u16).build(writer)?;
     response_size.build(writer)?;
diff --git a/src/message/mod.rs b/src/message/mod.rs
index 2d02361..99bb91b 100644
--- a/src/message/mod.rs
+++ b/src/message/mod.rs
@@ -65,15 +65,15 @@ pub trait TpmCommandBuild {
     ///
     /// # Errors
     ///
-    /// * `TpmErrorKind::BuildOverflow` if the writer runs out of space.
+    /// * `TpmErrorKind::BuildOverflow` if writer would run out of space.
     fn build_handles(&self, writer: &mut TpmWriter) -> TpmResult<()>;
 
     /// Builds the parameter area of the command.
     ///
     /// # Errors
     ///
-    /// * `TpmErrorKind::ParseCapacity` if the object contains a value that cannot be built.
-    /// * `TpmErrorKind::BuildOverflow` if the writer runs out of space.
+    /// * `TpmErrorKind::BuildCapacity` if the object contains a value exceeding capacity limit.
+    /// * `TpmErrorKind::BuildOverflow` if writer would run out of space.
     fn build_parameters(&self, writer: &mut TpmWriter) -> TpmResult<()>;
 }
 
diff --git a/tests/runner.rs b/tests/runner.rs
index bbbca08..45140e7 100644
--- a/tests/runner.rs
+++ b/tests/runner.rs
@@ -17,8 +17,8 @@ use tpm2_protocol::{
         TpmCc, TpmRc, TpmRcBase, TpmRcIndex, TpmRh, TpmSe, TpmSt, TpmaObject, TpmaSession,
         TpmlDigest, TpmlDigestValues, TpmlPcrSelection, TpmsAuthCommand, TpmsAuthResponse,
         TpmsClockInfo, TpmsPcrSelect, TpmsPcrSelection, TpmsRsaParms, TpmsSensitiveCreate, TpmtHa,
-        TpmtPublic, TpmtScheme, TpmtSymDef, TpmtSymDefObject, TpmuHa, TpmuPublicId, TpmuPublicParms,
-        TpmuSymKeyBits, TpmuSymMode,
+        TpmtPublic, TpmtScheme, TpmtSymDef, TpmtSymDefObject, TpmuHa, TpmuPublicId,
+        TpmuPublicParms, TpmuSymKeyBits, TpmuSymMode,
     },
     message::{
         tpm_build_command, tpm_build_response, tpm_parse_command, tpm_parse_response,
@@ -158,7 +158,6 @@ fn bytes_to_hex(bytes: &[u8]) -> String {
     bytes.iter().map(|b| format!("{b:02x}")).collect()
 }
 
-
 fn test_command_build_create_primary() {
     let cmd = TpmCreatePrimaryCommand {
         primary_handle: (TpmRh::Owner as u32).into(),
-- 
2.39.5

