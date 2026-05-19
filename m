Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6253E92B7
	for <tpm2@lists.linux.dev>; Tue, 19 May 2026 21:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779226191; cv=pass; b=jCXXABAit6Fu2zByY5hd5BHTPwBZaCS+ULYZqDYThrbrCTaD65SZ5FM4IoN24bFIi5nQqFdyFoC1RMp/tvJhaUIz2tQGJM6lXFcDvFEVbAKkatLDAb/u7ImIG7I2Z+2GnCYAXjN4VPqfLFmLXF6+2ATc82QLtxxI8lNOzlkalw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779226191; c=relaxed/simple;
	bh=I/gAaP6AZY6CJNaFy5PeeYx8gcdoNcJKHlbNxUDb7l0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=MZRSIlsQ+J7b9Hc7hj9+kwMA6/zSxB38VXnn3SHlrwOnpdVG5JyjnDb/OPn2dNw9T6akG2rxifgwhKNaofLtUDYEjW+4+QoEfY+J1WIN1FsEZv3l+/4YEsHPQ025QbDkn55RHLCDuVyaL21ISeBCFm/310cTSRYF2Fpt7r0Ywnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqyTiqn1; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqyTiqn1"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-651d6347a69so5527272d50.0
        for <tpm2@lists.linux.dev>; Tue, 19 May 2026 14:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779226188; cv=none;
        d=google.com; s=arc-20240605;
        b=RhuzQL1eD99FrV2a6uMiLcH+X7N4fSDdDX+9YM62IZ21xeglYvgFoUYpL9nlLoa77i
         7zc6cdmUv9lRUL98G7GoZbqXzvYeDiBT/j5EK5pbKvMUjh4DUbVJ3GaoqpdwWr4Q6XSF
         FneRdTKTab9WLlB8isO6256ZCLDfVNNG6ycxyNk7MGS2nz8D3FnYvrob25yj3oYIuVmU
         NpdJ9wAbianeXPgm/LdynHi4qRaIUGCYHNEbrblqMXr8oHASc0ou9TKLz9p/6dlr9tMX
         Z3NgJHn5i3M7Fe6seW6yQzr+H08FTBHsm/13TrHqO7EPzqX7OvcyJVuyd4vQyD/s0P/g
         yPGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=see6UPz/kzdM8cz7wKxyRpUtHnRvNIsOLLTTsb7wODg=;
        fh=PFK5BRwVnwyxZKyx1wYwmu3IBDeE0v/2V/gDtVcF/48=;
        b=SS3/dorpyLlagAgNLvWGHdz47h6MQppfcEB0vJLcNdrI3otbBbuy6mQDAjjrbo72+T
         eF/Sbj4x83kBqUF3xq1tRv6QhZqY4b0Vph8W8dV6V7dg56o29zTgdw7RXXcgtIJRDoo3
         HZZ0IrnZg6M1fztiHpgD8cm1tmPmnTX+9NzLGTP7fbgXHl1QuHaxu5mJ+71RhE2fXUij
         gfmmeeSjHmg+u3xB4JV03Eu7N4EiLyof5Xu20i8lv4MjZSEzMQYyyFHpN+7vvdYSWSST
         NZuiFgm/0yM55q4p9a/VLxxU6qa3yH34Gcw+LdS4rnUMVBPIHK+8VKfZ4S7gkRPJljjq
         2zQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779226188; x=1779830988; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=see6UPz/kzdM8cz7wKxyRpUtHnRvNIsOLLTTsb7wODg=;
        b=fqyTiqn1+It0qVb/eD6j9e3MkYYhE1yZ12xNzmB2aJnHXkjLi3IgvTwzXiG4U/4WSc
         hgo2zH7ipnBdW6OPp4HPS/eG8Dx3geZbrsvNgzXBr4Nj3HuXLj4uAKDRjzjX6OPEY0a5
         JDE+7l8WAS+B52nDbbXO+ApP9flUpzmUTx/mBJsCCTS6I4xxM+Fh8R3oUycC6ZTkeznZ
         MTULQGZYLJzuxEhkDa2M/URGF56aYqorXepN35Tt16C4GpnDA2szxG1WNSffI0KX20Ry
         5+LULp4H8usgPAnmG5o56ECSTPCJQVhZMePvbU3PtvHN1LDcvt22mMX7LOSm5eruD5Gt
         9ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779226188; x=1779830988;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=see6UPz/kzdM8cz7wKxyRpUtHnRvNIsOLLTTsb7wODg=;
        b=KIcR1JLnVFeC7VDgcbR46K3ijxDksu8yEIxJc7D+A/qjporv35E1UfsFi1IlMet22L
         uBiF6o9/QnV8aBJ4H0H7FfPT0LvOq+hntQVL4XyOmd21jHn2GXbTZx8t8kzFgC2CqmOf
         Don2XCOq/eDJdM4B3WsBvh8vpFAoOZyo8nF8hMY7Z03wvlR+zVUyqhvTy8Q3x+u+ib2s
         ezHVwbrokSCwgHaT2XlcYogMAK5f9W6iTC7kjq3WoAmX2JZDHx6aV1SX3NsQKasRT/5x
         jeIW+q2XB4uZ2Wq/JClr3GYMOwdsbnaxGFuTeJgK9XKdjS6iVP1vgLIbVQVX6F/zAVGs
         EN/g==
