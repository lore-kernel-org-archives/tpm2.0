Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8696B126BF7
	for <tpm2@lists.linux.dev>; Sun, 24 May 2026 12:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779625265; cv=pass; b=fSP6TzuhIOWFit1sZMFjHomJ8RMXFWKq0Japabcw/ABR2DQmRP4pqBoBdogbvjWTsEcptzmX5+KRXaIOfxaL6wepFGGQRgP0/eBkzUhIvDZePhIK+CmqG7usiJ+/8gw5QcuTfEs4c6LfJu2ZDYlFnqe/TY9JtR4PT2BSePp5WFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779625265; c=relaxed/simple;
	bh=eMuNNun1XQBzmbHJpCBbczet3B2D895FjMIcjag50H4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7iozYGqaYDmGEF+ONEcL4ABFDTYJsuJb1e4HM0R1oDQm2PROwEo7xfy+hFiGxlWFasrOpbD+MDPAYFng71AQVN4NieHtPahpxnd3DFBbgxaan6vJZxT1apAtSpfVhBBazDTZT4Dc67cRIJigSWJz0QIEgQXQKt/lWqyVb7/Yqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJauRjg8; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJauRjg8"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd9a71b565aso959080466b.0
        for <tpm2@lists.linux.dev>; Sun, 24 May 2026 05:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779625261; cv=none;
        d=google.com; s=arc-20240605;
        b=H1ZvcEG06Iq40R4hyLbceWruo/Uo0jQI44ZuVjiCrcdG55UzIccdBsxD9x+C46ku6u
         jmd7RPl2ijXPaAcjrrg6AKu2qS/YziyxTQTteY7cdfcKQ1Xe696Pc1Nuq4MaDJnpCkLS
         6aqtkyFZsFsvhUq6pj6Zpu2epvXfFBTatZgRqpGZs5l5+XX9ENZdNMpEAgl92D1l/xnX
         M0ALxkAfy45iWpqpDR4krztkCU7PXjMI1fd5SrDg6N19vWKPtOJp9tBHSjiLrzh7Mmne
         mIJQLSj3Oodp/rX1IWMOp/BXfWsBDFwgEKLuVhWFptrUELA9K5I3XPugKu39uJiJA9WL
         TStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wuUnz5zNTxaTu4qOuur+wkfUO5JkCWg3fNZvNBVwCGk=;
        fh=BwKx8mO5GIFkruo4KZ4TtIEmfHDdmSs/yUg7e0epLME=;
        b=dO7tDdwYFXs1vxnqZh7oG0pjb6hUKeqRzxhAsQPolpV2V6MnT0/5gPS1z3gXATfKTU
         aKDPLrXS4aDqHji5r+pKh4pu3aujG93PoXgSxEINDIsNSKwYBm2KV0HwQUGAsKCvyNPG
         j+4CI0I98an4kRalzQMM6MnHsp/rr8oEowumUUCxY6srUgBZ87ZIFae1c/dRk3fvvs0A
         p3FTkqalOztnC1MzE5E96uu/sJN7lRGZGhf8OnDUu5dmeHhKHsxr+YxbJJtkSmkl7R0+
         HPDJ/V6smI5BRNsB8YKXxLwzlooqPpbIcBCrp/zek5EHfF2SkykygdHicwyV7WGPZsob
         gLWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779625261; x=1780230061; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuUnz5zNTxaTu4qOuur+wkfUO5JkCWg3fNZvNBVwCGk=;
        b=YJauRjg8OwVgFCBQwH7neEBE78rnMXtZDlPa7lYqlZFitOd1idUlG8lyXK8f0DWD1O
         ghwLqVgUD+2/SfCfUSJ6gzc58cpKG/18OIzTUe7Ma4Gu3cYGy+tNC9NXXY0vRBDmge5/
         G7VMwZzHe8crdM1dEZ+Clvskmrd1CZjgv7xXhx8N+OoKXKhHI/7bpmLYo9PIivDkyHHB
         norIWwrf9saui2n6zfay1n5I2lzcxd4O0R0/Mnn3xnJYHhJihMrl3AJF6K0NwHV/fAg7
         2z72ehQysNILSk5EERGYDuAXqf+A/aSl7xdxe/ekrQia+4sY+noKUhOHmIftLip5ewjf
         eY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779625261; x=1780230061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wuUnz5zNTxaTu4qOuur+wkfUO5JkCWg3fNZvNBVwCGk=;
        b=bdh04YkSyQTS39GVUhrQQLuxBRa+CpXuthpewKwyIjS0VvFt4G9mzTRYhC7De+3cH/
         KPBZCOQQMXnp4S+q4etYOdN37OMBinThUZQ/mfJUeBTZvpmBC4kkoj0zDPPqZJKCHP0R
         YXkZnbzFCMbLExfFURJVxQ3YPuzy37EG3MTERq/JPVfdMRreGG3nMXBp8fPnF/SVrvwA
         bXeGHy0fBe0x3VbSCUuJzzsbQ4FRuRhv6150bIOHyZuV2ribl3d8xKYGuK30zMFo3x0Q
         IsW4Ww7fe1WwvRqcOUiysO3kAsEG3MRifvFQf6ZoC1pZFL0y3bGFGqHjEFLd+ADd0f+P
         xtqA==
