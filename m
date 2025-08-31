Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31321F4CBB;
	Sun, 31 Aug 2025 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756654514; cv=none; b=Jqc7RW4JKdvuynbxpBGx0+h6Ruzqyqe7yLiJCXnBv7qK5QibieTutfgNUOIaoGsqvS4njNNdWv8x3P/eRW+QViTQWFGMqxsoirir3RGhByfHjcHpJeLz+f4Wjx2CWy9jqUSXmQVxM6yU6BQaj69VO7jdBWDnLiZ9Utc2drxiF1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756654514; c=relaxed/simple;
	bh=YKO1Hokfcjj32qP1YM3IRh5gL7hazAwmJcuavBvx8/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFCwgr0zGSWOozUD6t7jAB04oaiMz6jH/bauu5CDj+iEMYiw6oq3RamxbLRU6IekRuc6okasjP+ijcsvdcKeyqTyq7GAfrjOdFEBFiF6GDVymgMDQsDaoO7t2aPINB0owDt4cII1IaYnoax5ZmpIsI8YM6rrsK2UPmRO0WQL2OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUAshR4X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUAshR4X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B751C4CEED;
	Sun, 31 Aug 2025 15:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756654513;
	bh=YKO1Hokfcjj32qP1YM3IRh5gL7hazAwmJcuavBvx8/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUAshR4X1wx922fdWdOWfzl8E2Tin4fDnBizi2FS/t+1qfTZ+xi7RcmRxLN/GnBqx
	 +yKMJZEFlfYCbeMIOZjTizcAe/CdFLXF2tGxSkXXjiR9F4ykkRRth/9wBsP3tSU7+/
	 ElzR0udxHPmxWgfhwq/UWtMHJu1FkvyqkDY80Qw6yTcCRbXwtDp+21ORWDR0861cDR
	 525CiNT0S+yLCgPNsfzhgLGLyenZWegXiP27oiDJQC1pW9vp10opx6QdaNfqZxgnPt
	 /8E8I0G8bAi7xB1aCNxpwa5h9u7v2ZGLYeihDPNTxgpLo7BYlSM1jiniMAAdBVe1+i
	 UggYqMympWObw==
Date: Sun, 31 Aug 2025 18:35:09 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev
Cc: tpm2@lists.linux.dev
Subject: Re: [PATCH] perf(message): avoid buffer copy during command parsing
Message-ID: <aLRrrYwWAaPt8XcG@kernel.org>
References: <20250831150145.386502-1-jarkko@kernel.org>
 <aLRn9pHieGfsxeeM@kernel.org>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLRn9pHieGfsxeeM@kernel.org>

On Sun, Aug 31, 2025 at 06:19:22PM +0300, Jarkko Sakkinen wrote:
> On Sun, Aug 31, 2025 at 06:01:45PM +0300, Jarkko Sakkinen wrote:
> > `tpm_parse_command` copies handles and parameters to a fixed-size temporary
> > 4 KiB buffer on the stack before invoking a command parser.
> > 
> > Introduce `TpmParseCommandBody` trait implemented by `tpm_struct!`,
> > providing accessors for handles and parameters in the original command
> > buffer, thus zeroing out the large stack allocation.
> > 
> > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > ---
> > I plan to backport this also to 0.10.x branch, given signficancy.
> 
> This is something left out of initial stretch, which I've had in my mind
> for some time. I postponed this change because stability was a priority
> over performance at the time.
> 
> For the sake of symmetry I want to also rename `TpmHeaderCommand` as
> `TpmCommandBuild`, make `TpmHeader` decoupled from that trait, and
> finally change the constraint in `tpm_build_command` from `C:
> TpmHeaderCommand` to `C: TpmHeader + TpmCommandBuild`.
> 
> This patch does not include that style change, given that it is first of
> all logically distinct and further cannot be backported to the 0.10.x
> branch.

As this is just backlog and dead obvious fix, I'll also apply this to
the main branch and backport to the 0.11.x branch.

BR, Jarkko
