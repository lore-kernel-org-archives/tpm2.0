Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=217.10.52.160
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793361794;
	b=NlUF2uXiC3sv7B3aPuwjoMTQplVlXni9edBmmgQQqfdiCw/jevybk+CjSdJc7GTQGRZa
	 ODAypQTohqLP3VYWFfcp1f8cCT4QMoyID9Z5w4VM3FSe4LmcCKOZYY3+5sx+gvRFyLozq
	 Oj739un1+5HXHurDbc5kHWiwUl1UbGbvhwe9LZTHbPAZy4ny/FAc5x2v+PBhqOlBuo8ke
	 xEsjINxgu26r663LqNttRv5iAR9WKN5i2ut/HcVoRsXMdMQzh6xDKh5pxYaBr6uZUZTCQ
	 k1wrPdjC1gOc/QcuFCF2IT7gigjsp0WtA4wxNoPSKZpgeah9VPJPgw/v49tjChr9LcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361794;
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
	bh=MzJM8YOJIgOl2ewqg8w7aO5A93L2sg5rL/ZiEKp4mmU=;
	b=mjkUjtyFyE12Q4tksN562NvPy4IkkiwjTYETn4QpfJXfdBE63I/YL/YqplsaCTuktmps
	 EWjmn8/v3AmWJOg2/YOdXNo0z2FaPQ3Mba1G4ORVf9xHp5aHh8VPxstoUClTSCnsrCKOP
	 IlqLrf+dxM9MNDlykALdT032y6rtqSzVAgfCmbfz52HeMS6dOiYOanEy85ETL9GFWHu43
	 xuzUm442SdcJoULsYs28acmG1M6d6dOVzFXsaPjw8McaMjc+h9DNxHB8P1AimeVmWi8+0
	 JuGUQ7xXVH0KeMCLfNsH2CjrRlpYGaSJI3eiTvyGdwfGSBFZNWyF88UlZbPCAbXLM7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infineon.com;
	spf=pass smtp.mailfrom=infineon.com;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b="S3m1J/FK";
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=L4h8rVVB;
	dkim=fail reason="signature verification failed" header.d=infineon.onmicrosoft.com header.i=@infineon.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-infineon-onmicrosoft-com header.b="Q/WL1whL";
	arc=fail smtp.remote-ip=217.10.52.160
Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E7F606A330
	for <tpm2@lists.linux.dev>; Fri, 30 Oct 2026 12:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E7F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=S3m1J/FK;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=L4h8rVVB;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=infineon.onmicrosoft.com header.i=@infineon.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-infineon-onmicrosoft-com header.b=Q/WL1whL
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1793361794; x=1824897794;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=+j29qI7OpZqUkPmECVlgtk86NYy4qn36z3UusIX2hAc=;
  b=S3m1J/FKmMtG7u+aklI1Y14mddOjgzXwHbj/Um0061Y+AkEukzj32fDE
   3XM1f5W+SZywMZQKW0ixAniDJnC4ipFdkm4sriCn/uW+EkCAV4Qrw1l6F
   PbjWVEm3XRnJsrU6PDuyoiJoNr/qe1jBtoJQns1utKqpgs0fKmuYDnqqO
   g=;
X-CSE-ConnectionGUID: 0gQlgowVRC2TOvt254ZgIw==
X-CSE-MsgGUID: gg/SjlruTBefbBZNSITzCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="153811649"
X-IronPort-AV: E=Sophos;i="6.27,186,1787004000"; 
   d="p7s'346?scan'346,208,346";a="153811649"
Received: from unknown (HELO mucxv002.muc.infineon.com) ([172.23.11.17])
  by smtp14.infineon.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Oct 2026 13:03:06 +0100
Received: from mucxv002 (localhost [127.0.0.1])
	by mucxv002.muc.infineon.com (Postfix) with SMTP id 4jGKVd4qTrzTNh
	for <tpm2@lists.linux.dev>; Fri, 30 Oct 2026 13:03:05 +0100 (CET)
