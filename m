Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662121474B5
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715867101; cv=none; b=YbfJaPglRBvAZQGvKLEwCMITVhREbZrdPdT5uFD+eifFA8Q1TuxXSI5pkzeuWI0jU1vCvvozgGCMUuNb6cYnS8ep+K4bs7Ogb0ktTlXUEqdkGboUd1XU85msU1Al7r3+jqcDg7BYTNnhFhm4zuD/OZ4B3CgAWig4JUmG4ZpZZws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715867101; c=relaxed/simple;
	bh=xFxF7VauJYUaJSP89x/44UbXldnWA8HtRpcPHQ2dZZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iytHs/9TVvVgkUnQABox6PGd6hFDedpjrdb4Kysgb5u9wIhzy0x9Z6qtMIvI7BYtAxXVk37QJ+PEWZvm/JrHqNBb/dTmeDZH7/ZR2D0fm7OR4aKwc7lTuLocsuuSyeQu/RPmAJ3HKrESCR+s3Cjpz/cpqXMXA6D6fpo/hsOQ1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hmrv7gKk; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hmrv7gKk"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7930504b2e2so35740085a.3
        for <tpm2@lists.linux.dev>; Thu, 16 May 2024 06:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715867099; x=1716471899; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fn1qVrJouRiZEZ1tYL7AOUpYR5FXpEEUfEg/0C0pbVg=;
        b=Hmrv7gKkq5MW99szcMK6Y3idp+V7tcCR1sw/UAD8ZdC6PgwxRSilUw2XYgHwnvF4RC
         +clMwUo3PgJWKHwSJwhLvdd7eWeRNGS3UHKbklgXf/y+a5xthGo7OX25a/+j2JkB15XU
         wVX0EH8isW6TJ2u0jGLb1S2mq1U1ZPieqrUqCe1INHNhjNQMZx8dIgOj0j9T/9t8sujR
         /zdTrK/5SVrxPatqPd3BNZKew13rp7oh9bFQuKuLElDisTrDfraiF25+z7TZw7xkX4Q+
         W4Jf0xvqh5jVjC8CGvOVKp63WKtr1sUPZPRaKL4b2Hqgv7jxQhtRf/oa7rP3eH1pQpsw
         XSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715867099; x=1716471899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fn1qVrJouRiZEZ1tYL7AOUpYR5FXpEEUfEg/0C0pbVg=;
        b=eriyeSs3IHjcLfQHGj2OxyCbWPobKk9licbiB8eEX+ZKrrEREnIQzjvMhqjakDVzQ1
         KrNFvYdG+NJP+KSqlhHP6FI2JJBqT3eUzYGy3kkZhkjOSZOkGxVxVcHO0O/WEpHRCVmz
         VWwsck8YXn1rwkYouFOuODi/UqmSIUTCZNxQbt6PX76aMB1k7LOhUIpxlNvF8hQ94WC3
         xMoPY4+InhQIXJvPtDkj/BIqnP+qB2ovEd1wmT1eCiOXhExrFBzcOcR5a+Xsi780j1CK
         HrU81NKDFWXzj5oxRIT81ozs8YlpwOtHTGYzvde/4dX2iqYg0SN4NRMANlPu7MjZ6kJh
         6cuA==
X-Forwarded-Encrypted: i=1; AJvYcCVln6h6Rwh2ig5F3mw63KBG0PQvEIRo9MTnvJx42BwWT23xPtoISYcuznSPYzx2eF1G34wHf5RIbQPWRrFCeDIECwTo1Q==
X-Gm-Message-State: AOJu0YzMUn3nQGbsx8a/Ve4ptg4KKYrNYv5WCXQ4frPemdnOJHfMNT2m
	rznROJ5gTZ+0e1kk9vJaZ8r0Gopvws7toYGO3Acfbgas+bmqh5pW
