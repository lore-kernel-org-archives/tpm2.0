Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600C23D16E0
	for <tpm2@lists.linux.dev>; Fri,  1 May 2026 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655309; cv=pass; b=HzwNWOMoreHqUJdXaBVSLwOSPFx7qDBeGm8QeQ4oHYK78n6MUUD1yvddr3L/yKa6e26JAJSJKVZ/A7MyL458CmDd92LoiTpXHlC4HNz3QfghKw63n1n49OSggDi3U3enfoKl+ivlYDwsWT+9AhgM2RmztapZgjd+0ap8K3bz/uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655309; c=relaxed/simple;
	bh=+jWRDD4SQt12WiBSPq4Pl2IKRdBxMeFBr+rIjpzT5Vk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=W0law1lLefLfD6nox5pRF0gT7Tt+UU6SxLuo0awfkaqzZVXggiVqRz95Fzthb170jMANifxveQnbN5+V4A9MUojepWFBLHtPSrF62W0GBBGde4vSwQAJXEan88WDuECU4q9ZiQJ/kgxlp2N/OGYMGcAYRLdO9wiC1Uy5NrHin5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/UsKsMH; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/UsKsMH"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-651bc8f864fso1511077d50.1
        for <tpm2@lists.linux.dev>; Fri, 01 May 2026 10:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777655307; cv=none;
        d=google.com; s=arc-20240605;
        b=biX5YmMko/cN7Om+WYDXsYcInZt7cIEqyWpCSD+jz11d3kKJAcEpIg4243qYanDEzZ
         AWs0d3rrVLuj6bEvwCZH4clZDrhURN3rHluKUyEkS+SxarHBfeucTKhFoO3EIT9yKSr8
         KqLPc65WhTI9DsUJoRMKPgFdumfe+nCiuSvCPPniNe0g1t4/vnGrpkb2st6/udBDlnfs
         3wKOxTgki0KqORnvC/JNfeMp+NlWyUyOPluLrJdKKkfOoi2Lk5vcreD5ZoECT0Pwe1Ac
         xA+6jwEvH3b4MYUEzN4m6WPU+WrAYlW33v6BjEt1WwmW2CzXdQidgi35MhIzb7WBWPTj
         CEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=r3Kq+8W4mAjy2F4kK1Dsa8FZpAe/V6YcZD9AJwHiPJs=;
        fh=PFK5BRwVnwyxZKyx1wYwmu3IBDeE0v/2V/gDtVcF/48=;
        b=QGjtcF8TZo7XxqxblscKol1IgpjAqnKZYYbhtZ0lmGwRFGjjNefkxaMmvmp6WXvbJm
         6uWUkzTnkHAeOTlNtd+4qE2iRum+RIO242tZWruO2eKfAgQFU8tQbSHSgcUligDeKJIO
         QZZpEez6OZUwlG9UcfjFbQVkqlhT0ZopMLc5G1pTupMaKmbi8OKhHyTFUYKBSssvKsFt
         gginLTzoKyz5snHJkpYoztXEpRtOh13JO6TSLj+K2EjGjERLGVDjnIrLBqKH8t4mNqzE
         tEYzEIK51JgnFax2vmTIDJ4AfxLlJef+Lov3YsdqkZyK/o8DmsWDglI4VNQhcEQGaWhA
         qhXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777655307; x=1778260107; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r3Kq+8W4mAjy2F4kK1Dsa8FZpAe/V6YcZD9AJwHiPJs=;
        b=d/UsKsMHMzgh/5RWtKTckQHo+5pmWep0G7StIMLxHfChCzdf+ELseQmJ5quzj088y5
         Zl0aKGl/QbWtSdw0s9eTHPK1PDg79WAij8rWNTEM5F+TQjOa1Wvrp8Pr2ihnTOMPA51q
         AsiZn+PtPpIPPoJVUnUxeGNnIANGFK7zvrMMJm6WfzgqpOEBjpo60nFKmIdyd7dFbR9C
         30Gg0V6C6DuD27+ULaqf2+oHtw/aq16yYqxREXjfrdk4lwTkRbmitL/NXE8LP2W2IoC9
         gX6+0OZjD5lBryHzcCIJJqH+UIrQgqe5sIlzZe5cHqQmmo0/mzf7fBRsC/X/y79hZHG4
         o64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655307; x=1778260107;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r3Kq+8W4mAjy2F4kK1Dsa8FZpAe/V6YcZD9AJwHiPJs=;
        b=iSKYzirOT000ZbIGxMtuaCPdNYqgkRK64EzJOMOvHH4Ddse1ndIhVK7eTNZuxkBLMH
         udKd4pW/Kf/vTpmZOMnW8yi6o4WxAnnrys8N8zqKrvHZDL1PG0f/9FgvuVWoDp8+A8bJ
         4DBzuWeLxhEHj3jqx+GKcCnViFGKnyvPyW9MNmk4QMq3KVMmqM0jZUU9mvRbttqG4ENm
         EqlBGOxI/2hhXm8kJHG69gEg31YQH5dfVufrvF2cNHfheSlxi4Rnd0bKQ2qjcmDRm8hO
         0YYS0yjk+P4Gn3vs4RQzqavuQVHBhWdPO4nr/37qbaiDYOC75UNP7x+b8BRSODiZTXKn
         BMyw==
