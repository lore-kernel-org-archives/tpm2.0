Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=217.10.52.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795629920;
	b=qbIJFIiX5E05FTwSNER+dvdVWyZZMK8PliRoV0Hy275Sv92Qq5/yxU+fRLXmopc5qBPM
	 kvmzsUvyUPMOzjTXSiZNA4T/fX+YuthkBFp4+USlvES9wOc5+gEd611UFxdjEXUGbLKtc
	 AQ+ccivu0Js44N20SfpNKqOdbAqmhyDXZvwbvHPHB9WqbCYt0QoYqUNQCdszd0lyAyCJV
	 LKOJveiRcHvJAs+Jn8CvARk+3MuzLx1hNRFFruA0Z23dpgFIhBR4OljTVl17iGrk1yQLz
	 QMD1hlX9TGrGijMbakOFztgeUbORi/DTkBgUpMQK+B7o+ACilye34TBF6lyI86duGrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629920;
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
	 x-ms-exchange-antispam-messagedata-0:Content-Type:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
	 X-SM-outgoing;
	bh=JM/CKoLhNxtXlDsW2BvHAY9YuU8568o/aZQSE+7frgA=;
	b=VElZNq0qZKF3vnXJ/FkmGLBI9ldV8NOqfyPy9hAluYkJ5RGdcXCWV9JEeW6IkyLmfm79
	 zY+HRuOQLEg9JlfqyjhO1hJu4OI5lWfpZmDJvHAqu+7xknMu0ws4CybFbsniLeHvPW/BM
	 RalZCzXq6UOz7JqD+xpiwHwgGxffaokpAaohJxNjJBO8zGrhNDnQ9zqJ2zYqeKWlJKxPn
	 P4X1rZw0cW7iMtNxzSu1GGalkfMADTyy9tcA8lHzSnRyKARNXhPYmbxLld31BILME7cPo
	 O+5LipI9YtI9bxZkbiQWdyKg9Ir15b7WdUe05+TRTMAll1p4+kX2iZvbhxR33spoyyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infineon.com;
	spf=pass smtp.mailfrom=infineon.com;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=mItMKrGJ;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=BDnwN5ZZ;
	dkim=fail reason="signature verification failed" header.d=infineon.onmicrosoft.com header.i=@infineon.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-infineon-onmicrosoft-com header.b=qGQMkAXV;
	arc=fail smtp.remote-ip=217.10.52.18
Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B6C606A321
	for <tpm2@lists.linux.dev>; Wed, 25 Nov 2026 18:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97B6C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=mItMKrGJ;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=BDnwN5ZZ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=infineon.onmicrosoft.com header.i=@infineon.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-infineon-onmicrosoft-com header.b=qGQMkAXV
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1795629920; x=1827165920;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=iMgfKUwN7UAWXxb6tjCAtPg7XwigKZS4qL9IKvrbIj4=;
  b=mItMKrGJpEbQUFARxPNIUZD16tBtspUEabSyD5m6ebn0uzkiseCPi5VW
   UL6Tb8lqnvf476xKz/NjiV5q7lhvqQbHgO3Arpa7Qo0patQWqNAbg4d3o
   1SQJnaxIilPz14P/nVahq27ffGKDwS+WHemRYf5gmNEEesWlzhsJZ+Sb8
   0=;
X-CSE-ConnectionGUID: uztzPTnQSFCcWh8ZA2+5kg==
X-CSE-MsgGUID: 1BjX1YMgRkO+fSodzqvA7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="192002706"
X-IronPort-AV: E=Sophos;i="6.27,233,1787004000"; 
   d="p7s'346?scan'346,208,346";a="192002706"
Received: from unknown (HELO mucxv003.muc.infineon.com) ([172.23.11.20])
  by smtp2.infineon.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 19:05:12 +0100
Received: from mucxv003 (localhost [127.0.0.1])
	by mucxv003.muc.infineon.com (Postfix) with SMTP id 4jZSJR4K65zHpB5
	for <tpm2@lists.linux.dev>; Wed, 25 Nov 2026 19:05:11 +0100 (CET)
