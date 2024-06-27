Received: from majs.cnackers.org (vps-1525-1.tilaa.nl [46.19.33.97])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FED17347F
	for <tpm2@lists.linux.dev>; Thu, 27 Jun 2024 21:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.33.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719522667; cv=none; b=lqd3f+JbGCdNAmirBZVCK0bwk0jJg033d3w0fShVEi+WnqUrk781XfKNhiw0VwXe/rYMH1t8a0OqvT8NPBJaSmdrfpTjt00SSuZG9crUuenkT61MnFrEPH2hUairbKeSKhPwFFIKdms0Oo5uUvhpw0bMIm9d+/dZdnoQvbVkziM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719522667; c=relaxed/simple;
	bh=YIerHUGNQUXPKW17A9XG3OKdAkxtwAylrUAimxfZ7UA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nB0hce0N7Zsv6RK5xatcaxm//AU1RfSYxx2DNNj6vzf++6ypjdHSyANmdaddojO97g1cAlJvbNCGtUm0rd6xcTAaGWGxQYEVLoEuCp2alsMV+bW8PZo1PqPevPfhVOPO/Bghgt3AvzuycOo66g5wpsEiNkMasbCQn2Y4dB62/Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cnackers.org; spf=none smtp.mailfrom=cnackers.org; arc=none smtp.client-ip=46.19.33.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cnackers.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cnackers.org
Received: from majs.cnackers.org (localhost [127.0.0.1]) by majs.cnackers.org (Postfix) with ESMTPA id 9272AFF43
Message-ID: <72de259c09e04236f8c54cf4f24b6ac0c55ad195.camel@cnackers.org>
Subject: Re: tpm2-pytss 2.3.0-rc0
From: Erik <who+lfl@cnackers.org>
To: tpm2@lists.linux.dev
Date: Thu, 27 Jun 2024 23:02:33 +0200
In-Reply-To: <1bbe28a4f190ea9857cd81995a5dc23b0acf47e5.camel@cnackers.org>
References: <1bbe28a4f190ea9857cd81995a5dc23b0acf47e5.camel@cnackers.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

tpm2-pytss 2.3.0 have now been released, no changes since the RC.

/Erik

On Sat, 2024-06-08 at 13:44 +0200, Erik wrote:
> Hi,
>=20
> tpm2-pytss 2.3.0-rc0 has just been released and is available via pypi.
> The two most relevant changes are fixes for building with tpm2-tss > 4.0.=
1 and integration with the cryptography package.
> The cryptography integration allows using TPM keys with it, for example c=
reating certificates signing requests, a certificate authority etc.
>=20
> Changelog:
> ## 2.3.0-rc0 - 2024-06-07
> ### Fixed
> - Fix builds for tpm2-tss > 4.0.1.
> - Support newer releases of the cryptography package.
>=20
> ### Added
> - Add module to use TPM keys with the cryptography package.
> - Support for exists_ok for FAPI.create_nv, behaves the same as for FAPI.=
create_key.
>=20
> ### Changed
> - Support for the tpm2-tools encoder/decoder will be removed in the futur=
e and a warning has been added.
>=20
>=20
> /Erik
>=20

