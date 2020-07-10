Content-Type: multipart/mixed; boundary="===============4978717821312576812=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Loading certificate inside TPM
Date: Fri, 10 Jul 2020 16:14:55 +0000
Message-ID: <SN6PR11MB3437F16D1E595AFB91794C0DB8650@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: b50a2d94cc92409fa5bed6acf7453fe3@thalesgroup.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4978717821312576812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The feature is there, or else you would get the not implemented CKR. But it=
 sounds
Like the code is not handling the pkcs11-tool template properly. Can you fi=
le a bug
To the project and I'll get to it. IIRC, I only test against the Java keyst=
ore for that feature,
So it probably has a different template.

Thanks,
Bill

> -----Original Message-----
> From: CHOTARD Clement <clement.chotard(a)thalesgroup.com>
> Sent: Thursday, July 9, 2020 8:49 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Loading certificate inside TPM
> =

> Hi,
> =

> =

> =

> I am trying to load a certificate in the TPM through this command:
> =

> tpm2pkcs11-tool -l --pin $PIN --write-object "$device_dir/client.der" --t=
ype cert -
> -id 01 --label devicecert
> =

> =

> =

> I have tried with both .pem and .der format but it triggers the following=
 error:
> =

> =

> =

> Using slot 0 with a present token (0x1)
> =

> ERROR: Expected attribute CKA_KEY_TYPE
> =

> error: PKCS11 function C_CreateObject failed: rv =3D CKR_TEMPLATE_INCOMPL=
ETE
> (0xd0)
> =

> Aborting.
> =

> =

> =

> Is it a bug or the feature is yet to be implemented?
> =

> =

> =

> Thanks,
> =

> Clement

--===============4978717821312576812==--

