Content-Type: multipart/mixed; boundary="===============4699045926326375650=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Fwd: tpm2-tool can't execute normally on X86 target
Date: Mon, 02 Sep 2019 21:10:44 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DF11B6@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAAG8Em0_epZE9jUWPAkBg1_1PNXBjVj_xnr5xJz_Cr_yUOotgA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4699045926326375650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of ZhengYu Tsai
> Sent: Monday, September 2, 2019 3:54 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Fwd: tpm2-tool can't execute normally on X86 target
> =

> Hi all :
> =

> Per this issue https://github.com/tpm2-software/tpm2-tools/issues/1722 , =
i have
> tried these suggest, and target log as below :
> =

> ONIE:/tpm2/tpm2-tools/tools # export PATH=3D"$PATH:/tpm2/tpm2-tools/tools"
> ONIE:/tpm2/tpm2-tools/tools #  echo $PATH
> =

> /sbin:/usr/sbin:/bin:/usr/bin:/tpm2-tools/tools
> ONIE:/tpm2/tpm2-tools/tools # which tpm2_pcrread /tpm2/tpm2-
> tools/tools/tpm2_pcrread
> =

> ONIE:/tpm2/tpm2-tools/tools # ./tpm2_pcrread
> /bin/sh: ./tpm2_pcrread: not found


So it looks like it's on PATH. Another time, IIRC, I've seen this happen
is when the executable format was bad. Are you sure you're going to be
able to copy them from your host to the target without some type of
cross compilation or change in build flags? =


Are you sure you're getting static binary output, what is the output of ldd?
Does it  list shared objects? There is also some flag in the ELF format you=
 can
Check, but I can't recall what it is offhand.

Can you strace on the host and see exactly the syscall failing from the she=
ll?

> =

> =

> =

> It still can't solve, does it require static build the tools ? how can i =
static build
> tpm2-tools ?
> =

> =

> Thank you for your reply and williamcroberts.
> =

> =

> =

> =

> =



--===============4699045926326375650==--