X-Gm-Message-State: AOJu0YyxmF6iqezMcN96i74qdyJNKoiucY/mnY5Lw/B9RafiMUXp3fif
	cq88KZo8nPLOqTbFTUSf6Acvti7fKwXreRVGXEz3OBjbUrRR1GS35ifzdT3gs+ZGplOxDfYgPkG
	GON2lq3cQtLbFI9pRMC6TEz9VP1Za6As=
X-Gm-Gg: Acq92OH5m8g+/b9D73mhS/JSwbIHrxIUIQzilQWpKjd5RlOh2qlpnA0g+ToPYIKvcjB
	5/FkZHcjR65ES9n9NtVnfipjwa607sRklTwPJN9O2HohMeV9XWlH/QvNN3NerBqEX5w57TY62CZ
	0cTkP8jE6op3pBj5fWVYtJ3IEd1ErB0VohCtsn/89CQZPtbMMdrBECbhxU2bdkdDMtN2qdgbDDt
	g0TUaz0r+o6UMpyNImgE4TOZiJgzRZvldXB6O0rigMau7iBTEkDLInVeUjgIp72k6xVzQvcpThc
	a2U1mUie
X-Received: by 2002:a17:907:75f8:b0:bc6:1c2:ee46 with SMTP id
 a640c23a62f3a-bdd22e30ca3mr485877466b.11.1779625260398; Sun, 24 May 2026
 05:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAGG+4T3qmDg7utUUB+c2Q_mqOJpRcMzGM_RwBxaeyPE3qbgSw@mail.gmail.com>
 <CAAGG+4T2qRFS7Bn8t_05hyVDzwG-by7Z9zmh1tvkVkcOXDcLNA@mail.gmail.com> <1a0ca30ca63e486ca43a66477b5f6f4f@infineon.com>
In-Reply-To: <1a0ca30ca63e486ca43a66477b5f6f4f@infineon.com>
From: Akshay Hendre <ahendre2010@gmail.com>
Date: Sun, 24 May 2026 17:50:49 +0530
X-Gm-Features: AVHnY4LcdSmDQb3MKyv6OERZgjsT6yolGPAg3usIvTxA6vnRl75Q9W6UKtoBHBA
Message-ID: <CAAGG+4TdWCVYJCEmDuvcg5irAnL5DiTs4vLVrjPuU7FaVhpd7A@mail.gmail.com>
Subject: Re: [RFC] Proposal for Centralized TPM 2.0 Userspace Management
 Layer: systemd-tpmd
To: Andreas.Fuchs@infineon.com
Cc: tpm2@lists.linux.dev, systemd-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

Thanks for the welcome and the highly constructive feedback. I took
some time over the past couple of weeks to dig into the specific
modules you mentioned, and I definitely came away knowing a lot more
about the current capabilities of the stack. I'm very glad we share
the same ultimate goal of making the TPM a seamless part of the Linux
ecosystem.

My primary motivation was absolutely not to fragment the ecosystem.
Instead, systemd-tpmd was born out of some steep learning curves and
architectural friction I encountered while trying to build concurrent,
TPM-backed applications that works on Windows and Linux systems. I am
highly open to pivoting these ideas into the existing tpm2-tss stack
where it makes sense.

