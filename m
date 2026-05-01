Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E503290BD
	for <tpm2@lists.linux.dev>; Fri,  1 May 2026 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655859; cv=pass; b=AOF4DVaBaRWWrUbjyvdy8K2g1bHPelNExQn4R3Iz00EM9qPAOihj7/8wg8aERkq/EaxkpL3o0XcBC1XcS8uDOAQyCyieF78Zl2zZ2jXsq91d+jezvDW5k9cWylwfECajxqdrRKRk3UVe4r1b5+6cdDhZmJP8pF2qvaJHVEF87CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655859; c=relaxed/simple;
	bh=g7spXgIWmUOrDvOfDV+iGH+YIq6VqFtecjqouSWX/6k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=kBbalX/zwyVPmGSpjr1/mpSOgoc3oHHvUr04q5GJRTGBKt5a7ZMlaqptnGFWVfe7RdBkrMWIHJKHkFAqkG0lZVZ3AOFlZyqTAHg8eEk3YwH+EdgaE285vJB28WiyDFy8cu1rvkUwo20JlWDrUfXT84NY6Lau3g3YRPs1yAAy54k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9sRZ5yS; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9sRZ5yS"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65c21049dafso1780008d50.2
        for <tpm2@lists.linux.dev>; Fri, 01 May 2026 10:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777655855; cv=none;
        d=google.com; s=arc-20240605;
        b=GndpJXIxCWDi71Wzhj3R/9yt4w/UHpXw07cYOY/yqzAWHa5exK+dudLcDbIn6wz9O3
         ROlJOJ5DkaFiT29q0O8/Ma0kbR3Z3bGckTpfom7SspykhoW4Enz5tBz4g+/U9SYNr5vX
         SkoQbR/vO6YEuHC6Gk82VIt5/fdCv9g+a7LfHUVQnst5A2nX18R9mxBchA5CzNYtl1+/
         839MAtBsE/OfAuk2YbuPYhcxytWbnVsrqgowO4YO/XvGQ9ye1ACzipvhsMZRbBZp4Ddn
         IgFpAMdZYp6s/fwtTAJBNZFxTnUIhd7lHvQHozRx1Yu7Rpe3CriS5bo+Aad9s++oVpph
         4W0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YmVYH53S7ByA8WmocNerrZ7ONlkKhWi9OGOKiHSYO4Y=;
        fh=PFK5BRwVnwyxZKyx1wYwmu3IBDeE0v/2V/gDtVcF/48=;
        b=Mzzw2AUduNJt1RfYgn6XifPdtm72edNPDNZW2aiZasHhpiHid5de9zHf1Ya4SfxrHI
         pUG1oNQZJ6w1oLTcukZyYIN36aZfGOTxswpQ6tlKoC73LD3ycwI+PkGna85Wh82ioVu4
         v/yv5/qsi6NuHVJmKcCLIwI+QGjDK1U5We1jPIE+IDf8AealfcXcrzul8BEtYs3g3+Ci
         3RPflGal11LtpcrYBRifZIoiNrGKTZSBNbqvfm4Fct3MSGe9z8V25VqJL57GxcnTWSU4
         sMbkiDzHV46Q1XpBkQMLolJ35hhZkg6Zs94YnEY4QES/Hg/Z4MTCJgoRV2mo5WOShAyd
         4hXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777655855; x=1778260655; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YmVYH53S7ByA8WmocNerrZ7ONlkKhWi9OGOKiHSYO4Y=;
        b=q9sRZ5ySnAKZhG1dJHlqD6wsdMqynvlnFsHEhe/cuuB7Pe4o/fgPbAJJJ+kaSwjtkj
         sRVV6RNH5B8T2HRPLpQBMkQMuaEfre/ckBhLSbUnOTu1Pkwbxsqvm+LvlNXJpwhemJ7x
         UeQUldlXA7pHwzBPrY8sHG3GHPvYYVyyhFDfRtIb2lzZ8p4CO6zAgCBkPOIgLcw7FYBG
         X8tYPJfE6r+W2CIf5D5Udy0T+zczvbl9RNapvwXEuSZPTsDCsVZWMsrM7BcL+bEOfjIK
         iwGUp4tYXnoZ+dofgsxxE0svrPdQmkS3egLd8Mqbp9dU2WLTOQ+qwiJBbuOL+jhjfO/b
         Rexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655855; x=1778260655;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmVYH53S7ByA8WmocNerrZ7ONlkKhWi9OGOKiHSYO4Y=;
        b=DX17MseDuV+Avaqkb5038/gKAaXDwQGBFqoRpFYI4f7nw/rPJKjj4vA7Z/O1HrADuz
         yqa/8+ZIBjuyf1lBRcdk14wvDPX9K9LQt34lWZKUvFdvCrRvH3G8U8QpSjrFqrxuCRlv
         mHeNqq9sPCeFJx/0emcJvjnMzz+KJlV7XggfVlHF4JRl0QwYfFx6wP2mMO4T3KjuA6sd
         8neZe74yCuc3N+RbafEmIWORIgnRChgYJ1Gs6jtEUDBmgwfy/TXhscOciLCX6AAQPeiS
         D+9DIjNFAmr1BUdFFJ0L6dfDSazEcprRO5SM8pgkRXsF6eGge8cSCeqOdj/ZEEDQ57Zn
         NiAw==
