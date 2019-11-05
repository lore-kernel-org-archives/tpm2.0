Content-Type: multipart/mixed; boundary="===============8271502874056133664=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: ESYS_TR to TPM2_HANDLE
Date: Tue, 05 Nov 2019 20:27:05 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E2FFD0@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E2E1C2@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8271502874056133664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I just hit another case. If I wanted to see if a handle is persistent, I ch=
eck
The result of a getcap  query for persistent handles. That returns raw TPM
Handles, so if I had an ESYS_TR I wouldn't be able to verify that its persi=
stent,
Or is there a better way to do it?

> -----Original Message-----
> From: Roberts, William C [mailto:william.c.roberts(a)intel.com]
> Sent: Thursday, October 31, 2019 9:28 AM
> To: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>; tpm2(a)lists.01.o=
rg
> Cc: Struk, Tadeusz <tadeusz.struk(a)intel.com>
> Subject: [tpm2] Re: ESYS_TR to TPM2_HANDLE
> =

> So because of the way evictcontrol works, it can either persist or evict =
an object
> from NV.
> =

> In tpm2_evictcontrol the tool hasoutput like:
> action: evicted|persisted
> handle: 0x12345678
> =

> On the persist case, it's easy, because I have the raw TPM2_HANDLE they w=
ant to
> persist at, at which point the ESYS_TR can be serialized as output to a f=
ile.
> =

> In the evict case, someone presents that serialized ESYS_TR, and the tool=
 evicts
> it...my output becomes:
> action: evicted
> handle: xxx
> =

> Where I need to know what xxx is. I could do something like "?" or "<unkn=
own>"
> but I'd like to not alter this interface, as technically it would not be =
backwards
> compatible. I didn't realize it, but this broke on the switch to ESAPI.
> =

> So I need to get the actual TPM2_HANDLE from the ESYS_TR. I could just po=
ke
> into the blob directly to get the handle (it appears to be the first 32 b=
its), but I
> don't like doing things like that.
> =

> I think it would be a nice addition to be able to get a TPM2_HANDLE from =
an
> ESYS_TR. Especially if we go the Route of exposing a SAPI_CONTEXT from ES=
API,
> without a raw TPM2_HANDLE, there isn't much you Could do with the SAPI
> context.
> =

> Bill
> =

> > -----Original Message-----
> > From: Fuchs, Andreas [mailto:andreas.fuchs(a)sit.fraunhofer.de]
> > Sent: Thursday, October 31, 2019 4:09 AM
> > To: Roberts, William C <william.c.roberts(a)intel.com>;
> > tpm2(a)lists.01.org
> > Cc: Struk, Tadeusz <tadeusz.struk(a)intel.com>
> > Subject: RE: ESYS_TR to TPM2_HANDLE
> >
> > I don't know if I get it.
> >
> > I though you would present the persistent-handle in either case and
> > then say if you persistent to this persistent-handle or if you evicted =
this
> peristent-handle ?
> >
> > Andreas
> >
> > ________________________________________
> > From: Roberts, William C [william.c.roberts(a)intel.com]
> > Sent: Monday, October 28, 2019 17:40
> > To: tpm2(a)lists.01.org
> > Cc: Struk, Tadeusz; Fuchs, Andreas
> > Subject: ESYS_TR to TPM2_HANDLE
> >
> > In tpm2_evictcontrol, I can load a serialized ESYS_TR object. The tool
> > output, which I must keep stable, uses a TPM2_HANDLE in the output and
> > whether or not that handle was persisted or evicted. In the case of
> > persisted, that is simple, I know it. In the case of evicted, I cannot
> > know it. Is there a way to get the TPM2_HANDLE for that ESYS_TR? I see
> > ESAPI knows it... The other option I have considered is just to print
> > out a 0 or some other dummy value for the handle on evict, but I am not=
 super
> fond of that.
> >
> > Bill
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============8271502874056133664==--