To address your points directly:

1. FAPI, ESAPI, and the Keystore
The main friction point I hit was wanting to manage TPM blobs within
my own application's custom file format/database to that natively
handles concurrent access.

    FAPI abstracted the cryptography, but it forced the use of its own
file-based keystore, which was causing the 0x0006000b permission and
concurrency errors I mentioned. FAPI didn't expose an easy way for me
to just pass it my own raw blobs, I now understand the blockers.

    Moving down to ESAPI allowed me to handle the blobs, but the
learning curve spiked. Suddenly I had to manually manage the SRK, deal
with protected Owner hierarchies, and establish HMAC sessions. (I was
actually unaware of the standardized persistent handle approach for
the SRK until diving deeper recently).

Regarding your point on the FAPI keystore abstraction, I am definitely
interested in exploring alternative implementations here.

2. OpenSSL Provider
I was actually unaware of the full capabilities of tpm2-openssl.
Having looked into it based on your recommendation, it essentially
solves the application-layer integration exactly as I envisioned.
Rather than reinventing the wheel with a new provider.

3. Boot-Time Provisioning & Passwords
My concept here was heavily inspired by the Windows CNG paradigm,
aiming for "zero-touch" infrastructure while avoiding hardcoded
secrets. My thought was to auto-generate high-entropy passwords during
boot and escrow them securely within the Linux Kernel Key Retention
Service (keyctl), completely removing the user from the
password-setting loop while protecting against DA lockouts.

Has the tpm2-tss team evaluated using the kernel keyring for
state/password escrow? I would be very curious to know if there were
blockers that ruled this out.

4. Attestation and Event Logs
I would be very interested in dedicating my time to helping build out
the backend service and network protocols required to assess Event
logs and handle Quotes reliably.

What is the best way to kick off discussions on the attestation
service requirements?

Best Regards,
Akshay Hendre

On Mon, 11 May 2026 at 19:17, <Andreas.Fuchs@infineon.com> wrote:
>
> Hi Akshay,
>
> first of all, let me say that I am very happy to see such interest in mak=
ing the TPM usable throughout Linux.
> This has also been the main driver for me to get us going.
> Now on to some of your points:
>
> Main motivation:
> I would love to see fixes for short comings you see to be included in the=
 existing tpm2-tss modules
> instead of introducing yet another API to the eco system and ultimately l=
eading to more fragmentation
> and confusion for end users.
>
> FAPI keystore:
> I know that the file-based storage of key (meta) data can be a bit proble=
matic at times.
> Honestly, it was a restriction introduced by time a resource availability=
.
> I'd love to see alternative implementations that could be based on a syst=
em service or other means.
> I'd also love to see an implementation that runs on windows.
> We do have an internal abstraction for the keystore in FAPI and I'd invit=
e you to please contribute with
> alternative implementations here.
> This could very much also include VARLINK or DBus based communication to =
a keystore service.
>
> Language agnosticity:
> We already have bindings for Python and Rust besides the existing C imple=
mentation.
> We also have a dlopen-based API for private inclusion.
> If there are major users beyond these languages, I'd proposal to let's ad=
d more bindings.
>
> OpenSSL:
> There already exists the tpm2-openssl provider that basically does what y=
ou envision.
> I'd love to see this being extended to using FAPI keystore as well as the=
 FAPI policy language
> capabilities.
> So the use case you offer seems to already be implemented here.
> If not please let us know the specific shortcomings you see here.
>
> API (tpm_sign_payload):
> This looks very very similar to the Fapi_Sign() functionality.
> Coming back to my first point here, IMHO we are already close to what you=
 want and I'd
> love to hear about specific shortcomings and then to see them being addre=
ssed in the tpm2-tss
> FAPI module itself, instead of creating a new "competing" service impleme=
ntation.
>
> Boot-time provisioning:
> This is a tough one. We've though hard about adding automated provisionin=
g but decided to
> postpone it until the user calls Fapi_Provision() i.e. tss2_provision.
> This allows configuration of preferred crypto profile and other things.
> Also since provisioning requires user interaction for password setting, w=
e did not know how
> to do it differently.
> That being said, I could totally see this being integration "better" with=
 a GUI or similar or inside the
