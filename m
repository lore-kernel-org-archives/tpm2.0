Content-Type: multipart/mixed; boundary="===============5140013607949820268=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Check to see if signature is okay, then reboot
Date: Thu, 05 Dec 2019 15:18:19 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E4C232@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CALtZhhNYmOKOTN-FSP-NMuhe5b320Enu4v6X6QQsAP8H10N5fA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5140013607949820268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Frederick Gotham [mailto:cauldwell.thomas(a)gmail.com]
> Sent: Wednesday, December 4, 2019 2:04 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2 <tpm2(a)list=
s.01.org>
> Subject: Re: Check to see if signature is okay, then reboot
> =

> =

> 	You need to call tpm2_loadexternal again to load the public portion of t=
he
> key into
> 	The TPM or you need to mark the pubic object persistent with
> tpm2_evictcontrol.
> 	However, I would urge against that. Just load the object when you need
> it. A RM
> 	Should take care of flushing "transient" objects when your don't with
> them, or if
> 	Using the TPM directly, tpm2_flushcontext.
> =

> =

> =

> =

> Against all logic or rationale, I simply have to fulfill one of the requi=
rements that
> my boss has given me (which was handed down to him from another person).
> The requirement is that no RSA keys are stored on the hard disk. Therefor=
e a
> public key must be loaded into the TPM2 chip once in the factory where is=
 to be
> stored persistently and used to verify signatures.

You can't persist a public only portion of a key. Per the spec:
If objectHandle references a Transient Object:
The TPM shall return TPM_RC_ATTRIBUTES if
1) it is in the hierarchy of TPM_RH_NULL,
2) only the public portion of the object is loaded, or
3) the stClear is SET in the object or in an ancestor key.

> =

> So how should I go about this?

To do this, which makes no sense. Unless your gating access to a secret/pri=
vate on the TPM
via policy/password or using attestation features, it doesn't make sense. B=
ut anyways, you can
use nvram to store it, and then use the key externally with openssl or call=
 tpm2_loadexternal
again.

assuming you have a certificate or whatever as public.pem
size=3D$(wc -c public.pem | cut -d' ' -f1-1)

# NOTE: you can pick the nvindex by passing an argument starting at 0 or th=
e actual tpm address
tpm2_nvdefine -s $size
nv-index: 0x1000000

tpm2_nvwrite -i public.pem 0

tpm2_nvread 0
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoFPZTTN+JvjQuAuFCx5Y
lrziFRKfreNrqmp0rBZwv7D2fElBBPKBglpPBD30XYQV+d+Rj6gIwN5vAt64Rrqd
dAM1SGOnj9WL0O7aL3KAJB6JuOpd9eWa7bftviEg/u4P18K3h5rxlqy1AYrLSMg1
lJHMmibyxCgf8K5cAZAcGz5zc5VtHD6hO/IsvJwwltOLadhJFPC9mcjhjlfLzXdl
jx+PlJ0RQp6ZzAChLB0UkqVHaF41YSCYmJhIM8INu6n3+HwcSbFK93jP12+AmBKX
thRUcdaf3FxttKfIUQ5dHhyxAhxVCgrAhsVEQTMO9LDIMBMouVIRWd6aat77tRC0
pQIDAQAB
-----END PUBLIC KEY-----

You could tpm2_loadexternal that back If you desire.

That will get it loaded in, but again it=E2=80=99s a public key, thus you j=
ust assume everyone
has it, that=E2=80=99s how PKI works.

A better way, would be that FW is not released from a server unless an atte=
station
Is done with a key gated on policysignature using at least a pcr policy. Th=
e key could
Tied to the manufacturer certificate/EndorsmentCRredential or part of the e=
ndorsement
hierarchy. A quote could be exchanged with the server, so the server can va=
lidate the device
is in a known state, and then release the firmware encrypted with that mach=
ines public key
and sent to the client. That private key, which is gated on policy, can the=
n be used to decrypt
the firmware.

I'm not sure if this is the best way, but it's better than storing a public=
 key for verification in the TPM,
That doesn't buy you anything except persistence against accidental file sy=
stem deletion.

> =

> Should I do "createprimary", then follow it with "loadexternal" to load t=
he public
> key into the chip? What should I do next? Should I use "evictcontrol" to =
move it
> into non-volatile storage? I tried using evictcontrol today to move it in=
to non-
> volatile storage but I couldn't find the handle for the public key when I=
 queried
> "getcap".
> =

> =

> =

> =

> 	Those files used in the -C and -c options are context files. Between
> command invocations
> 	The tools save the object context for re-use during, essentially, that b=
oot
> of the TPM.
> 	After reboot, you need to re-get a context file, in your case
> tpm2_loadexternal will
> 	provide it.
> =

> =

> =

> =

> How do I get a context file for a key that's already stored persistently =
inside the
> TPM2 chip?

Context files are only for transient objects, if it's loaded persistently y=
ou can either use =

the raw handle (which is a TPM address) or better yet an ESYS_TR handle fil=
e. The
ESYS_TR's contain metadata so you cannot be MITM by an attacker interceptin=
g calls
(perhaps bus snooping) and giving you the wrong object.




--===============5140013607949820268==--

