Content-Type: multipart/mixed; boundary="===============5387487135732634509=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
Date: Wed, 25 Apr 2018 16:29:45 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FF3F11C@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAAxBZJsvSA_O5houSSfgj566KdeHOkuYzGxkRpYLOROrKwf8iA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5387487135732634509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have heard of this bug before but never encountered it. I looked at the P=
R:
https://github.com/tpm2-software/tpm2-tools/pull/1002

I heard as well that setting the buffer to something smaller than MAX size =
and that 512 bytes is recommended.
Someone actually polled the vendors to find out what buffer size is always =
a safe bet, and 512 was it.

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Ian Oliver
> Sent: Tuesday, April 24, 2018 7:48 AM
> To: Duncan.Palmer(a)data61.csiro.au
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
> =

> Thanks,
> =

> =

> We are seeing the same issue on the TPMs in our Intel NUCs .. Infineon 96=
55s ?
> Need to check tomorrow
> =

> =

> t.
> =

> =

> Ian
> =

> =

> On 24 April 2018 at 15:51, <Duncan.Palmer(a)data61.csiro.au
> <mailto:Duncan.Palmer(a)data61.csiro.au> > wrote:
> =

> =

> 	Done. I hadn't submitted a pull request before as I was unsure whether
> this issue was related to the TPM I'm using (which doesn't seem commonly
> used), or more generally applicable.
> =

> 	Duncan Palmer
> 	Senior Software Engineer | Autonomous Systems
> 	Data61 | CSIRO
> 	E duncan.palmer(a)csiro.au
> 	Queensland Centre for Advanced Technologies (QCAT),
> 	1 Technology Court, Pullenvale QLD, 4069
> 	www.data61.csiro.au <http://www.data61.csiro.au>
> =

> 	CSIRO=E2=80=99s Digital Productivity business unit and NICTA have joined=
 forces to
> create digital powerhouse Data61
> =

> 	________________________________________
> 	From: Tadeusz Struk <tadeusz.struk(a)intel.com
> <mailto:tadeusz.struk(a)intel.com> >
> 	Sent: 19 April 2018 04:17
> 	To: Palmer, Duncan (Data61, Pullenvale); ian.justin.oliver(a)gmail.com
> <mailto:ian.justin.oliver(a)gmail.com> ; tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 	Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
> =

> =

> 	On 04/17/2018 03:24 PM, Duncan.Palmer(a)data61.csiro.au
> <mailto:Duncan.Palmer(a)data61.csiro.au>  wrote:
> 	> We see the same behaviour on an Intel NUC5i7. I haven't looked at the
> capabilities reported by the TPM device on that platform. The attached pa=
tch
> (setting max_data_size =3D MAX_NV_BUFFER_SIZE when max_data_size is
> reported as 0), sorts the problem out.
> 	>
> =

> 	Hi Duncan,
> 	Could you please send a Pull Request with your fix to the tools repo.
> =

> 	Thanks,
> 	--
> 	Tadeusz
> =

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

--===============5387487135732634509==--