> distro installers.
>
> Attestation and such:
> Here we still have the biggest shortcoming. There are attempts here and t=
here but the big problem
> has always been the generation of reference values and the assessment of =
Quotes.
> The Fapi_Quote command already gives you the system state with all its lo=
gs, but we need network
> protocols and then specifically a backend service for assessing the Event=
 logs. This is where the
> big work lives.
>
> All that being said, I am very open to getting stuff into tpm2-tss in ord=
er to facilitate more use cases.
>
> Maybe we can have separate discussions for some of your short comings and=
 get a bit more into
> depth on each of these.
>
> Looking forward to more discussions on this topic.
>
> Cheers,
> Andreas
>
>
> -----Original Message-----
> From: Akshay Hendre <ahendre2010@gmail.com>
> Sent: Sonntag, 10. Mai 2026 10:11
> To: tpm2@lists.linux.dev
> Subject: Fwd: [RFC] Proposal for Centralized TPM 2.0 Userspace Management=
 Layer: systemd-tpmd
>
> Caution: This e-mail originated outside Infineon Technologies. Please be =
cautious when sharing information or opening attachments especially from un=
known senders. Refer to our intranet guide<https://intranet-content.infineo=
n.com/explore/aboutinfineon/rules/informationsecurity/ug/SocialEngineering/=
Pages/SocialEngineeringElements_en.aspx> to help you identify Phishing emai=
l.
>
>
>
> I am cross-posting proposal for [RFC: systemd-tpmd] for the right audienc=
e.
>
> ---------- Forwarded message ---------
> From: Akshay Hendre <ahendre2010@gmail.com>
> Date: Sun, 10 May 2026 at 13:31
> Subject: [RFC] Proposal for Centralized TPM 2.0 Userspace Management
> Layer: systemd-tpmd
> To: <systemd-devel@lists.freedesktop.org>
>
>
> Hello all,
>
> I am submitting a proposal to introduce systemd-tpmd, a centralized TPM 2=
.0 userspace management layer designed to serve as the foundation for TPM i=
ntegration on Linux. This proposal deliberately focuses on architectural de=
sign in order to reach consensus before diving into implementation details.
>
> Table of Contents
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. Problem Statement
> 2. Proposed Solution: systemd-tpmd Architecture
>    2.1 Boot-Time Provisioning and State Escrow
>    2.2 Application Ecosystem and Architectural Layers
>    2.3 Standard Interaction Sequence
> 3. Supported Interaction Paths: Varlink and OpenSSL 3.0
>    3.1 Path A: The OpenSSL 3.0 Provider
>    3.2 Path B: Native Varlink API (io.systemd.Tpm) 4. System Administrati=
on and Managed Environments
>    4.1 State Management and Daemon Recovery
>    4.2 Command Line Integration and Access Control 5. Security, Sandboxin=
g, and Simulation
>    5.1 Hardened Service Confinement
>    5.2 Simulator Support and Fallback Prevention 6. Future Capabilities a=
nd Solvable Problems
>    6.1 Seamless Firmware Updates (Solving the LUKS / fwupd Lockout)
>    6.2 Standardizing TPM-Backed Passkeys for the Linux Desktop
>    6.3 Stabilizing Continuous Remote Attestation for Fleet Management
>    6.4 Secure SSH Key Protection
>    6.5 Confidential Computing and vTPM State Management
>
> 1. Problem Statement
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> While the Linux kernel provides robust low-level multiplexing for the Tru=
sted Platform Module via /dev/tpmrm0, the userspace ecosystem currently lac=
ks a centralized, stateful broker to manage hardware cryptography. To under=
stand these gaps, it is useful to compare the Linux landscape with the esta=
blished Windows paradigm. On Windows, hardware cryptography is handled seam=
lessly via the Cryptography API:
> Next Generation (CNG) and the Platform Crypto Provider (PCP). The Windows=
 operating system automatically takes ownership of the TPM during boot, sec=
