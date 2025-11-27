Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C94313534
	for <tpm2@lists.linux.dev>; Thu, 27 Nov 2025 15:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764257927; cv=none; b=Kp2LX5Bes4sQdFN5iAAC5F3MIXfRDz2FIe5UC+3xfVEC3rxEwpFO4JBFtVaxN6Iwt4kT8rWFEAdXO5TKn4lXrfnppl7qPK6iqZ+2kaum6gIAaOCpPxihVTQ1lSwwVfCejMgQA0Sfloa1tBho+6TKGVyWmZ8ciMc3eAxZbyN4KMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764257927; c=relaxed/simple;
	bh=jypQTN52GU6MTgQFbt1f19ibdTRgnwFqH0UwH3uKmMg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z/wYYquic198JivZFuNrDNHLmcg/aQ3m0riMzQp7fmw3e5L+4ujSqUb3x5MDUspuLoTyjHqcWVO5JoHho9kOs5OaBJUOUjpfsEGlzIS+UWLmOfoLcvPyfySB7ZN1klBpqwdVcpFlyg6sk7Z57zFxyAehqxo1ZdV3LEWF0RnZjt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=JAIEgRVx; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="JAIEgRVx"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1764257925; x=1795793925;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jypQTN52GU6MTgQFbt1f19ibdTRgnwFqH0UwH3uKmMg=;
  b=JAIEgRVxFzN546XLuXUxNs5w/9CSqST38QELzwawCoOnGb1FaujVtYcE
   Nebjc5UeHynQ55U3NM0QcXhkG3pl6JPfART8Zy4whMHjsRYs6+sDvHsoQ
   FHhiJQU7Z62C7c/WUkWqNkbpKjv6oE70igd/Lee9lUfB8FJL0ExbjyBxq
   8=;
X-CSE-ConnectionGUID: TKvQLRanRBm5Ofe6hrhp3g==
X-CSE-MsgGUID: p5z7aiB1TaG9PQH60YYuIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="133980804"
X-IronPort-AV: E=Sophos;i="6.20,231,1758578400"; 
   d="scan'208";a="133980804"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 16:38:43 +0100
Received: from MUCSE841.infineon.com (172.23.7.70) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 27 Nov
 2025 16:38:42 +0100
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE841.infineon.com
 (172.23.7.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 27 Nov
 2025 16:38:41 +0100
Received: from MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a]) by
 MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a%21]) with mapi id
 15.02.2562.029; Thu, 27 Nov 2025 16:38:41 +0100
From: <Andreas.Fuchs@infineon.com>
To: <david.halls@hp.com>, <tpm2@lists.linux.dev>
Subject: RE: tpm2-tss release question
Thread-Topic: tpm2-tss release question
Thread-Index: AQHcX68qXLCkAy+LvkePvsq2qjqwFrUGqDTQ
Date: Thu, 27 Nov 2025 15:38:41 +0000
Message-ID: <3b4bb9c6e7ee40698b01bb1759813763@infineon.com>
References: <PH7PR84MB15339B22EB53D20EF2B50A1787DFA@PH7PR84MB1533.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH7PR84MB15339B22EB53D20EF2B50A1787DFA@PH7PR84MB1533.NAMPRD84.PROD.OUTLOOK.COM>
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

Hi David,

we would've backported security fixes.

However there are quite some additions in master.
I'm planning to release before Christmas, so maybe that's still early enoug=
h for you.

Cheers,
Andreas

-----Original Message-----
From: Halls, David <david.halls@hp.com>=20
Sent: Donnerstag, 27. November 2025 16:07
To: tpm2@lists.linux.dev
Subject: tpm2-tss release question

Caution: This e-mail originated outside Infineon Technologies. Please be ca=
utious when sharing information or opening attachments especially from unkn=
own senders. Refer to our intranet guide<https://intranet-content.infineon.=
com/explore/aboutinfineon/rules/informationsecurity/ug/SocialEngineering/Pa=
ges/SocialEngineeringElements_en.aspx> to help you identify Phishing email.



Hi-
There's been a lot of work and fixes on the master branch since 4.1.3. Shou=
ld I use the release or will I be missing some important updates (e.g. secu=
rity fixes) from master?
Thanks
David



