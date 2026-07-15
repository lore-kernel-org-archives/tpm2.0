Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFAB480DE6
	for <tpm2@lists.linux.dev>; Wed, 15 Jul 2026 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129193; cv=none; b=ZaVqg8FSgFkWYrUmlLG/k5T/ffmtaN6bzlheUISZfewY3JFKs7ESPvswCYtaDVorgF6Fd7lA6QBYl+oQfGgO23I3ZCME8PfvdCOoVbBTD4+sCkDeAyBrD4KIq3sOcx2crH9+p3RJLAxks9PVjZUyHCswFeSXSZtv5W8io5z721k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129193; c=relaxed/simple;
	bh=UFz5q8XAUZqwG84VmHD4Qt8bQbUBvpt6enJ+NWF6Gd8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ecNcYSyX4flWVGyaFGTInhqd45fiZhBm09y8pwJIuuA5DF44aGvOuWLsrYGGecq1Vben60GK0bDIkzF3am2nkWw89kZo+EpXZ8w7+nzacUrMogGDZJFdEzYv9191qLePs2gVO7V0qoM3wrv3coNt2rafIHQSLa9PlUZO5UAHDfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=R8T4CDse; arc=none smtp.client-ip=217.10.52.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="R8T4CDse"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1784129192; x=1815665192;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=UFz5q8XAUZqwG84VmHD4Qt8bQbUBvpt6enJ+NWF6Gd8=;
  b=R8T4CDseWoyg4EJHCY2Jmu+PjNFi4Yg3xv/uHb8HwmcPlOEsQ944MyKY
   zA6IDaUYbAwMOVhU2WdrzaaxNvXfqm7Kk7Gdfp9wcDRWMQzivakjUizj3
   afWOAUqEIt4gGC7dYcR5FZBtXyHQwuRqvjS8gXvfc/93jCBxGWrZ2foNU
   c=;
X-CSE-ConnectionGUID: WTnoOVqDTX+b9OcW1313YQ==
X-CSE-MsgGUID: 1XPZYhdvTN2Y+dqSvoE7jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="101046431"
X-IronPort-AV: E=Sophos;i="6.25,165,1779141600"; 
   d="scan'208";a="101046431"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 17:26:24 +0200
Received: from MUCSE841.infineon.com (172.23.7.70) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 15 Jul
 2026 17:26:23 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE841.infineon.com
 (172.23.7.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 15 Jul
 2026 17:26:23 +0200
Received: from MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a]) by
 MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a%21]) with mapi id
 15.02.2562.043; Wed, 15 Jul 2026 17:26:23 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: [SECURITY][RELEASE] tpm2-tools 5.8 and 5.7.1
Thread-Topic: [SECURITY][RELEASE] tpm2-tools 5.8 and 5.7.1
Thread-Index: Ad0UbhfAPDz0jf/hShWkGXS0Q12jFg==
Date: Wed, 15 Jul 2026 15:26:22 +0000
Deferred-Delivery: Wed, 15 Jul 2026 15:25:56 +0000
Message-ID: <ff7c85b9e6b14f33896832b178750cf3@infineon.com>
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
https://github.com/tpm2-software/tpm2-tools/releases/tag/5.8
and
https://github.com/tpm2-software/tpm2-tools/releases/tag/5.7.1

Note that these fix several Security Advisories.
Also, note that CVE-IDs have not been assigned yet, since the workflow of t=
he GH CNA increased from 3 days to 3 weeks.
Once the CVE-IDs are assigned, I'll update the changelog accordingly.

Bests,
Andreas
