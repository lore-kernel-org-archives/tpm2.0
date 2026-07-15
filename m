Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3272B2931C6
	for <tpm2@lists.linux.dev>; Wed, 15 Jul 2026 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129128; cv=none; b=SNR9PfEX63Atv265akGf4dJS82btU1Q1TyWnfKmQ+9G3Or2wzzXrFAIOsoh4GILDu8xImGs1Ov3oyJOSFNLvfizTRHYXaVFDLRfv/698J6ydVMvinqcMi2xDengevRqnYen1krgHzI+wWuC6+W30Rltzfit/uXJ0Vz7qHGmyurY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129128; c=relaxed/simple;
	bh=W8LZbeezjiXIdfI8fbV3ivEP3pUbhZdOasDDpE+mIK4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XZQmr13lHwHxgN4O02nijqQz6nbPajVOBr2VllHXBxI6NfFdnsnFDq+o2j/Y82PFafGRpJPASLyGn36nY+inKL8YNeD5KXHHfIvYRvgBh6h6l3rWVrxWE9wScux2FsnJPO00pMkb48KaFnZ4L2TL/RZnwht1deVXaudvd3ZrxpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=Nx8MoJ4M; arc=none smtp.client-ip=217.10.52.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="Nx8MoJ4M"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1784129127; x=1815665127;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=W8LZbeezjiXIdfI8fbV3ivEP3pUbhZdOasDDpE+mIK4=;
  b=Nx8MoJ4Mn5k02zWQLKVb7jEVvXh3/kw1V2EvHIvLZI96qsnHvkxPqKwM
   D/PWwJhFmdf+YtghK4C8klCKGZNm6pE19sEFVSqfogRe3pxr/UcWx43pN
   A7yADfXud8NNahDZUa+Z4qkJrJlnbJBvEi/8SKKhuDybrGEAAgf3dCWq5
   M=;
X-CSE-ConnectionGUID: 65pX2N5LRiy8VlBD88z5LQ==
X-CSE-MsgGUID: T70YEsNITCea7maixy1/nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="151759874"
X-IronPort-AV: E=Sophos;i="6.25,165,1779141600"; 
   d="scan'208";a="151759874"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 17:25:24 +0200
Received: from MUCSE842.infineon.com (172.23.7.71) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 15 Jul
 2026 17:25:23 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE842.infineon.com
 (172.23.7.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 15 Jul
 2026 17:25:23 +0200
Received: from MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a]) by
 MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a%21]) with mapi id
 15.02.2562.043; Wed, 15 Jul 2026 17:25:23 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: [SECURITY][RELEASE] tpm2-tss 4.2.0 and 4.1.4
Thread-Topic: [SECURITY][RELEASE] tpm2-tss 4.2.0 and 4.1.4
Thread-Index: Ad0UbZxISwRNBjAqQXywZJ0SXVgMQQ==
Date: Wed, 15 Jul 2026 15:24:58 +0000
Deferred-Delivery: Wed, 15 Jul 2026 15:24:49 +0000
Message-ID: <31df17559ce44ff6bcc5d5a5d38b7750@infineon.com>
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

I just tagged and released
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.2.0
and
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.4

Note that these fix several Security Advisories.
Also, note that CVE-IDs have not been assigned yet, since the workflow of t=
he GH CNA increased from 3 days to 3 weeks.
Once the CVE-IDs are assigned, I'll update the changelog accordingly.

Bests,
Andreas
