Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBC41D86DC
	for <tpm2@lists.linux.dev>; Sat, 27 Dec 2025 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766857186; cv=none; b=U2pGDUJA/8ZdXyectAAlD9BngxYN5SCbYY82rKfo+uxT6q0vikBWwIYn4Avo4IJFJ1lDJLwFrr+MEidwlibdyVvXEm7UbPP5gj84bRvGU/ostTr3z5fF/diC1t3hXqEO5Xcq7DdZRYDuBgoQY60SJy1a+/ZxMH6xWNQes/GGmx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766857186; c=relaxed/simple;
	bh=JSBOnx6WV/NEmQKnQJ/oCbwPLo5wzM97Mq34qyC9CWM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rq955yh9lKZjZAAVHfD27PBVGUwVlzAljFHt0y04DwuD3mNmnHcr+QlxRQbEblzBcpvCQcfTPTgPOnCoYvTqyfWJTF7xrQq3LbM0d+7ywyyVfj/gMXvuzJVtUv1J2VGXVDr3I/1f/itoeWVhyjcGKxEUm2fnxSNx/lx/1iQC3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kngnt.org; spf=pass smtp.mailfrom=kngnt.org; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=jlJhaaL5; dkim=pass (2048-bit key) header.d=kngnt.org header.i=@kngnt.org header.b=pH4ZSLhd; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kngnt.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kngnt.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="jlJhaaL5";
	dkim=pass (2048-bit key) header.d=kngnt.org header.i=@kngnt.org header.b="pH4ZSLhd"
X-KPN-MessageId: aa030a07-e34b-11f0-b0b9-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id aa030a07-e34b-11f0-b0b9-00505699b430;
	Sat, 27 Dec 2025 18:44:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=content-type:mime-version:message-id:date:subject:to:from;
	bh=w4g77RVFNo0Tb0eO0it5Vcq9bdvRXfPiLT0RRdYCdAE=;
	b=jlJhaaL5xSBuPe0V2W7G6FuncFQxx0/t/kBAFFyw/nrnLk7R2acyKPW3gN5KTOEC/XM43TJvvMeWG
	 emwh4Oq7EbcLfq2QF+oCx8S1ncGvLyljvrzSGJTu9/aIlzj2Vvbwl3tPREdQfVaA5TKQr1shpPJjVI
	 i7LceA1zxnLS27J0=
X-KPN-MID: 33|J1HBTGLkbY192WTP3CxBFEOLK1Lq7Ls2KBskLBvXKZB9UjvrqyCamvAz7JzZ8nF
 FrWvTTfzdLacGqyAt+CN4d7mFlGNzFy2fCU2yO7OZ3Ac=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|hrf8he8gyA04AZyUqf7P/lba10zaUDyTkDySkjMdRjMPyY1ltEi8v0ord7e00PE
 rwn4C8hFHDAGa6paTDU8JJg==
Received: from mail.kngnt.org (82-169-112-203.fixed.kpn.net [82.169.112.203])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id 053c01ab-e34b-11f0-9bf7-00505699d6e5;
	Sat, 27 Dec 2025 18:39:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kngnt.org; s=mail;
	t=1766857178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w4g77RVFNo0Tb0eO0it5Vcq9bdvRXfPiLT0RRdYCdAE=;
	b=pH4ZSLhdCyY9XcZJ4dYPMB9wh4nUIBZUmdvgL28fIL8muaIdmzOknOWzFiC5zu6Axykiue
	J3Ds+jKXlvx6FvPnN4PguO0SxQQv9UqLySB9HopeR8KZnfCTudIZCYjadGiNC+L5Cey+vP
	RJPwJNec5Rqq5oAUFKX/tse8YgW3zdfc8ztTH1cDU8jeaRkEfBcx4g/kSXOYOqYNTkWEzF
	lrAh8+YbKNPwvgyHiK6gXn/KMclgBNS9F2iWRFwbaRd+VpZOWTjcEEayw3Ylu6QE9rEh7E
	CjDaE/y1Bg4pVWDANK6SrfCl5rIecXfD/Lwy/5FsY4fH6upbSS9IMBJkcREIaw==
From: Felix Rubio <felix@kngnt.org>
To: tpm2@lists.linux.dev
Subject: Is possible to seal a secret once,
 and authorize any policy properly signed to unseal it?
Date: Sat, 27 Dec 2025 18:39:37 +0100
Message-ID: <3394779.44csPzL39Z@altair>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi everybody,

I am trying to get a secret sealed once (ZFS encryption key), while being able 
to unseal it with any key that is properly signed (so that when I recreate a 
UKI I do not have to reseal but just to calculate the new PCR values). I have 
played with tpm2-tools across the years, but my knowledge is still quite 
basic: I do not know even if this is possible.

This is the script I am using:
########################################################
#!/bin/bash
set -eufx

OUTDIR=/tmp/outdir
SIGN_HANDLE="0x81010021"
mkdir -p "${OUTDIR:?}"
rm -rf "${OUTDIR:?}/*"

#############
# Step 0: Create signing key
AUTH_PUB="$OUTDIR/auth.pub"
AUTH_PRIV="$OUTDIR/auth.priv"

# Create an isolated tmpdir for TPM transient files
TMPDIR=$(mktemp -d /run/tpm-primary.XXXXXX)
AUTH_CTX="$TMPDIR/auth.ctx"
AUTH_PRIMARY_CTX="$TMPDIR/auth_primary.ctx"

