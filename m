Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD4921773D
	for <tpm2@lists.linux.dev>; Sun, 10 May 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778400681; cv=pass; b=EUzXs/JbQ7kSKZz8++W9/0GYG9MpjlZZtjehEokVf1fpkc1qgCcrC+cvPK766MqMY5CRddYX8OEkF5MaN487VYuZGwua3pE9iZlI+qsepU3YIBn9iVEzrA9D0CnnZKCpyHaYg9biB1KtVqU4GrzeUhS7ksU2dXi3LhQ0npUXVsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778400681; c=relaxed/simple;
	bh=zr6wkaDQwCZRYK1k6g+DYdmE5Kb4JL4DJJQtXazSJkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=eIXDV29NygJ+8Tg+z0HEForS0ozg3THkbxxHgQASFjmlfjt+snUX81krqbTfgTUxBXIfXcsP+1NctwMkSGXdU+SjdDqnzrc513oF1QJkdW0qdib0FpMKGKkz9IaT+6A+OTkGcQJQFFDa/6YBhEN0wEhEj74t3TjTSZaexQqqmMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLU+SJsT; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLU+SJsT"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so6004036a12.2
        for <tpm2@lists.linux.dev>; Sun, 10 May 2026 01:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778400677; cv=none;
        d=google.com; s=arc-20240605;
        b=JlNQBLcXLD7c2gszZv3JYuTnhJXLHihhrPgMhEUrQ+elhMvX7Uar5MVV3Y0HCHMHwh
         iZhu99HFejIyiYHNZTJ+sr8fenT9e5oEV7CRce173rPtp8vGYo7cpDrdwCcDu0QyIlru
         MyJJHCZlGJeui7GTbVe60kugfgn4Hf2rbDDU9ZTgBD2C0yC2hD2vZQ4tjOHzrsWlPbMu
         lVX1ifBIr30HJ/dCaRrm0dH5xs7ziLsXlgbWjHIwhMB2oY7lGnxUE3WNantq1yKF1D+D
         Cgxksdrr9Jnyq7ENRQj7q4EdGnvMFM+ibOOvoCsWc6sNmjtrLa/vYyiKuit//ii7xZUH
         zABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g7V6ITw8vWs3T1+nYxcgaSUiDzusbnt7ktlUwKaWsjE=;
        fh=PFK5BRwVnwyxZKyx1wYwmu3IBDeE0v/2V/gDtVcF/48=;
        b=E5hUlYnoU26FA0/iR5mrsxPbrhLYChogncbGdzsbd20krOsxW5qJ8EUgVAZI4WoSbX
         IO3x7HOhUdiPvM2rxEX0idxklh0SK2RNaJDxWM02F26ONRCggxKqEsxn/y7m0vxI6S9V
         uKkYxGIXottnelnC8Jr7U4JR8aCCczaZCjpUB+CDZ9oa71gh9X4+bDU0t251PY8IYSTW
         aiTvnbKuuOCv5hccoUKKI3MNCTY7rCqQaWECLc8cEMgfpwcIzTgKVTYQeFMavSt32lP7
         6H9xgfll5HQRjymJq0uIyLdMW2xN2lSi4Y/0c39PrxdMdUEvLAQzMeeWbYYxtGUhC5Jj
         Hj4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778400677; x=1779005477; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7V6ITw8vWs3T1+nYxcgaSUiDzusbnt7ktlUwKaWsjE=;
        b=lLU+SJsTXcntO8c0oAt4A1lfkVR/3SfAkWD7iVMGV0hpuaSQPKILc7BcRc4WF5mWR0
         /i/YwGuLsTDcRxagTeMNGQC+05JXeubEA7ZH69zY4O6rOrE3i3WmkJDAa6cOKSrCg/hb
         HLMWwKPlZr4hXUWos4UKlrESGS/uTWFSEXpCe3+MsKDvhCOOCLuu+yZKK5ett29ouKAn
         0owb5iq8TxN/3X+w+/KAIbnq5IlWzyGXbN3zQc9p3r6Uc91HUdHM4/54YBQry6TztwQq
         PbRESbbezyMtOfBvr4tVKWSjHO/prvuZxvmrab8FR0dsGGOvhHf/WLvf0qEOBqjpbLIi
         Ap2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778400677; x=1779005477;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7V6ITw8vWs3T1+nYxcgaSUiDzusbnt7ktlUwKaWsjE=;
        b=j4NcdofYn00TdzETK39SOe8pcb4Lk2mvOf+xapxSbm7JQLZVV3HeLMjubJZVe2L6sG
         NijdgrMfMt+WZI2jYrJkpslSjkqdGVjHEgj4Y6+RPrw+lwknPQudMF5NpeqVTeXLXU5n
         2EB1N7z/Gx/xbmaIezxWJVWMjjEhfRFZ9vwFHIL8JNXll041e4RIgG9CyJRkh1nJhevH
         M7SnRK6kf8/9JkLr5PtoaExECOh/YtbT0KjqI69xnyr6CmG97aS1BYKJXSYJ/34bXdHK
         3zqmBrZ37nTXZDSfXFudjfH/pJXTydOuU5PJU42w/5BOqbyK754HjsTFuaZ7wE9PFubh
         MNPQ==