X-Gm-Message-State: AOJu0YwV/sN0JPfUstokvT8OiYHwTNCdWCakSmN/0XDd4x3tqvf+7YV7
	OvqbRLsr1IlGDdb6RPghF7GS8xv+3TO/8ckuLSo6d4jOL9hRaaxY0nOy4ljuFHwMcSPVdpwzEat
	ZbNP5ihBXYVi/8USVEVhkazf4nt+QR9XEtShVDbQ=
X-Gm-Gg: Acq92OEC3Z+Pip9URMFU4nNS+/HpOe2vzoS99qwzJBy0BpYNQf1wN/xpV0ThU6ORs4L
	MEp8/sJm5cJySzKuiIbOSptb/07KnEkd3/5RD9156K9BIEY1KObXZxLeigjDXbLSP6+CtH2cp2w
	PmkohJLQwAj9jv8bddneYY9YVepOj11j2xIa1VwCr8bTYppcijySrgzmDjaCnPXLGAcayr3WUNN
	HLDTjY6UmXpXU+hG+kRXHQauS092TzUYjnK/+h4G6IT/kXcD8/jozHq1xRJSKApY/lMPPnLSCiU
	9LRX
X-Received: by 2002:a53:b451:0:b0:65c:d26a:6e71 with SMTP id
 956f58d0204a3-65e0b225732mr15673607d50.27.1779226188312; Tue, 19 May 2026
 14:29:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: William Roberts <bill.c.roberts@gmail.com>
Date: Tue, 19 May 2026 16:29:37 -0500
X-Gm-Features: AVHnY4IQ237sxH7NoBiyCoKf12ePJ71QzRci2Y31G_OVKSbxzKGp7oVR97Rb7Wk
Message-ID: <CAFftDdr8bX1TcsmVgAKVo0pgdvAVqp_RNJ2sj-iTWGoOtDx0uA@mail.gmail.com>
Subject: [RELEASE] tpm2-pkcs11 version 1.10.0
To: tpm2@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I am pleased to announce the tpm2-pkcs11 version 1.10.0 release that
can be found here:
  - https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.10.0

With the following changelog:
## [1.10.0] - 2026-05-19
### Added:
- DB Schema Change from 8 to 9.
  - **Backup your DB before upgrading**

### Fixed:
- Formatting of error cases.
- tpm backend: `tpm_unseal` returning false, instead of NULL. Fixes
compiler warnings.
- warning: src/lib/utils.c:243:17: error: initialization discards
'const' qualifier from pointer target type.
- missing `ECDH1_DERIVE` in supported mechanisms. See PR #913 for details.
- Database upgrade failure on upgrade `ERROR: Backup DB exists at
"/etc/tpm2_pkcs11/tpm2_pkcs11.sqlite3.old" not overwriting...`.
  - Looking for `.old` when it should have been `.bak.`
- Database version 7 to 8 upgrade could have missed performing the
upgrade of the database through the C code, add DB Schema version 9
and perform the update.
- Use ASN1 OpenSSL helpers rather than direct struct access. Newer
OpenSSL everything is opaque.
-----

Sorry for the long delayed rc0 cycle.

Thanks,
Bill
