Received: from majs.cnackers.org (vps-1525-1.tilaa.nl [46.19.33.97])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0C42BB1D
	for <tpm2@lists.linux.dev>; Sun, 21 Sep 2025 21:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.33.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758490098; cv=none; b=rs5o24dd1tgucULIgvprD3MKz4Y2QweaTEh61es2J1yKt1TP3eBnKojy69nzwFuQiiV3dfIuk+nyH/s/iGByWVtReOykzjBYNE4diOG8te5ehyCD4Czyv95fkmHdKUoZxVx88AjJ21j9G3w+Ch0ZEi/AIfmn6AIwYicQQgL3HhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758490098; c=relaxed/simple;
	bh=65+rMV1QonWnpsWWVaN+azuIweGG0+n+HsASOY2bKcM=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=fC8BYigN/HboCaQCX2jXOH7+NLTE8hpcEM/W6Wb2yiipOMV/3tQoY1Td9fbCefDH+5Rzjv/19+AeetU5dg8cjLdUaW45VZ1rieCIR00PpPe3Lzenk9/j+Tnx0344JeY1Rv6R26YLT5bqJQQ2AJW/dQMSKuFGu1HFiulfwi29tIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cnackers.org; spf=none smtp.mailfrom=cnackers.org; arc=none smtp.client-ip=46.19.33.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cnackers.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cnackers.org
Received: from majs.cnackers.org (localhost [127.0.0.1]) by majs.cnackers.org (Postfix) with ESMTPA id 86C8CFF17
Message-ID: <21e6019225d264079705c725c9f2d28b4492b589.camel@cnackers.org>
Subject: tpm2-pytss 3.0.0-rc0
From: Erik <who+lfl@cnackers.org>
To: tpm2@lists.linux.dev
Date: Sun, 21 Sep 2025 23:21:53 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-3 
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

There is now a release candidate available for the next release of tpm2-pyt=
ss, 3.0.0-rc0.
The most interesting addition is the command/response parser, which will pa=
rse byte streams into command and response classes.
There are some breaking changes as well, the tools encoder/decoder has been=
 removed.
And the argument order for the ESAPI commands policy_signed, policy_ticket =
and policy_authorize has changed to make some arguments optional.

The full changelog:
## 3.0.0-rc0 - 2025-09-21
### Fixed
- Restore environment when exiting FAPIConfig

### Added
- Add a context manager for ESYS handles, which flushes the handle at exit.
- Add SVN, ACT and other missing constants.
- Add the ESAPI command `certify_x509`.
- Add the ESAPI command `act_set_timeout`.
- Add copy dunder for cryptography private keys.
- Add the ESAPI command `trsess_get_attributes`.
- Add signature scheme structures.
- Add marshal/unmarshal structures for `TPM2_HANDLE`.
- Add the command_parser module, which can decode TPM 2.0 command/response =
byte streams.
- Add support for passing prehashed data to `TPMT_SIGNATURE.verify_signatur=
e`.
- Add the marshal/unmarshal methods to union types, as they require a selec=
tor.
- Add the equal dunder to struct types, allowing comparing two different in=
stances of the same type.

### Changed
- Make the symmetric argument to `start_auth_session` optional.
- Accept None for the pcr_digest argument for `policy_pcr`.
- Support looking up EK templates by other names, such as `L-1` or `H-2`.
- Make the validition ticket for the sign command optional, defaults to a N=
ULL ticket.
- The argument order for `ESAPI.policy_signed`, `ESAPI.policy_ticket` and `=
ESAPI.policy_authorize` has changed.
  This is to make expiration, nonce_tpm, policy_ref and cp_hash_a arguments=
 optional, with expiration being set to the max value and the rest are empt=
y buffers by default.


/Erik
