Received: from majs.cnackers.org (vps-1525-1.tilaa.nl [46.19.33.97])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D66DF4D
	for <tpm2@lists.linux.dev>; Sat,  8 Jun 2024 11:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.33.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717847450; cv=none; b=fAxRmEXdiuF3Z+tGs8sZU5bQ4fz+5ojSgDznKnZZ4ku42y+hi1A27Rkt6vX5s8zg21NwkEZc6vy/UqA0m+5x5UWgNx/TfwW6ndJTVQrqJTgHcbHfaKlFjKdnCkwrgeGBxTJDpu1bUChZPQHnA5DXybDoYtI9+qFTQ58/0fn91QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717847450; c=relaxed/simple;
	bh=zwR0yW6G3FVvOL1LcgB3ETzspsSwNC4w5cQaHTQ71+8=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=FN7LDs79Dn+A4m/iraHts7wDA2lqmhbDmcbA7Dct2TDJA4xW5Y7vl5XAMWh6fCgltIIZsshn/RZJugTrHq4QNFpALDMVc57H2i0LR2PMrqNGbUuuaup9dD0VQuisOnVy8IDXRi2AtHtoG6HM24qySLfccN+yMEkiL84qBpYIBQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cnackers.org; spf=none smtp.mailfrom=cnackers.org; arc=none smtp.client-ip=46.19.33.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cnackers.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cnackers.org
Received: from majs.cnackers.org (localhost [127.0.0.1]) by majs.cnackers.org (Postfix) with ESMTPA id 9433AFF82
Message-ID: <1bbe28a4f190ea9857cd81995a5dc23b0acf47e5.camel@cnackers.org>
Subject: tpm2-pytss 2.3.0-rc0
From: Erik <who+lfl@cnackers.org>
To: tpm2@lists.linux.dev
Date: Sat, 08 Jun 2024 13:44:56 +0200
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

tpm2-pytss 2.3.0-rc0 has just been released and is available via pypi.
The two most relevant changes are fixes for building with tpm2-tss > 4.0.1 =
and integration with the cryptography package.
The cryptography integration allows using TPM keys with it, for example cre=
ating certificates signing requests, a certificate authority etc.

Changelog:
## 2.3.0-rc0 - 2024-06-07
### Fixed
- Fix builds for tpm2-tss > 4.0.1.
- Support newer releases of the cryptography package.

### Added
- Add module to use TPM keys with the cryptography package.
- Support for exists_ok for FAPI.create_nv, behaves the same as for FAPI.cr=
eate_key.

### Changed
- Support for the tpm2-tools encoder/decoder will be removed in the future =
and a warning has been added.


/Erik
