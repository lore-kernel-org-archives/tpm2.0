Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF2C338F22;
	Tue,  2 Sep 2025 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756832102; cv=none; b=mJ2DMYhIpFwcWztsf/30eF6w6ncITIm+CnPQ5r3oa4fB7own9udZI5j8jq+WYJu4Wl+tFbXjubLZIjZmlt0rRBCumUL1sF0b/ee3+dwurA9GeU6PYqTurPRo6mORy4a/eljLdkNtVvuCA/2WxD9VXMFJ7PqbEHLRekvWg6/Ex5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756832102; c=relaxed/simple;
	bh=mmiUZLpaehFmyusfDkTfoJO4r4RZLCELYZSsXAp0Mwg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QCpLo7kKIhMe0lDdNrF4PgLzU8j+3LyZhBPGHhBbM+8IJ1PWnev6GKm40zfb4n0N4b8Pkrvosu37fkeMUqEnhqOJd8Y+4zlUo0vz6bLtB/JofAG5FFefwxED5nw1MvYWiz7UsS5TQ8b3WWHLl3n2/+u0ZDwHIrRm0pryfMsVvrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oj1wJlkq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oj1wJlkq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69F3C4CEED;
	Tue,  2 Sep 2025 16:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756832102;
	bh=mmiUZLpaehFmyusfDkTfoJO4r4RZLCELYZSsXAp0Mwg=;
	h=From:To:Cc:Subject:Date:From;
	b=oj1wJlkqXQFa9jRWI7c48fn+Xn3K6RAeucxcR8PVmUNo7SRy5fFXUONwMjKWOhugN
	 3kTN8xbmkRa8LW6e6xWy1mniA6HMKBb5ffqiBuUe+Yie/YFxaSa8Pg5g36obtubhz2
	 DzdnnCOgd3N03qc3Ma3NU9KDSXhFGrkfjXhKy98X3Q68ajwnbZhZaaz6D89Azf+Kub
	 h70k+C+DL3AuU1PQWGkHDj0JR+25JD8jhwve4YqljmTHxoA0/O45rzPICxCCug0aev
	 wEOB9CyGh6FjUzVAIhf7VBfk0MFRapl+LPtQrtsPvsXe2QnkbsoYfRlStvS8/i6bLk
	 wNfTQrh7JHYgw==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev
Cc: tpm2@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH] fix(macro): interpret responses dynamically
Date: Tue,  2 Sep 2025 19:54:55 +0300
Message-Id: <20250902165455.3680143-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's the failing case:

8001000000300000000002000000002000647915de6106c955b26456b8b8a3b10546fa446405d4eb2e1fb0247fb52080

What happens is that `tpm_parse_response`  returns `ParserUnderflow`, and
parsing fails (gracefully).

The root cause is incorrect interpretation of commands being applicable
both with and without sessions. In the failing case the response is
captured from a run of `tpm2sh start-session`.

It has hard to define the failing commit since this project barely has
kicked off, and the recent history is encompassed of major overhauls in
order to get where it is right now but most likely the failure was caused
by when refactoring away from having `tpm_response!` in favor of universal
`tpm_struct!`.

I highlight the parts of the diff that are relevant for addressing the
issue:

First an analogous trait to `TpmCommandBodyParse` is defined for delivering
the "discovered" tag in the different layers of the response parser:

pub(crate) trait TpmResponseBodyParse: Sized {
    /// Parses the response body from a buffer, using the response tag to determine
    /// the structure.
    fn parse_body(tag: data::TpmSt, buf: &[u8]) -> TpmResult<(Self, &[u8])>;
}

Then the trait call is patched to `tpm_dispatch!`:

