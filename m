Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE282F5B
	for <tpm2@lists.linux.dev>; Tue, 21 May 2024 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716295670; cv=none; b=mEM5XM+bQZiguF+E8Ky2o3SN3CLluZrLGFK7M5O5KXPvWwypT4jWgKvjdm1Zll/o15gEOfuOYkyqK98wMJsA8XL3NYGagdAw+xqVAfSPeGm+NaBKBdrgnQjkOEetWUqGS2JhLn7e7qTIsJqrpUXLK/37lO5pvKZmFVMEcEUISnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716295670; c=relaxed/simple;
	bh=ul5JPDyGCW6nkzvk2a1HHlyVsyqOjTJfDYm0h+yoQuI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=d8mNCMPjbbx77koCpauINPzKce18bfvARk5hmbbtLbRL3sx1s5t12cc7+HQvG4fEoxDIkIFwuaBCFNmoLTjRv+sGECcUdXZUGGlOnZbuVTyy+HSb8OKXAt3kcN7bhYa2ZuT+2kT0U5+E5E//0gDTi5v+TPSaW2ihh74WTrm11jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=LfSJlOJ1; arc=none smtp.client-ip=217.10.52.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="LfSJlOJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1716295669; x=1747831669;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ul5JPDyGCW6nkzvk2a1HHlyVsyqOjTJfDYm0h+yoQuI=;
  b=LfSJlOJ1ZpHT1u+0kU9ibcaqEA2lLw/OsAyBDOj9oOQUwihNSKsGKyVb
   Ny8/kOxg638PDAFlJXJFh0aoBPtmPb9sHPb5xgQtKgd9GFTrDs09nb16w
   yp1FYTf5zeuvXqOwEXUA/Fv2u8UOWV1w6juoaGcGHKEWCmVJ6dcAh9pS3
   o=;
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="58065977"
X-IronPort-AV: E=Sophos;i="6.08,177,1712613600"; 
   d="scan'208";a="58065977"
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 14:47:41 +0200
Received: from MUCSE844.infineon.com (172.23.7.73) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 21 May
 2024 14:47:40 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE844.infineon.com
 (172.23.7.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 21 May
 2024 14:47:40 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.1118.040; Tue, 21 May 2024 14:47:40 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: tpm2-tss release 4.1.3
Thread-Topic: tpm2-tss release 4.1.3
Thread-Index: AdqrfP329Cfo1dtgS0m1Z5esMtW/Eg==
Date: Tue, 21 May 2024 12:47:40 +0000
Message-ID: <e13ee110937342acadf8e84deb10a7ba@infineon.com>
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

I just rolled 4.1.3 of tpm2-tss.

This fixes some namespace problems with some dlopen() implementations.

Best regards,
Andreas
