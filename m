Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2135.outbound.protection.outlook.com [40.107.21.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F26B2417C0
	for <tpm2@lists.linux.dev>; Thu,  6 Feb 2025 23:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738883128; cv=fail; b=PZtPNDDqb1dujl+a9qWq7nn9aNnRtU8+YOBOs/zNZRXePzLz+RHF1obB+vDIeTQIRrkrMs2jCj0144oMTWwf29CNtfo9uRDFOkJUzOzzBXJyHBMxCsFqE31vZdB7nOjWTmrh0EolM3i6yznBtMEsw5hFlu2Z+H7lkbLSpgt2YWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738883128; c=relaxed/simple;
	bh=Efbs0ik8L3czqI/xm2V4boqZpDfxCKqbQ8mBT+1IU+Q=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ghI9GEctJeISaxiPfr4E6dLEpvc6DgYNno/83ynwVUfv4ToDMCGbK5XBxZdPspFQucqN+VC+0lZjp/wKM6tMlueOT9DIZdEcmXSnXT2bOsMriFX4X8xIFzLKFLE1elj6iVkpC2677R3Lnhefh1bP9A/Tw6Wtz74AER6MxElfRXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aalto.fi; spf=pass smtp.mailfrom=aalto.fi; dkim=pass (2048-bit key) header.d=aalto.fi header.i=@aalto.fi header.b=w11a/XZz; arc=fail smtp.client-ip=40.107.21.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aalto.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aalto.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aalto.fi header.i=@aalto.fi header.b="w11a/XZz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbDatv5TuelKr4uZhRDLikDgmOtmEiOHVFhmlh/MgTSm4CDsq6WCSjHfok17HqBxJyLep/UA4Db2Xh7652YRF3PkI5agcC7OaBDujEEJD2MjzxYoK33V6yQbLyWC05i+UK1cyDOYcdFaPkCOKOITzw8y7BiXzl3AOni1DP6AcRIB5aQJoRi3Fu6LQZlq89r2kfchSxaVP7QstANRG9RKxObP1yJaDxjb/IDPrFtiVHHGUdubvMjN4VSufEIeKHrhve+jwRuhBLm8ngi5aCztrS5AKZJKi6PNQAdEkQuendoElXBxn9Va9lw7KlfDaYvU3rZa8vVtopYhT8pdkkk02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Efbs0ik8L3czqI/xm2V4boqZpDfxCKqbQ8mBT+1IU+Q=;
 b=Y2mmF9HpmcXVqNF0Ynyvm8LJ1gYBu+3k487RocM3f6JNf+YV5tnzzMmDug0YQZkskDiyjaffHujZ+Qoff6Br84EDB1mymbOBgDkVan9D7AEze2DLkyrAxQNtjU1v3Xu66mHB3k4oX+kGWN50QwzUfpNquxwqoDxjVbGWR/0Yyh3/Y0EZYJHcHzsU5Hf7ILyJ9Qqyk6Fo9EkvTEXi7cbLX79Ujk/+T2t3ekAt5ZXNjcIKusvwQhSIoGq7Dv9vnxSGWHq7kU92xNM+NAIZy1HrD/Gu6qTGEQrtWkganL6jF3jmIh2m4ZSzW+scHijzGcHzle0BhfqaspMa0+X2WSMBvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aalto.fi; dmarc=pass action=none header.from=aalto.fi;
 dkim=pass header.d=aalto.fi; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aalto.fi; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Efbs0ik8L3czqI/xm2V4boqZpDfxCKqbQ8mBT+1IU+Q=;
 b=w11a/XZz6ws5n7aSY3BQQ1HTKEF7AVWdyiCZ7AalkjYqmst1PskroVi9NeAQMQsrRceCbw8GX4+IqXOCRWIG5BrDd/Jx7wNyGSCndHW3nINrL+R7G9EJGhrtHQgUR5vzuiUY7lrGU5/ox3EcajDzhfGfV2IYexB/gbVjQGV/Z8u8fVzIB3lNMcNaPx/DFhrcW3WGmiWTKhIYB1QN0UJjpyKzfCDB9y7q4rWzoXKx1GfcF5DLU2BtC2iWzFFqFpVyLu/mRq9e9TcbKIsMa4Pa1/WLeDKh2/RzFR913wbh0SHlX7023sxMEUx+0rjsHjshFOkJUF8jWmMiX4Hot0zxIA==
Received: from DU4P192MB2398.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:572::18)
 by AS2P192MB2245.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:644::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 23:05:20 +0000
