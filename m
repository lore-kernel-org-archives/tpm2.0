Content-Type: multipart/mixed; boundary="===============1791819247060980274=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Issue with tpm2_sign
Date: Fri, 12 Apr 2019 19:00:28 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D2B69F@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAAxBZJsX7sjQUJTkLDhiRq+j5xFyjOt0M_rNAo01EW-yA8c2wg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1791819247060980274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Ian Oliver
> Sent: Monday, April 1, 2019 4:28 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Issue with tpm2_sign
> =

> Just starting having this issue with the latest master builds of tpm2_too=
ls ( also
> latest tss/abrmd )
> =

> I have a small file to be signed
> =

> =

> $ls -l hash.file
> =

> -rw-r--r-- 1 xxx xxx 64 huhti  1 14:10 hash.file
> =

> =

> =

> $tpm2_sign -V -c 0x81010003 -G sha256 -m hash.file -o hash.sig
> =

> WARNING:esys:src/tss2-esys/api/Esys_Sign.c:340:Esys_Sign_Finish() Received
> TPM Error
> =

> ERROR:esys:src/tss2-esys/api/Esys_Sign.c:133:Esys_Sign() Esys Finish Erro=
rCode
> (0x000003e0)
> =

> ERROR on line: "81" in file: "./lib/log.h": Eys_Sign(0x3E0) -
> tpm:parameter(3):invalid ticket

So the structure needs to be initialized to 0, and it wasn=E2=80=99t. Thus =
it was casing the
validation ticket size to be non-zero and the TPM was trying to use that ga=
rbage
value. This should fix it:
https://github.com/tpm2-software/tpm2-tools/pull/1412


> =

> ERROR on line: "171" in file: "tools/tpm2_tool.c": Unable to run tpm2_sign
> =

> =

> The key at 0x8101003 is a signing key (actually it is the AK)
> =

> $tpm2_listpersistent
> <cut....>
> =

> - handle: 0x81010003
> =

>   name-alg:
> =

>     value: sha256
> =

>     raw: 0xb
> =

>   attributes:
> =

>     value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restrict=
ed|sign
> =

>     raw: 0x50072
> =

>   type:
> =

>     value: rsa
> =

>     raw: 0x1
> =

> <cut....>
> =

> Working from the test file (./test/integration/tests/sign.sh) the syntax =
appears
> correct for this command (the man file is different)
> =

> =

>     tpm2_sign -Q -c $handle_signing_key -G $alg_hash -m $file_input_data =
-o
> $file_output_data
> =

> =

> Machine details:
> =

> $uname -a
> Linux ioliver-ThinkPad-X1-Carbon-5th 4.15.0-46-generic #49-Ubuntu SMP Wed
> Feb 6 09:33:07 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux $cat /etc/issue
> Ubuntu 18.04.2 LTS
> =

> =

> =

> t.
> =

> Ian
> =

> =

> --
> =

> Dr. Ian Oliver
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> =

> Privacy Engineering:  via Amazon <http://www.amazon.co.uk/dp/1497569710>
> Twitter: @i_j_oliver

--===============1791819247060980274==--

