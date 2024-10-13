Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4B013C8F4
	for <tpm2@lists.linux.dev>; Sun, 13 Oct 2024 07:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728803860; cv=none; b=iaNMXDxBadO0VZOqfPkLgonpcgM9v4rRKdAeumrV6P9cKg7dit/UXSDPRqufDwTtYH+o2433pFc7Z2WGRJUAcJTfgmYxl0TVkfl9CDJPLNrayL5P+Sz6dZ233wrfKDcYo2+Y4Arhijvs8i1RnmhO8uADBGQ38on11UQTnybsMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728803860; c=relaxed/simple;
	bh=kWYpN59/qAtvCOQqCWtRXd7+/7VJMp0xoJ45rPYZq98=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=jCQW/8pTwSkLUu7rBZyzAZgsukxQch5dwyO9fJYtrQEMWGk6TA8Pl2gFkKMk+5a621etqf+kCgkJN8flj0P9D1IlvkP3WspwZRRR6sB+LZ8VhYTNGxSM/yN3byICa/V4GHqaQQMkFHN+fG7rxL71m9cmrlh9D4CZQpKBa6hGSis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=VsSDzuHl; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="VsSDzuHl"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4XRBWw5T6szDq84
	for <tpm2@lists.linux.dev>; Sun, 13 Oct 2024 07:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1728803852; bh=kWYpN59/qAtvCOQqCWtRXd7+/7VJMp0xoJ45rPYZq98=;
	h=Date:To:From:Subject:From;
	b=VsSDzuHlNkdvskhS9TaibXPK6fanK/3v4AtAtXn5N0f9y/DnSUnXk0DBuxOaPMmnG
	 +iTxlRFFvgBFNw9PsY7hq88euSN+m6FsqNDEYPnKBcTvqvZZrmtqOq1n4cpe424JuZ
	 hZcVqUeP6kmW+8lwTXpZc3ZnAnZ5n4m2o79bati0=
X-Riseup-User-ID: 76BB2A5C722C876290F2A57BD2A2138188621E510E5B3019850CCBD15D46520B
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4XRBWw3p3fzFq15
	for <tpm2@lists.linux.dev>; Sun, 13 Oct 2024 07:17:32 +0000 (UTC)
Message-ID: <1f97dff4-3920-48c1-b8fc-424dbde64a84@riseup.net>
Date: Sun, 13 Oct 2024 00:17:31 -0700
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: tpm2@lists.linux.dev
From: scar@riseup.net
Content-Language: en-US
Subject: TPM error 0x0902 every 10 seconds
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

    I'm new to having a TPM and trying to understand how to interact
with it and what I can do with it.  I last installed Debian with LUKS
full disk encryption 13 years ago, can you believe my laptop lasted so
long?  I cloned the disk to an SSD at some point, and now that SSD is
rotting away, hundreds of unreadable sectors had to be overwritten and
still fsck.ext4 got my system running at least a dozen times while I
transitioned to my "new" laptop, only 8 years old refurbished 4th Gen.
X1 Carbon.  What an upgrade!  Thanks to a helpful Reddit user and
several scripts, I got Debian installed again with LUKS FDE and Secure
Boot, and upgraded to testing/trixie release.

    Now trying to interact with the TPM, and some initial commands seem
to execute fine, like `tpm2_getcap properties-fixed`, `tpm2_getcap
algorithms`, and `tpm2_getrandom  --hex 16`.  But now I've noticed, in
the system journal, this error message printed every 10 seconds:

tpm tpm0: tpm2_load_context: failed with a TPM error 0x0902

I couldn't find much written about this out there, or am too new to all
this to understand or make any use of what I could find.  I even tried
asking ChatGPT and it had me try the following:

  * Stop/Disable tpm2-abrmd.service
  * Update grub config with: GRUB_CMDLINE_LINUX_DEFAULT="tpm_tis.force=0"
  * `tpm2_flushcontext --transient`, `tpm2_flushcontext --session`,
    `tpm2_flushcontext --loaded-session`, `tpm2_clear`, `tpm2_changeauth
    -c owner <pw>`, `tpm2_changeauth -c endorsement <pw>`,
    `tpm2_changeauth -c lockout <pw>`

    I think the `tpm_tis.force=0` option works, but as soon as I run a
tpm2 command, the module is loaded and then the 0x0902 error every 10
seconds starts up again.

    Hope you could help me figure out the problem.

Best Regards

