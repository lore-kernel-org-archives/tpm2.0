Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97455147C97
	for <tpm2@lists.linux.dev>; Fri, 26 Apr 2024 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714139169; cv=none; b=rTt3cOQ+cFHdN50lV5LYD1rnApSISN094VlWHros3Rdc+XikYB0Iey+Qbe8D+gpA8JLCqAHTgo2oCp9S2PlV4VQ8xu8CsbzuJUwjjfWt7HdqXSdS63l1y+nNUkYSkIY6UlJ8P43I2it1MKtbMiq5EIX9R0iwI9fm9Qz7PdYp9lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714139169; c=relaxed/simple;
	bh=Ki78rIdCS3B33PyquCKxJYdOTCHF5LwDU6hHxjAW9FI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HkDX+Yyyv/Dm2hHY2o1UP3CPQKhH4n8b50cUL8KvhYs92dlkdd/D30Qp2E2ljnYokTE62hl0RBuqwoEH94BSs31Ob0VI7kHEY6KFDNpEyaVB17o6TIRWnbPBRkufn4Ta7NQM3KWJnCv3M3oRvZnQ0FlF2mIihTi9Xmnn0aI368Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=PY8pZi/Y; arc=none smtp.client-ip=217.10.52.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="PY8pZi/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1714139165; x=1745675165;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Ki78rIdCS3B33PyquCKxJYdOTCHF5LwDU6hHxjAW9FI=;
  b=PY8pZi/Y78whajn3h1Om6KmHsevFO4sbN7R8zzOvew7l9VOQibIfVOTO
   CaeRhAlNMDp5mMRbkdmbQQhv4Y/oGVeI4PiPc4EcPAL1IF+5ksTjPrzQD
   mrRLOGcrw3HEF7E+3hWiHPWwSACwbiaMErJgESDm1Oop4b4gp1miitr8a
   w=;
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="17676279"
X-IronPort-AV: E=Sophos;i="6.07,232,1708383600"; 
   d="scan'208";a="17676279"
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 15:44:53 +0200
Received: from KLUSE842.infineon.com (172.28.156.183) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Apr
 2024 15:44:52 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by KLUSE842.infineon.com
 (172.28.156.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.32; Fri, 26 Apr
 2024 15:44:52 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.1118.040; Fri, 26 Apr 2024 15:44:52 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: tpm2-tools releases 5.7 5.6.1 5.5.1 (Security Fixes)
Thread-Topic: tpm2-tools releases 5.7 5.6.1 5.5.1 (Security Fixes)
Thread-Index: AdqX3+Hi564SbILNQDmvgIijs+Q6/A==
Date: Fri, 26 Apr 2024 13:44:52 +0000
Message-ID: <6fce8c075e8d4a1892021e344769373a@infineon.com>
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

I just released version
https://github.com/tpm2-software/tpm2-tools/releases/tag/5.7
https://github.com/tpm2-software/tpm2-tools/releases/tag/5.6.1
https://github.com/tpm2-software/tpm2-tools/releases/tag/5.5.1

That all close CVE-2024-29038 and CVE-2024-29039

Best regards,
Andreas=20

