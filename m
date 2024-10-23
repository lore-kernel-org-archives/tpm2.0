Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F2A1CA84
	for <tpm2@lists.linux.dev>; Wed, 23 Oct 2024 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729669360; cv=none; b=NR/PeXTuGYgvfO/OOHGuWs2p6S3Uvz7bFPy0omnWIN5TJjFc43/1g6X6435CX7KqAAykyvnQ9goJTCln1btdNBDIBEoCqPJruF+DxJD9TFj6Wha4XjZN/sHyjd0VW91XxT1F9U0Cm4TshFmexcgY+O02Jimkl7rHRWx0mawctWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729669360; c=relaxed/simple;
	bh=ZMAJ9x9b0wVBdRQKlIONKuEDpSwIXIzujkZ8lU0irEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bvIM2VsX7YyUKygPFeForstINkb9bp/AgsbW4LrlMVxVISjj6MmmB4impr//IImprNtQ0+jF0Ts5B9EDWjGfkdxNzYqXNBYreLhIXg+zgusMsWz6qOjrxEES9ZpvpubPHme2IuwCFfVgbN/TIYIhEGIveFjETmnmjxmy3SmC9Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enedwaith.org; spf=pass smtp.mailfrom=enedwaith.org; dkim=pass (2048-bit key) header.d=enedwaith.org header.i=@enedwaith.org header.b=TUUKRMOH; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enedwaith.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enedwaith.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=enedwaith.org header.i=@enedwaith.org header.b="TUUKRMOH"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2E89E0005;
	Wed, 23 Oct 2024 07:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=enedwaith.org;
	s=gm1; t=1729669355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8DrtYI05niLzlsj17VKgJjN8his1RlIsckoF/zp9sos=;
	b=TUUKRMOHNa3cs0tNVD/w60ZXrfcHISHgv4hLUdvUlDO3IF2vnz9V4BHoAgpwQB506BRNkL
	xwpg5s5fOMdF5M8v/+D50CgW6YG3dHh7IjnPiC73SOuhxaHxSMeacDHFFQ9CGOOCncqdmP
	vD0/1089wjiwczU4Yuu2xKHGR6FnQsf+XIcf794TuxYTTh3C8iBlexRtqtjufmXNtfxHf+
	16+OHFvqkGK1RTpy2t/o+6p/eueqvrfqZPX9q6J+GrCWiee3XGCYNrc4i/Ec+k1VkB/GLv
	2RhIUc0FSU2YvE+GuuUcq4XLCVAv3ZUqE/8ULzjYjaoO0Y9trXea4GI2PwWrZw==
Message-ID: <984200bf-6d66-4658-a8c8-f742d5d3e683@enedwaith.org>
Date: Wed, 23 Oct 2024 09:42:34 +0200
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TPM error 0x0902 every 10 seconds
To: chandler <scar@riseup.net>, tpm2@lists.linux.dev
References: <1f97dff4-3920-48c1-b8fc-424dbde64a84@riseup.net>
 <bbe0cfcb-5337-4d8e-9746-e0520bbeb551@riseup.net>
 <27e317ff-f134-4474-9955-16c6671629b7@enedwaith.org>
 <173c6a6e-f47f-4fea-9331-baac2b7a248d@riseup.net>
From: =?UTF-8?Q?Laurent_Mesur=C3=A9?= <laurent.mesure@enedwaith.org>
Content-Language: fr, fr-FR
In-Reply-To: <173c6a6e-f47f-4fea-9331-baac2b7a248d@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: laurent.mesure@enedwaith.org

Sorry for HTML reply :)


I think that the 10sec delay between each error is maybe because a tpm2 
command is send to TPM every 10sec.
Is there any monitoring using tpm command?


Le 23/10/2024 à 09:33, chandler a écrit :
> Laurent Mesuré wrote on 10/22/24 9:04 AM:
>> this is the right place, but this is not a very active place :)
>>
>> I had a look at your issue but i didn't find anything usefull.
>>
> Oh you are naughty sir, top posting in HTML! almost making me reply in HTML!
>
> Thanks but what would be useful?  I'll get it for you!  There's gotta be
> more to it than that!  What does 0x0902 refer to?  and why every 10
> seconds?  I guess, i could try asking Debian tpm2 team?  File an issue
> here https://github.com/tpm2-software/tpm2-tools ?
>
>
