Content-Type: multipart/mixed; boundary="===============4961074464679583549=="
MIME-Version: 1.0
From: Anthony Arrascue <AArrascue at neuroloop.de>
Subject: [tpm2] Re: Fapi_Decrypt using auth value
Date: Wed, 30 Jun 2021 11:31:02 +0000
Message-ID: <45d29d34982c4952a1e226caedbb5fbf@neuroloop.de>
In-Reply-To: AM8P194MB16759844228B23F31F034533A6019@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4961074464679583549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

Thank you! I will try that.

Best,

Anthony

> -----Original Message-----
> From: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
> Sent: Wednesday, 30 June 2021 13:25
> To: Anthony Arrascue <AArrascue(a)neuroloop.de>; tpm2(a)lists.01.org
> Subject: AW: Fapi_Decrypt using auth value
> =

> Hi Anthony,
> =

> in FAPI the authValues are always asked for using the callback registered=
 in
> Fapi_SetAuthCB.
> The simplest to do this (as I did a few times) in a programs is
> =

> TSS2_RC myAuthCB(..., const char **auth, void* userdata) {
>     *auth =3D (char *) userdata;
>     return TSS2_RC_SUCCESS;
> }
> =

> static const char *myauth =3D "password";
> Fapi_SetAuthCB(ctx, myAuthCB, myauth);
> Fapi_Decrypt(ctx, ...);
> Fapi_setAuthCB(ctx, NULL, NULL);
> =

> Hope this helps you.
> =

> Cheers,
> Andreas
> =

> ________________________________________
> Von: Anthony Arrascue <AArrascue(a)neuroloop.de>
> Gesendet: Mittwoch, 30. Juni 2021 12:37
> An: tpm2(a)lists.01.org
> Betreff: [tpm2] Fapi_Decrypt using auth value
> =

> Hello,
> =

> I am learning about encryption / decryption using Fapi.
> For that purpose, I create a key using tss2_createkey and use tss2_encryp=
t /
> tss2_decrypt (and their Fapi equivalents).
> =

> tss2_ createkey has the argument -a, --authValue to set up a decryption
> password.
> With tss2_encrypt I generate the cipher text.
> =

> The problem is with the decryption process. When I decrypt with
> tss2_decrypt I got asked for that authValue. If it is given correctly it =
decrypts
> the cipher text. However, Fapi_Decrypt will fail throwing an authorization
> error.
> =

> I was wondering how to programmatically enter the authValue?
> Fapi_Decrypt has no arguments to pass it. Maybe through the
> FAPI_CONTEXT?
> =

> Using TPM2-TSS v. 2.4.x
> TPM2-TOOLS v. 4.X
> =

> Thank you for any possible help.
> Best,
> =

> =

> Anthony Arrascue
> --------------------------------------
> neuroloop GmbH
> Breisacher Str. 86, 79110 Freiburg, Germany
> aarrascue(a)neuroloop.de<mailto:aarrascue(a)neuroloop.de>
> neuroloop.de
> =



--===============4961074464679583549==--