X-Gm-Message-State: AOJu0YwaTvE78dAlFJYMefmC669rMdjuRCzPnHVuJzDuH4MgekS2B793
	AIEd0JgNFCqWluj09TeKo9um0BPNo6LE+Ptk8nOCGNIOFePHmluqQu8hZjZxSARN7EDDvQkhsw4
	JQF1i2rf6ziI2Rrw7/k7qi4VCDlVoLUpLTA==
X-Gm-Gg: Acq92OGhmHtqLpK+hD8syK+2146V67FfgDp8h5bDV8xQROWoWAHv7PRpzLZw4u4bff9
	mqvvPqKEaXFrXvvL0uFP2+S1sbCnIGqDwOkbwtcC6Eo89ZvQ+K670xZDb41Xh1GbxSJ5iRo5Bxg
	zLKo+Y/T38/wGqf8CjxWy5tn2whsgBJZHganCzm/OwNsMaWerE48b+/vSoO2A1CXmVRS2wxJs+a
	WRwLAPkvdj786zzFq7fQ3PLAQAKVanQqXWSnIjnZQgZWON3Qkuf1xX9D24ZE9gLPEqpln0FaxWM
	KgxaEuke
X-Received: by 2002:a17:906:478e:b0:bc9:e1b1:8edf with SMTP id
 a640c23a62f3a-bcaaa54ce58mr533860866b.12.1778400677102; Sun, 10 May 2026
 01:11:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAGG+4T3qmDg7utUUB+c2Q_mqOJpRcMzGM_RwBxaeyPE3qbgSw@mail.gmail.com>
In-Reply-To: <CAAGG+4T3qmDg7utUUB+c2Q_mqOJpRcMzGM_RwBxaeyPE3qbgSw@mail.gmail.com>
From: Akshay Hendre <ahendre2010@gmail.com>
Date: Sun, 10 May 2026 13:41:03 +0530
X-Gm-Features: AVHnY4JqkOrv_udjKFB4aXsty7EPj9i0DEqxaoje0KLxnBxGB71G80534GTCqiI
Message-ID: <CAAGG+4T2qRFS7Bn8t_05hyVDzwG-by7Z9zmh1tvkVkcOXDcLNA@mail.gmail.com>
Subject: Fwd: [RFC] Proposal for Centralized TPM 2.0 Userspace Management
 Layer: systemd-tpmd
To: tpm2@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am cross-posting proposal for [RFC: systemd-tpmd] for the right audience.

---------- Forwarded message ---------
From: Akshay Hendre <ahendre2010@gmail.com>
Date: Sun, 10 May 2026 at 13:31
Subject: [RFC] Proposal for Centralized TPM 2.0 Userspace Management
Layer: systemd-tpmd
To: <systemd-devel@lists.freedesktop.org>


Hello all,

I am submitting a proposal to introduce systemd-tpmd, a centralized
TPM 2.0 userspace management layer designed to serve as the foundation
for TPM integration on Linux. This proposal deliberately focuses on
architectural design in order to reach consensus before diving into
implementation details.

Table of Contents
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1. Problem Statement
2. Proposed Solution: systemd-tpmd Architecture
   2.1 Boot-Time Provisioning and State Escrow
   2.2 Application Ecosystem and Architectural Layers
   2.3 Standard Interaction Sequence
