Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023093.outbound.protection.outlook.com [52.101.72.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3CA3AFD04
	for <tpm2@lists.linux.dev>; Wed, 23 Sep 2026 23:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207400; cv=fail; b=AHSpXI65s2npYyuaXvxI4YKBs4gPqJo6rJmcroWXiQLIC93T21q57cOXeV7T8PUPVd7GMjXe5g9e8UOMOXC034Btuihk7sjeNpxEqnYRBPoVATcbEynfizUh12rBQ2c9DqgKIYDdBcZOs60wsVB8gu5oNawlJZGUUG66Q7v0UN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207400; c=relaxed/simple;
	bh=/flsEC/p+ZkI3ZSnIImy1vRPtn48PSmrHtB/DOmywwE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OKkDIuCb4ll3Ee3DfMC4gJPmpD+MERHSdpAtfwvsbDmeRZm3vjvcmhiVHBov3VMacSl3+VEOwZsIA1Q0fa1XCL7VdFhJx1RLWlFHY31v+yoTeadUBp7ActbXp38RvcgzcooXK6ocamzcpa/wIkKwPL6w2FulS5AMLPHdeqgU0GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wiora.co.uk; spf=pass smtp.mailfrom=wiora.co.uk; dkim=pass (1024-bit key) header.d=wioraglobal.onmicrosoft.com header.i=@wioraglobal.onmicrosoft.com header.b=M/8t1Gi5; arc=fail smtp.client-ip=52.101.72.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wiora.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiora.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wioraglobal.onmicrosoft.com header.i=@wioraglobal.onmicrosoft.com header.b="M/8t1Gi5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjlxK1BCXb8U/A+Hjk7u13S9vJRh8kZM4+Gbk1XCPwsfkXJQ9Q9sQp6xnZHdn4x2LBVdel5pWJ1qU8oT+Iz8k6DRZU9LpUVrnKZf9mV+AToulnGvYtACiLjh6G6cD84ZcgwTy9IvenJkEPsj86wfa1IpfhP/MFdqioRbMN6vGqWjka08DEzTVAENG3dyNHftZ++NLayt53jQJNiIWfdamAKsWfdFOFodhygD582asQSEA1TqNXJx9n7UGNrsMP05vuxdEXKU6OltDKL2qa262mFB6/9ksaQNXFENqQWwWyrgMOyNtKk5X6OrP5ef3J10jTkH6fQ5+BUdJf1fTrde8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6d9SHnfX51179uDBzoS7aGD1ND/OzIrBnsOinNfJqmY=;
 b=rabFk5L4ID3PBfYUv+WztgaqDifSWgSKn3JclrflYgYnj1GhwKmy7bbUUNFxpge6lf1upuPh/ltbqhDnr2m04EpBqmBJWSo74zShXj9h6JT/DVHO3EOah+uSEJNI7vgzubZBSqP9eqPXsAsmraaDARlUugobErf/FTBGJnakK0QNNV0RU7lPNgZyKKD9PgolY0hE2pKN9ZmHfclgzGvPxsZEsSgdKlBqHVcDF+kf6r9ZHqYmsZjtT4JvfhGV0O9BzgezgPmDQjEyMg1hpTj9k7bMoUB7yuLRed2WerH82csLjzluE7n7SV30gf8qo7QCdgAchKB+SO7LgXSCSKGGQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiora.co.uk; dmarc=pass action=none header.from=wiora.co.uk;
 dkim=pass header.d=wiora.co.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wioraglobal.onmicrosoft.com; s=selector2-wioraglobal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6d9SHnfX51179uDBzoS7aGD1ND/OzIrBnsOinNfJqmY=;
 b=M/8t1Gi5D2HqJcwvuzW4XvLL3Sb5cIXZjUuq5dMbd/ClzPhcjzC98ILaKPrh/beAcYJaqLTJ7TVM9mWNrjqeag8DY2LJVysZhGiXUzashJUEw1dPtMmRNW84mGHd0s82q3vnuVPqpD29XRoBy4XAjhodJVhtJfo8pYN4+c9w2Zs=
Received: from AM0PR03MB5603.eurprd03.prod.outlook.com (2603:10a6:208:174::31)
 by PA1PR03MB11109.eurprd03.prod.outlook.com (2603:10a6:102:4f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 23 Sep
 2026 23:49:54 +0000
Received: from AM0PR03MB5603.eurprd03.prod.outlook.com
 ([fe80::7f05:2323:cadd:5696]) by AM0PR03MB5603.eurprd03.prod.outlook.com
 ([fe80::7f05:2323:cadd:5696%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 23:49:53 +0000
From: "Matthias R. Wiora" <matthias@wiora.co.uk>
To: "tpm2@lists.linux.dev" <tpm2@lists.linux.dev>
Subject: tpm2-kira - a TPM2 TOTP attestation tool, looking for feedback
Thread-Topic: tpm2-kira - a TPM2 TOTP attestation tool, looking for feedback
Thread-Index: AQHdS7Nrs/OgC8B3iUSJVua8kRRvvA==
Date: Wed, 23 Sep 2026 23:49:53 +0000
Message-ID:
 <AM0PR03MB5603863501BD2C55D0D3F9DA95822@AM0PR03MB5603.eurprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiora.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB5603:EE_|PA1PR03MB11109:EE_
x-ms-office365-filtering-correlation-id: 608c347a-975e-44a6-256e-08df19cd5d75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|10070799003|376014|10067099003|56012099006|6133799003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 0Ui0H5sC3eGaHVfRMlwiTg9IMEebc083akLB7jrBGTXwxWV4AVUsI4JlggSRzfAgyRH3Yya2lBuYHAdMU/ZMw7ENwxuxbsSuvhnZ/s6I3Fnru273MWRUueu0D5l9ra6KaiBfbOum1Adgy7D7/MJxkLbwHJItoZg6kT+l43K/sQTGMAVleglKcCu38rlaveSRGKKeuQk19IKfZpyeTrFrtxI+46opjqK5eLiTklS690uRmMGmXGRvGMfucgHN74u3gP7wysBbYBj81aycs1Gh261961t2fiXniWgAEILs4Gaswf04zb4rCYFNmIO9pUROklSZDNSOae6q+w60Qj2iItSQoxp2re/Hdm1jHeE7BHlYsdKHkKNCVVP6KgxYIvD9N6ePZjt6vVF8upRSWBVMEgNpTG0LzvpWixMTcQaNdvd7+JC/9NIvdf0N+LAbTooY0ImrXdQnNq4i17d6Km7o0WtHNLYv3lyoaX/9n3pXEbBeyvdryNB4WMHXsP6KantypPJmlSQkqx72B4ZLyvi3XswcyibJ2XJmlq2FQYVV0X6MEXeMWif3NxEvscMFxlqQvwAyvuJlDI+KjCMbhq6u1Z+2rvdqGZR2GZr4NaGa4nqN5ufVsFOpGFY4Iz07YtnFhKvLhMvsYaUdnC0PaeXcYErHMG/KG7Zm20oH6cpnVS2SEKHfPkvHJ5uJfvGSH2wvRZrcvRvwIA16ZTYePxMdSVliIaN2r1xIwNBfvRuwO0Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB5603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(10070799003)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7iO90LmV1i1Vmhd7AKNLmKMcWq9A8yhwE2m8Qjfb6bldsR2D2E5rEbD/Kx?=
 =?iso-8859-1?Q?Hzw7dSl5LXWL9wpuzy8Uok5IxrZxC13P1WrfqbQxr+Bo90D57M0ZVOPSks?=
 =?iso-8859-1?Q?OstRMrRofvZCmJq198dPsHm1qFnSZqOyxhPEllhcazgnwrVC6qZ3n6sIOW?=
 =?iso-8859-1?Q?soFNtivNTVXUcK7P48THLCm7bWqbo6HuER2c9xrQyl8580FRMBPCG9jdJ/?=
 =?iso-8859-1?Q?4yObLqj+ssuq0tq15jPrUOkg1l9OaQG9oSPuSpI026F/N9YI3hhlyGI2SA?=
 =?iso-8859-1?Q?1ahArfjVHdWnqLV/M38j1dYi68/byWv6aTOoEL/nJ0R6zeZ2/ihtSJbcuA?=
 =?iso-8859-1?Q?2Ht1ObNOxoWkJtwDv4PQ/t69ZsojMjIR1OYI+qtsL7WDfNdgqgJNs/JUEC?=
 =?iso-8859-1?Q?d7PwWQg+6U1dxJLFoQnNS6YtphHWS93lTAHYbnlNLayJBXpCRKMMzuI8F8?=
 =?iso-8859-1?Q?Ie38ZIucLDf1VqjVDQ5H4UBnV2dD+v54mStxE3uL5I4u9ib6J5rpfsJ3/f?=
 =?iso-8859-1?Q?G31O/sw6Iit57wp15jTltwPXZ84U26uh6D/T/fXMK3BZzfxIOFMC9yAhdu?=
 =?iso-8859-1?Q?8xDiisJ+CcrNH4uWcZgtLo3tLDLio13BXs31ioXZFCiGmtyv6WXYXaE4eV?=
 =?iso-8859-1?Q?YLlLRO43NxTu9+X5NYKY4+xmKzz7AWeZIpR59VAeU1byq7AtKV27x/f+8U?=
 =?iso-8859-1?Q?JU2EQ5kIPOCqYofSlFMzuoW+WvGXcta7940FaJ3/bglP0sB0VqpwCKMx+K?=
 =?iso-8859-1?Q?Fe+hl4EwiO0+7lOv/Ou5JH6eA53dqtwQ2aZ+90amPLnaql59/AQNJR9FHW?=
 =?iso-8859-1?Q?x+KFekc+2F2M9xMlS0qSzL6Us/n2uNlP+1VykkxFUHTt9a7HI5+0AG7KMc?=
 =?iso-8859-1?Q?nEOXmBee6/w1JyHj+Da8deUONYWbqLmTBcfCtdbV9jZNOFgKh6sh/OWiPE?=
 =?iso-8859-1?Q?29SCmhKUgkvS3f4jgI+TmN/ozUzMdTPjGdBeLOmuwDQkU4vXl5AlVWIloi?=
 =?iso-8859-1?Q?RZC2fSK+cOs+6qSr1nk0kb/28MLLf+LQs8g5Gti895ajsQeeIOphFzob8Q?=
 =?iso-8859-1?Q?nQ4gAqBTunHmS7Jeuqbydd1zGsRkjRJejo6xIlKZzDKRjNez36m5sNgL+9?=
 =?iso-8859-1?Q?kM4xGYTMK42zd4zrM/t3BbnBj+rtO4EK8hhC3KV+c4swUkQhNSm4BSwobp?=
 =?iso-8859-1?Q?xeLcmEiM9s2xXxIlneO+YrFhrHY72FPOVi5DyOEfXDopR9dsT35RNwjg0O?=
 =?iso-8859-1?Q?vou/sjW1grCevfdn4bR56JBL5+az+MVWontxwi648f5vMSy/P9HXy45L30?=
 =?iso-8859-1?Q?hvNOyvm+GyqK7Jv3IwagU6d8re9lq+EShhe5N1Y1Em+LMLZh4CjNC1NAqm?=
 =?iso-8859-1?Q?mW4fRqZoSEda1GXOagwjId6vTvPDEOgTTfnqXN1f2jQTozyJKPz9ss9W5R?=
 =?iso-8859-1?Q?gPYttHl9qY7BuXmqnEddCaBs5d6CXfw23hu8p384fPuXUfC3T+/gJjHGu+?=
 =?iso-8859-1?Q?6HLnEWFRL5jYcm2TzJT+/dxSd/zTF9SFMIq+ACTEw64imF44YSp6TqkElf?=
 =?iso-8859-1?Q?Pqi0Yak9eKKae2DKrGgKkfzw2ezkQdoSLe7QfTJa9/EmgvD3RWx92RtzqX?=
 =?iso-8859-1?Q?XZ713EgHZmEIj2c/kmw4hoGmT/L4JI9hoHLhJmPofACGv9RH1sYeomfeY5?=
 =?iso-8859-1?Q?Jzj8x4zS99n57Jc4fQ/Zz4ULDBrY1sqDsY6CjjgctubJCR0Pnpi6im+Lvj?=
 =?iso-8859-1?Q?rhe6dXYpxYSupc8ShD6ySvnvoFqc4UAn2b80FGAfO1nZJc8DpubqqiyFEO?=
 =?iso-8859-1?Q?MDNi95J7waayT9JYPcSeW035rEMGvctqeWjzeNy8O3vqiikf7yQd?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: wiora.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB5603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608c347a-975e-44a6-256e-08df19cd5d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 23:49:53.6379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dc522372-3f69-4143-b880-ea1a60fedcfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0KQatqVGzPoWh06BFxtl6tuoa0cgH9HGDvjiI9sfHtGCiAG8xlgqiKp6SFHVtWmhIuc9IxOQgcHUNpxjqLVOrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB11109

Hi all,=0A=
=0A=
Over the past few months I have been working on tpm2-kira, a tool in the=0A=
same problem space as tpm2-totp: it seals a TOTP secret in the TPM under a=
=0A=
PCR policy, so a code shown before disk unlock indicates that the measured=
=0A=
boot chain has not changed.=0A=
=0A=
  https://github.com/mrwiora/tpm2-kira=0A=
=0A=
I would appreciate feedback, particularly from the tpm2-totp maintainers.=
=0A=
=0A=
What I focused on:=0A=
=0A=
- Recovery through a PolicyOR with two branches: a PCR branch for normal=0A=
  use, and a PolicySigned branch authorised by an ECDSA key. A firmware or=
=0A=
  bootloader update is re-bound with a signed reseal instead of re-enrollin=
g=0A=
  the secret in the authenticator app.=0A=
- Native PCR 11 prediction for unified kernel images. The section=0A=
  measurements systemd-stub performs are reproduced by parsing the PE image=
=0A=
  directly, so no systemd-measure or objcopy call is involved.=0A=
- A "measure point" model for systemd-based initramfs. systemd extends=0A=
  several PCRs from userspace (os-separator, enter-initrd) before the tool=
=0A=
  gets to read them, so the sealed values have to account for those extends=
.=0A=
- Packaging and early-boot integration for Arch (mkinitcpio, systemd=0A=
  initramfs) and Debian 13 (initramfs-tools, no systemd in the initrd).=0A=
=0A=
Implementation notes that may matter here: it is written in Go using go-tpm=
=0A=
and talks to /dev/tpmrm0 directly, so it does not link against tpm2-tss.=0A=
Licence is BSD-3-Clause.=0A=
=0A=
Feedback I would find most useful:=0A=
=0A=
- Is the PolicyOR recovery design sound, or does the signed branch weaken=
=0A=
  the guarantee in a way I have not considered?=0A=
- Is the PCR 11 reproduction correct in cases I cannot test?=0A=
- Anything naive in the threat model. The reasoning is written up in=0A=
  SECURITY-BACKGROUND.md.=0A=
=0A=
A disclosure: a large part of the code was written with LLM assistance. It=
=0A=
is covered by unit and integration tests (the latter against swtpm) and I=
=0A=
have tested it on real hardware, but of course I could have missed somethin=
g.=0A=
=0A=
Cheers,=0A=
// Matthias=