urely escrows the owner password, and provides a unified, multi-tenant brok=
er for all applications. Developers simply request a cryptographic operatio=
n, and the OS handles the hardware state, context swapping, and security au=
thorizations automatically.
>
> In stark contrast, the Linux ecosystem delegates hardware state managemen=
t and cryptographic session establishment directly to the applications them=
selves. This fragmented approach creates severe architectural gaps that imp=
act multiple groups:
>
> * Application Developers: Enhanced System API (ESAPI) and the operational=
 fragility of the Feature API (FAPI). While ESAPI requires expert-level har=
dware management=E2=80=94such as manually invoking TPM2_CreatePrimary for S=
RK provisioning=E2=80=94it risks locking out applications if the Owner Hier=
archy is password-protected. Conversely, FAPI simplifies provisioning but i=
ntroduces a fragile file-based keystore (typically /var/lib/tpm2-tss/system=
/keystore) that frequently triggers fatal 0x0006000b (Permission Denied) er=
rors during concurrent access.
> * System Administrators: Currently, because there is no centralized daemo=
n to automatically provision the TPM and establish a shared Storage Root Ke=
y (SRK), applications often attempt to create their own primary keys direct=
ly under the Owner hierarchy. If an administrator follows security best pra=
ctices and password-protects the Owner hierarchy, core OS utilities like sy=
stemd-cryptenroll immediately fail to bind LUKS2 volumes, throwing an 0x000=
009a2 authorization error.
> Administrators are caught in a paradox: leave the TPM Owner hierarchy ent=
irely unprotected, or break system functionality.
> * Managed Enterprise Fleets: In large deployments, the lack of a centrali=
zed policy broker means that standard software and kernel updates alter Pla=
tform Configuration Registers (PCRs). This arbitrarily breaks fragile local=
 trust chains, locks users out of encrypted disks, and causes disruptive fa=
lse positives in continuous remote attestation frameworks.
>
> 2. Proposed Solution: systemd-tpmd Architecture =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D systemd-tpmd is proposed a=
s a persistent, stateful userspace management layer acting as the absolute =
foundation for TPM integration on Linux. It operates as a highly privileged=
 system daemon sitting directly between the in-kernel resource manager and =
the unprivileged application layer, providing unified abstraction and state=
 escrow.
>
> 2.1 Boot-Time Provisioning and State Escrow
> ------------------------
> Upon initialization, systemd-tpmd evaluates the hardware provisioning sta=
te. If unprovisioned, it acts based on a configuration parameter (e.g., Pro=
visioningMode=3D):
> * Auto (Default): It automatically takes ownership, generating high-entro=
py cryptographic secrets for the Owner, Endorsement, and Lockout hierarchie=
s. It invokes TPM2_CreatePrimary to establish the Storage Root Key (SRK) an=
d utilizes TPM2_EvictControl to lock the SRK into the TPM's persistent NVRA=
M at the TCG-standardized handle 0x81000001. The SRK is instantiated with a=
n empty authorization value, allowing the daemon to utilize it as a univers=
al parent for encrypting and decrypting application-specific child keys wit=
hout needing to unlock the protected Owner hierarchy.
> * Deferred: To prevent conflicts with enterprise infrastructure-as-code o=
r CI/CD pipelines that strictly manage deployment states, provisioning can =
be deferred. In this mode, systemd-tpmd will wait for external tooling to t=
rigger the provisioning process via an explicit administrative command.
>
> 2.2 Application Ecosystem and Architectural Layers
> ------------------------
> To ensure broad ecosystem compatibility, systemd-tpmd supports two primar=
y interaction paths for applications: a native Varlink API and a fully supp=
orted OpenSSL 3.0 Provider. The architecture is defined as
> follows:
>
> * Layer 1: Applications (Daemons, web servers, systemd-cryptenroll) - Con=
sumers of cryptographic operations. Applications require zero knowledge of =
TPM byte-marshaling and do not require membership in the tss group.
> * Layer 2: Interaction Interfaces (Varlink & OpenSSL 3.0) - Applications =
interface with the broker either transparently via standard OpenSSL EVP API=
s (using the systemd-tpmd OpenSSL provider) or directly via plain-text JSON=
 over AF_UNIX sockets (io.systemd.Tpm).