X-Gm-Message-State: AOJu0YxpGUKJG9nW8t2JmTSCNMV+Xk3TOxVe5bHTkljx9zJ+YneAGAP2
	16bUzfolqrbOI1dSB/u50olQvXFPYgDxy4DFmatSupzn9cWL6lmx9K27oi5jr962vsFruHELPre
	NBtuJmEZBI3D9Iwy/LCIsIg1DX/DmLwKPCLtc
X-Gm-Gg: AeBDies1raRRsTF/DqIkhv75ljeJIa8pBY4Snb3C9uiChnzupB0++diexQvqeSf7cAb
	QQHEgOAsBc7EL1as9OO7AK7YvuGokOOBW+VIoXc0MivsNYgsKPLYq1gVCfzx0AD0XgO3AgBCB8O
	wNkwIYlKCC6SKMH/N35mR5mxTKDGTRf9I6Vye3UQ9top2RPshlnLxegX4W3K050tD4OhlH7dv55
	ubHDuiqni5nyhJjHB+dgjoWJZU/zQzNw7tYb2KHUZDkPAzDCEsj/D5pic8ol8RzjQZJWp+yOulO
	f+4ugxu6J143GqEX8bID
X-Received: by 2002:a53:c450:0:b0:656:7cd:98e4 with SMTP id
 956f58d0204a3-65c18cca8c3mr5641109d50.16.1777655307249; Fri, 01 May 2026
 10:08:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: William Roberts <bill.c.roberts@gmail.com>
Date: Fri, 1 May 2026 12:08:15 -0500
X-Gm-Features: AVHnY4JomkqwCYaJ2AKHd-d1dzyzlg2Vh9gR5Ap9V0HdsWiqZIoqc1GsyXSU0nc
Message-ID: <CAFftDdpdw7RcdLa3iuFWtQyh8m69BppQEyw6rv2us0SL3v+BEg@mail.gmail.com>
Subject: [RELEASE CANDIATE] tpm2-pkcs11 version 1.10.0-rc0
To: tpm2@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I am pleased to announce version 1.10.0-rc0. The minor update bump was
to do a DB schema change, but the API remains stable and backwards
compat. I also would like to mention that users should skip the 1.9.0
release and just use 1.9.1 or later because of a bug captured here:
  - https://github.com/tpm2-software/tpm2-pkcs11/issues/805

I will also send a separate mailer with that information to help
disseminate it and mark the release on Github with a warning.

The release can be found here:
  - https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.10.0-rc0

Thanks,
Bill
