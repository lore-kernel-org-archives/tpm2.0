Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3413F81737
	for <tpm2@lists.linux.dev>; Fri, 31 May 2024 07:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717139010; cv=none; b=MSKCOrlzSf5XSufqKAzQzycYqVptRPw6WZvHseEwNVO6NPOMbaw6zEoSJXMcHhwksfynRL1DQD3tx5HUwzK319r1xxcg8i+E6xDSIgo2XZzJgSQA5iqiIXIah8M1dBR9WU8kcT0aUYmKDoKY4ZcrBAIceMyvYjwx7USqyyp5Ezs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717139010; c=relaxed/simple;
	bh=3tauoN1EKuMBiFkeyT5aoMPgC9Oq7Yf87OiOAn8WnjQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DJ3D2nGJjE46Gk8DvkkXxbwzpmZq0WnvrksG8SelJPdiBgHrOmL8hl7W0np0E9Tt9+7EGQncmCU1hzaejUD+83cg+UP7a5biBvoViIwK6t3LPHp56i4kw4zvrojni6n30p24hSKR/adWbU4XrR0qLQwCG8s4o+PiKLr7oP7lvu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=IIvQfSK3; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="IIvQfSK3"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1717139009; x=1748675009;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3tauoN1EKuMBiFkeyT5aoMPgC9Oq7Yf87OiOAn8WnjQ=;
  b=IIvQfSK3CLTI8QFa/xSQwZguMA7N+twFu1Hh7l0M0+53cyp5NYCEmE6E
   eUBDL2tW5/fV/sDabGbSJTred1FqScTuO+4Cm2/qPpZys78G4rv/mJSDN
   fAtMBCd1Z1jIDTPvi3b0/NpzRUhxMZpUswvgpzWjOT22daXwr3bkYakna
   k=;
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="77513804"
X-IronPort-AV: E=Sophos;i="6.08,203,1712613600"; 
   d="scan'208";a="77513804"
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 09:03:20 +0200
Received: from KLUSE842.infineon.com (172.28.156.183) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 31 May
 2024 09:03:19 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by KLUSE842.infineon.com
 (172.28.156.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 31 May
 2024 09:03:19 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.1258.034; Fri, 31 May 2024 09:03:19 +0200
From: <Andreas.Fuchs@infineon.com>
To: <mzgcz2gff@0pointer.net>, <tpm2@lists.linux.dev>
Subject: RE: Policies for nvindex based "fake" PCRs
Thread-Topic: Policies for nvindex based "fake" PCRs
Thread-Index: AQHasakAHuaB2DmAL0qROhcvBGuxobGw4pUw
Date: Fri, 31 May 2024 07:03:19 +0000
Message-ID: <c0ae15e771c14afab6e79b0d62463a1e@infineon.com>
References: <ZlbyLOBBGPRxm-gO@gardel-login>
In-Reply-To: <ZlbyLOBBGPRxm-gO@gardel-login>
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

SGkgTGVubmFydCwNCg0KdGhlcmUgaXMgb25lIGZ1cnRoZXIgYXBwcm9hY2ggdG8gZG8gdGhpbmdz
Og0KDQotIFVwb24gYm9vdCwgZXh0ZW5kIHRoZSBOVi1QQ1IgYnkgYSBzZWNyZXQgaW5pdGlhbCBl
eHRlbmQgdmFsdWUuIFRoZW4gZG9jdW1lbnQgdGhlIHJlc3VsdGluZyBOVi1jb250ZW50IGFzIHRo
ZSBvbmx5IHZhbGlkIGluaXRpYWwgc3RhdGUgdmFsdWUuDQotIFRodXMsIGlmIHNvbWVvbmUgYXR0
ZW1wdHMgdG8gZGVsZXRlIGFuZCByZWNyZWF0ZSB0aGUgTlYtaW5kZXgsIHRoZXkgY2Fubm90IHJl
Y3JlYXRlIHRoZSBpbml0aWFsIHN0YXRlLg0KDQpJZiB5b3VyIHVzZWNhc2UgaXMgKG9ubHkpIHJl
bW90ZSBhdHRlc3RhdGlvbiwgdGhlbiB5b3UgY2FuIHVzZSBhIHJhbmRvbSBpbml0aWFsIGV4dGVu
ZCB2YWx1ZSBhbmQgdXNlIGEgInJlZ3VsYXIiIHBjciB0byBkb2N1bWVudCB0aGUgYWZvcmVtZW50
aW9uZWQgaW5pdGlhbCBzdGF0ZSAoc2ltcGxlIHZlcnNpb24pLg0KSWYgeW91ciB1c2VjYXNlIGlu
Y2x1ZGVzIGxvY2FsIGF0dGVzdGF0aW9uIChQb2xpY3lQQ1IvUG9saWN5TlYpLCB0aGVuIHlvdSB3
b3VsZCBoYXZlIHRvIHN0b3JlIGFuZCByZXVzZSB0aGUgaW5pdGlhbCBleHRlbmQgdmFsdWUgKGNv
dWxkIGJlIHNlYWxlZCB0byB0aGUgUENSIHN0YXRlIG9mIGEgInJlZ3VsYXIiIHBjciB2YWx1ZS4N
Cg0KRm9yIHJlbW90ZSBhdHRlc3RhdGlvbiwgeW91IGNhbiBvZiBjb3Vyc2Ugbm90IHVzZSBUUE0y
X1F1b3RlIGFueW1vcmUuIFRoZSB3YXkgdG8gZ28gaGVyZSBpcyB0aGUgdXNlIG9mIGEgU2Vzc2lv
biB3aXRoIEF1ZGl0RGlnZXN0IHRoYXQgcGVyZm9ybXMgYSBzZXQgb2YgUENSX1JlYWQgJiBOVl9S
ZWFkIGNvbW1hbmRzLg0KDQpJIGhvcGUsIHRoaXMgaGVscHMgeW91ciB1c2UgY2FzZS4NCg0KUC5T
LiBJZiB5b3VyIFRQTV9OVCBpcyBfRVhURU5ELCB0aGVuIHlvdSBkbyBub3QgbmVlZCBhIHBvbGlj
eSwgc2luY2UgTlZfV3JpdGUgaXMgZm9yYmlkZGVuIGFueXdheXMuDQpQLlAuUy4gSSBhc3N1bWUg
eW91IGFyZSBhbHJlYWR5IGF3YXJlIG9mIHRoZSBUUE1BX05WX0NMRUFSX1NUQ0xFQVIgZmxhZy4N
Cg0KQ2hlZXJzLA0KQW5kcmVhcw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
TGVubmFydCBQb2V0dGVyaW5nIDxtemdjejJnZmZAMHBvaW50ZXIubmV0PiANClNlbnQ6IE1pdHR3
b2NoLCAyOS4gTWFpIDIwMjQgMTE6MTUNClRvOiB0cG0yQGxpc3RzLmxpbnV4LmRldg0KU3ViamVj
dDogUG9saWNpZXMgZm9yIG52aW5kZXggYmFzZWQgImZha2UiIFBDUnMNCg0KQ2F1dGlvbjogVGhp
cyBlLW1haWwgb3JpZ2luYXRlZCBvdXRzaWRlIEluZmluZW9uIFRlY2hub2xvZ2llcy4gRG8gbm90
IGNsaWNrIG9uIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSB2YWxpZGF0ZSBp
dCBpcyBzYWZlPGh0dHBzOi8vaW50cmFuZXQtY29udGVudC5pbmZpbmVvbi5jb20vZXhwbG9yZS9h
Ym91dGluZmluZW9uL3J1bGVzL2luZm9ybWF0aW9uc2VjdXJpdHkvdWcvU29jaWFsRW5naW5lZXJp
bmcvUGFnZXMvU29jaWFsRW5naW5lZXJpbmdFbGVtZW50c19lbi5hc3B4Pi4NCg0KDQoNCkhpIQ0K
DQpBcyB5b3UgYWxsIGtub3cgdGhlcmUgYXJlbid0IHRoYXQgbWFueSBQQ1JzIGF2YWlsYWJsZSBp
biBUUE0yLiBCdXQgc3VwcG9zZWRseSB3ZSBjYW4gZGVmaW5lIGVxdWl2YWxlbnQgb2JqZWN0cyB2
aWEgbnZpbmRleGVzLCBhbmQgdGhlbiBkbyBleHRlbnNpb25zIHZpYSBUUE0yX05WX0V4dGVuZC4N
Cg0KSSdkIGxpa2UgdG8gYWRkIHN1cHBvcnQgZm9yIHRoaXMgdG8gc3lzdGVtZCdzIG1lYXN1cmVt
ZW50IGxvZ2ljIChzaW5jZSB3ZSdkIGxpa2UgdG8gbWVhc3VyZSBtb3JlIGNhdGVnb3JpZXMgb2Yg
c3R1ZmYsIGJ1dCBzaW1wbHkgaGF2ZSBubyBQQ1JzIGxlZnQgcmlnaHQgbm93KS4gQnV0IHdoYXQg
cHV6emxlcyBtZSBhIGJpdCBpcyBob3cgdG8gZG8gdGhpcyBjb3JyZWN0bHkgc28gdGhhdCB0aGUg
YWNjZXNzIHBvbGljeSB0byB0aGUgbnZpbmRleCBtYWtlcyBpdCBiZWhhdmUgbGlrZSBhIHJlYWwg
UENSIGFuZCBkb2Vzbid0IGFkZCB3ZWFrbmVzc2VzIHJlYWwgUENScyBkbyBub3QgaGF2ZS4NCg0K
U28gSSB3YW50IGEgcG9saWN5IHRoYXQgYWxsb3dzIHJlYWRpbmcgYW5kIHdyaXRpbmcgKHZpYQ0K
VFBNMl9OVl9FeHRlbmQpIHVucmVzdHJpY3RlZCB0byBhbnlvbmUsIGp1c3QgbGlrZSBQQ1JzLiBT
byBtdWNoIEkgZ3Vlc3MgaXMgc3RyYWlnaHRmb3J3YXJkLiBCdXQgd2hhdCBjb25jZXJucyBtZSBp
cyBob3cgdG8gbWFrZSBzdXJlIHRoYXQgcGVvcGxlIGNhbm5vdCBqdXN0IHJlbW92ZSBteSBudmlu
ZGV4IGFuZCByZWNyZWF0ZSBpdCBkdXJpbmcgcnVudGltZSwgdGh1cyByZXNldHRpbmcgaXQgdG8g
emVybyBmcmVlbHkuIEFmdGVyIGFsbCByZW1vdmFsIG9mIG52aW5kZXggaXMgbm9ybWFsbHkgdW5y
ZXN0cmljdGVkIHRvby4NCg0KV2hhdCB3b3VsZCBwcm9iYWJseSB3b3JrIGlzIGlmIEkgaGFkIGFu
IG52aW5kZXggdGhhdCBpcyBhdXRvbWF0aWNhbGx5IGRlbGV0ZWQgYXQgcmVib290LCBidXQgd2hp
Y2ggd291bGQgYmUgYmxvY2tlZCB0byBiZSBkZWxldGVkIG90aGVyd2lzZS4gQnV0IEkgZG9uJ3Qg
dGhpbmsgc3VjaCBhIHBvbGljeSBjYW4gYWN0dWFsbHkgYmUgZGVmaW5lZC4NCg0KSSBtZWFuIEkg
Y291bGQgc2V0IFRQTUFfTlZfUE9MSUNZX0RFTEVURSB3aGljaCB3b3VsZCBtZWFuIEkgbmVlZCBw
bGF0Zm9ybSBhdXRob3JpemF0aW9uIHRvIGRlbGV0ZSB0aGUgdGhpbmcsIGJ1dCB0aGlzIHNvdW5k
cyBsZXNzIHRoYW4gaWRlYWwgdG8gbWXigKYNCg0KQW55IGlkZWFzIGhvdyB0byBtYWtlIHRoaXMg
d29yaz8gSSBjYW4ndCBiZSB0aGUgZmlyc3Qgb25lIHdobyBhY3R1YWxseSB3YW50cyB0byB1c2Ug
bnZpbmRleGVzIGFzIGZha2UgUENScz8gVGhlcmUgbXVzdCBiZSBzb21lIHByaW9yIGFydD8NCkdv
b2dsZSBkaWRuJ3QgZmluZCBtZSBhbnl0aGluZyB0aG91Z2g/DQoNCk9yIGRvIEkgaGF2ZSB0byBl
bmZvcmNlIGEgcG9saWN5IG9uIHdyaXRpbmcgaW5zdGVhZCwgZm9yIGV4YW1wbGUgUG9saWN5U2ln
bmVkIHdpdGggYW4gSE1BQyBrZXkgbWF5YmUsIHNvIHRoYXQgb25seSAidHJ1c3RlZCIgY2xpZW50
cyBjYW4gd3JpdGUgdG8gdGhlIFBDUiBhbmQgaW5pdGlhbGl6ZSBpdCwgYW5kIHRodXMgYW55b25l
IHdobyBkZWxldGVzIHdvdWxkbid0IHJlYWxseSBnYWluIG11Y2ggYmVjYXVzZSB0aGV5IGNvdWxk
bid0IGluaXRpYWxpemUgaXQgcHJvcGVybHkgYWZ0ZXIgcmVjcmVhdGluZyBpdD8gSSBtZWFuLCBJ
IGd1ZXNzIHRoYXQgd291bGQgd29yaywgYnV0IGl0J3Mgc29tZXdoYXQgcmVzdHJpY3RpdmUsIG5v
PyBBbmQgd291bGQgbWFrZSB0aGVzZSBudmluZGV4ICJmYWtlIiBQQ1JzIHF1aXRlIGRpZmZlcmVu
dCBmcm9tIHRyYWRpdGlvbmFsIFBDUnMgdGhhdCBhbnlvbmUgY2FuIHdyaXRlIHRvLg0KDQpBbnkg
aGVscC9zdWdnZXN0aW9ucyBhcHByZWNpYXRlZCBvbiB0aGlzIQ0KDQpMZW5uYXJ0DQoNCg==