X-Google-Smtp-Source: AGHT+IG27pCViqXO8Y7WvtyCo4iapS9HZRPbr2p6DODcC0IXUtkIUb8phMmSFMpdadi9HxE+6tbHQw==
X-Received: by 2002:a05:620a:f8d:b0:792:9ca6:4e22 with SMTP id af79cd13be357-792c75741a0mr1775480185a.13.1715867099219;
        Thu, 16 May 2024 06:44:59 -0700 (PDT)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2fc7e4sm805079085a.97.2024.05.16.06.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 06:44:58 -0700 (PDT)
Message-ID: <56e9bb39-c253-4ce3-b3bb-1c3480a22fa5@gmail.com>
Date: Thu, 16 May 2024 06:44:56 -0700
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TPM2_Sign vs TPM2_RSA_Decrypt
To: Jarkko Sakkinen <jarkko@kernel.org>, Andreas.Fuchs@infineon.com,
 tpm2@lists.linux.dev
References: <D1AZVM0QQF2M.1SZHF66G10XK8@kernel.org>
 <c8c85a062358420ab13e849a902606cd@infineon.com>
 <D1B2ZP29BA7Y.3OYCZMEP3MLGY@kernel.org>
 <e6ac8dc493f04fdca0469f7df7735468@infineon.com>
 <D1B3UAYNEUQE.3PHLGENN3AYKM@kernel.org>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <D1B3UAYNEUQE.3PHLGENN3AYKM@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/24 6:31 AM, Jarkko Sakkinen wrote:
> On Thu May 16, 2024 at 4:05 PM EEST,  wrote:
>>> If someone could really put TPM2_Sign into nutshell that'd be awesome.
>> Well, TPM2_Sign will perform a signing operation for you given the key.
>> You can set the scheme in the scheme parameter. That's about it...
> Right. What about the ticket? Can you imagine a use case for that?
>
>>> Maybe a dumb question but what I could possibly accomplish with TPM2_Sign that I could not accomplish with TPM2_RSA_Decrypt and appropraite ASN.1 heading and padding?
>> Yes. If you set TPMA_OBJECT_SIGN but unset TPMA_OBJECT_DECRYPT. This
>> way you can make sure that only signing-padding can ever be executed
>> but never decrypt-based stuff. In order to use TPM2_RSA_Decrypt you
>> need to set TPMA_OBJECT_DECRYPT which is kind of weird.
> David, did you have a "framework" for deciding between these two
> when you originally implemented the patch? I.e. did you consider
> TPM2_Sign but ended up to TPM2_RSA_Decrypt?
>
> Not meaning to blame just want to go fully through this :-) It
> is working code after all.
To be honest I started with encrypt/decrypt and included the signing 
operation because it was basically "free" by using tpm2_rsa_decrypt(). I 
was not aware of this distinction/difference between that and doing 
signing on the TPM itself. I don't think I ever looked into the signing 
command on the TPM itself.
>
> Huge benefit I see with TPM2_Sign would be probably that we get
> ECDSA from the same functionality.
>
> Disadvantage is that we can use TPM2_Decrypt, i.e. single command
> for decrypt operation. Encryption side is done in the case asymmetric
> keys with software as it is done with the public key.
>
> Have not actually looked at yet TPM2_EncrypDecrypt and
> TPM2_EncryptDecrypt2 (do not know even their difference).
>
>> Also, if you want to use a restriced key (formally called Attestation
>> Key) for regular signing operations, you need to have a
>> TPMA_OBJECT_SIGN and must not have TPMA_OBJECT_DECRYPT set.
>>
>> Those would be the reasons for preferring TPM2_Sign wherever possible IMHO.
> Actually I think in our case it should be non-restricted as the
> point is x.509 certs not proving TPM inherent properties.
>
> Also section 3.5 seems to support this view, if I understand it
> correctly:
>
> https://trustedcomputinggroup.org/wp-content/uploads/TPM-2p0-Keys-for-Device-Identity-and-Attestation_v1_r12_pub10082021.pdf
>
> So technically I see TPM2_RSA_Decrypt and TPM2_Sign still
> equivalent in the context of use case...
>
>> Cheers,
>> Andreas
> BR, Jarkko
