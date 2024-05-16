Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373C828680
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715864806; cv=none; b=KECeCU6MQBlSdztYhZnRnuIRRqcGbCiKQUAptebDNQ/WO/I+QTKwu1LNMvlJwKfalNTlSvWqOyAcLKEOOVm2s/BtbkFG5wr8Xn0IfpvvxKgiFPeF6uTRM6FGonjJAKXq5OCmZwU350ituOihFH2TLdhPAs5fWz0lZYnW21ij7CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715864806; c=relaxed/simple;
	bh=xTXNW8nJQGofW3xpI3UyAbJd6s5dVkIWu7Wd0DPsxe0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZzPVCsh+fAUT50nN2iEA8xOCXl8obnQQQq171L3DPouIGvrb9YaNKG0mMgwPYm8aXtEjUdTyBOra5oWuJCFenhg5PYaH1dPWB3JyZMiADnXljKTM86leay9ql3PkDACEJcz7WZKhxkiCT4SsrfCIXtVQ1lyXN6K/+GXTz7wDdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=J3oV7BSk; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="J3oV7BSk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1715864805; x=1747400805;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xTXNW8nJQGofW3xpI3UyAbJd6s5dVkIWu7Wd0DPsxe0=;
  b=J3oV7BSkGLioDEm0qFA9hmKNOrv1Htwf95R21s/f53qC8cdsnsuZev1Y
   GDJY04APGCTu6yxby9xgHMl45C6sq0hdRkBH98n6bSmy6qoQD75zFRq4l
   0hEXViUp1AzIcaJ5BrYt3BIXVNaqI4OaVb7Wnog/RdWcof4SqDCPDd80N
   g=;
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="76265769"
X-IronPort-AV: E=Sophos;i="6.08,164,1712613600"; 
   d="scan'208";a="76265769"
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 15:05:33 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 16 May
 2024 15:05:32 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE843.infineon.com
 (172.23.7.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 16 May
 2024 15:05:32 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.1118.040; Thu, 16 May 2024 15:05:32 +0200
From: <Andreas.Fuchs@infineon.com>
To: <jarkko@kernel.org>, <tpm2@lists.linux.dev>
CC: <prestwoj@gmail.com>
Subject: RE: TPM2_Sign vs TPM2_RSA_Decrypt
Thread-Topic: TPM2_Sign vs TPM2_RSA_Decrypt
Thread-Index: AQHap3th3qoarclTFECdi7T8P40SwrGZwa1Q///tdICAACH0YA==
Date: Thu, 16 May 2024 13:05:32 +0000
Message-ID: <e6ac8dc493f04fdca0469f7df7735468@infineon.com>
References: <D1AZVM0QQF2M.1SZHF66G10XK8@kernel.org>
 <c8c85a062358420ab13e849a902606cd@infineon.com>
 <D1B2ZP29BA7Y.3OYCZMEP3MLGY@kernel.org>
In-Reply-To: <D1B2ZP29BA7Y.3OYCZMEP3MLGY@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

PiBJZiBzb21lb25lIGNvdWxkIHJlYWxseSBwdXQgVFBNMl9TaWduIGludG8gbnV0c2hlbGwgdGhh
dCdkIGJlIGF3ZXNvbWUuDQoNCldlbGwsIFRQTTJfU2lnbiB3aWxsIHBlcmZvcm0gYSBzaWduaW5n
IG9wZXJhdGlvbiBmb3IgeW91IGdpdmVuIHRoZSBrZXkuDQpZb3UgY2FuIHNldCB0aGUgc2NoZW1l
IGluIHRoZSBzY2hlbWUgcGFyYW1ldGVyLiBUaGF0J3MgYWJvdXQgaXQuLi4NCg0KPiBNYXliZSBh
IGR1bWIgcXVlc3Rpb24gYnV0IHdoYXQgSSBjb3VsZCBwb3NzaWJseSBhY2NvbXBsaXNoIHdpdGgg
VFBNMl9TaWduIHRoYXQgSSBjb3VsZCBub3QgYWNjb21wbGlzaCB3aXRoIFRQTTJfUlNBX0RlY3J5
cHQgYW5kIGFwcHJvcHJhaXRlIEFTTi4xIGhlYWRpbmcgYW5kIHBhZGRpbmc/DQoNClllcy4gSWYg
eW91IHNldCBUUE1BX09CSkVDVF9TSUdOIGJ1dCB1bnNldCBUUE1BX09CSkVDVF9ERUNSWVBULiBU
aGlzIHdheSB5b3UgY2FuIG1ha2Ugc3VyZSB0aGF0IG9ubHkgc2lnbmluZy1wYWRkaW5nIGNhbiBl
dmVyIGJlIGV4ZWN1dGVkIGJ1dCBuZXZlciBkZWNyeXB0LWJhc2VkIHN0dWZmLg0KSW4gb3JkZXIg
dG8gdXNlIFRQTTJfUlNBX0RlY3J5cHQgeW91IG5lZWQgdG8gc2V0IFRQTUFfT0JKRUNUX0RFQ1JZ
UFQgd2hpY2ggaXMga2luZCBvZiB3ZWlyZC4NCg0KQWxzbywgaWYgeW91IHdhbnQgdG8gdXNlIGEg
cmVzdHJpY2VkIGtleSAoZm9ybWFsbHkgY2FsbGVkIEF0dGVzdGF0aW9uIEtleSkgZm9yIHJlZ3Vs
YXIgc2lnbmluZyBvcGVyYXRpb25zLCB5b3UgbmVlZCB0byBoYXZlIGEgVFBNQV9PQkpFQ1RfU0lH
TiBhbmQgbXVzdCBub3QgaGF2ZSBUUE1BX09CSkVDVF9ERUNSWVBUIHNldC4NCg0KVGhvc2Ugd291
bGQgYmUgdGhlIHJlYXNvbnMgZm9yIHByZWZlcnJpbmcgVFBNMl9TaWduIHdoZXJldmVyIHBvc3Np
YmxlIElNSE8uDQoNCkNoZWVycywNCkFuZHJlYXMNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEphcmtrbyBTYWtraW5lbiA8amFya2tvQGtlcm5lbC5vcmc+IA0KU2VudDogRG9u
bmVyc3RhZywgMTYuIE1haSAyMDI0IDE0OjUyDQpUbzogRnVjaHMgQW5kcmVhcyAoU01EIEMzIEVN
RUEgVE0pIDxBbmRyZWFzLkZ1Y2hzQGluZmluZW9uLmNvbT47IHRwbTJAbGlzdHMubGludXguZGV2
DQpDYzogSmFtZXMgUHJlc3R3b29kIDxwcmVzdHdvakBnbWFpbC5jb20+DQpTdWJqZWN0OiBSZTog
VFBNMl9TaWduIHZzIFRQTTJfUlNBX0RlY3J5cHQNCg0KQ2F1dGlvbjogVGhpcyBlLW1haWwgb3Jp
Z2luYXRlZCBvdXRzaWRlIEluZmluZW9uIFRlY2hub2xvZ2llcy4gRG8gbm90IGNsaWNrIG9uIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSB2YWxpZGF0ZSBpdCBpcyBzYWZlPGh0
dHBzOi8vaW50cmFuZXQtY29udGVudC5pbmZpbmVvbi5jb20vZXhwbG9yZS9hYm91dGluZmluZW9u
L3J1bGVzL2luZm9ybWF0aW9uc2VjdXJpdHkvdWcvU29jaWFsRW5naW5lZXJpbmcvUGFnZXMvU29j
aWFsRW5naW5lZXJpbmdFbGVtZW50c19lbi5hc3B4Pi4NCg0KDQoNCk9uIFRodSBNYXkgMTYsIDIw
MjQgYXQgMzowMSBQTSBFRVNULCAgd3JvdGU6DQo+IEZvciB0aGUgT3BlblNTTCBlbmdpbmVzIGFu
ZCBhbHNvIHRoZSBHTlUtVExTIGVuZ2luZSwgd2UgZ28gYWhlYWQgYW5kIA0KPiB1c2UgVFBNMl9S
U0FfRGVjcnlwdCBmb3IgUlNBIFNpZ25pbmcgYnV0IFRQTTJfU2lnbiBmb3IgRUNEU0Egc2lnbmlu
Zy4NCg0KWWVhaCB3ZSBnZXQgc2ltcGxlc3QgYW5kIG1vc3QgdW5kZXJzdGFuZGFibGUgYW5kIG1v
c3QgY29tcGF0aWJsZSBSU0EgYmVjYXVzZSBpdCBpcyB0ZXh0Ym9vayBzdHlsZSB3aXRoIG5vIHN0
cmluZ3MgYXR0YWNoZWQgOi0pIFlvdSBjYW4gZml0IGl0IHRvIGFueSBzY2hlbWUuDQoNCkkgY2Fu
IGFkbWl0IGFmdGVyIHJlYWRpbmcgVFBNMl9TaWduIGRvY3VtZW50YXRpb24sIG15IGhlYWQgaHVy
dHMgYW5kIEkgc3RpbGwgZG9uJ3QgdGhpbmsgSSBmdWxseSBnZXQgdGhlIGdpc3Qgb2YgaXQgc28g
YmV0dGVyIG5vdCB0byB1c2Ugc29tZXRoaW5nIHRoYXQgeW91IGRvbid0IGdldCwgcmlnaHQ/IDot
KQ0KDQpJZiBzb21lb25lIGNvdWxkIHJlYWxseSBwdXQgVFBNMl9TaWduIGludG8gbnV0c2hlbGwg
dGhhdCdkIGJlIGF3ZXNvbWUuDQoNCj4gVGhlIHJlYXNvbiBoZXJlIHdhcywgdGhhdCBPcGVuU1NM
IHdhbnRzIHRvIHBlcmZvcm0gU0hBNTEyIGRpZ2VzdHMgYW5kIA0KPiBwYWRkaW5nLCB3aGlsc3Qg
dGhlIFRQTSBvbmx5IHN1cHBvcnRlZCBTSEEzODQuIEFuZCBhbiBPcGVuU1NMIGVuZ2luZSANCj4g
Y291bGQgbm90IHRlbGwgdGhlIE9wZW5TU0wtVExTLW1vZHVsZSwgd2hpY2ggSGFzaC1BbGdzIGFy
ZSBzdXBwb3J0ZWQuDQo+IElmIHRoYXQgcmVzdHJpY3Rpb24gZG9lcyBub3QgZXhpc3QsIEkgd291
bGQgYWxzbyB0ZW5kIHRvIHVzZSBUUE0yX1NpZ24gDQo+IGZvciBSU0Egc2lnbmluZy4NCg0KTWF5
YmUgYSBkdW1iIHF1ZXN0aW9uIGJ1dCB3aGF0IEkgY291bGQgcG9zc2libHkgYWNjb21wbGlzaCB3
aXRoIFRQTTJfU2lnbiB0aGF0IEkgY291bGQgbm90IGFjY29tcGxpc2ggd2l0aCBUUE0yX1JTQV9E
ZWNyeXB0IGFuZCBhcHByb3ByYWl0ZSBBU04uMSBoZWFkaW5nIGFuZCBwYWRkaW5nPw0KDQpUaGlz
IGNvbm5lY3RzIHRvIHRoZSBub3QgdW5kZXJzdGFuZGluZyBUUE0yX1NpZ24gKG9idmlvdXNseSku
DQoNCkp1c3QgdHJ5aW5nIHRvIG1ha2Ugc3VyZSB0aGF0IHdlIG1ha2UgZXhhY3RseSByaWdodCBj
YWxsIGZvciBrZXJuZWwuDQoNClRoYW5rcyBmb3IgcmVzcG9uZGluZyENCg0KPg0KPiBDaGVlcnMs
DQo+IEFuZHJlYXMNCg0KQlIsIEphcmtrbw0KDQo=
