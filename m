Content-Type: multipart/mixed; boundary="===============2711006496059600753=="
MIME-Version: 1.0
From: Zhao, Shirley <shirley.zhao at intel.com>
Subject: [tpm2] Re: The script of make credential met error
Date: Thu, 14 May 2020 08:42:13 +0000
Message-ID: <BL0PR11MB32524D8CF43F615523054F5F8DBC0@BL0PR11MB3252.namprd11.prod.outlook.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EDD30D@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2711006496059600753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks, Robert. =

I updated both tpm2-tss and tpm2-tools into the latest master, it worked. =


- Shirley =


-----Original Message-----
From: Roberts, William C <william.c.roberts(a)intel.com> =

Sent: Tuesday, May 12, 2020 10:24 PM
To: Zhao, Shirley <shirley.zhao(a)intel.com>; tpm2(a)lists.01.org; Fuchs, A=
ndreas <andreas.fuchs(a)sit.fraunhofer.de>
Cc: Desai, Imran <imran.desai(a)intel.com>
Subject: RE: The script of make credential met error

This is a mismatch between tpm2-tss and tpm2-tools, what versions or git sh=
a's are you using?

AFAIK, this is only applicable if you're running a tpm2-tss from master whe=
re the version is 3, and the tpm2-tools are missing a patch.  Tpm2-tss Is a=
 major version bump due to an API break in ESAPI, which manifests itself as=
 the bug you're seeing.

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
> Cc: Desai, Imran <imran.desai(a)intel.com>; Roberts, William C =

> <william.c.roberts(a)intel.com>
> Subject: The script of make credential met error
> =

> Hi, all,
> =

> Met the following error when running make credential script as below:
> $ tpm2_createek -c 0x81010009 -G rsa -u ek.pub --tcti=3Dmssim $ =

> tpm2_getcap handles-persistent --tcti=3Dmssim
> - 0x81010009
> $ tpm2_getcap handles-transient --tcti=3Dmssim $ tpm2_createak -C =

> 0x81010009 -c ak.ctx -G rsa -g sha256 -s rsassa -u ak.pub -n ak.name =

> --tcti=3Dmssim
> loaded-key:
>   name:
> 000b57d43d757f62362402a6d473f622a28916b8289ef49dc2e52daf13174a2c9e7e
> $ tpm2_getcap handles-persistent --tcti=3Dmssim
> - 0x81010009
> $ tpm2_getcap handles-transient --tcti=3Dmssim
> - 0x80000001
> $ echo 12345678 > secret.data
> $ tpm2_makecredential -e ek.pub -s secret.data -n =

> 000b57d43d757f62362402a6d473f622a28916b8289ef49dc2e52daf13174a2c9e7e =

> -o mkcred.out --tcti=3Dmssim
> ERROR:esys:src/tss2-esys/esys_iutil.c:389:iesys_handle_to_tpm_handle() Er=
ror:
> Esys invalid ESAPI handle (40000007).
> ERROR:esys:src/tss2-esys/api/Esys_LoadExternal.c:85:Esys_LoadExternal(
> ) Error in async function ErrorCode (0x0007000b)
> ERROR: Esys_LoadExternal(0x7000B) - esapi:A parameter has a bad value
> ERROR: Unable to run tpm2_makecredential
> =

> The script is from tpm2-tools/test/integration/tests/Activecredential.sh.
> Please help check.
> Thanks.
> =

> - Shirley


--===============2711006496059600753==--

