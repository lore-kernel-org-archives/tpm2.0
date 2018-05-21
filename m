Content-Type: multipart/mixed; boundary="===============7369425689309191545=="
MIME-Version: 1.0
From: Tony Yip <Juan.Yip at panasonic.aero>
Subject: Re: [tpm2] Documentation for configure
Date: Mon, 21 May 2018 16:57:24 +0000
Message-ID: <AE617DA1151F25478215F3E5790FBCFB15CB9E73@MAIL-SNA04.mascorp.com>
In-Reply-To: 207C810BE4BA2440832668E0F208BFD3D40C22@ORSMSX108.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7369425689309191545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

I ran the configure command you suggested though it ends up with the same e=
rror as before.

ERROR:tcti:src/util/key-value-parse.c:94:parse_key_value_string() kv_str: "=
"host=3D10.139.90.53,port=3D2321"", callback: 0x7fafe555a590, user_data: 0x=
7ffdcc9928c0 =

ERROR:tcti:src/util/key-value-parse.c:102:parse_key_value_string() parsing =
key/value: "host=3D10.139.90.53 =

ERROR:tcti:src/util/key-value-parse.c:53:parse_key_value() key_value_str: "=
"host=3D10.139.90.53" and key_value_t: 0x7ffdcc992870 =


Anyway, I was able to communicate with the simulator using Tss2_Tcti_Mssim_=
Init. I've included the code snippet below for posterity:

size_t size =3D 0;
TSS2_TCTI_CONTEXT* tcti_context =3D NULL;
Tss2_Tcti_Mssim_Init(NULL, &size, NULL);
tcti_context =3D (TSS2_TCTI_CONTEXT*) calloc(1, size);
Tss2_Tcti_Mssim_Init(tcti_context, &size, "host=3Dlocalhost,port=3D2321");

________________________________________
From: Anderson, Daniel [daniel.anderson(a)intel.com]
Sent: Friday, May 18, 2018 3:57 PM
To: Tony Yip; tpm2(a)lists.01.org
Subject: RE: Documentation for configure

> I had to wrap the tctidefaultmodule value in quotes so I did the same for=
 > tctidefaultconfig. However, I ran into some errors:
>./configure --with-tctidefaultmodule=3D\"libtss2-tcti-mssim.so\" --enable-=
unit --with-> tctidefaultconfig=3D\"host=3D10.139.90.53,port=3D2321\"


Tony,
This might work (among other possibilities):

./configure --with-tctidefaultmodule=3D'"libtss2-tcti-mssim.so"' --enable-u=
nit --with-tctidefaultconfig=3D'"host=3D10.139.90.53,port=3D2321"'

That is try enclosing the double quotes "" in single quotes ''



--===============7369425689309191545==--

