Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3D718D
	for <tpm2@lists.linuxfoundation.org>; Tue, 24 Sep 2024 01:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727139641; cv=none; b=h3qSZFs7aFzFNWueY+4ZZKYGU97phfa/FlTiKNeIBBnl/+cpjC/zWEYo+zkfJA+y/OSEAkO+s+oDboeC0ucyG0vnUAYSo9E1VJ2SYgm9iebka3eNcmwp/0remJVMlU+UJAeBSm+UHREooQiHlwTIaIfI5mkodG2ROY71L+14j7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727139641; c=relaxed/simple;
	bh=bcuThyi9fXxvIRljlTRhe5RhyQ8CFtumT5uoF8BBtP0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hZZ43q11k0mQcUu6WLs/N+49FYl4o+mmZXLWQrpxg2glVvxbRZLlxzTgu+ghkYjnLAK6oqwqUcsqFxBwO+8aIy+CE4NIEq5Bwrf8spxoEeex+U+NuiATb/ByEs+CBxnAiTmSACYTnix4VlfxkhnRW2MTF9oUUTMIXOPoxb7EpVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqjLsJoy; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqjLsJoy"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4708060A43
	for <tpm2@lists.linuxfoundation.org>; Tue, 24 Sep 2024 01:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id po2ZvCrKKwBs for <tpm2@lists.linuxfoundation.org>;
 Tue, 24 Sep 2024 01:00:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=bill.c.roberts@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D14D60A40
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D14D60A40
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QqjLsJoy
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4D14D60A40
	for <tpm2@lists.linuxfoundation.org>; Tue, 24 Sep 2024 01:00:39 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so4987987e87.3
        for <tpm2@lists.linuxfoundation.org>; Mon, 23 Sep 2024 18:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727139636; x=1727744436; darn=lists.linuxfoundation.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=duHo9nMBf7i60sgsVAM6hDKzVqdqU5fqua+VFxMcNyA=;
        b=QqjLsJoygnO4oD4GozPm+9eQAUaiYoGYixDPjHySN/wncHnZjlhZVZmbI/RAylqxuB
         sI0oycNUF5XPvKDLg7r3Y1i39fFIqXOg6RKtVDOkghm3B7Z9zdt1CIbwEnOoxelU4oss
         gb8jud9Bwmd0HgAMcU/MvJ2FFjSAj6ML6241MTz7twLtUaeRc0Z6g7plejTFB+aTil3x
         d7pQ7CcFpitR95DL5R7QA1wTSRH4BaNpUkBiYs8Nb4pWSwXxSiz3VPJhuLp7APxO/Idb
         Eatd5e3hHHtyGIJpm/Ici6LVYThznm3oEypjAbRYzxDjOeqEOs6ReLQo4bq6RClS05LH
         yBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727139636; x=1727744436;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duHo9nMBf7i60sgsVAM6hDKzVqdqU5fqua+VFxMcNyA=;
        b=JLCg5dYZ6YCMEN5dHCp7kfpSKgRMYsyO+VD60zAeaV1lv005j10L834KVFEngynqFB
         KF6s7IXbHP6kigYCVAMN/Cgx5SSVyza0/L4PVk682ltgRbmIwhmeOW71rzSjO2JRzk2Q
         Eq9SV0LdNg+hUTLvbBiUsZMehZ7dULlPvjHgZoWCQUVofucl7WokyGgcIRfPsVoY8mkg
         opvcb8rkJodANfeJQ9CdXsRQzbzsXx3IcrL6LmLRPRbU1GUw4u10+hNIapj32lpmQdMV
         ZZD2WJYwvGEv34IqdEzwjUbmZAMNWOmwgHUUt6SUlYhUGUumANArEXzrKeOI/Dar5VY3
         7JIw==
X-Gm-Message-State: AOJu0Yx1U2sai7NhwseN0Jm8biMfojbIFSAkf4KiZIpOmHXAQbgoXMek
	lQoIWZXO7Rh0Cs70DHw8BzCgEyZb4psZi9NgJFQAoluQb4Rska1vyJr3fVsy45AjnlJ4Ak+cBdv
	lshzTTbI6f5etDtoaXFrdtD8emXrFcfEj
X-Google-Smtp-Source: AGHT+IGK4sPllO86rdP3A1JtYrxXPFYPZko2ofST54uXd0FhH38Ohg1WXOHs9H+CSeNZtfOPF9cyKqOUSTRH43bGJ9I=
X-Received: by 2002:ac2:4c47:0:b0:536:9f02:17cc with SMTP id
 2adb3069b0e04-536ac2f51admr6461315e87.31.1727139636327; Mon, 23 Sep 2024
 18:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: William Roberts <bill.c.roberts@gmail.com>
Date: Mon, 23 Sep 2024 20:00:25 -0500
Message-ID: <CAFftDdrA+qRaKKCfDR_oNGOyC3GeNuF-wxWJL-F6ZQuSkW=5zw@mail.gmail.com>
Subject: [RELEASE] tpm2-pkcs11 1.9.1
To: tpm2@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

After a long delay, I am pleased to announce the release of
tpm2-pkcs11 1.9.1 at the following URL:
https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.1

The CHANGELOG is as follows:

## [1.9.1] - 2024-09-23
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
