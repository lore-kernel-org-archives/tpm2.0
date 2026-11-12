Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=217.10.52.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794473840;
	b=NZjpJJ2hDOq5P1vNaHIEXEODZ8BcHUTDWP6rotEWhbXTvnd3YGhayqBAIEb74sP1N+SZ
	 pTxmjbWV7II9MzFkguAbgBb5IstyKNJP4W4yU3RiUFGWcVeqXU6PsMBOKOqcDtbIUxwQH
	 Y613SpH1oFOjV8sVJfaT1nDrVt3r0vxASg1+RSjwMvAa+hvxJbY4I97oSGpF4B7yPfgqJ
	 W4XKYTsPj7231S/94HtN8jbD3CgXSGAtZTcCBfbkIpP0NJYafx8a5KYxaoQGeGVy7gtnr
	 XUjdKMMCOxfJOUXDUPKwhsDZpsH6sq73hsyMcOxu+fIP+p/jiuKUNMK4xLrc0Gl5KzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473840;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Received:DKIM-Signature:
	 X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-Encrypted-To-SeppBox:
	 X-IronPort-AV:X-IronPort-AV:X-Amp-Result:X-Amp-Original-Verdict:
	 Received:Received:Received:Received:Received:DKIM-Signature:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
	 X-SM-outgoing;
	bh=buHHzbPSsmA5uTgoL4AdInKnIZA1k/4vE3ezYwxrmvY=;
	b=HKF+9pgQd9sH7GfjHStC3gLTGOkU6VmSzlwEJ4Yh0U+0Kd2m19Z8iYtSBSCVH3gsRXTQ
	 ODComYHuCjp/utI9WG2nok5x/XXCtI4LfJbGAmHkiFEQT53Gy8f07c4gnB3C0KnhyUjCr
	 67wGe2ZGurbyOyDBgYwqFFm6ZXCCKpuPssSq+gtzC3X1/IJ/r30FLUXY1eob26mNjx80Z
	 woBazEVXtIutcU/+TPfEEVclEFsw1evQv3cOc47FOastr8jmxZL2XZvvq5vGrogaGQKfZ
	 9QpuSQLLlgw+IDXDMW9QjjWt1kimzSpsP90DWJO1+L1d5KUIY2L8ofRcE+SSbBRfP9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infineon.com;
	spf=pass smtp.mailfrom=infineon.com;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=pRXuiKa9;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=UsgsVEop;
	dkim=fail reason="signature verification failed" header.d=infineon.onmicrosoft.com header.i=@infineon.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-infineon-onmicrosoft-com header.b=aB2ZzCtL;
	arc=fail smtp.remote-ip=217.10.52.18
Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12086606A333
	for <tpm2@lists.linux.dev>; Thu, 12 Nov 2026 08:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12086606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=pRXuiKa9;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=UsgsVEop;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=infineon.onmicrosoft.com header.i=@infineon.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-infineon-onmicrosoft-com header.b=aB2ZzCtL
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1794473839; x=1826009839;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=0yM8eO9RsO/YUQ4j8E77+JlJqKBplKWaidqoTLHEbjk=;
  b=pRXuiKa9Golyret3nSNlJuhjXmkO6GPB2V0nn7+hil5STM7oAxx1qzq7
   KBoIJ/mLl/6/XijhN4T5rbiMDV5+8PTGgTZEMPbvSF8BBKbaZ8KyngoSe
   mo7k6jXbuZ0qXRwPa50aU01LYwDaI83Jqzvs/Cql4WlKfrbsfHnoDEooa
   E=;
X-CSE-ConnectionGUID: 6BDC+nSVQweCw7/25h3S0w==
X-CSE-MsgGUID: aKTojbVZTMO4hF5sbljzPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="189457100"
X-IronPort-AV: E=Sophos;i="6.27,209,1787004000"; 
   d="p7s'346?scan'346,208,346";a="189457100"
Received: from unknown (HELO mucxv001.muc.infineon.com) ([172.23.11.16])
  by smtp2.infineon.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Nov 2026 09:57:17 +0100
