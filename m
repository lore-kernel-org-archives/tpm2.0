Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A2E38396
	for <tpm2@lists.linux.dev>; Mon, 28 Oct 2024 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730121625; cv=none; b=C7SOQKhxv3zqbTX0tDL5p9txzagUWr0CMqvhHX9yCyEdWOJzzQKFP1K37+wmiHUgnpixumS/G+txuIcY0F5wg0158SaKXVb/o7yNgX3nZWBKHFo48N5rvfi2W5q3O0X11/asbHqCAVAoUfe36IGr9zMUflM4DcwkBoNQltyK+lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730121625; c=relaxed/simple;
	bh=Xi9Br0DUJ7rar83XA0O2V5TVcz+JIugNVWsGPCnD/j0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eCljIYQheFRseKs8nDxqispGFXLJ2uYyW8vlRil3GBgCiYLMc9tDe5hwc3dc9Guvi9CTbh119DmardDuO8HC+mYF6RPzmWTv+vgz4sCWPWjaw7+t8q9EPKOMvLbdWBtd5aMzAPDBzv2Ocz5aM285ZDPBe7qA5S+hhARRMxf0gTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=pVThuW9b; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="pVThuW9b"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4XcYsf56m7zDqv3;
	Mon, 28 Oct 2024 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1730121622; bh=Xi9Br0DUJ7rar83XA0O2V5TVcz+JIugNVWsGPCnD/j0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=pVThuW9bMhDxIv/TLYhW+mpKI/0N367a3e+RBgaG+DtWMJk9ms3cFnDy743qCKCUP
	 kPVgeadhXpbA9L9OxcYg45C/cXeHkWsH8HKXUzZYyZBKUxrXJawu6xZw3QRwk6rljH
	 3AAxiCuhq/eZgqkbMmcjIObPeXZEvzPrLJOd74Xs=
X-Riseup-User-ID: 21BC0F26E744AC2129733C0244D9432C75035C8774038E585E94D7D0A91AB052
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4XcYsf0sH9zFtTK;
	Mon, 28 Oct 2024 13:20:22 +0000 (UTC)
Message-ID: <eb1dc693-6712-4256-a812-51fcbc5faf2b@riseup.net>
Date: Mon, 28 Oct 2024 06:20:20 -0700
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: TPM error 0x0902 every 10 seconds
To: =?UTF-8?Q?Laurent_Mesur=C3=A9?= <laurent.mesure@enedwaith.org>,
 tpm2@lists.linux.dev
References: <1f97dff4-3920-48c1-b8fc-424dbde64a84@riseup.net>
 <bbe0cfcb-5337-4d8e-9746-e0520bbeb551@riseup.net>
 <27e317ff-f134-4474-9955-16c6671629b7@enedwaith.org>
 <173c6a6e-f47f-4fea-9331-baac2b7a248d@riseup.net>
 <984200bf-6d66-4658-a8c8-f742d5d3e683@enedwaith.org>
From: scar@riseup.net
Content-Language: en-US
In-Reply-To: <984200bf-6d66-4658-a8c8-f742d5d3e683@enedwaith.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Laurent Mesuré wrote on 10/23/24 12:42 AM:
> I think that the 10sec delay between each error is maybe because a tpm2
> command is send to TPM every 10sec.
> Is there any monitoring using tpm command?

I think so?  tpm2-abrmd.service is active (running):

● tpm2-abrmd.service - TPM2 Access Broker and Resource Management Daemon
     Loaded: loaded (/usr/lib/systemd/system/tpm2-abrmd.service;
enabled; preset: enabled)
     Active: active (running) since Fri 2024-10-25 09:17:04 MST; 2 days ago
 Invocation: 9a75c7bfb37845fd84f974554042ad17
   Main PID: 863 (tpm2-abrmd)
      Tasks: 7 (limit: 18793)
     Memory: 604K (peak: 1.7M swap: 432K swap peak: 676K)
        CPU: 951ms
     CGroup: /system.slice/tpm2-abrmd.service
             └─863 /usr/sbin/tpm2-abrmd


and I also noticed:

× systemd-tpm2-setup.service - TPM SRK Setup
     Loaded: loaded (/usr/lib/systemd/system/systemd-tpm2-setup.service;
static)
     Active: failed (Result: exit-code) since Fri 2024-10-25 09:16:56
MST; 2 days ago
systemd[1]: Starting systemd-tpm2-setup.service - TPM SRK Setup...
systemd-tpm2-setup[667]:
WARNING:esys:src/tss2-esys/api/Esys_CreatePrimary.c:401:Esys_CreatePrimary_Finish()
Received TPM Error
systemd-tpm2-setup[667]:
ERROR:esys:src/tss2-esys/api/Esys_CreatePrimary.c:135:Esys_CreatePrimary()
Esys Finish ErrorCode (0x000009a2)
systemd-tpm2-setup[667]: Failed to get or create SRK: State not recoverable
systemd[1]: systemd-tpm2-setup.service: Main process exited,
code=exited, status=1/FAILURE
systemd[1]: systemd-tpm2-setup.service: Failed with result 'exit-code'.
systemd[1]: Failed to start systemd-tpm2-setup.service - TPM SRK Setup.

and:

× systemd-tpm2-setup-early.service - Early TPM SRK Setup
     Loaded: loaded
(/usr/lib/systemd/system/systemd-tpm2-setup-early.service; static)
     Active: failed (Result: exit-code)

systemd-tpm2-setup[542]:
WARNING:esys:src/tss2-esys/api/Esys_CreatePrimary.c:401:Esys_CreatePrimary_Finish()
Received TPM Error
systemd-tpm2-setup[542]:
ERROR:esys:src/tss2-esys/api/Esys_CreatePrimary.c:135:Esys_CreatePrimary()
Esys Finish ErrorCode (0x000009a2)
systemd-tpm2-setup[542]: Failed to get or create SRK: State not recoverable
systemd[1]: systemd-tpm2-setup-early.service: Main process exited,
code=exited, status=1/FAILURE
systemd[1]: systemd-tpm2-setup-early.service: Failed with result
'exit-code'.
systemd[1]: Failed to start systemd-tpm2-setup-early.service - Early TPM
SRK Setup.

