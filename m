Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22A24CB2E
	for <tpm2@lists.linux.dev>; Wed, 15 May 2024 08:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715761489; cv=none; b=t+kjyPLfHhBvAyGmsvHp6j/7dW3xK4TO8mGzLOZCYNrBDzN6kQlxv/9Osq5ByYix9nT2IuXJxcIIkBOiYr9FjfL2az7oReZM3I9blA0BGGrs9O6uPAu/27ZCrFrw/UTO/yzmiy6h6eslE4PBUMDnByyxdXqEv6pD/JNTzUvAUN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715761489; c=relaxed/simple;
	bh=GnoKXgvkUPu03y/tdVQA/Z1O62tfxL0nJcMwmNyHm6E=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Vg4JQX7T9t69kjlzzz0r+Dk6r5KK6MjP4hJtEwWMeWBsHjZ5azkteWdBArXqesZ+82ZMfGeJgBFNSFd0Z7eayq+VwxNY3qtAw84QDu2qKnowTD8GZXOXbvarIsYTIP9bNRhCDOfDyFwXgyzQYBTxCjj6Uss2JqlYxCRGH5zf2EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=bTeK0Eo5; arc=none smtp.client-ip=217.10.52.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="bTeK0Eo5"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1715761488; x=1747297488;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=GnoKXgvkUPu03y/tdVQA/Z1O62tfxL0nJcMwmNyHm6E=;
  b=bTeK0Eo5q88zL/Jqm6DV/r6paCfN76CJyRvcHLFlWck6peQBJid0GO/Z
   Ys34EDQLgsSeKBu0PYlSrw7wWOB3W75duhvL6SBvKtVrt/z8++9+BOIkz
   u9pWkSwcFghEubGkifWAhj2yeDKVa8r3WWGVG1f4MRMxhVMV4BoVLu/60
   8=;
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="50981335"
X-IronPort-AV: E=Sophos;i="6.08,161,1712613600"; 
   d="scan'208";a="50981335"
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 10:23:37 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 15 May
 2024 10:23:36 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE843.infineon.com
 (172.23.7.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 15 May
 2024 10:23:36 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.1118.040; Wed, 15 May 2024 10:23:36 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: tpm2-tss release 4.1.2
Thread-Topic: tpm2-tss release 4.1.2
Thread-Index: AdqmoSNEoq2RHdbEQt66kp5wWyOcew==
Date: Wed, 15 May 2024 08:23:36 +0000
Message-ID: <f6840600fd6a41579884c336fa6bfae3@infineon.com>
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

I just released 4.1.2 for tpm2-tss.

It fixes a problem with the bash-style "=3D=3D" instead of the posix "=3D" =
for tests in configure.
Also got rid of which in favor of command -v.

Thanks a lot,
Andreas
