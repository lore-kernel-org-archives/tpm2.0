Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F66913D8B4
	for <tpm2@lists.linux.dev>; Fri, 17 May 2024 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715968735; cv=none; b=Z4/v1Vd8XMzLU3k0LCVI1JmxN7z4kPyWIDfmbHIX/4Tkrp2Swjf2nUn0YGT4fOqN40U88EGdPUeFWfN/TKmyr68Q/WPrOIxrCliqce45zR314byjY3Tap2/WLkF+3dfxPabwUgXBHGa7EiKS69/8YYxl5Z01xeWaBjlPBu0eDE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715968735; c=relaxed/simple;
	bh=ug/cHQKPKzlK15Tyb9cghE28ly0qeiwZ+N/1ZC+ufPE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=m+iA+GaBEnmvAf91xfmvIg8a30qjdGrLaAfQkCiEsq1mfllub6nje9HubO2twgRB7kQbNaiod6JZdZaO2veqjm+isZmbuhtuU+3tmcrkrWgRLqxEjFPMwYkI2f903R954CiWJ49SOP+n6A55Dwr+ZdnJz/nQR1aY9t3kZgjaN6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRk/JSmm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRk/JSmm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84600C2BD10;
	Fri, 17 May 2024 17:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715968734;
	bh=ug/cHQKPKzlK15Tyb9cghE28ly0qeiwZ+N/1ZC+ufPE=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=eRk/JSmmfkkENDeSlAnZG5urdSGm+2yCyw3kaWUsHKbi55RDkwh0In0Ka7vnRQbkn
	 pccRopm61encU8UNkU+Cm7E/oDoQE7swNckhzbr4mR988nuS6vUJuWfCINwcrMZgOZ
	 jxLroQlD8xaHl/RqfJrq4ENE686FFqjfddj9UJB7hC9atkJaVd/AqwxvQmDxCur5Vc
	 B+l7j9EN7T57mR5iU3tCFwABVuS0bi0mXQf8170L2s4gXdJWmT2rHbCDZ4b6c1DnX2
	 UMLvEXH+Q7OvenATQDsXG2qF3I9P71xnMX7NzWxRcU4zdxs1QB9v1JKbMz2TzKJupv
	 ra2Syescv5X1Q==
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 May 2024 20:58:51 +0300
Message-Id: <D1C45CPHELI8.15RGHJAP0NT56@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <Andreas.Fuchs@infineon.com>,
 <prestwoj@gmail.com>, <tpm2@lists.linux.dev>
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
 <4fdcc042a8f74b0e8e5d54a67a1c87e0@infineon.com>
 <D1B65F2QRSXU.18UDKT6H98GIN@kernel.org>
In-Reply-To: <D1B65F2QRSXU.18UDKT6H98GIN@kernel.org>

On Thu May 16, 2024 at 6:20 PM EEST, Jarkko Sakkinen wrote:
> On Thu May 16, 2024 at 5:14 PM EEST,  wrote:
> > TPM2_EncryptDecrypt2 is for Symmetric encryption (i.e. AES) only.
> >
> > I'd still recommend to go for TPM2_Sign().
> > Note also that switching may be hard later down the road, since the key=
 usage flags are define during creation.
> > So backwards compatibility is nasty here.
> >
> > Feel free to CC me.
> > I'll do what I can.
>
> Great I get that but I'd still start with the existing code because it
> was how it was done. I'm strong believer of "change only by stimulus"
> and it is rare for feature patch set anyway land in the first round.

In the case of asymmetric keys, the hash comes from outside and it is
signed by the TPM so to be neutral to the source, TPM2_RSA_Decrypt does
make sense. It is more robust in this case.

BR, Jarkko
