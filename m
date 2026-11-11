Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=217.10.52.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794388281;
	b=SmSFGUHRmAvF4t8Kl0XP6cdPmlh31hWZol4ZWgqfvGcc3d8h2lTkyBAQj94Qm8jMZik5
	 JNEo0KGeVHVHK+xSX4lTvHZ2wPooqX4tqFUHaApAzpGDGn1d+qdlUrIHSFA3coo9T+Edd
	 epcAUXgBgKOISTgKAq4+r0AKahrD/9lSD/XKAS1J7lB3TtaTUDyao9DGG+PxDef43z9L5
	 Kh7Phy2BzO5UutxpAyUSKEBr2utJ1LqgEd+jdLXPSudqdbFcL7gFa+wIszbZO4jpbOKRS
	 9rdT8TEN5ssNLFx58rq1e4Cq/hv4GecJkfC4fu3oXfQ529TJRVwZlldSeNY8fvuGsPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388281;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Received:DKIM-Signature:
	 X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-Encrypted-To-SeppBox:
	 X-IronPort-AV:X-IronPort-AV:X-Amp-Result:X-Amp-Original-Verdict:
	 Received:Received:Received:Received:DKIM-Signature:Received:Received:
	 From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
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
	bh=irXO7c53JlNLCOW6AGt0p7TwFJgdjq6TMhZZmiTMVDE=;
	b=pYoevj9CYs3fOEj0CM3xcWnRpzlG6gFj1ZwaBsDE+lhm/AYhYfJTajdgn2DetcajydyQ
	 HvbE7t78qPkjWtjQewruiyVvT/gnb2HTxEhmSVn/VBsjJTEWTDBZsaqlPJeTi8//+eeAO
	 MhHkJ9Ul4ACQd6rqVue6Q7F3v55sNcUFwWcgViId82fB4pFcBzMFTieSnI9TUdI+aPMLn
	 4o9Rs65nvb0cZxWSLBdlN8ebrzUoU3Y34eMFOlEd5bqv3AtFFOwcfj7h3rJKXhWS6gIac
	 gncQeOQkynYsHHEf7ZtoFTzQc3RDiMOmkarcwKRTRFQi8ifZVC5ASeadMjb9tQtpVjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infineon.com;
	spf=pass smtp.mailfrom=infineon.com;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=ACd7SubF;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=Hgi4X03f;
	dkim=fail reason="signature verification failed" header.d=infineon.onmicrosoft.com header.i=@infineon.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-infineon-onmicrosoft-com header.b=U5s8oKQz;
	arc=fail smtp.remote-ip=217.10.52.18
Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC0A606A327
	for <tpm2@lists.linux.dev>; Wed, 11 Nov 2026 09:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC0A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=ACd7SubF;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=Hgi4X03f;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=infineon.onmicrosoft.com header.i=@infineon.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-infineon-onmicrosoft-com header.b=U5s8oKQz
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1794388280; x=1825924280;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=a7F7THM7iYE1Clj7fiOrXfalNgiyYYI/iTbkybXYjg8=;
  b=ACd7SubFfRz2CUHwi9edldPzpvWeWP7y8ap9mmKQmV9eR8thunpM24uq
   +PP7pXz/Zg6jLJowPAoOfYG10mAH/YKlnrKuHFPltzPF6Z6OQly24lu3R
   Fn9h34PdufVay+6+0YCeWVkGdBLd7pFsMIuk6Okpslxnsr1fmMuPNPPwW
   0=;
X-CSE-ConnectionGUID: pRMWqlNgR7We4dXBQHRowg==
X-CSE-MsgGUID: 8eVmKZfxRD2IM1S5mk3zxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="189226800"
X-IronPort-AV: E=Sophos;i="6.27,207,1787004000"; 
   d="p7s'346?scan'346,208,346";a="189226800"
Received: from unknown (HELO mucxv003.muc.infineon.com) ([172.23.11.20])
  by smtp2.infineon.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 10:11:12 +0100
Received: from mucxv003 (localhost [127.0.0.1])
	by mucxv003.muc.infineon.com (Postfix) with SMTP id 4jPd6l1glCzbkj
	for <tpm2@lists.linux.dev>; Wed, 11 Nov 2026 10:11:11 +0100 (CET)
