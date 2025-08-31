Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBC6264A77;
	Sun, 31 Aug 2025 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756645977; cv=none; b=uVIL5FtGgY8uhwm966759mMVDXzoZ/hF5tG+Qrq2v4OPEaGD1mcDn+CMJRYCMWQ/T41I3J4KHYpCRPB8Ksq5Z6QVctZbd2OjvpKhaikCmUKY6Opi1KxBpCt37fzToQJRhZlV081PXp3JL93g8BCsCvzxgdyGQTC8+4vluF+HwmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756645977; c=relaxed/simple;
	bh=B8bzSL6mSHOM6D09rQ02XB0DscS8yl7fIV82BTItaTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Npdi8ZWjA9v01ZLafcumWsJuQnleJEEgji/M3drgkY4oFatfio+jAFvQjIUk1Gd3m2UT16dY+qlTg1GRIjZGlQiul6WsTkMHoq8xKYKQ+iRutcCcms9exmWOgv9FlGy8TVqAB4lFFGdtZ9NX1UTlKFqcSH/+SUrJwiNa2gXfGDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5SvYIac; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5SvYIac"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF278C4CEF6;
	Sun, 31 Aug 2025 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756645977;
	bh=B8bzSL6mSHOM6D09rQ02XB0DscS8yl7fIV82BTItaTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n5SvYIac4AV8NLbQ1Bwh4div8eVs3tM2MwSZ59BCMOrb/eJzDAgRDp6h6xG6AXsKr
	 4tX83H4IcWglck4ZSTSdgbvWLaGzkV3rE7yQNj3USK/bhAo7w9s2aKmkSZ9uTTe9rJ
	 jmaxdoUvQC3wuPe658rnAuLASpqlWxGY2TE5nviFtuBajHUOpFeQQPy0wdeJ3SjpsI
	 8OOIdk93ntRnTiPdjzB49jjEGHeXsUIxU4z15AeHfe63YdVnZzzG1Qg6omERU/Qki7
	 mCY6Zc4Q/pqMipxID9B3IHHcTflCS9xq6E/E7v188DBn7ege22vgh6QhTBjQdNpmOW
	 9L2ilKyVYWRZQ==
Date: Sun, 31 Aug 2025 16:12:53 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev
Cc: tpm2@lists.linux.dev
Subject: Re: [PATCH] refactor!(TpmRc): remove unnecessary Result wrapper
Message-ID: <aLRKVZDcT6eUTNdd@kernel.org>
References: <20250831095444.54784-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831095444.54784-1-jarkko@kernel.org>

On Sun, Aug 31, 2025 at 12:54:44PM +0300, Jarkko Sakkinen wrote:
> `Result` wrapper in the return value of `TpmRc::base()` exists only to
> retain API backwards compatibility in 0.10.x branch. Remove the wrapper
> in the main branch.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

This was easy test patch to check that everything is working. I'll apply
it to the main branch without further ado.

> ---
>  src/data/tpm_rc.rs | 20 +++++++-------------
>  tests/runner.rs    |  2 +-
>  2 files changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/src/data/tpm_rc.rs b/src/data/tpm_rc.rs
> index c7fa71a..fa8756f 100644
> --- a/src/data/tpm_rc.rs
> +++ b/src/data/tpm_rc.rs
> @@ -165,12 +165,9 @@ pub struct TpmRc {
>  impl TpmRc {
>      /// Returns the base error code, with handle, parameter, or session index
>      /// stripped out.
> -    ///
> -    /// # Errors
> -    ///
> -    /// This method returns a `Result` in order to retain API compatibility.
> -    pub fn base(self) -> Result<TpmRcBase, TpmErrorKind> {
> -        Ok(self.base)
> +    #[must_use]
> +    pub fn base(self) -> TpmRcBase {
> +        self.base
>      }
>  
>      #[must_use]
> @@ -250,14 +247,11 @@ impl From<TpmRcBase> for TpmRc {
>  
>  impl Display for TpmRc {
>      fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
> -        if let Ok(base) = self.base() {
> -            if let Some(index) = self.index() {
> -                write!(f, "[{base}, {index}]")
> -            } else {
> -                write!(f, "{base}")
> -            }
> +        let base = self.base();
> +        if let Some(index) = self.index() {
> +            write!(f, "[{base}, {index}]")
>          } else {
> -            write!(f, "TPM_RC_UNKNOWN(0x{:08X})", self.value())
> +            write!(f, "{base}")
>          }
>      }
>  }
> diff --git a/tests/runner.rs b/tests/runner.rs
> index 83fc209..218d813 100644
> --- a/tests/runner.rs
> +++ b/tests/runner.rs
> @@ -239,7 +239,7 @@ fn test_tpm_rc_base_from_raw() {
>  
>      for (description, raw_rc, expected_base) in cases {
>          let rc = TpmRc::try_from(raw_rc).unwrap();
> -        assert_eq!(rc.base(), Ok(expected_base), "{description}");
> +        assert_eq!(rc.base(), expected_base, "{description}");
>      }
>  }
>  
> -- 
> 2.39.5
> 

BR, Jarkko
