Content-Type: multipart/mixed; boundary="===============8660026607149081184=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: The script of make credential met error
Date: Tue, 12 May 2020 14:24:22 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EDD30D@ORSMSX101.amr.corp.intel.com>
In-Reply-To: BL0PR11MB3252980F41F3066E3938FEEA8DBE0@BL0PR11MB3252.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8660026607149081184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is a mismatch between tpm2-tss and tpm2-tools, what versions or
git sha's are you using?

AFAIK, this is only applicable if you're running a tpm2-tss from master whe=
re the version is 3,
and the tpm2-tools are missing a patch.  Tpm2-tss Is a major version bump d=
ue to an API
break in ESAPI, which manifests itself as the bug you're seeing.

You essentially need to update your tools, in one of three ways:
- latest master
- 4.2.1-rc0,
- 4.1.2-rc0

+ Andreas, he might be aware of a corner case I don't know about.

Bill

> -----Original Message-----
> From: Zhao, Shirley
> Sent: Tuesday, May 12, 2020 4:31 AM
> To: tpm2(a)lists.01.org
> Cc: Desai, Imran <imran.desai(a)intel.com>; Roberts, William C
> <william.c.roberts(a)intel.com>
> Subject: The script of make credential met error
> =

> Hi, all,
> =

> Met the following error when running make credential script as below:
> $ tpm2_createek -c 0x81010009 -G rsa -u ek.pub --tcti=3Dmssim $ tpm2_getc=
ap
> handles-persistent --tcti=3Dmssim
> - 0x81010009
> $ tpm2_getcap handles-transient --tcti=3Dmssim $ tpm2_createak -C 0x81010=
009 -c
> ak.ctx -G rsa -g sha256 -s rsassa -u ak.pub -n ak.name --tcti=3Dmssim
> loaded-key:
>   name:
> 000b57d43d757f62362402a6d473f622a28916b8289ef49dc2e52daf13174a2c9e7e
> $ tpm2_getcap handles-persistent --tcti=3Dmssim
> - 0x81010009
> $ tpm2_getcap handles-transient --tcti=3Dmssim
> - 0x80000001
> $ echo 12345678 > secret.data
> $ tpm2_makecredential -e ek.pub -s secret.data -n
> 000b57d43d757f62362402a6d473f622a28916b8289ef49dc2e52daf13174a2c9e7e -o
> mkcred.out --tcti=3Dmssim
> ERROR:esys:src/tss2-esys/esys_iutil.c:389:iesys_handle_to_tpm_handle() Er=
ror:
> Esys invalid ESAPI handle (40000007).
> ERROR:esys:src/tss2-esys/api/Esys_LoadExternal.c:85:Esys_LoadExternal() E=
rror
> in async function ErrorCode (0x0007000b)
> ERROR: Esys_LoadExternal(0x7000B) - esapi:A parameter has a bad value
> ERROR: Unable to run tpm2_makecredential
> =

> The script is from tpm2-tools/test/integration/tests/Activecredential.sh.
> Please help check.
> Thanks.
> =

> - Shirley

--===============8660026607149081184==--

