Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A32581;
	Sun, 31 Aug 2025 16:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756657539; cv=none; b=nPtPU4uQrs2rAWPtIWMTBH3AJjcmq9iPdh8KOTAAhqJTZcg106dBXiOD+gDe0ZLhX5bgVKFiZlIy0hYliWZZH8qM2J3XdUyJFs4ESwpkPhKl6+m8lIXPjqNw6fgdpwyL6TYuQ+Ssdbdlek2jUK1urI9nZwojmuz5HZXBkRi4iBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756657539; c=relaxed/simple;
	bh=hd9UjlMkGCe+7B56pwtzZWCSmupnCfU1SdBeD1mmeAU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gKwk9O8a4Jb3seYAuE9pTkZFsNnmTnE9AHX/wO0At/+3KmpJJz+lLsgezxaTizy2fus6M2MipgZMPoWlVK0yqrfwQyyllUsVMwEUOxFxQBMR2678NZSwr4xcBAWo43SZz85+JFRQM+zA6VmKWmuoTVfcH0sp/y5aHUslzqGohVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlW1rF1P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlW1rF1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF946C4CEED;
	Sun, 31 Aug 2025 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756657538;
	bh=hd9UjlMkGCe+7B56pwtzZWCSmupnCfU1SdBeD1mmeAU=;
	h=From:To:Cc:Subject:Date:From;
	b=dlW1rF1P7kNaeHR0M6aRF4wXGiv8Ljbr3gqWMQjpRa0RNWAu/ccpmnqCklWuXCzj0
	 +L7YOM1s3OSC/fc0tRCvkmlHwS7NnkoBxxXiG/luqnzXXjjNbZnrEZv6OgKq7zmhbr
	 Yxhk/LcxRFeqK0ZlkYkcFGUH1u48meuAaVT2ilop7taAE5QQBSK7nYxauJBTQc+IDJ
	 BVQ7hpF8Fhs+uiMbZEO7IC/sgbt/K2xWt3ZFAgZW4Je440nM0QwsQBZ152ytOqb+U3
	 u61CEGglf2jNM7ckGat6/EuRxPHYxywbWQF8F9PhF2sao4XLDvFSocCc/USOL6A7a+
	 1PosGILfb9mtg==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev
Cc: tpm2@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH] refactor!(message): decouple TpmHeader from the build trait
Date: Sun, 31 Aug 2025 19:25:28 +0300
Message-Id: <20250831162528.482704-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to make the command build trait more symmetrical with the parse
trait, decouple `TpmHeader` from the trait. Rename the trait as
`TpmCommandBuild`.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
I think I'll backport this too to the 0.10.x as it by pracical means
does not affect the consumed API and user volumes are still low.
 src/macro/struct.rs  | 6 +++---
 src/message/build.rs | 4 ++--
 src/message/mod.rs   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/macro/struct.rs b/src/macro/struct.rs
index 01e2cfb..ad5303f 100644
--- a/src/macro/struct.rs
+++ b/src/macro/struct.rs
@@ -36,12 +36,12 @@ macro_rules! tpm_struct {
         impl $crate::TpmBuild for $name {
             #[allow(unused_variables)]
             fn build(&self, writer: &mut $crate::TpmWriter) -> $crate::TpmResult<()> {
-                <Self as $crate::message::TpmHeaderCommand>::build_handles(self, writer)?;
-                <Self as $crate::message::TpmHeaderCommand>::build_parameters(self, writer)
+                <Self as $crate::message::TpmCommandBuild>::build_handles(self, writer)?;
+                <Self as $crate::message::TpmCommandBuild>::build_parameters(self, writer)
             }
         }
 
-        impl $crate::message::TpmHeaderCommand for $name {
+        impl $crate::message::TpmCommandBuild for $name {
             #[allow(unused_variables)]
             fn build_handles(&self, writer: &mut $crate::TpmWriter) -> $crate::TpmResult<()> {
                 $($crate::TpmBuild::build(&self.$handle_field, writer)?;)*
diff --git a/src/message/build.rs b/src/message/build.rs
index 4170513..41a7fee 100644
--- a/src/message/build.rs
+++ b/src/message/build.rs
@@ -4,7 +4,7 @@
 
 use crate::{
     data::{TpmRc, TpmSt, TpmsAuthCommand, TpmsAuthResponse},
-    message::{TpmHeader, TpmHeaderCommand, TPM_HEADER_SIZE},
+    message::{TpmCommandBuild, TpmHeader, TPM_HEADER_SIZE},
     TpmBuild, TpmErrorKind, TpmResult, TpmSized,
 };
 use core::mem::size_of;
@@ -21,7 +21,7 @@ pub fn tpm_build_command<C>(
     writer: &mut crate::TpmWriter,
 ) -> TpmResult<()>
 where
-    C: TpmHeaderCommand,
+    C: TpmHeader + TpmCommandBuild,
 {
     match tag {
         TpmSt::NoSessions => {
diff --git a/src/message/mod.rs b/src/message/mod.rs
index eb0d3f0..2d02361 100644
--- a/src/message/mod.rs
+++ b/src/message/mod.rs
@@ -60,7 +60,7 @@ pub trait TpmHeader: TpmBuild + Debug {
 }
 
 /// A trait for building command bodies in separate handle and parameter sections.
-pub trait TpmHeaderCommand: TpmHeader {
+pub trait TpmCommandBuild {
     /// Builds the handle area of the command.
     ///
     /// # Errors
-- 
2.39.5