Received: from mucxv001 (localhost [127.0.0.1])
	by mucxv001.muc.infineon.com (Postfix) with SMTP id 4jQDmD46VTzypm
	for <tpm2@lists.linux.dev>; Thu, 12 Nov 2026 09:57:16 +0100 (CET)
Received: from smtp11.infineon.com (ironport-smtp11.infineon.com [10.32.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mucxv001.muc.infineon.com (Postfix) with ESMTPS
	for <tpm2@lists.linux.dev>; Thu, 12 Nov 2026 09:57:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1794473837; x=1826009837;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=0yM8eO9RsO/YUQ4j8E77+JlJqKBplKWaidqoTLHEbjk=;
  b=UsgsVEop9Oca4wMVbBAGQa9XYyVPLRrtY4mqcqVqHf0cNHXObc8s3FUY
   B0UznvuoXhTCt8d4gOmCsdgZNeqAfD7XL92Ph06xgnsC4XwamwHlIwHMu
   9Mk7+GA8NL8pxwaRx60xemLFLi+v38HdNzZaamyE90tyzTZVIEshUenT3
   M=;
X-CSE-ConnectionGUID: RUcG/GJNRYOp5kqXuZFN2g==
X-CSE-MsgGUID: naRjdnDtRZKyA8YV7NxEzA==
X-Encrypted-To-SeppBox: True
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="169962436"
X-IronPort-AV: E=Sophos;i="6.27,209,1787004000"; 
   d="p7s'346?scan'346,208,346";a="169962436"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 09:57:17 +0100
Received: from MUCSE844.infineon.com (172.23.7.73) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 09:57:16 +0100
Received: from MUCSE826.infineon.com (172.23.29.19) by MUCSE844.infineon.com
 (172.23.7.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 09:57:15 +0100
Received: from DMUCS0011.ifxdmz.net (10.32.24.69) by MUCSE826.infineon.com
 (172.23.29.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 09:57:15 +0100
Received: from AM0PR07CU002.outbound.protection.outlook.com (40.93.65.68) by
 ifxsmtp-edge.infineon.com (10.32.8.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 09:57:15 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7vFQq/ruwe3dg117fZ/6ykAYyTQgKLoDdrMk6vao60dFffF3CKex2QU2OUbjk7DOibzg2D9epN/fR5x2sdrW/55jgLQ5Kxqppl0syoBiZxD6O5CHU0AWumtkOo2G/5W2N2bXEtSpr43FzxzmYzk1sH7dHbqHLTEG6JB/kXL0Gjpz2i/7ciyXlTBIAJEDuvKGjvynzQ7+5bZe0Ke5sbYKE832hI+26NoRWA99E8a1ltJuvGBzsrjbg3X+vfZqzbMJh0iXJS1rPciAbYq99QcEJhlub3Asn1vjiqMr/mx3ZNOwfo+1LRIV+Itfpo/TyQoFQjNA16nBfkhDYiYCjbNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wziJjkLVlhpfp+4w0XZOLLF2NPymwrqpDCq8aAEPxs=;
 b=Gyy5QnZKPDkIe8oMlM4P1i9pevObLWpjUh4wA++zqU9LCATTphVB2l6/HcGdMSt/+T5gP3ek8AxseTP9Bbi4Hlk2FaxR6fk5G4vbGy6vEZZZS0HndsXm8xF5Xs2v46gpnmP3itP8DsjOXSYvAY9Cm7vWMrV9LYp9qxUaWysgfkS0hZ2eTZIT4xwBgABZJ0MzZ2Myx7fVInRNkWEuCktU5zGImus20liPU4liw8vuKv10mFE9om3MoVR1vguPwxAuIFPtlOHNbi0o81bESo3TvdeWw6C8zmyq1+ElVfTGljs68nu/7AG7ZeWfWyIiDVV9qD4G1GjcuXEn4vAj0rG/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infineon.com; dmarc=pass action=none header.from=infineon.com;
 dkim=pass header.d=infineon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=infineon.onmicrosoft.com; s=selector2-infineon-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wziJjkLVlhpfp+4w0XZOLLF2NPymwrqpDCq8aAEPxs=;
 b=aB2ZzCtLVpkAzKSEZKJlnWOmpKGZ1WiwFWYPJ6FkNs4HBtXpgJLMseTtYrF93Lf4KOJ6s3n2tOTwTaha5w54PzhO8fdr7bie0Wl9nw8z70wDvIKrIic9x4upjw42vdSfiibXp5W1+nJGajSTj0n3phEfOuenLMs9Ve5jVTxyr/w=
Received: from DU0PR03MB8983.eurprd03.prod.outlook.com (2603:10a6:10:478::18)
 by BESPR03MB911497.eurprd03.prod.outlook.com (2603:10a6:b10:106::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 08:57:13 +0000
Received: from DU0PR03MB8983.eurprd03.prod.outlook.com
 ([fe80::64c0:bebd:8710:3f63]) by DU0PR03MB8983.eurprd03.prod.outlook.com
 ([fe80::64c0:bebd:8710:3f63%6]) with mapi id 15.21.0592.010; Thu, 12 Nov 2026
 08:57:13 +0000
From: <Moritz.Buhl@infineon.com>
To: <tpm2@lists.linux.dev>
CC: <Moritz.Buhl@infineon.com>
Subject: [SECURITY][RELEASE] tpm2-tss 4.2.2 and 4.1.6
Thread-Topic: [SECURITY][RELEASE] tpm2-tss 4.2.2 and 4.1.6
Thread-Index: Ad1yg7lJsGA1bobUQSS/7ZKbkhh97g==
Date: Thu, 12 Nov 2026 08:57:13 +0000
Message-ID: <DU0PR03MB898336BA74AEC5286EB7BE6B9D702@DU0PR03MB8983.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infineon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB8983:EE_|BESPR03MB911497:EE_
x-ms-office365-filtering-correlation-id: 5b19130a-80fe-4096-0a73-08df409af1d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|6049299003|376014|10070799003|23010399003|366016|1800799024|38070700021|56012099006|261026140227099003|11063799006|261022105027099003|261022075727099003|261028144727099003|261009223027099003|10067099003|18002099003|4053099003;
x-microsoft-antispam-message-info: p1w22dif3eGR4Gkz9d2olrSKKNADigOjoJ5uHGlzquT+ERuQHXyekQlFH27EzVG4RrmpuLWMOC2gs5mPbV8+38Eavn8dEjvFcXUq/VgKKyL91f5KzmLB7yfDjcInYeJLqiGeHijeiy3AeFxXJeGxck3flTIKIf40XxSfbni5DbPmh3+2qBO9IcGXqqfkB4Qashgp0InhE8UD21C2TETz22tG3eI6X/DWou7siGOOWqTWXB3r6IjXYQIjhQg32hz4AnX3BX4XcHL6K28+UJfPSd9IwzlXz9dseAZmWD28C5u4+dretUgC/ApxANA9kO4UI1dk9gBMhF7Ss6PpIGAYvWNJNW8+EKiVDqC7A8i8XdNUixIS851al8Ov2EtqD/tSIOF8U70/C2TTnpDnpyFFebjS70AWbjeM9DHUoqhb626X88TpXBP4mJQ/UpfVq2kGhEi2OthB8tVC5OrCZ8BQVKbn+VbzXhBcOyigTmEJowhlZ/ZWWlLMz2telo8NrfEjtX46g5PhYxV7rAm4+gPL8dZAEl49nN83atRh2bKpIllDl9hQwlbb9z5qkmnpSXz57gSJzqBVW1OE4b8i+fuTfy7jIOZkcq/PQpa568D6yrJeOqw0ZFjDRUcxibDU1QFPCzMw67ihp/oT8SIrBEPB4xlfuzwGX91Kbj3nYQdRUPf+zXhu87Ky6TTShCLKRVZaLeiIffpEpkbtU9wd0QpMC1M80A76U5nLParQo8MKkHo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB8983.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(6049299003)(376014)(10070799003)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(261026140227099003)(11063799006)(261022105027099003)(261022075727099003)(261028144727099003)(261009223027099003)(10067099003)(18002099003)(4053099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qwCm514pe3JnHJI6J4Y3r+h1SVwWYmWgg0Xzc1l+7mbBcYopXYpgQrpi9hNx?=
 =?us-ascii?Q?iKAS0xn8Djnr5jYt2NY4Zti7Q7L/19rdLB9rhaQTljvUrCcPlaMsF+NcLgyK?=
 =?us-ascii?Q?aqxYwsSsRbfTO0z5bKaudDMAdGB3v/w3GdD17kqnWKpRlg6LHGQ/P2kV/Nkg?=
 =?us-ascii?Q?rboyK6uHI7y9J6dusuSzYuqzMF64GUDXpZlkwAJ0b5No8bozqt5n5otuYHh8?=
 =?us-ascii?Q?76v0RtVevsJkqpICscKzgkl/eY7riRWjo/97l5c1Nw9fg9DfoerX2+cbgb1F?=
 =?us-ascii?Q?h45QxXnqekbSafyrZoLiWzc20YNAIUuelwM3PXHRwEs1k+AVHlyZ9/9xUCDF?=
 =?us-ascii?Q?khMI8k57talegLIg3Ix4dHHdjzv9jX7lbQF3rRFF02B6mAcw4xMqynKhiHIx?=
 =?us-ascii?Q?LAsdplMNaFjVsEut5d0gzSxf4IW2CFs+5GvrGgogk98GuoSa9G1LnHTdSUY0?=
 =?us-ascii?Q?HYYapjmsZbePI06NMP8+Pr8+X+wU0hRI1qe2TUkjC6TYQfzlYFFTf9h4+qHa?=
 =?us-ascii?Q?jqb00k0dM0QT710GyQqAE4eXZQNVZDoEo1NLSbvGUKXLAThoHV313Niwfd/J?=
 =?us-ascii?Q?XuPZb+HezKv91xnBD0rpom9aI8CDI0t0KFEwSYQapI0CKvjM8aI37vQAnNed?=
 =?us-ascii?Q?IvGm3JPlhmhenZTeCSbV6DIogAWmXj8KX9ELdCHAhSsdLUsGNWEgCip5Fjt4?=
 =?us-ascii?Q?79K2Q4LPYHw+ROu6bMvlVZtnZrQLANUfVUdugF/9xcsJyICh4Qa0gdg5tfCK?=
 =?us-ascii?Q?BV9kkSrECTCb+EUKZpNvWn7Z/N6G5LeCowHs0tUvpqheBrOsff6MGDc5wGSa?=
 =?us-ascii?Q?N+RMvsutf9XFdXdTYt21GELNyoSv+J066Fn6QaXQwSD8M9LhE0Ic3mLCtID+?=
 =?us-ascii?Q?5RLsd2iXyEh1a+BFFozARfjHi48GEpz4D11Jer/JOY1uVXOsgFvpMGbQBEv3?=
 =?us-ascii?Q?ho9KNHR8VY0BQzn0YPx36dNKwNp0GwwsU+BtWxJzRhAipvOVhblAEVlQh5Cw?=
 =?us-ascii?Q?LGsOylk8wPvu+LD+y8fFErG8ceabzcKzI5CbOlg9MqutAILeKJTgbKOGasqR?=
 =?us-ascii?Q?ZN6m3mFVRBsTCP0hdwP+Esua6dhsJndl2vpCo0qt+XBBQCe82Xvxq6Z1Qdft?=
 =?us-ascii?Q?DN0KrlrRtAELb5fVqefpr87xpvLHysfe9LH7LlaHzMpfLe7grgI6dd3gfhzt?=
 =?us-ascii?Q?m5SBPWHSSMMlFjwTa5LEdPptHWt4OkU0QFq/C1pQzkvuWNaAVZ0QTKKP1iQM?=
 =?us-ascii?Q?P7vjj94DYRkLctX153BZf2DiBi/Co9E0ZFHpm8L/p23A208CgfQo3kOCzPbN?=
 =?us-ascii?Q?jOOp7/G6zjFoeE0cE9iXrO4Q0OgoFEzXemSfNGO0U9SOq+KgJcOlt2jPNcbu?=
 =?us-ascii?Q?uOfwQjJaommExHta8c8h3e1Dtwd5U5GKKV2KRM9BVz8kUaY/SlYkIcu/nZMc?=
 =?us-ascii?Q?pFyBjDYPdJwzXb8QRzHk54zj/yuNeG4UjOUKCuB96YTI05K5qntkY2f6G+dt?=
 =?us-ascii?Q?31FkEwv2jA4VoNyoCgjdo30tgv02P93c8qdfNr1YgvrFQi0OL5QQGo2nD/P9?=
 =?us-ascii?Q?yEAzbiV2fdGx+Ja6IAaDFnlpLBXjFeGImYyJmsJEzupttdZoY45x/YqzRf0h?=
 =?us-ascii?Q?MS1Wp8sDzjGAM1mrdKGJAPkUwNNfFHLMGYcvAdlVYkRtFuqSvt7z6RYKzoVB?=
 =?us-ascii?Q?UZd1FENJOBWvtWcKGW+yg4oCZ0p5rXncDZjO6GQnYTxSLkU7jSJTQW1lruum?=
 =?us-ascii?Q?8J5K9rnpC/Cx+XLwrYzY/prV+C253Cv7eEiF2frctBSP0tu6Gfqd5cqm/ia9?=
x-ms-exchange-antispam-messagedata-1: tuXKsA68Q5kG+Q==
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_00BA_01DD728C.3002F130"
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Post: <mailto:tpm2@lists.linux.dev>
List-Help: <mailto:tpm2+help@lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
List-Owner: <mailto:tpm2+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zkcMp5k5oC/k31w/WExjD0RM5zFtdhAejQhZrtsOJYjWXlCw2oMcpsyCIgYRPzNpLX4yUlYX78XMiyi5euG9O5rG2F8Q1Wbkqp3Ayr7DoVZyJAg2HpEQKx7yGgL6RekmKpYnb7TCIeRN1XmYfRh/ev+UMFio5nxkldZ/NyBLYIGzA2G16chYTRJB3L/v9Jjk6Lp4pWhBSMrnqL3CbEjkDa9vf9ylEaluf6841npnPDrChfPXsBzljydqahVSYmOkaowskAg1DJ9alVuud+b3VtYY72w98ILYrhaW02ZzofwexkZ3PxBWKgRm6JtEhcj5fgR4+tObl6l7fuBNuoUJWg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB8983.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b19130a-80fe-4096-0a73-08df409af1d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 08:57:13.5652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eeb8d0e8-3544-41d3-aac6-934c309faf5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RaLvhy1cVk41xAAg5erIeAjhVsOQIblX625bTiKmFbZlpJOcADpRHmgKoBmnx7pBwl7yS2Nga0ZR9iVyAuPm+wTQ9aAAHghaEAp51RiRx8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB911497
X-OriginatorOrg: infineon.com
X-SM-outgoing: yes

------=_NextPart_000_00BA_01DD728C.3002F130
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

I am proud to announce the new tpm2-tss 4.2.2 and 4.1.6 releases:
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.2.2
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.6

The changes include:

Security
- GHSA-89w7-5q38-fgm3 CVE-ID requested

Fixes
- mu: fix offset of NULL in TPMS_EMPTY marshalling
- ESYS: avoid zero-length VLA in iesys_decrypt_param
- SAPI: fix alignment of the response parameter pointer
- FAPI: Reject out-of-range PCR indices in policy JSON deserialization
- FAPI: Prevent count underflow in POLICYNAMEHASH instantiation
- TCTI: Reject undersized TPM responses in swtpm receive path
- FAPI: fix oob access of policy during name hash calculation

Best,
Moritz, Juergen, and Andreas

------=_NextPart_000_00BA_01DD728C.3002F130
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
2I2bXvkRGMTnHFOsnsNVLi06Sp5kFHL0qUnQcVC8sZOBpgr5U731nF8a2JDU/ianSMreDlDPLNWJ
GkMrlztW5slGEIWOCYCHviIttadvs3KPLokFIBxXEHDIrzvccOQjKF9aBmi0nRv3qeuVodKX2CCs
nIAPQFyUyG3bVlcdWrYZJBIPyHvmieckf3QknOyZwehpzwZrzrPtrkRT4e6/2r6nTa2/TYCsC8Il
5VIUs5St4ONXE3uyF743QrdDzF5Pq9B/2pCYzUcUKoPDbQ/GIwql0eqOY4IerBIRVktwZ+g1BEn9
7zT3eMCVe+RygOxJdaug6hFVlWb9RHjrMYIEbjCCBGoCAQEwZDBdMQswCQYDVQQGEwJERTEhMB8G
A1UEChMYSW5maW5lb24gVGVjaG5vbG9naWVzIEFHMSswKQYDVQQDEyJJbmZpbmVvbiBUZWNobm9s
b2dpZXMgQUcgVXNlciBDQSA0AgMBJm4wCQYFKw4DAhoFAKCCAd8wGAYJKoZIhvcNAQkDMQsGCSqG
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYxMTEyMDg1NzExWjAjBgkqhkiG9w0BCQQxFgQUI2Xl
1eCzkdZZhZuLBd23XmpjhG8wcwYJKwYBBAGCNxAEMWYwZDBdMQswCQYDVQQGEwJERTEhMB8GA1UE
ChMYSW5maW5lb24gVGVjaG5vbG9naWVzIEFHMSswKQYDVQQDEyJJbmZpbmVvbiBUZWNobm9sb2dp
ZXMgQUcgVXNlciBDQSA0AgMBJm4wdQYLKoZIhvcNAQkQAgsxZqBkMF0xCzAJBgNVBAYTAkRFMSEw
HwYDVQQKExhJbmZpbmVvbiBUZWNobm9sb2dpZXMgQUcxKzApBgNVBAMTIkluZmluZW9uIFRlY2hu
b2xvZ2llcyBBRyBVc2VyIENBIDQCAwEmbjCBkwYJKoZIhvcNAQkPMYGFMIGCMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3DQMCAgIAgDAN
BggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZIAWUDBAICMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAgAaMTxtEqb7EI1/YtaqwQRbOYd95iCt192XCWpUiJFDHfAv
Xe0p0jtYNu1eJw3Tu0SVoUicOBOkAWVPpt7anS+7aX2rwavBRZ5upoeH8FSoiJ2DZzHlp96uCOKO
075U6T6BJIcAT2JOzvBx7hKggBIfctOsepHFNqfIpjzzBeynfjcfWSUtmtebhGg3Ra2s/BJo6d+d
WGuT1P9j2NPbtTzrjFBC34OlpVNyIxSIHewqw+/kt+7KQDAkIySwpTP6bKhrQaciv8E4ils7yLBx
iy3xikqMUwNsiDrVWjtG4v34Kq+MOzKjloiEToIoPMv3lZBZ9rO2dxGY0Jj3Z+UBIkifnEXsSH++
PELTDiZInnZbv5UPl7fg25Nv5pNGakNNYE9vk2gtVHn8POVha8v4tsj9cdvOLzRUXfNEZEpU2nJB
IbgKUPP6RPMpxwaEqr2FofDDmkyjScS1KS59tB2mzu5ZDa9H6mp/e35KO8wMBLynnqCsiSIsambO
FX3zNdvv8gc97fa92fxNaBwlGON0CwrLM/HbaIKH1yqBNEvLOAIWPa3twyuK1JEPjhCOCKmh7hmB
rIca4WuiHdHJAlxZgxWFlh3orfQOO3t1gOwOLd7HNJFnXqEAZOzftSAWzQsn0bfsglvOth7KKVOr
SjNEB1SAaRgYELQ+2ctz37YYn05aTwAAAAAAAA==

------=_NextPart_000_00BA_01DD728C.3002F130--