# Create a new signing key under a primary key
tpm2_evictcontrol -Q -C o -c "$SIGN_HANDLE" || true
tpm2_createprimary -Q -C o -g 'sha256' -G rsa -c "$AUTH_PRIMARY_CTX"
tpm2_create -Q -C "$AUTH_PRIMARY_CTX" -G rsa -u "$AUTH_PUB" -r "$AUTH_PRIV"
tpm2_load -Q -C "$AUTH_PRIMARY_CTX" -u "$AUTH_PUB" -r "$AUTH_PRIV" -c 
"$AUTH_CTX"
tpm2_evictcontrol -Q -C o -c "$AUTH_CTX" "$SIGN_HANDLE"
tpm2_flushcontext -t

# Save Name now that is persistent
tpm2_readpublic -Q -c "$SIGN_HANDLE" -n "$OUTDIR/auth.name"
rm -rf "$AUTH_PUB" "$TMPDIR"

#############
# Step 1: Seal secret under authorizedPolicy using policyRef
TMPDIR=$(mktemp -d /run/tpm-seal.XXXXXX)
TPM_CTX="$TMPDIR/tpm.ctx"
AUTHORIZED_POLICY="$TMPDIR/authorized_policy.bin"
DUMMY_POLICY="$TMPDIR/dummy_policy.bin"
DUMMY_SIG="$TMPDIR/dummy_policy.sig"

echo "[*] Create a dummy policy and sign it"
tpm2_startauthsession -Q --policy-session --hash-algorithm 'sha256' -S 
"$TPM_CTX"
tpm2_getpolicydigest -Q -S "$TPM_CTX" -o "$DUMMY_POLICY"
tpm2_flushcontext -Q -s
tpm2_sign -c "$SIGN_HANDLE" -g 'sha256' -d "$DUMMY_POLICY" -o "$DUMMY_SIG"

echo "[*] Compute authorized policyDigest"
tpm2_startauthsession -Q -S "$TPM_CTX"
tpm2_policyauthorize -Q -S "$TPM_CTX" -i "$DUMMY_POLICY" -n "$OUTDIR/
auth.name" -L "$AUTHORIZED_POLICY" < "$DUMMY_SIG"
tpm2_flushcontext -Q -s

# Create primary key to seal under, and seal the ZFS key
echo "[*] Seal the secret"
tpm2_createprimary -Q -C o -g 'sha256' -G rsa -c "$TPM_CTX"
tpm2_create -Q -C "$TPM_CTX" -L "$AUTHORIZED_POLICY" -u "$OUTDIR/secret.pub" 
-r "$OUTDIR/secret.priv" <<< "This is my secret"
tpm2_flushcontext -t
rm -rf "$TMPDIR"

#############
# Generate signature for PCRS
TMPDIR=$(mktemp -d /run/tpm-pcr-sig.XXXXXX)
polfile="$TMPDIR/policy.bin"

echo "[*] Create PCRs signature"
POLICY_HASH=$(tpm2_createpolicy --policy-pcr -l sha256:11 -L "$polfile")
tpm2_sign -c "$SIGN_HANDLE" -d "$polfile" -o "$OUTDIR/policy-$POLICY_HASH.sig"
rm -rf "$TMPDIR"

#############
# validate signature for PCRS
TMPDIR=$(mktemp -d /run/tpm-unseal.XXXXXX)

POLICY="$TMPDIR/current_policy.bin"
SESSION_CTX="$TMPDIR/session.ctx"
PRIMARY_CTX="$TMPDIR/primary.ctx"
ZFSKEY_CTX="$TMPDIR/zfskey.ctx"
TICKET="$TMPDIR/verification.tkt"

echo "[*] Get the policy hash"
POLICY_HASH=$(tpm2_createpolicy --policy-pcr -l sha256:11 -L "$POLICY")

echo "[*] Starting policy session"
tpm2_startauthsession --policy-session --hash-algorithm sha256 -S 
"$SESSION_CTX"

echo "[*] Verifying signature"
tpm2_verifysignature -c "$SIGN_HANDLE" -d "$POLICY" -s "$OUTDIR/policy-
$POLICY_HASH.sig" -t "$TICKET"

echo "[*] Authorizing policy"
tpm2_policyauthorize -S "$SESSION_CTX" -i "$POLICY" -n "$OUTDIR/auth.name" -t 
"$TICKET"

echo "[*] Applying PCR policy"
tpm2_policypcr -S "$SESSION_CTX" -l sha256:11

echo "[*] Loading sealed object"
tpm2_createprimary -Q -C o -g sha256 -G rsa -c "$PRIMARY_CTX"
tpm2_load -Q -C "$PRIMARY_CTX" -u "$OUTDIR/secret.pub" -r "$OUTDIR/
secret.priv" -c "$ZFSKEY_CTX"

echo "[*] Unsealing ZFS key"
tpm2_unseal -c "$ZFSKEY_CTX" -p "session:$SESSION_CTX"
tpm2_flushcontext -Q -s -t
rm -rf "$TMPDIR"

########################################################
What am I doing wrong?
Thank you for any advise you can provide :-) (and happy new year! just in 
case...)

-- 
Felix Rubio



