Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=217.10.52.204
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793090829;
	b=Hv5Y1dcsOsR9GOegRpKjiZZxCjWM/xw+1wkkGHnvu/sUAciEn9DBPOUAwYPm2limzWVB
	 RbTqrPcvsoFOPO95FzLJtx6tZ8VI8XoYj5UQITcumCQihp7iulaywAXii6D0XlPm1n2f0
	 OaHBxW3ngvhJQqC3830VNQMwKdflthK5tEm42u2SWuQNgqskqU2ag7ZHXoZrnM5Pj3WHL
	 F6TnWDe2nGxjQKqM8egy7GTsTX/9V4xdCLUxu7GPpidI6RgGTzfm8qgvSwNzBaWSF0Y8o
	 xuIykzTcuggN0tbALkLOXN8GoTnPd0bJZKqhMX8Tm/LLJRD1btz+Lv1c3f/RXQYs2Eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090829;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:X-Amp-Result:Received:Received:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=iSnJrqGvY3RhTKYflWisVWLit2WSDOwd5v9MQyyJPR8=;
	b=2ThvCWKgrXiM4gSsdGLU7nVyeY0URTHm/XCKLWOK2McQonT67rWdAZQLCLNm2WloIa2l
	 MWfEyT/MtsCIT17e+ukjD+Q901uE3HtNHQZa3LjJ/b46RWBjRi3fRIFLC0lj6anseUrsb
	 rWRkqdOcNMnBguDkCcUbzXfYo/BdALCzConmdLADq8dclsQlU2vqTo1ientWRJm16gQBO
	 3PiMXcJgjWVOPtsMYnmGDjzE5yBljX8IQ6J3TQffwnxKeyCsInAVCDpTI/d7ylLJrKc9Q
	 3dAq8vMU09fjqCNS3Ob7sCeePoq9t3MjZdYjZ1aQM0lO6lbKLmtUq8HKok4eE9SkwZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infineon.com;
	spf=pass smtp.mailfrom=infineon.com;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b="EW/QydJT";
	dkim=pass header.d=infineon.onmicrosoft.com header.i=@infineon.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-infineon-onmicrosoft-com header.b=dIq30Xnn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=217.10.52.204
Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6F8606A31A
	for <tpm2@lists.linux.dev>; Tue, 27 Oct 2026 08:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D6F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=EW/QydJT;
	dkim=pass (1024-bit key, unprotected) header.d=infineon.onmicrosoft.com header.i=@infineon.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-infineon-onmicrosoft-com header.b=dIq30Xnn
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1793090828; x=1824626828;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=iSnJrqGvY3RhTKYflWisVWLit2WSDOwd5v9MQyyJPR8=;
  b=EW/QydJTB92YpBu8Hoh5CBR8UpWtRHdNU6eFJBI3RC28f1CviI6GoVec
   Dhh7UfXnCqZdas8rURfai3f5gG0oNSCoHgP62JjQ+Zd7W4P7kx9Dj6WQm
   2kKdGDJ8qYtVCFQI71/qnz63pkB2kzh273/XMpQnfVqr1m+ktyi7nfmPJ
   M=;
X-CSE-ConnectionGUID: SajiQs2ARdaDLpy0FWu7Sg==
X-CSE-MsgGUID: y0/5MQmZQWaAGnyeM8UmbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="115300891"
X-IronPort-AV: E=Sophos;i="6.27,180,1787004000"; 
   d="scan'208";a="115300891"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:47:00 +0100
Received: from MUCSE810.infineon.com (172.23.29.36) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 27 Oct
 2026 09:47:00 +0100
