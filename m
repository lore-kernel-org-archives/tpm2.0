Content-Type: multipart/mixed; boundary="===============5858298782528440056=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2-tss-engine
Date: Wed, 10 Apr 2019 17:44:09 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D2ADEB@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20190410162717.svaoj3go7sh33dqu@runtux.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5858298782528440056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Ralf Schlatt=
erbeck
> Sent: Wednesday, April 10, 2019 9:27 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] tpm2-tss-engine
> =

> I'm testing with a TPM-2 module for the Raspberry-Pi from Infineon runnin=
g on
> an Orange-Pi zero (also a single-board computer a little smaller than the=
 raspi).
> I've successfully built tpm2-tss-engine and have the following questions:
> - The key generation examples in the README.md create the private key in
>   a file on the local filesystem. Isn't the purpose of a
>   hw-security-module that the key stays inside the device and can't be
>   extracted? Or am I missing something here?

That blob of data that gets stored on disk is sealed to that TPM. So outsid=
e of DOS
If someone deletes that keyblob, there's no real way to use it to extract t=
he key material
Directly from that blob unless they break the TPMs crypto mechanism used to=
 protect it.

They could load it if they access to the parent objects authorization value=
, but wouldn't be
able to use the object without satisfying it's authorization value, but the=
 TPM has dictionary
attack prevention to prevent brute force guessing, so that helps. TPM DA pr=
otection requires
the object be created with noDA attribute clear.

Theirs other attributes when creating the object that indicate whether or n=
ot the
key can ever be exported from the TPM, not sure if those are being set.

 Is there a way to create a
>   protected key inside the device in a way that it cannot be extracted?

I think you want fixedtpm and fixedparent.

If we look at the ECC key, we see these being set:
        .objectAttributes =3D (TPMA_OBJECT_USERWITHAUTH |
                             TPMA_OBJECT_SIGN_ENCRYPT |
                             TPMA_OBJECT_FIXEDTPM |
                             TPMA_OBJECT_FIXEDPARENT |
                             TPMA_OBJECT_SENSITIVEDATAORIGIN |
                             TPMA_OBJECT_NODA),
https://github.com/tpm2-software/tpm2-tss-engine/blob/master/src/tpm2-tss-e=
ngine-ecc.c#L66

The code is setting NODA which means someone can load up that object, and v=
ery slowly brute force
the auth value.

The auth value seems to be the password directly:
src/tpm2-tss-engine-ecc.c:463:        tpm2Data->userauth.size =3D strlen(pa=
ssword);
src/tpm2-tss-engine-ecc.c:464:        memcpy(&tpm2Data->userauth.buffer[0],=
 password,
src/tpm2-tss-engine-ecc.c:465:               tpm2Data->userauth.size);
https://github.com/tpm2-software/tpm2-tss-engine/blob/master/src/tpm2-tss-e=
ngine-common.c#L545

So pick a strong one, not sure why they're not embedding a salt/iters in th=
e PEM file and using a pbkdf routine.

> - I'm not familiar with the engine concept of OpenSSL, is there a way to
>   use the engine with a software that is not engine-aware? In my case
>   the mosquitto message broker. Or would I have to modify the software?

I think engines can be loaded via the config file or environment variables.

> =

> Thanks
> Ralf Schlatterbeck
> --
> Dr. Ralf Schlatterbeck                  Tel:   +43/2243/26465-16
> Open Source Consulting                  www:   http://www.runtux.com
> Reichergasse 131, A-3411 Weidling       email: office(a)runtux.com
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============5858298782528440056==--

