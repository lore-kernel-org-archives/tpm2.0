Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8391A1A0BE0
	for <tpm2@lists.linux.dev>; Tue, 30 Sep 2025 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242694; cv=none; b=lhormWKeQhuvxcD6DmOK9LmYd70b5LN0ceegJb1SbMzQfmJ8IxT7WdVn3rTdHgPs1WIuJdoRkf+Ymr49juVTCEJj783DG3lP5TuoalnfqWyI3TeHf9tD1qeqkJ6PxZb5RzW278dlK6s3XF1rV2USccC0ujO13q76iwOE5tK0OlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242694; c=relaxed/simple;
	bh=JLK1DaQMGtsyEDHILGxgjAd3QxdA6dpOHw6xA2jlT2M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bW1jcBp+PmecT79Tamzqr64u1MDGKVojG8bFqrsFP3oxPY+WpaYsmj9DdDC1pjP6HvDy1EWblrk8lfJc43yUs9wdJqD6JkXeYAwNYxDPHT+Sxqb2ZInBBkctycjgy9DfWV2mi5Htx8mvjUatI9nafMqtWK5qJMBQ4Fao8wSGzoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAS6AHre; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAS6AHre"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57933d3e498so7051998e87.3
        for <tpm2@lists.linux.dev>; Tue, 30 Sep 2025 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759242690; x=1759847490; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nMko4euYgVTMRbpyVvgLAyVDo096tlboFjTX/sZLITo=;
        b=aAS6AHrek2egcsjnG7o1ge3UdPXI046RFOoyL0baQu/PfwmWccpbl16cmAa9g7AyqU
         OlaAkPc13LYVeR5RFd5SBpOv+W+eq3trf+2MFxWLlpZQgUK67ujve4zLSNw5yld61vUV
         31z544UEZxq9bwbYvCk3VxkoW9f//6J2cdR2i+sHHu55jihGRvfzYuX9xYY3O+W41Otw
         Yf7uflVRYpIyie6GXG1+jrRzoNcPgeeA/rw/626JmUrbg01oMvsRKsFnD3eI1xm5oTMp
         5OZ+QNR9lXklDyZEI0pybccdsqowYSf81b73e6qWVq1iPftTtpQRS3CLn9i9Mi8LIOOa
         Rh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242690; x=1759847490;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMko4euYgVTMRbpyVvgLAyVDo096tlboFjTX/sZLITo=;
        b=WWrWWl3dyYyBdQYMEET86WNiTJYsP/8MW286DducPbKQHfr82uavAdPArGEbiTzsiU
         SEeM7zJ7P/O0CYBgiNV/5W+bZc5p3+j+8J8r51mO7KRmP96fPyG98ehz1rtyjWjQE/2z
         pc9uFKTAv81RTxQByfOArZnh9AUGobkTRjEFSb6HvD+B15YixPbAPnjVTurBZGqwmVbU
         wMXx7QgljE8B5tnV1cQAUGK7ZNBg81he48elmrmwUy7WCcZbAMj0J1CfKXh+DqEjaCvZ
         jBDwECNrhQVp06ZA+faIZ8MGQ6zfULNFkJzKaOooaH8uIinhNkaIfz6szJ6DZ7mcyimE
         rvUA==
X-Gm-Message-State: AOJu0YzKCROmPRvi3zc6aYyLhUC3xNL4USKJ9dq7+0mxK9lKFrqPl9Ni
	NRPRap7aRNdpSMQ2BBbFmsTxGYaTUxWoHu614oXV2dRO/IuGsHCh5Mcw7t//PeMvC43EgGfn6l/
	qjJ7nkZ5zqaKF6+ZzQQ9y73Y5kAnPxhSsp6FJN2U=
X-Gm-Gg: ASbGnctp2g1wiRUo1abik9D4iAGFhjlFd+jvxXCpbZ5Ro46knLkdkEmi1BJmQ1V+Tfh
	3skZ+lMjsuEKOcz626a6irPix993En2lSNiTaBxUL/MHQP1BN0v4jWoelopBIaJ3ZfGI0Sm4kO4
	wZ/UEnuSLsJQGylliFKoCGG8XEO8uwaUMnqOG168itSPUBoapg6tQWHzx5zTVxNegxtuZWvcLyf
	lCABQxMzBG8USMJ1TmZy+945IZj
X-Google-Smtp-Source: AGHT+IEjNdw+FfKTFnw7SqyJAm/zizdhb8jObenznjmBwgrj1GAZH5ANIKA4NlBsg6p5kvO5VGwmonrIp984nIWKrB4=
X-Received: by 2002:a05:6512:2c8f:b0:57d:8870:e97e with SMTP id
 2adb3069b0e04-582d2b4aee3mr5660575e87.39.1759242689756; Tue, 30 Sep 2025
 07:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: William Roberts <bill.c.roberts@gmail.com>
Date: Tue, 30 Sep 2025 09:31:18 -0500
X-Gm-Features: AS18NWD-QKHFGQtY6EwfXDuaermEokBVx_UMFCVThlRRHebOK2gvUxymd5fbTgQ
Message-ID: <CAFftDdqEewrmKDAOda-OObp93z1H909Y65rm_T8oFTPGU+JjsQ@mail.gmail.com>
Subject: [RELEASE] tpm2-pkcs11 1.9.2
To: tpm2@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to announce the release of tpm2-pkcs11 version 1.9.2
which can be found here:
  - https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.2

With the following changelog:

## [1.9.2] - 2025-09-29
### Fixed:
- Fix tpm2\_ptool destroy command failures.
- Warning "UserWarning: Unknown distribution option: 'tests\_require'"
from setup.py.
- Missing SHA1-RSA-PKCS from CKM\_ALLOWED\_MECHANISMS.
- In tests requiring Python, don't override HOME as it may be needed
for user installed packages.
- Certificate finding logic in pkcs11-tool usage where `--label` was
used instead of `--token-label`.
- Configure: Fix detection of javac.
- Configure: Fix detection of pkcs11 python module.
- Fix incorrect logging statement in create\_pkcs\_store.sh.
- Fix links in documentation.
- Fix OpenSuse Leap CI builds.
- Fix improper handling of chunks across IV multi-part handling.
- Fix memory leak.

### Added
- Add support for importing persistent TPM2 keys with tpm2\_ptool.
