Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B255A14884E
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 14:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715868868; cv=none; b=jSlHWsmsibp1pZr72/pWnJS085Wqyk25uzy6ULxuT7+4EMs34FFX72YVBgZgiMNhuUUUCJ0O5QHVIQGde9BQ64YoEKId78KXQMLgNkM+J55DMpJxlcr1YNDsfBeUPqAFFzWwHGcyNKvQKbvs+EgNlltd4rmnFsiKIMzUYQUoWrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715868868; c=relaxed/simple;
	bh=XXBAfbV3Y+yHzv50PCTHoxAlZzjq/zCOFrm39xbKMc0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vj0qpMTRaZ7Z50tXGZMDrXi7OIQfQs/9dKtBhXp1cu+SpCW+y35TJFuM/RKfz+/vIXfCq+PVa8CR4uWBb0JtVFrBF0VB5ybU4v9ewr5yHkEDZ+/H7tBaswODbweUrvaLlkHXoUHGlxALRLqnVE1YJjQjkjPKBxJsFMbGKYHff6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=fc1gpU0i; arc=none smtp.client-ip=217.10.52.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="fc1gpU0i"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1715868867; x=1747404867;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XXBAfbV3Y+yHzv50PCTHoxAlZzjq/zCOFrm39xbKMc0=;
  b=fc1gpU0iEcdxHU07etxWNVigZKgPF4qNrNoK55ZiHcV5QFFTU5aD0N4I
   wU3dvUegurrr4o6Km6m5lsFDuNwJj85Bazv1ZNeNFIPZ1pdVjRifS3EaH
   6crsP5x3gJ716FOjAMtEYNEvJ4gTkuxzcV1Umeb7mWYemolvYELy3MP4U
   c=;
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="57663371"
X-IronPort-AV: E=Sophos;i="6.08,164,1712613600"; 
   d="scan'208";a="57663371"
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 16:14:19 +0200
Received: from MUCSE842.infineon.com (172.23.7.71) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 16 May
 2024 16:14:18 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE842.infineon.com
 (172.23.7.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 16 May
 2024 16:14:18 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.1118.040; Thu, 16 May 2024 16:14:18 +0200
From: <Andreas.Fuchs@infineon.com>
To: <prestwoj@gmail.com>, <jarkko@kernel.org>, <tpm2@lists.linux.dev>
Subject: RE: TPM2_Sign vs TPM2_RSA_Decrypt
Thread-Topic: TPM2_Sign vs TPM2_RSA_Decrypt
Thread-Index: AQHap3th3qoarclTFECdi7T8P40SwrGZwa1Q///tdICAACH0YP//6TgAgAADrgCAAALrgIAAAQSAgAAi8DA=
Date: Thu, 16 May 2024 14:14:18 +0000
Message-ID: <4fdcc042a8f74b0e8e5d54a67a1c87e0@infineon.com>
References: <D1AZVM0QQF2M.1SZHF66G10XK8@kernel.org>
 <c8c85a062358420ab13e849a902606cd@infineon.com>
 <D1B2ZP29BA7Y.3OYCZMEP3MLGY@kernel.org>
 <e6ac8dc493f04fdca0469f7df7735468@infineon.com>
 <D1B3UAYNEUQE.3PHLGENN3AYKM@kernel.org>
 <56e9bb39-c253-4ce3-b3bb-1c3480a22fa5@gmail.com>
 <D1B4CE777IGH.MQ5BRAN4Q69X@kernel.org>
 <1107614a-a99d-4997-84f6-e18cc30f5a9a@gmail.com>
In-Reply-To: <1107614a-a99d-4997-84f6-e18cc30f5a9a@gmail.com>
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

VFBNMl9FbmNyeXB0RGVjcnlwdDIgaXMgZm9yIFN5bW1ldHJpYyBlbmNyeXB0aW9uIChpLmUuIEFF
Uykgb25seS4NCg0KSSdkIHN0aWxsIHJlY29tbWVuZCB0byBnbyBmb3IgVFBNMl9TaWduKCkuDQpO
b3RlIGFsc28gdGhhdCBzd2l0Y2hpbmcgbWF5IGJlIGhhcmQgbGF0ZXIgZG93biB0aGUgcm9hZCwg
c2luY2UgdGhlIGtleSB1c2FnZSBmbGFncyBhcmUgZGVmaW5lIGR1cmluZyBjcmVhdGlvbi4NClNv
IGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IGlzIG5hc3R5IGhlcmUuDQoNCkZlZWwgZnJlZSB0byBD
QyBtZS4NCkknbGwgZG8gd2hhdCBJIGNhbi4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IEphbWVzIFByZXN0d29vZCA8cHJlc3R3b2pAZ21haWwuY29tPiANClNlbnQ6IERvbm5l
cnN0YWcsIDE2LiBNYWkgMjAyNCAxNTo1OQ0KVG86IEphcmtrbyBTYWtraW5lbiA8amFya2tvQGtl
cm5lbC5vcmc+OyBGdWNocyBBbmRyZWFzIChTTUQgQzMgRU1FQSBUTSkgPEFuZHJlYXMuRnVjaHNA
aW5maW5lb24uY29tPjsgdHBtMkBsaXN0cy5saW51eC5kZXYNClN1YmplY3Q6IFJlOiBUUE0yX1Np
Z24gdnMgVFBNMl9SU0FfRGVjcnlwdA0KDQpDYXV0aW9uOiBUaGlzIGUtbWFpbCBvcmlnaW5hdGVk
IG91dHNpZGUgSW5maW5lb24gVGVjaG5vbG9naWVzLiBEbyBub3QgY2xpY2sgb24gbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHZhbGlkYXRlIGl0IGlzIHNhZmU8aHR0cHM6Ly9p
bnRyYW5ldC1jb250ZW50LmluZmluZW9uLmNvbS9leHBsb3JlL2Fib3V0aW5maW5lb24vcnVsZXMv
aW5mb3JtYXRpb25zZWN1cml0eS91Zy9Tb2NpYWxFbmdpbmVlcmluZy9QYWdlcy9Tb2NpYWxFbmdp
bmVlcmluZ0VsZW1lbnRzX2VuLmFzcHg+Lg0KDQoNCg0KT24gNS8xNi8yNCA2OjU1IEFNLCBKYXJr
a28gU2Fra2luZW4gd3JvdGU6DQo+IE9uIFRodSBNYXkgMTYsIDIwMjQgYXQgNDo0NCBQTSBFRVNU
LCBKYW1lcyBQcmVzdHdvb2Qgd3JvdGU6DQo+PiBUbyBiZSBob25lc3QgSSBzdGFydGVkIHdpdGgg
ZW5jcnlwdC9kZWNyeXB0IGFuZCBpbmNsdWRlZCB0aGUgc2lnbmluZyANCj4+IG9wZXJhdGlvbiBi
ZWNhdXNlIGl0IHdhcyBiYXNpY2FsbHkgImZyZWUiIGJ5IHVzaW5nIA0KPj4gdHBtMl9yc2FfZGVj
cnlwdCgpLiBJIHdhcyBub3QgYXdhcmUgb2YgdGhpcyBkaXN0aW5jdGlvbi9kaWZmZXJlbmNlIA0K
Pj4gYmV0d2VlbiB0aGF0IGFuZCBkb2luZyBzaWduaW5nIG9uIHRoZSBUUE0gaXRzZWxmLiBJIGRv
bid0IHRoaW5rIEkgDQo+PiBldmVyIGxvb2tlZCBpbnRvIHRoZSBzaWduaW5nIGNvbW1hbmQgb24g
dGhlIFRQTSBpdHNlbGYuDQo+IE15IHBlcnNvbmFsIHRha2U6IEknZCBzdGFydCBSU0Egd2l0aCB0
aGUgd29ya2luZyBjb2RlIGFuZCBqdXN0IGNsZWFuIA0KPiB1cCB0aGUgcGFydHMgZm9yIHRoZSBm
aXJzdCByb3VuZC4gSXQgaXMgdGVzdGVkIGNvZGUgYW5kIGRvZXMgdGhlIGpvYiwgDQo+IHJpZ2h0
PyA6LSkNCkl0IHdhcyB0ZXN0ZWQgdGhlbiB5ZXMsIG9idmlvdXNseSBuZWVkIHRvIHZlcmlmeSB0
aGF0IGFmdGVyIDQgeWVhcnMgOikNCj4NCj4gVGhlbiB3ZSB3aWxsIHdlaWdodCB0aGUgb2RkcyBh
bmQgY29ucyBpbiB0aGUgcmV2aWV3LiBUaGF0IHNhaWQsIGlmIHlvdSANCj4gd2FudCB0byB1c2Ug
VFBNX1NpZ24gYW5kIFRQTTJfRW5jcnlwdERlY3J5cHQoMikgdGhhdCBpcyBmaW5lIHRvbywgYnV0
IA0KPiBub3QgZGVtYW5kLg0KPg0KPiBBcyBmb3IgRUNEU0EsIGl0IGNhbiBiZSBwYXJ0IG9mIHRo
ZSBwYXRjaCBzZXQsIG9yIHdlIGNhbiBzdGFydCBqdXN0IA0KPiB3aXRoIHRoZSBSU0EgcGFydC4N
Cj4gQW5kcmVhcywgaXMgaXQgT0sgaWYgdGhlIHBhdGNoIHNldCBpcyBDQydkIHRvIHlvdSBzbyB5
b3UgY2FuIGdpdmUgeW91ciANCj4gZmVlZGJhY2svcmVtYXJrcyBvbiBpdD8NCj4NCj4gQlIsIEph
cmtrbw0K
