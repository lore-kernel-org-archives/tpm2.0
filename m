Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7604508F7
	for <tpm2@lists.linux.dev>; Wed,  8 Jul 2026 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515419; cv=none; b=QqAjDM6BcgiDWeLmiTQNS0HqzYNF5tBjTQvpJkkFuMkZMXVy6R378bUj2A411fJf2clT+oZ0XxACTaHPVv31pRSKJAolvhfg0dQDMYiZulLEg8t+a79S9WEVuMrLTod2iDNCiPrx24U1zVdo13iSop5GW4YMg3euHn6GwLZIo7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515419; c=relaxed/simple;
	bh=8QA3Jr3v5b0Ws8YZwaswwJI7OcrWZUuRL6O3PwQvaOM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AGy9Syi7UnCqVPGjgbsnPxKiwZD42MQppl4lPwNUoyPz96c58BAoX6xVo8tZVngbu1dozcYysAfMgJZjSv1Lx31PQkJLgzQQL2ke5IavitAW5BXKDMYVMUbd4wptzMXfev+85sfxq7ghwY7R03an4Dh5DINiFQfVyYQeACFot00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=Q2jqlOf9; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="Q2jqlOf9"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1783515418; x=1815051418;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=8QA3Jr3v5b0Ws8YZwaswwJI7OcrWZUuRL6O3PwQvaOM=;
  b=Q2jqlOf9AgOPNAG6eCs+PVhl3W3m7Dq1espppiM9/ESNhk/G5pscOS+b
   i7K7NL0QNkAVJlxNT7KQiM6P8tX1O/3qhe+S9IQ2+tgT4bXHp1pthKWrt
   XYp1smO87pTGm1TI3TnSJt01uyuznCFbysigtmOx4HlDTnxb21IgvAZKZ
   s=;
X-CSE-ConnectionGUID: pu1/6OpOQpuoP1Y2ICpP/A==
X-CSE-MsgGUID: /2DnaBy+TSCqlnDyoLICow==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="166557652"
X-IronPort-AV: E=Sophos;i="6.25,153,1779141600"; 
   d="scan'208";a="166557652"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 14:56:55 +0200
Received: from MUCSE841.infineon.com (172.23.7.70) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 8 Jul
 2026 14:56:54 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE841.infineon.com
 (172.23.7.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 8 Jul
 2026 14:56:54 +0200
Received: from MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a]) by
 MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a%21]) with mapi id
 15.02.2562.043; Wed, 8 Jul 2026 14:56:54 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: [SECURITY] tpm2-tools 5.7.1-rc0 and 5.8-rc1
Thread-Topic: [SECURITY] tpm2-tools 5.7.1-rc0 and 5.8-rc1
Thread-Index: Ad0O2QmkfxrSeKbOQyudeLjxQDk5sg==
Date: Wed, 8 Jul 2026 12:56:41 +0000
Deferred-Delivery: Wed, 8 Jul 2026 12:56:22 +0000
Message-ID: <fad8608aa904425faab9c165cd4682c4@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi all,

I just tagged https://github.com/tpm2-software/tpm2-tools/releases/tag/5.7.=
1-rc0
and https://github.com/tpm2-software/tpm2-tools/releases/tag/5.8-rc1

Both contain some security fixes.
As such, I'm planning to do the final release "very soon" i.e. beginning of=
 next week.

Happy testing,
Andreas