-                    |buf| {
-                        <$rsp_ty>::parse(buf)
+                    |tag, buf| {
+                        <$rsp_ty as $crate::message::TpmResponseBodyParse>::parse_body(tag, buf)

The dispatcher generated is orchestrated from the "entry function" i.e,
`tpm_parse_response`, so that's where the tag is originally supplied
after doing a binary search to `PARSE_RESPONSE_MAP`:

-    let (body, mut session_area) = (dispatch.2)(body_buf)?;
+    let (body, mut session_area) = (dispatch.2)(tag, body_buf)?;

Finally, `tpm_struct!` is mirgated to provide the trait implementation:

-            fn parse(buf: &[u8]) -> $crate::TpmResult<(Self, &[u8])> {
+            fn parse_body(
+                tag: $crate::data::TpmSt,
+                buf: &[u8],

And that's how tag is delivered to the new response body parser for
implementing the actual upgraded logic:

-                if $with_sessions {
-                    let (size, buf_after_size) = u32::parse(cursor)?;
+                if $with_sessions && tag == $crate::data::TpmSt::Sessions {

This fixes the bug and as is proven against the failing case by
`test_response_start_auth_session_no_sessions_2`.

However, this revealed a "symmetrical bug" in tpm_build_response()
leading to a failure in the final comparison of the test case.

This led to the new `TpmResponseBodyBuild`, which matches the logic
with already pre-existing `TpmCommandBodyBuild`, and fixes essentially
`fn len()`.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
Took a quite many days to identify this, scope it into a test case,
analyze it, and fixing. Given how the fix in the end reflects the
overall architecture I'm now confident that this is right.

Thus, immediate merge, it's a show stopper bug.

I also cc'd this tpm2 as it's pretty good in describing some core
ideas of this new TPM2 crate.
 src/macro/mod.rs     |   6 +--
 src/macro/struct.rs  |  50 +++++++++++----------
 src/message/build.rs |  27 ++++++++---
 src/message/mod.rs   |  33 +++++++++++++-
 src/message/parse.rs |   2 +-
 tests/runner.rs      | 104 ++++++++++++++++++-------------------------
 6 files changed, 128 insertions(+), 94 deletions(-)

diff --git a/src/macro/mod.rs b/src/macro/mod.rs
index 2070b62..20c1603 100644
--- a/src/macro/mod.rs
+++ b/src/macro/mod.rs
@@ -163,8 +163,8 @@ macro_rules! tpm_dispatch {
                 (
                     <$rsp_ty as $crate::message::TpmHeader>::COMMAND,
                     <$rsp_ty as $crate::message::TpmHeader>::WITH_SESSIONS,
-                    |buf| {
-                        <$rsp_ty>::parse(buf)
+                    |tag, buf| {
+                        <$rsp_ty as $crate::message::TpmResponseBodyParse>::parse_body(tag, buf)
                             .map(|(r, rest)| (TpmResponseBody::$enum_variant(r), rest))
                     },
                 )
@@ -204,7 +204,7 @@ macro_rules! tpm_dispatch {
         }
 
         pub type TpmCommandParser = for<'a> fn(&'a [u8], &'a [u8]) -> $crate::TpmResult<(TpmCommandBody, &'a [u8])>;
-        pub type TpmResponseParser = for<'a> fn(&'a [u8]) -> $crate::TpmResult<(TpmResponseBody, &'a [u8])>;
+        pub type TpmResponseParser = for<'a> fn($crate::data::TpmSt, &'a [u8]) -> $crate::TpmResult<(TpmResponseBody, &'a [u8])>;
 
         pub(crate) static PARSE_COMMAND_MAP: &[($crate::data::TpmCc, bool, bool, usize, TpmCommandParser)] =
             &[$(tpm_command_parser!($cmd, $variant),)*];
diff --git a/src/macro/struct.rs b/src/macro/struct.rs
index ad5303f..fce841d 100644
--- a/src/macro/struct.rs
+++ b/src/macro/struct.rs
@@ -117,45 +117,47 @@ macro_rules! tpm_struct {
             $(pub $param_field: $param_type,)*
         }
 
+        impl $crate::message::TpmResponseBuild for $name {
+            #[allow(unused_variables)]
+            fn build_handles(&self, writer: &mut $crate::TpmWriter) -> $crate::TpmResult<()> {
+                $($crate::TpmBuild::build(&self.$handle_field, writer)?;)*
+                Ok(())
+            }
+            #[allow(unused_variables)]
+            fn build_parameters(&self, writer: &mut $crate::TpmWriter) -> $crate::TpmResult<()> {
+                $($crate::TpmBuild::build(&self.$param_field, writer)?;)*
+                Ok(())
+            }
+        }
+
         impl $crate::TpmSized for $name {
             const SIZE: usize = 0 $(+ <$handle_type>::SIZE)* $(+ <$param_type>::SIZE)*;
             fn len(&self) -> usize {
-                let params_len: usize = 0 $(+ $crate::TpmSized::len(&self.$param_field))*;
-                let handles_len: usize = 0 $(+ $crate::TpmSized::len(&self.$handle_field))*;
-                let parameter_area_size_field_len: usize = if $with_sessions {
-                    core::mem::size_of::<u32>()
-                } else {
-                    0
-                };
-                handles_len + parameter_area_size_field_len + params_len
+                0 $(+ $crate::TpmSized::len(&self.$handle_field))* $(+ $crate::TpmSized::len(&self.$param_field))*
             }
         }
 
         impl $crate::TpmBuild for $name {
             fn build(&self, writer: &mut $crate::TpmWriter) -> $crate::TpmResult<()> {
-                let params_len: usize = 0 $(+ $crate::TpmSized::len(&self.$param_field))*;
-                $($crate::TpmBuild::build(&self.$handle_field, writer)?;)*
-                if $with_sessions {
-                    let params_len_u32 = u32::try_from(params_len)
-                        .map_err(|_| $crate::TpmErrorKind::BuildCapacity)?;
-                    $crate::TpmBuild::build(&params_len_u32, writer)?;
-                }
-                $($crate::TpmBuild::build(&self.$param_field, writer)?;)*
-                Ok(())
+                <Self as $crate::message::TpmResponseBuild>::build_handles(self, writer)?;
+                <Self as $crate::message::TpmResponseBuild>::build_parameters(self, writer)
             }
         }
 
-        impl $crate::TpmParse for $name {
+        impl $crate::message::TpmResponseBodyParse for $name {
             #[allow(unused_mut)]
-            fn parse(buf: &[u8]) -> $crate::TpmResult<(Self, &[u8])> {
+            fn parse_body(
+                tag: $crate::data::TpmSt,
+                buf: &[u8],
+            ) -> $crate::TpmResult<(Self, &[u8])> {
                 let mut cursor = buf;
                 $(
-                    let ($handle_field, tail) = <$handle_type>::parse(cursor)?;
+                    let ($handle_field, tail) = <$handle_type as $crate::TpmParse>::parse(cursor)?;
                     cursor = tail;
                 )*
 
-                if $with_sessions {
-                    let (size, buf_after_size) = u32::parse(cursor)?;
+                if $with_sessions && tag == $crate::data::TpmSt::Sessions {
+                    let (size, buf_after_size) = <u32 as $crate::TpmParse>::parse(cursor)?;
                     let size = size as usize;
                     if buf_after_size.len() < size {
                         return Err($crate::TpmErrorKind::ParseUnderflow);
@@ -163,7 +165,7 @@ macro_rules! tpm_struct {
                     let (mut params_cursor, final_tail) = buf_after_size.split_at(size);
 
                     $(
-                        let ($param_field, tail) = <$param_type>::parse(params_cursor)?;
+                        let ($param_field, tail) = <$param_type as $crate::TpmParse>::parse(params_cursor)?;
                         params_cursor = tail;
                     )*
 
@@ -181,7 +183,7 @@ macro_rules! tpm_struct {
                 } else {
                     let mut params_cursor = cursor;
                     $(
-                        let ($param_field, tail) = <$param_type>::parse(params_cursor)?;
+                        let ($param_field, tail) = <$param_type as $crate::TpmParse>::parse(params_cursor)?;
                         params_cursor = tail;
                     )*
 
diff --git a/src/message/build.rs b/src/message/build.rs
index 4a48228..2ee88b8 100644
--- a/src/message/build.rs
+++ b/src/message/build.rs
@@ -4,7 +4,7 @@
 
 use crate::{
     data::{TpmRc, TpmSt, TpmsAuthCommand, TpmsAuthResponse},
-    message::{TpmCommandBuild, TpmHeader, TPM_HEADER_SIZE},
+    message::{TpmCommandBuild, TpmHeader, TpmResponseBuild, TPM_HEADER_SIZE},
     TpmBuild, TpmErrorKind, TpmResult, TpmSized,
 };
 use core::mem::size_of;
@@ -90,7 +90,7 @@ pub fn tpm_build_response<R>(
     writer: &mut crate::TpmWriter,
 ) -> TpmResult<()>
 where
-    R: TpmHeader,
+    R: TpmHeader + TpmResponseBuild,
 {
     let tag = if !rc.is_error() && R::WITH_SESSIONS && !sessions.is_empty() {
         TpmSt::Sessions
@@ -105,9 +105,18 @@ where
         return Ok(());
     }
 
-    let body_len = response.len();
+    let handle_area_size = R::HANDLES * size_of::<u32>();
+    let param_area_size = response.len() - handle_area_size;
     let sessions_len: usize = sessions.iter().map(TpmSized::len).sum();
-    let total_body_len = body_len + sessions_len;
+
+    let parameter_area_size_field_len = if tag == TpmSt::Sessions {
+        size_of::<u32>()
+    } else {
+        0
+    };
+
+    let total_body_len =
+        handle_area_size + parameter_area_size_field_len + param_area_size + sessions_len;
     let response_size =
         u32::try_from(TPM_HEADER_SIZE + total_body_len).map_err(|_| TpmErrorKind::BuildCapacity)?;
 
@@ -115,7 +124,15 @@ where
     response_size.build(writer)?;
     rc.value().build(writer)?;
 
-    response.build(writer)?;
+    response.build_handles(writer)?;
+
+    if tag == TpmSt::Sessions {
+        let params_len_u32 =
+            u32::try_from(param_area_size).map_err(|_| TpmErrorKind::BuildCapacity)?;
+        params_len_u32.build(writer)?;
+    }
+
+    response.build_parameters(writer)?;
 
     if tag == TpmSt::Sessions {
         for s in sessions {
diff --git a/src/message/mod.rs b/src/message/mod.rs
index 99bb91b..18ad8c8 100644
--- a/src/message/mod.rs
+++ b/src/message/mod.rs
@@ -2,7 +2,7 @@
 // Copyright (c) 2025 Opinsys Oy
 // Copyright (c) 2024-2025 Jarkko Sakkinen
 
-use crate::{data, tpm_dispatch, TpmBuild, TpmList, TpmParse, TpmResult, TpmWriter};
+use crate::{data, tpm_dispatch, TpmBuild, TpmList, TpmResult, TpmWriter};
 use core::fmt::Debug;
 
 mod asymmetric;
@@ -77,6 +77,24 @@ pub trait TpmCommandBuild {
     fn build_parameters(&self, writer: &mut TpmWriter) -> TpmResult<()>;
 }
 
+/// A trait for building response bodies in separate handle and parameter sections.
+pub trait TpmResponseBuild {
+    /// Builds the handle area of the response.
+    ///
+    /// # Errors
+    ///
+    /// * `TpmErrorKind::BuildOverflow` if writer would run out of space.
+    fn build_handles(&self, writer: &mut TpmWriter) -> TpmResult<()>;
+
+    /// Builds the parameter area of the response.
+    ///
+    /// # Errors
+    ///
+    /// * `TpmErrorKind::BuildCapacity` if the object contains a value exceeding capacity limit.
+    /// * `TpmErrorKind::BuildOverflow` if writer would run out of space.
+    fn build_parameters(&self, writer: &mut TpmWriter) -> TpmResult<()>;
+}
+
 /// Parses a command body from the slices point out to the handle area and
 /// parameter area of the original buffer.
 pub(crate) trait TpmCommandBodyParse: Sized {
@@ -89,6 +107,19 @@ pub(crate) trait TpmCommandBodyParse: Sized {
     fn parse_body<'a>(handles: &'a [u8], params: &'a [u8]) -> TpmResult<(Self, &'a [u8])>;
 }
 
+/// Parses a response body using the response tag to handle structural variations.
+pub trait TpmResponseBodyParse: Sized {
+    /// Parses the response body from a buffer, using the response tag dynamically
+    /// to determine the structure.
+    ///
+    /// # Errors
+    ///
+    /// This method can return parsing errors such as:
+    /// * `TpmErrorKind::ParseUnderflow` if the buffer is too small.
+    /// * `TpmErrorKind::TrailingData` if the buffer has unconsumed data after parsing.
+    fn parse_body(tag: data::TpmSt, buf: &[u8]) -> TpmResult<(Self, &[u8])>;
+}
+
 pub const TPM_HEADER_SIZE: usize = 10;
 
 tpm_dispatch! {
diff --git a/src/message/parse.rs b/src/message/parse.rs
index f55d7a8..50c2fb1 100644
--- a/src/message/parse.rs
+++ b/src/message/parse.rs
@@ -151,7 +151,7 @@ pub fn tpm_parse_response(cc: TpmCc, buf: &[u8]) -> TpmResult<TpmParseResult<'_>
             )
         })?;
 
-    let (body, mut session_area) = (dispatch.2)(body_buf)?;
+    let (body, mut session_area) = (dispatch.2)(tag, body_buf)?;
 
     let mut auth_responses = TpmAuthResponses::new();
     if tag == TpmSt::Sessions {
diff --git a/tests/runner.rs b/tests/runner.rs
index 3d2a1dc..5cd2882 100644
--- a/tests/runner.rs
+++ b/tests/runner.rs
@@ -6,8 +6,8 @@
 #![allow(clippy::pedantic)]
 
 use std::{
-    any::Any, collections::HashMap, convert::TryFrom, fmt::Debug, io::IsTerminal, mem::size_of,
-    string::ToString, vec::Vec,
+    any::Any, collections::HashMap, convert::TryFrom, fmt::Debug, io::IsTerminal, string::ToString,
+    vec::Vec,
 };
 use tpm2_protocol::{
     build_tpm2b,
@@ -631,28 +631,25 @@ fn test_macro_response_parse_correctness() {
     digests.try_push(digest).unwrap();
     let original_resp = TpmPcrEventResponse { digests };
 
-    let mut body_buf = [0u8; 1024];
-    let body_len = {
-        let mut writer = TpmWriter::new(&mut body_buf);
-        TpmBuild::build(&original_resp, &mut writer).unwrap();
+    let mut buf = [0u8; TPM_MAX_COMMAND_SIZE];
+    let len = {
+        let mut writer = TpmWriter::new(&mut buf);
+        tpm_build_response(
+            &original_resp,
+            &[],
+            TpmRc::from(TpmRcBase::Success),
+            &mut writer,
+        )
+        .unwrap();
         writer.len()
     };
-    let response_body_bytes = &body_buf[..body_len];
-
-    let expected_len = size_of::<u32>() + original_resp.digests.len();
-    assert_eq!(body_len, expected_len);
-    assert_eq!(
-        &response_body_bytes[0..4],
-        &u32::to_be_bytes(original_resp.digests.len() as u32)
-    );
-    assert_eq!(&response_body_bytes[4..8], &1u32.to_be_bytes());
-
-    let result = TpmPcrEventResponse::parse(response_body_bytes);
+    let response_bytes = &buf[..len];
 
-    assert!(result.is_ok(), "Parsing failed: {result:?}");
-    let (parsed_resp, tail) = result.unwrap();
+    let (_rc, body, _sessions) = tpm_parse_response(TpmCc::PcrEvent, response_bytes)
+        .unwrap()
+        .unwrap();
+    let parsed_resp = body.PcrEvent().unwrap();
     assert_eq!(parsed_resp, original_resp, "Response mismatch");
-    assert!(tail.is_empty(), "Tail data");
 }
 
 fn test_macro_response_parse_remainder() {
@@ -667,35 +664,26 @@ fn test_macro_response_parse_remainder() {
         pcr_values,
     };
 
-    let mut valid_body_bytes = Vec::new();
-    let mut writer_buf = [0u8; 1024];
+    let mut valid_full_response = [0u8; TPM_MAX_COMMAND_SIZE];
     let len = {
-        let mut writer = TpmWriter::new(&mut writer_buf);
-        TpmBuild::build(&original_body, &mut writer).unwrap();
+        let mut writer = TpmWriter::new(&mut valid_full_response);
+        tpm_build_response(
+            &original_body,
+            &[],
+            TpmRc::from(TpmRcBase::Success),
+            &mut writer,
+        )
+        .unwrap();
         writer.len()
     };
-    valid_body_bytes.extend_from_slice(&writer_buf[..len]);
 
     let trailing_data = [0xDE, 0xAD, 0xBE, 0xEF];
-    let mut malformed_body_with_trailer = valid_body_bytes;
-    malformed_body_with_trailer.extend_from_slice(&trailing_data);
-
-    let result = TpmPcrReadResponse::parse(&malformed_body_with_trailer);
-    match result {
-        Ok((parsed_body, remainder)) => {
-            assert_eq!(
-                parsed_body, original_body,
-                "Parsed body does not match original"
-            );
-            assert_eq!(
-                remainder, &trailing_data,
-                "Remainder does not match trailing data"
-            );
-        }
-        Err(e) => {
-            panic!("Parsing failed: {e:?}");
-        }
-    }
+    let mut response_with_trailer = valid_full_response[..len].to_vec();
+    response_with_trailer.extend_from_slice(&trailing_data);
+
+    // This should fail, because the size in the header does not match the buffer length.
+    let result = tpm_parse_response(TpmCc::PcrRead, &response_with_trailer);
+    assert_eq!(result, Err(TpmErrorKind::ParseUnderflow));
 }
 
 fn test_response_build_error() {
@@ -846,12 +834,13 @@ fn test_response_parse_pcr_event() {
         buf[..len].to_vec()
     };
 
-    let (rc, parsed_resp, parsed_sessions) = tpm_parse_response(TpmCc::PcrEvent, &generated_bytes)
-        .unwrap()
-        .unwrap();
+    let (rc, parsed_resp_body, parsed_sessions) =
+        tpm_parse_response(TpmCc::PcrEvent, &generated_bytes)
+            .unwrap()
+            .unwrap();
 
     assert_eq!(rc.value(), 0);
-    let resp = parsed_resp.PcrEvent().unwrap();
+    let resp = parsed_resp_body.PcrEvent().unwrap();
 
     assert_eq!(resp, original_resp);
     assert_eq!(parsed_sessions, sessions);
@@ -871,19 +860,14 @@ fn test_response_parse_policy_get_digest() {
     };
     let response_bytes = &buf[..len];
 
-    let body_buf = &response_bytes[10..];
+    let (rc, body, sessions) = tpm_parse_response(TpmCc::PolicyGetDigest, response_bytes)
+        .unwrap()
+        .unwrap();
 
-    let result = TpmPolicyGetDigestResponse::parse(body_buf);
-    assert!(result.is_ok(), "Parsing failed: {result:?}");
-    let (parsed_resp, remainder) = result.unwrap();
-    assert_eq!(
-        parsed_resp, original_resp,
-        "Parsed response does not match original"
-    );
-    assert!(
-        remainder.is_empty(),
-        "Response should have no trailing data"
-    );
+    assert_eq!(rc.value(), 0);
+    assert!(sessions.is_empty());
+    let resp = body.PolicyGetDigest().unwrap();
+    assert_eq!(resp, original_resp);
 }
 
 fn test_response_start_auth_session() {
-- 
2.39.5