> Both paths provide strict process isolation, ensuring applications never =
possess hardware file descriptors.
> * Layer 3: The Broker (systemd-tpmd) - Stateful engine that securely escr=
ows hierarchy passwords, parses incoming requests, enforces cgroup/user acc=
ess controls, and evaluates PCR policies.
> * Layer 4: TCG Stack (tpm2-tss / ESAPI) - Embedded strictly within the da=
emon. Translates high-level requests into TCG-compliant byte streams and es=
tablishes encrypted HMAC bus sessions.
> * Layer 5: Kernel & HW (/dev/tpmrm0 & Physical TPM) - The Linux kernel re=
source manager that multiplexes the physical, discrete TPM 2.0 chip.
>
> 2.3 Standard Interaction Sequence
> ------------------------
> Step 1. Request Formulation: An unprivileged application (e.g., a web
> server) needs to sign a TLS handshake. It reads its encrypted privateBlob=
 and publicBlob from the standard filesystem.
> Step 2. Transmission: The application issues a signing request either thr=
ough the OpenSSL 3.0 provider or natively via a JSON Varlink socket.
> Step 3. Broker Execution: systemd-tpmd receives the request, utilizes the=
 public, empty-password SRK to load the encrypted private blob into the TPM=
's volatile memory, and instructs the hardware to sign the digest.
> Step 4. Response Delivery: The TPM outputs the signature. systemd-tpmd cl=
ears the transient context and returns the signature to the application via=
 the chosen interface. The application successfully utilized the hardware w=
ithout ever possessing permissions to the TPM device node.
>
> 3. Supported Interaction Paths: Varlink and OpenSSL 3.0 =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D systemd-tpmd prov=
ides two robust avenues for application integration, ensuring both legacy c=
ompatibility and modern, lightweight IPC.
>
> 3.1 Path A: The OpenSSL 3.0 Provider
> ------------------------
> To guarantee immediate, seamless integration for the vast majority of the=
 Linux ecosystem (including web servers, VPN daemons, and SSH agents), syst=
emd-tpmd ships with a dedicated OpenSSL 3.0 provider module.
> * Transparent Execution: When configured in openssl.cnf, applications uti=
lizing standard OpenSSL EVP APIs will have their cryptographic operations t=
ransparently intercepted by the provider.
> * Stateless Routing: The OpenSSL provider acts as a lightweight client, p=
ackaging the OpenSSL memory buffers into Varlink payloads and routing them =
to the systemd-tpmd daemon.
> * Zero-Code Changes: Existing C/C++, Rust, and Python applications relyin=
g on OpenSSL can leverage TPM hardware-backed keys with minimal changes to =
application code.
>
> 3.2 Path B: Native Varlink API (io.systemd.Tpm)
> ------------------------
> For applications desiring to communicate directly with the broker without=
 an OpenSSL dependency (such as early-boot utilities and systemd native too=
ls), systemd-tpmd exposes a Varlink interface utilizing JSON over AF_UNIX s=
ockets.
>
> The methods exposed under the io.systemd.Tpm interface include:
> * GenerateKey: Generates a new asymmetric key pair or symmetric secret bo=
und to the TPM. Outputs the encrypted marshaled structures for local applic=
ation storage.
> * SignData: Loads the provided key blobs into the TPM using the SRK and s=
igns the provided digest.
> * VerifySignature: Verifies a cryptographic signature against a given dig=
est utilizing the public blob.
> * SealSecret: Seals a plaintext secret into the TPM, optionally binding i=
t to the current state of specific PCRs.
> * UnsealSecret: Unseals a previously sealed secret from the TPM, returnin=
g the plaintext only if the PCR states match.
>
> Because the API relies on Varlink, native developers can utilize libsyste=
md's sd-varlink.h to request cryptographic operations
> synchronously:
>
> #include <stdio.h>
> #include <systemd/sd-varlink.h>
> #include <systemd/sd-json.h>
>
> int tpm_sign_payload(const char *priv_blob, const char *pub_blob, const c=
har *digest) {
>     sd_varlink *link =3D NULL;
>     sd_json_variant *args =3D NULL;
>     sd_json_variant *reply =3D NULL;
>     /* 1. Connect to the systemd-tpmd Varlink socket */
>     sd_varlink_connect_url(&link, "unix:/run/systemd/tpmd/io.systemd.Tpm"=
);
>     /* 2. Build JSON arguments */
>     sd_json_buildo(&args,
>         SD_JSON_BUILD_PAIR("privateBlob", SD_JSON_BUILD_STRING(priv_blob)=
),
>         SD_JSON_BUILD_PAIR("publicBlob", SD_JSON_BUILD_STRING(pub_blob)),
>         SD_JSON_BUILD_PAIR("digest", SD_JSON_BUILD_STRING(digest))
>     );
>     /* 3. Execute the Varlink call synchronously */
>     sd_varlink_call(link, "io.systemd.Tpm.SignData", args, &reply, NULL);
>     /* Cleanup */
>     return 0;
> }
>
> 4. System Administration and Managed Environments =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 4.1 State Management and Daemon Recovery
> ------------------------
> Because systemd-tpmd acts as a stateful userspace layer managing active E=
SAPI encrypted HMAC sessions and escrowed passwords, a daemon crash must no=
t disrupt continuous remote attestation workflows or trigger hardware locko=
uts. To defend against state loss, systemd-tpmd utilizes the Linux Kernel K=
ey Retention Service. Upon successful provisioning, the highly sensitive Ow=
ner, Endorsement, and Lockout passwords are securely injected into the kern=
el keyring and isolated via KeyringMode=3Dprivate within the systemd servic=
e unit. If the daemon restarts, it queries the kernel keyring to seamlessly=
 to re-establish its authentication contexts and session states without req=
