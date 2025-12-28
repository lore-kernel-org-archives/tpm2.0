Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955FE145B27
	for <tpm2@lists.linux.dev>; Sun, 28 Dec 2025 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766914214; cv=none; b=Uz2pqgWDYTwXVp3u5Qe/e4ao9VwF72usWdX44VcFhz0j1MistKwAhW2dV0oI1flwoJM4NZZhbnISbyLfMOjcW8qTlHGXs5YoFHjuuLK8rWLqKfTMDuYFso7QqCVR0fz8a9ZaE9XhqihjrCImZLsPCv+h59LsXCvwcFJN041BSYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766914214; c=relaxed/simple;
	bh=XfEh4XtByfWdd9yr91x4EBlljd58xB36StxllA8ziZk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ghhy4me3zZ+9o1AP091el9cfOzGOWhmoTiJBcRczU4NfYOB5jPaXjSCibhgTk0KbotVlZcGROynAz8J3r1ceA5BD+UuMlsNZvcDkWSSr4sM6MUZ+Ssl7IEyFvOfaU+a+34rw3PvryxEtdHi5H3Gpvewac5vVIFZMr90eSd6Qru4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kngnt.org; spf=pass smtp.mailfrom=kngnt.org; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=FAsaIcyj; dkim=pass (2048-bit key) header.d=kngnt.org header.i=@kngnt.org header.b=eTYsCBhr; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kngnt.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kngnt.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="FAsaIcyj";
	dkim=pass (2048-bit key) header.d=kngnt.org header.i=@kngnt.org header.b="eTYsCBhr"
X-KPN-MessageId: c7f4d80a-e3cf-11f0-809d-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id c7f4d80a-e3cf-11f0-809d-005056992ed3;
	Sun, 28 Dec 2025 10:30:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=content-type:mime-version:message-id:date:subject:to:from;
	bh=nmXQgchOP9sPjsIioZ/eS2pX+K093rwYrJ8HdzPjqKo=;
	b=FAsaIcyjWugcY1EwOsyWzC9HLdUGsp/JKyFAUzN6LWnc5XNTf1HMV+TNK5DkJl8RsHvqcsgnYclvj
	 KGeCVe9cNVCL1AUUt+B92pxLq5DxAAAA4GsdICNb8RQEH8BX0AUGLbY1N32gCV1OHifKLQbhWx/HhC
	 VebtQWNgnv+/qAls=
X-KPN-MID: 33|ZC9CpTtNPJwKvqSJVp0Y5HcwUAj3+I/DsrbyLxmgcjLw4o98oN4epS/VKJCDp+9
 Za1rA4LGtfJdoXBKXzT3l9tM8N5zyLNtTb2mF5SYUbsI=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|qTqWXiZxBP+gP6SluXbwFl0Vry7xocyqJzy8zM8p5JXcQSj4xnNsTQmPeitanAw
 uouw2z0/Ee62s436nlcU7JA==
Received: from mail.kngnt.org (82-169-112-203.fixed.kpn.net [82.169.112.203])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id a078754a-e3cf-11f0-86cb-005056998788;
	Sun, 28 Dec 2025 10:28:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kngnt.org; s=mail;
	t=1766914133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmXQgchOP9sPjsIioZ/eS2pX+K093rwYrJ8HdzPjqKo=;
	b=eTYsCBhrrMK2rTSB6Qgin/+vHDD1xajohNt+3srwmyheqjDajAL9f4S0UpDK6GlcJfgjaE
	y0+k9+sP/Jr+cKJ+7tQRLXY7WRqHAhU8Gi7DejVTyUI8kFe0t/QCg7LqTt+tuNzxMeQTSK
	YPAZTi/tTfTtUrkPvKIRt3GmFIRqv5OyblAwkFumnhUhlbfEu8q9oYU0srIgrZKLP51o3F
	QHU+++uR4Ijpph1oUJVZJB6f4Qn3ZAbVqKbSdn7hBuIDx+4N1QQGcW4suE7dcidY4XRnIX
	S/S/+gXCfP4nOw8dm9+T3Mj3jJSe+oAlPqA8i0IIj87Q18r4FH+QuJYeqpUmhA==
