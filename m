Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C5784DF1
	for <tpm2@lists.linux.dev>; Wed,  7 Aug 2024 18:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723055356; cv=none; b=jpgPpNTFOqJbLt26mcRoaKdCDTaFu0Fpw9bmdU4F3LiVPYI1Oc+qBTX7/nRTVdx9bqEiR+3+QcbfJY3nkApb2wbbuf3WoKst+fmHg9Bodpj7Sz9240iLtagmh0XXjdc37MquFvPrh16sExKlQeINwFVG8pxHLYO1pEwoqHgOwdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723055356; c=relaxed/simple;
	bh=Nj9Eyu3jTB2xyRCkpB/PKvNCisPGVATFa+IT6uovR/U=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=sCkJopfkbfgikncY7PSECpM2FoANTn/jxvGmjpid5CW1RHD2XrvWc7sCNYvSeEZyziX/gIFpk74MgrJJD/PiokCOnp2qPaQp7OiJ29FCYaUBOOhd0bgNMtx2DYo1Jl34REtWcJnOerb411zpC9DsXT6ya5JMhalyvtxdNjtQe5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enedwaith.org; spf=pass smtp.mailfrom=enedwaith.org; dkim=pass (2048-bit key) header.d=enedwaith.org header.i=@enedwaith.org header.b=N62om6Jf; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enedwaith.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enedwaith.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=enedwaith.org header.i=@enedwaith.org header.b="N62om6Jf"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD20CE0003
	for <tpm2@lists.linux.dev>; Wed,  7 Aug 2024 18:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=enedwaith.org;
	s=gm1; t=1723055345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Nj9Eyu3jTB2xyRCkpB/PKvNCisPGVATFa+IT6uovR/U=;
	b=N62om6JfI7JEnuuy1wj3TQC1SAO25aRnAleV9Zb9jlWKN4XsFMK/SbbEOUBvgFJ1odatdw
	Ws6+vS9VfQflYG4HC1DeSW+/c237LW+QYTfeOSQWrmU22fl0r+aqhauzXuVVg3pdhrSDqa
	ssuvyPYZMgfrJitZoJ8Sc97UdppEBNRjHvu34Lah5SJ/K7iPDz2n0JqTSuaCn2t+exXpn5
	tKOcbeb+oDBGbtM3wlIFci5NBjUJ1gD0PNzzS/CY6O/VvmPP1y9YgY0mG7zD/MQKenbhuv
	hCmz0GOs6PSVV568dgqLIdukpFFozcOWNjbr+pq6R54ENXMagvkUvI4Cqx8NVg==
Message-ID: <2cb16ed5-a17b-4de1-b9b6-23088fdd778a@enedwaith.org>
Date: Wed, 7 Aug 2024 20:29:05 +0200
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: tpm2@lists.linux.dev
From: =?UTF-8?Q?Laurent_Mesur=C3=A9?= <laurent.mesure@enedwaith.org>
Subject: Using TPM to unencrypt luks disk with TOTP PIN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: laurent.mesure@enedwaith.org

Hi,

I'm quite new to usage of TPM with Debian Linux.

I'm using TPM2 to store the passphrase to unlock my luks drive.
I've tested basic use of tpm2-totp.

TPM used to unlock luks drive may use a PIN.

I would have like the PIN to be the TOTP feature.

Is that possible? maybe with some hook?

kind regards

L.M.
