Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AC4313520
	for <tpm2@lists.linux.dev>; Wed, 27 May 2026 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779915142; cv=pass; b=h1VgYrqe7bmuyDNl+oiRwEVf4tRjp5qknIlsw11GMEnEKdkk7TEjMCYMc9YgqvI6q/s7nOLaq4bPIt/o7E+yEWO9teFMttzlcO5AHeP37C/ke0j1Lx/FThshgPZLhL50M2vgJrb0aKedcrx1vsDr37PM7A8gZJioOrVQ1Mgm8dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779915142; c=relaxed/simple;
	bh=2ghpC1qxiVbnim/lWTIq+aX/WW+fe5k3Rjao3KA8Uho=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=gQvKNkYkSDtzPAkc9knBJpJIdpadbZnwZr9nDBQkxwlgMfJoAju7LU1CaRmUROP3zkmvYX4aPvVftbJDnu1GUQ/hzjt9iMqP/PGuEEiomyFd2PXbsQ4B7n68ExhNfB+pMPljWuqWl/DdLwiYEoq5VONXRQOww/Ajvs6L6w2So40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdzIjgEX; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdzIjgEX"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8bc3ef10cc4so163097336d6.1
        for <tpm2@lists.linux.dev>; Wed, 27 May 2026 13:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779915140; cv=none;
        d=google.com; s=arc-20240605;
        b=CHfmILJW1yS2JRoKLTvnr2PBcBH8T11MnNi3uj20F1XZYSePSzGrPhoSTPIZpd8+FB
         QqGp41U3XsN15dwVdMISOn+ZSIeiG3jQNXaQAWnFB4BK0LtCL5M0ySePF/ccKxS6JjA3
         67FWhxgFpLU2Lb46loV3XjsqjK9PfKrx4E8jBq2e6GyPRfWkqOd5Bs4zAIRP0c5qr/Mn
         57xTIjTOIWy6fwdSduEbCJCAViKpXNltjJ54W1kDzXvLh06qZ6lpeTml78crpasf3obg
         LGdl8/KVZFgLYadJBFY1kdm6xE89P5aZAicdu65NGTdKBfkA6iVfY4qeNpumfnYYfpir
         /2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2ghpC1qxiVbnim/lWTIq+aX/WW+fe5k3Rjao3KA8Uho=;
        fh=PFK5BRwVnwyxZKyx1wYwmu3IBDeE0v/2V/gDtVcF/48=;
        b=KbecQGC9NVF8VI/lCTkrocxGpmsr9Bm2yl+2a2QAq77Dege/ON6BrSTk93PtrsbVfA
         IDCYRfUbrvIf/rU1MM2HrASfoAgBhhoD17RXQ6Pe4HfpS7FZKdHdi3ea70//sEPH1mxy
         KtnxtD6V7mNTvhHJvzivkCYkjh1i9ydPnp75BFF7y3okUPV4OoY/dpn8H+aUpvWCeWLA
         cG6bF4WzlZEnfse1rj/7mIt0P1WfjlBQksMNFN9CEZgf7cpM5MoIr74TWOO8LUMLa9T3
         z5O3GUU4MWbBZkMJChH33UrMnydvMWX8tZCqnm3nJpJ7D2YuaQ4DEHc1Yq5eg2B0wkVa
         vZmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779915140; x=1780519940; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2ghpC1qxiVbnim/lWTIq+aX/WW+fe5k3Rjao3KA8Uho=;
        b=WdzIjgEXX3gbGVaKWgIxg+hvrQCi8CQo9ZQCQh5RTanTKppgUHw4SF0KKpbeiJWius
         A8txfoswj2NQpNOF7POriNlRiFnUygjxMvo930Vyavig7ol6bRU4aIIFBxhoYhKHrsPU
         w7CtsWvs1VX/k0iIcDq1a9JSwRv6O9ldZ50MoBheDGJeCRrkjtbtjMKKhzeVAZQvyyXG
         42C0OcuCsVJx7H0Yv0zhy+5MENRk94SfX7/9+htEJVnIt6pKQUAg8yd33PN+hW7GDjtM
         H8eV+mzcyibKZQxILY9kIzdSQTapVw5OA+Kwj2C6b0ZKdt+KyE9jPIYJs3DK8/v5FJrp
         VI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779915140; x=1780519940;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ghpC1qxiVbnim/lWTIq+aX/WW+fe5k3Rjao3KA8Uho=;
        b=chNnDEb+Wbo9BWnazNnZzdX5DSj+e860mmiVDb4iSmdaZ9sZ5OxFm3d33lOpSLGWs/
         TUrxo2T7AAnS83VQh5nupgLIPK1PZis41tc9t5cKohRLnY6LqnLGezY+9WIy89Z2ywzB
         kQ7YhXnHdMUVG/ch+xYAD2q83F+dW6PovzT+V3FkDRxTMpeAhhfjqQxhBF9k6v8Vex8Q
         CPGp7BhqWJbEjAo0Hmf0vT2CNx/KmXZzQt7JE0wJeKyNkSrdko1U8gjOi5mqNVxC003q
         ADFfCBJ4xTL4VoyBpAVwmTlfO5+8rjuOL2gsxkoUpkVVxFVqr09Zb7RFeEJN8mHDQ5jC
         dbiw==