3. Supported Interaction Paths: Varlink and OpenSSL 3.0
   3.1 Path A: The OpenSSL 3.0 Provider
   3.2 Path B: Native Varlink API (io.systemd.Tpm)
4. System Administration and Managed Environments
   4.1 State Management and Daemon Recovery
   4.2 Command Line Integration and Access Control
5. Security, Sandboxing, and Simulation
   5.1 Hardened Service Confinement
   5.2 Simulator Support and Fallback Prevention
6. Future Capabilities and Solvable Problems
   6.1 Seamless Firmware Updates (Solving the LUKS / fwupd Lockout)
   6.2 Standardizing TPM-Backed Passkeys for the Linux Desktop
   6.3 Stabilizing Continuous Remote Attestation for Fleet Management
   6.4 Secure SSH Key Protection
   6.5 Confidential Computing and vTPM State Management

1. Problem Statement
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
While the Linux kernel provides robust low-level multiplexing for the
Trusted Platform Module via /dev/tpmrm0, the userspace ecosystem
currently lacks a centralized, stateful broker to manage hardware
cryptography. To understand these gaps, it is useful to compare the
Linux landscape with the established Windows paradigm. On Windows,
hardware cryptography is handled seamlessly via the Cryptography API:
Next Generation (CNG) and the Platform Crypto Provider (PCP). The
Windows operating system automatically takes ownership of the TPM
during boot, securely escrows the owner password, and provides a
unified, multi-tenant broker for all applications. Developers simply
request a cryptographic operation, and the OS handles the hardware
state, context swapping, and security authorizations automatically.

In stark contrast, the Linux ecosystem delegates hardware state
management and cryptographic session establishment directly to the
applications themselves. This fragmented approach creates severe
architectural gaps that impact multiple groups:

* Application Developers: Enhanced System API (ESAPI) and the
operational fragility of the Feature API (FAPI). While ESAPI requires
expert-level hardware management=E2=80=94such as manually invoking
TPM2_CreatePrimary for SRK provisioning=E2=80=94it risks locking out
applications if the Owner Hierarchy is password-protected. Conversely,
FAPI simplifies provisioning but introduces a fragile file-based
keystore (typically /var/lib/tpm2-tss/system/keystore) that frequently
triggers fatal 0x0006000b (Permission Denied) errors during concurrent
access.
* System Administrators: Currently, because there is no centralized
daemon to automatically provision the TPM and establish a shared
Storage Root Key (SRK), applications often attempt to create their own
primary keys directly under the Owner hierarchy. If an administrator
follows security best practices and password-protects the Owner
hierarchy, core OS utilities like systemd-cryptenroll immediately fail
to bind LUKS2 volumes, throwing an 0x000009a2 authorization error.
Administrators are caught in a paradox: leave the TPM Owner hierarchy
entirely unprotected, or break system functionality.
* Managed Enterprise Fleets: In large deployments, the lack of a
centralized policy broker means that standard software and kernel
updates alter Platform Configuration Registers (PCRs). This
arbitrarily breaks fragile local trust chains, locks users out of
encrypted disks, and causes disruptive false positives in continuous
remote attestation frameworks.

2. Proposed Solution: systemd-tpmd Architecture
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
systemd-tpmd is proposed as a persistent, stateful userspace
management layer acting as the absolute foundation for TPM integration
on Linux. It operates as a highly privileged system daemon sitting
directly between the in-kernel resource manager and the unprivileged
application layer, providing unified abstraction and state escrow.

2.1 Boot-Time Provisioning and State Escrow
------------------------
Upon initialization, systemd-tpmd evaluates the hardware provisioning
state. If unprovisioned, it acts based on a configuration parameter
(e.g., ProvisioningMode=3D):
* Auto (Default): It automatically takes ownership, generating
high-entropy cryptographic secrets for the Owner, Endorsement, and
Lockout hierarchies. It invokes TPM2_CreatePrimary to establish the
Storage Root Key (SRK) and utilizes TPM2_EvictControl to lock the SRK
into the TPM's persistent NVRAM at the TCG-standardized handle
0x81000001. The SRK is instantiated with an empty authorization value,
allowing the daemon to utilize it as a universal parent for encrypting
and decrypting application-specific child keys without needing to
unlock the protected Owner hierarchy.
* Deferred: To prevent conflicts with enterprise
infrastructure-as-code or CI/CD pipelines that strictly manage
deployment states, provisioning can be deferred. In this mode,
systemd-tpmd will wait for external tooling to trigger the
provisioning process via an explicit administrative command.

