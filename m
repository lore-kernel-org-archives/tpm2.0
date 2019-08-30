Content-Type: multipart/mixed; boundary="===============0861689498956035365=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Remote Attestation
Date: Fri, 30 Aug 2019 15:24:45 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEFE40@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CANKkrzFq5xQ7viWwbEb6PavMSVBnNBR_Y3FpdFuFctqVm-DAEA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0861689498956035365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Matthew Dempsky [mailto:matthew(a)dempsky.org]
> Sent: Thursday, August 29, 2019 1:12 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: Roberto Carvalho <roberto.nogueira.rc(a)gmail.com>; tpm2(a)lists.01.o=
rg
> Subject: Re: [tpm2] Remote Attestation
> =

> On Thu, Aug 29, 2019 at 9:36 AM Roberts, William C <william.c.roberts(a)i=
ntel.com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> 	FYI bear in mind these are in host endianness, so if you switch
> architecture endianness
> 	You need to convert these. It would be wise to serialize these properly
> before sending
> 	off the host. Im just using libmu to serialize, which doesn't deal with
> endianness IRRC/IUUC.
> =

> =

> Thanks for pointing out that concern. I think tpm2-tools should work acro=
ss hosts,
> but it seems like there might still be some issues with that currently.
> =

> tss2-mu serializes integers to network order; and it has to, because the =
TPM spec
> defines command/response protocol use network order (Part 1, Section 7.1).
> =

> =

> tpm2-tools also looks like it does appropriate endianness swapping in lib=
/files.c's
> files_{read,write}_{16,32,64} functions.
> =

> So that much seems good.

That does, but a lot of the calls are directly to libmu. For example TPM2B_=
PRIVATE.
I forgot that libmu does the right thing and converts them to big endian for
serialization, because it's expected that=E2=80=99s part of you command buf=
fer and
Sent to the TPM. So you can just use libmu to unserialize on the other end.

> =

> =

> However, I see that at least tools/tpm2_quote.c's write_pcr_values functi=
on
> directly fwrites some data structures without marshaling.
> =

> There are also a handful of direct calls to fread, that might need review=
 for
> endianness issues.

Yeah those all need to be checked and updated and the old formats need to
be preserved. We should be able to guess the endianness values by sanity
and then silently update them to a better format. We can drop the header
magic value and version on them too so we can handle changes easily moving
forward.


--===============0861689498956035365==--

