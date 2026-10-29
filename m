Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=217.10.52.204
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793232170;
	b=aQfDRGDe6wPDqqa8ajsI4DoVFyvR9Y0bdJ2Zwh1QSKzPMsqrMRz3jDmnUMudqhwND8Wa
	 tRLd28keimPPN2aT31oPVzUrHXUC4hi0AGBwkEhLa0mqVus07eqsovg3yyCiwg8j9zoQX
	 o5efcn7YZres9KPilCagkc4TTptqvp1Hm0EAt0HR9An6y6T1+Yt4aQHnvhbOq2xw3ZZHe
	 PC4pcEASbuEqFLcEd0d5x7FnYmycloTp+W3RZtFLQHWhVM8gKrRkArHT3aOM242FpROpv
	 dW5BFGhMsoVSagMaxzcZ8W2wUA0AMek9/hQSuHbdAWnt5dgwU0EjcV4BvC1fllM0+lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232170;
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
	bh=KhPlYs8tsr7iQeNppsy1YMrnS3nz9BEslK56R441AEU=;
	b=dySD3Iukgd+GcpLdpHOiMS44RB+vK9i1ZZHYPsFImsnyqi6jbE7VSaMK7KmWI5zOHwPq
	 6jkKk8HDWnMJ374us/cTvSEr5fDBCgSwIlyHp3UYb92vI05BjTe2akLzixkm8nF96j1N1
	 5v5untwJkaDKAvs6iunXMt4/jIAjZv3OsKf8jT9rjcw45F+zyvTWroM7nOU0T6mURqn/F
	 AgJ/fOqJSnMLvYye3y5+wl8WoDd4Qaf6r90hWXPp1AmYccDJJK35dyUK/UssOJDpbrajk
	 LTbFl24ZGEAUE5RlAAicySMWSuzyc74YxkLWC5h3d7VIdUUpH7cfSKYuGZKZ3CIYTlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infineon.com;
	spf=pass smtp.mailfrom=infineon.com;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=Wv2aSAc4;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=V+W0ZmWk;
	dkim=fail reason="signature verification failed" header.d=infineon.onmicrosoft.com header.i=@infineon.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-infineon-onmicrosoft-com header.b=FQpWSDml;
	arc=fail smtp.remote-ip=217.10.52.204
Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88354606A31A
	for <tpm2@lists.linux.dev>; Thu, 29 Oct 2026 00:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88354606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=Wv2aSAc4;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=V+W0ZmWk;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=infineon.onmicrosoft.com header.i=@infineon.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-infineon-onmicrosoft-com header.b=FQpWSDml
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1793232170; x=1824768170;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=hH6sd4bBF7QxHBfIXjRxoy/gwyI07D4873nDr+tONM0=;
  b=Wv2aSAc4cM/yWzMkuAbxev1sNCK1mgU/9h3GwiPvyFPkqjS1Y/r58Tsj
   xJWyG+8Ne+DHPZ48di7UoRCSJGTVIyXXPQbTP/vlcvGiK4gL5S1wcft0J
   qm/Qx6pho0J0b7PXGIv6a97gUaFMO+C4FE+tIcSvpqtnpWaxRxCP/EmZP
   w=;
X-CSE-ConnectionGUID: GnYQN25XTBS/iY30I+p6+g==
X-CSE-MsgGUID: AVrLxzc/SFSuB7/IP3cQbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="115556503"
X-IronPort-AV: E=Sophos;i="6.27,183,1787004000"; 
   d="p7s'346?scan'346,208,346";a="115556503"
Received: from unknown (HELO mucxv003.muc.infineon.com) ([172.23.11.20])
  by smtp9.infineon.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Oct 2026 01:02:42 +0100
Received: from mucxv003 (localhost [127.0.0.1])
	by mucxv003.muc.infineon.com (Postfix) with SMTP id 4jFPYs21vKzbkj
	for <tpm2@lists.linux.dev>; Thu, 29 Oct 2026 01:02:41 +0100 (CET)
