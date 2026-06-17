Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com [136.143.188.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC6A18BBAE
	for <tpm2@lists.linux.dev>; Wed, 17 Jun 2026 02:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781664532; cv=pass; b=fpeAkQhlL5VZjASesnokd6Hyv7hAqx/XG4aNaJb8QQjzpK4MC3gyfimxR4Cg8j2vRCU0S+ZtgFPKtH3G+nwVMYljbet0T/44d7HZvBU8HukXj0JIoclUORtNpq//BDMCMlVLNCSPq27Q4/P7fg8eiwNSnO3PzFjCE+wd0LlvIxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781664532; c=relaxed/simple;
	bh=T5WfMoau/J6ffRnRLGumK/qc10y3Tam3VCOgTdinSNE=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=caqSBLVCtW+9sSUqiYcquOo28wGf7ZlcXBGdvi1xJuUrNuOGSExU/Fnm/u5xTEsoH3TFbuwgOH1kOPz8mgf0LxxqrcgNpllh69dLk64Af632LtXkxK+VGEN+FbkqaUcKrYBrxawcf8yGGvwL10rS/HsaMeocv96/0BhCK3UDb6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soss.website; spf=pass smtp.mailfrom=soss.website; dkim=pass (1024-bit key) header.d=soss.website header.i=skye@soss.website header.b=DP8kLsd0; arc=pass smtp.client-ip=136.143.188.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soss.website
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soss.website
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=soss.website header.i=skye@soss.website header.b="DP8kLsd0"
ARC-Seal: i=1; a=rsa-sha256; t=1781664522; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LNqCC07xZQzBlUBxG+abXFg8Qlv6OuYQbNCo54ktVGb42kQPZGXRgdQRmdcjniQiYlQ5ze9flkN6Hlrc5WtW6BBbDJGSaF5m4ItS4cRUQoKbniO3yTRudyDLmoRsO7sN56F1YMIR9Go4kxIt0FPmMYjE6VDdHUQdB2+Aprp2NGA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781664522; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=T5WfMoau/J6ffRnRLGumK/qc10y3Tam3VCOgTdinSNE=; 
	b=DHIO0npFD/GeOZKi4bevxRrGl/Hm/tmOMas6p6d2PYD1SES761mqg/jsaFtsKeZR/3ogq4e/dvll3k2BWgk4r7cbOlxMTR6Jkuzeemin1hR7b9YJ0K+jJXbWEScwfv9QmyjmAj1i2G2k6Ih/qug5AQaS5HoyCbDcScujqerh20c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=soss.website;
	spf=pass  smtp.mailfrom=skye@soss.website;
	dmarc=pass header.from=<skye@soss.website>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781664522;
	s=zmail; d=soss.website; i=skye@soss.website;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=T5WfMoau/J6ffRnRLGumK/qc10y3Tam3VCOgTdinSNE=;
	b=DP8kLsd0i0A4lS4cTIhV0pWOxiIIqzsnhAVHxuokta4bsGHdraCeSfiT8VsDw9P/
	ZttAynbWNl/jjtdRA+K89OWU5ha06H0YgCqAMuBNO5DuKpF2Zf0yISjd1tEe5SjX1f+
	CxPQNbHT58c2wSZq6/45yPKjHF3ADghPwWH6frCc=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1781664521170879.2869603910117; Tue, 16 Jun 2026 19:48:41 -0700 (PDT)
Date: Tue, 16 Jun 2026 21:48:41 -0500
From: Skye Soss <skye@soss.website>
To: "tpm2" <tpm2@lists.linux.dev>
Message-ID: <19ed37b1bc3.6e33b4211099963.6676113527015209113@soss.website>
In-Reply-To: 
Subject: RE: tpm2-abrmd vs kernel resource manager
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

> [-- Attachment #1: smime.p7m --]

Unfortunately the lore.kernel.org archive doesn't handle S/MIME signatures.
For future reference I am quoting the entirety of Moritz's email here, thou=
gh it is broken up.

>> I've seen some references in the tpm2 documentation that suggest
>> tpm2-abrmd is preferred over the kernel resource manager. For
>> instance:
>>
>> https://github.com/tpm2-software/tpm2-
>> abrmd/blob/master/README.md#tpm2-abrmd-vs-in-kernel-rm
>> "For the short term we're recommending that developers stick to using
>> the tabrmd as the default to get the most stable / widest possible
>> support."
>>
>> https://tpm2-tools.readthedocs.io/en/latest/INSTALL/
>> "To enable the new userspace resource manager, one must get
>> tpm2-tabrmd (recommended)."
>
> I would appreciate if you could open an issue on GitHub regarding this to=
 get
> a discussion started there too.
> At least in tpm2-tss I am aware of a few things in the README that are ou=
t of
> date and need updating.

I decided to open this a few minutes ago, it would be good to continue the =
discussion there.
https://github.com/tpm2-software/tpm2-abrmd/issues/855

>> In contrast, Arch now recommends against tpm2-abrm:
>> https://wiki.archlinux.org/title/Trusted_Platform_Module
>> "According to a systemd project member, using tpm2-abrmd is no longer
>> recommended."
>>
>> I was wondering if anybody directly familiar with the kernel resource
>> manager and/or tpm2-abrmd code bases would care to comment on whether
>> one of these is the preferred option, or perhaps under what
>> circumstances one might choose one resource manager over the other.
>
>
> IIRC, the driver doesn=E2=80=99t support session un-gapping:
> https://trustedcomputinggroup.org/wp-content/uploads/TSS_2p0_TAB_Resource=
Manager_v1p0_r18_04082019_pub.pdf
>
> And without it, there are cases where TPM operations can stall.

This is good to know about, and should be mentioned somewhere in the tpm2-a=
brmd repo.

From my understanding of the linked standard, this isn't a required feature=
 of compliant TPM Access Brokers as the pdf references un-gapping implement=
ed in "a layer above the RM".
Could session un-gapping be implemented as a feature in higher-level client=
 libraries such as tpm2-tss?

>> Thanks,
>>
>> Scott
>
> Moritz

Skye
