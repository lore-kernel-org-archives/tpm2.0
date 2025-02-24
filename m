Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7DF266B40
	for <tpm2@lists.linux.dev>; Mon, 24 Feb 2025 18:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740423323; cv=none; b=WaW5F6wazqzpGoLry4pRrVJgaxgjOTR4ofMln0654gMSTd0O3mHOIseDbPqgKeOhNWS4qxBb19svase/5/eF35L4gJi1nMaY+vMWpOU1LPtz2bKHzZasYRbi9keIHEkeIxP5JLAMXKDbTppomLSW149JAnRabRVJwkl9Qy+ZhKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740423323; c=relaxed/simple;
	bh=56N0ABE9XTgk/QX5pUl/VXEQx/bXERsIIhAydnuW0bI=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=flMwUf6nKqwnxkdBAn12q4MNLNuAmlj+vqF/vLCDDPD3ohjkxX8Bj5McgBKys3uZvrbKiGqgDJjRLM+ekg1S3vvwk1aqW9k8iqmzrQtxRdH2Ht8P7IYAKOmruacfFD1rehdXvvxgdwAWPEQw6n0sPmmSSm0wKnJK8dHjqiz3F6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=zIgo3CUu; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="zIgo3CUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1740423311; x=1740682511;
	bh=56N0ABE9XTgk/QX5pUl/VXEQx/bXERsIIhAydnuW0bI=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=zIgo3CUutohoad+Tia+5Gqx3cePXTqwevjnGKHD5CzTYoc2dFez2kySRQRX21KpRp
	 +se3xbyy63qZZoDG2gi8scJ6SbZ1Zvik+3SzcHeRolvjLINHxNd8b2rotJ6mXN/uag
	 ZWVvarXFBkiwB+gAzrcb899BAU4ylzaX8OTuB+Hg6EJFcYre6QXjcenXxArMVB7vI8
	 sqGtAXso6aEkgIHprTrp8iZr+Dm8r2WFZqs5kOn50guOWPbu1DxzIHt057WdivVmCn
	 5xmyraRo9VKT4uiF0tK4oCaua4zfo//RMjaFtmcjfWXXof3JqsnugHTXizfGB6n/X+
	 EnSjBgfNic61w==
Date: Mon, 24 Feb 2025 18:55:07 +0000
To: "tpm2@lists.linux.dev" <tpm2@lists.linux.dev>
From: Prashant Kumar <notsoshant@protonmail.com>
Subject: Requesting review of a PAM based on TPM NV storage
Message-ID: <_zjU5bKR6fy_fg-jmo5qPfwtwOk8THOadSQMV2b-YrjN0e-jVSJPQuit2BjzmVQLT9XbSwn0P5MjuF9q9d5Xthh0YjoCgiSor0l3RXi4Vn8=@protonmail.com>
Feedback-ID: 15921986:user:proton
X-Pm-Message-ID: f268eacd31b6824d65bdf9f42459ced305903570
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello!

I posted the same message in Gitter, but I think it mostly stays inactive s=
o posting it here as well.

As a fun little side-project, I have created a PAM that uses TPM's NV stora=
ge for PIN based authentication. It uses the authValue of Fapi_CreateNV() t=
o set the PIN and Fapi_NvRead() is used by PAM for verifying the PIN, if th=
e read operation is successful, the auth is approved. The implementation of=
 PAM is barebones and skips over many obvious checks. This is just a PoC to=
 check if using NV storage in the way I'm using is safe or not. So, I'd app=
reciate if good people of this community can review the code and tell me if=
 my novice attempt at this missed any obvious flaw.

Link to project: https://github.com/notsoshant/libpam-tpm

notsoshant