uiring user intervention or causing DA lockouts.
>
> 4.2 Command Line Integration and Access Control
> ------------------------
> Administration integrates directly into systemctl via a new top-level tpm=
 verb:
> * systemctl tpm status: Reports hardware capabilities and the presence of=
 the SRK.
> * systemctl tpm clear: Securely wipes the TPM and rotates the locally esc=
rowed hierarchy passwords.
> * systemctl tpm reset-lockout: Submits the escrowed Owner password to cle=
ar the DA lockout counter.
>
> State-altering operations are strictly governed by polkit (PolicyKit).
> systemd-tpmd will query polkit to ensure that only authenticated administ=
rators or enterprise management agents can mutate the physical hardware's o=
wnership state. Unprivileged users are physically prevented from clearing t=
he TPM or triggering anti-hammering lockouts.
>
> 5. Security, Sandboxing, and Simulation
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 5.1 Hardened Service Confinement
> ------------------------
> systemd-tpmd leverages systemd's native sandboxing directives to enforce =
the principle of least privilege. The unit file
> (systemd-tpmd.service) incorporates:
> * DynamicUser=3Dyes: Generates a dynamic, unprivileged user for the execu=
tion context.
> * CapabilityBoundingSet=3D: Drops all Linux capabilities except those str=
ictly required for hardware communication.
> * DeviceAllow=3D/dev/tpmrm0 rw: Strictly limits hardware access to the ke=
rnel resource manager.
> * NoNewPrivileges=3Dyes: Prevents privilege escalation via execve.
>
> 5.2 Simulator Support and Fallback Prevention
> ------------------------
> To support robust CI/CD and developer testing without wearing out physica=
l NVRAM, systemd-tpmd natively supports software emulators like swtpm. Thro=
ugh a systemd drop-in configuration (e.g., using systemctl edit systemd-tpm=
d), a developer can dynamically route the daemon's transport layer away fro=
m /dev/tpmrm0 to a local software simulator.
> However, falling back to a software emulator in a production environment =
breaks the hardware root of trust.
>
> Enforcement of this strict boundary relies on system administrators utili=
zing systemd's native unit file configurations and the underlying Linux ker=
nel security modules (cgroups, namespaces, and Mandatory Access Controls li=
ke AppArmor or SELinux). Administrators enforce these protections by defini=
ng sandbox directives within the /etc/systemd/system/systemd-tpmd.service f=
ile:
> * Device Whitelisting (cgroups): The unit enforces
> DeviceAllow=3D/dev/tpmrm0 rw. When systemd loads the service, it configur=
es the kernel's cgroup device controller to explicitly block access to any =
other device. This guarantees the daemon is blocked from interacting with v=
irtual character devices like /dev/vtpmx used by CUSE-based emulators.
> * Network Sandboxing (namespaces): By applying RestrictAddressFamilies=3D=
AF_UNIX (which permits local Varlink sockets but entirely disables TCP/IP n=
etworking namespaces), systemd instructs the kernel to physically block the=
 daemon from opening outbound network connections to a remote or local swtp=
