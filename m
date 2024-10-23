Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13744154BFB
	for <tpm2@lists.linux.dev>; Wed, 23 Oct 2024 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729668786; cv=none; b=Udd7Y3inh/NCASw1x66eirGrGfgZS4rA5pyDJNjHuAhjg2RV3Gd02LESe+WU14fKKfIuWscTZclPZA3OHaX8hg4yg70c7FhKg1/sP8sDJxtLp04yXKokntw+0AYK3B3ORZldQYF2kfWv6wpzzU0Ox+Y0mGNisJ3ZCVRvyYSmWhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729668786; c=relaxed/simple;
	bh=TdGAalhKzIbi43BW3GcjEszm9QfT482BtSzXPciZbPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Rmu1stpovHqzzJI2clz8X0vU7cIPUfiGYYEK63pRaI5PrEKiMZ1dAjgL/6eSunsaCTMT00XwGbXPXcybCi0uwm0na4HMaTu9eKstJkldcQxfBGwHeFjeVxPfYY1pBFOO8FasFva7Oa/sC/1rCYjs0XkuSahA3r9k+z2Y/AdISUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=CrGYJoRq; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="CrGYJoRq"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4XYLPD1Gy5z9tdj;
	Wed, 23 Oct 2024 07:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1729668784; bh=TdGAalhKzIbi43BW3GcjEszm9QfT482BtSzXPciZbPM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CrGYJoRqhUCuC2Aub0nvwGNloTjDADFSQ0ASowKBssgRm8TdM5livHocEDvPVxm9t
	 z2F7bYh47bg6dFLmoWLpA0nqFDFFm5CtvC/VpExztRKYS7bQeIfU6SQZW0ac0SXfIU
	 Y4z1zxzYIbHa6BWd5DaSni6d7a+hqFFtPuegXBjI=
X-Riseup-User-ID: A89E3B4EB1C05F5DBB1DE8F4CACAAF625DB0CAE2D38C943DFAC71FBC6958DCF4
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4XYLPC5001zFtBC;
	Wed, 23 Oct 2024 07:33:03 +0000 (UTC)
Message-ID: <173c6a6e-f47f-4fea-9331-baac2b7a248d@riseup.net>
Date: Wed, 23 Oct 2024 00:33:02 -0700
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: TPM error 0x0902 every 10 seconds
To: =?UTF-8?Q?Laurent_Mesur=C3=A9?= <laurent.mesure@enedwaith.org>,
 tpm2@lists.linux.dev
References: <1f97dff4-3920-48c1-b8fc-424dbde64a84@riseup.net>
 <bbe0cfcb-5337-4d8e-9746-e0520bbeb551@riseup.net>
 <27e317ff-f134-4474-9955-16c6671629b7@enedwaith.org>
From: chandler <scar@riseup.net>
Content-Language: en-US
In-Reply-To: <27e317ff-f134-4474-9955-16c6671629b7@enedwaith.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Laurent Mesuré wrote on 10/22/24 9:04 AM:
>
> this is the right place, but this is not a very active place :)
>
> I had a look at your issue but i didn't find anything usefull.
>
Oh you are naughty sir, top posting in HTML! almost making me reply in HTML!

Thanks but what would be useful?  I'll get it for you!  There's gotta be
more to it than that!  What does 0x0902 refer to?  and why every 10
seconds?  I guess, i could try asking Debian tpm2 team?  File an issue
here https://github.com/tpm2-software/tpm2-tools ?