From: Felix Rubio <felix@kngnt.org>
To: tpm2@lists.linux.dev
Subject: Re: Is possible to seal a secret once,
 and authorize any policy properly signed to unseal it?
Date: Sun, 28 Dec 2025 10:28:53 +0100
Message-ID: <2334520.iZASKD2KPV@altair>
In-Reply-To: <3394779.44csPzL39Z@altair>
References: <3394779.44csPzL39Z@altair>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Fixed it, I think, by... carefully looking at the examples. This is my current 
flow, now, which seems to work. Sharing in case somebody is interested:

########################################################
#!/bin/bash
set -euf

OUTDIR=/tmp/outdir
SIGN_HANDLE="0x81010021"
mkdir -p "${OUTDIR:?}"
rm -rf "${OUTDIR:?}/*"

############# ONE OFF: CREATE SIGNING KEYS, AUTHORIZED POLICY
AUTH_PRIV="$OUTDIR/auth.priv"
TMPDIR=$(mktemp -d /run/tpm-primary.XXXXXX)
AUTH_PUB="$TMPDIR/auth.pub"
AUTH_CTX="$TMPDIR/auth.ctx"
AUTH_PRIMARY_CTX="$TMPDIR/auth_primary.ctx"

# Create a new signing key under a primary key
tpm2_evictcontrol -Q -C o -c "$SIGN_HANDLE" || true
tpm2_createprimary -Q -C o -c "$AUTH_PRIMARY_CTX"
tpm2_create -Q -C "$AUTH_PRIMARY_CTX" -u "$AUTH_PUB" -r "$AUTH_PRIV"
tpm2_load -Q -C "$AUTH_PRIMARY_CTX" -u "$AUTH_PUB" -r "$AUTH_PRIV" -c 
"$AUTH_CTX"
tpm2_evictcontrol -Q -C o -c "$AUTH_CTX" "$SIGN_HANDLE"
tpm2_flushcontext -t

# Save Name now that is persistent
tpm2_readpublic -Q -c "$SIGN_HANDLE" -n "$OUTDIR/auth.name"
rm -rf "$TMPDIR"

############# ONE OFF: CREATE AUTHORIZED POLICY, SEAL THE SECRET
# Seal secret under authorizedPolicy
TMPDIR=$(mktemp -d /run/tpm-seal.XXXXXX)
TPM_CTX="$TMPDIR/tpm.ctx"
AUTHORIZED_POLICY="$TMPDIR/authorized_policy.bin"

echo "[*] Compute authorized policyDigest"
tpm2_startauthsession -Q -S "$TPM_CTX"
tpm2_policyauthorize -Q -S "$TPM_CTX" -n "$OUTDIR/auth.name" -L 
"$AUTHORIZED_POLICY"
tpm2_flushcontext -Q "$TPM_CTX"

# Create primary key to seal under, and seal the ZFS key
echo "[*] Seal the secret"
tpm2_createprimary -Q -C o -G rsa -c "$TPM_CTX"
tpm2_create -Q -C "$TPM_CTX" -i- -L "$AUTHORIZED_POLICY" -u "$OUTDIR/
secret.pub" -r "$OUTDIR/secret.priv" <<< "This is my secret"
tpm2_flushcontext -t
rm -rf "$TMPDIR"

############# AFTER UKI UPDATE: SIGN THE NEW PCR VALUES
# Generate signature for PCRS
TMPDIR=$(mktemp -d /run/tpm-pcr-sig.XXXXXX)
SESSION_CTX="$TMPDIR/session.ctx"
POLICY_FILE="$TMPDIR/policy.bin"

echo "[*] Create PCRs signature"
tpm2_startauthsession -S "$SESSION_CTX"
POLICY_HASH=$(tpm2_policypcr -S "$SESSION_CTX" -l sha256:11 -L "$POLICY_FILE")
tpm2_flushcontext "$SESSION_CTX"
tpm2_sign -c "$SIGN_HANDLE" -g sha256 -o "$OUTDIR/policy-$POLICY_HASH.sig" 
"$POLICY_FILE"
rm -rf "$TMPDIR"

############# IN INITRAMFS: UNSEAL SECRET
# validate signature for PCRS
TMPDIR=$(mktemp -d /run/tpm-unseal.XXXXXX)