Received: from smtp11.infineon.com (ironport-smtp11.infineon.com [10.32.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mucxv003.muc.infineon.com (Postfix) with ESMTPS
	for <tpm2@lists.linux.dev>; Thu, 29 Oct 2026 01:02:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1793232160; x=1824768160;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=hH6sd4bBF7QxHBfIXjRxoy/gwyI07D4873nDr+tONM0=;
  b=V+W0ZmWkXQg/7LdnnMcj0SaeVvVFIhrbuWdRezxjTvqEiooJp7qLhwIb
   +8lwnohLsvR6koXcA3RoGr4zizf2MVdVo8HI1WAdkMo2bXx96gYFRKsN4
   LcBDcX4lv9IkJY+6EcZma43STQu6F2NrDHocqCN8ComiBeO+fr7bPo/xp
   c=;
X-CSE-ConnectionGUID: 17FFA614RRW3QfLR0jFQ/w==
X-CSE-MsgGUID: EVVKJM4lTse5yx2YlykojQ==
X-Encrypted-To-SeppBox: True
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="167807603"
X-IronPort-AV: E=Sophos;i="6.27,183,1787004000"; 
   d="p7s'346?scan'346,208,346";a="167807603"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 01:02:40 +0100
Received: from MUCSE823.infineon.com (172.23.29.54) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 01:02:39 +0100
Received: from MUCSE801.infineon.com (172.23.29.27) by MUCSE823.infineon.com
 (172.23.29.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 01:02:39 +0100
Received: from DMUCS0010.ifxdmz.net (10.32.24.68) by MUCSE801.infineon.com
 (172.23.29.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 29 Oct 2026 01:02:39 +0100
Received: from AS8PR07CU003.outbound.protection.outlook.com (40.93.65.54) by
 ifxsmtp-edge.infineon.com (10.32.8.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:02:39 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMcNiDfSNPybmM2u0osBsVCyYRQ9TMUx1C7UOM2HGYiVsr/g34H77+VfZB2/qCQsPI+X95A9ZChB7f07PKIjOfScJFqDmw2sqI0CqoQZnyWnlEQ929F0qQ49W2mzcfjk06NuNZx7R/H1aJ8vhsvl0LyV8NSaZh+t3/78Cxg3BvR83UZAmXqXAuU3xiutnIOQcqk+Z6lL807DjPRW9Vi2c0DmImXioG+TkT/jxKJ+ISPNiW2xCT5B5dILo9Ttd6FUwsj7ckdfJ+z+MN+IvYaSf6MxtWyHJEYXVU5hNcSYJXH7B/21MNKDYEyr+iUhDgjGgk45blMMM7aiBpJ8PYMdSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qHScwmlXv55OJxC8D/CYEa1+of0/hVRo1GZ6H7sqxM=;
 b=XTrvmRUpngb+lLcbuQrPjx0klvTDOk19abrCnVVH43sCXdKafQ03BblUM7zqsyw/2y0KKT6QHfbxGwKQNRKDJknHS6OeRZxBKCptTyBV2dyf3OApVZqe4sV9Xl3J4TaumNmXqWjMx5CnuYRxIIR8LmotebzEMxCIam291WQFPo6AlZmMndu5MvjfVAWxVCwRqDCNJZvjOT0/ry68Gj1wkYku3L97kwI3bK56zZDF2v2IWBpohpthApSItI+1IoOZ42zAWLwwOSrCXOQ5GZ+MY3RoJM0S003SXrY6Lu24xgC6Hzv6RWF0d4PtmGyXtUdeq93HUmpaB24sbqml1ULYVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infineon.com; dmarc=pass action=none header.from=infineon.com;
 dkim=pass header.d=infineon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=infineon.onmicrosoft.com; s=selector2-infineon-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qHScwmlXv55OJxC8D/CYEa1+of0/hVRo1GZ6H7sqxM=;
 b=FQpWSDmlZBgee4ijYleJ1DiCY+fQVjnh+3bEvn4753Kdqkb3JsfaswFnP+2xmR3K2sBwxYfQh1mbxjPJtQcuNhPD1hjosxok3gj0nClPFgHo8EFnsvOglLUeVYY0or7cr53WnyxRIRDGAnxXx6jyCetARf2Hhwp7jubVjvm1KeA=
Received: from AS2PR03MB8978.eurprd03.prod.outlook.com (2603:10a6:20b:5f2::7)
 by GV2PR03MB11277.eurprd03.prod.outlook.com (2603:10a6:150:336::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 00:02:35 +0000
Received: from AS2PR03MB8978.eurprd03.prod.outlook.com
 ([fe80::90f0:a9d7:c395:f8e9]) by AS2PR03MB8978.eurprd03.prod.outlook.com
 ([fe80::90f0:a9d7:c395:f8e9%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 00:02:35 +0000
From: <Moritz.Buhl@infineon.com>
To: <Moritz.Buhl@infineon.com>
CC: <tpm2@lists.linux.dev>
Subject: Re: [SECURITY] tpm2-tss 4.2.1-rc0 and 4.1.5-rc0
Thread-Topic: Re: [SECURITY] tpm2-tss 4.2.1-rc0 and 4.1.5-rc0
Thread-Index: Ad1nOBeiB7Eiree8SeuM3mKsgq6tow==
Date: Thu, 29 Oct 2026 00:02:34 +0000
Message-ID: <AS2PR03MB89788A279C8C44727117EA9D9D6E2@AS2PR03MB8978.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infineon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8978:EE_|GV2PR03MB11277:EE_
x-ms-office365-filtering-correlation-id: 5872b946-5954-43f6-462a-08df354fefaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|6049299003|1800799024|366016|4053099003|261026140227099003|38070700021|11063799006|261028144727099003|56012099006|261009223027099003|10067099003|261022105027099003|18002099003;
x-microsoft-antispam-message-info: CuGXVcoFcYZuNqW9L5cjW4t4e3t/OzhMfB9gx/aiSpNu+wGMK51jiCBX5vnzlPe3fBcXRg1Ng4uaGzZi3SBlYHUU0AVjmSHVBOF6tYeoIGAggG0j429iC1t9ttvCMxRXCzErL5tYV1GFcsElH7agaq1u2grpa4bGisI8kdvGJ9aqD2897dlL5VYwCgCY/qfc/M2w0kpGBgjX+s5mEE9CUAnnIf4ry1SqCgEuWNSbNMpxL6ApK+JRAloWVlcjutJPZlJayYADHUyuoVOMYBUPyURtZYD9YtA8lGe1mdgmkISSwPdG1xj0zh+ARtmS+TZF55dloTo4/KFOx8Bm688Y23+upPMyt+/sq2fcAZxUny1eKWgdtRto3PRZCSVTqFrQu5vx9J6eOEPDgivwiXOCgIw7Nb7ecrbxluUsJNepGaPeyGsaQn9hFYXGAHYKCq6wCx6AbWA/htMYKgv30dzHcA5MgcYSPU/A0x4odQh8+nmgWVIFKN12tm4Wt6ZdY56tZsG2TNviHzHZwNl0d4VtmBJd2lY9zKagRmw17+b0Fp1/11xdcjO+1G/pSZA30pY56vHa7Yd71of7gIv+Iu+DTFF2rNvHygTiMN2mTqRxTr7bxG52yZreD2O2Vfdmpi7f/L4hfksNcB+EFSLZeb/gfpLYL6SgbhHuTG7jNThxzP8Wk6wb6VsxCPvdPVXRUIJOjJx73/PtVSvQZOHbx+DjajxvtDDKZGa9avhi2D424P8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8978.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(6049299003)(1800799024)(366016)(4053099003)(261026140227099003)(38070700021)(11063799006)(261028144727099003)(56012099006)(261009223027099003)(10067099003)(261022105027099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RTh6gkcEaK0rU/kZrPYNq/q2x3HeQaPF5zMUwtvq94mS+2l3r8Qf60F75Exq?=
 =?us-ascii?Q?tSKgGuU7vW14xkLkTCxMz/j9LkdxP9gaJLrad+YCR4U+4+ZORZ136izWYt/u?=
 =?us-ascii?Q?jduMz/qYy5dBelXvRCnDuBsWhiZVOAFd1Mcckw8OawsqA+ntwZk+UfXL+EJ+?=
 =?us-ascii?Q?pCfJmbqdkbfyHoDFHbUVKTUemD6MfUhoswSSR9ATdcNqV/BsO3xgRn/npMw6?=
 =?us-ascii?Q?U/yO3Fx7phM01UfE6gmPvvaY3C2kbCoGURJANpElCdm4HRuuCfk/8sROu5g5?=
 =?us-ascii?Q?ko6S68yKJN2RKHtGcg3fy/nIC9Sm8DRrx32uYjdNfHjHNW3YxX0KgBBXBqsn?=
 =?us-ascii?Q?oxwnixm/uF+34wts/0meLMDsxWt/YhBhBDbKoO9UseajnVZr9OwfJnc43SUw?=
 =?us-ascii?Q?lR+T0SsQYXgbhItvILMWfjtI0iYqCMgPvGxdtCsjSUneaUIc2mcDPmazmSG4?=
 =?us-ascii?Q?8GnTsXaX2w+DDbcLLjPJceGAB+E3uKVm54YMHWCvIKKYTYArPuVMv3W/Y6Vn?=
 =?us-ascii?Q?ePF0NRAKklICzgrlTJwjmykzcKiJg9PAKO8isddkCHvZ957Uvoqi/sHJvz/Z?=
 =?us-ascii?Q?10JCJeQabQpZR2Ke0mBcV3BiIM9q/peSn23uN4t06IDf0D5Sqsdez7HIOsKO?=
 =?us-ascii?Q?f04h2FIvtU777vZA/L+nRbZ/l49DoUytdl7TRvHGk1PETEc5FNHM3gJ8a3Mb?=
 =?us-ascii?Q?tGH6ekcA0ehRKnN9xbt25lpCXivwsPLCAq8n8fqU3A96fDyVM9g+IZpzxP93?=
 =?us-ascii?Q?+k+XGNCfmGUuFQ8+OI9qGJpk8rmFgM0Snp8rCrt0sZijS9msEpEcnCBnCTGx?=
 =?us-ascii?Q?CDE8x+Yb3mKGhRSX2bchsW9m2Z3Lpwfap6fsxusFhDUQkyzrBODc/6RKV7Zt?=
 =?us-ascii?Q?PuL8rNhfjbAD122NkozHBQ+jtlEGz9b5yjY54ocftX1dfEWBFSf/Gu6XgWNy?=
 =?us-ascii?Q?iqI8ng0PCYf2tc7UBeGGIv/xEB0dpa0fvwiErkmpW7pSXi6XvumxJyERV/Hr?=
 =?us-ascii?Q?o07XdHvqJxrZjT/dVbI8HPGMGpEFrcv6YieEM+kJKxdkxl0Qt74pXYqFPdC+?=
 =?us-ascii?Q?7nvDK8RqboNSWDn64eQ8R/hBiNima5aJ9OHS/Griqn9SDEwnpuRCNSa24no3?=
 =?us-ascii?Q?IKDGLJkdSUCwaLNQTD3nrNHomoi5CimZIkR9yDPixpCrTTNuVtcAvchQSERo?=
 =?us-ascii?Q?B+0Fnuo6vyl9u098M1MD1X9PdxI9vk9y44r3fqHlGX9CsZ4wuUjCEFMoo4W6?=
 =?us-ascii?Q?XQd3YLJrS47aifXp8fJsd1IRJeng7F0zqEMW64K061WHxvqMipN24GXpNcET?=
 =?us-ascii?Q?bMDAXy93AiLnPlAUpLpVG2yNT85++hE2K5+gUUuSlAAl4Zg81zneyGro+yYH?=
 =?us-ascii?Q?H3ubN+O55FyeFOf60Xb5cPqOaJHzp8TxfDJEZkLUcKY/j1uI7xxEp7V26RMI?=
 =?us-ascii?Q?Oc4aZV0eeGkdKza9v7lwB+L9biaP96GHyW2A+fxEQ/wULJxLYJv9papB6YcP?=
 =?us-ascii?Q?lZzYonIAjQ0j0OnHG9Lt2UTLJ+9piFybVqZx9ZqTaXhhT3T8Bi+6ggQnOXee?=
 =?us-ascii?Q?eaouuQYWMw2CInT/yWpXaGHcKo4InuDm0X52zhzvLxETnz3fK5nw7e7+v5UM?=
 =?us-ascii?Q?tjx5wMicgQRcnP9VbbQ+DCmqL3+8K9nzNiPhKu0QwdG2wA2wYLXs529uRfX1?=
 =?us-ascii?Q?OVDx4MLPxBqBF65NXnPiKG+JOHXvX4nI6JgMehEwq06JeyguTbD068DpICrk?=
 =?us-ascii?Q?+pMoPJL0QQ=3D=3D?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0012_01DD6741.2E2DEDC0"
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Post: <mailto:tpm2@lists.linux.dev>
List-Help: <mailto:tpm2+help@lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
List-Owner: <mailto:tpm2+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xEYPmTko3tfom3Ziw+qZ76Y7Kum0d8ZcTCTTlkgw2SjXJB046ohfKiko729IdbPszScvNsUXrZ+P25iBIo2FZFsO62hO/dZAcZ/GcinTDhJKvjiMsXAyQ34c/8CKPaIkj8Eq9CrjRbXHq0gVRnQX7LiB7jQBdQv5CxbBs1f/UfTzBVLVDYzz0XM/gwpApGGVjcZYmK30Dbvnt9j2YnseGvL3IjpO8+vZfyoKZyUJ+Hh/XMtHm8R99UBG7pKHb8YnLJUynvnUSq9zF78zolxraz6YBmxP82rf0M88zAU+HtK/HQeLM9mLjlABCxyyPINqTETfR1omdOPkt5dL/AF59Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8978.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5872b946-5954-43f6-462a-08df354fefaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 00:02:34.9094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eeb8d0e8-3544-41d3-aac6-934c309faf5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w8X28PNWTuYJ24Dne2qNrVQ6VO0CZ/haImlA6hRFIN71PXwsPZBN64N5AUh8qX1gA7pEfHzlEtD3gzIEzgKn4mDSkg/IJP+eCAyl0/PkpDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11277
X-OriginatorOrg: infineon.com
X-SM-outgoing: yes

------=_NextPart_000_0012_01DD6741.2E2DEDC0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Just as a formality, I tagged
https://github.com/tpm2-software/tpm2-tss/tree/4.2.1-rc1 and
https://github.com/tpm2-software/tpm2-tss/tree/4.1.5-rc1

This adds one more fix for a buffer overflow and I forgot to add myself to
the MAINTAINERS.md.
If all is well the release will come later today.

Kind regards,
Moritz Buhl

------=_NextPart_000_0012_01DD6741.2E2DEDC0
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
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYxMDI5MDAwMjMzWjAjBgkqhkiG9w0BCQQxFgQU1BZx
k+F1d8nDkF+btKlFG1MQHj0wcwYJKwYBBAGCNxAEMWYwZDBdMQswCQYDVQQGEwJERTEhMB8GA1UE
ChMYSW5maW5lb24gVGVjaG5vbG9naWVzIEFHMSswKQYDVQQDEyJJbmZpbmVvbiBUZWNobm9sb2dp
ZXMgQUcgVXNlciBDQSA0AgMBJm4wdQYLKoZIhvcNAQkQAgsxZqBkMF0xCzAJBgNVBAYTAkRFMSEw
HwYDVQQKExhJbmZpbmVvbiBUZWNobm9sb2dpZXMgQUcxKzApBgNVBAMTIkluZmluZW9uIFRlY2hu
b2xvZ2llcyBBRyBVc2VyIENBIDQCAwEmbjCBkwYJKoZIhvcNAQkPMYGFMIGCMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3DQMCAgIAgDAN
BggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZIAWUDBAICMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAgAe9OJn02JI9cVaNgnjfEjHHvrD/QRMWJkOF9NFsqyjs6Da
eeTMAFw72s3+x+nHpl1IYpWoyTrnFML+rJmsAIzSs7bg8A5ZB6KWpyAZE2Z0iT/m+0+ZZP4fCOFV
pHg+oztB7AhCdvwOqYdWsTX9W1ZsLY5ASBcGzH6eBcwS1prDGCdgF6JgjdyzRpwLxFqlQ9/lxUl+
YTxWW8NPGY3alFkUH3XvZV8Bjq+jaJ/uH7DsLc6VRW04ptzvRmuPcqL6oueLRVhA8/RwQrQy3Dl/
FDiacrZh116sXuPVI8uD3NgDGqiDEzb/at/SBfRzOhvMYSf1cZhn5nivHaubk7SIXkiEAwHzVdE9
OFpPtgo2J8PewhqbnYPTS+FcZXPpa11acW/3FV6ZCWrHU0Ilf8zNo9hWySbseALAFWyxn5uCbf4t
P0egGRu3m0xwF3TKYAPHL6rssYs1UpHI9tuhF0maw5VrS54kapyFd/52RHFY8pSEQ9QPYm6gi3Ix
lf2YFOQLYBmxjeA/Al5722ruDXB97zCGmFJ03ugW3mErxet1JJYeHRnLxA0QJxsv4+55AkmPgY7A
O8XqN68SeWttTzkHCvYIsteSo+o9fHPvPhsxyQByelDCfweFuZHd54RZJuIgAnNAHdCoHgyTieKT
fTA62fzsqNOv5qYI2rj57JyS0pXC2wAAAAAAAA==

------=_NextPart_000_0012_01DD6741.2E2DEDC0--
