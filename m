Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B84403EA0
	for <tpm2@lists.linux.dev>; Mon, 13 Jul 2026 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944478; cv=none; b=s5PstdIlNrmGqEk1UBA6SkBVfJFa0qSr4f6TukBHZLM7f3SLJ99dcoUrVgpaE5clnUYVl6QzgTvdP1vYAQhp2zzoxQLK7F/OID1PZunm1BJnOt+qrdoB2l4zJ+2uBX5ejf21p7w2sPo+/RD0Gcbr261mvl7GmJa3/YdS687OfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944478; c=relaxed/simple;
	bh=9dRHIn9wNSrETVi/XvNjG6ZJqWdzbkc+L+fXFU7+9MI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P5ZRljm3XppGSaRUCD3PFFxtsLioiY3fZGsINjIr2GcLp85BfRJ/NUQnsArL6cZFPrayvSM/z3yaX79Y87YIC2dI1NQnKuAaRvhHAFdyYs8aanaRJ2UAWDUXmDu5jxuZCfMdQRHK+oaYyLOcmv55W4lQhkqIF5+5tOi/EknsRCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=NnJcZksj; arc=none smtp.client-ip=217.10.52.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="NnJcZksj"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1783944477; x=1815480477;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=9dRHIn9wNSrETVi/XvNjG6ZJqWdzbkc+L+fXFU7+9MI=;
  b=NnJcZksj9s9b5ek6fuUpTCbXHdI4T3P3zFUWr31t/FsbvmknZybE6iI3
   upqVyr8ZtBNFsnt7Y9NfVftQwszezsMpdvkTY85fgTy4wfI7FXjtUBWE/
   e0XG5+78k6ejB7bMJUNDDlQVb5IdhF9gdpEpI+lfVCtzTZjr7ptBrfAz/
   w=;
X-CSE-ConnectionGUID: bGqMWUpJQTev6BZh4WE6uQ==
X-CSE-MsgGUID: vcik3CnPTn+VMYXvh7Ff1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="151375625"
X-IronPort-AV: E=Sophos;i="6.25,154,1779141600"; 
   d="scan'208";a="151375625"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 14:07:49 +0200
Received: from MUCSE842.infineon.com (172.23.7.71) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 13 Jul
 2026 14:07:48 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE842.infineon.com
 (172.23.7.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 13 Jul
 2026 14:07:48 +0200
Received: from MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a]) by
 MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a%21]) with mapi id
 15.02.2562.043; Mon, 13 Jul 2026 14:07:48 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: tpm2-tss 4.1.4-rc1 and 4.2.0-rc2
Thread-Topic: tpm2-tss 4.1.4-rc1 and 4.2.0-rc2
Thread-Index: Ad0Sv9bxy5ZC0enTRE+yV2NTJ/5HTA==
Date: Mon, 13 Jul 2026 12:07:28 +0000
Deferred-Delivery: Mon, 13 Jul 2026 12:07:01 +0000
Message-ID: <222f89d45e934f63a288986bcfc5c962@infineon.com>
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

I just released
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.4-rc1
and
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.2.0-rc2
with two minor fixes.

Please test and provide feedback.
I'll release the final versions, as soon as Github assigns CVE-IDs to our a=
dvisories.

Best regards,
Andreas
