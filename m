Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E76477119
	for <tpm2@lists.linux.dev>; Fri, 10 May 2024 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715331183; cv=none; b=CBKJ0uvtu11xnGXzD/XweOaiAs/udza5IvgHNQBp/VVMNXRim7D6AUrM8mosCQQaYlEMObyDFXr+pfjpTvwngQIvHQNbUpb6k9Art//K/xOnK/4SpXDewlgWyzxG3GyMLFlis5RGCHKRSasUq8uYy6PSMNsc07eLRsBh2ZnrcvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715331183; c=relaxed/simple;
	bh=3OkjiKCd2QijM4zke7cf/G9Xiz6a3EQYzg4+DEeh0ao=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZR1UhiiSE9Tkr1l6ktiQu+VF+Wo9u7tJjl2/YsOCb7paXP5kzkflBXC3Vo49mVFQ366Ght1lZk/dCSG7sBbwbCWBot3HYGXJGl6eo4HtkkZIU+EC/fAuAJS2d5hjRGmNEDPuwVz3lH1zdK9774nGtLhPlB+Sx+OoV6Jd50mpAjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=eL9YW64T; arc=none smtp.client-ip=217.10.52.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="eL9YW64T"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1715331182; x=1746867182;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=3OkjiKCd2QijM4zke7cf/G9Xiz6a3EQYzg4+DEeh0ao=;
  b=eL9YW64Tx3twvGMKu5qMOGBtxHaZXwqnIR5igHd/tJgPdRzmfbgTJ6V2
   GXFFjaE92eBVigABOZY2hj61PUMYmG/ge+yRLsD8T2B9vdTRNZoiqB7j/
   W17vrsgLV9WP3hf/b10ujoTLVd9PNfUeMlY08d2s4GieIFgnhpfR0AIZO
   8=;
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="57030606"
X-IronPort-AV: E=Sophos;i="6.08,150,1712613600"; 
   d="scan'208";a="57030606"
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 10:52:54 +0200
Received: from MUCSE844.infineon.com (172.23.7.73) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 10 May
 2024 10:52:53 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE844.infineon.com
 (172.23.7.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 10 May
 2024 10:52:52 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.1118.040; Fri, 10 May 2024 10:52:52 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: tpm2-tss release 4.1.2-rc0
Thread-Topic: tpm2-tss release 4.1.2-rc0
Thread-Index: Adqit3C8C3GACCGZRaCwSKpkqdwg1g==
Date: Fri, 10 May 2024 08:52:52 +0000
Message-ID: <3360a921be234d51b2c195dac3a6705d@infineon.com>
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

I just released 4.1.2-rc0 for tpm2-tss.

It fixes a problem with the bash-style "=3D=3D" instead of the posix "=3D" =
for tests in configure.
Also got rid of which in favor of command -v.

Please provide any feedback you might have. I want to roll release early ne=
xt week.

Thanks a lot,
Andreas
