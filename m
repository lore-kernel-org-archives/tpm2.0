Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3089B381BE
	for <tpm2@lists.linuxfoundation.org>; Wed, 27 Mar 2024 10:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711534561; cv=none; b=g2phvylEAjD8vFxliXHRCbSdh29WnzYD3SP6XiG08zEBOyabUWZHJUrtCS57cuqOKjuTtmLNAcbmGfliFDkq9HY1CVvoFknpRxqUphFirgJiXEyhh/ONhf6uErmryV27YYlhWXU6uOm28eiaQitffQKDAkRZ/pitjVTxIcO3AGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711534561; c=relaxed/simple;
	bh=Fr4QJcyKQ96AEBVcX0mIS+mQL1Vo47gXCUKgKYL5e7Y=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UZ2G4D5zdOSpxjbZTaOb2eKxHrwkLGU3h0qmw1tSfsZF0819YV6NEBwrn8OCJho9Hg2ea8QTPfhvgDT2Okc5Ke9/v+tm3jTOO5Q0UCTD0xunaL49Fxml2OyU1fRuSHBqedXaeelxAWyXMPMpSgFQUlR2IzIyCj4IEpZD2i7o7Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=mAgdNUrJ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="mAgdNUrJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4F7E40828
	for <tpm2@lists.linuxfoundation.org>; Wed, 27 Mar 2024 10:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfO7Ygk0tJEK for <tpm2@lists.linuxfoundation.org>;
 Wed, 27 Mar 2024 10:15:58 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 27 Mar 2024 10:15:58 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D26840800
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=infineon.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D26840800
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=mAgdNUrJ
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.10.52.204; helo=smtp9.infineon.com; envelope-from=andreas.fuchs@infineon.com; receiver=<UNKNOWN> 
Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3D26840800
	for <tpm2@lists.linuxfoundation.org>; Wed, 27 Mar 2024 10:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1711534559; x=1743070559;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Fr4QJcyKQ96AEBVcX0mIS+mQL1Vo47gXCUKgKYL5e7Y=;
  b=mAgdNUrJjeHL5GAqIiBpoSqe5lDsadCiS1EvF0i8nexZ2am9GebzPHBi
   bGAgiH+sSEfrWFjdQyZ6W7B8VdGaRYVjUguMSDKefQ+hyPrlkzDWyTWKv
   +tS5IwGGuZOcSO2W/Cd4ZCji7wViYGri9Qsdqxb1rsIzxnAv1DS+0JuBK
   k=;
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="15180185"
X-IronPort-AV: E=Sophos;i="6.07,158,1708383600"; 
   d="scan'208";a="15180185"
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 11:06:51 +0100
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 27 Mar
 2024 11:06:50 +0100
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE843.infineon.com
 (172.23.7.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 27 Mar
 2024 11:06:49 +0100
Received: from MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a]) by
 MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a%21]) with mapi id
 15.02.1118.040; Wed, 27 Mar 2024 11:06:49 +0100
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linuxfoundation.org>
Subject: tpm2-tss release candidates 4.1.0-rc0 4.0.2-rc0 3.2.2-rc0
Thread-Topic: tpm2-tss release candidates 4.1.0-rc0 4.0.2-rc0 3.2.2-rc0
Thread-Index: AdqALOqM8+AMVHViQCSbU6a1N7l/AgAAYTpw
Date: Wed, 27 Mar 2024 10:06:49 +0000
Message-ID: <3c41c840a3894557b57db572528b1593@infineon.com>
References: <5fd960dc6e4d446c92e3ec6706fb6b20@infineon.com>
In-Reply-To: <5fd960dc6e4d446c92e3ec6706fb6b20@infineon.com>
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

I'm happy to announce rc0 for the tpm2-tss series:
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.0-rc0
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.0.2-rc0
https://github.com/tpm2-software/tpm2-tss/releases/tag/3.2.2-rc0

Happy testing.

Best regards,
Andreas
