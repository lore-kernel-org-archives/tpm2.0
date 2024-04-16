Received: from gardel.0pointer.net (gardel.0pointer.net [85.214.157.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA171292D7
	for <tpm2@lists.linux.dev>; Tue, 16 Apr 2024 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.157.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713272755; cv=none; b=udpGLXVBimvFT+l5bDI1sEdWLzsjCuvUwZJv5hVVVEK2hBOWb6WBxvksASKLkpnMhQFEbZGABkPkjU+8x/+cSr/AMnaeDIdIQJUwCIOdL4bCqPo+rWPmKUpWudgv4KhD2xMgHoX9HqNPzh7YdB/dkfLcuxRAf4u6Z80TuEhMU68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713272755; c=relaxed/simple;
	bh=+EPZm2dftHes5gxB7wJP+4Dc9FY0CwSwqd+np4bbofw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ep/0SC7PXaFQ3DLlF4+jA8WjVJ8eZOsKh5yLXBThvyO5ZkQv04sgFEpJWCbz8TJsdE2uMENwl2cFGqYg8R9ouJBWxqOyHVG6+K5a4Atm0ThxFuY3h22WAmKO3jWLv7iEcYFzOREVpBhGI4KhYPXtrsoToL4suopI9+X7eAylKKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0pointer.net; spf=pass smtp.mailfrom=0pointer.net; arc=none smtp.client-ip=85.214.157.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0pointer.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0pointer.net
Received: from gardel-login.0pointer.net (gardel-mail [85.214.157.71])
	by gardel.0pointer.net (Postfix) with ESMTP id CB6C9E803C0
	for <tpm2@lists.linux.dev>; Tue, 16 Apr 2024 15:05:51 +0200 (CEST)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
	id A9B641602F7; Tue, 16 Apr 2024 15:05:51 +0200 (CEST)
Date: Tue, 16 Apr 2024 15:05:51 +0200
From: Lennart Poettering <mzgcz2gff@0pointer.net>
To: tpm2@lists.linux.dev
Subject: Using TPM2_LoadExternal() for loading an HMAC key into the TPM?
Message-ID: <Zh53rw5o97SVXZWT@gardel-login>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi!

I was wondering, if anyone has an idea how precisely to set up a pair
of TPM2B_PUBLIC and TPM2_SENSITIVE structures for loading an
HMAC-SHA256 key into the TPM via TPM_LoadExternal()?

I am currently setting things up more or less like this:

        TPM2B_PUBLIC auth_hmac_public = {
                .size = sizeof(TPMT_PUBLIC),
                .publicArea = {
                        .type = TPM2_ALG_KEYEDHASH,
                        .nameAlg = TPM2_ALG_SHA256,
                        .objectAttributes = TPMA_OBJECT_DECRYPT | TPMA_OBJECT_SIGN_ENCRYPT /* | TPMA_OBJECT_USERWITHAUTH */,
                        .parameters.keyedHashDetail.scheme.scheme = TPM2_ALG_SHA256,
                        .unique.keyedHash.size = buffer.size,
                },
        };

        TPM2B_SENSITIVE auth_hmac_private = {
                .size = sizeof(TPMT_SENSITIVE),
                .sensitiveArea = {
                        .sensitiveType = TPM2_ALG_KEYEDHASH,
                        .sensitive.sym.size = buffer.size,
                },
        };

        memcpy(auth_hmac_private.sensitiveArea.sensitive.sym.buffer, buffer.buffer, buffer.size);

And then use TPM2_LoadExternal() with this, for the NULL hierarchy.

tpm2-tss responds with these errors:

         ERROR:esys:src/tss2-esys/api/Esys_LoadExternal.c:184:Esys_LoadExternal_Async() SAPI Prepare returned error. ErrorCode (0x0009000b)
         ERROR:esys:src/tss2-esys/api/Esys_LoadExternal.c:85:Esys_LoadExternal() Error in async function ErrorCode (0x0009000b)

But, uh, what am I supposed to make of this?

I figure it's not even the TPM that refuses this, but it's tpm2-tss
already?

Anyone has an idea?

(Background: I am trying to protect an nvindex that I want to use with
TPM2_AuthorizeNV, with an TPM2_PolicySigned access policy. I want to
use an HMAC key for the signature scheme. If you want to know even
more, see → https://github.com/systemd/systemd/pull/31790. The above
is more or less a copy of the topmost commit of that)

Any help appreciated!

Lennart
