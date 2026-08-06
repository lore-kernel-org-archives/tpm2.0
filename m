Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5225137F311
	for <tpm2@lists.linux.dev>; Thu,  6 Aug 2026 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024453; cv=pass; b=bhqH29gGwXqu8/kNR5x8dp6nmWK8eIZvAiOUVf8YCHvQv1hfEwccmatvtMgjB0bqu5KKS2TKOuF5AeJ9ULKijdJa9cB7WPSYPjHfpr1wW2pVe8L4OR1ZGHUZQy0ykhQ/MzNRsy19xPJKFbm1UnwWkFBJoobsdZT7oW1jvF6OSMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024453; c=relaxed/simple;
	bh=mwa8REcWcwXT1YByRkRFTtmLorp4QhiPORTMh3/JcRo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=iFvUSYHT276/8QhzuMcp7G6oau9WhRjf24BxyIT8I1QEf4OJTmhlD6HNzHzUSwAhit+L344McA1LmDY0jbu1ivfMELizyrXJB7D5CEOsdmjqBy0fzrz3k0dgf7yswI05ULIh1vpN42GjtI12px/KorlmakZERsAEBGHZSj+WgXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haF28zNH; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haF28zNH"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81ff017d420so14355097b3.0
        for <tpm2@lists.linux.dev>; Thu, 06 Aug 2026 06:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786024451; cv=none;
        d=google.com; s=arc-20260327;
        b=rjs9g5qoyNfn/G+tvgPPj+DVJeVOci/NcovJmDRpHN8ZfqR3Pm28UF/tY++R5y7g7Q
         aV8HNTqNhFZDrqgMNFlA9Be1bc72mm5zLgnk1aAiUmntSarweF/hAcl4qKvKwtjK0Alc
         oTVKPN5OVu9cUPrRSXkDjFtafdFxdcEPz+LeE6nYaTFKsIyS7l/UE720EhgAcNs3Gh53
         PCfwjeBbCgiOGdZnn6lwtot4YOR+4TVEoG4PidHEHClFhhp/djnd9MrZppMORwNSlsnh
         xogfweTHVtf8dR0Wu5i+fltfeBjhyTc8pJVZaFfGZ032R7hJm9WuC09nFk26o9PpSorA
         PUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4sOOBLBKcag5iUMRwqkJ8znKtx8rCb+zvPUFnOSNfDE=;
        fh=PFK5BRwVnwyxZKyx1wYwmu3IBDeE0v/2V/gDtVcF/48=;
        b=DnpQ3qmcg6JhtSpQuGVJfhprXd8Lk8KovMs3b1lpMQ7h9QYPGuORb1qMaoNqDXSsmB
         2xJnLvBiAFUkz5Kxwzdw9qP9N7v5eSB9mkxWJhmk3HUOwatk1jX4vrsB/tyCOnPHVN9A
         VbdO6XaiqbdDv1+J6mmVzMzlGZB5M0kZIfz/MwMm06fld2Jv1xPUMidDuk2f0zmGZ7ZP
         ONWb5nlXdEWIODPK8wmdrPQ4kzdcDiCN0IuBWGodv+yE4ShMPZVC4fT5FAIsEKUFFFHG
         7/yHurQ+aQg177DqOrPl+0n9DsE/ZnyWOtW//Ct8/dygn1zpatVEormw5uaolF9iK5ZH
         e3eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786024451; x=1786629251; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4sOOBLBKcag5iUMRwqkJ8znKtx8rCb+zvPUFnOSNfDE=;
        b=haF28zNH+iN4aF3v+sgeCFU6uqWVOvKPHw7r6xzHv17ikdwY6GoW27a2utPnYdPIvj
         mr5XoKnbSMsjWtLEOKRudXTNtf1xeIqQBLQ4aYKpu5H+Eib51TRQasIb6mb8Gf8Ob+ua
         zoDSX8u4vgWCe6EqA8Hu1hPnq1znU2j6M6gSGrX9ZhSsfhkBOLMpaTG6hOTt1tGpMfzu
         kUtLy7dyCDLduP/dB67VJJ+jD5jj6G79JdjxIqHTW2RHKWQAHI2XlBUcSULui78BQcSN
         vnAO7D5aqYmH0qcLTqLi1iv8P4XlOXHfjCXNlk5bigMCKGQWD8Dhxyj4oYWSavPy/46q
         GXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786024451; x=1786629251;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sOOBLBKcag5iUMRwqkJ8znKtx8rCb+zvPUFnOSNfDE=;
        b=SvDY61cZZC+qe4ii7v7vKNuT7WosWz34bBWsGD0hKRoPtAN3An0Lgd8G1wU3gYmYgF
         wMuPwA5SLQmBQVKUvBnY9QJ32H/v4htk7ma+rft+gn5sleQPvXnmZtesGhkApVIy7M6W
         xtQd6qQV2wTZEgi6pp/bBGtxlKmJIeszov4/YNvGzCYHe+FO111I3Hl8e2fahQFFxHM6
         9aXo5cJZ8xoQrJWacASQhY29Q4aqg0oNWHwQg9rjuA3Iv/0FHpCIF3fKOdK1Y1uc8Uul
         xbvUcRKb0oXgiLfHQHdO7WzoPdn7BY73qHMz2VdBA0KGSrbU7mC/Bv1nB9Ulo/pUe3/D
         dJkA==
