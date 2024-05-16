Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC974206C
	for <tpm2@lists.linux.dev>; Thu, 16 May 2024 13:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715867945; cv=none; b=Ogb655ysCtY/qap4VGq1s9RtGRoVs/4tS3BSjG7l5oF7QNjClJC5yiyPK0M7O8aautJWbD5MxSJkws6NGDnb42jvAg12Gg/bRey8CjlVlPeGFPPAeomrECLef336+fEuEQI3O8Oz9dXELlCgQTYnq+HX8Tf6btOjvvGdbGvQ3k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715867945; c=relaxed/simple;
	bh=QIpcBQszk/TuT90e7jY/pidZL/jpte6xMLa5X18wiAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=btV1M48IhiOJNE1r7ljlqBjjFchcKTNM9XS9L7clyEvzBspL5h6+tv8BTu0K4WkLo9Hw2DsWzq9STOdCmq/RzFuhj5ev24l48i6NLabPjPCjm6hcGthFcr/9qgtqKW52I8P4diqInG+2sjSaJVhnyL9r+9HhVkM9JMPKOYNrsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1hY+m3F; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1hY+m3F"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6f1239a2e83so129225a34.3
        for <tpm2@lists.linux.dev>; Thu, 16 May 2024 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715867944; x=1716472744; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QIpcBQszk/TuT90e7jY/pidZL/jpte6xMLa5X18wiAY=;
        b=B1hY+m3FNOe30kjZAUPd5kc72aCHkOE+co/mNfWIXQIVdXejzSV2AikOVVgiMSF8o5
         LJzWOOYyOnxI254Xzs0YgaQa/f0/u+0F+NAZ8fRjRHft+6H4MAT3vOzLcrB0uW0pZyvX
         +MhYjG7/Oof8OMDIWZoIQqWCNk9xGo+01mWFsoFWL6RGQ1fOxAwA4zJeRZ1I1hxCgX3G
         cVJc5wl79oPDw+s+4vbPxulESDKaep6NlZ3fSdCjVJHjISUrquligjC68Fm4j8ZatOCq
         9ToNAEHmo4E3uy5LvMwwaMR+JUmqiixdudQ/VH7AAMigRH5nHzclhC0CEb7xX9psCcNL
         6cAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715867944; x=1716472744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QIpcBQszk/TuT90e7jY/pidZL/jpte6xMLa5X18wiAY=;
        b=KayeaHF2U9S4SUrhp0ZyHgVmvpPDdjSqbAWqhNaQXD9o8HqPyRKpL1GjeooINDpku4
         aljroasVBJdvVtSXxwZEjcdg+RM82YkWBQcWXhPakmdYRT9vSL26FcQ3pZvuSBe5DKeE
         t8/+sKmatIqH8t8CAbWJBngr63OoB57i6LPYmSedDDeFHcETtO8UZaW+4d35MFOtzo1h
         hca0vrqrAecUIBUSNM9UVyR+nObj3S2iIG4Rns0yX9/MuQcQSQJ1+2o1n0Ocmh8KBWAY
         sTHQUZ10K5FWt4Y5vbia1INyGw9vLFeO6gOaSO4JpnUyshm7J0TmiYWjTgAdFTGXdNYY
         jpsw==
X-Forwarded-Encrypted: i=1; AJvYcCXsA46O23gosqu5jlg9r47RDUE/7ehndPoHDz/IfViX28U/KgUYR8TTbL6pQa9iXpLQ6hYD+KhsI1d+0iIYGoeDZ3fpFQ==
X-Gm-Message-State: AOJu0YyP7k+YjtJr/bzP6qPDX7AV3Zy4YyhObpGIm9PHMGjRlcco7k7f
	PnLN5/8WBFttWpbK6jY8SQQjprH6V+rsKE3axjteS/X8Mw1KEygw
X-Google-Smtp-Source: AGHT+IGf/MRQ1Sp7IRFrHIDwCQW1oUy6NImhArFeNWA/YyW0eJVHjw/w6E48XomdfvmfyE4H0WYeIA==
X-Received: by 2002:a9d:6a12:0:b0:6f0:e607:d57d with SMTP id 46e09a7af769-6f0e92a2e6bmr27178140a34.24.1715867943727;
        Thu, 16 May 2024 06:59:03 -0700 (PDT)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e3fbbc33dsm7448171cf.60.2024.05.16.06.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 06:59:03 -0700 (PDT)
Message-ID: <1107614a-a99d-4997-84f6-e18cc30f5a9a@gmail.com>
Date: Thu, 16 May 2024 06:59:01 -0700
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
 <56e9bb39-c253-4ce3-b3bb-1c3480a22fa5@gmail.com>
 <D1B4CE777IGH.MQ5BRAN4Q69X@kernel.org>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <D1B4CE777IGH.MQ5BRAN4Q69X@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/24 6:55 AM, Jarkko Sakkinen wrote:
> On Thu May 16, 2024 at 4:44 PM EEST, James Prestwood wrote:
>> To be honest I started with encrypt/decrypt and included the signing
>> operation because it was basically "free" by using tpm2_rsa_decrypt(). I
>> was not aware of this distinction/difference between that and doing
>> signing on the TPM itself. I don't think I ever looked into the signing
>> command on the TPM itself.
> My personal take: I'd start RSA with the working code and just
> clean up the parts for the first round. It is tested code and
> does the job, right? :-)
It was tested then yes, obviously need to verify that after 4 years :)
>
> Then we will weight the odds and cons in the review. That said,
> if you want to use TPM_Sign and TPM2_EncryptDecrypt(2) that is
> fine too, but not demand.
>
> As for ECDSA, it can be part of the patch set, or we can start
> just with the RSA part.
> Andreas, is it OK if the patch set is CC'd to you so you can
> give your feedback/remarks on it?
>
> BR, Jarkko
