Received: from gmmr-3.centrum.cz (gmmr-3.centrum.cz [46.255.225.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76BF3C6AC
	for <tpm2@lists.linux.dev>; Sat, 29 Jun 2024 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.225.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719655589; cv=none; b=qreIygm5JSLobl1Ch1DN2M+ihjWmcFoH5VjMoOYpvXOoiJRGokHB8zqHXIV6tjwTKYkiM1bdwo+l6olWlg6C7sCyVSJ4TKTjPqfMaXmGsSNbZ2B9bu+mMRzIauWjgB/JZ/0A+/FG8jKBeqVwqdcgwibf3Ef9PiVvxkSI3rKu7fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719655589; c=relaxed/simple;
	bh=84tcjs6uea4iPyvsPwv0X/oQDMA1uBTwuu09To8Qn0Y=;
	h=Date:From:Subject:To:MIME-Version:Message-Id:Content-Type; b=pgSeNiP/dTzqjpATVF7gkouUQW0Ql4bF5MP8RmnWq1FAoFdjfkmMTK/85YtXdbXKCDCkQQS3rvzngju6Z01EcqrZVoU7E3sQiu7M4ol9cKKc2JdmiGCCyoI/nfv9zayFDYgieROQ3kSJmByTjs72WMwMqAuvOHoK1F/mIVvq3Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=centrum.cz; spf=pass smtp.mailfrom=centrum.cz; dkim=pass (1024-bit key) header.d=centrum.cz header.i=@centrum.cz header.b=ZXBlHmeC; arc=none smtp.client-ip=46.255.225.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=centrum.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=centrum.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=centrum.cz header.i=@centrum.cz header.b="ZXBlHmeC"
Received: from gmmr-3.centrum.cz (localhost [127.0.0.1])
	by gmmr-3.centrum.cz (Postfix) with ESMTP id 93787200DCB5
	for <tpm2@lists.linux.dev>; Sat, 29 Jun 2024 12:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centrum.cz; s=mail;
	t=1719655465; bh=84tcjs6uea4iPyvsPwv0X/oQDMA1uBTwuu09To8Qn0Y=;
	h=Date:From:Subject:To:From;
	b=ZXBlHmeCcbuMqQdX8plIHxp8O74k2cqzhxF9klTvQwRv0kyZ8QQ5wLQFZs9ZGA1WZ
	 48zKNQ4Gj4pG8ZzCuJQMGXzfddKvVHD3+C5EXYzsJ9k0gLHVuDAS+luGWPjxxZE2Dn
	 I7hwH3xofboBXldrnViYWLAbGJGUvUU42VzDR2Q0=
Received: from antispam64.centrum.cz (antispam64.cent [10.30.208.64])
	by gmmr-3.centrum.cz (Postfix) with ESMTP id 921BD2008410
	for <tpm2@lists.linux.dev>; Sat, 29 Jun 2024 12:04:25 +0200 (CEST)
X-CSE-ConnectionGUID: aY06HaOARmeyXBD2tjv5Tg==
X-CSE-MsgGUID: 8CzWjvfETQG/7YwMX/vBMg==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2HNcgC02n9m/8vh/y5aHAEBATwBAQQEAQECAQEHAQEVg?=
 =?us-ascii?q?U8Cgz6BZB2WI4MoAZAfiHKBVoF+CQYBAQEBAQEBAQEJFAEBJQkEAQEDBI4PK?=
 =?us-ascii?q?DQJDgECBAEBAQEDAgMBAQEBAQEBAQEFAQEGAQEBAQEBBgYBAoEZhS9FDYJgg?=
 =?us-ascii?q?SqBJgEBAQEBAQEBAQEBAR0CDYE+VIEoJIJwgi8BNBQGrWKBNIEBg2xBTddzB?=
 =?us-ascii?q?YEgH4FmBoFIAYgWGgEFZ4oGgVVEhA6DUAOCLINIgi8EiAYBjFqEdYQwVw+CZ?=
 =?us-ascii?q?YQTJguNQIFRHANZIQESAVUTFws+HQIWAxsUBDAPCQsmKQY5AhIMBgYGWTQJB?=
 =?us-ascii?q?CMDCAQDQgMgcREDBBoECwd3gyUEE0QDgTeJbIM5ghuEG0uEcIFrDGGCeYZ9g?=
 =?us-ascii?q?T6BYoNMSoUsHUADC209NRQbBqp0g3obRlcCIoE8L5NAkRehJDQHhBYFgVcGD?=
 =?us-ascii?q?IJdnGYESao5mGeODJUshVMDAYFjghZNg1pSGQ+XL8N6dgI5AgcLAQEDCYkig?=
 =?us-ascii?q?UoBAQ?=
IronPort-PHdr: A9a23:fZWo3RKY0X7XxEiD+dmcuFxhWUAX0o4c3iYr45Yqw4hDbr6kt8y7e
 hCEvbM13RSTBM2bs6sC17CH9fi4GCQp2tWojjMrSNR0TRgLiMEbzUQLIfWuLgnWCsCvRAEBW
 Pp4aVl+4nugOlJUEsutL3fbo3m18CJAUk6nbVk9Kev6AJPdgNqq3O6u5ZLTfx9IhD2gar9uM
 Rm6twrcu8cKjYd4Nqo8zhTFrmVVd+9LwW9kOU+fkwzz68uu+JNv6Thct+4k+8VdTaj0YqM0Q
 KBXAzghL207/tDguwPZTQuI6HscU2EWnQRNDgPY8hz0XYr/vzXjuOZl1yeUJcL5QakqVDqt8
 qlnUBDnhjsJOD4/62HXl9d/jLlHrxK7phxw2JDbbYeIP/djZKzdfNcaRW1cXsZNUiFKH42xY
 5cTA+cHIO1VqZT2qVkTohukHQSiCuPhxCJWiHHs0qI00PguHw7d0Qw8Hd8DvmjYoMnpOKsMV
 +2+0anGzS/Eb/NTwTrz8pbHcgw7ofqRXLxwdtbRyVUvFwzflFWftJHuMjSN1usTr2ib9fBsV
 e2oi247twFxoiKgxt0xhYTSmo0a1FbE9TljwIYoIN20UlJ0YN+9HZZWqiqVOJd4TNk4TGF0p
 CY11KcGuZijcSUX1pkr2QLTZv+GfoWW5h/uVfidLDVmiH9hd7+ymRm8/0ekx+DzVcS4zlhHo
 yRFn9XSqH0A1wHe5tSJR/dg4Eus3yuE2Q7U6uFBO080lKzbJoYmwr4oiJUTt1/DHjTymEnsi
 6+WbEok9+614OrkerXrvpCROo5uhg3gMqkjmtazDfomPgUORWSX5/iw2bP78UD6QLhGlOA6n
 63XvZzAK8kWqbS1DxJJ3ost7Ru0Ei2o384CnXYdKVJIYBeHj4/0NF7QOP34FvK/g0i0kDds2
 vDGIqXtApXTIXjHl7fsZbl960tZyAop1NxT+ohYBa0fL/L1Rk/xrsHYDhojPwOowufrENR91
 oUAVmKTGqKUP6LfvUWW6u8vI+SAfpEZtCj9JvQ/+fLikXE0lUcYfaaz3JsXbH64Hu5hI0Wce
 XfsmskOEXsQvgYkQ+zqj0GCUSJTZ3moRaIz+yo2B564AofFWoCtmqGB3CKhEpJKZ2FKEkqMH
 mvwd4WYR/cMbzqfItN5kjwBS7SsUIsh1RC1tA/m0LprNO7U+iwetZL+29l5/fDcmg8s9TBsC
 cSSyHmCT3tokWMQWz82wKd/rFRgxluby6h3neJYG99J6f5RXQc6MJvcz/ZjB9zvQA7OYsmGS
 FC6QtW8HDExS8g9zMMPYkplBtqijRHD3y+yDrENmLKECoI6/L7A0nb3P8py1nPG27M7j1Y6W
 sZBLXSoiLZw+QTLHI7Ji0uZmr6ye6oFxCDD+zTL8W3b6F1AVVRYVaTeQWtZYkrQsMS/6k7cG
 eyAE7MiZzNM1dTKBaxWdt3gl1kOEO/uJM6YbGWth2e5Hxqgzb6KcJD3fiMWznOOWwA/jwkP8
 CPeZkAFDSC7rjeGZAE=
IronPort-Data: A9a23:Hsm826rDE9FYYuEqJPjxVS1PYBJeBmJeZBIvgKrLsJaIsI4StFCzt
 garIBmCOv/bZmHweNgiOYuy8k8G7JbQx9ViHAs/rS1kFS8ao+PIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7wdOWn9D8kiPzgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvU0
 T/Ji5OZYA7NNwJcaDpOt/rd8kI35ZwehRtB1rAATaEW1LPhvyZNZH4vDfnZB2f1RIBSAtm7S
 47rpJml/nnU9gsaEdislLD2aCUiGtY+6iDT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWaqYEl51Y/KWyIzxZDEDe812FfUuFLYquhFTu+TLp6HNWyOEL/mDkCjalGDXkwp6KTgmy
 BAWFNwCRhmy37yWyZWScOxhl/QJAJP3Pp1Chn41mFk1Dd5+KXzCa6rP4MUdhXE7i8ZSB+vbI
 cELAdZtREieJUcSZxFNUs94xr/z7pX8W2QwRFa9vacr+S7cyxBt0LH3PPLed9qWX9hQ2E2Kz
 o7D1zqkUk5Gb4fGodaD2iKHlNDNgy3WZLs9U+KJ6dtax0O542NGXXX6UnP++5FVkHWWR8pac
 WQQ+zEytu429Uq2Xp/xUgPQnZKflhEZXsAVSqsx5QeR0LfRpQ2LboQZcgN8hBUdnJdebVQXO
 pWhxrsF2RQHXGWpdE+g
IronPort-HdrOrdr: A9a23:lHNsCKB0gYNNLUzlHem455DYdb4zR+YMi2TDsHoBLSC9E/bo8v
 xG88536faZslossRIb6LO90de7MBHhHPdOiOF7V4tKNzOIhILHFu9fBV2I+V3d8lbFl9Jg6Q
 ==
X-Talos-CUID: 9a23:wufoNm9ivX2+Zmfx2byVv0clQp4Fe1r09nLdMn+SJTx1SqPIdVDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A8qpcOQ5WibvKFhzIokaonQ3kxow4yLaRCl4DvKk?=
 =?us-ascii?q?/lI7bBDNVC3CDphG4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.09,170,1716242400"; 
   d="scan'208";a="65874331"
Received: from gmmr-1.centrum.cz ([46.255.225.203])
  by antispam64.centrum.cz with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2024 12:04:25 +0200
Received: from mail1002.cent (envoy-stl.cent [10.32.56.18])
	by gmmr-1.centrum.cz (Postfix) with ESMTP id 1059EEB
	for <tpm2@lists.linux.dev>; Sat, 29 Jun 2024 12:04:25 +0200 (CEST)
Received: from 85.193.34.103
	by mail1002.centrum.cz (centrum.cz multimail) with HTTP;
	Sat, 29 Jun 2024 12:04:25 +0200
Date: Sat, 29 Jun 2024 12:04:25 +0200
From: Petr Gotthard <petr.gotthard@centrum.cz>
Subject: Can the RSA PSS salt length be changed?
To: <tpm2@lists.linux.dev>
X-Priority: 3
X-Original-From: =?utf-8?q?Petr_Gotthard?= <petr.gotthard@centrum.cz>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20240629120425.ED02BDD6@centrum.cz>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,
I have a question concerning the TCG specification.

OpenSSL has a function EVP_PKEY_CTX_set_rsa_pss_saltlen() that be used to set the RSA PSS salt length. Some implementations don't use the maximum possible salt length, but use a shorter value, e.g. set the salt length to the digest length (RSA_PSS_SALTLEN_DIGEST).
https://www.openssl.org/docs/manmaster/man3/EVP_PKEY_CTX_set_rsa_pss_saltlen.html

The TCG specification (Part 1, Section B.7) on the other hand says: For both restricted and unrestricted signing keys, the random salt length will be the largest size allowed by the key size and message digest size.

Does this mean that a TPM2.0 cannot handle shorter RSA PSS salt lengths, i.e. that the EVP_PKEY_CTX_set_rsa_pss_saltlen() function can never be implemented using any TPM? This might cause compatibility issues.


Regards,
Petr