2.2 Application Ecosystem and Architectural Layers
------------------------
To ensure broad ecosystem compatibility, systemd-tpmd supports two
primary interaction paths for applications: a native Varlink API and a
fully supported OpenSSL 3.0 Provider. The architecture is defined as
follows:

* Layer 1: Applications (Daemons, web servers, systemd-cryptenroll) -
Consumers of cryptographic operations. Applications require zero
knowledge of TPM byte-marshaling and do not require membership in the
tss group.
* Layer 2: Interaction Interfaces (Varlink & OpenSSL 3.0) -
Applications interface with the broker either transparently via
standard OpenSSL EVP APIs (using the systemd-tpmd OpenSSL provider) or
directly via plain-text JSON over AF_UNIX sockets (io.systemd.Tpm).
Both paths provide strict process isolation, ensuring applications
never possess hardware file descriptors.
* Layer 3: The Broker (systemd-tpmd) - Stateful engine that securely
escrows hierarchy passwords, parses incoming requests, enforces
cgroup/user access controls, and evaluates PCR policies.
* Layer 4: TCG Stack (tpm2-tss / ESAPI) - Embedded strictly within the
daemon. Translates high-level requests into TCG-compliant byte streams
and establishes encrypted HMAC bus sessions.
* Layer 5: Kernel & HW (/dev/tpmrm0 & Physical TPM) - The Linux kernel
resource manager that multiplexes the physical, discrete TPM 2.0 chip.

2.3 Standard Interaction Sequence
------------------------
Step 1. Request Formulation: An unprivileged application (e.g., a web
server) needs to sign a TLS handshake. It reads its encrypted
privateBlob and publicBlob from the standard filesystem.
Step 2. Transmission: The application issues a signing request either
through the OpenSSL 3.0 provider or natively via a JSON Varlink
socket.
Step 3. Broker Execution: systemd-tpmd receives the request, utilizes
the public, empty-password SRK to load the encrypted private blob into
the TPM's volatile memory, and instructs the hardware to sign the
digest.
Step 4. Response Delivery: The TPM outputs the signature. systemd-tpmd
clears the transient context and returns the signature to the
application via the chosen interface. The application successfully
utilized the hardware without ever possessing permissions to the TPM
device node.

3. Supported Interaction Paths: Varlink and OpenSSL 3.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
systemd-tpmd provides two robust avenues for application integration,
ensuring both legacy compatibility and modern, lightweight IPC.

3.1 Path A: The OpenSSL 3.0 Provider
------------------------
To guarantee immediate, seamless integration for the vast majority of
the Linux ecosystem (including web servers, VPN daemons, and SSH
agents), systemd-tpmd ships with a dedicated OpenSSL 3.0 provider
module.
* Transparent Execution: When configured in openssl.cnf, applications
utilizing standard OpenSSL EVP APIs will have their cryptographic
operations transparently intercepted by the provider.
* Stateless Routing: The OpenSSL provider acts as a lightweight
client, packaging the OpenSSL memory buffers into Varlink payloads and
routing them to the systemd-tpmd daemon.
* Zero-Code Changes: Existing C/C++, Rust, and Python applications
relying on OpenSSL can leverage TPM hardware-backed keys with minimal
changes to application code.

3.2 Path B: Native Varlink API (io.systemd.Tpm)
------------------------
For applications desiring to communicate directly with the broker
without an OpenSSL dependency (such as early-boot utilities and
systemd native tools), systemd-tpmd exposes a Varlink interface
utilizing JSON over AF_UNIX sockets.

The methods exposed under the io.systemd.Tpm interface include:
* GenerateKey: Generates a new asymmetric key pair or symmetric secret
bound to the TPM. Outputs the encrypted marshaled structures for local
application storage.
* SignData: Loads the provided key blobs into the TPM using the SRK
and signs the provided digest.
* VerifySignature: Verifies a cryptographic signature against a given
digest utilizing the public blob.
* SealSecret: Seals a plaintext secret into the TPM, optionally
binding it to the current state of specific PCRs.
* UnsealSecret: Unseals a previously sealed secret from the TPM,
returning the plaintext only if the PCR states match.

