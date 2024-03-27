Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D31135A50
	for <tpm2@lists.linuxfoundation.org>; Wed, 27 Mar 2024 14:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711549191; cv=none; b=q0HUBURPOFx3PvnikFoEi6h/rQ70n4M/F92kwReND3z2NcEKtpw5pWV2znc0PxqLy576/NJwRMFMr/aAIxgEqrmUEQyopon2hQjsmZCQgn7e9HnKf9e0GKTNK9fbe8HDTGi43gp4srLLTziB/PZd+d+dU6DRFljNSu/4DOnwYiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711549191; c=relaxed/simple;
	bh=WDqrpo75kY2ID6fNQ/c5H6HkdT9EUmbnRbh+a6ASlps=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e72Zza+uLeApeZf69XNLGsaq1/pgQmXBglyxtfZv2iJZ9gyXNWGTxRnN1guNkWmNudxYmMIaoKqzKnyElXs91oTwM3A4jWRW7Rf6guKJK0wHQx8i1aauc3RDwaQpGrXrhsvFXKZZMFYDS0a4T12X/B+VmN8NCs4DKUMdmkZxYbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=R1pOUhnT; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="R1pOUhnT"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0C4B404EE
	for <tpm2@lists.linuxfoundation.org>; Wed, 27 Mar 2024 14:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.4
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwBTqdG6EGLE for <tpm2@lists.linuxfoundation.org>;
 Wed, 27 Mar 2024 14:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:18f0:1e00:4::5; helo=smtp11.infineon.com; envelope-from=andreas.fuchs@infineon.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98DA14015A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=infineon.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98DA14015A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=R1pOUhnT
Received: from smtp11.infineon.com (smtp11.infineon.com [IPv6:2a00:18f0:1e00:4::5])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 98DA14015A
	for <tpm2@lists.linuxfoundation.org>; Wed, 27 Mar 2024 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1711549188; x=1743085188;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=WDqrpo75kY2ID6fNQ/c5H6HkdT9EUmbnRbh+a6ASlps=;
  b=R1pOUhnTQEMYYMX+FbUhbM6UNpe6x3twT54WEc74zSXpNZP4DHFeOzJX
   Zn/UUTgU6YX67meunwg9y29GC/1fJOUfeTBsHMR/OOHhO3dcmdmidwB3d
   +Fj8oOahpfD4jQDHaig3A9zoDOioxjfK4FR0+xrcm6b97YPPKGByIqZ+a
   w=;
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="52822272"
X-IronPort-AV: E=Sophos;i="6.07,159,1708383600"; 
   d="scan'208";a="52822272"
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 15:19:45 +0100
Received: from MUCSE842.infineon.com (172.23.7.71) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 27 Mar
 2024 15:19:45 +0100
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE842.infineon.com
 (172.23.7.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 27 Mar
 2024 15:19:44 +0100
Received: from MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a]) by
 MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a%21]) with mapi id
 15.02.1118.040; Wed, 27 Mar 2024 15:19:44 +0100
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linuxfoundation.org>
Subject: tpm2-tools release candidates 5.7-rc0 and 5.6.1-rc0
Thread-Topic: tpm2-tools release candidates 5.7-rc0 and 5.6.1-rc0
Thread-Index: AdqATbuh5yW+tPuAQByZphHhyciYjgABAqnA
Date: Wed, 27 Mar 2024 14:19:44 +0000
Message-ID: <b548f418a2aa44c8999e25a6e555d42e@infineon.com>
References: <0c585d86b390413980a2a08db6f8b2c0@infineon.com>
In-Reply-To: <0c585d86b390413980a2a08db6f8b2c0@infineon.com>
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

I'm happy to announce the release candidates for tpm2-tools 5.7-rc0 and 5.6=
.1-rc0:
https://github.com/tpm2-software/tpm2-tools/releases/tag/5.7-rc0
https://github.com/tpm2-software/tpm2-tools/releases/tag/5.6.1-rc0

Happy testing.

Best regards,
Andreas
