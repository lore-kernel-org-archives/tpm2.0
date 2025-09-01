Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7BB2571A1;
	Mon,  1 Sep 2025 16:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756744189; cv=none; b=L/KNQzQYYVTDD1pkJ0ef8H370EeKcg4OJBiqd0fkUthFoytQkHqGDFD/ccexXpLT6+OkdPFxxwJf35OVGTfZ7RyzEaxB9gG9C1UwC/f8K6c90eP2OxvVa6VWm3U3eaGb3uOxR4IqkN+YvY/P7kl9LG+uUVXORPGu2poM0Q7N6ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756744189; c=relaxed/simple;
	bh=YRSau8rgN68NurQq1wWg3QaywP66gJ7MfF004R9LI+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9EFR3DGMOnivXmB6w8ut9ZPMollEh9Xymhv68XRUy2fhwRgJLrr335PDcZJYjWVpV3lZTOTsQDDyMRgOtMHB2EqNLQfqRe7KhmaHLWNamVacwa3OrEJvW7L4uGq0B0cH8U2t1z+WpFS/jjdpj+ssmJ+pRmayj/Pmr8JBmCNZPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtT9VWM9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtT9VWM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B6BC4CEF0;
	Mon,  1 Sep 2025 16:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756744187;
	bh=YRSau8rgN68NurQq1wWg3QaywP66gJ7MfF004R9LI+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JtT9VWM9p9o/r8tnktbs8YLN5l2KRde+d3cnIIK2y+XbcPA8Cm/OqLWxKp3ykvf3P
	 aJ14F0jjBAIEKFY/PqDUKbwP2afNMkmfityIGawN6qcep/KUe1hKVTaWlMjAvXh9vi
	 +nAsJqcMrCmp2MhF2/MR7qwj24ZiCy5ypeGyN1cvIXXl3nxO8jML2taS1akqOxHIds
	 SYUfZqU9D/V5K5FgKKugW4T0S6ufMxr1OU6ik7DAwXEYxKETC5Fcc5zkwHgxSwhli9
	 Lvv9c/xAmT5rEuQg8lIQNIU0Rzw0+3JFNm0vumINhloaQz9jqLiVRV4FJMYk7Q2T8d
	 kws5Xsi9rE4jw==
Date: Mon, 1 Sep 2025 19:29:44 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev
Cc: tpm2@lists.linux.dev
Subject: Re: [PATCH] fix(message): return `BuildCapacity` from build traits
Message-ID: <aLXJ-KQ1bM67qV2q@kernel.org>
References: <20250901161651.2142200-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901161651.2142200-1-jarkko@kernel.org>

On Mon, Sep 01, 2025 at 07:16:51PM +0300, Jarkko Sakkinen wrote:
> Build traits incorrectly return `ParseCapacity` when they should return
> `BuildCapacity`. Fixup the error code.
> 
> Capacity means the value of an architectural limit in this context. E.g.,
> the builder and parser detect if a `TPML_*` has more values than the TCG
> specifications allows, and return capacity error if the limit is surpassed.
> 
> Additionally, updated documentation of these error values to better
> clarify their use and their purpose.
> 
> `BuildOverflow` is probably the most confusing of the pre-existing error
> code. It pre-dates to the time when the implementation had internal
> buffers. Right now, the only function returning that error is
> `TpmWriter::write_bytes`, and when this happens, it is a clear sign of a
> regression in the crate implementation i.e., not part of the legit behavior
> anymore.
> 
> In the main branch `BufferOverflow` will be eventually removed but it is
> out of scope for the bug fix.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---

Since the traffic is low this more like announcing a merge than actual
request-for-review. Any further updates can be provided by sending
patches to the list.

I'll apply this to both main and 0.10.x branches.

BR, Jarkko
