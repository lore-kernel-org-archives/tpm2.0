Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5404514D6FB
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872822; cv=none; b=uhiEFtMQL5c1w3TFLBVtvdNqqUnjB1u7MX6NiS5wcI41R9Q2/bw/dsMSnYHh8YoaEpQRxIMMG+Rmbb09O8D/EFRC+0LVXWCLZcZxv0AWUtXvEytrKEWxBTrVHfFwyWFc56uIQplRnFZDxQKCI3PymwPZWssvdL8MW3qGd1EHpzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872822; c=relaxed/simple;
	bh=g4JsW1W8Vxw+UXDFv6SMttNIAZCWTTN3aXWm7plNBhc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=ffugfZbW6I54jBKz/69HFGCuhvsgey+aqwb+P5Ic0NwjnvDvcAv/FvxzB9gWtz4Z24O7FXJz99zxHeNeW2YAhRgbrOxugiXmSiN5vp9ymtTRFyt631Uu50rXfWoNwLHkHiEqYviIUp/9XDvJklJ4mli7qlvzzUyIAggVH4KjfzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nX2xemdC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nX2xemdC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2711FC4AF07;
	Thu, 16 May 2024 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715872821;
	bh=g4JsW1W8Vxw+UXDFv6SMttNIAZCWTTN3aXWm7plNBhc=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=nX2xemdCQOUpac4IVmTfB0vgn+4wJsa6bLfM3a5LR5PiJmxOG9FvPBeb/9I/8oSYP
	 C5f0Odb2ARbkMalNSKdEG1c1EN63lKJWzDsmLODYxd8lezvxuWQ3LxCliDS83bzmUK
	 ttRlvK5wLsZCj4EMaBE7IcVb/ve5ubrUhZscQA5lri9J6Zu4mLRkhU/ixY1vC4jxqT
	 QmK6zvGSvdfWU3UvKBC1ntjQc8FLEmttCLsOB/6PApTlqfIVdsRYUvRqAK28gzTKK8
	 1PB7sidsD7KlSjT5MujP7fA4NZegXjMOPMsGzni4r0M+irSLbautu3KnESYjHi4nF0
	 Xq0YZGdEHzHqg==
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 May 2024 18:20:19 +0300
Message-Id: <D1B65F2QRSXU.18UDKT6H98GIN@kernel.org>
Subject: Re: TPM2_Sign vs TPM2_RSA_Decrypt
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <Andreas.Fuchs@infineon.com>, <prestwoj@gmail.com>,
 <tpm2@lists.linux.dev>
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
In-Reply-To: <4fdcc042a8f74b0e8e5d54a67a1c87e0@infineon.com>

On Thu May 16, 2024 at 5:14 PM EEST,  wrote:
> TPM2_EncryptDecrypt2 is for Symmetric encryption (i.e. AES) only.
>
> I'd still recommend to go for TPM2_Sign().
> Note also that switching may be hard later down the road, since the key u=
sage flags are define during creation.
> So backwards compatibility is nasty here.
>
> Feel free to CC me.
> I'll do what I can.

Great I get that but I'd still start with the existing code because it
was how it was done. I'm strong believer of "change only by stimulus"
and it is rare for feature patch set anyway land in the first round.

BR, Jarkko