Received: from MUCSE812.infineon.com (172.23.29.38) by MUCSE810.infineon.com
 (172.23.29.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 27 Oct
 2026 09:47:00 +0100
Received: from DMUCS0011.ifxdmz.net (10.32.24.69) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 27 Oct 2026 09:47:00 +0100
Received: from DB6PR07CU003.outbound.protection.outlook.com (40.93.64.95) by
 ifxsmtp-edge.infineon.com (10.32.8.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 27 Oct 2026 09:46:59 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5tHl9NxkbrXD9A5LawdIdQglp4aBvv7iDIMjW85xuHyQ2hrwL01000Gu+iaVRgoNllcauYYHT42yeRkl43NDy7ZCzkDo9D4JoNpGjcZy7bZA7ZIytV35+2b8LA2l9EcPCPejXW0uebgMbC5TFgHT58F9tuCeh2UpG32KYRMVPHa0+CdMYk83SaMwFUbsnayCs5C323wMB5CT63oNCwEpc2ZjhNjwgnkEELjiFcUIXZHtjS3wEi0EmKkqoEzn6LPl8LSlcR/vyZjI0CzUjX5zORRizgaLlU9wNDL9WYuouiW45RwyEAW0iWM0s4qUP5gGT+f3ZXhAEInLoIbDGKo7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSnJrqGvY3RhTKYflWisVWLit2WSDOwd5v9MQyyJPR8=;
 b=uhy2HkkWx3Eqj75SBeY4OB2/yfSn7E3eA4z4va4t8jgsL2LMLI1Ymva8zjfBfntCSid6ZZ39iMNxhRcTT+h/3Cd0R9ZqtqP7bBt4eZqgKUsC+Xa8G5FN1fgp+9Xv7+34/FGcUi45bxOK12SexqwD80xMh4l1ORSOXlsSwj2mCJKYBvK0N53UtjbOPd9ddHNaFVnvdUBDwsGP1D+TOb/3De9nbsjJvq/poiuPETmSOdOZMs1ymQxp0N/UQEsoH3+UuM7qKfdV0/s3Op3VesOgUYV+UrQSDbUEMWFLIRKREj+Ks8JXVTuA3Wo61Q1dR15qbAvsoI6D0rsKONjLW9FW1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infineon.com; dmarc=pass action=none header.from=infineon.com;
 dkim=pass header.d=infineon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=infineon.onmicrosoft.com; s=selector2-infineon-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSnJrqGvY3RhTKYflWisVWLit2WSDOwd5v9MQyyJPR8=;
 b=dIq30XnnVWuNvfBPibFf/NWUtC3SLcYuqwmzTJQ1miKY/JukhrHkHkgbClhLQhXsDl0u7wsi1DEvBqaS3hCuR+KttYGGdquKtDojmH6cYKwEJElOEsUXL+v452iF0rrGHk/rqgNOlceVuNZvfNLTpi2NDHubTJ8aqoO61f6zeFA=
Received: from AS2PR03MB8978.eurprd03.prod.outlook.com (2603:10a6:20b:5f2::7)
 by AM9PR03MB6963.eurprd03.prod.outlook.com (2603:10a6:20b:2d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:46:57 +0000
Received: from AS2PR03MB8978.eurprd03.prod.outlook.com
 ([fe80::90f0:a9d7:c395:f8e9]) by AS2PR03MB8978.eurprd03.prod.outlook.com
 ([fe80::90f0:a9d7:c395:f8e9%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 08:46:56 +0000
From: <Moritz.Buhl@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: [SECURITY] tpm2-tss 4.2.1-rc0 and 4.1.5-rc0
Thread-Topic: [SECURITY] tpm2-tss 4.2.1-rc0 and 4.1.5-rc0
Thread-Index: Ad1l77a6sSUGJFiFQ0OlATAsVHf9OQ==
Date: Tue, 27 Oct 2026 08:46:56 +0000
Message-ID: <AS2PR03MB89780C8800B594828B3BC4BF9D602@AS2PR03MB8978.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infineon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8978:EE_|AM9PR03MB6963:EE_
x-ms-office365-filtering-correlation-id: d715df03-5232-49d6-0ccc-08df3406db6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|11063799006|56012099006|261022105027099003|261009223027099003|10067099003|18002099003|261026140227099003;
x-microsoft-antispam-message-info: afz2/1ykZ2mh8uuc9sA784TSnFEzlectneIqp1KFfQ+NnceZKzTRS/HZnw0lt64YUhnUDhcXFGse9SvvAjtG+HvV5pcT9XmlETSaNaPntEOGDvUch/bO2bSwOlhjg6hX7exi39FwkZZKlAk8A6JH+3qDde5phpPPF/u4QwxfcG7w00Asfhg/V/bEv0NG3k8LsauLjnOAB7CeU/Hze+e2cSueDH3y1NpQUG3/kRsp7YTUzcwRMJDhnTjbqLAmT0OQv957/iNtc86JwImxApTsR19o9O2VJXIw80+pZ5RQncpcU/OHPpbWX0vt6lK4lErinLon6//Yiy2yAQ7AaJ5gtsP+Uxi6tQf0tU4y0x3GX/rVOtfIqquS64A16/2JqQ944PwCIZcnTWJLbwln52z7ai6D2ZX+vShPARD1oBuEHXt/gyMUiD+ZKz8XXz3DsyO/gHnprJDxIeDHR36z0cIEEvc/ThA8SnQPpkfAZxH5Masmzn8lmjKoEesXK3QzDtl4Qw17iNzDCOC4WAnN+l2jk9ZCYB/Ey+W75EIVdjJAdJwwAMjpBG3AhXznR/LLeVviSALrBDSl4QsCEBzQkqRw1QM0SeNrBoeWbF0YZTsEXpPl2RcGOozmXfUulUevpsr2VddwNTZx2ePyR7XAbeV5I9NYKTEfRvj+d0Bh+vjsqD0JYulj3q2vVWh2bUibPyV6JuAuomM7ap5qBscoJ80wZCN5aztgRtodPpfNbZL4Mow=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8978.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(10067099003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ks2fXJCyQgnOI+dfqwzr0jjlcquPqDyYo7R6fIYfwfv728Tob2H1aTOFWFwV?=
 =?us-ascii?Q?K4reUs/rfe88CnCXn/bugI9YIQPJ4bi3sT6Yp1RXTaPakPERYobS0VUTM+Sj?=
 =?us-ascii?Q?AJG0pKBFMzaz3gS6jcWO2gwIKaKwTfCgrRa6QGosFWKq3Q5KmJ+ZO/oxvAF6?=
 =?us-ascii?Q?6Qq0gSP2GuPhfgq55FStlzrXge+HiYRUBjnYU6dj7qXd9bFc6R15z3HOq2Tb?=
 =?us-ascii?Q?nQ3At1iqphOhRvuska21gEl0WABWEOn5NyQieIEgqlsaI8Jd4EqNd1NV69Sa?=
 =?us-ascii?Q?F6T0IcOsptnGUeADs8TGop0SfmCd+bCW3V8AEA3EWdvd/9CpI7HxyO8bn61g?=
 =?us-ascii?Q?gInxhh2q5bJtwwsi0abRW/7BxFcM/3Pgn21UEbE1G7JIjOTmAZegOUCrPr0m?=
 =?us-ascii?Q?7dc/825BlEKlYnkGGFK2N0+3ANyFew0W2EV8VTJhCD6MubdFH1hH0qJUb8oZ?=
 =?us-ascii?Q?YvRMdMAAiNxTkgjgyEJGU70k76rPRdRZ7uIwe9fCZfw8wr92PqtnzSqhSjc1?=
 =?us-ascii?Q?+h8BKbE2d3NkP17sQAMu456uSzRplWgvCGiqqw21Qe5G3iLVdyOWH6isBqko?=
 =?us-ascii?Q?eedVvApZKj925AtOcuMF2s5PMsHgjtgLgfkNF3COrEF+c1hHKg6I/e6r8IKt?=
 =?us-ascii?Q?rOfABSlurySwhPL3pjOnhe5OPJkQShvSccyaddbWZ8u72MvZp04ebEDiMEEu?=
 =?us-ascii?Q?Rc6bMPq8GKmI/rIoto/ebcSUp8gEu9h6m4zL19PWc5Bg7eZ6loXKg3pmftRT?=
 =?us-ascii?Q?4Ss4nSBL4JsN1y4iChSf5KkC71GnCrZy2oY1ykQA75OwnmievlnWC2fwHzf5?=
 =?us-ascii?Q?Pm132PQmGQs1QfCZQZFNFI4aJ1PxhrNS4vtKyM7/WEGvljRRU4xRvXS5M572?=
 =?us-ascii?Q?W6ns3p6RcZ7YPMPaaisuIuvpzvkVWERQYl0fb6+bhLgVSmNXg+KfN4SIz/z6?=
 =?us-ascii?Q?KscUMdqEPZi2EonjzeYDzv3MsM4SxEOhgJb/lmYYV27zeKyWchBa+CcF3mFp?=
 =?us-ascii?Q?6FKdtkcuTC1wi2LWoMJ9EIfcp0M5Annt6EZaZWmy6PAfkP6VHJwGyJ3Mjl1a?=
 =?us-ascii?Q?ntlqTIWTKpOcGllsI5fEhZeVQhoaMibp2XoUKZGAnP5UtO1Jo86GwB8HZ+9Y?=
 =?us-ascii?Q?LLtO0hSUEB2xzW35f4O2OjuietesE2oldg/jMMRmeXpKntUCBBimYquODX2j?=
 =?us-ascii?Q?2XkW9K9Ucra0K0mzgKKbMdPHOmYZiSAXEzgx0kiWGbAK/yTQ6/VcS53D10jD?=
 =?us-ascii?Q?bgTKP0khbkbp2xNN3XSQpLj/PaseeabZ9HmSQP3x6a5lByLMwGtsHkxmVtj1?=
 =?us-ascii?Q?wGrWcsgBl538n2FILphGbDZGn2/niy967I6U7TYovMkG5J1gl5rX3J3OXtME?=
 =?us-ascii?Q?ejc98EZ42ZtY6bRvpBRNNMdU/PQtO1nYRwWT5CtYCJ6AwaD1i3V8MwEo5Bvv?=
 =?us-ascii?Q?FJYRuONtzc1lquSgvLFa2nJjS5daKYcGS24zNCndkWGBp/0GIDaWwqntI2Ha?=
 =?us-ascii?Q?Kv4QbZZVBrFRzqd3oHXfts7Ljz/+oZWn+61VehvVTi7Y5wveFHN18fdMBrS0?=
 =?us-ascii?Q?PPghJjFsD09obVSn+zx+y4wuIEi69KrP6GF36BWGr53x7/qvcspcwYuZM7Lm?=
 =?us-ascii?Q?0sZuMwDJKAPo14EjL5Ja96IkgtToNIlUWoksMtouRSc4s98hJV4jfC0NJx5D?=
 =?us-ascii?Q?f5gmbA0y7CwnBizwL4hf4SWOLS3DWHGPC/Paz5E3G3tdodD1SBNl7M1xRjTW?=
 =?us-ascii?Q?G5uaJ4Nt1A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Post: <mailto:tpm2@lists.linux.dev>
List-Help: <mailto:tpm2+help@lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
List-Owner: <mailto:tpm2+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eps0jUZRYeAiA4JBwWNlR/bdpaQUfoiG77fkvS4P8OLllIq6mxJuGx51x4SboABQxNHELLwXYimtmjwMNW25d4Uk4DxHtk11L5JldnQTQs1f56LLrypNNai4MopGuFJa9Ekf0IOCVvHCst+c9ZSb2yaCIVRQCpfzsp3jU3L9AsZVZzV/JMnsE+hzRQlkT/dBAJyRuRyatvZ+7605ZK9jxSlAvMBfT3X52/FmM8Pa7K83q5S4o+uyRDcOfKmzzddntByq+s7Xc2mtRJX1k3lSCxDoppXTQjihbFQQ4bZ+G01eUUPo87MmPAzsZ6yKKwWijpXieZAZ3kxIlUGLn6Ooyw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8978.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d715df03-5232-49d6-0ccc-08df3406db6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 08:46:56.5243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eeb8d0e8-3544-41d3-aac6-934c309faf5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wWOYMvrrJqROaT10XGGlixNyr310QUdaO+MXsxgbLxlhR8uqsu8xTtcqGGc3/XFCpIA3b3/SKYIMSOvAxnctBR3eJD/HB2akyd+WZ/f8M8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6963
X-OriginatorOrg: infineon.com

Dear tpm2 list,

I just tagged https://github.com/tpm2-software/tpm2-tss/tree/4.2.1-rc0 and =
https://github.com/tpm2-software/tpm2-tss/tree/4.1.5-rc0

Both contain security fixes, so I plan final releases before end of the wor=
k week.

This is my first tpm2-tss release so please let me know if anything went wr=
ong or looks off.

Kind regards,
Moritz Buhl
