Content-Type: multipart/mixed; boundary="===============0404889249855685254=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] Policy check fails writing to NVRAM > 512B
Date: Wed, 13 Jun 2018 11:13:02 -0700
Message-ID: <231a0147-4fa9-71d7-587d-65efcf7af8c1@intel.com>
In-Reply-To: CA+HVzV0a6jrr=zD6QHT+aB1VDd7_FXZ8nzMJB1UXP06jhsvyyg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0404889249855685254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/13/2018 11:06 AM, Gabriela Limonta M=C3=A1rquez wrote:
> $ export TSS2_LOG=3D"all+ERROR,tcti+TRACE"
> =

> $ tpm2_nvwrite -x 0x1800005 -a 0x1800005 -L sha256:0 -F pcr.value ta_conf=
ig.cfg
> ERROR: Failed to write NV area at index 0x1800005 (25165829) offset 0x200=
. Error:0x99d
> ERROR: Unable to run tpm2_nvwrite
> =

> Am I doing something wrong? or are the TSS logs available somewhere else =
after I execute the command and that is why I see nothing?
> =

> I also tried enabling logging as TSS2_LOG=3D"all+TRACE", but I only see d=
ebug and trace logs from marshal and none of them say error or anything sim=
ilar.

That all looks good. The only thing that's probably missing is that the deb=
ug is not compiled into TSS.
It needs to be enabled at compile time by --with-maxloglevel=3Dtrace
Please see ./configure --help
Could you recompile TSS with that enabled and try again.
Thanks,
-- =

Tadeusz

--===============0404889249855685254==--

