Received: from gardel.0pointer.net (gardel.0pointer.net [85.214.157.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361EE1649A8
	for <tpm2@lists.linux.dev>; Wed, 29 May 2024 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.157.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716973334; cv=none; b=bFianerHrJhDhCAuWUBV6OFDPr30oSQvDK00vFlFwrVgMwR+LVBRzIvElGdy066l9s+Vgz3+ou0jf8JZVeIwDupBq4W6fNz0D4lOxJ48NJhCjdh+RbFTgoGMMdQDhOCrduIangf3PgST+rfp6Wqvwv6t2PU0qkSNKoFTNCeWUgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716973334; c=relaxed/simple;
	bh=CLrXPTPdC0detIfavcI/c5XR8JuiOsTSEfP5Td0rwIs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=miBhynjpAE1hNxaAxM4YsS5XUfA9f1Hl25nKsNpQoTwliYsMhxdUk0wLIPrU0tHWUG8Us37ep4k0UyqGFwHB0QK4y1p0Ps5w9RiV7pqRYZbZ4TBOJLWhlLWXP2PhqvfQ9jO6qoHqGZZV6pKwFvNkmYl8NaBw+BKBVs+UTLsEYmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0pointer.net; spf=pass smtp.mailfrom=0pointer.net; arc=none smtp.client-ip=85.214.157.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0pointer.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0pointer.net
Received: from gardel-login.0pointer.net (gardel-mail [IPv6:2a01:238:43ed:c300:10c3:bcf3:3266:da74])
	by gardel.0pointer.net (Postfix) with ESMTP id 64FBEE801B0
	for <tpm2@lists.linux.dev>; Wed, 29 May 2024 10:54:00 +0200 (CEST)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
	id DF49F160185; Wed, 29 May 2024 10:53:59 +0200 (CEST)
Date: Wed, 29 May 2024 10:53:59 +0200
From: Lennart Poettering <mzgcz2gff@0pointer.net>
To: tpm2@lists.linux.dev
Subject: Combining PolicyAuthorize + PolicyAuthorizeNV into one policy?
Message-ID: <ZlbtJ0jcy8rrUbUg@gardel-login>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

In systemd we nowadays implement various PCR-related TPM policies for disk
encryption and other purposes. In particular two of them are relevant:

1. We support a "signed PCR" policy. This is actually a
   PolicyAuthorize policy, where the intended use case is that an OS
   kernel vendor signs a PolicyPCR-based policy with some vendor key
   pair ahead of time, and that this would cover PCR extensions made
   if a specific vendor kernel is booted. This mostly covers PCR 11
   measurements if systemd's EFI stub is used (which measures the
   kernel to the otherwise unused PCR 11). Or in other words: if this
   is used you can lock secrets to only be released if kernels of that
   specific vendor are booted.

2. We support a "locally managed PCR" (which we dubbed "pcrlock"
   policy). This is actually a PolicyAuthorizeNV, where the intended
   use case is that a local tool manages a complex PolicyPCR/PolicyOR
   policy covering PCRs which are outside of OS vendor control,
   i.e. all the firmware PCRs and so on. The policy is recalculated
   whenever firmware updates are made, or boot loaders updated and so
   on, and the nvindex updated.

With these two mechanisms we could in theory cover most relevant PCRs
really nicely: the OS vendor controlled ones with an OS vendor signed
policy and the inherently local PCRs with the locally managed
nvindex-based policy.

Except that there's one big problem with this: I couldn't find a nice
way to join both policies into one combined policy. The problem is
that both PolicyAuthorize and PolicyAuthorizeNV do not *extend* the
policy so far sent to the TPM, but *replace* it. Thus I see no nice
way how I could fire first one of the two policies above and then the
other, and get the AND combination of both.

I guess I could include the signed PCR policy inside the policy I
stash in the NV index, but this sucks a bit, since it would mean the
objects I actually want to protect then would not carry a policy
themselves that enforces both policies to be enforced, but would
delegate enforcement of the OS vendor policy always to the local
policy. (I mean, this is not a total desaster, but I find it less than
ideal).

Does anyone have a good idea what I could do here?

I looked into use the "ticket" based policies. AFAIU i could get a
ticket for both policies and the put a policy together as combination
of those two tickets. But I think this would not be that great either
because it would mean that we cannot instantly invalidate policies via
a PCR extension anymore, and instead the time-out of the tickets would
allow accessing protected objects long after PCR extensions would
invalidate it.

Hence, anyone has a good idea about this?

(I asked around in other places already, noone could come up with a
really convincing solution yet I'd say, hence my hope that this bigger
forum can come up with a solution for this?)

Any help and suggestions greatly appreciated!

Lennart
