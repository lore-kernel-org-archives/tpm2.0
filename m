Content-Type: multipart/mixed; boundary="===============0382963247459778242=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: ESYS_TR to TPM2_HANDLE
Date: Thu, 31 Oct 2019 14:27:41 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E2E1C2@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0163B8F69C@EXCH2010B.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0382963247459778242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So because of the way evictcontrol works, it can either persist or evict an=
 object from NV.

In tpm2_evictcontrol the tool hasoutput like:
action: evicted|persisted
handle: 0x12345678

On the persist case, it's easy, because I have the raw TPM2_HANDLE they wan=
t to persist at, at which point the
ESYS_TR can be serialized as output to a file.

In the evict case, someone presents that serialized ESYS_TR, and the tool e=
victs it...my output becomes:
action: evicted
handle: xxx

Where I need to know what xxx is. I could do something like "?" or "<unknow=
n>" but I'd like to not alter
this interface, as technically it would not be backwards compatible. I didn=
't realize it, but this broke on the
switch to ESAPI.

So I need to get the actual TPM2_HANDLE from the ESYS_TR. I could just poke=
 into the blob directly to get
the handle (it appears to be the first 32 bits), but I don't like doing thi=
ngs like that.
 =

I think it would be a nice addition to be able to get a TPM2_HANDLE from an=
 ESYS_TR. Especially if we go the
Route of exposing a SAPI_CONTEXT from ESAPI, without a raw TPM2_HANDLE, the=
re isn't much you
Could do with the SAPI context.

Bill

> -----Original Message-----
> From: Fuchs, Andreas [mailto:andreas.fuchs(a)sit.fraunhofer.de]
> Sent: Thursday, October 31, 2019 4:09 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Cc: Struk, Tadeusz <tadeusz.struk(a)intel.com>
> Subject: RE: ESYS_TR to TPM2_HANDLE
> =

> I don't know if I get it.
> =

> I though you would present the persistent-handle in either case and then =
say if
> you persistent to this persistent-handle or if you evicted this peristent=
-handle ?
> =

> Andreas
> =

> ________________________________________
> From: Roberts, William C [william.c.roberts(a)intel.com]
> Sent: Monday, October 28, 2019 17:40
> To: tpm2(a)lists.01.org
> Cc: Struk, Tadeusz; Fuchs, Andreas
> Subject: ESYS_TR to TPM2_HANDLE
> =

> In tpm2_evictcontrol, I can load a serialized ESYS_TR object. The tool ou=
tput,
> which I must keep stable, uses a TPM2_HANDLE in the output and whether or
> not that handle was persisted or evicted. In the case of persisted, that =
is simple, I
> know it. In the case of evicted, I cannot know it. Is there a way to get =
the
> TPM2_HANDLE for that ESYS_TR? I see ESAPI knows it... The other option I =
have
> considered is just to print out a 0 or some other dummy value for the han=
dle on
> evict, but I am not super fond of that.
> =

> Bill
--===============0382963247459778242==--