X-Gm-Message-State: AOJu0YxFI5IVN7gyc+7VXBR9g9vE76PLPgdpxy5FirW0gPb0evTeQkCR
	6UesCWXalv09rZcvzVeMbYA5Gfc5Z5RMlCBoIHsAfKCCoKeuJGj4mx4yn+QeB/jTLv5BpJLGGTT
	QnlVtR+ZZSkuyOh/lZM8ZF3oERNInyRI7hp25
X-Gm-Gg: Acq92OHT803Ze/R2M6FhN1iQQPKOQv+8vm805q4Aegse7nEkvR6XkuPGXO54h8c39yN
	E1C68UOu0dwUFXAzAiGqpTl7K1DzQIQdyHqP5dmTG0RoT3XtZtfcGKhs78vOjrrLpQGd/9FpZwL
	nHaH/BoZticgajpStqTq7DY5oPSEBR/lIUAWVoNuv+4urqERfGp7nBM1OCPZo9eBqRym1JtZoJ5
	x11Z68I4m/cvT0p/8ZT9uaWeaKrBZs4yTxAYZevIm4AnoFrPcjfEjdVy3BkSb8KQwfzSB5LbVl4
	QvuuE94CBvLSDH7c9n+mBalOOo7lyrs4Nkc5wM0gvlFZSydRRi4=
X-Received: by 2002:a05:620a:2a0c:b0:912:5d2a:4baf with SMTP id
 af79cd13be357-914b4a4861amr3600430885a.61.1779915139637; Wed, 27 May 2026
 13:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Scott Stephens <stephens.js@gmail.com>
Date: Wed, 27 May 2026 16:52:07 -0400
X-Gm-Features: AVHnY4JaDW8Y8nioBfni3KmY71xj3MYVjSCPETBUpZim_HuEbqqxloth_PnQ7CA
Message-ID: <CABppgTcx=Q62MZDm8xKYTZspwAH16vx47B4vVt84Nzjif8ZFvw@mail.gmail.com>
Subject: tpm2-abrmd vs kernel resource manager
To: tpm2@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I've seen some references in the tpm2 documentation that suggest
tpm2-abrmd is preferred over the kernel resource manager. For
instance:

https://github.com/tpm2-software/tpm2-abrmd/blob/master/README.md#tpm2-abrmd-vs-in-kernel-rm
"For the short term we're recommending that developers stick to using
the tabrmd as the default to get the most stable / widest possible
support."

https://tpm2-tools.readthedocs.io/en/latest/INSTALL/
"To enable the new userspace resource manager, one must get
tpm2-tabrmd (recommended)."

In contrast, Arch now recommends against tpm2-abrm:
https://wiki.archlinux.org/title/Trusted_Platform_Module
"According to a systemd project member, using tpm2-abrmd is no longer
recommended."

I was wondering if anybody directly familiar with the kernel resource
manager and/or tpm2-abrmd code bases would care to comment on whether
one of these is the preferred option, or perhaps under what
circumstances one might choose one resource manager over the other.

Thanks,

Scott
