Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17DE1E491
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872709; cv=none; b=BUILLj+6KNWc9vnq9v5hBuiu01PG4MovFrHU8sDVmtWkpJ/bXD/bz7y3OQtHP4zLbnz6MNikV4fWCfyBUGaVEDzO6vI+rQxQQS9DIHgnbOXZoWjfpG3h4RDeB5KsKnTFk6PP2u0O0uJXenzIlO4MVA2XFbdEBLvhLc421B7SzlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872709; c=relaxed/simple;
	bh=zhEE7ogL/NrE05gvU5lFYEZovXojW3wtqQECJF3+EE4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=KNWeWu/takBYpU23gSVP0cUW1zWTcJ22kVpp8rXk9OWpaMnl5sGrhrSBYQA4O3nhEMvE9yxSq2i9AY58j6RbYPhx2sL7LPp7tHJ7R2trwrw7sCKa609XBvOyTRIGklNr4BP9ZZj8vRleClmhdA8pfDPOvXN114B3iSAKcZNBN24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8P4klu1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8P4klu1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA42BC113CC;
	Thu, 16 May 2024 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715872708;
	bh=zhEE7ogL/NrE05gvU5lFYEZovXojW3wtqQECJF3+EE4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=B8P4klu1pYioSinQj04VOLsyvgkqLFC08kKJtjKZP9X7Qx0SJxlzLLWkUv39srCvi
	 FFaZFUWQCVjKA+G1QnVn59+g2mWKGSHBRBWuJkf30Z2+wdy/idRdJToZpxRoW9gwAD
	 jMm6dX3jSBkLopnjoTtYhPbk2VamCl3WpsQ914N0gH71A2b4vO61CI6V0Kitpc9f0u
	 f1ruYL0D1Lt048RbaWzNdsDt7+rvdeDTJ3lYiwOgvbP9ixJ95BVEqzno2bDkg22YKW
	 wftHzlQhhp67fqoeJWVuEwa62xhAKTszIVuy+4RF+XOGY5RuDJAjG4K9r6OLvLH62b
	 2I5ldibDL/j+A==
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 May 2024 18:18:25 +0300
Message-Id: <D1B63Z0L7EFJ.U9RZFEM3WIDF@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "James Prestwood" <prestwoj@gmail.com>, <Andreas.Fuchs@infineon.com>,
 <tpm2@lists.linux.dev>
Subject: Re: TPM2_Sign vs TPM2_RSA_Decrypt
X-Mailer: aerc 0.17.0
References: <D1AZVM0QQF2M.1SZHF66G10XK8@kernel.org>
 <c8c85a062358420ab13e849a902606cd@infineon.com>
 <D1B2ZP29BA7Y.3OYCZMEP3MLGY@kernel.org>
 <e6ac8dc493f04fdca0469f7df7735468@infineon.com>
 <D1B3UAYNEUQE.3PHLGENN3AYKM@kernel.org>
 <56e9bb39-c253-4ce3-b3bb-1c3480a22fa5@gmail.com>
 <D1B4CE777IGH.MQ5BRAN4Q69X@kernel.org>
 <1107614a-a99d-4997-84f6-e18cc30f5a9a@gmail.com>
In-Reply-To: <1107614a-a99d-4997-84f6-e18cc30f5a9a@gmail.com>

On Thu May 16, 2024 at 4:59 PM EEST, James Prestwood wrote:
> On 5/16/24 6:55 AM, Jarkko Sakkinen wrote:
> > On Thu May 16, 2024 at 4:44 PM EEST, James Prestwood wrote:
> >> To be honest I started with encrypt/decrypt and included the signing
> >> operation because it was basically "free" by using tpm2_rsa_decrypt().=
 I
> >> was not aware of this distinction/difference between that and doing
> >> signing on the TPM itself. I don't think I ever looked into the signin=
g
> >> command on the TPM itself.
> > My personal take: I'd start RSA with the working code and just
> > clean up the parts for the first round. It is tested code and
> > does the job, right? :-)
> It was tested then yes, obviously need to verify that after 4 years :)

Yeah, I gave some nitpicks for you (private) and yeah branch (tpm2_key)
branch has shenigans to call ANS.1 template acquiring function from the
stock RSA code in the kernel :-)

Better to do as little as possible and then we look at what actually
needs to be done.

In addition to Andreas, I'd recommend to first of all CC the patch
set to linux-crypto too in addition to linux-integrity and
keyrings and also Herbert Xu (crypto maintainer).

I know this is some effort to you but isn't it any way worth it
because then the work that you did years ago was not wasted? :-)

BR, Jarkko
