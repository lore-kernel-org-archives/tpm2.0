Received: from gmmr-4.centrum.cz (gmmr-4.centrum.cz [46.255.227.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0488203709
	for <tpm2@lists.linux.dev>; Wed,  8 Jan 2025 21:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.227.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736372296; cv=none; b=urhKfRPCyA74dz8TLPdnNiVp4Z8vM7HOUdrsPAEyZtfwBkxFOO2fe3AEW8xUgwO4o3+6R4zG3U1+kbG+SyT6DSrQp4acxd85lbLF0DFt294/Y7Pb5eXlNaKChgpJSgP8D/FYt9tny6fGnw2cmJjQ/wTjfcvxkdTjCQ3YFUGuO8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736372296; c=relaxed/simple;
	bh=ChsmBRnrgsBlX12kqPxjy8p9uKsxFcPGhjZuP72/4j4=;
	h=Date:From:Subject:To:MIME-Version:Message-Id:Content-Type; b=Lh3QOEHzng470I1aUd4JdwSoV8bnXxGxy0cT/bXyu/WTSQkFBJ9f5iMfzqZwUQsku+7tSws4VQCI82B+avN9f/27wxWBC/bGW766bQvo/q26HReCNBvZFnApNrEiHJSDM1STXPCs5/Tn+Wvpe5ijjDdH9qcMO8YzifgNGIEabAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=centrum.cz; spf=pass smtp.mailfrom=centrum.cz; dkim=pass (1024-bit key) header.d=centrum.cz header.i=@centrum.cz header.b=jVCi8nID; arc=none smtp.client-ip=46.255.227.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=centrum.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=centrum.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=centrum.cz header.i=@centrum.cz header.b="jVCi8nID"
Received: from gmmr-4.centrum.cz (localhost [127.0.0.1])
	by gmmr-4.centrum.cz (Postfix) with ESMTP id 11D3470DB
	for <tpm2@lists.linux.dev>; Wed,  8 Jan 2025 22:36:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centrum.cz; s=mail;
	t=1736372196; bh=6moiD8fILkkMvnJPAzgLrPLVIHo+uHV128HzwspEsME=;
	h=Date:From:Subject:To:From;
	b=jVCi8nIDTFoxB39ijQHzEjZ/k/2O6AX2/qm+ArFFKg8ANz+Gu0mJFrk+4g6HgpbyP
	 dTLtviz1unYe4ID2SrxwpQXGmQnwuEfmKsQreEUdifxIcD9MLuRj05IYu05izIV3hv
	 OviEwIDFW/R8yGVUgloK/L1efxGuQJGSbM9snsK4=
Received: from antispam39.centrum.cz (antispam39.cent [10.30.208.39])
	by gmmr-4.centrum.cz (Postfix) with ESMTP id 1065E200B7ED
	for <tpm2@lists.linux.dev>; Wed,  8 Jan 2025 22:36:36 +0100 (CET)
X-CSE-ConnectionGUID: wFHmO8KvSdiutYPUaMDl/w==
X-CSE-MsgGUID: 1r2yOZ88RsqeRq11moVIpw==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2HWEwBe735n/83j/y5agQmFFIFkHVuYdAGQJoh2g1QJB?=
 =?us-ascii?q?gEBAQEBAQEBAQk5CwQBAQMEggyNayg4EwECBAEBAQEDAgMBAQEBAQEBAQENA?=
 =?us-ascii?q?QEGAQEBAQEBBgYBAoEdhTVGDYJbgSyBJgEBAQEBAQEBAQEBAQEBAQEBARcCD?=
 =?us-ascii?q?YE+VIEoJIJxgi8BNBSzW4E0gQGEe9d0BYEgH4FnBoFIhWuCSRoBBW2EeAGFL?=
 =?us-ascii?q?YFVRIEVhkkCgi2DSIIvBIIzSIQHZ54jgU0cA1ksAVUTFwsHBYFzA4EUgVBEN?=
 =?us-ascii?q?4JGaUk3Ag0CNYIefIIrhF5Wg3GEWIVngheCFIMYHUADC209NxQbBptLaj2Ef?=
 =?us-ascii?q?iwvgR5wDS2SfJEmoTo0B4QegV0GDIJehieBJIhejFAESapSAZh8jgSVU4VWA?=
 =?us-ascii?q?wGBeoF/TYNbURkPkhu2Y3k6AgcLAQEDCY9agUsBAQ?=
IronPort-PHdr: A9a23:+Jwu4RMDQQ2eBCdxb+wl6nYyChdPi9zP1u491JMrhvp0f7i5+Ny6Z
 QqDvqwr1QOVFtyHu7ptsKn/jePJYSQ4+5GPsXQPItRndiQuroE7uTJlK+O+TXPBEfjxciYhF
 95DXlI2t1uyMExSBdqsLwaK+i764jEdAAjwOhRoLerpBIHSk9631+ev8JHPfglEnjWwbL1vI
 BmssAncucYbjYR/Jqs+yRbCv2dFdflRyW50Kl2fmArx6N2t95B56SRQvPwh989EUarkeqkzU
 KJVAjc7PW0r/cPnrRbNQxOA6XcFTGgYnQdGDxDK4x/mUJjxtDD6tvdm1ymBIcL2V7E0Vi+84
 KptVRTllT0INz898GHQl8xwkKdWqw+vqhBj34LZZpyeOfxjda3fYNwaX3JMUMhRWSJcHI2yd
 YQAAekdMuhXtIT9u1kDoBWiCQWwGO/j1DlFjWL2060g1OQhFBnL0hY+ENISqnTfsdT7NKAOU
 eCpzKnH1y/DYO5L0jr68IjHbAwhoeuWUbJ/dsrR1VUvFwPfgVWKtIPoJC+a2foLs2iH9epgS
 Oevh3Q7pABwuzWiwNonhYbViIwP0F/E6Tl5z5gvJd2+UEN2YMOoHIdSui+VOYZ7TMwsTmJ2t
 Com1LALuoK3cigJxZg62hLSaviKfoaH7x/nW+ucIzd1in17dL+/mhu/8VSsx+vhXce611ZKq
 zBKktjKtn0V2BzT69SHSvtg/ki6wzqAywfT6uRCLEsplqTbM4Ysz7Exm5YJr0jOHi/7lF/og
 KOIdEgo4Pak5/jnb7n+pZKRN5V4hhz6P6kggMCyD+s1PhITU2WZ/emx0qDo81fjT7VQlPI2l
 7HUsJXdJcsGuKG0GxRV0oM/6xanCDemzcgYkWEHLF1bfBKHiJDkO17LIPD9F/ezmluhnC13y
 P/YOL3hHo/NLmXGkLv7Ybl86lZQyAs1zd9B+5JZEr4MLfPpVkPvtNHVDgU1PxKqz+vlEtlxy
 J8SVGKXDq+cKqzSsFuI5uw1I+mLYY8YoC79JOY55/70l3M5llgdfbW13ZsXcn+4BOlpLl6Fb
 nXyhNcBDX0Kvhc7TODwlFKDUCZfZ2yuUKIk+jE7FIWmAJ/fRoC1hbyNwjy2HplXZmBdFlCMC
 m3kd4GFW/cKdSKTLdVtnSEaWri/U4Mh0wqhuxfgy7V7NurU5jEYtZX72dRo/+HTjw899SJ3A
 cqHy2yNQGR0nmYSRzMv061zu1ByxUmF0ahkmfxYCNlT6+lVXQY7LZLT0u96C9H3Wg/ZZtmHR
 1ipTMu6DzwtSNw928IBY0NnFNW4kh/OxzKkDaYNmbKEHJA06brc33bpKshl0njIzKYvg0E9Q
 stXO22pnq5/+BbXB47Oi0iXj7+ke7wT0n2FyGDWmXaWuRtwVA9rTb6DWXEZe1uQodnnsBDsV
 birXIwqLhEJ5smeNqtDcNGh2U1LWO2lN9PCf2K4gWuYDhuO2qmRaczhaTNOj23mFEEYnlVLr
 j69Pg8kC3L5y18=
IronPort-Data: A9a23:7d6A6qroQbbdnAJ3PwnvmANxVCxeBmJeZBIvgKrLsJaIsI4StFCzt
 garIBmDOqzeY2P0Kt12O97k9h8HsZ6Bz4VhSAQ6pSo8RXxG8ePIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7wdOWn9D8kiPzgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvU0
 T/Ji5OZYQXNNwJcaDpOtvra8EM355wehRtB1rAATaEW1LPhvyZNZH4vDfnZB2f1RIBSAtm7S
 47rpJml/nnU9gsaEdislLD2aCUiGtY+6iDT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWaqYEl51Y/KWyIzxZDEDe812FfUuFLYquhFTu+TLp6HNWyOEL/mDkCjalGDXkwp6KTgmy
 BAWFNwCRg+tp+eRkJGlceVtm9gSFPTiGa8b/W41mFk1Dd5+KXzCa6rP4MUdgHE7i8ZSB+vbI
 cELAdZtREieJUcSZxFNUs14xr/17pX8W2QwRFa9vacr+S7cyxBt0LH3PPLed9qWX9hQ2E2Kz
 o7D1zSnW09Aao3FodaD2iu23P7or3OrYpkLGYehr6dvh2Oy3nNGXXX6UnP++5FVkHWWR8pac
 WQQ+zEytu429Uq2Xp/xUgPQnZKflhEZXsAVT6sx5QeR0LfRpQ2LboQZcgN8hBUdnJdebVQXO
 pWhxbsF2RQHXGWpdE+g
IronPort-HdrOrdr: A9a23:dZl0+qvC+FE+UpEQTfk04fdq7skDYtV00zEX/kB9WHVpm6uj5q
 STdZUgpHrJYVkqNU3I9ertBEDiewK+yXcK2/hyAV7KZmCP0wGVxepZgrcKrQePJ8UpndQ86U
 4aSclDNOE=
X-Talos-CUID: =?us-ascii?q?9a23=3AK3ZcEmgAQbbwd8RmGZ4UTEN/XjJubVP9yVCAAFG?=
 =?us-ascii?q?DBWd0VIytdFa11KcjjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AzBvaOQ3LR7ZvtpaIsKfQy1B5GzUjur70GWc/wcU?=
 =?us-ascii?q?8oNCJDzUpYjKashWvXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,299,1728943200"; 
   d="scan'208";a="86162692"
Received: from gmmr-4.centrum.cz ([46.255.227.205])
  by antispam39.centrum.cz with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 Jan 2025 22:36:35 +0100
Received: from mail1009.cent (envoy-stl.cent [10.32.56.18])
	by gmmr-4.centrum.cz (Postfix) with ESMTP id C5EB28540
	for <tpm2@lists.linux.dev>; Wed,  8 Jan 2025 22:36:35 +0100 (CET)
Received: from 85.193.34.179
	by mail1009.centrum.cz (centrum.cz multimail) with HTTP;
	Wed, 08 Jan 2025 22:36:35 +0100
Date: Wed, 08 Jan 2025 22:36:35 +0100
From: Petr Gotthard <petr.gotthard@centrum.cz>
Subject: [RELEASE CANDIDATE] tpm2-openssl 1.3.0-rc0
To: <tpm2@lists.linux.dev>
X-Priority: 3
X-Original-From: =?utf-8?q?Petr_Gotthard?= <petr.gotthard@centrum.cz>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250108223635.6D4AC965@centrum.cz>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,
 
I would like to announce the release of tpm2-openssl 1.3.0-rc0: https://github.com/tpm2-software/tpm2-openssl/releases/tag/1.3.0-rc0

This is a feature release with few new functions, but most notably it should work in multi-thread and multi-process applications.

Added
- Added support for RSA-OAEP decryption.
- Added 'xof' and 'algid-absent' parameters to digests.
- Added Parent to textual information printed by 'openssl pkey -text'.

Fixed
- Fixed multi-threaded operation, preventing the 'Esys called in bad sequence' errors (thanks to @Danigaralfo, @famez, and @AndreasFuchsTPM).
- Fixed retrieval of OSSL_PKEY_PARAM_MAX_SIZE for RSA keys. The exact value is returned instead of a fixed TPM2_MAX_RSA_KEY_BYTES.
- Fixed handling of absent emptyAuth value in the TSS2 PRIVATE KEY file.
- Set authorization value of newly generated keys. This allows users of the C API to direcly use just generated EVP_PKEY.


Kind Regards,
Petr
