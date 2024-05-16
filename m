Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E59143895
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 10:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715855126; cv=none; b=FndI9AERhUUcxxusDB+GVf9eTXw+g+cMPaimCdOT4KjPKYNVnzCqAqEFhTenJ3HShOv/sI3OARmk6SAAHviHUStBOWAU8t8U1Xjke+rUQ9QwfLAMdrkWu9uK1ZJVDYTRg5OWF+axiufwmkQg/Xfa4sx8nFYqKnvzjRRE85WNIfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715855126; c=relaxed/simple;
	bh=CWfdwXyVA+kZ/Zizv2fHFFnWjJCzLKBYrdRh7vdn+9U=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject; b=sils95jOB4EJv8cWwBP/+2Gb7yjffm5Bd0Cbn9yj4+6bTUKEOrXhj6GRssUtYyv8hZJ2bzkDLa8uxq4oWqtev4C+9/eOoDE7B+f6A5uAIhvxLpmmdO9MVMF86AimKFBD4G7FfDOwdMZHf6Xlrd9Ux9TxsSBczIIYtS+ebYHCGc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kjrj0d1N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kjrj0d1N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF673C113CC
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 10:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715855126;
	bh=CWfdwXyVA+kZ/Zizv2fHFFnWjJCzLKBYrdRh7vdn+9U=;
	h=Date:From:To:Subject:From;
	b=Kjrj0d1NMNhdZc1Yy6EWMiP4DUmMFneUN96fIu9dVdFZImAhPC737J0EWwQI0ouy+
	 NikZEoN899O+5GYxMTde0HjQoObmGsjCDf2ROVc7icwZwJCJDlUDbMaMThEWZb5t49
	 8AxUB+1KHf/lWdGR6rsI/WKZWQ2y+6mM6j+GHEgQwDFVMR7HGQREkT9is8DCh5dFCo
	 zNFLnmcy9uWiYxLqDwwXVVTjC3tn4Lbi3m00e1Em19fkqU+rTOg0XQV7gi1OVCt302
	 QCfMTN2r3INFZirJkvUKGNu41dRtjTsh64QFI9lmcN5gAc8aWXlkPiagE/FPE2Gy08
	 Igx4fbN1Vqwiw==
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 May 2024 13:25:24 +0300
Message-Id: <D1AZVM0QQF2M.1SZHF66G10XK8@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <tpm2@lists.linux.dev>
Subject: TPM2_Sign vs TPM2_RSA_Decrypt
X-Mailer: aerc 0.17.0

Hi,

I'm pushing with James Prestwood RSA and ECDSA based asymmetric keys to
asymmetric keys subsystem of the kernel and for e.g. RSA we can just use
TPM2_RSA_Decrypt:

https://lore.kernel.org/all/20200518172704.29608-18-prestwoj@gmail.com/

I've implemented some code that make this fit more cleanly to the kernel
and James will refactor his old code on top of that. I.e. add the
padding and asn1 data and make x.509 compatible scheme. Just do
textbook style RSA part with TPM2.

Just for plain interest, because I'm not too familiar with TPM2_Sign:
when would you choose to use it instead? I just want to make sure that
we're doing right things right :-)

BR, Jarkko