Received: from DU4P192MB2398.EURP192.PROD.OUTLOOK.COM
 ([fe80::2a19:269c:3593:22cf]) by DU4P192MB2398.EURP192.PROD.OUTLOOK.COM
 ([fe80::2a19:269c:3593:22cf%5]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 23:05:18 +0000
From: Sundelin Henri <henri.sundelin@aalto.fi>
To: "tpm2@lists.linux.dev" <tpm2@lists.linux.dev>
Subject: Is this use case possible?
Thread-Topic: Is this use case possible?
Thread-Index: AQHbeOobDmxheOIlG06NR7v9hhBDPA==
Date: Thu, 6 Feb 2025 23:05:18 +0000
Message-ID:
 <DU4P192MB2398B0936B91B4BB2754ECC0F8F62@DU4P192MB2398.EURP192.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aalto.fi;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU4P192MB2398:EE_|AS2P192MB2245:EE_
x-ms-office365-filtering-correlation-id: 66451f37-30f4-47c4-42fa-08dd4702b9ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/7HGILCWaoU725glkbMZ04EHhomNENIxYwr2eSdGI7t+yQr139FkS43EuB?=
 =?iso-8859-1?Q?w8/FZfpxnARYDruEHZfMU8sXY42UrQe5ykmkwzDHQd7M/HWwmO3amFY36q?=
 =?iso-8859-1?Q?pkB7UsFn9Z7c4jMYfzkLDba8EyklCUNLrCIGEHMnS9S6RLiwqN9IQ7t96p?=
 =?iso-8859-1?Q?gUJ0UMuxBOKuyUJj+SPh6JTCbVULJD5fe+DarZXd8xyJPWuu+w7fyT2aH0?=
 =?iso-8859-1?Q?kIpdfxA8sox8rm+O3uvISVS5UM9jXLhsiUQmJfJ02ZuxSXgqeJBEqmzfgZ?=
 =?iso-8859-1?Q?9/yF8sMYE+2/syNrzsC59v+6YuY3vRJ+K4uv67juqQVY0KN3UE5hl8hSiM?=
 =?iso-8859-1?Q?wq7+8uBkX3+95Zbfas55Vby/6tLgzlmtkMwHAt2+j29WNCSDsq/zrvzn79?=
 =?iso-8859-1?Q?a33Iq1MES0UsC9omCE0M8g3LqpDUoJ785ATYOKccWexC/KeZD0CMvB4Fus?=
 =?iso-8859-1?Q?dLapWQUEDvvqeCeE2gHO8oCfiG8+V9yeLJaJ0qpqcYe+pUdOXqePUWHiH0?=
 =?iso-8859-1?Q?FJYJCyUDX3GTs/hcg2mFMISbXlqILt/+Bxk3cYTtzdogBTY4jpnze63leW?=
 =?iso-8859-1?Q?qDcZ8SGJVzXpI3E6FdN9jnYkiXYYe91CNB+neu/no3KMu3okrUV5op3tPR?=
 =?iso-8859-1?Q?L7M/7g+iTPdMzYIHcoUdoBZkLenhgSbyD2jNRYPFEM+oWz7DlXI2yrjANn?=
 =?iso-8859-1?Q?hszUNdRL0MI/ytnDfiyNlgQdUI3MwNkK5gPp5axzUUYO/v6vJn575Q0zD+?=
 =?iso-8859-1?Q?qlPj0iCbGljml936LqiTxe4u01qGmSN+VYjjsGcpWLVZpaz2BEZwF0S+TR?=
 =?iso-8859-1?Q?woeztM80xzKPNEacammcox92PzuElAN7RDEv0zLx42epOY/Ovs3hV3i0HZ?=
 =?iso-8859-1?Q?sfPD4/rZ0tIAbEKJlZxhsiquQsPJyCjxkapxms0EoaqnfVmMa9hdZWrbPV?=
 =?iso-8859-1?Q?14Mr1WvWNUpiSdwMN3A4DRfFXPckzIZiw3WkoojtJwx+ZC5lx+x8PXaGPu?=
 =?iso-8859-1?Q?Ig8IVZgaJQEjECZIy/tFrNsktrhL+H5D5iIMEAJrjSabX0APyKryzayGqm?=
 =?iso-8859-1?Q?/kjfUwAgoXHUyfOeZZXIsn8qU121nFq9di0XEjDzu81C0ZvSSR9izq8Alx?=
 =?iso-8859-1?Q?WT3+FQP1mwIh/Ah8vOzrsGeI+GJ4UZ9oHapfZWuvAkP4cw2sGt9zXOCpvU?=
 =?iso-8859-1?Q?BEyWGbypUV88DM+B9KvDLccpe57DYW1bysvnY6C2G/irgAVxsIrGmwV+4q?=
 =?iso-8859-1?Q?MDxO8znylZfjGG4FVM/6NN7AiIiGpScKUl6cmSfnKdBTdWj40WyJNMTh1O?=
 =?iso-8859-1?Q?t6AxGyAKnzgUEzBosjZjwMiebhYQ4KPJJNn13GOi0hZd9VzsEvk2592K6S?=
 =?iso-8859-1?Q?mqw7OFYqTQfR09DdM+p9KJ4nhQQadQb4mD78F9D/fMTSugxDtR108VfNYj?=
 =?iso-8859-1?Q?kZc9Jm1WJd1hLcXdRXH6lDaOrIZL+3VaGNxHSvAFbGLUY07AmXJ8hMqauW?=
 =?iso-8859-1?Q?iks/KlFrWrteQP/RR9bJV0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4P192MB2398.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FDh7mlr7SzkKm89GD2/0NBP9sSmKIozGOFrwdAZYiZFbeTon9trA866n25?=
 =?iso-8859-1?Q?e44R3frXYN6zcUTez+eF9tZ8NmBH8wz2a09uYYTKGHOHtHA2plCRY6qMuu?=
 =?iso-8859-1?Q?8wbMcaxyRplNWiypVu21n5vCS5vAx6uQ2GU5FxXiv4ddFgxE+wg0pYg0Nk?=
 =?iso-8859-1?Q?jXpYdXdmTjXjIdlCzuBaq4CR/q+1/VbJ/JMkQUQu1gXdF5Xf/2XSC/QI3O?=
 =?iso-8859-1?Q?KIrCP9AIRRj517XtYoiE5AP5cHWMxH9zVim0ttIA1e1XIO3aKD1gYvJGL7?=
 =?iso-8859-1?Q?bjCJhIKoeVXKnKsNp5CqUbTlvviwYVKcyCyDxgwSmLFgZ62k6KZ6zLDLiv?=
 =?iso-8859-1?Q?k0v+xgBmMhln3GZ3InoCJ1WTAHF5IdpHnP8jAK5noBX6ILnha7m19DdA4I?=
 =?iso-8859-1?Q?eIYAAC7PJFv7+WglAZBgLwzMntPXH0TI6MRORIaL0+g0UuA+F6zBRnhxxi?=
 =?iso-8859-1?Q?67c5k9njcnVHA6cW92veyp8BRHaDnhDwxDof2YqDPaW+OPT6LHSLPVU1oH?=
 =?iso-8859-1?Q?gQm4lhW1+XMtJyqaPLXgksH6oNbkkNW/DdjUiLuuuNSbeT6fOu1slvPasz?=
 =?iso-8859-1?Q?zTPLS9bxWPkHUT2F/bgkLT9SdnQxBbCgqGtHYhGcW3nHQhn28BrzKUPGAF?=
 =?iso-8859-1?Q?mRWt9+gOb3bWcuSHIicuFbuqG1/w9zD/gKKgu3uev/fsVX6f2SD5f7NXP7?=
 =?iso-8859-1?Q?RLRHbZwUdjJJ7ixlz9WuGxBqSjJk3L+9djbTDWvEGNOl6AmhX8ZScJO06r?=
 =?iso-8859-1?Q?Z5CPA+YJDS/eep9y3a4yN27IExZJtfBWvVuAK0vOM4dANWUnQuiUR2vyRB?=
 =?iso-8859-1?Q?TpWi36rJ+kso/2fUgwG5Ke5cyVUzIU5IR5paAPKf9Pfft6LUgMrEtVkJmg?=
 =?iso-8859-1?Q?xFbBQfC7wbsc8MToB9WE/HmDcWyqn4t1464EQe25RPu83pRn1ZtddJTL7o?=
 =?iso-8859-1?Q?4/1uAMwYdpOHiWswum/49MlxCFjOUVHlfH9oCGGnUjTpoaLsL6GKnq0uql?=
 =?iso-8859-1?Q?BbHYH3V2UFANRNFOfPSx6kRZFP02zUpZ+WEeI1PEggML8Hvsy0FI9c4nev?=
 =?iso-8859-1?Q?htYWk8D1MiKpw30d4Y9pD8jkSIj5z7hAsIfUyIcH88zTHuvqierBq+OK6E?=
 =?iso-8859-1?Q?7vL1U29bhAY3X9UWV42KOqMAw0P1KVDIq84mE6OsNozY2QKEcT8QujMcl8?=
 =?iso-8859-1?Q?XfSNAZSv9bNRT4Btl+J2VFTiPmTkrpcIULDoOx5fkJ26pWrdb0S2yhL7WR?=
 =?iso-8859-1?Q?JexNUv7BSC2TiiQAU4aIrnAwyrNcfjfIPz1hkZtfWOUct/EQyhDmlyYDvA?=
 =?iso-8859-1?Q?Kzta/ZO6SDftB2UAvIh708+desrFd5C+WUM9E3ZSaLqTQ+oju2eYYN1ql+?=
 =?iso-8859-1?Q?cKmqHx6PCa9ROD8nxHBiP0dnoUIK/O3np4NSM3SjZn2IrWsOdcjAKpHyfU?=
 =?iso-8859-1?Q?0A4p0tP/7DcLJQ/IhSSweh9i+zGQD4+sWpo9TPHLYdFx8PzrKGERh9laA6?=
 =?iso-8859-1?Q?1tsTfjnFWpvKBALeeVsH2EbeHEVdWSmny46tEgOPmIY8xp1mKply6dn1rx?=
 =?iso-8859-1?Q?AFZxxvnNInrByD4bKqzA7NoED2r5sEkEaiGkw0f6IJqHIevzGyvFzMxFNo?=
 =?iso-8859-1?Q?HYI5G4uyZytsdO8OJMwkB7py2jbHFgR0dy?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: aalto.fi
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU4P192MB2398.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 66451f37-30f4-47c4-42fa-08dd4702b9ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 23:05:18.7118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ae1a7724-4041-4462-a6dc-538cb199707e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4XufVe7aAwMrZ7+IPx1KAA7vcyNyXilaN7PnyU8g6u/Cb7g6ZT98AU70nKpFJp3eJ+xQcoNmLIFTYTWZIFzqvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P192MB2245

Hi,=0A=
=0A=
I'm considering using the TPM for my use case, but the docs are to say at l=
east complicated. So, I thought I simply ask!=0A=
=0A=
I want to do this process:=0A=
1. Create public-private keypair in TPM=0A=
2. Use the public key to encrypt an externally generated AES256 key=0A=
3. Import the encrypted AES key to TPM, decrypt with private key=0A=
4. Use the AES key for cipher operations.=0A=
=0A=
Sounds straightforward, yes? =0A=
We however have a mandatory requirement. The AES key may not be in cleartex=
t in CPU registers/memory in any time. =0A=
=0A=
When I tried to look docs for import/load operations, it left me wondering =
is the key actually cleartext in the memory at some point (or in any reason=
ably brute-force decryptable form?)=0A=
=0A=
 I left out from the list the inner cipher mentioned in the docs, it was un=
clear to me where that key comes from. I'd actually prefer to use ECC for p=
ublic-private, and ECDH to derive the inner key, but I did not see anything=
 but RSA in the docs.=0A=
=0A=
I know very well how to do this with an external HSM device - but I'm ponde=
ring would this be possible with the TPM as well?=0A=
=0A=
Best,=0A=
//Henri=0A=
