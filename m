Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A20B168AE8
	for <tpm2@lists.linux.dev>; Tue,  7 May 2024 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097708; cv=none; b=MnwLLdq+8jOOHv9i/xvQ8QSJCr6P4BNCKOyzx6gh5wZqPbyoTS1DQqU0Kk1NAqgbPxX695L16j5mp5+bF0WkgRVF2ORUZ5iWxFLUU3mZQJLostMUZMYz64D4lW4o+bFHPwpzt/UoChtidcz2S06fAK32uffIkM53hfrCW+oSAtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097708; c=relaxed/simple;
	bh=lEffRWfvpnSablTGrFHUd3/fr6iSqpVuzzN+haaOfC8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LjIEzk08sKIzvs6h6/a6JFbbRHkAr3tUuPku3VTVNx6eMtvEvcEkjwe015QtDoqjqxyu7DHcwNCHVurJY6Jzp9rfFTeeBm7JP+Yt/3fnHW9/wDqxQ1rZHgItiFcvQVFnOE0Lu4uatyeghmh+RN85tONTNuqM5+qguKMLPdD0KDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=pbVtT4gB; arc=none smtp.client-ip=217.10.52.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="pbVtT4gB"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1715097707; x=1746633707;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=lEffRWfvpnSablTGrFHUd3/fr6iSqpVuzzN+haaOfC8=;
  b=pbVtT4gBSNa9WFULoAXM69XKUj8Oc/j0FR8kEMXiDidhRBPYfSg6r/za
   tgRKXpwe6VQlhK2TqmVqIq1yP34pHCwG3QCiS4pofxWDr/dyO9zgB/ajU
   jD2Y7bGxDA9cIncQNLAHypQKPvrQtAvtKpzrEiTO8jXt7t4PmMLumLwTc
   o=;
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="18492441"
X-IronPort-AV: E=Sophos;i="6.08,142,1712613600"; 
   d="scan'208";a="18492441"
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 18:00:36 +0200
Received: from MUCSE842.infineon.com (172.23.7.71) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 7 May
 2024 18:00:35 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE842.infineon.com
 (172.23.7.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 7 May
 2024 18:00:35 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.1118.040; Tue, 7 May 2024 18:00:34 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: tpm2-tss release 4.1.1
Thread-Topic: tpm2-tss release 4.1.1
Thread-Index: Adqgl6lOIBR2UjhgTHy1EmhBFkXBcA==
Date: Tue, 7 May 2024 16:00:34 +0000
Message-ID: <7c7f4aa4787846ad848a1e6dd34e55ab@infineon.com>
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

I just released 4.1.1 for tpm2-tss.

It fixes a problem with a few files not being included in the dist tar ball=
 as reported by Gentoo (thanks for reaching out).

Thanks a lot,
Andreas
