Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB978460
	for <tpm2@lists.linux.dev>; Sat, 13 Sep 2025 19:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757791647; cv=none; b=sEnYh4htb5zxBx0zZP6e/dtVvsUry4wjJIzHX+jK1kT/ThZELn2gh4tEiuhZm8efQWhvBj00b1zq32WmWTcFL87q84/dO7YEFHRUIpSru4C0jnS1YTbZbwF9BFJHu9AOdZeztDqQ+B6B932HuVS2gcNgBb8c+wb0zQ4bWQWHmVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757791647; c=relaxed/simple;
	bh=4QJAtzLdjPFH3B/bzz1vLr2YFXrb0w8bWqqUo0h9fyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=fN3GjDPVxSPzamFVJny474lTR/z1Gke8EXrh3wqTeMQnuYUuD1KBBu84Ks501hEgCWQymwzDejJ1sn+QzXnJ0vN1RXOB0Chywg2tVdlaBisgr0tBEHw42KzRyq+AYtGg0jY4+WVkHI8XT/Z+30kt+aS7mDKY/+wvA9ovu/Bq4Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeOrKm93; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeOrKm93"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336dc57f562so25315881fa.1
        for <tpm2@lists.linux.dev>; Sat, 13 Sep 2025 12:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757791642; x=1758396442; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8/oKVQ25YMQbDE80/gXuPJf69hTtmzdwn0M5XESeNtU=;
        b=jeOrKm93C0H7QwijCj5NmBnjDLE/jK5UE2oJSL9V0DYf2vCBrAEhXeKNvAziRax0oL
         VbShQMlKs10LP2MX6vmigSKeW2yXqzSI3+p0KODauW/rL6clh050VBjcgXrRtrckY2IQ
         hxwHUE7hmLYfN8ZdhLmRFeh9KBpHkicGqoONEAV/xorM1bJXBLCTyxt3b6w5WUdMKAkz
         zm8CMSKRK3yFA6o7+GzKOL/y4KStaBIxul6UZeitkLxkIpro82S4wAReCHzTGfnx/Zel
         Rcdor4pS947gCtIvEd8xHxy7L/8i6wLo6o7mcuKCPEsQCOpeoIc9WSnP3Lp8hpvWzPGv
         EwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757791642; x=1758396442;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/oKVQ25YMQbDE80/gXuPJf69hTtmzdwn0M5XESeNtU=;
        b=PNDUWcGlzp9hNypUR5A6+nnzM96D/If07R6/fQ5mx43uX5gPMMZtIQgw1BzAfD0zOU
         ng2a+Z61RZmVIueS6FM+/LZBrCUINySapGy8xw2dms6QiT1TElrM9l+X78w2cFGBrSwb
         Fr9F+mlqTQJCdvNxGhDokDcdehFjj3d7zQJDlKQuHScJu9s5NydaWT7mDUp8FLjO8Jco
         yTkb7mCCK2GolsIIo0ax0cL9uy1dpjCWb1Cm1RN33ESpu++x0eb9yl69Ib8tyVpHJ0Mu
         o3VGUY4Wgp7mKMcb62MefZNIZjaX3uUqB0AHOEknl996p0ndbSp2ksQt/CqeKoB0xcwm
         yQdg==
X-Gm-Message-State: AOJu0YyYimrYeNgMEdeKkVneSohD/PfTEZNbgcAwObgowNhpEckU3S7m
	zGQ3Y3PWOKH/fQnZ+Lra5y0RfqCmVmOTFuLDDzyxkEV2q7ZC06xUX3zQaI9ob8U1UYJBXS3qe89
	iIeLED1fX92qZmVjWb6i4LoztOJUOT6mckg==
X-Gm-Gg: ASbGncsk2zwbsrYNJjWKPEhaS+E9TwySCVV50wshTZEfFr+VFc1MBdiesRTG/xgSigv
	5h90u8VnqPOiAwS+5ArHakvHfjnEwc0OIHKaAyZw6Ks5duIxCX/wMYNJVn2hQQ1oZOyAcys5gFY
	uZtqrPQvIerdulltyIuj+J4hg4MgvZewVL5EeuRJzFyU60vgrzN0Sndxh9IpwRuo/YGFKdguHoF
	ufPWh7FMGp/rt/f
X-Google-Smtp-Source: AGHT+IF+54QWB6cJCBVo8yXJZyIimGj+1PEynAaiQhXepmPmieIIesHwCBhNynkJ2rU1fiJsPqMpgerQjPN8raKWvWg=
X-Received: by 2002:a05:651c:50b:b0:336:df07:95f5 with SMTP id
 38308e7fff4ca-35115407144mr19564761fa.7.1757791641858; Sat, 13 Sep 2025
 12:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFftDdrj2r14mEz7j+TP2bJ1gWMgaaEOD6zL58Y+UQwfdRB92g@mail.gmail.com>
In-Reply-To: <CAFftDdrj2r14mEz7j+TP2bJ1gWMgaaEOD6zL58Y+UQwfdRB92g@mail.gmail.com>
From: William Roberts <bill.c.roberts@gmail.com>
Date: Sat, 13 Sep 2025 12:27:10 -0700
X-Gm-Features: Ac12FXzptvZfjaj_64qxPrTOSoxmO5ootWo18a7mKg6QzeMEZCSU9auEGNsYqDA
Message-ID: <CAFftDdrTREDvi9r_1cDFMfLBJm3ZOe+1oLtAVKukQ679xENJUQ@mail.gmail.com>
Subject: Fwd: [RELEASE CANDIDATE] tpm2-pkcs11 1.9.2-rc0
To: tpm2@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I am pleased to announce the RC for tpm2-pkcs11 version 1.9.2-rc0 with
the following changelog:

## [1.9.2-rc0] - 2025-09-13
### Fixed:
- tpm2\_ptool destroy removal error on persistent pobjects.
- Warning "UserWarning: Unknown distribution option: 'tests\_require'"
from setup.py.
- Missing SHA1-RSA-PKCS from CKM\_ALLOWED\_MECHANISMS.
- In tests requiring Python, don't override HOME as it may be needed
for user installed packages.
- Certificate finding login in pkcs11-tool usage where `--label` was
used instead of  `--token-label`.
- Configure Fix detection of javac.
- Configure Fix detection of pkcs11 python module.
- Fix incorrect logging statement in create\_pkcs\_store.sh.
- Fix links in documentation.
- Fix OpenSuse Leap CI Builds.
- Fix improper handling chunks across IV multi part handling.
- Fix memory leak.

The release candidate can be found here:
  - https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.2-rc0

A big thanks to all those that contributed in this release cycle, like
users @fdub and @bbhtt, to name a few. If you got left out, I
apologize, but I appreciate all the help!

Thanks,
Bill
