Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944381474BA
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715867727; cv=none; b=bX4AhwwUrGxwj1WfZJODCzMIItOBq1WQfriodYXpd4/HByTwah59I1m9hPgk+3CykKHK0mKpJxZqv4gbR5lmY6eyf3ml8qHhW5ruELKLvaqLHBEaIRapmnnH06kKOEwOI62OmTYGWqRVgSdPqxGFCaKQf3xRc9FKeY4Q0bRgLYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715867727; c=relaxed/simple;
	bh=Bf0W8ysKKb3ovhlTozXx4UsoaM1hSUPheOMB9HKkKv8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:
	 References:In-Reply-To; b=Je3niaTpLEX7quzh81SXTB8XMjB/c7PthmOqNsqp747SNpztE1x4HWFm5fGCtOEW4BXmT0ARleheqw4gije/LUplXAvFBqLie/BgzxoTPXeExGxoU6qWF56AxanwYTe53X+wo17IuFatRNaIbDHf4LE4/udDbdu1WSjlykacLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYH6P+Da; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYH6P+Da"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5BEC113CC;
	Thu, 16 May 2024 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715867726;
	bh=Bf0W8ysKKb3ovhlTozXx4UsoaM1hSUPheOMB9HKkKv8=;
	h=Date:To:Subject:From:References:In-Reply-To:From;
	b=FYH6P+Da7uUAiiHETloOFiH6KipkWgAbMX3inIJXOCeSljAk6Xou+yuwv7IJJnC8p
	 UPAz6+98J393lN1Bg35oE6ZQ9REu8uH/seWNwcXUK1eCHPS0r+azzQQKEXd2VO+rZX
	 o2gefoHyPb8U9UKbnM9q96/PYhY++bmH7d5WTbUcg5fdW1iziRf2DtQZJFC59/SD4M
	 GxpKkC+ONkgn6RDCtomd/TlTZaQ8K++vTC1O/uSQ1H/LGanI0QY7WNcB7IozCqA+bX
	 bo/R4NIpwtFTd7rs0j9CaMDaMGFL1vuNrjJRU/P/WTXrnB1xhHyDNdK2mDmqvXf0Gc
	 ZaTs/fmqsPhEg==
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 May 2024 16:55:23 +0300
Message-Id: <D1B4CE777IGH.MQ5BRAN4Q69X@kernel.org>
To: "James Prestwood" <prestwoj@gmail.com>, <Andreas.Fuchs@infineon.com>,
 <tpm2@lists.linux.dev>
Subject: Re: TPM2_Sign vs TPM2_RSA_Decrypt
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <D1AZVM0QQF2M.1SZHF66G10XK8@kernel.org>
 <c8c85a062358420ab13e849a902606cd@infineon.com>
 <D1B2ZP29BA7Y.3OYCZMEP3MLGY@kernel.org>
 <e6ac8dc493f04fdca0469f7df7735468@infineon.com>
 <D1B3UAYNEUQE.3PHLGENN3AYKM@kernel.org>
 <56e9bb39-c253-4ce3-b3bb-1c3480a22fa5@gmail.com>
In-Reply-To: <56e9bb39-c253-4ce3-b3bb-1c3480a22fa5@gmail.com>

On Thu May 16, 2024 at 4:44 PM EEST, James Prestwood wrote:
> To be honest I started with encrypt/decrypt and included the signing=20
> operation because it was basically "free" by using tpm2_rsa_decrypt(). I=
=20
> was not aware of this distinction/difference between that and doing=20
> signing on the TPM itself. I don't think I ever looked into the signing=
=20
> command on the TPM itself.

My personal take: I'd start RSA with the working code and just
clean up the parts for the first round. It is tested code and
does the job, right? :-)

Then we will weight the odds and cons in the review. That said,
if you want to use TPM_Sign and TPM2_EncryptDecrypt(2) that is
fine too, but not demand.

As for ECDSA, it can be part of the patch set, or we can start
just with the RSA part.

Andreas, is it OK if the patch set is CC'd to you so you can
give your feedback/remarks on it?

BR, Jarkko
