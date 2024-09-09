Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DBF189F3B
	for <tpm2@lists.linuxfoundation.org>; Mon,  9 Sep 2024 19:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725911784; cv=none; b=rN2CzUHOj8Kdc5/sF9zJRUMBqkT6761YofPtCQlOupLnOoF5aOlJGi+OsFtC3ZUAQcDg7MKjOV0/3DB9/ts5REpF1AsqoxuRityP8TKL/HwStzNy1GDClSCWw9aGmC1x4ALWjl9RNoYy+hpxF3D6StFmFa4kRlC00/HZAt2alHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725911784; c=relaxed/simple;
	bh=O6uAUrtfnusX37MpbdzZFL2mPSg8He6oeMk8cecfLYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=NnZO5XJS5bDc5jCPPsHi/YbiIYNZU+hS6SVhhAW6lyPKsCoYFUB36rnNzjCMPPlHa4WygsJs74MaZf4brJn4bi8HYFh7eOv49In6UYBtqcTXhoEu+eU4+LhUXPhCTw4xmytpNgtfyC1a300HTHniaY3JlUXgtFfXgp25HiH9JnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5cS4XDf; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5cS4XDf"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EFF9403F6
	for <tpm2@lists.linuxfoundation.org>; Mon,  9 Sep 2024 19:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gM2NymFuAuN for <tpm2@lists.linuxfoundation.org>;
 Mon,  9 Sep 2024 19:56:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=bill.c.roberts@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC296403D7
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC296403D7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V5cS4XDf
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BC296403D7
	for <tpm2@lists.linuxfoundation.org>; Mon,  9 Sep 2024 19:56:21 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5365b6bd901so3619755e87.2
        for <tpm2@lists.linuxfoundation.org>; Mon, 09 Sep 2024 12:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725911779; x=1726516579; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0py2hOjoaCUy+jvxlVjwCDmiN2k23rEI+h5DoWr264=;
        b=V5cS4XDf0sbRqwywQKfP0dFkOpbCyBjCn/eEp/BP3XT80Z0Xy/geMAiNDW7rGF7j/9
         OmSzmKR1Hmcum+di0R+9//4g3oopqSNymz6Vf575LIv/6YCAMBdTcpDQh7WPGhuBvH7W
         Z5xy0Ad5K/dFoVTLlGZinl6Xvb/CbwNISdr2demBkbtM6KtxY7BRXroUXDQtxZL/+XRn
         PVZnkf/mz1/HZpyGdeOkqjsy7UCTbXRNKYZQULr5Tnolu49QRNR9z1kp3GrQTBSt6N8Q
         LMiNJqAgz2mFI+PWq5lCdVY+0FnX/dYgti9ljwCymn5UtYQILu9EzHultEAGqJ+ZIcoK
         cR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725911779; x=1726516579;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0py2hOjoaCUy+jvxlVjwCDmiN2k23rEI+h5DoWr264=;
        b=Egpi4vcDgxJFS1wNhkMYHJV9BljEZRhpPg/gNx8BBTL/uGpTqF5TjHje0qR+9Ayb89
         lPY3mBonaflUvZ4w31twvVj7PCtuiAVhlGo4Lp4xv6zd+bmu438HFzTxue7our+oCP+r
         A5tqg0o19gN5RyZkMHdwcmusyt5JKsRTwau6b2IO8OZy7AogFhB0L03f4vDzn/USKGKS
         oAkFFZqHUZyfmxVoEaoaNwCpMwJ0FVaiYIKu340KyYZ0j3TyxXp9YcjmL3CC1SWNsx1c
         qUtS3zJU3SKier7mF1az5JkuxfzphVUDk1/Ny5AQTGrD/aDMeSyzM8UyYFmuRvfkh0vB
         s4Rw==
X-Gm-Message-State: AOJu0YwtnclsNmSrcRXqjOJN+c9gt7B0aANrpSfalRRxawsSJEWWJPJ3
	EIR2UMlpxCXmnORlcM9uFzJ83ptN0u/S3laPyEiGSUyldvnIwh2BlazBhgL/SmTw3k9F8tNZls8
	PbsncNBk9cOLqiEYFcw1WjT6ULcmUGw==
X-Google-Smtp-Source: AGHT+IHMzqL49yaRX2yhaSfxUb/cGSxIODtDdRkonodRhnwJA3lz3/wXs2SuHNcl6dBSS+BPK/va2eHynExzMoxR+vc=
X-Received: by 2002:a05:6512:2347:b0:530:aa4b:81c7 with SMTP id
 2adb3069b0e04-5365881d393mr6706934e87.59.1725911778775; Mon, 09 Sep 2024
 12:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFftDdrgcgYO1Vj1URr7MHSXoC19y0eG8MDH=Kp-M2hu8-RH6Q@mail.gmail.com>
In-Reply-To: <CAFftDdrgcgYO1Vj1URr7MHSXoC19y0eG8MDH=Kp-M2hu8-RH6Q@mail.gmail.com>
From: William Roberts <bill.c.roberts@gmail.com>
Date: Mon, 9 Sep 2024 12:56:07 -0700
Message-ID: <CAFftDdpTwP3AGnpYaH8COXfptG_tn=RgG4Twu=62g-r-bVcGEQ@mail.gmail.com>
Subject: Re: [RELEASE CANDIDATE] tpm2-pkcs11 1.9.1-rc0
To: tpm2@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 12:29=E2=80=AFPM William Roberts
<bill.c.roberts@gmail.com> wrote:
>
> Hello,
>
> I would like to announce the release of tpm2-pkcs11 1.9.1-rc0. You can
> find the link to the release and the CHANGELOG below.
>
> https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.1-rc0
>
> ## [1.9.1-rc0] - 2024-09-09
> ### Fixed
> - configure:
>   - Change mistaken `+=3D` to `=3D`.
>   - use user supplied `--prefix` even when p11kit is detected.
> - Remove warning about unable to find FAPI when it's is not-compiled
> in and not chosen as the beckend.
> - Fix memory leaks in `tpm_create_transient_primary_from_template`.
> - Fix `NULL` pointer dereference in `db.c` on uses of `CKA_ALLOWED_MECHAN=
ISMS`.
> - Fix offset miscalculation in FAPI backend that was corrupting data.
> - Support `CKM_ECDH1_DERIVE` via `C_DeriveKey`.
> - Fix usages of `tpm2-ptool` for its wrapped `tpm2_ptool` in tests.
> - Fix failing db upgrades on double conversion to int.
> - Fix db lock file due to missing parenthesis and order of operations.
> - documentation:
>   - Fix use of objects where tokens was meant.
>
> ### Changed
> - `--enable-fapi` to `--with-fapi`. Note this is not a major version
> bump as its internal to builders only. However `--enable-fapi` left in
> place for backwards compat.

FYI I will be out until September 23rd give or take, so this will be a
long RC cycle.

Bill
