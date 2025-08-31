Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBF91E0DD8;
	Sun, 31 Aug 2025 16:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756657795; cv=none; b=qhCODAb/EWvAkftLGbSH0Xsw8XVYSbGzz1z0Z3gWFQ/qpXXM1RGtwlCf66vRpUtKD0bmHGlaV1d8zpdpiSjmdw+JUilwBP/7r79NHihinVnFgHXsUuIo1tC9Pxpe8USSeJsp0ucgwOzgvh+kkWIqX8PIPTK5k5unX9QpujCnZgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756657795; c=relaxed/simple;
	bh=McONvu4K30nhOueTZb97dAQsom0MJYkYZf4XlzSStR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y61Wp07LDjtkCKwA9X6hDlQ43i1osjA9WqlRxNjKZYC+WxBSj8MXirkafrZ5LDT2tElw4tiZsITRZ5CPANXlBgoF1uyVkDZ4Rv8y9tLy9JItmudHbZKKu9zzdpscOXNFtaxkSv+5cKhxWIXi1C0LPQRctSUs67BXAEQddXlFtYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMr+qDVo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMr+qDVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC0DC4CEED;
	Sun, 31 Aug 2025 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756657795;
	bh=McONvu4K30nhOueTZb97dAQsom0MJYkYZf4XlzSStR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMr+qDVo4iBxOfMhpGgYFRFiLP5jqStXGHmfxoM6P29Sb4ghEe8JIYTJG6l8FrDO4
	 /T0IVKqPOY3pBNgxVrWebxSzyAqgK4yGdqk+vQBNOXj8ipQGsaDbKDBZ2xJ0YDyW+P
	 +p0llQe4HXuh7wstUQmI5eEY3AdK7yrI2UL5HpnlvZH6gITsE8l3DB+ULh2h5iJxXT
	 PEN8QOJC8UPS0txRD32S7ChGp+7/+jl+PiUcSxaFXQ16C1Dg6U+zrXyzsa1KiLhqYP
	 rlx/4vdiJ4Nh373aRh/Y2Uj2+KlBc+Xx20UPhHk0TW6uMjC4ApM4Nn5Vk70rQfzJ9n
	 Kos+ot1hUFRAw==
Date: Sun, 31 Aug 2025 19:29:51 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev
Cc: tpm2@lists.linux.dev
Subject: Re: [PATCH] refactor!(message): decouple TpmHeader from the build
 trait
Message-ID: <aLR4f8oHe4h-M7aw@kernel.org>
References: <20250831162528.482704-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831162528.482704-1-jarkko@kernel.org>

On Sun, Aug 31, 2025 at 07:25:28PM +0300, Jarkko Sakkinen wrote:
> In order to make the command build trait more symmetrical with the parse
> trait, decouple `TpmHeader` from the trait. Rename the trait as
> `TpmCommandBuild`.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
> I think I'll backport this too to the 0.10.x as it by pracical means
> does not affect the consumed API and user volumes are still low.
>  src/macro/struct.rs  | 6 +++---
>  src/message/build.rs | 4 ++--
>  src/message/mod.rs   | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/src/macro/struct.rs b/src/macro/struct.rs
> index 01e2cfb..ad5303f 100644
> --- a/src/macro/struct.rs
> +++ b/src/macro/struct.rs
> @@ -36,12 +36,12 @@ macro_rules! tpm_struct {
>          impl $crate::TpmBuild for $name {
>              #[allow(unused_variables)]
>              fn build(&self, writer: &mut $crate::TpmWriter) -> $crate::TpmResult<()> {
> -                <Self as $crate::message::TpmHeaderCommand>::build_handles(self, writer)?;
> -                <Self as $crate::message::TpmHeaderCommand>::build_parameters(self, writer)
> +                <Self as $crate::message::TpmCommandBuild>::build_handles(self, writer)?;
> +                <Self as $crate::message::TpmCommandBuild>::build_parameters(self, writer)
>              }
>          }
>  
> -        impl $crate::message::TpmHeaderCommand for $name {
> +        impl $crate::message::TpmCommandBuild for $name {
>              #[allow(unused_variables)]
>              fn build_handles(&self, writer: &mut $crate::TpmWriter) -> $crate::TpmResult<()> {
>                  $($crate::TpmBuild::build(&self.$handle_field, writer)?;)*
> diff --git a/src/message/build.rs b/src/message/build.rs
> index 4170513..41a7fee 100644
> --- a/src/message/build.rs
> +++ b/src/message/build.rs
> @@ -4,7 +4,7 @@
>  
>  use crate::{
>      data::{TpmRc, TpmSt, TpmsAuthCommand, TpmsAuthResponse},
> -    message::{TpmHeader, TpmHeaderCommand, TPM_HEADER_SIZE},
> +    message::{TpmCommandBuild, TpmHeader, TPM_HEADER_SIZE},
>      TpmBuild, TpmErrorKind, TpmResult, TpmSized,
>  };
>  use core::mem::size_of;
> @@ -21,7 +21,7 @@ pub fn tpm_build_command<C>(
>      writer: &mut crate::TpmWriter,
>  ) -> TpmResult<()>
>  where
> -    C: TpmHeaderCommand,
> +    C: TpmHeader + TpmCommandBuild,
>  {
>      match tag {
>          TpmSt::NoSessions => {
> diff --git a/src/message/mod.rs b/src/message/mod.rs
> index eb0d3f0..2d02361 100644
> --- a/src/message/mod.rs
> +++ b/src/message/mod.rs
> @@ -60,7 +60,7 @@ pub trait TpmHeader: TpmBuild + Debug {
>  }
>  
>  /// A trait for building command bodies in separate handle and parameter sections.
> -pub trait TpmHeaderCommand: TpmHeader {
> +pub trait TpmCommandBuild {
>      /// Builds the handle area of the command.
>      ///
>      /// # Errors
> -- 
> 2.39.5
> 

This also applied (last remaiming low-hanging fruit item in my backlog).
It was also backported to 0.10.x given low incompatibility risk factor.

Where main branch API wise now diverges is TpmRc (i.e. no longer is
wrapped into a result structure).

BR, Jarkko
