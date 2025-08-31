Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7500CF9C1;
	Sun, 31 Aug 2025 15:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756653562; cv=none; b=G3cUOGh8Dyn56xwu3bp28wTwpD1lMNcliKOlaqcmStVe0XoqMip2DFTZ/VRzlWtBGgKkDC1FPoT4Gqp8kzoUV3aSip2FviBdDG22K94XHyShKg0AYRRVdEs1O/fTNe9Q/9McR2W54pDIL+1ivfEAIHJxm0iS25XwonHcYSB7tZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756653562; c=relaxed/simple;
	bh=qUG8kuEZ+qD+L5J1pBjXUp9owCi1kSRz60HfhwLvXA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSYSDoBpaaDx3HrmRd0i7G0YwBHkTgz+IWWvH/hXdznLHhEw7yyGm8a6eVuOSQcNRJrdt66GFOA/hlcBcNLaLkpXz0gg+AsgWla1R/shHZFR2GMBh0RGsjwATOYt1DSYbtg4QGb3+ASIK39mRReFY6sek7FXuPux52gqHNfHHbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fm379cXn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fm379cXn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0259C4CEED;
	Sun, 31 Aug 2025 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756653562;
	bh=qUG8kuEZ+qD+L5J1pBjXUp9owCi1kSRz60HfhwLvXA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fm379cXnyYDgW7vkigG6plQGLsbCk+ZiGA+We3FkFalDls+8Umte9eauWN6rLEgSs
	 30ptOYURnT3hD/hej3fIirQaIdjU0NYRyOaINi+rE+C/pi4mufjgGaGGQqJywCPXlD
	 7YsJN8c3BNhvpytsQJ15yrHXpxEsQEtQMRZ5qXfIQ8KbS/YZJggRbaA0K7mp2dKRld
	 m6jCekIxQSXnLPfq2xa6YhItkPLdDJzLagqQqaH9wSBS94ABZArGy+xV4tctSDg0an
	 62XIrrpDTQQODndr4pl9LJ9L6hClI8EIPOryS+SWVrdE8Bi+0xwDxdefSByTK/10Hn
	 GO/wcGanSIx5A==
Date: Sun, 31 Aug 2025 18:19:18 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev
Cc: tpm2@lists.linux.dev
Subject: Re: [PATCH] perf(message): avoid buffer copy during command parsing
Message-ID: <aLRn9pHieGfsxeeM@kernel.org>
References: <20250831150145.386502-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831150145.386502-1-jarkko@kernel.org>

On Sun, Aug 31, 2025 at 06:01:45PM +0300, Jarkko Sakkinen wrote:
> `tpm_parse_command` copies handles and parameters to a fixed-size temporary
> 4 KiB buffer on the stack before invoking a command parser.
> 
> Introduce `TpmParseCommandBody` trait implemented by `tpm_struct!`,
> providing accessors for handles and parameters in the original command
> buffer, thus zeroing out the large stack allocation.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
> I plan to backport this also to 0.10.x branch, given signficancy.

This is something left out of initial stretch, which I've had in my mind
for some time. I postponed this change because stability was a priority
over performance at the time.

For the sake of symmetry I want to also rename `TpmHeaderCommand` as
`TpmCommandBuild`, make `TpmHeader` decoupled from that trait, and
finally change the constraint in `tpm_build_command` from `C:
TpmHeaderCommand` to `C: TpmHeader + TpmCommandBuild`.

This patch does not include that style change, given that it is first of
all logically distinct and further cannot be backported to the 0.10.x
branch.

BR, Jarkko