Because the API relies on Varlink, native developers can utilize
libsystemd's sd-varlink.h to request cryptographic operations
synchronously:

#include <stdio.h>
#include <systemd/sd-varlink.h>
#include <systemd/sd-json.h>

int tpm_sign_payload(const char *priv_blob, const char *pub_blob,
const char *digest) {
    sd_varlink *link =3D NULL;
    sd_json_variant *args =3D NULL;
    sd_json_variant *reply =3D NULL;
    /* 1. Connect to the systemd-tpmd Varlink socket */
    sd_varlink_connect_url(&link, "unix:/run/systemd/tpmd/io.systemd.Tpm");
    /* 2. Build JSON arguments */
    sd_json_buildo(&args,
        SD_JSON_BUILD_PAIR("privateBlob", SD_JSON_BUILD_STRING(priv_blob)),
        SD_JSON_BUILD_PAIR("publicBlob", SD_JSON_BUILD_STRING(pub_blob)),
        SD_JSON_BUILD_PAIR("digest", SD_JSON_BUILD_STRING(digest))
    );
    /* 3. Execute the Varlink call synchronously */
    sd_varlink_call(link, "io.systemd.Tpm.SignData", args, &reply, NULL);
    /* Cleanup */
    return 0;
}

4. System Administration and Managed Environments
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
4.1 State Management and Daemon Recovery
------------------------
Because systemd-tpmd acts as a stateful userspace layer managing
active ESAPI encrypted HMAC sessions and escrowed passwords, a daemon
crash must not disrupt continuous remote attestation workflows or
trigger hardware lockouts. To defend against state loss, systemd-tpmd
utilizes the Linux Kernel Key Retention Service. Upon successful
provisioning, the highly sensitive Owner, Endorsement, and Lockout
passwords are securely injected into the kernel keyring and isolated
via KeyringMode=3Dprivate within the systemd service unit. If the daemon
restarts, it queries the kernel keyring to seamlessly to re-establish
its authentication contexts and session states without requiring user
intervention or causing DA lockouts.

4.2 Command Line Integration and Access Control
------------------------
Administration integrates directly into systemctl via a new top-level tpm v=
erb:
* systemctl tpm status: Reports hardware capabilities and the presence
of the SRK.
* systemctl tpm clear: Securely wipes the TPM and rotates the locally
escrowed hierarchy passwords.
* systemctl tpm reset-lockout: Submits the escrowed Owner password to
clear the DA lockout counter.

State-altering operations are strictly governed by polkit (PolicyKit).
systemd-tpmd will query polkit to ensure that only authenticated
administrators or enterprise management agents can mutate the physical
hardware's ownership state. Unprivileged users are physically
prevented from clearing the TPM or triggering anti-hammering lockouts.

5. Security, Sandboxing, and Simulation
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
5.1 Hardened Service Confinement
------------------------
systemd-tpmd leverages systemd's native sandboxing directives to
enforce the principle of least privilege. The unit file
(systemd-tpmd.service) incorporates:
* DynamicUser=3Dyes: Generates a dynamic, unprivileged user for the
execution context.
* CapabilityBoundingSet=3D: Drops all Linux capabilities except those
strictly required for hardware communication.
* DeviceAllow=3D/dev/tpmrm0 rw: Strictly limits hardware access to the
kernel resource manager.
* NoNewPrivileges=3Dyes: Prevents privilege escalation via execve.

5.2 Simulator Support and Fallback Prevention
------------------------
To support robust CI/CD and developer testing without wearing out
physical NVRAM, systemd-tpmd natively supports software emulators like
swtpm. Through a systemd drop-in configuration (e.g., using systemctl
edit systemd-tpmd), a developer can dynamically route the daemon's
transport layer away from /dev/tpmrm0 to a local software simulator.
However, falling back to a software emulator in a production
environment breaks the hardware root of trust.

