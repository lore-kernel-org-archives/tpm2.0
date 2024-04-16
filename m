Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDD6128805
	for <tpm2@lists.linux.dev>; Tue, 16 Apr 2024 14:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713277435; cv=none; b=oBIkOdXpPl3o1oW5OEKWzINmI0FTW3IWa8qbxe5QuppTYOW+m3imzIrDPiIvsPiLJ7FNV760Xd3kRrPli4vQBeC6WWE/ff8PFGN03V1hdaC40t25DBTaau2qmOfy7d7ZXWVnKRVdkjPpb/SZmqnB6bHgHkl7+emgAlJkvFdKXys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713277435; c=relaxed/simple;
	bh=52luAuxXcAM4l/x+8DWa52HyC62prDnMMQk0zDEOHN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=W07LpIaeXRVwKZsqzPmbfeK6HrCtnrzqhGvQM7ls6BXYz4LqzkCmExLmDigYUK7gfEfjPV5gmcny/JbeCNlVgHfiTTqDMmqIr62Szsvenc+rVd34eXvfo9Q/64zI/QgRU/+QA/bQ4jfGCwIaXIUEiCp5o5A4TcAcsBI2XeoslRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=juergen_repp@web.de header.b=VB99q86t; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=juergen_repp@web.de header.b="VB99q86t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713277430; x=1713882230; i=juergen_repp@web.de;
	bh=ZcTmoJiozITJo7ZIlMK/OOEK2qSt/TwNKjzDVUuqnPg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VB99q86tChI8NIszS/9XHcBJuM6PY0pnveeA0wmBCFiVRW/Q+Iiy2nj2thL3KraC
	 pBMeWoPmVabmShIs0ugSAvRPnDtfCuoU/qAzh4S5UjNTt64eNEm1f+uf2cUlr4Cm4
	 hfRwTuTzxsCmDUHtE7N6tgRPXG87hr5zY4gKp1OgEicyiZJ/S6EEyZ+g8VxzJsFBP
	 VZW469tNU2RVut9o+rINKpGdTsRuXq1JZz3wwviF4aT+QeIHdlYxIk3F9xbjA9Yfa
	 NziSa+WALkv9bjIEaUEMEENrzENEK+gm7SSZbpNG62n4Y2OFYD84Z4frLW8AEA4Mc
	 a9Ht17q3QBlzxQ2PCw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.33] ([37.201.240.108]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N14pE-1stXbQ1KyQ-012WGs; Tue, 16
 Apr 2024 16:23:50 +0200
Message-ID: <4fa1f7ed-cbe7-4fbe-84d9-d73b7a91fd7a@web.de>
Date: Tue, 16 Apr 2024 16:23:49 +0200
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Using TPM2_LoadExternal() for loading an HMAC key into the TPM?
To: Lennart Poettering <mzgcz2gff@0pointer.net>, tpm2@lists.linux.dev
References: <Zh53rw5o97SVXZWT@gardel-login>
Content-Language: de-DE, en-US
From: Juergen Repp <juergen_repp@web.de>
In-Reply-To: <Zh53rw5o97SVXZWT@gardel-login>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FLpZNW/DiNxThSjKv+hXi4Bkmo1dFhfHAjol43tbCZVZUsJAUqe
 omOldTye/9zVmEKSkE8BhIkos+5zvrDO0ZmYkdFhHSo82LrzYQ3GLTT01sjHgQPXFgYAIed
 dH0qDiO8IMC9NCY0gLXJ65lT5Uhe8NDS5yKOZPHGEzTSU88y4weDeFHrlNM1tr5rGNxH3mL
 KB3s59CJziM4R0NqPJqzw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dVnFHw+I//Q=;iXnJA52UqcSvDTb1kgQf40AZLjI
 p6cO4xAPZIsyGxKDJJ1XAtzSKqreFuPT6NeohhiYfOC85hAcr3kQHrlmEuiHFaJfXyxy2UXNA
 +N1OLaQVt7G9Oo9KIS1RLjKWfcfBBlrIWr4qsilQ1PszK5I3BCy7UFvkLa5fjkc8PMyG3wv+M
 rs6CPH7HAIz2BaN0HHu/bywfB/KsEf82Nq9DUZT+I3HZFNEbl8DiEfTFMaTM6SEdO5KHEdtp4
 QDlBaHu8CaYUoqBlsNuKWhJWsWC9f3fgRvO4ifPuDWWCb71A3Jx9gt2FB8qaUFqueUuFBJnnx
 eiGOZhPGmraF+Ls1j4rUJuh8ykVDOkOOz0IgdHKXx6l3ZCykAVqbLgv+gHB0mFfxSlsYyBt4S
 8TT6hUjmCCqBFLkYjCA0+WVKEpg2d/jEImEi1byx8Lj9+UzENGfctNRbSP7E+pvOzN70WyFlM
 HwZyxYACiUUDt/ZMDC9/OTV2yFaKke/fUE0SRNPsWxxtnZojdGn7R4WNeK6ldEBuTcQSrfuPA
 cdqohh/mCi5y+Wq9wYJYKuk4/KgxNmF8tmN2Kx6cy3S+CdAlGo2cF1DeK+E5eXoNnppZomokK
 LJ8HMsOlGvWABf88QjIIC+1WfE9iQKjo/JXbGJojMu2H1wMi+toNkXgGASAjBMZ1JcKiZHsGb
 8vDD5yb8q9CTYz/qeVPYQp5qLc1dKkHq75gH2JtMcjTEUUDQEy0y3LrTx27o9TZVvJBC0ed1y
 Nu/+8ngFM9ijM4Deq/CsZj6AfDibdmzxdWbSJCJR9Xfz9T+zHd9tdTyrNCO0U/i4b7R9Ifc6q
 gcd9jtGT3zeGH8q3aX0rCq/pFanqROATMHWxDZz66FZmE=

Hello,

the error is caused by:
  .parameters.keyedHashDetail.scheme.scheme =3D TPM2_ALG_SHA256,

TPM2_ALG_HMAC, TPM2_ALG_XOR, and TPM2_ALG_NULL are possible selectors for =
TPMU_SCHEME_KEYEDHASH.

The hash alg has to be set with:
.parameters.keyedHashDetail.scheme.details.hmac.hashAlg =3D TPM2_ALG_SHA25=
6,

Unfortunately the error message for this error is only displayed if log le=
vel debug is activated.

Juergen

Am 16.04.24 um 15:05 schrieb Lennart Poettering:
> Hi!
>
> I was wondering, if anyone has an idea how precisely to set up a pair
> of TPM2B_PUBLIC and TPM2_SENSITIVE structures for loading an
> HMAC-SHA256 key into the TPM via TPM_LoadExternal()?
>
> I am currently setting things up more or less like this:
>
>          TPM2B_PUBLIC auth_hmac_public =3D {
>                  .size =3D sizeof(TPMT_PUBLIC),
>                  .publicArea =3D {
>                          .type =3D TPM2_ALG_KEYEDHASH,
>                          .nameAlg =3D TPM2_ALG_SHA256,
>                          .objectAttributes =3D TPMA_OBJECT_DECRYPT | TPM=
A_OBJECT_SIGN_ENCRYPT /* | TPMA_OBJECT_USERWITHAUTH */,
>                          .parameters.keyedHashDetail.scheme.scheme =3D T=
PM2_ALG_SHA256,
>                          .unique.keyedHash.size =3D buffer.size,
>                  },
>          };
>
>          TPM2B_SENSITIVE auth_hmac_private =3D {
>                  .size =3D sizeof(TPMT_SENSITIVE),
>                  .sensitiveArea =3D {
>                          .sensitiveType =3D TPM2_ALG_KEYEDHASH,
>                          .sensitive.sym.size =3D buffer.size,
>                  },
>          };
>
>          memcpy(auth_hmac_private.sensitiveArea.sensitive.sym.buffer, bu=
ffer.buffer, buffer.size);
>
> And then use TPM2_LoadExternal() with this, for the NULL hierarchy.
>
> tpm2-tss responds with these errors:
>
>           ERROR:esys:src/tss2-esys/api/Esys_LoadExternal.c:184:Esys_Load=
External_Async() SAPI Prepare returned error. ErrorCode (0x0009000b)
>           ERROR:esys:src/tss2-esys/api/Esys_LoadExternal.c:85:Esys_LoadE=
xternal() Error in async function ErrorCode (0x0009000b)
>
> But, uh, what am I supposed to make of this?
>
> I figure it's not even the TPM that refuses this, but it's tpm2-tss
> already?
>
> Anyone has an idea?
>
> (Background: I am trying to protect an nvindex that I want to use with
> TPM2_AuthorizeNV, with an TPM2_PolicySigned access policy. I want to
> use an HMAC key for the signature scheme. If you want to know even
> more, see =E2=86=92 https://github.com/systemd/systemd/pull/31790. The a=
bove
> is more or less a copy of the topmost commit of that)
>
> Any help appreciated!
>
> Lennart
>