Received: from smtp2.infineon.com (ironport-smtp2.infineon.com [10.32.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mucxv003.muc.infineon.com (Postfix) with ESMTPS
	for <tpm2@lists.linux.dev>; Wed, 11 Nov 2026 10:11:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1794388271; x=1825924271;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=a7F7THM7iYE1Clj7fiOrXfalNgiyYYI/iTbkybXYjg8=;
  b=Hgi4X03fZG/ydjG2/EZJZf76H1TFN/kJKyHlHgxVaA2WvZx089ADnAXO
   VTisjcOsckWBvlmEM+pIykbXJIoEV7Y8s0bwqAFBRgFdvspvMZ5L47/eZ
   HXDXsdEFG6YsNKUD1v3LVBq8nLdp8q+4e/KGGaNAotSqKk5yznmiBi+Za
   c=;
X-CSE-ConnectionGUID: gTqBlRTvTOqZflqFOO5Dow==
X-CSE-MsgGUID: WDZagk6RQRK319pwyyl9OA==
X-Encrypted-To-SeppBox: True
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="189226795"
X-IronPort-AV: E=Sophos;i="6.27,207,1787004000"; 
   d="p7s'346?scan'346,208,346";a="189226795"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:11:11 +0100
Received: from MUCSE821.infineon.com (172.23.29.47) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:11:10 +0100
Received: from DMUCS0011.ifxdmz.net (10.32.24.69) by MUCSE821.infineon.com
 (172.23.29.47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Wed, 11 Nov 2026 10:11:10 +0100
Received: from AS8PR07CU003.outbound.protection.outlook.com (40.93.65.51) by
 ifxsmtp-edge.infineon.com (10.32.8.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:11:10 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5YJ28mCYKVM/1QB2QLllOxMnC6TfJWXmF2P0I4OJWc9UxlyMPZoSkZrsYq13S1kPGqiUuxEvRUeOuFstu3CBuNNVHaKG1XhMY34TQVbtvfYuYX04Kfp0THYoy3J2Dypk0k+UZmFgnDobQS8Eh3C1Vrr8kZFWHYsZdcAU8dYarfSu5JoUYTJr6a7D7UJ3LHIYTfVZLmCNNw6fXN0vN/NXLwx3VJ/bs9e7aoNtqpsLfPDV9BupId16cpmfzdVvQElPsoAfIOdGXp9TBWMmjJ2CqoS6ExilSG1B86ohvPNdMXaHzwxN1a8NUhMGVbOVdsfo3/zJOhe+khV0j7vDrFE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwgCGPjFV6+TBwI7YEm8p2WvaDznpyfuJaUQhfMEI+E=;
 b=wa0uD9fJxkC9B1ACJkpA/SlR9t2HPHs2cr8vG5MVwWROsfQW2351UjBSDk652rRux7dUJPtL8IqOYS9rVL9JW7FqVOddCjReLZ9Tvg2WW0/TGzA1Ro14tHCmavB6g+tRyum+Sdo3l7XdVBhF69XJOla22xgKg4WjTKxbGVmvvPp3/WGAzqh2ku9/E25DRz/bTGXlklXLNr+NWs2STCzFVnMr4aVni2BXMrZqPPIqJlEaEv2xQeWLOepYWeEse3bB/kh/HF5KCAxamR0CXSaa1gNIEf/p9WwbHUShqH7fp9tbHNmFBHvm4M1ypVfqeTUdyaCu23hPkLkKXGsURHcwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infineon.com; dmarc=pass action=none header.from=infineon.com;
 dkim=pass header.d=infineon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=infineon.onmicrosoft.com; s=selector2-infineon-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwgCGPjFV6+TBwI7YEm8p2WvaDznpyfuJaUQhfMEI+E=;
 b=U5s8oKQz+oFjaRKvuj/LtWDvH2rn7IcvrDAFWNQZTfWPVtZjZWeZeec35VcrtsJ7T3Opp0y9nvhgUzxiEIFV0J7D8O6VkN0clAWoBEApyX7+cDj6d3EnK2ZiHn2oFieAaqXVZ0o5aPdy9THUc3TDdvbJIGjlEjFFlxQo0PviLEA=
Received: from DU0PR03MB8983.eurprd03.prod.outlook.com (2603:10a6:10:478::18)
 by PAVPR03MB9211.eurprd03.prod.outlook.com (2603:10a6:102:325::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:11:07 +0000
Received: from DU0PR03MB8983.eurprd03.prod.outlook.com
 ([fe80::64c0:bebd:8710:3f63]) by DU0PR03MB8983.eurprd03.prod.outlook.com
 ([fe80::64c0:bebd:8710:3f63%6]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 09:11:06 +0000
From: <Moritz.Buhl@infineon.com>
To: <tpm2@lists.linux.dev>
CC: <Moritz.Buhl@infineon.com>
Subject: [SECURITY] tpm2-tss 4.2.2-rc0 and 4.1.6-rc0
Thread-Topic: [SECURITY] tpm2-tss 4.2.2-rc0 and 4.1.6-rc0
Thread-Index: Ad1xvHcKY/TYYcPnQWu7jThWfkuZtw==
Date: Wed, 11 Nov 2026 09:11:06 +0000
Message-ID: <DU0PR03MB898335809CA0582D578311A39D712@DU0PR03MB8983.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infineon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB8983:EE_|PAVPR03MB9211:EE_
x-ms-office365-filtering-correlation-id: 6c16c9c5-96e7-4cdb-9460-08df3fd3b7fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|6049299003|23010399003|376014|1800799024|366016|38070700021|10067099003|11063799006|56012099006|261022105027099003|261009223027099003|261026140227099003|261028144727099003|18002099003|4053099003;
x-microsoft-antispam-message-info: wHKQrfpg1sAXOJPJXGXIABVKe0Em7GeHdN6ci1IQ25DQZPNfxq2jq6ZXqZLzAZ2mQqEAup7W8HBleJEKdImgEcCv6uPS7tsNtxqGXpMAxjzdf7WREhruyJkx8fljJN8wOz6k8WT3GUkV59J2MT4eAQXWuAzBDuYSr3SPAxuCKueN62Wb6o7MlKIO0yyx4Ih0ybKk1Crg5GWDYWHfgG9c8k/aLXPto0fXsoeTtMtsQTvOT+c782yVoZK1HfExSwKOvbiOFEEJRaaXg7XknVWOfisRUax5un9gB2gUdvKlTPA3rKx9MgpvcjX2KuM9ZVWppbsl1DYPcXQNv0/wkrbMfO3/BS+0CJlAao+yHvnnKVAGWH1SqUBcYA6+9ob5S6bZMJF9y1i+Z6XZyngG7hG3SYwDuZ4f3EP0T3S93P287TC5ykqxsoM6+2ez/uzChuzeWeJ1pHdi7MYsbnELx4sovTkwyx7MNW1ggBQmaX+nOh1nf3xK/ZZz9GRZpqd6GPcdnVpROGbUjA9ufSvbM9bY0yRFTNBqXzXkaexNh8KJN1A6Z34K4L8k4lwr3+2IOcq9yXGvDUHzwpps+T+TtWZscRdWKbX6coCTT6qcidxaH2m2d63l1jND/gJ9QtI570MW6clUfa16u7BpEEXwyM5MiQCWnfoekWZn7HK43WYNgU3hGv4Q4KTKDJ++qaiaDrvbDyRVZoN4kaXqkAGhQygqdWntK5NKjnNOPrjm4XBJK3I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB8983.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(6049299003)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(18002099003)(4053099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PyM9A5QBep72cGqA92Z5IID2/m5L+mW4Q4Oao4juXpZSk0uYqjNWKLtV0rej?=
 =?us-ascii?Q?7krjZci5bsv9ljuXnqmL4KAM2FAbUizq022I4dqHwyEKkUrgHkO19qQSS+Hu?=
 =?us-ascii?Q?VrpdufUHdbrDkF/PgR0QMH8//b9LMh3SLQmierv4KXO57yyCXVtD+dUkfKRc?=
 =?us-ascii?Q?eIvhLQwIZn6H8M+HHbXzhTEC/+IifLvqhNBHRHIAPcuvPlDUI+CkgtLq/GTL?=
 =?us-ascii?Q?lgfTHI5CyPeHcw9NgN1kMq1CZ38zbg9W3REW5kFd9fnY8P9kGWjZFFD3ocHi?=
 =?us-ascii?Q?fYNO4T2I5YA3dUWmCbm7vK22dCE+7SnZyAiP116tGxH06Lvn1H220T36TFLF?=
 =?us-ascii?Q?cYeRYsYlI5XMvETJlaSigPxyjr0r6FXV5l7RcS5BS3e8JbfA7KISpkbJBg0L?=
 =?us-ascii?Q?lXUwfFl3/tenGBl3YAHk/ZsmzP5mFCkmuyJEz+iYWzufX9KwBeJzESZWuVGZ?=
 =?us-ascii?Q?cbkUZN06gU8NkMDY2GTpiIrIPKckVPk9T/alF38IqvfZdeK2KvrUMZKK6ukT?=
 =?us-ascii?Q?0CQB6Gqr8aoSs7v6Eds0DoMYhS5lEb6hQknDN3cY4rfB5aynS2ZlXdE26Loa?=
 =?us-ascii?Q?6j/VC0zoElNGAdAQK08GpimMoIJlfeWZRNumn0GEl2QnezHQnfGMTtyBm6Fu?=
 =?us-ascii?Q?queB5cliiM2nl/D7azt/XR1+RCxSaLapzF8hFHfMxYqCZ8AnHmWYIkBhtpTq?=
 =?us-ascii?Q?DEz0kBaONrpGKS1T76OIO4TsQIV+iaLMfuU9csw/nKyPoO3mKGJwTa/VgOUB?=
 =?us-ascii?Q?uW6e80qD05xDJxMK132XErQG6lu2UT1il20hvi2yNlimsvxOqwl0KD4IUweA?=
 =?us-ascii?Q?Fr2FqX13Vsi2GN3UN4lXg42Zo9AUVgfaNw+7bjz2MX+BaPxu/1v4YEqL0Izj?=
 =?us-ascii?Q?p7pfJbLg9AbrRG3zHtiIy1ONghH17w7l5LN9edSkiHc52F90siXdAZHfTQbb?=
 =?us-ascii?Q?8TMaarqfWWJojvE5fF///Z1aYW6d4hiszWMOtuMB6CLQZ84cY5rafBhmUoBA?=
 =?us-ascii?Q?bCoT/A4rnVeju08XeyCj6/IQ7s4lPxpW+EbgM+UnbFXWlo7Dm+EL8kqH/rp5?=
 =?us-ascii?Q?u6t+OvpUazDmXxIg8mT32KuT+B3aI15BfhgbqeVjO7tQtNTCBb2YpaL11yJS?=
 =?us-ascii?Q?Egt3pqT1hwy22HL9Tq2wZ6V2z0W84S7Y5vQl4+2hBavevD0LsNX8jUOlmQ6O?=
 =?us-ascii?Q?ZOAJqp2tGznc6xsC8nUeZ3kwnEfMBNIufinsZVV8DZ4Bty7xUUdmeQ3xTmJ/?=
 =?us-ascii?Q?FetHyZCY2iPvS59SCd6ojNEDnOHDDI2uzjW36JjUiwV1wLDSeKO4xR/M/LPS?=
 =?us-ascii?Q?QEkzsNPGOrk7rooDkbR0IrrhocmXDy6wPA2jrisT8hBzdbHgCi3HiYLxwbfm?=
 =?us-ascii?Q?E+gxv0hM0i1AcEEfafHqcb4qWbyJ18R5VgVBqfv5gcS6B27uNDSNi3QcZaQs?=
 =?us-ascii?Q?EYubb6dYVWOAriSs9E4kCdEI9XUpuczSXV2vWRki4/fkfSVfEwDfv1aiFuvw?=
 =?us-ascii?Q?phBtdnQvDEHVHS7CN+WGG9ujlhMRyaqkHJtifhKbWhbA0dr7pSxtcaxhhNRy?=
 =?us-ascii?Q?jqefyr4OTGKk4Z6D3weGsvkvWmN3TXUV+4XpwMutEga0ESUWUh/GqgUnI+zY?=
 =?us-ascii?Q?IhaQUECynwwuNNyiFddb/GHlkc42SEoN2G+kYa7sPigbF7FB3efSUPPpOUtr?=
 =?us-ascii?Q?Lg1DuNpJmUltLdAsRvL5xlHSz+6YY65ZVKd1BDGUVad5u+3QUEKKP+zkPSfs?=
 =?us-ascii?Q?ZsPfzm7Mww=3D=3D?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_006A_01DD71C4.F6527270"
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Post: <mailto:tpm2@lists.linux.dev>
List-Help: <mailto:tpm2+help@lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
List-Owner: <mailto:tpm2+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dTxUGVl9qjfFCI6RUNqa8XoV0SllQgiZqPIocUEHI2DzyWKIqlNcCfgxjWT1cQI6eFbiq9NPKX6CHd+xgsBQhEHdOGue0KA5lhqi0yDuqnfPXrJiogqc6qFPgpA7Ptr50sHOVEI79Rf320UqKgJNjt/8HOVJbGGD5tPw+3k67SHJ1AwawCw7JsKMNeJ8XwG7otdoyX/Vc6b4hDbjT9tgeBnRTA35nbNASPfRUTQSe1AH/TaOE7rJjDkU9ZeH76LlLGd9+FQQ42RJTW253wH/BBx0HE0dx9NLaE718m85MfdeunrI4MpXZAJRIxp6Co27+TTYEv01YcdfyAnywBeWUQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB8983.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c16c9c5-96e7-4cdb-9460-08df3fd3b7fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 09:11:06.6900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eeb8d0e8-3544-41d3-aac6-934c309faf5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ETx3eIwVEaCPQicHWxzbNToMLJlzVTMUpzW5JLK3XuatkxZD7SJKeSa4sHDSraY7NcyWfpYQWIcDuP7Dgtn7c1hl0wfsnfha83y+Y6zXUbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9211
X-OriginatorOrg: infineon.com
X-SM-outgoing: yes

------=_NextPart_000_006A_01DD71C4.F6527270
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear tpm2 list,

I just tagged https://github.com/tpm2-software/tpm2-tss/tree/4.2.2-rc0 and
https://github.com/tpm2-software/tpm2-tss/tree/4.1.6-rc0

Both contain security fixes, so I plan final releases before end of the work
week.

Kind regards,
Moritz Buhl


------=_NextPart_000_006A_01DD71C4.F6527270
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
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYxMTExMDkxMTA1WjAjBgkqhkiG9w0BCQQxFgQUzRw3
ukuhx2vJTCcXu6OvPJuuYAUwcwYJKwYBBAGCNxAEMWYwZDBdMQswCQYDVQQGEwJERTEhMB8GA1UE
ChMYSW5maW5lb24gVGVjaG5vbG9naWVzIEFHMSswKQYDVQQDEyJJbmZpbmVvbiBUZWNobm9sb2dp
ZXMgQUcgVXNlciBDQSA0AgMBJm4wdQYLKoZIhvcNAQkQAgsxZqBkMF0xCzAJBgNVBAYTAkRFMSEw
HwYDVQQKExhJbmZpbmVvbiBUZWNobm9sb2dpZXMgQUcxKzApBgNVBAMTIkluZmluZW9uIFRlY2hu
b2xvZ2llcyBBRyBVc2VyIENBIDQCAwEmbjCBkwYJKoZIhvcNAQkPMYGFMIGCMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3DQMCAgIAgDAN
BggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZIAWUDBAICMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAgAyaIcTTye++nHGl+8nyKbgy+JnbEJgTkBcepwXI96HViSl
epQL6B2owtBWo3q4tVJqPYIIIimspoHxzhNTnc2a1hxrEJq11T4Fyn2ubPcB0HS4s6pMg57kXhDu
AMbqFOxX41cUaGpXZ4SblDquZPnl9mM5LIiO/hiM0vSmVpxBdrpYjLTPN4ng/46UFopMQwqoDlDb
jxH1Hlsbn5j6h29G8BS2nA5twqCYkqCEjrcZnit1BCI5M6O3AaMCz42be4IqEeKfH26rENhmpQe5
6QcGAVtoUwIY14Lzn+woePdp5j86Nx8ysHBsQNn6aGYzmO5STZBgjcyae2L3+9TLkxViSBVhvopV
JhogEIwTesf7Bi5ELHbApodBy3Eo6wCybCafxUSU6cGX9XNTmkL7OS4pA0ln+jWP3x9L3lxxYWv5
LAQ3A7Twd0WYBVV8fB5Z1u+1YiP7g29jJfxg4T4ihNWnQ9ijp1XUDKJbrJHCRt2fT/tJ2sMLoybc
nFG60GzlUbOY9M8NtEH5ppPnwCG5cW7h34qZ2pvQEeUdtbNZVu1zpoe5jIVEVsAX9EoVl6VD1vfb
emnXJ+AS8NHY1Kod3SXG/9I4sfm53bFSwQ24rP4YZfDaWPFrRItfJQ9IN+Knhwyqj97daa5dMQQZ
s19PavKnptH/zOs6Pbu+yIKMvComHgAAAAAAAA==

------=_NextPart_000_006A_01DD71C4.F6527270--
