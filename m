Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475A924E4A8
	for <tpm2@lists.linux.dev>; Thu, 27 Nov 2025 15:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764256055; cv=none; b=rXuuEN9YBi+KLfzeqINu4YPyotScbO0y/TShLANmiWVyJ/5mUou+K1wNPEmVavOcZLosEnM/CuC7zcs24FmoWPpjF7ShuzoWFSk9ZQ8SmNr3v0tNkvCP6/VkojK8NM+93uJIN1Aun+G4zXn6kgQ+PMKXejyXdGeIMMi3LeLIqOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764256055; c=relaxed/simple;
	bh=CWOir2mhtljUVTDVhTXt1EVA5Am2/khpedLLMmX2b1A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Epmo5MB9Xpr57HdubV7ViIpdIyN4z+rIHM2EwoI5OQp8o9wyYNgS/gAPR8fAzBTSLXmyKdmrNiu7ibeXn7INUS0H0HbqVKU3JI+GkARaK6BvWflYBWL3KOrxZuSkWg0fXZwgC2w05oWuzDXe2qMoEbblLWfW2UFwaHcOvMZVB70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (2048-bit key) header.d=hp.com header.i=@hp.com header.b=W5mJxiG2; arc=none smtp.client-ip=170.10.129.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hp.com header.i=@hp.com header.b="W5mJxiG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20250822;
	t=1764256052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CWOir2mhtljUVTDVhTXt1EVA5Am2/khpedLLMmX2b1A=;
	b=W5mJxiG2PKLC49vUNjLG+MGhHyM3Ioe2X5oA41zQAixsQQ1uppMvjsCVSyCt/wjlYqUt7H
	I3IY94offgp4vqcnGhiodgwOq8D4eJnIoGr/e/90L/FhQb2d6AU3ButoXuAZQW8WY0P0/J
	6JahKwEOUgimv+VRndeaUHyrAAQogmVO0jyml86+Mt6zoZInpY6+8CkSnttQmDFIKSed6x
	6ZrrwVhDeLcXwI7l5Jo+1z8qBXbUKKyo9ME+nZAqhgNEQPcqkx9oHaiKTv8ZvIeMRU44zQ
	W2NmMncNzQ+MpNNyi39fWUnyVOY0fyzNp//Lxx6ILMYSWSDSuSc4zXudhQCY7Q==
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-0m6KGIYSOye5VSeivV6Beg-1; Thu,
 27 Nov 2025 10:07:28 -0500
X-MC-Unique: 0m6KGIYSOye5VSeivV6Beg-1
X-Mimecast-MFC-AGG-ID: 0m6KGIYSOye5VSeivV6Beg_1764256047
Received: from PH7PR84MB1533.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:150::22)
 by PH7PR84MB1488.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:153::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Thu, 27 Nov
 2025 15:07:26 +0000
