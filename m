Content-Type: multipart/mixed; boundary="===============7572862941465971877=="
MIME-Version: 1.0
From: Davide Rutigliano <davide.ruti at gmail.com>
Subject: Re: [tpm2] ESAPI StartAuthSession
Date: Thu, 14 Jun 2018 09:43:58 +0200
Message-ID: <CAOysEae4pJqcrr_M6rR7QtsmkAWuhA16vRsqUCJkhGeaaB4rAg@mail.gmail.com>
In-Reply-To: CAOysEaeeMgv0m0vCnE_mnKDKVVqE3QcMaNMxmAvCkr3TkFhhvA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7572862941465971877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

And another question, is it possible to use the engine with tpm simulator
or it is implemented only with devices configuration?

If so, do you think could be a good enhancement to work with the software
tpm also?

I think it's not a long work so maybe I can do that.

Regards, Davide

Il lun 30 apr 2018, 22:16 Davide Rutigliano <davide.ruti(a)gmail.com> ha
scritto:

> Hello everyone,
>
> I'm in trouble with Esys_StartAuthSession because I receive continuously
> this error and I cannot understand why:
>
> """
> ERROR:esys_iutil:esapi/esapi_util/esys_iutil.c:879:esys_GetResourceObject=
()
> Error: Esys handle does not exist (70018).
> ERROR:esys:esapi/esapi/Esys_StartAuthSession.c:124:Esys_StartAuthSession()
> Error in async function ErrorCode (0x00070018)
> TPM2_StartAuthSession failed with 0x70018
> """
>
> I suppose I'm doing something wrong with session handles but I don't know
> what.
>
> Could someone help me please?
>
> Thanks in advance,
>
> Davide Rutigliano.
>

--===============7572862941465971877==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPkFuZCBhbm90aGVyIHF1ZXN0aW9uLCBpcyBpdCBwb3NzaWJsZSB0byB1
c2UgdGhlIGVuZ2luZSB3aXRoIHRwbSBzaW11bGF0b3Igb3IgaXQgaXMgaW1wbGVtZW50ZWQgb25s
eSB3aXRoIGRldmljZXMgY29uZmlndXJhdGlvbj88ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2Pjxk
aXYgZGlyPSJhdXRvIj5JZiBzbywgZG8geW91IHRoaW5rIGNvdWxkIGJlIGEgZ29vZCBlbmhhbmNl
bWVudCB0byB3b3JrIHdpdGggdGhlIHNvZnR3YXJlIHRwbSBhbHNvP8KgPC9kaXY+PGRpdiBkaXI9
ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+SSB0aGluayBpdCYjMzk7cyBub3QgYSBs
b25nIHdvcmsgc28gbWF5YmUgSSBjYW4gZG8gdGhhdC7CoDwvZGl2PjxkaXYgZGlyPSJhdXRvIj48
YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPlJlZ2FyZHMsIERhdmlkZcKgPC9kaXY+PC9kaXY+PGJy
PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIj5JbCBsdW4gMzAgYXByIDIw
MTgsIDIyOjE2IERhdmlkZSBSdXRpZ2xpYW5vICZsdDs8YSBocmVmPSJtYWlsdG86ZGF2aWRlLnJ1
dGlAZ21haWwuY29tIj5kYXZpZGUucnV0aUBnbWFpbC5jb208L2E+Jmd0OyBoYSBzY3JpdHRvOjxi
cj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAw
IDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2
IGRpcj0ibHRyIj5IZWxsbyBldmVyeW9uZSw8ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXYgc3R5bGU9
ImZvbnQtc2l6ZToxMi44MDAwMDAxOTA3MzQ4NjNweCI+SSYjMzk7bSBpbiB0cm91YmxlIHdpdGgg
RXN5c19TdGFydEF1dGhTZXNzaW9uIGJlY2F1c2UgSSByZWNlaXZlIGNvbnRpbnVvdXNseSB0aGlz
IGVycm9yIGFuZCBJIGNhbm5vdCB1bmRlcnN0YW5kIHdoeTo8L2Rpdj48ZGl2IHN0eWxlPSJmb250
LXNpemU6MTIuODAwMDAwMTkwNzM0ODYzcHgiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LXNp
emU6MTIuODAwMDAwMTkwNzM0ODYzcHgiPiZxdW90OyZxdW90OyZxdW90OzwvZGl2PjxkaXYgc3R5
bGU9ImZvbnQtc2l6ZToxMi44MDAwMDAxOTA3MzQ4NjNweCI+PGRpdj5FUlJPUjplc3lzX2l1dGls
OmVzYXBpL2VzYXBpX3V0aWwvZXN5c19pdXRpbC5jOjg3OTplc3lzX0dldFJlc291cmNlT2JqZWN0
KCkgRXJyb3I6IEVzeXMgaGFuZGxlIGRvZXMgbm90IGV4aXN0ICg3MDAxOCkuwqA8L2Rpdj48ZGl2
PkVSUk9SOmVzeXM6ZXNhcGkvZXNhcGkvRXN5c19TdGFydEF1dGhTZXNzaW9uLmM6MTI0OkVzeXNf
U3RhcnRBdXRoU2Vzc2lvbigpIEVycm9yIGluIGFzeW5jIGZ1bmN0aW9uIEVycm9yQ29kZSAoMHgw
MDA3MDAxOCnCoDwvZGl2PjxkaXY+VFBNMl9TdGFydEF1dGhTZXNzaW9uIGZhaWxlZCB3aXRoIDB4
NzAwMTg8L2Rpdj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6MTIuODAwMDAwMTkwNzM0ODYz
cHgiPiZxdW90OyZxdW90OyZxdW90OzwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxMi44MDAw
MDAxOTA3MzQ4NjNweCI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxMi44MDAwMDAx
OTA3MzQ4NjNweCI+SSBzdXBwb3NlIEkmIzM5O20gZG9pbmcgc29tZXRoaW5nIHdyb25nIHdpdGgg
c2Vzc2lvbiBoYW5kbGVzIGJ1dCBJIGRvbiYjMzk7dCBrbm93IHdoYXQuPC9kaXY+PGRpdiBzdHls
ZT0iZm9udC1zaXplOjEyLjgwMDAwMDE5MDczNDg2M3B4Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0i
Zm9udC1zaXplOjEyLjgwMDAwMDE5MDczNDg2M3B4Ij5Db3VsZCBzb21lb25lIGhlbHAgbWUgcGxl
YXNlPzwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmtzIGluIGFkdmFuY2UsPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5EYXZpZGUgUnV0aWdsaWFuby48L2Rpdj48L2Rpdj4KPC9i
bG9ja3F1b3RlPjwvZGl2Pgo=

--===============7572862941465971877==--

