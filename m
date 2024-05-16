Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470F1474AA
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715866426; cv=none; b=WHLfpuFvYtgksUSat3P0qtbhB1V+d08nYjTREwe3UBjiMc2GZOGflfSojoHWJDPSXI2HUJa0+1B0sLuTLlqmrE/yUXMGUqNTtCR1VkIQ+cDU4ZROoRMCXpE+PsoVfpWBUknIsMl72yPkS4mEnd2mLtDOkAQen0OSa5SaLgpaypc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715866426; c=relaxed/simple;
	bh=KHLxKPrSsTAoHKu/5R0n60XAlFcYeNOSzjBFZTjTFxE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=NPY+9hjjK8MwYGjbsYdueo9q5SYcza+II/r/83WnWAfiIMc1wjIKoDHn0nsxU28k4gNqJzyetv7S7ACVxBXZiWnGeWkhThhd79Lw7JQszO5F0fBODwIWVSr88qVC/AMqrxE7+z8Uh2BsaQfwPjSFi9y3InFZ1XHUk846n6O52ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/N6wrlr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/N6wrlr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF80C113CC;
	Thu, 16 May 2024 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715866425;
	bh=KHLxKPrSsTAoHKu/5R0n60XAlFcYeNOSzjBFZTjTFxE=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=Q/N6wrlrgAzxINEjUAax/g7pTKMs28QTLTXKaEOSPz+NVZQyRwgSsDnE/GxHCCyOV
	 w8JYoVgzGYD8n6LWl6nlD+WTRUvLEFBUUHBfe2awAm9uh8jCvcfu0+zSDaU/MtGub7
	 b5gRzV82mgfQKi91ougtRiWj9B3sI/Vq+YdxGUL0qCEyKq7mrLgexzVPVVMciUriaH
	 F3sMlhqWvIhxomL2t9PwnABaT8eWamIEtcIm4yVM+SRmpWjn9BrF2XvJBK+sruU15W
	 Sdl/SqVU1ShklH60zEvZuiWDEnuLqm3SabdE/8Vg/icR2Z5Q08giwR5Wqk+qFb9QWX
	 1XrbBJDE9FTpQ==
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 May 2024 16:33:43 +0300
Message-Id: <D1B3VSP7FC72.WNL6EGA8TJE1@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <Andreas.Fuchs@infineon.com>,
 <tpm2@lists.linux.dev>
Cc: <prestwoj@gmail.com>
Subject: Re: TPM2_Sign vs TPM2_RSA_Decrypt
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <D1AZVM0QQF2M.1SZHF66G10XK8@kernel.org>
 <c8c85a062358420ab13e849a902606cd@infineon.com>
 <D1B2ZP29BA7Y.3OYCZMEP3MLGY@kernel.org>
 <e6ac8dc493f04fdca0469f7df7735468@infineon.com>
 <D1B3UAYNEUQE.3PHLGENN3AYKM@kernel.org>
In-Reply-To: <D1B3UAYNEUQE.3PHLGENN3AYKM@kernel.org>

On Thu May 16, 2024 at 4:31 PM EEST, Jarkko Sakkinen wrote:
> On Thu May 16, 2024 at 4:05 PM EEST,  wrote:
> > > If someone could really put TPM2_Sign into nutshell that'd be awesome=
.
> >
> > Well, TPM2_Sign will perform a signing operation for you given the key.
> > You can set the scheme in the scheme parameter. That's about it...
>
> Right. What about the ticket? Can you imagine a use case for that?
>
> > > Maybe a dumb question but what I could possibly accomplish with TPM2_=
Sign that I could not accomplish with TPM2_RSA_Decrypt and appropraite ASN.=
1 heading and padding?
> >
> > Yes. If you set TPMA_OBJECT_SIGN but unset TPMA_OBJECT_DECRYPT. This
> > way you can make sure that only signing-padding can ever be executed
> > but never decrypt-based stuff. In order to use TPM2_RSA_Decrypt you
> > need to set TPMA_OBJECT_DECRYPT which is kind of weird.
>
> David, did you have a "framework" for deciding between these two
  ~~~~~ =20
  James

Ugh, sorry ;-)

BR, Jarkko
