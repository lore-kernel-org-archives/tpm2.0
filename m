Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7F2146D60
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715863910; cv=none; b=MoFqjWbeVUwscjxclX111pRaEMZtQHzLB3KRm95TOsOlmsoi8XcI9CDRq+KqwSmAEpO+5EziQ53LU0R00mJgV/8Dqwoj2JL+61gycqbSObT8EdokUc2do/r+jneXUskpu6LAX/0nJMWJraEjq9q8LXt1+uuxYRivsWun39AHhBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715863910; c=relaxed/simple;
	bh=L56ijGf+z21PrGaIfu1RlPydlwd96m0gTCrmBC+br8Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MblR95Ur2AFexi9ba/EBEdghIu6dgEGxFKQGRUVAorj9iHsCQef7ymAl11miJBefPgTdQ3o0xuUFFumSKlMWJ3xRa0Tdw5kWsGWYJITpveXBKggzaL3dCDVlJ67NkVQm/Wzep/SDPA5Ptyg3kNnMlQ4actMfcMuQm1KQocYvI2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NK/ySINx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NK/ySINx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D15FC4AF08;
	Thu, 16 May 2024 12:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715863910;
	bh=L56ijGf+z21PrGaIfu1RlPydlwd96m0gTCrmBC+br8Y=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=NK/ySINxYUBgXmxsRRk+ky4FgmQEm75IBswqD6BzflfoduMaenXshpni9I8GFzNJi
	 RF3fpKWgpHYU/doKXRqeAR3kKdlG65CiBHF1mW1IpGYn3llyJNGDwGDiH3M/o4Tq6z
	 sdeFkE3LP1VR2P+12fxgzk6xmShz1+TtudVKhVjgb1r3ObKcXT0DqnCFyyVhNR6yKq
	 2VuU16U13YgyoyQPEyImouMhASKfRNScSNtL+EmikFN0FDk/oQQ5glGuVgKg78hLWe
	 RnEmfkjtI8jVle4K3sim1xbD+g9X5NezNrtMruejRwCryCcm4jdHaGQc28R7+Ja4cG
	 2vVyQrih5okdQ==
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 May 2024 15:51:47 +0300
Message-Id: <D1B2ZP29BA7Y.3OYCZMEP3MLGY@kernel.org>
Cc: "James Prestwood" <prestwoj@gmail.com>
Subject: Re: TPM2_Sign vs TPM2_RSA_Decrypt
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <Andreas.Fuchs@infineon.com>, <tpm2@lists.linux.dev>
X-Mailer: aerc 0.17.0
References: <D1AZVM0QQF2M.1SZHF66G10XK8@kernel.org>
 <c8c85a062358420ab13e849a902606cd@infineon.com>
In-Reply-To: <c8c85a062358420ab13e849a902606cd@infineon.com>

On Thu May 16, 2024 at 3:01 PM EEST,  wrote:
> For the OpenSSL engines and also the GNU-TLS engine, we go ahead and
> use TPM2_RSA_Decrypt for RSA Signing but TPM2_Sign for ECDSA signing.

Yeah we get simplest and most understandable and most compatible
RSA because it is textbook style with no strings attached :-)
You can fit it to any scheme.

I can admit after reading TPM2_Sign documentation, my head hurts
and I still don't think I fully get the gist of it so better not
to use something that you don't get, right? :-)

If someone could really put TPM2_Sign into nutshell that'd be
awesome.

> The reason here was, that OpenSSL wants to perform SHA512 digests and
> padding, whilst the TPM only supported SHA384. And an OpenSSL engine
> could not tell the OpenSSL-TLS-module, which Hash-Algs are supported.
> If that restriction does not exist, I would also tend to use TPM2_Sign
> for RSA signing.

Maybe a dumb question but what I could possibly accomplish with
TPM2_Sign that I could not accomplish with TPM2_RSA_Decrypt and
appropraite ASN.1 heading and padding?

This connects to the not understanding TPM2_Sign (obviously).

Just trying to make sure that we make exactly right call for
kernel.

Thanks for responding!

>
> Cheers,
> Andreas

BR, Jarkko
