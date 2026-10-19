Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439428;
	b=aNGbGDNfqT/zLmQWYoNUI53zax6hJQR6W3wsDPJRa6h+pPNaobE1HIYNm55xC9doKe4b
	 rsPkclLBql5uL+F/+3j4CsGOIGZyfyX1E+Or72QxiOqiI3Dr55MhTvm3W63J7XO7iYi8d
	 JGmcqDhB4pp+CVEX/qiNasjDin2LGEgpFDdpmLIhWLpbkH0bUm11M5yfpYgbuvOTro+89
	 dqVcdeyjxJm3TUQz52nICk9qTKBPSlVV/GynzdB5nLnx5SXY0KrzdspW/0VV1EtEOXxnP
	 axbjUxDTsLnKu7BabIzqkkz/TKOZdWgdVf2qbEl876fSirQUHTSdAtwaZe536YxtZpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:From:Subject:To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QhWeryMRzrz0CyviQJ8laHFTg5PKepqRrk65Q4uGaEM=;
	b=avsRPX5eG2mPKmJQXR28hRMmSqQNzl147jWCJTsvKVCub+6PEnXsFE/Fs2iDZE9K5ObT
	 fGXwuVyJavgZDt3+VoRW6L142fw/1zgPtYaXmYoeFZVkNutcyX8DyzOsIgjc/euFEY2x+
	 n3kotXhzgogmSCmaHQZYVOK8avrDisi4hc3Yqpte3ebdPeIaWUO4vEQWOHVo3XNsPaY90
	 8xzuHdwe0n4GRt9Kr/7arD71gw7me5acSG5x/sZLVZjykONrIgEJ+S45GsakkgAsJtSOx
	 B10CaBV/dKsp2z7PUijmiUQF66awHaSdG+MntxnHc0dzZsIFUZIHbnA2wTgMxsSE24Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=twobit.org;
	spf=none smtp.mailfrom=twobit.org;
	dkim=pass header.d=twobit-org.20251104.gappssmtp.com header.i=@twobit-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=wvwZesEw;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AF0606A31A
	for <tpm2@lists.linux.dev>; Mon, 19 Oct 2026 19:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71AF0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=twobit.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=twobit.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=twobit-org.20251104.gappssmtp.com header.i=@twobit-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=wvwZesEw
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-36374abd904so1240288eec.1
        for <tpm2@lists.linux.dev>; Mon, 19 Oct 2026 12:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=twobit-org.20251104.gappssmtp.com; s=20251104; t=1792439426; x=1793044226; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QhWeryMRzrz0CyviQJ8laHFTg5PKepqRrk65Q4uGaEM=;
        b=wvwZesEwJA6jwu7fpsYaNp6j4FQD6bv3swfqEtiTwKQxRXihCEoRb/EUih8PbPpmTp
         KH36VTcsrh63JeLYgNfQYU1WlXzzwJNRHL0dwk4voqzqaMtPD2HyHowuB5LBIl0iwyQ9
         ijKtxMW5kuLLP6KOJI3NBlhYobs5h2ap6c+dfZanYlJs2X+LscjOMJxB26WYlUqunsqO
         +cBOFb4+XoFqdVuhODcAeLyRwo9UFtRG6e+N85hJU6gaXnBYbLkERTl5jIOWLciVOhSN
         qcGpIPOcHNsQL8QIfhgDvquwpLUh3bmH4Jgyz8Xe8hR6CdFd4NGUzHaNMghuakcm+SGi
         U5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792439426; x=1793044226;
        h=content-transfer-encoding:content-type:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhWeryMRzrz0CyviQJ8laHFTg5PKepqRrk65Q4uGaEM=;
        b=ADdoo4+wR8lkT8Bhq668Gwhds3jRXcacPxCd0VOwqZwUkc+ugnQutrJgIxUfi6BENc
         3va5U+kAOBmu9I0FuK8hGOfePpUt+s3n75PfsXZW5fJTtErAMDov58hvkzGk28hEu50/
         k7e7pMhViqMVT6v75r7zurt+zwA1WVwGDSNZqZLWyBMaE1suOt/6TxR8kYSyCh287fYO
         lNtowMGHJO6qb3LauReKOj7E36YfWtIcJTzXWqg4930a+DKySTyD1uDvAXbP26Bgh9Rg
         4GgB5bRN5lEspC47fKjbm8wCms4tUiV0FO7lpnQUOG5ZNex5hpGwMY7Dy4NtyFgExsIQ
         kEXQ==
X-Gm-Message-State: AFq9FYLQlU39yzeJlXOU26KYPcPcrQy+ekZ6I5JzsxmaMt4gUZVuZM5r
	QCrszRD3nt5DM74fcLGcHYcXUjJDTAUu3RvKD/FZmD4C7w8364MkuukSTV+lPjWJqijn3gbbTV+
	lU8WBRU3HdEB7
X-Gm-Gg: AYBFou19/4BPClf0Qq8fOMqrjUnszhn3RnGn+8Pv1cblRnLHa6QP4zYvYyFeouD7lYS
	zKILLDBmM+jlHFM9fMqXh6Ixu3Xy5HSikoL6xTV4blhLBaQ6uqNiDym7ss9XhKFLLTl2Scpgbhl
	5w3FsQYhPHre1lBt51PTO8uEo4huxSmUIQv6aX8y43VDvelDCTY6qsWpklgjUQC3a6A7km1sQJx
	x3PWbmipGGtLlbjp2GvDngQcHCgUY1YZBOaK1u2uJz7tg8HAP+1E1XnZmWWw4s//Q0Wqg0JVrLn
	Eg58qSTyVyf69kN6AgvApkcKi+UPo5il5BCLsj8sdGzNnI8uii3Q12Gim6V2Hs7x8u4O0h/xZY3
	+j98moUmm9J5YfEr8pfnBL+gIGya5qjdai7Eg38BgTTmuFVtYvXJwZ4PFgb4bVVaw5Q7MyolFwz
	PTlsN0ekB8G5CXQBmp8hdRNA+LACG3qgv5LJmda0JP692OBZMHh6gLlvFLThgqsmkZqajqdzTks
	DaF4NbsVrNsKG8sSzihTZhxAOgiZ9oFcC+5cvAZlHShtg==
X-Received: by 2002:a05:693c:88c9:10b0:35b:fe88:d053 with SMTP id 5a478bee46e88-361a2052c21mr12275949eec.23.1792439426377;
        Mon, 19 Oct 2026 12:50:26 -0700 (PDT)
Received: from [192.168.3.149] (135-180-163-173.fiber.dynamic.sonic.net. [135.180.163.173])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm32816354eec.26.2026.10.19.12.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:50:25 -0700 (PDT)
Message-ID: <1f5fda13-4540-4d93-adaf-f0276bb89471@twobit.org>
Date: Mon, 19 Oct 2026 12:50:25 -0700
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Post: <mailto:tpm2@lists.linux.dev>
List-Help: <mailto:tpm2+help@lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
List-Owner: <mailto:tpm2+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Philip Tricca <flihp@twobit.org>
Subject: [SECURITY][RELEASE] tpm2-abrmd 3.1.0
To: tpm2@lists.linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

We've just tagged and released
https://github.com/tpm2-software/tpm2-abrmd/releases/tag/3.1.0

This release fixes a security advisory. CVE-IDs are currently blocked on 
the GH CNA process. Once the CVE-IDs are assigned, the changelog will be 
updated accordingly.

Best,
Philip
