Content-Type: multipart/mixed; boundary="===============9004177623968497283=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Creating a TPM EK Public object at the server
Date: Tue, 27 Aug 2019 19:24:19 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEF3D8@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CANKkrzE759ifm5iGWgresC8HbOy+B8vEptf_J=QQrvVhWLuTbg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9004177623968497283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Matthew Demp=
sky
> Sent: Tuesday, August 27, 2019 1:21 PM
> To: Rahul Hardikar <rahulhardikar(a)gmail.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Creating a TPM EK Public object at the server
> =

> On Tue, Aug 27, 2019, 11:01 AM Rahul Hardikar <rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > wrote:
> =

> 	1. Do we need to also copy the standard AuthPolicy digest into the
> structure too? This is definitely needed in TPM to recreate the EK but do=
 we need
> it for make_credential_external?
> =

> =

> Conceptually, the "Make Credential" operation just needs to know the EK's=
 public
> key and encryption scheme details (eg, SHA256 and AES-128-OFB).
> =

> It's assumed that the auth policy is appropriate, since the TPM manufactu=
rer
> certified the public key (and like you said, the EK can't be regenerated =
with a
> different policy); and you can assume the policy is satisfiable, because =
otherwise
> the EK can't be used to decrypt the credential blob.
> =

> The tpm2_makecredential tool takes the EK's "public" structure as input (=
which
> does include auth policy) though because it's an easy way to get the publ=
ic key
> and encryption scheme details all in one package.
> =

> See usage example at https://github.com/tpm2-software/tpm2-
> tools/blob/master/man/tpm2_activatecredential.1.md#examples
> =

> =

> 	2. The EKCert is in ASN.1 DER format which i convert to PEM, is it okay =
to
> copy it directly or do I need to convert it to some other format and then=
 copy the
> ek public key?
> =

> =

> tpm2_makecredential doesn't use the EK certificate. It's expected that you
> validate that separately, and then match it against the public key contai=
ned in the
> EK's "pubic" data.

You're manufacturer should provide, somehow, the template used for createpr=
imary.
I think some manufacturers plop this stuff in NV indices. I'm not sure offh=
and if this
is part of PC client specification. But the tpm2_createek command goes afte=
r NV
Indices to get the template.
https://github.com/tpm2-software/tpm2-tools/blob/master/tools/tpm2_createek=
.c#L106


--===============9004177623968497283==--

