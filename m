Received: from gardel.0pointer.net (gardel.0pointer.net [85.214.157.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11350381C8
	for <tpm2@lists.linux.dev>; Wed, 29 May 2024 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.157.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974129; cv=none; b=BH7MvssY2cjr8PGB604F/Kh/nHh2XEitOpK5/QBotOFe4xCciGtKsVZU5ljd4Pp/UU/Bt8EsN0MXvoJRa3kxrnow17C9C30FhwHrvdwlJy2bQ9oWztC/4wHCyvea6QcXNGyossZUarb62ag6JL8o0zYLFj2T2OVOx8QSpWjMmSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974129; c=relaxed/simple;
	bh=8DzFPeoO3SxImLYyE+zM7TFT1ePJlmyW5sCXkqgUxhg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXCvZ9jY5LYfSTrV//h0S57tm0rMvSdlh0k9N23jdawOBuZEJ+daCMXk7J227n1xBDyZOfGosZtXS4fpwe/DIt3Tztlcdq1x2pcWsAuWuPzd7x3dpG9m4BtFXxa3uPql6laIUrexBeQ2EpQocyQ1MbEiQFie/Mi5VQPnw/HVU7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0pointer.net; spf=pass smtp.mailfrom=0pointer.net; arc=none smtp.client-ip=85.214.157.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0pointer.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0pointer.net
Received: from gardel-login.0pointer.net (gardel-mail [IPv6:2a01:238:43ed:c300:10c3:bcf3:3266:da74])
	by gardel.0pointer.net (Postfix) with ESMTP id BBFD1E801B0
	for <tpm2@lists.linux.dev>; Wed, 29 May 2024 11:15:24 +0200 (CEST)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
	id 70DF8160185; Wed, 29 May 2024 11:15:24 +0200 (CEST)
Date: Wed, 29 May 2024 11:15:24 +0200
From: Lennart Poettering <mzgcz2gff@0pointer.net>
To: tpm2@lists.linux.dev
Subject: Policies for nvindex based "fake" PCRs
Message-ID: <ZlbyLOBBGPRxm-gO@gardel-login>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi!

As you all know there aren't that many PCRs available in TPM2. But
supposedly we can define equivalent objects via nvindexes, and then do
extensions via TPM2_NV_Extend.

I'd like to add support for this to systemd's measurement logic (since
we'd like to measure more categories of stuff, but simply have no PCRs
left right now). But what puzzles me a bit is how to do this correctly
so that the access policy to the nvindex makes it behave like a real
PCR and doesn't add weaknesses real PCRs do not have.

So I want a policy that allows reading and writing (via
TPM2_NV_Extend) unrestricted to anyone, just like PCRs. So much I
guess is straightforward. But what concerns me is how to make sure
that people cannot just remove my nvindex and recreate it during
runtime, thus resetting it to zero freely. After all removal of
nvindex is normally unrestricted too.

What would probably work is if I had an nvindex that is automatically
deleted at reboot, but which would be blocked to be deleted
otherwise. But I don't think such a policy can actually be defined.

I mean I could set TPMA_NV_POLICY_DELETE which would mean I need
platform authorization to delete the thing, but this sounds less than
ideal to me…

Any ideas how to make this work? I can't be the first one who actually
wants to use nvindexes as fake PCRs? There must be some prior art?
Google didn't find me anything though?

Or do I have to enforce a policy on writing instead, for example
PolicySigned with an HMAC key maybe, so that only "trusted" clients
can write to the PCR and initialize it, and thus anyone who deletes
wouldn't really gain much because they couldn't initialize it properly
after recreating it? I mean, I guess that would work, but it's
somewhat restrictive, no? And would make these nvindex "fake" PCRs
quite different from traditional PCRs that anyone can write to.

Any help/suggestions appreciated on this!

Lennart
