Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF78F236A73
	for <tpm2@lists.linuxfoundation.org>; Sat, 13 Sep 2025 19:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757791530; cv=none; b=Clsg+IlYzULl3SHjjLcAEYe3ZIcgeorg7ZtasXGkl0VrjN0Bcc3MfN7YD7nK1V98ADJQwx91SfSe9hW76Bgz7rCvOSvj3HXu6WgJNV4q/NUom/AcGvoZYDJlFM89H1AuA1hGDxvGA5HRgw4WGELK7/3j2uPnahM+bgQ6BE40Q6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757791530; c=relaxed/simple;
	bh=4QJAtzLdjPFH3B/bzz1vLr2YFXrb0w8bWqqUo0h9fyA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=SEJsU1tpZI1RNhE1pTeyB7P13aWaHb2zcAmtZXW2ntKSy7d0NOhoNPE2d63TRDXxLz5Bj7U3ngQ8MBl/bmHeBXDU9A9zx7FIiw80NACqyEriHtGaL4kAmdCr6dMXj/CY2zP/L6rG9Sx0/tNCPBFVtMs0qtBQby56AoXyOGqgXNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnMJUgkf; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnMJUgkf"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6724E400AA
	for <tpm2@lists.linuxfoundation.org>; Sat, 13 Sep 2025 19:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBOK_nBsu0Pz for <tpm2@lists.linuxfoundation.org>;
 Sat, 13 Sep 2025 19:25:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=bill.c.roberts@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 211544004A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 211544004A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mnMJUgkf
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 211544004A
	for <tpm2@lists.linuxfoundation.org>; Sat, 13 Sep 2025 19:25:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-57263febd12so428544e87.1
        for <tpm2@lists.linuxfoundation.org>; Sat, 13 Sep 2025 12:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757791524; x=1758396324; darn=lists.linuxfoundation.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8/oKVQ25YMQbDE80/gXuPJf69hTtmzdwn0M5XESeNtU=;
        b=mnMJUgkfTkxHg6TzXnJYeNWhlrI6arBHX0u7fFdDCFq7AVog0MBz7QATAevX1VYs4s
         MrjFipz1PmrxTytXpJreNtuuB03+aLrYVVzlAm+Hjbwje9tn2NwTN2MIOYXQTDNyC7Cr
         nw8n3LQxgoBXtePEgDFXPeEXNWinmaRLeFgp0CO1kj5xyQenUWos07gzx13nDrydjtYu
         MZTjp/vJd9gKqed7SqR2I43keEyyHgOB3GK/PJY0mmookXfKbM9CHxAoRIX/4rfJdewg
         evRYcqDhsYvNjBYpzM1o4bUwsANA/YH9bWQGN0915E6L4oNhO4+Up0CseFRFCgSNlVMM
         sqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757791524; x=1758396324;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8/oKVQ25YMQbDE80/gXuPJf69hTtmzdwn0M5XESeNtU=;
        b=mcrvT2yaUauVEN0Y0aPkL+bLMD5EYi19Yl/KCBDupVcVf3p08fQiCo97QoIFwCsHEc
         Kqrejjyov1pknz1TFZIcbml4fMnAiEmj/BN+tuOpx8xHmFuyKIs5HeFkPWMdKG44Icdy
         aUubp1IzksIRD+Tv2JII6ylDae8dIKRk1J46Q77wcIrLy0SeGkh03q3usx2cBH6qC74L
         NOLLXDtU3ZVlHLlaTJGkdp2xn29TWLlnOtnZbE0rbRScGTl4yWbAKuy6rLt+39PVgPdt
         pimTsLNIK1LwMvNeGvRG80MXfOBUukTcuGgCPfv9uETl8V2O5LbtLXvyQyNFehd6vq8K
         LWaQ==
X-Gm-Message-State: AOJu0Yzf2gNWTxkZ6qSZYIK5kvLYa9Z6MnFMMdBkRwYWdSDqIQlp3KYf
	I9koOPi1lvc0yoUUsWiSkuykzJ0+dZa4jMFy/cZb0JWuIPDazef2qJkMHD2c9o5ZjKIBN4Pwcwc
	6KI3ezKWqj9yL3s+AUx7B/IjRA4B+DiestBcm
X-Gm-Gg: ASbGncujto9pLSiAd2GMxSNEcFyJqqXhIvLW1xKnf7X0+s9crYAb3LrNUDSlroKxkmq
	oqmmIeNQrfwKJ3pK8zG0kd0LQYOuxbsmms+rU59D3f5qx6p5KBiC136VM2NjT9VIxJdLyqfzaKV
	3vPGL6v0XUhEZV3J0ErIXGeF+q2Gcie4vFyMyQb+3UlMzMZrmeP1shvURT6vqAlxGn7oyeqqfIC
	e0HTw==
X-Google-Smtp-Source: AGHT+IETb55JCrVfXesZCnfjxAmC2w9ESUVtyz0Wzp1gfcTnyjwAdOKnd3uC92c2nXbmg7lubcHSW/N7/x+DOWKoULQ=
X-Received: by 2002:a05:6512:1150:b0:55f:3f57:a64 with SMTP id
 2adb3069b0e04-56d7a8a35f5mr3467380e87.18.1757791524106; Sat, 13 Sep 2025
 12:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: William Roberts <bill.c.roberts@gmail.com>
Date: Sat, 13 Sep 2025 12:25:12 -0700
X-Gm-Features: Ac12FXyz_qBKdpfZBwmSNc2LVJKbtRxM2aW6kW17Ql-vGZASWSX1UlpP0MsbzUM
Message-ID: <CAFftDdrj2r14mEz7j+TP2bJ1gWMgaaEOD6zL58Y+UQwfdRB92g@mail.gmail.com>
Subject: [RELEASE CANDIDATE] tpm2-pkcs11 1.9.2-rc0
To: tpm2@lists.linuxfoundation.org
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