Received: from PH7PR84MB1533.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::999c:451b:25ac:7491]) by PH7PR84MB1533.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::999c:451b:25ac:7491%7]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 15:07:26 +0000
From: "Halls, David" <david.halls@hp.com>
To: "tpm2@lists.linux.dev" <tpm2@lists.linux.dev>
Subject: tpm2-tss release question
Thread-Topic: tpm2-tss release question
Thread-Index: AQHcX68qXLCkAy+LvkePvsq2qjqwFg==
Date: Thu, 27 Nov 2025 15:07:25 +0000
Message-ID: <PH7PR84MB15339B22EB53D20EF2B50A1787DFA@PH7PR84MB1533.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR84MB1533:EE_|PH7PR84MB1488:EE_
x-ms-office365-filtering-correlation-id: e16694de-ebf4-412d-8141-08de2dc6acd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|38070700021
x-microsoft-antispam-message-info: =?iso-8859-1?Q?7TQdcipe0lrVsV71nQ5xgDZapruVwQQi66zGv/b2j0ZQ4j+malKxvY2OYi?=
 =?iso-8859-1?Q?mQRUz7fTJ0VIr42PjReKTqZhnFXYzJvQhPBaDHNmWemSCht47vC3XqJ7gw?=
 =?iso-8859-1?Q?lQCCLv6UglO4l+qUmlg+V8xGzdHMC6wnW2uNGfrVdx7N7fb20PdmvfYe3U?=
 =?iso-8859-1?Q?O1oMV/ydvgsd8YEVZyugHWdet0edWYRHt8CnGJQcZHwMF2TOEtME4vyK9a?=
 =?iso-8859-1?Q?uohH3Z/Hpswo/AgRU2Vza8TXAmpDaU7g7L3igC7yXBKI11L6RY9hxjI+OR?=
 =?iso-8859-1?Q?iOPt3nGlkjzg3mdEaghTzeOwOiMOqkTz7V7vanR80kQ/mRC6jmC38iufhk?=
 =?iso-8859-1?Q?rTIAibasgrFlZpCq9amjwikSe4gS5rk/LG1OvJiCldzwC8CIlaLDbb6Q7u?=
 =?iso-8859-1?Q?nal2j4HWKd7xbNFYsRWJEtfPEw79iulcquzdPxqYtfRJ5dZ8MBtOyU3BT0?=
 =?iso-8859-1?Q?62vWDXejng87N8wyD0MHzqMq8UFLqVWe/kskipV0EOieYRM/hrYGCEekXS?=
 =?iso-8859-1?Q?N+hwkzQeFIvOR3VSkyoXpWNAV2xop81UMi/e6IuqqCyXojxxbsbPTHiYlQ?=
 =?iso-8859-1?Q?jPPdlPAclInZMevXMZGSZWQmeMbNa53u+qwrbF13yKvgGkpg7imZFF9gEY?=
 =?iso-8859-1?Q?SXsr2MMt0lrIuScIED9lqr2N8UNvqQlj1raeWkyFzo8xTvbJ8rPB/MAaKz?=
 =?iso-8859-1?Q?4TGSk2aP6SCnCiV8U/RaNN4G5Vp8Ve1fEIKXPiJ978DOPXlNg9isbp1G5W?=
 =?iso-8859-1?Q?DWR7ML1skaSIJSRCVOkd38BgknM7jenUoV+1OnSuwoefCwFtZDjjMMkQmd?=
 =?iso-8859-1?Q?hXUc10Ni11NDu7R0CxndTKtyjp58FwC1mRe0WT/7U/k3gnoeVEXjm9hBC7?=
 =?iso-8859-1?Q?a0fO1mMFWIde2Q0mal2jSHPP6BKXChjJXvp02LfBTXfINZCYgvJh2Ow8TP?=
 =?iso-8859-1?Q?SE56my2lGk5gTNo34ZZXDPnqjgVYBllQh7zGpJ7BzJRv7mknDPmCEWN4eR?=
 =?iso-8859-1?Q?BfUynIe3uhcrp8HSUp5/Qn3ZGEV+saWad+zwzJS3LosHTHsv45KJrsOPw6?=
 =?iso-8859-1?Q?IVvHV/UpqBYL6x4aa/5eDVViotPgPbUekHDAamuoC0EXQr3tq28eGDyjnz?=
 =?iso-8859-1?Q?rnzAk1xXc+jUvqxfcH4SdA2VtxV7XFY7zX/5hwFmAFxOcd/25AzhiOeOyL?=
 =?iso-8859-1?Q?2GCeOWP7Phky2sTbblSbwSkofkCR5jj6o8mKB3b9TBRe1kFb/rKIEawZhg?=
 =?iso-8859-1?Q?VPzFRbKniHBf3+BkE1VYGC48XKNrvp9x+ShAvAZ96RFbzQIawBZqHYwo4u?=
 =?iso-8859-1?Q?k0ZinrFzgfmW8eHcEXUyCj66TGT5cv6YX/d2R0FyUPtakGUnmr1CdLrqiK?=
 =?iso-8859-1?Q?JacfLInT6VDiJAHCmKxRsaC+XMaSASqvGhJdbK3Y8V011quyrANcsp9x0A?=
 =?iso-8859-1?Q?zk35lnhVHJECltMfAVsXo59/iOKIVJhqIPC8eq/DOmTjyAm4U8oyNNSCCD?=
 =?iso-8859-1?Q?Grwg9Kh15kITn9vxOOb8onaMArQC/a7wZUTNuyhWxIazuWF9BGgxbjm9pX?=
 =?iso-8859-1?Q?iQyvoGvhh5cdb1YDz5l+u4BIhE7t?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR84MB1533.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?67s052HN9/ZmV0tn8xgqPRYKfUAKJagZp/aqacBXZuufRAfq4SoErk/0oY?=
 =?iso-8859-1?Q?xxWZwv9Sxzue5SnaB9CG0c6LyskxEjOjKFpWLBN8RFWuFnUc8/iH+bGKvC?=
 =?iso-8859-1?Q?w0LvmVXuVjdFFVns/U3nlf0wm6iYEaq7SUuQUQLHzTOGIqEP+s5wCpEpBn?=
 =?iso-8859-1?Q?Dcu1s65v6gyFTAeitVfS5UncWsJBeYGM6RXTtXsO9tNmJNu/iGuumFZgAi?=
 =?iso-8859-1?Q?AoALztntx7+BF5I01f+1bZ7i45M18iwLSRDekoxsp9Rz/9W5wtDi6lwgCu?=
 =?iso-8859-1?Q?D4X1HeGuBpZOkrlbHVLmBSWH16C6atmSFo5J5nV/ZrM5XmGod0MZuUs7Um?=
 =?iso-8859-1?Q?LShNX3DGbivE/IucqOYk6CmUGarRRoVjljZfK/JDEA9IJ83sr2KK20U2U6?=
 =?iso-8859-1?Q?iTx3CmiOPr6cNdacJNcP5FCgNSmYwRvzWczNHhHjRaAp7xg3wp+tHtsgoI?=
 =?iso-8859-1?Q?qhNE/UJGHDZ6+Q+3rVHFPVLnELtTuN/ija+1q27rzu4HW++DXLhxDNGLvx?=
 =?iso-8859-1?Q?xxc2pwr5KsRhDyfwx5Gg60xzPF7qjVfyIzBNm0pWa3DfhvlESB5wOsRlu9?=
 =?iso-8859-1?Q?RfShgzpe4H37XcIvKYvGFM6Y6tYqL9nHDYT8SQTX5dAGwTqooqVJii8kRx?=
 =?iso-8859-1?Q?0aSiF273BhLj1DORRsb946NxgQb5O9nKcjBCZW/ke12kYb73cra8w94wKt?=
 =?iso-8859-1?Q?PNRRtuoCI047Eb9Y6g4l3pERSErmhI7TS5VldkdL8NLFe5f2MzcU2S0AhL?=
 =?iso-8859-1?Q?h+O3KJLGvAlFVn26apKrbPmwCpx7iK+t2sDhERtXE0GEWkHWrsffXVHMQt?=
 =?iso-8859-1?Q?AAzShLuyF6Y6zxgqjBlpDjJ9JkFYKP9vOd2Z7PVEQ8RdzIUiUqlvVAiTO2?=
 =?iso-8859-1?Q?xKTqFM4Wz3oAeM/CMNj5RTGwzrz35kD5zx4h1pdhG4q4XmJYNhH8+NtD7x?=
 =?iso-8859-1?Q?fGnoM+CasnuaOrdCwuqiHHoxwgE6Mq+gJ1Ni6nhgphfxjQCHh/CqeuA4xU?=
 =?iso-8859-1?Q?EPHZUs5nEB2+Qc6QOGbJcwGUMsyuObgtqy8CUzWBcaoG49Ves+zPmz70AR?=
 =?iso-8859-1?Q?wwc635d6Y9I1+cMXSy/wJ5Rd+tj83X9aCZrr72qjW+0EHLJzkbtY/Nr+83?=
 =?iso-8859-1?Q?wXtfpcJY0OPzggLIwKNeqad6bIolBFZQ9uCfp6Ahc8LaHrD2lt71GeJ7xJ?=
 =?iso-8859-1?Q?fn2olyiarDOkF0jyULCPpV4RFG/EW/uxUPXzGrtkmDYNylG3l75HidgGeL?=
 =?iso-8859-1?Q?udV5e5dLqrFYmIG9vq7Any8dYzLfXFmbaX7GZVMjZ5sDCzzAQ/AIMZOyja?=
 =?iso-8859-1?Q?SBgjwcN/HxZj5ihBQGieXyxM9/3fuuwnZCDeOkalwYPdLe8F7ZFntaiAnO?=
 =?iso-8859-1?Q?RKLyrHpARaB/uB0atEakjjoL4Fx307J0uD1DsJ6hSHzDTUvtm47QkV3JN1?=
 =?iso-8859-1?Q?1V9fLxQPUxQnMCIfG8N4746VQnL5DWqnX5nrFi9VGWC+J1pGnaanMjYkik?=
 =?iso-8859-1?Q?/pcLX2cuFSvoTRBdYTtGLPZeIjTWksC3uLXbsRloSbFIoLiMRyB3WQuSrR?=
 =?iso-8859-1?Q?ld3UkvWuwcIlWIqSa1ALir0WumbYRwBelR3ZDuc6fAmI1LJccIUHldTzgq?=
 =?iso-8859-1?Q?XZPJNGp+dhN5M=3D?=
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR84MB1533.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e16694de-ebf4-412d-8141-08de2dc6acd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 15:07:25.9142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ixkve91fpUlQqtSyTwbdpX2nViaiGjWbBnE5gmUHMi8PnX5vjnp0vxJDA5Tu1aVe7DWl1+G2Go/hsFZcGzcdGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1488
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RxObMUUfuZhvIan5WYdWNPuW-jBBGdjV0Fu9BVRB7jc_1764256047
X-Mimecast-Originator: hp.com
Content-Language: en-GB
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi-=0AThere's been a lot of work and fixes on the master branch since 4.1.3=
. Should I use the release or will I be missing some important updates (e.g=
. security fixes) from master?=0AThanks=0ADavid=0A