Received: from smtp9.infineon.com (unknown [10.32.30.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mucxv003.muc.infineon.com (Postfix) with ESMTPS
	for <tpm2@lists.linux.dev>; Wed, 25 Nov 2026 19:05:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1795629911; x=1827165911;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=iMgfKUwN7UAWXxb6tjCAtPg7XwigKZS4qL9IKvrbIj4=;
  b=BDnwN5ZZbOzQV8LwQ/FFJFB7Kn7zPVY/WLhVtzsozisvSgXI7pAIhSK2
   pO5kctESqhnJCtTrDRpL3bvW+7+2Ot6axoGbJWXLMB19Y5bUr22rV2SLN
   qTbekMFy9ksk6V4o09ihxu145nOW2sC7OsCnh99e8Fg1vHAJM9fA/8Z2I
   o=;
X-CSE-ConnectionGUID: xaaNnyrTSoeIRfXS7QMzxA==
X-CSE-MsgGUID: FdTj80rKTd6rw+EFf4+1Gw==
X-Encrypted-To-SeppBox: True
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="119325699"
X-IronPort-AV: E=Sophos;i="6.27,233,1787004000"; 
   d="p7s'346?scan'346,208,346";a="119325699"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 19:05:11 +0100
Received: from MUCSE841.infineon.com (172.23.7.70) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 19:05:10 +0100
Received: from MUCSE801.infineon.com (172.23.29.27) by MUCSE841.infineon.com
 (172.23.7.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 19:05:10 +0100
Received: from DMUCS0010.ifxdmz.net (10.32.24.68) by MUCSE801.infineon.com
 (172.23.29.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 19:05:10 +0100
Received: from GV1PR07CU001.outbound.protection.outlook.com (40.93.214.98) by
 ifxsmtp-edge.infineon.com (10.32.8.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 19:05:09 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgH2qCnJwFBitvwyvzg9vFxc+S08Y2NDRpO6xmZWXHoY55FCGP62rT4jxAm2KS5Lb2X/sUHbQcY8VJ3VhaXNR7hISOK5vidY3anYNLMJLsBp/d/iaq0Doie6bBmtcdtPS3p8QmmOfvEmC8lEZN2MF9mXQVE1YouBvITOYKt4DU5X4+EUL2na61wdvAx8sWxkgkpAqUnhhR877pYSPkPu10Qm9WpYtPdfMZmJSsrZh/q0g3XTHOJPfM/CxCBeAi6EDaunDvzsZhTjNNn4IpcoFNHHyOKnXXP3mNX+h0NSsOUlBjTxnGYyf5CKHiI11TYsan2ZXSYFNdb0oJ3Oh3l44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+CivPLQrKRzMnNNoanGu1K9lx6mybd5lPzSZa/7DDw=;
 b=SCCK2y1h7YoaEcXBqzdyCHT8DIkCOyVr7OpK0AEVkUmeFUAHsOiIHobVM62uYy6udI0gQrWtidxpQRUYQ5ag4hWdZRaoKukJurzUm8f+T+VVgh2wclxWNhENNIMWUEpDxvfrsfdCcUU1CcN9dpwB8BjNX3DfAfOBAZ/YxsX/GBGR/Vu9i+3uOScTY/5wk308+j2bL+PatwyvCbWeOl3Te0eabDMH+U4nQS4Z2/lqe7ou/5H153fS0T3B/xQ2CrisBmwuOdCcQAxdvzCsF64LPJHQUMHkjceYEmr5NTehmYIXjnGPHFZsEPMxhtbj0cN1fPTEHEgQlR0o7HfB+IaTIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infineon.com; dmarc=pass action=none header.from=infineon.com;
 dkim=pass header.d=infineon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=infineon.onmicrosoft.com; s=selector2-infineon-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+CivPLQrKRzMnNNoanGu1K9lx6mybd5lPzSZa/7DDw=;
 b=qGQMkAXVlsVDBpz8VwELqb1Ef71+pHe1+M4va2mTXOXH5LvhaOSPzInlud2r/drITpdhPYBDcO4fZ8g4C4vVm1KH2UrekrAa8YstnkueRyLGxLsbWCAZ5iG7Lo0Y8tl3C6hHrqAP7Ps+n+rgswDWHGSMEUc0lB4DWdPybDXFwlQ=
Received: from AS2PR03MB8978.eurprd03.prod.outlook.com (2603:10a6:20b:5f2::7)
 by VI1PR0301MB6656.eurprd03.prod.outlook.com (2603:10a6:800:17f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 18:05:06 +0000
Received: from AS2PR03MB8978.eurprd03.prod.outlook.com
 ([fe80::90f0:a9d7:c395:f8e9]) by AS2PR03MB8978.eurprd03.prod.outlook.com
 ([fe80::90f0:a9d7:c395:f8e9%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 18:05:06 +0000
From: <Moritz.Buhl@infineon.com>
To: <tpm2@lists.linux.dev>
CC: <Moritz.Buhl@infineon.com>
Subject: [SECURITY] tpm2-tss 4.2.3-rc1
Thread-Topic: [SECURITY] tpm2-tss 4.2.3-rc1
Thread-Index: Ad19B0D5gbeQLMyXTfuEePir3jqYBg==
Date: Wed, 25 Nov 2026 18:05:06 +0000
Message-ID: <AS2PR03MB8978B6CDA0F670209F9D6DC69D432@AS2PR03MB8978.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infineon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8978:EE_|VI1PR0301MB6656:EE_
x-ms-office365-filtering-correlation-id: 7788790d-48de-44c6-0469-08df4b1ea32e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|6049299003|23010399003|366016|1800799024|376014|18002099003|4053099003|56012099006|11063799006|261009223027099003|10067099003|38070700021;
x-microsoft-antispam-message-info: 4Xujiyf+yZIzyo5MP4JoZRFKw6PczdHbATEi6SMFxzOEiLzNsCyqGx45UQf+LmLI9oB/kXiL3+nkJeulSlPFc5QktFUYFCVXsd+RkZnsyOK6Ypxz88aEiDumFDKQTH8hCCYBOXesL6gLGHR3wMFyVN/2tsj9oh+4ytH5JnjckDWSZ/VPajKIW7OzSi+n6GZqWvLYKCrUG6QtfLXciQ10jw964lbbGkcigMSHH836Vd1mHfb3kpgmDlsQxgqZwfCKyYznxcNPLtKCgYjF6j3ViNnbMnhcdfbPtkIKmtGfz8s1JbEhQ7hT2OWynRfWxlTiue1FNf7bIvDJ2LBwiagzrwaTNL/oCfdoU2o9SUNV2EH3Aw1MM4xB8qGWE0Ivi2ZNsOxq6hHDzsYsxSM9eSIV7MHztXfTQVD1vJ0uhYfieqGcGtjH6b9YQBhlTaLzK3ADuv4pb4gRrTmnL7En+8Mg2MUuYQI6jAktqzgYvwziqNDfnutkkUqC13mK8CjhIwD1BHijFO2d/Qw99t2vo4JQiXtzVjfLfDu5jGUY8TnlCyv2ClWljh4IMf9HHiSBmFsLwYx8DTDi0CCPn5U2RD9nXsPYI4REfbGWpkZk1GcNhPZhPyBHefqEpWBl9T1s+HyZz1kSnYt7iWImlBdcPXRJwFLnG/SubMqtvtfJKaQKdhJBs7rM+qeiCbL9PTOHq5IoCFUYk5XHq/sJLcLBTT2OoOVFLS3K40S1wYZ7yPRd3yQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8978.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(6049299003)(23010399003)(366016)(1800799024)(376014)(18002099003)(4053099003)(56012099006)(11063799006)(261009223027099003)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jMt6HYR4WfEjSOadZtzGqFHhEiGbhnpGS/Dl0Eh+IihFaiIxJw8DVSalgd98?=
 =?us-ascii?Q?4YUMaXXRu9unEXLtnVVKsJPfcmq0oR53715rH6cv+7hJm9pNdHO//2BAvDZU?=
 =?us-ascii?Q?ydINExPo48GdibH4MOqYZ8WiWQXK43OpWSO1O2Vehj9lo9EE6OtZPIXb7Hlm?=
 =?us-ascii?Q?PCp+l6p3rOdmMGu5ghxqDVEHIbW3LW9RZ5ICpDudj4hLAScL7L3VvSdczQfo?=
 =?us-ascii?Q?jtq8Ag7hx9X1C+St+hIjBjLY7BCAwr7+IU8AXNA1YDnoSANp1VUOz6w92kTk?=
 =?us-ascii?Q?4aN/WqPhxE1tlfdW2t5+3jDn4g7ijMHUmgpuNhHKe7aWGb3+TrtHAWNekPcA?=
 =?us-ascii?Q?MDU/3Ahc9rHAngq5o/ULX9g3pejakcrhjKHGwfHVy8PJ2BzhpI1K3ZynoHKC?=
 =?us-ascii?Q?jAnsaWheqh1WuPULu6PF4nH7WYkFkXGGOE4NZGJnC5obrn8yoVJ+m4k3WDBe?=
 =?us-ascii?Q?cgy/pvuFelzz7oQmpxl1abtY1nfF/WdDdNptTq0qJ31t35mpMZ1CriIzX1Ys?=
 =?us-ascii?Q?rtMZxIIHg0PVr57VHx7V3nzopJf8rpJUcFCJsYgh5xX1AHAB/b7QDlIYrYua?=
 =?us-ascii?Q?21xW5D7rp9jfucM9HIe04rN7HKIDqHSswb5WGVSgyJzuzIye2azCWKPvBlQg?=
 =?us-ascii?Q?gEk3/5Pw4u82i4L4Y8DcXkNDB3knhqKUT0V6qJ+0Mnhq69SFoBIZcWcGzUOl?=
 =?us-ascii?Q?GUB9aMf6v10mCb6iFbY+/pdBw340vcW4E03ZVPykPtex0DDaDvkE4B79OS2y?=
 =?us-ascii?Q?sxR0u6B/4HiHIEMFUxU98Hpr4l40bn5Np+xtW6aJFog4jnlFY/9Vd9tOd3dZ?=
 =?us-ascii?Q?yazkhAAO1TFeB0zLTqik6yAcBg2UJCzLmmNgC7pAB0W7KB9aIX6SGnqwpu90?=
 =?us-ascii?Q?C0vhr/ZjReTkvOVQiKmKp/zMZovAkaCad96+nmDsPdQ2mmTKV/MFclxmEddY?=
 =?us-ascii?Q?Z3igmjtiiYeWnSE+/oOGtX9FRbfteIKYkaFIZgIzQkq0Ux8G9MHqwUihl+Ti?=
 =?us-ascii?Q?KI+pYCaJ/z9mTSyx5LgTa04F3uR4X8eINbqVJRveLa9iVe6VJXydOtdxsQ0s?=
 =?us-ascii?Q?hShdA0vpjRscDRXoN60aAEcBFQdSMP4VFEgh9DHM6zehLqfq205GW+VzhBo/?=
 =?us-ascii?Q?HmPa0JCyGx29KLG+aJkSIpXWkyOqoSp3pS1zBdMG0dSI1iPDDf2zeSIhuKN4?=
 =?us-ascii?Q?jJU5VYkvZEE1YBVECuoLYS5yfbYvFdZCg3WWzw1dnEkVRLbD5R8RQLa0T8H/?=
 =?us-ascii?Q?MhqjLLeHmegryPVt+U43n/XmVIf7bw8jMIMoal6v2I5qyQ2iIEOFhgWJQgxs?=
 =?us-ascii?Q?e92Z18b4W76wVpCyi9rkgeG8aGIgg1s8T3xGG9ihD3PVbhCzYlZTot3MXemj?=
 =?us-ascii?Q?p3gvWnodjgdq/FVU7+QDhCFbO6SAG1XBG11XrkjKYf05X0wsq1/U0OQUYNmO?=
 =?us-ascii?Q?F3iWqnhgDprERDwk48kCIT06XCRVQO7JZE+gQt8WqgddbfYpgdF7JyL/Cp+p?=
 =?us-ascii?Q?D4lLkTn5bGg/u/F8GXjnPqtwUHbnW19moue7cR8/8ZPW3FN1gvJGNWpInZiE?=
 =?us-ascii?Q?eFJwfvtgyZBBpiM81+vy8ueQJ587Sgt0krfmSxioatqGPiVRajHv9wzfqFUC?=
 =?us-ascii?Q?yk4Aq3CFW6AbzE0gomx2eC+OgXMRBjXFK1nwA7d/R3vC5IWggRZ3LvQdN2/l?=
 =?us-ascii?Q?GQFYAfkDityW+sxTBB0OniH085Y7hvVm59UcPUuLD57b/k1tsuxFdE9dSguo?=
 =?us-ascii?Q?ZiSvTyNz6A=3D=3D?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_000F_01DD7D0F.E1BFFCA0"
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Post: <mailto:tpm2@lists.linux.dev>
List-Help: <mailto:tpm2+help@lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
List-Owner: <mailto:tpm2+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NJoRIZ2HEKuQp7sPdsgWhSjT4/MPOxttHCpLSvz9D5mo96v4LvQphwGPZ4yJilDUnAXPsPgumEkZqG9s4h95ACzz4I1TsvZ7SX6yH5kFW+1Y0jCs+WNsnYDyROCbAICgGi7uaJXSaXfjTrSpFCEdZiHcnXOg3pTqR9ADl1+uTQeWgwxzYaz13T46p7sRTP9eEsEdqkIz0jS+Lb1tfvHJaeElChVZ8rlr43TXqfIyHcpC1oips7u4WcmQTmiUyVwHkedxA2xG8BLCpFRJZasHJ/gxf76aeXaOQF3lkzeMhwz2diDW1x84YdWlMxKAum2Iy1+KfUMf9d0N2bIDH5tZxQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8978.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7788790d-48de-44c6-0469-08df4b1ea32e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 18:05:06.8553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eeb8d0e8-3544-41d3-aac6-934c309faf5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 70afnZUz9EJqwLAuIutb7r5EdDL3vcJhzfBLSkiZM3sFZcKeyVhGkhyGXYEys1NQYKxD/jdwmhUGycbEMFIz6KAC0cILtNMJDtaJA3HVaqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6656
X-OriginatorOrg: infineon.com
X-SM-outgoing: yes

------=_NextPart_000_000F_01DD7D0F.E1BFFCA0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi tpm2 list!

I just tagged the 4.2.3-rc1 for tpm2-tss:
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.2.3-rc1

This fixes a regression in 4.2.x:
esys: update nonce for pure policy responses

We plan to release this on Friday!
Best,
Moritz


------=_NextPart_000_000F_01DD7D0F.E1BFFCA0
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
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYxMTI1MTgwNTA1WjAjBgkqhkiG9w0BCQQxFgQUjpAf
neKeB6qUybQEylT5fV7SDogwcwYJKwYBBAGCNxAEMWYwZDBdMQswCQYDVQQGEwJERTEhMB8GA1UE
ChMYSW5maW5lb24gVGVjaG5vbG9naWVzIEFHMSswKQYDVQQDEyJJbmZpbmVvbiBUZWNobm9sb2dp
ZXMgQUcgVXNlciBDQSA0AgMBJm4wdQYLKoZIhvcNAQkQAgsxZqBkMF0xCzAJBgNVBAYTAkRFMSEw
HwYDVQQKExhJbmZpbmVvbiBUZWNobm9sb2dpZXMgQUcxKzApBgNVBAMTIkluZmluZW9uIFRlY2hu
b2xvZ2llcyBBRyBVc2VyIENBIDQCAwEmbjCBkwYJKoZIhvcNAQkPMYGFMIGCMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3DQMCAgIAgDAN
BggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZIAWUDBAICMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAgBB4yQsrvi7aGbFWnul04ixoCS2UoW9oD7Z7o8aRYsmzT/6
MjFQAexk2vctM7u8YgTDRuZub1/qwwvnihn6hfQJzgjKbKQmBkplKvMg0uyX/zct+CHguqPYXjn8
6vdM0/FBMEZDwQVXHn+RZ5yT2cDLRtIxf2LXE/CN/vZzPCitXNIF4KzpzhajGaxmO8pHDLSE6vn6
jFxUSkWyvVjOuTNbXDCjApOBD0/FqtRPosuaUA19gXQ0i2UoXZ2zEIorCLWb+14XU9Bn3wjL2TrZ
btCPU4KhjTkWsuf57mvqWjKCNrnG22aO4IiH69meLBqaC7iwvznYYWHhneGkif5owVQPCh09pq22
8oYPh+TJ0PpdtBQhWFlGDekQKuLIwvhDejq5MKM+jKGxNmRH36OdHbckXNbql+hEHTCTFOZWwnEi
SWmKjXFLYS0uJFrhhHTp+sgLr3dJrNKm0V6X4uzf8EFKoLXPoeZLxwp37f2sP5mxY72HEmwEGKyP
szq5+7FBwblRXnSGo1Ee//bsLQcrkJNWuL856pBuplSqMe6VbWCslXkmmcrNqC1HWc2yEJTWHf9e
IS+5m812EsTnfjz4/hkjz7MryYYaftpCM3SkHOWSVqLNteYW4Cba9GuNz/n6KAJCsHQ+N4TAmKmt
g98GBEjcvreD2Dpnbu/Kokae2yzHdAAAAAAAAA==

------=_NextPart_000_000F_01DD7D0F.E1BFFCA0--