POLICY="$TMPDIR/current_policy.bin"
SESSION_CTX="$TMPDIR/session.ctx"
PRIMARY_CTX="$TMPDIR/primary.ctx"
ZFSKEY_CTX="$TMPDIR/zfskey.ctx"
TICKET="$TMPDIR/verification.tkt"

echo "[*] Get the policy hash"
tpm2_startauthsession -S "$SESSION_CTX"
POLICY_HASH=$(tpm2_policypcr -S "$SESSION_CTX" -l sha256:11 -L "$POLICY")
tpm2_flushcontext "$SESSION_CTX"

echo "[*] Verifying signature"
tpm2_verifysignature -c "$SIGN_HANDLE" -g sha256 -m "$POLICY" -s "$OUTDIR/
policy-$POLICY_HASH.sig" -t "$TICKET"

echo "[*] Starting policy session"
tpm2_startauthsession --policy-session -S "$SESSION_CTX"

echo "[*] Applying PCR policy"
tpm2_policypcr -Q -S "$SESSION_CTX" -l sha256:11

echo "[*] Authorizing policy"
tpm2_policyauthorize -Q -S "$SESSION_CTX" -i "$POLICY" -n "$OUTDIR/auth.name" 
-t "$TICKET"

echo "[*] Loading sealed object"
tpm2_createprimary -Q -C o -c "$PRIMARY_CTX"
tpm2_load -Q -C "$PRIMARY_CTX" -u "$OUTDIR/secret.pub" -r "$OUTDIR/
secret.priv" -c "$ZFSKEY_CTX"
tpm2_flushcontext -Q -t

echo "[*] Unsealing ZFS key"
tpm2_unseal -c "$ZFSKEY_CTX" -p "session:$SESSION_CTX"
tpm2_flushcontext -Q "$SESSION_CTX"
rm -rf "$TMPDIR"

Regards!


