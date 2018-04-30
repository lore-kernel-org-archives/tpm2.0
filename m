Content-Type: multipart/mixed; boundary="===============4921443434724265681=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
Date: Mon, 30 Apr 2018 18:12:46 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FF40381@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 1524780942850.60358@data61.csiro.au
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4921443434724265681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Theirs really two values when dealing with NV space that are of concern:

The maximum size of an nv area, given by fixed-property capability:
TPM_PT_NV_INDEX_MAX

The maximum amount of data that can be transferred at a time:
TPM2_PT_NV_BUFFER_MAX

The maximum transfer size (TPM2_PT_NV_BUFFER_MAX) is also bounded by
TPM2_MAX_NV_BUFFER_SIZE which is 2048.

TO clarify, if a TPM reports 0 for TPM2_PT_NV_BUFFER_MAX (ie transfer size)
we should assume some value, however TPM2_MAX_NV_BUFFER_SIZE
might not be the best option. Something smaller, like 512, is probably a
safer bet, and this 512 on 0 logic has been merged into 3.X (on 3.0.4 relea=
se) and on
current master.


> -----Original Message-----
> From: Duncan.Palmer(a)data61.csiro.au [mailto:Duncan.Palmer(a)data61.csir=
o.au]
> Sent: Thursday, April 26, 2018 3:16 PM
> To: ian.justin.oliver(a)gmail.com; Roberts, William C
> <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
> =

> Thanks for updating the patch with a default size William. Sorry, I hadn'=
t the time
> to do it yet...
> =

> =

> =

> =

> Duncan Palmer
> Senior Software Engineer | Autonomous Systems
> Data61 | CSIRO
> =

> =

> E duncan.palmer(a)csiro.au
> =

> Queensland Centre for Advanced Technologies (QCAT),
> =

> 1 Technology Court, Pullenvale QLD, 4069
> =

> =

> www.data61.csiro.au <http://my.csiro.au/Business-
> Units/Operations/Communication/CSIRO-Branding/Data61-
> Branding/www.data61.csiro.au>
> =

> =

> =

> =

> =

> CSIRO's Digital Productivity business unit and NICTA have joined forces t=
o create
> digital powerhouse Data61
> =

> ________________________________
> =

> From: Ian Oliver <ian.justin.oliver(a)gmail.com>
> Sent: 26 April 2018 03:02
> To: Roberts, William C
> Cc: Palmer, Duncan (Data61, Pullenvale); tpm2(a)lists.01.org
> Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
> =

> Actually some TPMs aren't reporting this value as part of the properties
> (tpm2_getcap -c properties-fixed IIRC) so it gets interpreted as 0.
> =

> =

> Can you also confirm the maximum size of an NV_RAM area, or is it always
> bounded by MAX_NV_BUFFER_SIZE  ?
> =

> =

> t.
> =

> =

> Ian
> =

> =

> On 25 April 2018 at 19:29, Roberts, William C <william.c.roberts(a)intel.=
com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> 	I have heard of this bug before but never encountered it. I looked at the
> PR:
> 	https://github.com/tpm2-software/tpm2-tools/pull/1002
> <https://github.com/tpm2-software/tpm2-tools/pull/1002>
> =

> 	I heard as well that setting the buffer to something smaller than MAX si=
ze
> and that 512 bytes is recommended.
> 	Someone actually polled the vendors to find out what buffer size is
> always a safe bet, and 512 was it.
> =

> 	> -----Original Message-----
> 	> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org <mailto:tpm2-
> bounces(a)lists.01.org> ] On Behalf Of Ian Oliver
> 	> Sent: Tuesday, April 24, 2018 7:48 AM
> 	> To: Duncan.Palmer(a)data61.csiro.au
> <mailto:Duncan.Palmer(a)data61.csiro.au>
> 	> Cc: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
> 	>
> 	> Thanks,
> 	>
> 	>
> 	> We are seeing the same issue on the TPMs in our Intel NUCs .. Infineon
> 9655s ?
> 	> Need to check tomorrow
> 	>
> 	>
> 	> t.
> 	>
> 	>
> 	> Ian
> 	>
> 	>
> 	> On 24 April 2018 at 15:51, <Duncan.Palmer(a)data61.csiro.au
> <mailto:Duncan.Palmer(a)data61.csiro.au>
> 	> <mailto:Duncan.Palmer(a)data61.csiro.au
> <mailto:Duncan.Palmer(a)data61.csiro.au> > > wrote:
> 	>
> 	>
> 	>       Done. I hadn't submitted a pull request before as I was unsure
> whether
> 	> this issue was related to the TPM I'm using (which doesn't seem
> commonly
> 	> used), or more generally applicable.
> 	>
> 	>       Duncan Palmer
> 	>       Senior Software Engineer | Autonomous Systems
> 	>       Data61 | CSIRO
> 	>       E duncan.palmer(a)csiro.au
> 	>       Queensland Centre for Advanced Technologies (QCAT),
> 	>       1 Technology Court, Pullenvale QLD, 4069
> 	>       www.data61.csiro.au <http://www.data61.csiro.au>
> <http://www.data61.csiro.au>
> 	>
> 	>       CSIRO's Digital Productivity business unit and NICTA have joined
> forces to
> 	> create digital powerhouse Data61
> 	>
> 	>       ________________________________________
> 	>       From: Tadeusz Struk <tadeusz.struk(a)intel.com
> <mailto:tadeusz.struk(a)intel.com>
> 	> <mailto:tadeusz.struk(a)intel.com <mailto:tadeusz.struk(a)intel.com> >
> >
> 	>       Sent: 19 April 2018 04:17
> 	>       To: Palmer, Duncan (Data61, Pullenvale); ian.justin.oliver(a)gma=
il.com
> <mailto:ian.justin.oliver(a)gmail.com>
> 	> <mailto:ian.justin.oliver(a)gmail.com
> <mailto:ian.justin.oliver(a)gmail.com> > ; tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
> 	>
> 	>
> 	>       On 04/17/2018 03:24 PM, Duncan.Palmer(a)data61.csiro.au
> <mailto:Duncan.Palmer(a)data61.csiro.au>
> 	> <mailto:Duncan.Palmer(a)data61.csiro.au
> <mailto:Duncan.Palmer(a)data61.csiro.au> >  wrote:
> 	>       > We see the same behaviour on an Intel NUC5i7. I haven't looked=
 at
> the
> 	> capabilities reported by the TPM device on that platform. The attached
> patch
> 	> (setting max_data_size =3D MAX_NV_BUFFER_SIZE when max_data_size
> is
> 	> reported as 0), sorts the problem out.
> 	>       >
> 	>
> 	>       Hi Duncan,
> 	>       Could you please send a Pull Request with your fix to the tools =
repo.
> 	>
> 	>       Thanks,
> 	>       --
> 	>       Tadeusz
> 	>
> 	>
> 	>
> 	>
> 	>
> 	>
> 	> --
> 	>
> 	> Dr. Ian Oliver
> 	> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> 	>
> 	> Privacy Engineering:  via Amazon
> <http://www.amazon.co.uk/dp/1497569710
> <http://www.amazon.co.uk/dp/1497569710> >
> 	> Twitter: @i_j_oliver
> =

> =

> =

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

--===============4921443434724265681==--

