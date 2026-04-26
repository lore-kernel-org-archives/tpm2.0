Received: from gmmr-2.centrum.cz (gmmr-2.centrum.cz [46.255.227.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D955E1FBEB0
	for <tpm2@lists.linux.dev>; Sun, 26 Apr 2026 22:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.227.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777242488; cv=none; b=FibTDgIk4lA0OXl1Dl3V5fNW+lYyOTGKYzfW//+Dp/PS8RPWAMxo6tEmX9hf3PwXKus6EHotLIGi37hRY6hZOhwh0qqRZ7rUz7W51Qc53gZd0xhRheAKalE41ZLRfbocsJDYp3+BNakeOCCPWWqpWI+pHAwcDryr8raaGEdFCqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777242488; c=relaxed/simple;
	bh=NUwKbDRPt5TRMK+hixaZu4mJ9HJAUi+FY/vXcp+GhsE=;
	h=Date:From:Subject:To:References:In-Reply-To:MIME-Version:
	 Message-Id:Content-Type; b=XhhbbGv5DjpMkEz6VHoHSvuBhmUi4GQwn0Ree/DTH+U79ChbzihUKNhLvwDEq1+Ks8P57QtA0ptHkjDyRhdP+ByuX3/MHgWcndM+dQhX7InZ4JiWgE7XnEkaP3i0/rjOdzYLq8R+xgTrbR+u0gdVR/luJUbiV7iW7Dwi/49HOjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=centrum.cz; spf=pass smtp.mailfrom=centrum.cz; dkim=pass (1024-bit key) header.d=centrum.cz header.i=@centrum.cz header.b=dq2hn/h7; arc=none smtp.client-ip=46.255.227.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=centrum.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=centrum.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=centrum.cz header.i=@centrum.cz header.b="dq2hn/h7"
Received: from gmmr-2.centrum.cz (localhost [127.0.0.1])
	by gmmr-2.centrum.cz (Postfix) with ESMTP id BDDF82017A83
	for <tpm2@lists.linux.dev>; Mon, 27 Apr 2026 00:27:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centrum.cz; s=mail;
	t=1777242478; bh=NUwKbDRPt5TRMK+hixaZu4mJ9HJAUi+FY/vXcp+GhsE=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=dq2hn/h7DrbqL+CovJEQY6HAkXWRrxsZq2kC+EHH3Ksmz/EdXW0EXv6daB7RlIHSx
	 o2inW6uE+CCOuaiZNaKi6+v4tnGcqJvZjIiJMrG5Wlj38EG/eRbUj/zRKS5Bgjx/k9
	 88MGnIGivIZkfHE1BTgZ8ycW1laMOV697f9VBo7o=
Received: from antispam61.centrum.cz (antispam61.cent [10.30.208.61])
	by gmmr-2.centrum.cz (Postfix) with ESMTP id BC13F20149B8
	for <tpm2@lists.linux.dev>; Mon, 27 Apr 2026 00:27:58 +0200 (CEST)
X-CSE-ConnectionGUID: vlRiS6JdQnyiEIWkT/K/dQ==
X-CSE-MsgGUID: pNZMYeB/T4CiLpU3az5hzA==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2EtCgAVkO5p/8vj/y5aglmDSIFqHQEBXINdpUOIeYNUC?=
 =?us-ascii?q?QYBAQEBAQEBAQEJPRQEAQEDBDiBU4J0Ao0wKDcGDgECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQsBAQYBAQEBAQEGBgECgR2GCUYNgluBLIEmAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBFwINfgYjZgUgAiYCAlYGExGCcoI5AQM2FLY2gTKBAdx6BUYIVB+Ba?=
 =?us-ascii?q?gaBHy6FcoJKHAEFboUCAYR6NoFVRIEVhkkCgi2DDjqCLwSCIoEOhnWBZYY6g?=
 =?us-ascii?q?UocA1ksAVUTFwsHBYFmA4EGbjIdgSM+FzRYGwcFgUuFLIELhF54IhoDC209N?=
 =?us-ascii?q?xQbBD2LKiAPgguBLysiDZUyGCOTOZ8lNAeEH4FeBgyCXoYqgSaIYYxZBEmqa?=
 =?us-ascii?q?gGZBo4JlWAThUUDAYF6ggBNg1pTGQ+SI8gadgI9BwIHAgsDkXUtBYFLAQE?=
IronPort-PHdr: A9a23:7S3ZkBL1+d6PcSEGftmcuHphWUAX0o4c3iYr45Yqw4hDbr6kt8y7e
 hCEuLM11BSWA9SLo7Ic0qyK6PymATRBqb+681k8M7V0HycfjssXmwFySOWkMmbcaNPMUWkRM
 f8GamVY+WqmO1NeAsf0ag6aiHSz6TkPBke3blItdaz6FYHIksu4yf259YHNbAVUnjq9Zq55I
 AmroQnLucQbj4tvJrwtxhfVrXdFeeVbyGdrKFmOmxrw+tq88IRs/iletP8t7dJMXbn/c68lU
 bFWETMqPnw668HsqRTNVxaE6GEGUmURnBpIAgzF4w//U5zsrCb0tfdz1TeDM8HuQr46QTut4
 751RRHnlSkLLzE2/n3Zhcx2l6JbvQmupwdjzI7OYYGaL+Rxc6XAdt4HX2VBX8JRVytcAoOga
 oYEEuQMMfpEo4T7ulADqwa1CwuxC+P10jJGiH/407Ak3eQvEw7IxgMvEdESv3rbt9j1KL4SX
 O6pwKXU0TnObfVb0ir95ojSdRAhpOmBU6hufsrN00kkCgLLjlKMqYz5PzOazP4NvHWG5OdnT
 eKglXInqxtrrjigwccslpXJhoIPxVDe6Cp025o6KsO+SE5ne96kDZ5QuzuGOIp3W84vRXxjt
 ykmxLMco5G7YDQKx4o9xx7Zc/GLbouF7w/nWeqNITl1gHNodK+wihux8Uaty+LxWtWw3VtXr
 iRLksfBu3QM2hHQ9sWKV+Zw80W/1TiA1Q3f9OBJLEYpnqTVLJ4hx6Q/lpsVsUnbES/2mVn2j
 K+Ldko/4OSn9+PnYrDgq5SBNIF0khnzP6svl8ClH+g1MggDU3KF9eii1rDv51P1TKlEg/Euk
 aTUsIrWKdkfq6O3GQNY3Iku5wywAjqn1tkTgGMJI0hfeB2diojkI1TOIPflAvihm1msizJrx
 +zePr3mH5XNMmDPkLf/crZ57E5R0AUzzdVa55JOE70NPuj/VVPvu9zeEh85KRG0w+P9BNph1
 4ISQWOPAqmHP6POqVKF6eMiL/OSaIIVuDvxMeYp6+DsgHMjh1MRYaek0YMSaH+iH/RmJ0uZY
 WDrgtcECWoKphQxTPDwiFGYXj5TYGqyX7485j4hEoKpEJzOSZyzj7yHwCe7BIBWZmVcBl+QE
 Hbkb5+EVOsUaCKOPs9hlSQJVaS5S48kyx2jrwv6y7t8LurI4S0Ur5bj1Nlz5+3OmhA+7yF7A
 NqD022VSWF7hXsHRyUq06BnvUx91lCD3LBlj/BAD9xc+e1JXAQgO5PEwOx6DtXyWhjYctuXU
 lqpXsupATctTtIr3t8OZlxxFMmjjxzbwiWqAL4Vl7mTCZIs/azT0Wb/KdphxnjAzKUuklwmT
 dFVNWK6nqNx7xHdCZbGnUmBjKaqbaoc0TbV+mma1WSAs1lUUBVoUaXLRX8fZlXZrdD+5k7aV
 7GgEKwpPAQSgfKFf/9WctizpVFHX+v4ftDfZX+h3Wu9G0Db6KmLad/SdnkHlAraFFQEmhoft
 SKeOBQkQCimv37eBSZiPVniZV/27Ow4o2HtHRx89B2Dc0A0j+n9wRUSn/HJE5su
IronPort-Data: A9a23:pZ7OOKK91IeCD1CQFE+RkJQlxSXFcZb7ZxGr2PjKsXjdYENShWEAz
 TdJDTuGOf6JZjGkLY9+Oou190MOu8PVmtBmT1Qd+CA2RRqmiyZk6fd1jKvUF3nPRiEWZBs/t
 63yUvGZcoZsCCWa/073WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2+aEuvDnRVnW0
 T/Oi5eHYgH9h2Qqajt8B5+r8XuDgtyj5Vv0gXRhPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/t4sol
 IgS78zYpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklQ8
 cYZE24vYimFluOb4Y24dq5PwcgaeZyD0IM34hmMzBnWCPM8BMqFSKjM+cVF2XE7lKiiH96CO
 YxDNGcpNk6fJUcXYT/7C7pn9AusrmHybycep1WJuao++WT7xwF3zKLwNZzeaLRmQO0MxBvA+
 z2ZozqR7hcyLPqt7AuI2DWQ2sTOuTvGA4sASb2q36s/6LGU7ilJYPEMbnOnufzjokq/QM5Eb
 UgV/Dc+66Q/6iSWosLVUBi9ujve+BURXcZKDuh84xPlJrfo3jt1z1MsFlZpAOHKfudvLdD2/
 jdlR+/UOAE=
IronPort-HdrOrdr: A9a23:aBAYHqq/fJC23Aht1QBeUR0aV5oreYIsimQD101hICG9Ffbo8f
 xG/c5rsiMc5wx9ZJhNo7y90ey7IU80lqQFhLX5Q43SODUO0VHAROoJ0WKh+Vzd8kbFmdK1u5
 0PT0CpY+eAb2SS9vyKgzWFLw==
X-Talos-CUID: 9a23:vBTGvGxB2J0/WBn8cDCyBgUKHvokSSP/wE7WMk6VKFlqdPq2DlOprfY=
X-Talos-MUID: 9a23:ieCbmwaBXQgOXOBTrxneoQBvHoBUv4+vLFgwypwU5smWHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,200,1770591600"; 
   d="scan'208";a="125057746"
Received: from gmmr-2.centrum.cz ([46.255.227.203])
  by antispam61.centrum.cz with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Apr 2026 00:27:58 +0200
Received: from mail1003.cent (envoy-stl.cent [10.32.56.18])
	by gmmr-2.centrum.cz (Postfix) with ESMTP id 78D7C300B4C0
	for <tpm2@lists.linux.dev>; Mon, 27 Apr 2026 00:27:58 +0200 (CEST)
Received: from 85.193.34.46
	by mail1003.centrum.cz (centrum.cz multimail) with HTTP;
	Mon, 27 Apr 2026 00:27:58 +0200
Date: Mon, 27 Apr 2026 00:27:58 +0200
From: Petr Gotthard <petr.gotthard@centrum.cz>
Subject: [RELEASE CANDIDATE] tpm2-openssl 1.3.1-rc1
To: <tpm2@lists.linux.dev>
References: <20250108223635.6D4AC965@centrum.cz> <20260419155640.BD3BD5A6@centrum.cz>
In-Reply-To: <20260419155640.BD3BD5A6@centrum.cz>
X-Priority: 3
X-Original-From: =?utf-8?q?Petr_Gotthard?= <petr.gotthard@centrum.cz>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260427002758.28B63070@centrum.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

we had to release tpm2-openssl 1.3.1-rc1: https://github.com/tpm2-software/=
tpm2-openssl/releases/tag/1.3.1-rc1

This includes two new fixes:
- Fixed parent handle issues with signed representation in the TSS2 PRIVATE=
 KEY files (thanks to @thomkopp).
- Fixed memory and handle leaks (thanks to @hyperfinitism).


Kind Regards,
Petr
______________________________________________________________
> Od: "Petr Gotthard" <petr.gotthard@centrum.cz>
> Komu: tpm2@lists.linux.dev
> Datum: 19.04.2026 15:56
> P=C5=99edm=C4=9Bt: [RELEASE CANDIDATE] tpm2-openssl 1.3.1-rc0
>
>Hello,
>
>I would like to announce the release of tpm2-openssl 1.3.1-rc0: https://gi=
thub.com/tpm2-software/tpm2-openssl/releases/tag/1.3.1-rc0
>
>This is a bugfix release:
> - Fixed compatibility with OpenSSL 4.0.
> - Fixed the ECDSA signature algorithm to omit the parameters field (thank=
s to @smhmeier).
> - Fixed cipher padding validation according to PKCS#5/PKCS#7, so zero pad=
ding is now rejected (thanks to @hyperfinitism).
> - Fixed buffer indexing for block ciphers without padding (thanks to @hyp=
erfinitism).
> - Fixed cleansing of sensitive data upon buffer deallocation and fixed bu=
ffer allocator consistency (thanks to @hyperfinitism).
> - Fixed missing NULL checks and harmless type cast errors in RSA and ECDS=
A algorithms (thanks to @hyperfinitism).
> - Fixed semaphore destruction (thanks to @Deadolus).
>
>
>Kind Regards,
>Petr
>
>