On Saturday, 27 December 2025 18:39:37 Central European Standard Time Felix 
Rubio wrote:
> Hi everybody,
> 
> I am trying to get a secret sealed once (ZFS encryption key), while being 
able
> to unseal it with any key that is properly signed (so that when I recreate a
> UKI I do not have to reseal but just to calculate the new PCR values). I 
have
> played with tpm2-tools across the years, but my knowledge is still quite
> basic: I do not know even if this is possible.
> 
> This is the script I am using:
> ########################################################
> #!/bin/bash
> set -eufx
> 
> OUTDIR=/tmp/outdir
> SIGN_HANDLE="0x81010021"
> mkdir -p "${OUTDIR:?}"
> rm -rf "${OUTDIR:?}/*"
> 
> #############
> # Step 0: Create signing key
> AUTH_PUB="$OUTDIR/auth.pub"
> AUTH_PRIV="$OUTDIR/auth.priv"
> 
> # Create an isolated tmpdir for TPM transient files
> TMPDIR=$(mktemp -d /run/tpm-primary.XXXXXX)
> AUTH_CTX="$TMPDIR/auth.ctx"
> AUTH_PRIMARY_CTX="$TMPDIR/auth_primary.ctx"
> 
> # Create a new signing key under a primary key
> tpm2_evictcontrol -Q -C o -c "$SIGN_HANDLE" || true
> tpm2_createprimary -Q -C o -g 'sha256' -G rsa -c "$AUTH_PRIMARY_CTX"
> tpm2_create -Q -C "$AUTH_PRIMARY_CTX" -G rsa -u "$AUTH_PUB" -r "$AUTH_PRIV"
> tpm2_load -Q -C "$AUTH_PRIMARY_CTX" -u "$AUTH_PUB" -r "$AUTH_PRIV" -c
> "$AUTH_CTX"
> tpm2_evictcontrol -Q -C o -c "$AUTH_CTX" "$SIGN_HANDLE"
> tpm2_flushcontext -t
> 
> # Save Name now that is persistent
> tpm2_readpublic -Q -c "$SIGN_HANDLE" -n "$OUTDIR/auth.name"
> rm -rf "$AUTH_PUB" "$TMPDIR"
> 
> #############
> # Step 1: Seal secret under authorizedPolicy using policyRef
> TMPDIR=$(mktemp -d /run/tpm-seal.XXXXXX)
> TPM_CTX="$TMPDIR/tpm.ctx"
> AUTHORIZED_POLICY="$TMPDIR/authorized_policy.bin"
> DUMMY_POLICY="$TMPDIR/dummy_policy.bin"
> DUMMY_SIG="$TMPDIR/dummy_policy.sig"
> 
> echo "[*] Create a dummy policy and sign it"
> tpm2_startauthsession -Q --policy-session --hash-algorithm 'sha256' -S
> "$TPM_CTX"
> tpm2_getpolicydigest -Q -S "$TPM_CTX" -o "$DUMMY_POLICY"
> tpm2_flushcontext -Q -s
> tpm2_sign -c "$SIGN_HANDLE" -g 'sha256' -d "$DUMMY_POLICY" -o "$DUMMY_SIG"
> 
> echo "[*] Compute authorized policyDigest"
> tpm2_startauthsession -Q -S "$TPM_CTX"
> tpm2_policyauthorize -Q -S "$TPM_CTX" -i "$DUMMY_POLICY" -n "$OUTDIR/
> auth.name" -L "$AUTHORIZED_POLICY" < "$DUMMY_SIG"
> tpm2_flushcontext -Q -s
> 
> # Create primary key to seal under, and seal the ZFS key
> echo "[*] Seal the secret"
> tpm2_createprimary -Q -C o -g 'sha256' -G rsa -c "$TPM_CTX"
> tpm2_create -Q -C "$TPM_CTX" -L "$AUTHORIZED_POLICY" -u "$OUTDIR/secret.pub"
> -r "$OUTDIR/secret.priv" <<< "This is my secret"
> tpm2_flushcontext -t
> rm -rf "$TMPDIR"
> 
> #############
> # Generate signature for PCRS
> TMPDIR=$(mktemp -d /run/tpm-pcr-sig.XXXXXX)
> polfile="$TMPDIR/policy.bin"
> 
> echo "[*] Create PCRs signature"
> POLICY_HASH=$(tpm2_createpolicy --policy-pcr -l sha256:11 -L "$polfile")
> tpm2_sign -c "$SIGN_HANDLE" -d "$polfile" -o "$OUTDIR/policy-
$POLICY_HASH.sig"
> rm -rf "$TMPDIR"
> 
> #############
> # validate signature for PCRS
> TMPDIR=$(mktemp -d /run/tpm-unseal.XXXXXX)
> 
> POLICY="$TMPDIR/current_policy.bin"
> SESSION_CTX="$TMPDIR/session.ctx"
> PRIMARY_CTX="$TMPDIR/primary.ctx"
> ZFSKEY_CTX="$TMPDIR/zfskey.ctx"
> TICKET="$TMPDIR/verification.tkt"
> 
> echo "[*] Get the policy hash"
> POLICY_HASH=$(tpm2_createpolicy --policy-pcr -l sha256:11 -L "$POLICY")
> 
> echo "[*] Starting policy session"
> tpm2_startauthsession --policy-session --hash-algorithm sha256 -S
> "$SESSION_CTX"
> 
> echo "[*] Verifying signature"
> tpm2_verifysignature -c "$SIGN_HANDLE" -d "$POLICY" -s "$OUTDIR/policy-
> $POLICY_HASH.sig" -t "$TICKET"
> 
> echo "[*] Authorizing policy"
> tpm2_policyauthorize -S "$SESSION_CTX" -i "$POLICY" -n "$OUTDIR/auth.name" 
-t
> "$TICKET"
> 
> echo "[*] Applying PCR policy"
> tpm2_policypcr -S "$SESSION_CTX" -l sha256:11
> 
> echo "[*] Loading sealed object"
> tpm2_createprimary -Q -C o -g sha256 -G rsa -c "$PRIMARY_CTX"
> tpm2_load -Q -C "$PRIMARY_CTX" -u "$OUTDIR/secret.pub" -r "$OUTDIR/
> secret.priv" -c "$ZFSKEY_CTX"
> 
> echo "[*] Unsealing ZFS key"
> tpm2_unseal -c "$ZFSKEY_CTX" -p "session:$SESSION_CTX"
> tpm2_flushcontext -Q -s -t
> rm -rf "$TMPDIR"
> 
> ########################################################
> What am I doing wrong?
> Thank you for any advise you can provide :-) (and happy new year! just in
> case...)


-- 
Felix Rubio