m TCP port.
>
> Because these rules are enforced by systemd (acting as PID 1) and the Lin=
ux kernel itself, even a compromised systemd-tpmd process cannot bypass the=
m. These policies guarantee the daemon will fatally error out rather than s=
ilently falling back to a compromised simulator in live deployments.
>
> 6. Future Capabilities and Solvable Problems =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D By establishing systemd-tpmd =
as a persistent, centralized root of trust in userspace, several long-stand=
ing ecosystem challenges beyond basic cryptography can be elegantly resolve=
d.
>
> 6.1 Seamless Firmware Updates (Solving the LUKS / fwupd Lockout)
> ------------------------
> Currently, binding LUKS disk encryption to Platform Configuration Registe=
rs creates severe system fragility. When an administrator updates the syste=
m firmware using fwupd, the PCR 7 measurement changes, which permanently br=
eaks the LUKS unlocking policy and locks the user out. systemd-tpmd will re=
solve this by leveraging TPM2_PolicyAuthorize. Instead of binding disk encr=
yption to static PCR values, the disk is bound to a cryptographic ticket si=
gned by systemd-tpmd. When fwupd schedules an update, it can communicate it=
s intent via Varlink. systemd-tpmd can automatically generate a new authori=
zed policy for the incoming firmware state, ensuring the disk unseals smoot=
hly after the reboot.
>
> 6.2 Standardizing TPM-Backed Passkeys for the Linux Desktop
> ------------------------
> The Linux desktop currently lacks a unified, hardware-backed API for mode=
rn WebAuthn/FIDO2 passkeys. systemd-tpmd could serve as the foundational ba=
ckend for projects like credentialsd. By deriving keys from the TPM's prima=
ry seed and encrypting the credential blobs, systemd-tpmd would allow brows=
ers to store highly secure, phishing-resistant passkeys that never leave th=
e hardware in plaintext.
>
> 6.3 Stabilizing Continuous Remote Attestation for Fleet Management
> ------------------------
> In enterprise deployments, continuous remote attestation agents (such as =
Keylime) are used to cryptographically prove to a central server that a mac=
hine's Linux Integrity Measurement Architecture (IMA) log has not been comp=
romised. However, these agents frequently suffer from false alerts and acce=
ss conflicts when querying the TPM simultaneously with other system updates=
. By acting as the sole orchestrator, systemd-tpmd could safely broker atte=
station quotes and IMA measurements, ensuring that fleet management tools o=
perate reliably without resource contention on the /dev/tpmrm0 node.
>
> 6.4 Secure SSH Key Protection
> ------------------------
> SSH private keys stored in local files are highly vulnerable to theft by =
malware. While the TPM can mitigate this by generating and securing the key=
s in hardware, configuring this currently requires end-users to manage comp=
lex PKCS#11 libraries (like tpm2-pkcs11) and manipulate paths. With systemd=
-tpmd, SSH agents could be rewritten to simply pass signing payloads via Va=
rlink, natively protecting SSH access across the entire Linux ecosystem wit=
h zero configuration required from the user. Alternatively, they can levera=
ge the OpenSSL 3.0 provider natively.
>
> 6.5 Confidential Computing and vTPM State Management
> ------------------------
> In cloud environments leveraging AMD SEV-SNP or Intel TDX for Confidentia=
l Computing, virtual TPMs (vTPMs) are injected into the guest to provide me=
asured boot guarantees. systemd-tpmd can easily standardize the management =
of these virtual TPMs from inside the guest OS. Because the daemon abstract=
s the underlying hardware, it can interface with a cloud provider's vTPM ex=
actly as it would a physical chip, automatically provisioning it and simpli=
fying the deployment of Confidential Virtual Machines (CVMs) without requir=
ing cloud-specific user space tooling.
>
> Thanks for your time and efforts reading into thie proposal. Any thoughts=
, critiques, or architectural feedback are highly appreciated.
>
> Best Regards,
> Akshay Hendre
>