X-Gm-Message-State: AOJu0YznIZhfX3UkQ/tQ/0TqWUi4SygeLP/JhOgTX1Bg/mJDZViPDMO3
	x803Qfs5iCV807Y8sUSyuA74ef0lhMQyGXZnKPS6c3uRpQTc0GL/H9lsMcOeAGh1R5AM8zzwD4P
	JgeExSGeyzoR3Ab/fb7MJHHizaND/DiabhQmG
X-Gm-Gg: AeBDiev+qJbqLbkqnm8nSBJDfZIAExo4WqkHjRy49ix6cD6NYud72ASeQqxc6C8n3H1
	owE5u1DKWiQgo+qM26JwYS6MazHgZoPstCREYzYFCtHPeHYOb3lhY0NxP42g7MHmyAIQOF1DEAt
	hFbntyK4xPYYIRJTYy5alEIXkofoo6dEmgY8Yeovg0UQtW+/stS/m2GW09mMzLN6Hxg29kuTP6K
	AczJxFluTd6dz+77BEuX0iMAKMxdfpkAisHXEEIqSk9OS4N1oTJy/Le24+d7q6RcBohm2dAUuLF
	/mbksL6DV77qLRdP+Jrc
X-Received: by 2002:a05:690e:130b:b0:65c:391:4553 with SMTP id
 956f58d0204a3-65c3d972826mr15961d50.2.1777655854802; Fri, 01 May 2026
 10:17:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: William Roberts <bill.c.roberts@gmail.com>
Date: Fri, 1 May 2026 12:17:22 -0500
X-Gm-Features: AVHnY4IrRkPrF3OBYRzde2oVRA1ytwPTu_Ny-kNSNnKnxt8Em8p0e5RGsY6hRZw
Message-ID: <CAFftDdp6tHBFHxe+S_Du11hqubfhNoap-wOfhDKqQAauy=k=dQ@mail.gmail.com>
Subject: tpm2-pkcs11 version 1.9.0 should be skipped
To: tpm2@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

TL;DR Skip 1.9.0 when possible.

A bug captured here:
  - https://github.com/tpm2-software/tpm2-pkcs11/issues/805

Highlights an important bug that could hinder database upgrades. The
major takeaway is that a bug in the C code path for updating the DB
Schema from version 7 to 8, had a null pointer bug. This was fixed in
1.9.1, but as distros are updating their library versions, this bug is
becoming more prevalent.  I would urge folks to skip 1.9.0 and upgrade
to 1.9.1 if possible. Also, the tpm2_ptool path doesn't have this
problem, but another problem was discovered in tpm2_ptool where it
couldn't handle the older hex encoded list of CKA_ALLOWED_MECHANISMS
when performing the db update. At some point, the hex encoded buffer
went away and proper sequence (list) of YAML integers was used.
However, the DB Code on the C path wouldn't actually apply the change,
this was fixed in release
https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.10.0-rc0

Thanks,
Bill
