Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E19176AAD
	for <tpm2@lists.linuxfoundation.org>; Mon,  9 Sep 2024 19:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725910174; cv=none; b=raks/3Y+vV5e3pYRoAktR0LKJgKRnTMQ0JJZRSwMAmUlhwlgVpG6sAhSFmsYwG0DnjnnUA7zA4dNBCbfQIQFInA+JGV59TA4PFXiDb2IuJGNNy8aA2ZXdWVtwpICb8d9zPfHtRJUhOBYNuzTiOXEqM0uKbtRmtIM5ECHpMN7vGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725910174; c=relaxed/simple;
	bh=2phcKjqkPiK2i2uAQ6/sqNEuT9oYxx0IGLsppssM2O0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WJ1YS1QVK4GYnL9cTHKBWdmnokVzk0e7NI2h5LKqtzjpwm6CM2c+9VIPDoPSLHZwvW2FZC/s55oTHiqnjOXnITZUstFbRK4HLjgKqduFh5gNqf2QGoUMrG3rXG84cK15uC8HVptTKRRiUMCtPii0PIv/VyTtLKnnayTzYj8sna0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYv59S1Y; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYv59S1Y"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA51607ED
	for <tpm2@lists.linuxfoundation.org>; Mon,  9 Sep 2024 19:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpUJXHNLSarf for <tpm2@lists.linuxfoundation.org>;
 Mon,  9 Sep 2024 19:29:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=bill.c.roberts@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BA9A60591
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BA9A60591
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AYv59S1Y
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3BA9A60591
	for <tpm2@lists.linuxfoundation.org>; Mon,  9 Sep 2024 19:29:30 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2f75aa08a96so34763191fa.1
        for <tpm2@lists.linuxfoundation.org>; Mon, 09 Sep 2024 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725910168; x=1726514968; darn=lists.linuxfoundation.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=arq6Nxl5wfZR8l8fJFKr1fAnTD3jYkjsXByLCegMldM=;
        b=AYv59S1YrIk7kqsvbGK8207TJoVv/IGGEbFBzzYW5QoS+ZybF0GFTrim2f3jFwchN9
         bsKdi2ayUPTfrA4OPUAhi2PSne9qgJ8Fp8YR/vHx8k16ELPzZIMwXd4e2V9MuV3a6r5e
         Jxq/n9YsuIGPm3z5eO/JV4W1Siip/JJuBNKuk2HrmB5C1GkGGjB9cSjvzmKGDQQqFyQi
         PQu8HHraWSZbU+triBpFoq86JO5l/2a+VdIAPa4tKEJDYczohiT0EswS9h8H3O0Gx+dE
         5SmFlpaS1Pr27/tKSZ5EVpsQb0KSehyIlUcPH2kHBwAVG6GM0kaWUMUzU7LZb9b8FjT5
         /ONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725910168; x=1726514968;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=arq6Nxl5wfZR8l8fJFKr1fAnTD3jYkjsXByLCegMldM=;
        b=RQXSjBH7vvacYxTfMUVYcXSBbtMaSFEKRTK3g9LkeKY+WcXhdGtVHYk2R5NgyGIiT0
         EsvLhTRIRoOoPLhyGaFQl4y77VisIV5dTMbS0Y0OpyAgwxFi1ErRjoSkH0PxXUEo2ps/
         DpbKVwuRpZPsG2y5Gd9vzf5YjiY8Rdh9IEKI++E1Gs5VaWJQBn80/d75hGTx/eUFdFVW
         gMJ/fGbOOacoSR3Pqf0I7aazUY+lmHskdfp9ll53fBC41JhBxPJkihTB6MAp81c/2QZL
         oSkCtJcclxYT7jnlTFwiABUblqRQzLi87gazHam8Dmxuu/V3/6mXz8GArK9AFW6RJxa6
         jQNQ==
X-Gm-Message-State: AOJu0Yx2ebztirSRJ5yyuUL28muK3ukCeoZqf+avV4yxHHKB/uKe2M5f
	Dc/IJDhv3AJKpjabjUrF/27++euGBqZSWT+QPgE/T3eLg9LFv55VemDkzlmsh6g0UjYQLwmhpSy
	yr4nhziLYPm4vX6KZSjvrQ/jyU9RAFWZt
X-Google-Smtp-Source: AGHT+IF0K5MTPttpkzWDePjjnBAhAJgqZV/+Uo9iWcFC6EbAh63qhhcpNF9ODe0ddPEpiSjDptbKXIDVwG5WVOqm3cA=
X-Received: by 2002:a05:651c:198d:b0:2f3:af4b:224 with SMTP id
 38308e7fff4ca-2f751eb2e90mr93934071fa.8.1725910167245; Mon, 09 Sep 2024
 12:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: William Roberts <bill.c.roberts@gmail.com>
Date: Mon, 9 Sep 2024 12:29:15 -0700
Message-ID: <CAFftDdrgcgYO1Vj1URr7MHSXoC19y0eG8MDH=Kp-M2hu8-RH6Q@mail.gmail.com>
Subject: [RELEASE CANDIDATE] tpm2-pkcs11 1.9.1-rc0
To: tpm2@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to announce the release of tpm2-pkcs11 1.9.1-rc0. You can
find the link to the release and the CHANGELOG below.

https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.1-rc0

## [1.9.1-rc0] - 2024-09-09
### Fixed
- configure:
  - Change mistaken `+=` to `=`.
  - use user supplied `--prefix` even when p11kit is detected.
- Remove warning about unable to find FAPI when it's is not-compiled
in and not chosen as the beckend.
- Fix memory leaks in `tpm_create_transient_primary_from_template`.
- Fix `NULL` pointer dereference in `db.c` on uses of `CKA_ALLOWED_MECHANISMS`.
- Fix offset miscalculation in FAPI backend that was corrupting data.
- Support `CKM_ECDH1_DERIVE` via `C_DeriveKey`.
- Fix usages of `tpm2-ptool` for its wrapped `tpm2_ptool` in tests.
- Fix failing db upgrades on double conversion to int.
- Fix db lock file due to missing parenthesis and order of operations.
- documentation:
  - Fix use of objects where tokens was meant.

### Changed
- `--enable-fapi` to `--with-fapi`. Note this is not a major version
bump as its internal to builders only. However `--enable-fapi` left in
place for backwards compat.
