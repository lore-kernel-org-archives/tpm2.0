Content-Type: multipart/mixed; boundary="===============6502964947916020998=="
MIME-Version: 1.0
From: Anderson, Daniel <daniel.anderson at intel.com>
Subject: Re: [tpm2] Documentation for configure
Date: Fri, 18 May 2018 22:57:54 +0000
Message-ID: <207C810BE4BA2440832668E0F208BFD3D40C22@ORSMSX108.amr.corp.intel.com>
In-Reply-To: AE617DA1151F25478215F3E5790FBCFB15CB9CA3@MAIL-SNA04.mascorp.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6502964947916020998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> I had to wrap the tctidefaultmodule value in quotes so I did the same for=
 > tctidefaultconfig. However, I ran into some errors:
>./configure --with-tctidefaultmodule=3D\"libtss2-tcti-mssim.so\" --enable-=
unit --with-> tctidefaultconfig=3D\"host=3D10.139.90.53,port=3D2321\"


Tony,
This might work (among other possibilities):

./configure --with-tctidefaultmodule=3D'"libtss2-tcti-mssim.so"' --enable-u=
nit --with-tctidefaultconfig=3D'"host=3D10.139.90.53,port=3D2321"'

That is try enclosing the double quotes "" in single quotes ''



--===============6502964947916020998==--

