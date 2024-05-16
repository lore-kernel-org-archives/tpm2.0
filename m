Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D92147C60
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715866309; cv=none; b=ePV5hcwPDVn+AGZTRptQedAcqGer/okDLcXc3v4CUlqaSGOTkByYFgVGrI0nCFkGYj31I/07ZPi50JN9dHi7ksMQOVDiW9yk0XNocNidWQ1rL1EYceCcbg8Pv/K87CceHlizf8SgO76QCSwHpZfD7yBbZcgM0DzpTeku246Ix1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715866309; c=relaxed/simple;
	bh=unZvzOLie/EZv14yFoeKj6bHAVJuVm6iXCFSc5yi4cQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gvPU1fJBF720y2ghvc5HD8iJP7y8+or7NIvoF1SZDlfA6lyhCLMR7oqLcVmwaI42j6GhDTALmQ0Vo3iPOoJ55VO9ENZIQTXhvfqpj+g+GWunwvmffNWYilyavWER6jfo6nT/OKosPY2JXeytyEso1M3Vq58tsvqWshW+WAe/1WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNcXVWiS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNcXVWiS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F629C2BD11;
	Thu, 16 May 2024 13:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715866308;
	bh=unZvzOLie/EZv14yFoeKj6bHAVJuVm6iXCFSc5yi4cQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=BNcXVWiS9XXmKeqmbBlMgvX4MuFUGyweMaTfxWizwL22x/trqyFHp7e2h2OwZcq1Q
	 crn6UOLZ6cVuh3w47UhNP8kduJcDSOfjFdxjiwO5FsVq1J/rZvytgKMBhZ3E+sPK1n
	 jMJvomHnLq8Wx6/nCj0yMZQlqlvub84ZvWBdlkB7WO2Y1wr7CWs/0MOnS9iK/sp7C6
	 Nb8jg3ys6dkFiUnqkmFuJt9m9myQGQAZ98uBtIf6jf9b5uNuiT5TWB+Jk1fnwGYcwI
	 KEYme4uwKSCZ/sQz0rwY/N/7j6XxktQErhAgiYKfJBDmFxyqq1p/jxolLmP1fFYZJm
	 FjvlLcoj74kig==
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 May 2024 16:31:46 +0300
Message-Id: <D1B3UAYNEUQE.3PHLGENN3AYKM@kernel.org>
Cc: <prestwoj@gmail.com>
Subject: Re: TPM2_Sign vs TPM2_RSA_Decrypt
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <Andreas.Fuchs@infineon.com>, <tpm2@lists.linux.dev>
X-Mailer: aerc 0.17.0
References: <D1AZVM0QQF2M.1SZHF66G10XK8@kernel.org>
 <c8c85a062358420ab13e849a902606cd@infineon.com>
 <D1B2ZP29BA7Y.3OYCZMEP3MLGY@kernel.org>
 <e6ac8dc493f04fdca0469f7df7735468@infineon.com>
In-Reply-To: <e6ac8dc493f04fdca0469f7df7735468@infineon.com>

On Thu May 16, 2024 at 4:05 PM EEST,  wrote:
> > If someone could really put TPM2_Sign into nutshell that'd be awesome.
>
> Well, TPM2_Sign will perform a signing operation for you given the key.
> You can set the scheme in the scheme parameter. That's about it...

Right. What about the ticket? Can you imagine a use case for that?

> > Maybe a dumb question but what I could possibly accomplish with TPM2_Si=
gn that I could not accomplish with TPM2_RSA_Decrypt and appropraite ASN.1 =
heading and padding?
>
> Yes. If you set TPMA_OBJECT_SIGN but unset TPMA_OBJECT_DECRYPT. This
> way you can make sure that only signing-padding can ever be executed
> but never decrypt-based stuff. In order to use TPM2_RSA_Decrypt you
> need to set TPMA_OBJECT_DECRYPT which is kind of weird.

David, did you have a "framework" for deciding between these two
when you originally implemented the patch? I.e. did you consider
TPM2_Sign but ended up to TPM2_RSA_Decrypt?

Not meaning to blame just want to go fully through this :-) It
is working code after all.

Huge benefit I see with TPM2_Sign would be probably that we get
ECDSA from the same functionality.

Disadvantage is that we can use TPM2_Decrypt, i.e. single command
for decrypt operation. Encryption side is done in the case asymmetric
keys with software as it is done with the public key.

Have not actually looked at yet TPM2_EncrypDecrypt and
TPM2_EncryptDecrypt2 (do not know even their difference).

> Also, if you want to use a restriced key (formally called Attestation
> Key) for regular signing operations, you need to have a
> TPMA_OBJECT_SIGN and must not have TPMA_OBJECT_DECRYPT set.
>
> Those would be the reasons for preferring TPM2_Sign wherever possible IMH=
O.

Actually I think in our case it should be non-restricted as the
point is x.509 certs not proving TPM inherent properties.

Also section 3.5 seems to support this view, if I understand it
correctly:

https://trustedcomputinggroup.org/wp-content/uploads/TPM-2p0-Keys-for-Devic=
e-Identity-and-Attestation_v1_r12_pub10082021.pdf

So technically I see TPM2_RSA_Decrypt and TPM2_Sign still
equivalent in the context of use case...

>
> Cheers,
> Andreas

BR, Jarkko
