Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D11B59F
	for <tpm2@lists.linux.dev>; Tue,  5 Mar 2024 22:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709677907; cv=none; b=HwFAmFxNbUMYfZQtnU3o7ea300DZ7F1X6wk6tjG5SxEr4gcXalvmBL5fELBV6S//B9RrG3wajh+Ka3SFh6AZrkZSX2yOwnir/bC4txkJJvlDWkW8KUKLn+ntJA53FZicL8/snuskO1HfJarC/QG9PgHTWxMObzCODCjRfoMtuoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709677907; c=relaxed/simple;
	bh=9imm9unr4A7Gh9kN8TST/hJD1F0YqHpGnOV3Z0giK9E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Gryv502FJh3IkwfrceoQ1LPwaE0uAE5YLjrxDaq88VfY2yN+X+kNJRcXmoqujOcQF8JkwxfKG86+ZR8TFNFckcHAtmmHbD71huk77bw6cJagxbbmRxXSihi3DOlmGS/B7VW+dOGdgb2WuADDqVrnYA7PoTRFXpG2dfctYHuLuhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks-com.20230601.gappssmtp.com header.i=@gateworks-com.20230601.gappssmtp.com header.b=uVIea9dz; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks-com.20230601.gappssmtp.com header.i=@gateworks-com.20230601.gappssmtp.com header.b="uVIea9dz"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d220e39907so93921321fa.1
        for <tpm2@lists.linux.dev>; Tue, 05 Mar 2024 14:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20230601.gappssmtp.com; s=20230601; t=1709677903; x=1710282703; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9imm9unr4A7Gh9kN8TST/hJD1F0YqHpGnOV3Z0giK9E=;
        b=uVIea9dz4glQAB54llashkuGSCV24+gBGuyLsgW9uXHF3VhoA4/WHYu7d4GgLqLrDo
         L5lUAwpIBB5+IuNjnybm7UNEsXE8guhrtTYwwBj7RP3fya4Tj5rNlvRZ33RM6qNPJm8z
         y2cmEvRmBrX1m7hdJfRGwPX+OlSSaxXOhnnMoqMtG/fKDKD+eeVgz9CwXA0mWbYcURbV
         nRbni6fslv9O7I6VSHI758rObYoyWy01KI1WKw/attEYbH6N8V2d3r/5Kiy0HyEXOFSI
         PJG+d6Ah3kkZHHgj6N4EaBy+qj+e+Kb6XCP6XXPPMOgN5nffzkmBxBO9CgDV04/jOii+
         a/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709677903; x=1710282703;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9imm9unr4A7Gh9kN8TST/hJD1F0YqHpGnOV3Z0giK9E=;
        b=Ix5S8umRJRauITFoeX1xs7fl8l7rYlgvHS7cEJP4SLv/qGw3I9bSGbQV0GICwUzsVT
         vg0ufYStYP2uZylOSlV/ntYHjYuI72blq94/fdmJvx7msN55XyYbje6POPoFoslLsCZc
         qamt/PGpGqmFSvIulqF+oIXwevyJgDww5rBewtF0ghXKSnP0NbGpoyyi37B+0gwZMXa5
         FFvdHQdmU7oxAEORwgcreFKHY9GYn/D1UQEW1ya8rg5tU2v1lkVPHswq6d2hIm5zek6b
         ncim1R01wvkT0uORPiNONKot8Z/N5EUBUHtmgWLBftQ1Ju6ErjE4aq+vSHV0PRDR44oD
         btWA==
X-Gm-Message-State: AOJu0YwoMPv9fijOwpIdES92sHZI4IHiYc0yQZLYqjUrj/0mb6lajDCt
	6qCIDgQlLq48+G/fV/Zk4BjCMIwuJCHL1RKjcWxw28mEfFiPdkUjCCQHoRbu770+zBq4pTcP++G
	UuViLqRt/dPZ0mifUZCnm4mR7SrhOWpI+iwxNAvUD1e2cZWBDnzhbSg==
X-Google-Smtp-Source: AGHT+IE7dkSwE2Vh+/g49LC10ib5XWl4nQqOfF2TDcp34N3YcTiD6mYwBwI85AH4kkFCW6ClBnlkjSmrkEGfx9s7y20=
X-Received: by 2002:a05:6512:14f:b0:513:19cb:be72 with SMTP id
 m15-20020a056512014f00b0051319cbbe72mr2238728lfo.64.1709677903091; Tue, 05
 Mar 2024 14:31:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Samuel Lee <slee@gateworks.com>
Date: Tue, 5 Mar 2024 14:31:32 -0800
Message-ID: <CAGL1gLNsEPXG6dXXJLk2Ucd_UAjMoa3_OS=uca5G4FvPjAMPNg@mail.gmail.com>
Subject: Issue with TPM2 Encrypt/Decrypt Functionality and TSS API Integration
To: tpm2@lists.linux.dev
Cc: linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear TPM 2.0 Mailing List Community,

I am currently facing an issue while attempting to utilize the TPM2
Encrypt/Decrypt functionality in conjunction with the TSS API
integration.

I have followed the steps outlined in the TPM2 Encrypt/Decrypt man
page (https://tpm2-tools.readthedocs.io/en/latest/man/tpm2_encryptdecrypt.1/)
to create primary and key contexts successfully. However, when I
attempt to use the encrypt/decrypt functionality, I encounter the
following errors:

# tpm2_encryptdecrypt -c key.ctx -o secret.enc secret.dat
WARN: Using a weak IV, try specifying an IV
WARNING:esys:src/tss2-esys/api/Esys_EncryptDecrypt2.c:322:Esys_EncryptDecrypt2_Finish()
Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_EncryptDecrypt2.c:107:Esys_EncryptDecrypt2()
Esys Finish ErrorCode (0x000b0143)
WARNING:esys:src/tss2-esys/api/Esys_EncryptDecrypt.c:328:Esys_EncryptDecrypt_Finish()
Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_EncryptDecrypt.c:110:Esys_EncryptDecrypt()
Esys Finish ErrorCode (0x000002c9)
ERROR: Esys_EncryptDecrypt(0x2C9) - tpm:parameter(2):mode of operation
not supported
ERROR: Unable to run tpm2_encryptdecrypt

Further investigation led me to the discovery that the TPM I am using
does not support the TPM2_CC_Encryptdecrypt2 command, as confirmed by
the output of

# tpm2_getcap commands | grep -i Encryptdecrypt
TPM2_CC_EncryptDecrypt:

In an attempt to resolve this issue, I decided to explore utilizing
the TSS API instead. However, I encountered a new error when
attempting to create a primary context using the tsscreateprimary
command:

# tsscreateprimary -hi p -st -opu primary.pub
TSS_Socket_Open: Error on connect to localhost:2321
TSS_Socket_Open: client connect: error 111 Connection refused
createprimary: failed, rc 000b0008
TSS_RC_NO_CONNECTION - Failure connecting to lower layer

For additional context, my system configuration is as follows:

Kernel version: 6.6.8-g19a0c7318c79
Installed packages: tpm2-tools, tpm2-abrmd, tss2
Discrete TPM in use: ATTPM20P by Microchip

I would greatly appreciate any insights, suggestions, or guidance on
how to address this issue. Additionally, if there are alternative
approaches or best practices for achieving the desired TPM
functionality in my environment, I would be eager to learn about them.

Thank you in advance for your time and assistance.

Samuel Lee
