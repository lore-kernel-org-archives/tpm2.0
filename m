Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFC2145FE7
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 12:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715860983; cv=none; b=QQomS4fGOQbHVFpWyfFbJcoeEYjy1Fa4pjJHsxErKlRpulpB8dGW+h5vTHxRH7CaSz20J/Iuqq8tHcx56U2rDt1yLPJInhroyqx89N9eloGqGncbj8iFbPvffSdy7M5MGVME7tcVyN/pcLSRt8l/cWfw5dI+gufS7DkkgcequHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715860983; c=relaxed/simple;
	bh=/0+ihP2fOddMUoDWAcHl0Sm6FIf6Vfc2fPLNfkdIfTE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aQUxdKlnDwFPzsUjNu4Jzbf7AYuglTYyj5QOxSXBr2JsyLr4KAEUFjh/Mh0AZ7a/p/Dh+2gsRemunq17oohvlUyZTlKFMXr8VI/sffWR4K+e1KcvUYq9Kol4ccuoLpwpQ4DY0z399emwM2l6KXStEJ66hma06dA8OkLYGaJA/Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=T2ypZ2K1; arc=none smtp.client-ip=217.10.52.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="T2ypZ2K1"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1715860981; x=1747396981;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/0+ihP2fOddMUoDWAcHl0Sm6FIf6Vfc2fPLNfkdIfTE=;
  b=T2ypZ2K1A97MlETtyroY0WL5new7Sxm3r04mwlKQC32o3XOM19gLoTHw
   7orJQeKwPLCVLVje5TW3KdxrcaVgzVM6JmFXrTKg/Pnf0tpDy2mEElRg6
   KULhEyWamqVLbIARPT0NsM46GMjZMN8IiWHqVvPI6a5oTIL8vETjqArHH
   o=;
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="19260836"
X-IronPort-AV: E=Sophos;i="6.08,164,1712613600"; 
   d="scan'208";a="19260836"
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 14:01:37 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 16 May
 2024 14:01:36 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE843.infineon.com
 (172.23.7.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 16 May
 2024 14:01:36 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.1118.040; Thu, 16 May 2024 14:01:35 +0200
From: <Andreas.Fuchs@infineon.com>
To: <jarkko@kernel.org>, <tpm2@lists.linux.dev>
Subject: RE: TPM2_Sign vs TPM2_RSA_Decrypt
Thread-Topic: TPM2_Sign vs TPM2_RSA_Decrypt
Thread-Index: AQHap3th3qoarclTFECdi7T8P40SwrGZwa1Q
Date: Thu, 16 May 2024 12:01:35 +0000
Message-ID: <c8c85a062358420ab13e849a902606cd@infineon.com>
References: <D1AZVM0QQF2M.1SZHF66G10XK8@kernel.org>
In-Reply-To: <D1AZVM0QQF2M.1SZHF66G10XK8@kernel.org>
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

Rm9yIHRoZSBPcGVuU1NMIGVuZ2luZXMgYW5kIGFsc28gdGhlIEdOVS1UTFMgZW5naW5lLCB3ZSBn
byBhaGVhZCBhbmQgdXNlIFRQTTJfUlNBX0RlY3J5cHQgZm9yIFJTQSBTaWduaW5nDQpidXQgVFBN
Ml9TaWduIGZvciBFQ0RTQSBzaWduaW5nLg0KDQpUaGUgcmVhc29uIGhlcmUgd2FzLCB0aGF0IE9w
ZW5TU0wgd2FudHMgdG8gcGVyZm9ybSBTSEE1MTIgZGlnZXN0cyBhbmQgcGFkZGluZywgd2hpbHN0
IHRoZSBUUE0gb25seSBzdXBwb3J0ZWQgU0hBMzg0Lg0KQW5kIGFuIE9wZW5TU0wgZW5naW5lIGNv
dWxkIG5vdCB0ZWxsIHRoZSBPcGVuU1NMLVRMUy1tb2R1bGUsIHdoaWNoIEhhc2gtQWxncyBhcmUg
c3VwcG9ydGVkLg0KSWYgdGhhdCByZXN0cmljdGlvbiBkb2VzIG5vdCBleGlzdCwgSSB3b3VsZCBh
bHNvIHRlbmQgdG8gdXNlIFRQTTJfU2lnbiBmb3IgUlNBIHNpZ25pbmcuDQoNCkNoZWVycywNCkFu
ZHJlYXMNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEphcmtrbyBTYWtraW5l
biA8amFya2tvQGtlcm5lbC5vcmc+IA0KU2VudDogRG9ubmVyc3RhZywgMTYuIE1haSAyMDI0IDEy
OjI1DQpUbzogdHBtMkBsaXN0cy5saW51eC5kZXYNClN1YmplY3Q6IFRQTTJfU2lnbiB2cyBUUE0y
X1JTQV9EZWNyeXB0DQoNCkNhdXRpb246IFRoaXMgZS1tYWlsIG9yaWdpbmF0ZWQgb3V0c2lkZSBJ
bmZpbmVvbiBUZWNobm9sb2dpZXMuIERvIG5vdCBjbGljayBvbiBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVubGVzcyB5b3UgdmFsaWRhdGUgaXQgaXMgc2FmZTxodHRwczovL2ludHJhbmV0LWNv
bnRlbnQuaW5maW5lb24uY29tL2V4cGxvcmUvYWJvdXRpbmZpbmVvbi9ydWxlcy9pbmZvcm1hdGlv
bnNlY3VyaXR5L3VnL1NvY2lhbEVuZ2luZWVyaW5nL1BhZ2VzL1NvY2lhbEVuZ2luZWVyaW5nRWxl
bWVudHNfZW4uYXNweD4uDQoNCg0KDQpIaSwNCg0KSSdtIHB1c2hpbmcgd2l0aCBKYW1lcyBQcmVz
dHdvb2QgUlNBIGFuZCBFQ0RTQSBiYXNlZCBhc3ltbWV0cmljIGtleXMgdG8gYXN5bW1ldHJpYyBr
ZXlzIHN1YnN5c3RlbSBvZiB0aGUga2VybmVsIGFuZCBmb3IgZS5nLiBSU0Egd2UgY2FuIGp1c3Qg
dXNlDQpUUE0yX1JTQV9EZWNyeXB0Og0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
MDA1MTgxNzI3MDQuMjk2MDgtMTgtcHJlc3R3b2pAZ21haWwuY29tLw0KDQpJJ3ZlIGltcGxlbWVu
dGVkIHNvbWUgY29kZSB0aGF0IG1ha2UgdGhpcyBmaXQgbW9yZSBjbGVhbmx5IHRvIHRoZSBrZXJu
ZWwgYW5kIEphbWVzIHdpbGwgcmVmYWN0b3IgaGlzIG9sZCBjb2RlIG9uIHRvcCBvZiB0aGF0LiBJ
LmUuIGFkZCB0aGUgcGFkZGluZyBhbmQgYXNuMSBkYXRhIGFuZCBtYWtlIHguNTA5IGNvbXBhdGli
bGUgc2NoZW1lLiBKdXN0IGRvIHRleHRib29rIHN0eWxlIFJTQSBwYXJ0IHdpdGggVFBNMi4NCg0K
SnVzdCBmb3IgcGxhaW4gaW50ZXJlc3QsIGJlY2F1c2UgSSdtIG5vdCB0b28gZmFtaWxpYXIgd2l0
aCBUUE0yX1NpZ246DQp3aGVuIHdvdWxkIHlvdSBjaG9vc2UgdG8gdXNlIGl0IGluc3RlYWQ/IEkg
anVzdCB3YW50IHRvIG1ha2Ugc3VyZSB0aGF0IHdlJ3JlIGRvaW5nIHJpZ2h0IHRoaW5ncyByaWdo
dCA6LSkNCg0KQlIsIEphcmtrbw0KDQo=
