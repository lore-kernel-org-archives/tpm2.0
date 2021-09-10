Content-Type: multipart/mixed; boundary="===============7600211001813611801=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: CFLAGS and LIBS defines for tss versus other tpm2 projects
Date: Fri, 10 Sep 2021 10:58:34 +0000
Message-ID: <AM8P194MB16755DC0C5BD12E4E5C1FEE3A6D69@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: SN6PR11MB3437B20268B120BA4990AD5CB8D49@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7600211001813611801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I don't mind at all...

________________________________________
Von: Roberts, William C <william.c.roberts(a)intel.com>
Gesendet: Donnerstag, 9. September 2021 19:08
An: tpm2(a)lists.01.org
Betreff: [tpm2] CFLAGS and LIBS defines for tss versus other tpm2 projects

So in all of the projects that need libcrypto, the configure.ac check using=
 PKG_CHECK_MODULES
uses "CRYPTO" except tss project which uses LIBCRYPT. This means that when =
exporting variables
for building against a custom libcrypto, the variables will be LIBCRYPTO_CF=
LAGS and LIBCRYPTO_LIBS,
where as all the other projects are just CRYPTO_CFLAGS and CRYPTO_LIBS. Whi=
le it's not difficult to
set both variables, I was wondering if we could unify this around CRYPTO (w=
ithout the lib prefix) and
if we consider configure.ac to be stable, ie if we made this change would w=
e make someones life miserable?

Thanks,
Bill

Configure.ac snippets below.

tpm2-openssl/configure.ac:PKG_CHECK_MODULES([CRYPTO], [libcrypto >=3D 3.0.0=
],
tpm2-pkcs11/configure.ac:PKG_CHECK_MODULES([CRYPTO],      [libcrypto >=3D 1=
.1.0])
tpm2-tools/configure.ac:PKG_CHECK_MODULES([CRYPTO], [libcrypto >=3D 1.1.0])
tpm2-tss/configure.ac:           PKG_CHECK_MODULES([LIBCRYPTO],
tpm2-tss/configure.ac:           [PKG_CHECK_MODULES([LIBCRYPTO],[libcrypto]=
)])
tpm2-tss-engine/configure.ac:PKG_CHECK_MODULES([CRYPTO], [libcrypto >=3D 1.=
0.2g],
--===============7600211001813611801==--

