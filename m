Received: from gmmr-1.centrum.cz (gmmr-1.centrum.cz [46.255.225.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6EA25A2C6
	for <tpm2@lists.linux.dev>; Sun, 19 Apr 2026 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.225.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607112; cv=none; b=p+HPxRq4KJO4sgD6kEQMNpLugW80xJ1QQ6pJB9y9RV1v79JJOcW1ZYREbwJDrtQb/nmyZSYGYcGUcjwnvsmGAw0zr86VP9HEn9hiO/mp4HynCNkWFOGhyplaIPp7lwlly3CCH5j19Uin0hyT9u2NUWEQtweDhproZPBYBE60U2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607112; c=relaxed/simple;
	bh=gef2G4hJIGjPbYeb+0oUoro2Xt8LsyQfgHBk82PIZgc=;
	h=Date:From:Subject:To:References:In-Reply-To:MIME-Version:
	 Message-Id:Content-Type; b=Bk/IV6Pt69dyA9KRaLc7xikQZL87XZR5a4Xldms6zFM4Jg050jIZPfOh21xnrrCI5Bd/i1+QT5dYyZNptUMCcZQT8c6jQzGJ/S3dPJOw5N6/OdqPORxdaye4G5QLfJXjrf0akiUP2gZ777yE9OmhoVHJMclw7gPc4yQvHUt4TBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=centrum.cz; spf=pass smtp.mailfrom=centrum.cz; dkim=pass (1024-bit key) header.d=centrum.cz header.i=@centrum.cz header.b=KnxUvZUr; arc=none smtp.client-ip=46.255.225.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=centrum.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=centrum.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=centrum.cz header.i=@centrum.cz header.b="KnxUvZUr"
Received: from gmmr-1.centrum.cz (localhost [127.0.0.1])
	by gmmr-1.centrum.cz (Postfix) with ESMTP id E2D4623D73
	for <tpm2@lists.linux.dev>; Sun, 19 Apr 2026 15:56:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centrum.cz; s=mail;
	t=1776607000; bh=gef2G4hJIGjPbYeb+0oUoro2Xt8LsyQfgHBk82PIZgc=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=KnxUvZUrpoH/WSWVdtcb3QrEdvyspvFny5fLhfPhibO0WEj5sLVjnCciq8tcloxyJ
	 Th8+r043Kln5UR0Dfq9RqAT5YWgwgK7QgBfu8Y8mHcoQfL52Jg1DFTRXSxx1IL+tvn
	 G2wQcQv2I3F8cx2vLEaEeHx/9r7nPZlLN1X0IgvE=
Received: from antispam67.centrum.cz (antispam67.cent [10.30.208.67])
	by gmmr-1.centrum.cz (Postfix) with ESMTP id E189C424
	for <tpm2@lists.linux.dev>; Sun, 19 Apr 2026 15:56:40 +0200 (CEST)
X-CSE-ConnectionGUID: IxeiNNLsQyWtIcg5z9drmg==
X-CSE-MsgGUID: zU99JQ93TLqmzW4YWIXrxg==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2FBBQD23eRp/83j/y5aglmDSIFqHQFdqSCIeYNUCQYBA?=
 =?us-ascii?q?QEBAQEBAQEJPRQEAQEDBIIMgnQCjS0oNwYOAQIEAQEBAQMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBCwEBBgEBAQEBAQYGAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEXAg1+BjpPBUxWBiSCcoI5ATkUuAOBNIEB3HgFgSIfgWoGgU2FcYJKHAEFb?=
 =?us-ascii?q?oUCAYR6NoFVRIEVhkkCgi2DSIIvBIIigQ6PE4FKHANZLAFVExcLBwWBZgOBB?=
 =?us-ascii?q?m4yHYEjPhc0WBsHBYFLhl6BE4M5gQwDC209NxQbBItnIoIZgVovlUojkRmCI?=
 =?us-ascii?q?J8lNAeEH4FeBgyCXoYqgSaIYYxZBEmqagGZBo4JlWAThUUDAYF6ggBNg1tRG?=
 =?us-ascii?q?Q+SIsMdeD0HAgcOApF1LQWBSwEB?=
IronPort-PHdr: A9a23:UC/6ZhOmLZXa6i4c5jEl6nYYChdPi9zP1u491JMrhvp0f7i5+Ny6Z
 QqDvqgr1AeCANiEuroE07OQ7/u8HzRYoN6oizMrTt9lb1c9k8IYnggtUoauKHbQC7rHSRJ/N
 +l5EGFfwnegLEJOE9z/bVCB6le77DoVBwmtfVEtfre9FYHdldm42P6v8JPPfQpImCC9YbRvJ
 xmqsAndrMYbjIViJ6or1hfFvnREduRWyG5qIV+YghLw6tut8JJ5/Cldtf0s+9RcXanmeqgzU
 KBVAikhP20p68LnsgXOQxGS7XUGSGUWlRRIAwnB7B7kW5r6rzX3uOlg1iSEJMP6Vb86Vyyt4
 KtyVhLmhzoJOyY2/2/LhMNwirlboA+6qBxk34HUeoCVO+Fgca7bYNgXWHBOXsdVVyxGH4O8c
 44CBPcPMOpEs4XwoUYFoB2jDgeuGezv0CdFiHH206MnzeohHwPJ0hYvENwNrHvao874NLsQX
 O270KXE0SnPY+1Q1Dzg6IbIaBchofSUULxqb8XR1VMvHB7EgFWXtYzlIzOV2f4Xs2eG8uFtU
 vqvhHA7qwFruDSvycAsipXVhoIV0F/E7zh2zZ0pKtKmTk57fcSkEIZVty2AK4R3Q9ovTmd1s
 yk11rMIo4S0fDQWyJs53R7fbeSKfYiG7B/9VuucLyl1iG95db6jmRq/7Umtx+/4W8SqzVpHo
 DZJnsfMuH4N1RHd5caKR+dh8kqhxzuCyg/d5/1HLE0yiKHVJZkhwrsqmZoSt0TOBiD2mETqj
 K+Wa0Ur4fKk5PjgYrXjoJKXKox6ihnmP6khm8GzG/o0PwgOUmSB5+iwyr/u8VfnTLlWjvA6i
 qrUvZDAKcgGoqO0DRVZ34gs5hqlDTqr39IVlmQdIl1fYhKIlY3pNknLIPD/EPiwnUyhkCxux
 /DaJr3hBYjNLmTbnLfhY7l970lcxRI8zdBa4pJUEKgNLf3pVkDtqtPYCAM5Mxapw+biEtlyy
 oIfVXqOAq+fLqzSrUeF6+0uLuWWeoMYuDbwJ+I76/Lwj3I1g0ERcbWp0JcPbXC3BPVmI0GXY
 Xr2hdcBFH8HvhIgQ+z2kl2OSzFTZ3GuX6Ig5jE0EpimAprYS4+xnrOB2ju7HodLZmBDEFyDD
 Xbpe52eW/gQcCKSPtNhkjscWLi9U48h0A+iuRT+y7pmNerU5jYYuYjn1Nh04e3TiB4z+SZpA
 MuDzWGBV2d0kXgQSD8swK9/uVB9ykuE0aVgnvBUDcZT6O1XUgk5L5DR1+N6C9X3WgLbZ9uER
 0yqTcm4DjE3UtIx2cIOY0NnF9q+jxHPxzelA7wUl7yOHJE66q3S0HbvKchh13vI0rEtgEQjQ
 sRVL22pmrZy+RDKCYDRnEuVj72qdbwS3CPV7GmN1HKAsk5AXA5rSaXFU2gQZkvIotT94UPPV
 6egB60/PAVOmoa+Lf4edsXs131CRez/I5LaYmSsiyG8CAjelZ2Wa4+/Q2gBxm3yD1QYkwkJ8
 T7SLQUiHGGupH7CDDV0GXrkbkXw6/R77nipGBxnhzqWZlFsguLmsiUeguaRHqt74w==
IronPort-Data: A9a23:Gy+4+q7CpRT7z4inlmRU5AxRtHnGchMFZxGqfqrLsTDasY5as4F+v
 jMZUGHVbPvfYGb8fYt+PNu/8UJTuJOEmNEyS1Zk+Cs0Zn8b8sCt6fZ1j6vT04F+CuWZESqLO
 u1HMoGowPgcFyGa/lH3dOG49xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYHR7zil5
 5Wo+KUzBHf/g2Qqaj5NuvrawP9SlK2aVA0w7wFWic9j4we2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauO60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 v0W7MDtFl15VkH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCSAAbzalo/mP0Y2na+Jj29ZyINPuM9ZK0p1g5Wmx4fcOTpXGWeCWo9RV2isqm8UIFuS2i
 8gxNWQpNkmdJUcVZRFNUM9WcOSA3xETdxVApU6P46Uw/3TTxRZ9+LPgNsbPZ9nMTtc9ckOw/
 ziboD2nXkxKXDCZ4Si4oyOOv76UoQfiXZAtSIyH185wkFLGkwT/DzVTDzNXu8KRlla7AfpbK
 lcI4WwqrK4v5AqnQ8eVYvGjiHGBuwRZB5xbHusm8hyIjKHGi+qEOlU5ovd6QIROnKcLqfYCj
 zdlQ/uB6eRTjYCo
IronPort-HdrOrdr: A9a23:lMBtFaxOoplbZ2F4mX4NKrPwLL1zdoMgy1knxilNoHtuA6qlfq
 GV7ZMmPHDP5Qr5NEtNpTnEAsm9qBDnhPtICPcqTNOftWDd0QPCRr2Kr7GC/9SKIULDH4Bmu5
 uJpcNFeb/N5CNB/KXH3DU=
X-Talos-CUID: 9a23:F6WRWW+67NBOV33XyLGVv28EF8EDVFnG9WbvP26zBjt7GbGPTFDFrQ==
X-Talos-MUID: 9a23:Rk7BSQWlqy/37dHq/C3R1WBADZYz34C3DVIyzaQ5mvmeJSMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,188,1770591600"; 
   d="scan'208";a="125716458"
Received: from gmmr-4.centrum.cz ([46.255.227.205])
  by antispam67.centrum.cz with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Apr 2026 15:56:40 +0200
Received: from mail1010.cent (envoy-stl.cent [10.32.56.18])
	by gmmr-4.centrum.cz (Postfix) with ESMTP id A057E7F45
	for <tpm2@lists.linux.dev>; Sun, 19 Apr 2026 15:56:40 +0200 (CEST)
Received: from 85.193.34.74
	by mail1010.centrum.cz (centrum.cz multimail) with HTTP;
	Sun, 19 Apr 2026 15:56:40 +0200
Date: Sun, 19 Apr 2026 15:56:40 +0200
From: Petr Gotthard <petr.gotthard@centrum.cz>
Subject: [RELEASE CANDIDATE] tpm2-openssl 1.3.1-rc0
To: <tpm2@lists.linux.dev>
References: <20250108223635.6D4AC965@centrum.cz>
In-Reply-To: <20250108223635.6D4AC965@centrum.cz>
X-Priority: 3
X-Original-From: =?utf-8?q?Petr_Gotthard?= <petr.gotthard@centrum.cz>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260419155640.BD3BD5A6@centrum.cz>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

I would like to announce the release of tpm2-openssl 1.3.1-rc0: https://github.com/tpm2-software/tpm2-openssl/releases/tag/1.3.1-rc0

This is a bugfix release:
 - Fixed compatibility with OpenSSL 4.0.
 - Fixed the ECDSA signature algorithm to omit the parameters field (thanks to @smhmeier).
 - Fixed cipher padding validation according to PKCS#5/PKCS#7, so zero padding is now rejected (thanks to @hyperfinitism).
 - Fixed buffer indexing for block ciphers without padding (thanks to @hyperfinitism).
 - Fixed cleansing of sensitive data upon buffer deallocation and fixed buffer allocator consistency (thanks to @hyperfinitism).
 - Fixed missing NULL checks and harmless type cast errors in RSA and ECDSA algorithms (thanks to @hyperfinitism).
 - Fixed semaphore destruction (thanks to @Deadolus).


Kind Regards,
Petr
