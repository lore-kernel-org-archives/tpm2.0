Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54406288DF
	for <tpm2@lists.linux.dev>; Mon,  1 Jul 2024 06:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719814066; cv=none; b=l7T5g2FZkBMn7XYD4+ZAkUrnHn8cNjGjqjRD9fg+5FtF8phcFZGxVD2RgJV7cueCqMRJZ2P2xC8yKNftWAMA2rM4MHhhKD+UE2VffDQGOeRwJJngRdKzU7o+xlgDR1KiTFyRQPUbGe9QbF0SaAfTrYGOut0BoZJbhLFqHhPhmHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719814066; c=relaxed/simple;
	bh=9NXO9BYf98GGKentCrARHg4nkGstzu7AgSsefwXUrKQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Fr7vceRY5i0k5sObIPuZYuJ9gwM+q8L2/xoAb2liWEIcKmRApdH5y9cggucmh2SErjF8N+buAzRNv4dLTJEzN2c6Ys/W7bljoYeNsYNW4pxgNqXOMwKA92NRD2a5BS4OSpuEDOUvkAZqX0wDaJdgH4qGV0sLO3DcHqZU5vK8Xf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=IPJalxVk; arc=none smtp.client-ip=217.10.52.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="IPJalxVk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1719814065; x=1751350065;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9NXO9BYf98GGKentCrARHg4nkGstzu7AgSsefwXUrKQ=;
  b=IPJalxVkdtCiGk6Z+6dRHlD4Bc1BA/TfvAvWK546tqDsw/Qt6wjAlrtn
   eKOBPOvgMcGOVs2zX459bx4/HETiQgw4G4fcM/FUe6RQgV+fPujV5HAL4
   fQjEDxfQhmffw8+PjDJELxIw1QsHNFL8MlLC8m0IApA52pC4XgHaMufJc
   E=;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="23035426"
X-IronPort-AV: E=Sophos;i="6.09,175,1716242400"; 
   d="scan'208";a="23035426"
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 08:06:33 +0200
Received: from MUCSE844.infineon.com (172.23.7.73) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 1 Jul
 2024 08:06:32 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE844.infineon.com
 (172.23.7.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 1 Jul
 2024 08:06:32 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.1258.034; Mon, 1 Jul 2024 08:06:32 +0200
From: <Andreas.Fuchs@infineon.com>
To: <petr.gotthard@centrum.cz>, <tpm2@lists.linux.dev>
Subject: RE: Can the RSA PSS salt length be changed?
Thread-Topic: Can the RSA PSS salt length be changed?
Thread-Index: AQHaygwKCryfJxb110Cz8PDv2t0zQbHhZMFw
Date: Mon, 1 Jul 2024 06:06:32 +0000
Message-ID: <adca32bf9e7c4465be111e15dab8bfe5@infineon.com>
References: <20240629120425.ED02BDD6@centrum.cz>
In-Reply-To: <20240629120425.ED02BDD6@centrum.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Petr,

B.7 follows you quoted sentence with=20
NOTE If the TPM implementation is required to be compliant with FIPS 186-4,=
 then the random salt length will be the largest size allowed by that speci=
fication.

So basically, the TPM has now way of setting it, but uses either the max le=
ngth or the hash-size length (up to the vendor).
This was introduced after we found the incompatibilities as you mentioned.

By now, I would assume that implementations have switched to the hash-size =
based salt length following FIPS 186-4, but the only way to know is to chec=
k databooks or test.

Bests,
Andreas

-----Original Message-----
From: Petr Gotthard <petr.gotthard@centrum.cz>=20
Sent: Samstag, 29. Juni 2024 12:04
To: tpm2@lists.linux.dev
Subject: Can the RSA PSS salt length be changed?

Caution: This e-mail originated outside Infineon Technologies. Please be ca=
utious when sharing information or opening attachments especially from unkn=
own senders. Refer to our intranet guide<https://intranet-content.infineon.=
com/explore/aboutinfineon/rules/informationsecurity/ug/SocialEngineering/Pa=
ges/SocialEngineeringElements_en.aspx> to help you identify Phishing email.



Hello,
I have a question concerning the TCG specification.

OpenSSL has a function EVP_PKEY_CTX_set_rsa_pss_saltlen() that be used to s=
et the RSA PSS salt length. Some implementations don't use the maximum poss=
ible salt length, but use a shorter value, e.g. set the salt length to the =
digest length (RSA_PSS_SALTLEN_DIGEST).
https://www.openssl.org/docs/manmaster/man3/EVP_PKEY_CTX_set_rsa_pss_saltle=
n.html

The TCG specification (Part 1, Section B.7) on the other hand says: For bot=
h restricted and unrestricted signing keys, the random salt length will be =
the largest size allowed by the key size and message digest size.

Does this mean that a TPM2.0 cannot handle shorter RSA PSS salt lengths, i.=
e. that the EVP_PKEY_CTX_set_rsa_pss_saltlen() function can never be implem=
ented using any TPM? This might cause compatibility issues.


Regards,
Petr

