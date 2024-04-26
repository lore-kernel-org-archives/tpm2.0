Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2728147C89
	for <tpm2@lists.linux.dev>; Fri, 26 Apr 2024 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714139186; cv=none; b=Y8DeV/nLscVd8R8UqSYdPDyIqinSgqP4bac4McnX1hilTZXE1DGfovgZ42jLzuG6z7Zj2w24LH61BdSI6Ynwy6v5rd07hzCZj/0kRTgmhj4XhRgQ3AAqWT7dEPC573oWQdmQXrWbDGf1r7xGMjKESKG0DYF5d1RmSrB74U/GR2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714139186; c=relaxed/simple;
	bh=aAqtaKKWiO1lAx8jrbAUOgolctxEGgV2RJjrI8aVWUs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pmn3/7LjpHClCuuw1TZQMQMxPep07VtJOJo2ZScgDQJer3kx2xVCpQsol5jpZ4LWaBEpt4o0ppAMNYR21/S0Qp6PMTwR09vnzBaV+clYyGF3MMVEriPm5dSIKqgBukh+UM4zR+EGcW0V6NviTaejPDuj+xywesL2Zk0oc/zi9LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=Z+jo6svi; arc=none smtp.client-ip=217.10.52.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="Z+jo6svi"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1714139185; x=1745675185;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=aAqtaKKWiO1lAx8jrbAUOgolctxEGgV2RJjrI8aVWUs=;
  b=Z+jo6sviFzGqWgNYTs3+8kJtmtKweZpqFDSRFMnBTsVNFHWCFDpgTEtK
   cA+XylsRRA6lVf2VvxCX2qqPdq81DOqKVkSLRjKKePordjxPIIA5erZYG
   kmE2LhWlkTRZbSmgKF62voNDNEQQ3IHFESOpcZf6Vat6SbDKg8LkFXrBz
   k=;
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="49449126"
X-IronPort-AV: E=Sophos;i="6.07,232,1708383600"; 
   d="scan'208";a="49449126"
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 15:45:13 +0200
Received: from KLUSE842.infineon.com (172.28.156.183) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Apr
 2024 15:45:12 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by KLUSE842.infineon.com
 (172.28.156.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.32; Fri, 26 Apr
 2024 15:45:12 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.1118.040; Fri, 26 Apr 2024 15:45:12 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: tpm2-tss release 4.1.0 4.0.2 3.2.3 (Security Fixes)
Thread-Topic: tpm2-tss release 4.1.0 4.0.2 3.2.3 (Security Fixes)
Thread-Index: AdqX3+7E49CIkYgWSbSBKNI+OI6+eg==
Date: Fri, 26 Apr 2024 13:45:12 +0000
Message-ID: <e56907a5be7345fabc245cf1074541fe@infineon.com>
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
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.0
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.0.2
https://github.com/tpm2-software/tpm2-tss/releases/tag/3.2.3

They include a fix for CVE-2024-29040.

Best regards,
Andreas