Enforcement of this strict boundary relies on system administrators
utilizing systemd's native unit file configurations and the underlying
Linux kernel security modules (cgroups, namespaces, and Mandatory
Access Controls like AppArmor or SELinux). Administrators enforce
these protections by defining sandbox directives within the
/etc/systemd/system/systemd-tpmd.service file:
* Device Whitelisting (cgroups): The unit enforces
DeviceAllow=3D/dev/tpmrm0 rw. When systemd loads the service, it
configures the kernel's cgroup device controller to explicitly block
access to any other device. This guarantees the daemon is blocked from
interacting with virtual character devices like /dev/vtpmx used by
CUSE-based emulators.
* Network Sandboxing (namespaces): By applying
RestrictAddressFamilies=3DAF_UNIX (which permits local Varlink sockets
but entirely disables TCP/IP networking namespaces), systemd instructs
the kernel to physically block the daemon from opening outbound
network connections to a remote or local swtpm TCP port.

Because these rules are enforced by systemd (acting as PID 1) and the
Linux kernel itself, even a compromised systemd-tpmd process cannot
bypass them. These policies guarantee the daemon will fatally error
out rather than silently falling back to a compromised simulator in
live deployments.

6. Future Capabilities and Solvable Problems
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
By establishing systemd-tpmd as a persistent, centralized root of
trust in userspace, several long-standing ecosystem challenges beyond
basic cryptography can be elegantly resolved.

6.1 Seamless Firmware Updates (Solving the LUKS / fwupd Lockout)
------------------------
Currently, binding LUKS disk encryption to Platform Configuration
Registers creates severe system fragility. When an administrator
updates the system firmware using fwupd, the PCR 7 measurement
changes, which permanently breaks the LUKS unlocking policy and locks
the user out. systemd-tpmd will resolve this by leveraging
TPM2_PolicyAuthorize. Instead of binding disk encryption to static PCR
values, the disk is bound to a cryptographic ticket signed by
systemd-tpmd. When fwupd schedules an update, it can communicate its
intent via Varlink. systemd-tpmd can automatically generate a new
authorized policy for the incoming firmware state, ensuring the disk
unseals smoothly after the reboot.

6.2 Standardizing TPM-Backed Passkeys for the Linux Desktop
------------------------
The Linux desktop currently lacks a unified, hardware-backed API for
modern WebAuthn/FIDO2 passkeys. systemd-tpmd could serve as the
foundational backend for projects like credentialsd. By deriving keys
from the TPM's primary seed and encrypting the credential blobs,
systemd-tpmd would allow browsers to store highly secure,
phishing-resistant passkeys that never leave the hardware in
plaintext.

6.3 Stabilizing Continuous Remote Attestation for Fleet Management
------------------------
In enterprise deployments, continuous remote attestation agents (such
as Keylime) are used to cryptographically prove to a central server
that a machine's Linux Integrity Measurement Architecture (IMA) log
has not been compromised. However, these agents frequently suffer from
false alerts and access conflicts when querying the TPM simultaneously
with other system updates. By acting as the sole orchestrator,
systemd-tpmd could safely broker attestation quotes and IMA
measurements, ensuring that fleet management tools operate reliably
without resource contention on the /dev/tpmrm0 node.

6.4 Secure SSH Key Protection
------------------------
SSH private keys stored in local files are highly vulnerable to theft
by malware. While the TPM can mitigate this by generating and securing
the keys in hardware, configuring this currently requires end-users to
manage complex PKCS#11 libraries (like tpm2-pkcs11) and manipulate
paths. With systemd-tpmd, SSH agents could be rewritten to simply pass
signing payloads via Varlink, natively protecting SSH access across
the entire Linux ecosystem with zero configuration required from the
user. Alternatively, they can leverage the OpenSSL 3.0 provider
natively.

6.5 Confidential Computing and vTPM State Management
------------------------
In cloud environments leveraging AMD SEV-SNP or Intel TDX for
Confidential Computing, virtual TPMs (vTPMs) are injected into the
guest to provide measured boot guarantees. systemd-tpmd can easily
standardize the management of these virtual TPMs from inside the guest
OS. Because the daemon abstracts the underlying hardware, it can
interface with a cloud provider's vTPM exactly as it would a physical
chip, automatically provisioning it and simplifying the deployment of
Confidential Virtual Machines (CVMs) without requiring cloud-specific
user space tooling.

Thanks for your time and efforts reading into thie proposal. Any
thoughts, critiques, or architectural feedback are highly appreciated.

Best Regards,
Akshay Hendre