Received: from smtp11.infineon.com (ironport-smtp11.infineon.com [10.32.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mucxv002.muc.infineon.com (Postfix) with ESMTPS
	for <tpm2@lists.linux.dev>; Fri, 30 Oct 2026 13:03:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1793361785; x=1824897785;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=+j29qI7OpZqUkPmECVlgtk86NYy4qn36z3UusIX2hAc=;
  b=L4h8rVVBmT6UNRBBzQw4NmpKN1oL3mNi1p/u6BykDIFiM53Z7S6XTo8L
   f8xbI5Uz/RPr8N8Rt/k24g0hzY7vJJrDL4QFKinh5YjDFLvk1hlXQh0XC
   OSnH5zhUCMw0hiyxTxxuLMyaR4jcNARWpIeVarRFZZ+gZB6jb4unuQM1X
   M=;
X-CSE-ConnectionGUID: 4QQhLYElRKSlejOPKG+9dw==
X-CSE-MsgGUID: fXAjh/CCS3C04+LBiHJtzw==
X-Encrypted-To-SeppBox: True
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="168071797"
X-IronPort-AV: E=Sophos;i="6.27,186,1787004000"; 
   d="p7s'346?scan'346,208,346";a="168071797"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 13:03:04 +0100
Received: from MUCSE809.infineon.com (172.23.29.35) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 30 Oct
 2026 13:03:03 +0100
Received: from MUCSE801.infineon.com (172.23.29.27) by MUCSE809.infineon.com
 (172.23.29.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 30 Oct
 2026 13:03:03 +0100
Received: from DMUCS0010.ifxdmz.net (10.32.24.68) by MUCSE801.infineon.com
 (172.23.29.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Fri, 30 Oct 2026 13:03:03 +0100
Received: from DUZPR08CU001.outbound.protection.outlook.com (40.93.64.69) by
 ifxsmtp-edge.infineon.com (10.32.8.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 13:03:03 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anXlKNCWIbLU3LHzjBmQ1MsFIZ29vjBxnCFdDTw7Sm6azXWyHFKoqhLFgGd6SLyTo5i7bDCLZVoIry0gzRPwcby1uGYkn56Ca1okGMNJK9AWFjMaao/1aLH4yCa4Pt95br6oi+Hn2L+Al1mGquwwbdFrehHvUshR1/SgC+jF8dupRXDpZChaYqENBu0hblAyofWvmUvfLhHIXrgHZlHnhsj6CEyo7a2XjwLcwcmyQSGH2W0SwB1Sn5nTkla/XCxoNak7cUDeRukkSUYbjMLNN/z+Q4mZvVuYeL9pzd+NaHnqRtbfcenqJ570gXnMW0z6GUKbRicY2uT/l6yfsLXrlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDuufg3r4lauQmFxHCDFUhtaxk9EtYKImDCI0JmiZsE=;
 b=GitB5mKvqncSAsFYdGsLtELoosO810vXURXfeDm972LiF9UlKTY6JdojQ8gwuuX2I4FWQxSRdTL1heGLEXLV2DqWU2b8GipgkSqwbXR7qtMKWc6up0BKVEmjr/O2MSU4sj0LiGoG6rEu8nHmQuMMYzpsCda5hPdbcAO14HeHtdf7UUv0D6/cUlLpfldWw/QAmXDvseAw6cNsjOezHjulY1PyxXsho0ewJN2LlyYFbBSD825B04s2KSFCnRysnwmu7DftzTvUq24Wbuqezab68PkOP0gpfImeTBx1jyox8RJtjExVP2kz6BO2YM5XYLHJxSSD0grMIN8TbD4byVDzCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infineon.com; dmarc=pass action=none header.from=infineon.com;
 dkim=pass header.d=infineon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=infineon.onmicrosoft.com; s=selector2-infineon-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDuufg3r4lauQmFxHCDFUhtaxk9EtYKImDCI0JmiZsE=;
 b=Q/WL1whLXd0O0ZqvHN6soms4i+xB93dqrtwIS966wx2xikTXGmnWt+j8NQBOzr9bhQeKKV2NhaBqskg3T2N75rtPSxpfNfgvIkJR/TiCoDTh6MzWPWeul8LHCctXeHXTFdVs2n3wkHvjon6S4PxSelEoQpeQdylSDGheoKcweU4=
Received: from AS2PR03MB8978.eurprd03.prod.outlook.com (2603:10a6:20b:5f2::7)
 by DUYPR03MB998920.eurprd03.prod.outlook.com (2603:10a6:10:65e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 12:03:01 +0000
Received: from AS2PR03MB8978.eurprd03.prod.outlook.com
 ([fe80::90f0:a9d7:c395:f8e9]) by AS2PR03MB8978.eurprd03.prod.outlook.com
 ([fe80::90f0:a9d7:c395:f8e9%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 12:03:01 +0000
From: <Moritz.Buhl@infineon.com>
To: <tpm2@lists.linux.dev>
CC: <Moritz.Buhl@infineon.com>
Subject: [SECURITY][RELEASE] tpm2-tss 4.2.1 and 4.1.5
Thread-Topic: [SECURITY][RELEASE] tpm2-tss 4.2.1 and 4.1.5
Thread-Index: Ad1oZasASdfsHiNJR3OmrJurNfCmwQ==
Date: Fri, 30 Oct 2026 12:03:00 +0000
Message-ID: <AS2PR03MB897848B4E380185CEEBBB77A9D6D2@AS2PR03MB8978.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infineon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8978:EE_|DUYPR03MB998920:EE_
x-ms-office365-filtering-correlation-id: 1bfeb9aa-8547-49f6-a91a-08df367dbef2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|6049299003|23010399003|261028144727099003|261022115727099003|261022105027099003|261022075727099003|261021121427099003|261009223027099003|261026121527099003|261026140227099003|10067099003|56012099006|11063799006|3023799007|4053099003|18002099003|38070700021;
x-microsoft-antispam-message-info: fm0h3A+8inbNmrphEDIcvAr/F63WLMhkvOIVwka/SFCDzOZShJdumxDBhTwsX5aty6ck7FjxWr2fRZ1G6IQUQf/kJUsFyvVj3g3WQ2rHLrbTgnUiJUM2kAUr+gG4WM+6t+x3DWLGXYOHV2R+ZiAEliULiqj9f/N67/W6gIN+2eiyETQhAPGNSbrQioJQ1159Hwm8ys9gQ7wSgAh2mOls9KRV6YBdCUqcfUfMCgAAVxPSQ30ascUwI4QSHHMXXDrbsFydBBfyzOTx6k9IqWEANVuOFKqcl825l7Gy+EsZxdFGyjPRj0HLEP1a8Ap02FTjBZUQYxWRat3Z5RtRb8BMjhYnkLYOhGQT8+mB2eZcMit4RWqYd5Nk65t9JiEJ456L7M2MgMZP3QriB/pjeJYHICvWLysWOhTB3bUzBZ120ATOQiY24eFYbSs+oxv9io6UGZGXU2kjM2gw02K4DH1CFQWLFFFL75m/tYtNilx6QE4CrhzrLpNMRxNRzQa/U+DEmBKEVoxOBezeAt/qzcDk20Syhb9ZdjEW3krD4fzyGaueAJenFr+Fdn6sISuSGS3q2tNyf3aQKyl7ejOMxIebnwSfCnXyMvfe3Q0Zs393uQ9hP+VKmts6YqmkdRo7ue5D7jJJOaViN2Vtah5DeNzvO4zwzAapju/SJrvF5x7uyBJBYeS3w1wniV+nZ/zIGCEtKi4wIjO0+/4dnTcmqu4wBTPb9WHLXUTc8LGKn9D0OII=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8978.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(6049299003)(23010399003)(261028144727099003)(261022115727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(56012099006)(11063799006)(3023799007)(4053099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8/QVb0sLrtxZbPphZoQUD+JdEMidIG9zzANEK0RsGkS7VgYjl4pJ3M1FloKz?=
 =?us-ascii?Q?LaY8BFf7HPfgzeLkp9RUNzlT9QENG2SG6aNcMEmo7ojJv6LgBhxF1Nn9jkjz?=
 =?us-ascii?Q?J+10DJBlBUdSZzrY8wPfn1iOOZHhzym6bNDG2G1jeFYRm9E3ojwPQsy92PCh?=
 =?us-ascii?Q?Udzh75j6eL7z8eLKU6EqhSw7o4LUkOVw15f9AnDlcGhVm+CbN9LtAfBe4SHV?=
 =?us-ascii?Q?CouLrLLuy/ygCe/+OzfdOTgjTlw+n5FlueCX0FeiJ0grXURH3UmDtVbTrJIt?=
 =?us-ascii?Q?VQ6WudGdOg2tshZGvJVoL1q3pWMwzUtfatASSVzsG3pZ26ixF45rg6RxSGoa?=
 =?us-ascii?Q?7jzAPTwLEhNU8m1IC+WUToX1t5HSiNFjFOyCqpsRz/c+LYOhyw2Xx2YiPO3Q?=
 =?us-ascii?Q?hSniJFpKAtDNh/UrijvYi60uWODNgHnyH+4X3oY8ZvqIPWvqLcyBHblI/z6k?=
 =?us-ascii?Q?0xNN1bwoKt4GctWrKXhtaMEBISMPpalNvKRVRGtbXz3cUr+On8LyEgMwIjVx?=
 =?us-ascii?Q?5tn7ymRr/pwVRXXxWDyhjV7+46H8nMG+lk7eTzdM+dkj6cYlyOqtKHzKWzog?=
 =?us-ascii?Q?ItO/w6BcONKca7b8sql1OxOKyae7c/Lh4wtmDfOwAC4Q1uMBZ8vTeRzcz87s?=
 =?us-ascii?Q?6E0U+Q65eKGnKGhfkkE7RRPML5wYJmohNgglKooRg6SohVQzlBowcbKjxzEL?=
 =?us-ascii?Q?xpZv/cveK1q2rjf6kcXWeCAy0OHN9O5frymsnpUGwlVOqpQWHoAAzpCCOkZ4?=
 =?us-ascii?Q?OSrexBwDxqiMidKxvnOsfk9xFHxH1smepO1TweH57KSxwkovUsAqEzxWf+KQ?=
 =?us-ascii?Q?PmKoz4CuP/Kd6GOxPAt1jempedMRsnf9YysEmHWDe7kW4mW+uor6WnSI5FkD?=
 =?us-ascii?Q?70/Omr0DjbXsPc4cZ6DSRlYqqKg+RT0zCTZ+WQmSjRqKv/Ah7DHZ9hZQobH2?=
 =?us-ascii?Q?y9QFgIXxgtkn5gvt+q/bTex7+enXSJ1jVm4MDcddwe2EpKm1lxvvQTtCn9a0?=
 =?us-ascii?Q?8eKcOL6k1bvN1U3I77k3JDb6bA5XSSLDtQJErBny1Ww4QBIgbyVG12QUuAQh?=
 =?us-ascii?Q?sZ69xyW6LC5u6GBPi7PAMVZmldf/Yl90IiGwBalOcUFrJ/vQ0z9U9oRapSIK?=
 =?us-ascii?Q?R/tr07SbYe2sN1i+Fst2Wh+xxoWca6KgPkph2tPHb1X7X9+ZGvYv7B1rycOd?=
 =?us-ascii?Q?G9iV8F5RxzQPlaEGVeCtl5uonbzPCPoDMYD1GKVMkMl3rTWmZ8UgbdJbLjaN?=
 =?us-ascii?Q?igfaOSkmIp3fi3SHQo7suz51eJBZ6y58oqMr0OIuGPa7KPz9mNLCTgXdCH+V?=
 =?us-ascii?Q?tCntn5jxfn8bdb+oypwOG8tS2m6ipxqnamP6TXL/q7BLU663VqnzjpsjqMB/?=
 =?us-ascii?Q?mkh/4k4TGXV7YnrWrzSk+qPg6C8DmpBaX3SMtbGU9brBzKnnVh2ScZDLJ+WM?=
 =?us-ascii?Q?pv89JPTRR+jevfWNT+AugcXM32y4mQ/R4JW8skx4F0UK8UCVJiFCT2UPqZ/Z?=
 =?us-ascii?Q?rRt9cPdVeZsla+RNrqTs7xxdYtSqzpkVXym21n0dwp0SnG2TMTyroINvWwJ5?=
 =?us-ascii?Q?eicp3YPAzW0wPSYgh563R6c3NIEwMlCQC4jHrmaifiox0VBwQnDwxt+IJHyB?=
 =?us-ascii?Q?MEGxQ/qNnNVafxft4Yz5Vs2rss6vKlKJa6lH9t0Q0bmaNU4twQPGfXG6PmzI?=
 =?us-ascii?Q?dmi05q7urcvdZL5YhAizxcJ6yN6VD0xLG1W12uYMGYDl4CcNzNQh2EOhgFRm?=
 =?us-ascii?Q?qyE9UV+4Bw=3D=3D?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0064_01DD686E.FD5B4010"
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Post: <mailto:tpm2@lists.linux.dev>
List-Help: <mailto:tpm2+help@lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
List-Owner: <mailto:tpm2+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HoZB6r8yozFMIyo+6HWU0QmSWOviiXl5WkV5/ArsWrJZE736/b/vQqudeL1MpZiSOgFfSHg/BgSzhLqWRAQCfQYE76ErNfg/8A/sURKChtIQQomZiTqaQKUKzjib7ARExha0vaPAW4du038ZsSO2mHK5hlD92vZb1erUBWKxTT7tWnhTZhlJVw0rUdc1exvWBqQfsysNXNDPzNmtgCAn1MgFEhA+53MC4/qPt01ncErUqh1iSHOnt6+JxFZvCFulqkSJuQRkd6p/UF3UR7KOtXR/Ni4DVU2pqD1IbWXhL3ca5eWVJeuVIsBwKepwrVvenoJL51q5hw0NsP9gfiGRpA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8978.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfeb9aa-8547-49f6-a91a-08df367dbef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 12:03:00.8874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eeb8d0e8-3544-41d3-aac6-934c309faf5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: juB0PKeRmu1tI8a/1douGdpBHKLen1cWkTu3y9LRkFSCmqIZ1ocS/mqYrR9qiSQVXqS9LUwe0yf5aWWrQVQ0A23CtTYn1P8oMsaLYMQ+Wwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR03MB998920
X-OriginatorOrg: infineon.com
X-SM-outgoing: yes

------=_NextPart_000_0064_01DD686E.FD5B4010
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

I am proud to announce the new tpm2-tss 4.2.1 and 4.1.5 releases:
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.2.1
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.5

The changes include:

Security
GHSA-h664-qxhh-gx3w CVE-2026-109545
GHSA-2q8j-chww-3pcq CVE-ID requested
GHSA-5mqr-9575-x89w CVE-ID requested
GHSA-rjg6-phr3-3rxw CVE-ID requested
GHSA-g73j-fj87-wmqq CVE-ID requested
GHSA-v965-wr7f-xw6w CVE-ID requested
GHSA-5p93-qmch-h65j CVE-ID requested
GHSA-x33j-3x4g-f32j CVE-ID requested
GHSA-xvmm-58jj-c6gf CVE-ID requested

Fixes
MAINTAINERS: add Moritz
TCTI: validate the response header length
TCTI: add missing size checks for response buffers
FAPI: fix quoting of empty event logs
FAPI: check the number of branches for policy lists
FAPI: validate key size before extracting the public key
FAPI: add a missing bounds check on PCR_Select deserialization
FAPI: check buffer size in RSASSA and RSAPSS signature conversion
FAPI: reject eventlog entries with an empty template value
FAPI: bound eventlog entry name reads by the template size
FAPI: verify the eventlog digest window fits the template buffer
FAPI: fix file leak on read error
FAPI: fix tests failing with physical TPMs
FAPI: fix buffer overflow in ifapi_set_auth_primary
ESYS: fix compilation without SM4 support
ESYS: fix OpenSSL 3.X engine context handling for internal crypto
SYS: harden the response size checks
SYS: validate the length of no-session responses
SYS: validate the length of encrypted parameter responses
SYS: validate the length of response authorization parameters
SYS: use response size instead of buffer size during unmarshalling
MU: bound subtype unmarshalling to the TPM2B size field
IO: retry poll calls on EINTR and EAGAIN
CI: allow CI runs from different repositories

For 4.2.1, there further are these changes:
TEST: use SHA-256 in EVP signing integration test
CI: update container images

For 4.1.5, there is additionally this change:
CI: pin Docker images to before the major update

Best,
Moritz

------=_NextPart_000_0064_01DD686E.FD5B4010
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
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYxMDMwMTIwMjU5WjAjBgkqhkiG9w0BCQQxFgQUiQNa
MfMnELwrRXxlMFUo5YUWxkMwcwYJKwYBBAGCNxAEMWYwZDBdMQswCQYDVQQGEwJERTEhMB8GA1UE
ChMYSW5maW5lb24gVGVjaG5vbG9naWVzIEFHMSswKQYDVQQDEyJJbmZpbmVvbiBUZWNobm9sb2dp
ZXMgQUcgVXNlciBDQSA0AgMBJm4wdQYLKoZIhvcNAQkQAgsxZqBkMF0xCzAJBgNVBAYTAkRFMSEw
HwYDVQQKExhJbmZpbmVvbiBUZWNobm9sb2dpZXMgQUcxKzApBgNVBAMTIkluZmluZW9uIFRlY2hu
b2xvZ2llcyBBRyBVc2VyIENBIDQCAwEmbjCBkwYJKoZIhvcNAQkPMYGFMIGCMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3DQMCAgIAgDAN
BggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZIAWUDBAICMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAgB0jrfc+OKoF2ytVg+gxCN391Gy2AYO7L60k3VuwBhucxtA
/XDNaKE59Q0frSRmPdUda2FJSjAdF5hdN0c5EKyJ1dlJPTm3MHXQwxVMXxJa0ZvdwWBqkwBd4cjo
EeUFwC+nb1VnEPPalF3V91htmU+A2jGdyhWXvQ39FoYohDbW8ngZBKCbUk4MetAEK4EM7OHvO8NN
VlDRquV8Q2xdXxFz2Sr0u71UaPpBJV1jtvDh4iI/vPJn2ZWPZVMk7CW0k2T9kP9HExPJI/C/jmut
sQ3JRbccC7M9/aD/vVTSGbmH6vvCMO73Zk1mLUDLsn5eUCcZgUzJh3MhvjDXJwaKgsyYzUyzHcwp
4VlikVz20BpsxeCAssF17zJaU/y7IYoZpMtrVLvfpqHMldnJIkx6r/ScREKGYEpwhud9Ljk9AU/N
4vs5/w03s9Gwtp2WxkOWDrvnvgi3NYEUYZ8riRzfzB92JpgPgbJUKdosH4ZtDhCv4tiClkfbuKST
08heYcTsI+Tk20xpqjoq1LYB2l7jEil8aGCY+KQpuEB8cRrSXpGvyCo3Zdqj1owGohsg2Ib2I3h0
NycpXzqdnhsFEoDYxw0ymPJdULpUBHa4XW/Ie99UeONbOpoqZqqZmcVX0oPzzTGNyTExKvYndy0K
4csn4cCjrXQ8/2hDUrvJDeFbgUU9YwAAAAAAAA==

------=_NextPart_000_0064_01DD686E.FD5B4010--