X-Gm-Message-State: AOJu0YzU5y6K5S155alflDCVNCyEM83N0M447GEE1uIB8vST7MrPgEsd
	J9bjzW9qVquJDhQNbghyC1zHZVJ6Ee5EKNGb0dovzrOsAMWiiz694ulWLvV3ajtUQ00lt6bMMJT
	+2gQ88tZbwenFqPAEg+KXroUdtwUIUZh69xAs
X-Gm-Gg: AR+sD12TWIKNCBRdRJh1AlwaO2dR4TwC4Q8ixQaXWOzH3X+kbUhHAyQ2MuHlZDX61Cq
	MIf1PcUGkonLAFAFXao7xlPpK2R/WVN9/OfYSUSkSgCn8fBtBin7gDPS4VmsbLmkd7BKnvC8jmz
	cWGB3OzNT/vWgZqJ9l4wielueiwQUgyw7+VjbcquCSKnM5208hxeziXsyo6QZwZIymUf5HPNTQJ
	TKIi4Aw6acVZRAeKlirZAjXvCYaTJNXwnWrq30s9zguGpNRfHSYqywBhgxw+0qIYaXZ6LUNJgIX
	8teDeoSkP+//Rvct/WajQRja1hZHEDgjgnL+wwwP/2K8ZA==
X-Received: by 2002:a05:690c:3341:b0:80e:dc2:873b with SMTP id
 00721157ae682-8213d782d53mr27518027b3.16.1786024450754; Thu, 06 Aug 2026
 06:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: William Roberts <bill.c.roberts@gmail.com>
Date: Thu, 6 Aug 2026 08:53:59 -0500
X-Gm-Features: AUfX_mwHcNyslfkSP9hCpf3Pa-yAFcOKHOvISMpDO3T-8y7LzQ4waC47OVdqk5c
Message-ID: <CAFftDdrZtJCtYaTQ91_6LXrXXO0V4=vdVKaUtf22-qXAG5RgmQ@mail.gmail.com>
Subject: [RELEASE] tpm2-pkcs11 10.0.1
To: tpm2@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

This was a quick little release to update the configure.ac script for
downstream packagers to make life easier since in packages you cannot
just patch the configure script. Note for Fedora folks, I am looking
at updating F44 and F45.

The release can be found here:
  - https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.10.1

With the following Changelog:
[1.10.1] - 2026-08-6
Fixed:
- Revert commit fab314 - "configure: detect --prefix when checking for P11_KIT"
  - This will fix all of the work-arounds in package scripts.
