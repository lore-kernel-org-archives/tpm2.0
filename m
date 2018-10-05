Content-Type: multipart/mixed; boundary="===============2006453700589978144=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Fri, 05 Oct 2018 14:36:38 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0142678809@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0142678531@EXCH2010B.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2006453700589978144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

@James: Looking over this, I was wondering, why is the publicKey optional ?
I think the TPM won't load the private key without the public key, or will =
it ?

Thanks,
Andreas
________________________________
From: Fuchs, Andreas
Sent: Friday, October 05, 2018 12:19
To: Nikos Mavrogiannopoulos; David Woodhouse
Cc: James Bottomley; tpm2(a)lists.01.org
Subject: RE: [tpm2] Conflicting TPM2 engines and storage formats

That's a good point actually.

However, TSS2 FAPI will not use the "weird" UUIDs for keys anymore, but pat=
h-like strings.

See https://trustedcomputinggroup.org/wp-content/uploads/TSS-Feature-API-ve=
rsion-.12_Review.pdf
page 16 (examples) and all of section 4 for explanation.
Note that that was a very early version and has been revised since then, bu=
t the general concept still sticks.

Thus, the URI-Scheme will have to change anyways.

The biggest point for the URI-Scheme IMHO was that it allowed system vs use=
r keys, which was otherwise not possible. The path-scheme of FAPI now alrea=
dy encodes this from TSS side.

My personal idea was:
- prefixes 0x81 (persistent) and 0x01 (NV-Space) will point to TPM-internal=
 (as applicable one or the other)
- If not it looks for a FAPI keystore path
- If not it looks if a file of this name exists

We could of course prefix all of it, but question is, whether it's worth it=
 ?

What do people think ?

Cheers,
Andreas

________________________________
From: Nikos Mavrogiannopoulos [n.mavrogiannopoulos(a)gmail.com]
Sent: Friday, October 05, 2018 11:54
To: David Woodhouse
Cc: Fuchs, Andreas; James Bottomley; tpm2(a)lists.01.org
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats

It would certainly be good to have a standard, unambiguous way to reference=
 items in a TPM rather than just hex numbers. We were are that situation wi=
th HSMs 5 years ago, and the switch to pkcs11: URIs helped improve software=
 interfaces greatly (in apache today you specify a file or a smart card obj=
ect interchangeably). The tpmuri scheme that David pointed could be a good =
starting point.

regards,
Nikos

On Thu, Oct 4, 2018 at 6:17 PM David Woodhouse <dwmw2(a)infradead.org<mailt=
o:dwmw2(a)infradead.org>> wrote:

FWIW I have the GnuTLS code also working, including with EC keys (and I
think I know how to tell GnuTLS not to ask me to do SHA512). I should
be able to adjust it to conform to whatever consensus we reach.

cf. https://tools.ietf.org/html/draft-mavrogiannopoulos-tpmuri-01


On Thu, 2018-10-04 at 16:04 +0000, Fuchs, Andreas wrote:
> Should we try to setup a wiki or markdown to start converging into a sing=
le form ?
> I think we can also easily set NODA for the primary, because they have to=
 auth value anyways.
>
> @James: how do you handle the key-ids ? Allways assume them to be files ?
> I have a PR for persistent TPM keys, where all key ids starting with 0x a=
re interpreted as TPM keys.
> For the future I'll also want to reference FAPI keys (path-like format).
> Thus, any clues on how to handle things consistently here ?
>
> tpm2-tss-engine will propably not support policies from your format then,=
 but wait until FAPI (with integrated policy engine) is available.
> ________________________________________
> From: David Woodhouse [dwmw2(a)infradead.org<mailto:dwmw2(a)infradead.org=
>]
> Sent: Wednesday, October 03, 2018 22:47
> To: James Bottomley; Fuchs, Andreas; tpm2(a)lists.01.org<mailto:tpm2(a)li=
sts.01.org>; Nikos Mavrogiannopoulos
> Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
>
> On Wed, 2018-10-03 at 11:35 +0100, David Woodhouse wrote:
> >
> >
> > Full patch below, for reference. Don't heckle too hard; it exists
> > mostly to document the current incompatibilities. I'll let the two of
> > you come to an agreement on the correct way to resolve them, while I
> > throw together some GnuTLS code to use the same PEM files.
>
> OK... OpenConnect now supports both OpenSSL engines, and I've thrown
> together some GnuTLS code cribbing from tpm2-tss-engine, implementing a
> gnutls_privkey_t with some caveats (RSA only, PKCS#1 padding only,
> no auth, no policy, only the default parent, ...).
>
> http://git.infradead.org/users/dwmw2/openconnect.git/blob/tpm2:/gnutls_tp=
m2_esys.c
> http://git.infradead.org/users/dwmw2/openconnect.git/blob/tpm2:/gnutls_tp=
m2.c
>
> I'd love *not* to have to fix all those caveats, and for this to live
> in a library somewhere instead. :)


--===============2006453700589978144==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+CjwhLS0KcAoJe21hcmdpbi10b3A6MDsKCW1hcmdpbi1i
b3R0b206MH0KLS0+ClAge21hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7fTwvc3R5bGU+Cjwv
aGVhZD4KPGJvZHkgZnBzdHlsZT0iMSIgb2NzaT0iMCI+CjxkaXYgc3R5bGU9ImRpcmVjdGlvbjog
bHRyO2ZvbnQtZmFtaWx5OiBUYWhvbWE7Y29sb3I6ICMwMDAwMDA7Zm9udC1zaXplOiAxMHB0OyI+
CjxkaXY+QEphbWVzOiBMb29raW5nIG92ZXIgdGhpcywgSSB3YXMgd29uZGVyaW5nLCB3aHkgaXMg
dGhlIHB1YmxpY0tleSBvcHRpb25hbCA/PC9kaXY+CjxkaXY+SSB0aGluayB0aGUgVFBNIHdvbid0
IGxvYWQgdGhlIHByaXZhdGUga2V5IHdpdGhvdXQgdGhlIHB1YmxpYyBrZXksIG9yIHdpbGwgaXQg
PzwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+VGhhbmtzLDwvZGl2Pgo8ZGl2PkFuZHJlYXM8
YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogVGltZXMgTmV3IFJvbWFuOyBjb2xv
cjogIzAwMDAwMDsgZm9udC1zaXplOiAxNnB4Ij4KPGhyIHRhYmluZGV4PSItMSI+CjxkaXYgaWQ9
ImRpdlJwRjU4MzgwOSIgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyI+PGZvbnQgc2l6ZT0iMiIgZmFj
ZT0iVGFob21hIiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IEZ1Y2hzLCBBbmRyZWFzPGJy
Pgo8Yj5TZW50OjwvYj4gRnJpZGF5LCBPY3RvYmVyIDA1LCAyMDE4IDEyOjE5PGJyPgo8Yj5Ubzo8
L2I+IE5pa29zIE1hdnJvZ2lhbm5vcG91bG9zOyBEYXZpZCBXb29kaG91c2U8YnI+CjxiPkNjOjwv
Yj4gSmFtZXMgQm90dG9tbGV5OyB0cG0yQGxpc3RzLjAxLm9yZzxicj4KPGI+U3ViamVjdDo8L2I+
IFJFOiBbdHBtMl0gQ29uZmxpY3RpbmcgVFBNMiBlbmdpbmVzIGFuZCBzdG9yYWdlIGZvcm1hdHM8
YnI+CjwvZm9udD48YnI+CjwvZGl2Pgo8ZGl2PjwvZGl2Pgo8ZGl2Pgo8ZGl2IHN0eWxlPSJkaXJl
Y3Rpb246bHRyOyBmb250LWZhbWlseTpUYWhvbWE7IGNvbG9yOiMwMDAwMDA7IGZvbnQtc2l6ZTox
MHB0Ij4KPGRpdj5UaGF0J3MgYSBnb29kIHBvaW50IGFjdHVhbGx5LjwvZGl2Pgo8ZGl2Pjxicj4K
PC9kaXY+CjxkaXY+SG93ZXZlciwgVFNTMiBGQVBJIHdpbGwgbm90IHVzZSB0aGUgJnF1b3Q7d2Vp
cmQmcXVvdDsgVVVJRHMgZm9yIGtleXMgYW55bW9yZSwgYnV0IHBhdGgtbGlrZSBzdHJpbmdzLjwv
ZGl2Pgo8ZGl2Pjxicj4KU2VlIDxhIGhyZWY9Imh0dHBzOi8vdHJ1c3RlZGNvbXB1dGluZ2dyb3Vw
Lm9yZy93cC1jb250ZW50L3VwbG9hZHMvVFNTLUZlYXR1cmUtQVBJLXZlcnNpb24tLjEyX1Jldmll
dy5wZGYiIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPgpodHRwczov
L3RydXN0ZWRjb21wdXRpbmdncm91cC5vcmcvd3AtY29udGVudC91cGxvYWRzL1RTUy1GZWF0dXJl
LUFQSS12ZXJzaW9uLS4xMl9SZXZpZXcucGRmPC9hPjwvZGl2Pgo8ZGl2PnBhZ2UgMTYgKGV4YW1w
bGVzKSBhbmQgYWxsIG9mIHNlY3Rpb24gNCBmb3IgZXhwbGFuYXRpb24uPGJyPgo8L2Rpdj4KPGRp
dj5Ob3RlIHRoYXQgdGhhdCB3YXMgYSB2ZXJ5IGVhcmx5IHZlcnNpb24gYW5kIGhhcyBiZWVuIHJl
dmlzZWQgc2luY2UgdGhlbiwgYnV0IHRoZSBnZW5lcmFsIGNvbmNlcHQgc3RpbGwgc3RpY2tzLjxi
cj4KPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5UaHVzLCB0aGUgVVJJLVNjaGVtZSB3aWxs
IGhhdmUgdG8gY2hhbmdlIGFueXdheXMuPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5UaGUg
YmlnZ2VzdCBwb2ludCBmb3IgdGhlIFVSSS1TY2hlbWUgSU1ITyB3YXMgdGhhdCBpdCBhbGxvd2Vk
IHN5c3RlbSB2cyB1c2VyIGtleXMsIHdoaWNoIHdhcyBvdGhlcndpc2Ugbm90IHBvc3NpYmxlLiBU
aGUgcGF0aC1zY2hlbWUgb2YgRkFQSSBub3cgYWxyZWFkeSBlbmNvZGVzIHRoaXMgZnJvbSBUU1Mg
c2lkZS48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pk15IHBlcnNvbmFsIGlkZWEgd2FzOjwv
ZGl2Pgo8ZGl2Pi0gcHJlZml4ZXMgMHg4MSAocGVyc2lzdGVudCkgYW5kIDB4MDEgKE5WLVNwYWNl
KSB3aWxsIHBvaW50IHRvIFRQTS1pbnRlcm5hbCAoYXMgYXBwbGljYWJsZSBvbmUgb3IgdGhlIG90
aGVyKTxicj4KPC9kaXY+CjxkaXY+LSBJZiBub3QgaXQgbG9va3MgZm9yIGEgRkFQSSBrZXlzdG9y
ZSBwYXRoPC9kaXY+CjxkaXY+LSBJZiBub3QgaXQgbG9va3MgaWYgYSBmaWxlIG9mIHRoaXMgbmFt
ZSBleGlzdHM8YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+V2UgY291bGQgb2YgY291
cnNlIHByZWZpeCBhbGwgb2YgaXQsIGJ1dCBxdWVzdGlvbiBpcywgd2hldGhlciBpdCdzIHdvcnRo
IGl0ID88L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PldoYXQgZG8gcGVvcGxlIHRoaW5rID88
YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+Q2hlZXJzLDwvZGl2Pgo8ZGl2PkFuZHJl
YXM8YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OlRp
bWVzIE5ldyBSb21hbjsgY29sb3I6IzAwMDAwMDsgZm9udC1zaXplOjE2cHgiPgo8aHIgdGFiaW5k
ZXg9Ii0xIj4KPGRpdiBpZD0iZGl2UnBGNDM2ODYwIiBzdHlsZT0iZGlyZWN0aW9uOmx0ciI+PGZv
bnQgc2l6ZT0iMiIgZmFjZT0iVGFob21hIiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IE5p
a29zIE1hdnJvZ2lhbm5vcG91bG9zIFtuLm1hdnJvZ2lhbm5vcG91bG9zQGdtYWlsLmNvbV08YnI+
CjxiPlNlbnQ6PC9iPiBGcmlkYXksIE9jdG9iZXIgMDUsIDIwMTggMTE6NTQ8YnI+CjxiPlRvOjwv
Yj4gRGF2aWQgV29vZGhvdXNlPGJyPgo8Yj5DYzo8L2I+IEZ1Y2hzLCBBbmRyZWFzOyBKYW1lcyBC
b3R0b21sZXk7IHRwbTJAbGlzdHMuMDEub3JnPGJyPgo8Yj5TdWJqZWN0OjwvYj4gUmU6IFt0cG0y
XSBDb25mbGljdGluZyBUUE0yIGVuZ2luZXMgYW5kIHN0b3JhZ2UgZm9ybWF0czxicj4KPC9mb250
Pjxicj4KPC9kaXY+CjxkaXY+PC9kaXY+CjxkaXY+CjxkaXYgZGlyPSJsdHIiPgo8ZGl2Pkl0IHdv
dWxkIGNlcnRhaW5seSBiZSBnb29kIHRvIGhhdmUgYSBzdGFuZGFyZCwgdW5hbWJpZ3VvdXMgd2F5
IHRvIHJlZmVyZW5jZSBpdGVtcyBpbiBhIFRQTSByYXRoZXIgdGhhbiBqdXN0IGhleCBudW1iZXJz
LiBXZSB3ZXJlIGFyZSB0aGF0IHNpdHVhdGlvbiB3aXRoIEhTTXMgNSB5ZWFycyBhZ28sIGFuZCB0
aGUgc3dpdGNoIHRvIHBrY3MxMTogVVJJcyBoZWxwZWQgaW1wcm92ZSBzb2Z0d2FyZSBpbnRlcmZh
Y2VzIGdyZWF0bHkgKGluIGFwYWNoZQogdG9kYXkgeW91IHNwZWNpZnkgYSBmaWxlIG9yIGEgc21h
cnQgY2FyZCBvYmplY3QgPHNwYW4+aW50ZXJjaGFuZ2VhYmx5PC9zcGFuPikuIFRoZSB0cG11cmkg
c2NoZW1lIHRoYXQgRGF2aWQgcG9pbnRlZCBjb3VsZCBiZSBhIGdvb2Qgc3RhcnRpbmcgcG9pbnQu
PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5yZWdhcmRzLDwvZGl2Pgo8ZGl2Pk5pa29zPGJy
Pgo8L2Rpdj4KPGRpdiBkaXI9Imx0ciI+CjxkaXY+PGJyPgo8ZGl2IGNsYXNzPSJnbWFpbF9xdW90
ZSI+CjxkaXYgZGlyPSJsdHIiPk9uIFRodSwgT2N0IDQsIDIwMTggYXQgNjoxNyBQTSBEYXZpZCBX
b29kaG91c2UgJmx0OzxhIGhyZWY9Im1haWx0bzpkd213MkBpbmZyYWRlYWQub3JnIiByZWw9Im5v
b3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5kd213MkBpbmZyYWRlYWQub3JnPC9h
PiZndDsgd3JvdGU6PGJyPgo8L2Rpdj4KPGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkOyBwYWRk
aW5nLWxlZnQ6MWV4Ij4KPGJyPgpGV0lXIEkgaGF2ZSB0aGUgR251VExTIGNvZGUgYWxzbyB3b3Jr
aW5nLCBpbmNsdWRpbmcgd2l0aCBFQyBrZXlzIChhbmQgSTxicj4KdGhpbmsgSSBrbm93IGhvdyB0
byB0ZWxsIEdudVRMUyBub3QgdG8gYXNrIG1lIHRvIGRvIFNIQTUxMikuIEkgc2hvdWxkPGJyPgpi
ZSBhYmxlIHRvIGFkanVzdCBpdCB0byBjb25mb3JtIHRvIHdoYXRldmVyIGNvbnNlbnN1cyB3ZSBy
ZWFjaC48YnI+Cjxicj4KY2YuIDxhIGhyZWY9Imh0dHBzOi8vdG9vbHMuaWV0Zi5vcmcvaHRtbC9k
cmFmdC1tYXZyb2dpYW5ub3BvdWxvcy10cG11cmktMDEiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPgpodHRwczovL3Rvb2xzLmlldGYub3JnL2h0bWwvZHJhZnQtbWF2cm9naWFubm9w
b3Vsb3MtdHBtdXJpLTAxPC9hPjxicj4KPGJyPgo8YnI+Ck9uIFRodSwgMjAxOC0xMC0wNCBhdCAx
NjowNCAmIzQzOzAwMDAsIEZ1Y2hzLCBBbmRyZWFzIHdyb3RlOjxicj4KJmd0OyBTaG91bGQgd2Ug
dHJ5IHRvIHNldHVwIGEgd2lraSBvciBtYXJrZG93biB0byBzdGFydCBjb252ZXJnaW5nIGludG8g
YSBzaW5nbGUgZm9ybSA/PGJyPgomZ3Q7IEkgdGhpbmsgd2UgY2FuIGFsc28gZWFzaWx5IHNldCBO
T0RBIGZvciB0aGUgcHJpbWFyeSwgYmVjYXVzZSB0aGV5IGhhdmUgdG8gYXV0aCB2YWx1ZSBhbnl3
YXlzLjxicj4KJmd0OyA8YnI+CiZndDsgQEphbWVzOiBob3cgZG8geW91IGhhbmRsZSB0aGUga2V5
LWlkcyA/IEFsbHdheXMgYXNzdW1lIHRoZW0gdG8gYmUgZmlsZXMgPzxicj4KJmd0OyBJIGhhdmUg
YSBQUiBmb3IgcGVyc2lzdGVudCBUUE0ga2V5cywgd2hlcmUgYWxsIGtleSBpZHMgc3RhcnRpbmcg
d2l0aCAweCBhcmUgaW50ZXJwcmV0ZWQgYXMgVFBNIGtleXMuPGJyPgomZ3Q7IEZvciB0aGUgZnV0
dXJlIEknbGwgYWxzbyB3YW50IHRvIHJlZmVyZW5jZSBGQVBJIGtleXMgKHBhdGgtbGlrZSBmb3Jt
YXQpLjxicj4KJmd0OyBUaHVzLCBhbnkgY2x1ZXMgb24gaG93IHRvIGhhbmRsZSB0aGluZ3MgY29u
c2lzdGVudGx5IGhlcmUgPzxicj4KJmd0OyA8YnI+CiZndDsgdHBtMi10c3MtZW5naW5lIHdpbGwg
cHJvcGFibHkgbm90IHN1cHBvcnQgcG9saWNpZXMgZnJvbSB5b3VyIGZvcm1hdCB0aGVuLCBidXQg
d2FpdCB1bnRpbCBGQVBJICh3aXRoIGludGVncmF0ZWQgcG9saWN5IGVuZ2luZSkgaXMgYXZhaWxh
YmxlLjxicj4KJmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJy
PgomZ3Q7IEZyb206IERhdmlkIFdvb2Rob3VzZSBbPGEgaHJlZj0ibWFpbHRvOmR3bXcyQGluZnJh
ZGVhZC5vcmciIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmR3bXcy
QGluZnJhZGVhZC5vcmc8L2E+XTxicj4KJmd0OyBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMDMs
IDIwMTggMjI6NDc8YnI+CiZndDsgVG86IEphbWVzIEJvdHRvbWxleTsgRnVjaHMsIEFuZHJlYXM7
IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgcmVsPSJub29wZW5lciBub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+CnRwbTJAbGlzdHMuMDEub3JnPC9hPjsgTmlrb3MgTWF2cm9n
aWFubm9wb3Vsb3M8YnI+CiZndDsgU3ViamVjdDogUmU6IFt0cG0yXSBDb25mbGljdGluZyBUUE0y
IGVuZ2luZXMgYW5kIHN0b3JhZ2UgZm9ybWF0czxicj4KJmd0OyA8YnI+CiZndDsgT24gV2VkLCAy
MDE4LTEwLTAzIGF0IDExOjM1ICYjNDM7MDEwMCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOjxicj4K
Jmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7IEZ1bGwgcGF0Y2ggYmVsb3cs
IGZvciByZWZlcmVuY2UuIERvbid0IGhlY2tsZSB0b28gaGFyZDsgaXQgZXhpc3RzPGJyPgomZ3Q7
ICZndDsgbW9zdGx5IHRvIGRvY3VtZW50IHRoZSBjdXJyZW50IGluY29tcGF0aWJpbGl0aWVzLiBJ
J2xsIGxldCB0aGUgdHdvIG9mPGJyPgomZ3Q7ICZndDsgeW91IGNvbWUgdG8gYW4gYWdyZWVtZW50
IG9uIHRoZSBjb3JyZWN0IHdheSB0byByZXNvbHZlIHRoZW0sIHdoaWxlIEk8YnI+CiZndDsgJmd0
OyB0aHJvdyB0b2dldGhlciBzb21lIEdudVRMUyBjb2RlIHRvIHVzZSB0aGUgc2FtZSBQRU0gZmls
ZXMuPGJyPgomZ3Q7IDxicj4KJmd0OyBPSy4uLiBPcGVuQ29ubmVjdCBub3cgc3VwcG9ydHMgYm90
aCBPcGVuU1NMIGVuZ2luZXMsIGFuZCBJJ3ZlIHRocm93bjxicj4KJmd0OyB0b2dldGhlciBzb21l
IEdudVRMUyBjb2RlIGNyaWJiaW5nIGZyb20gdHBtMi10c3MtZW5naW5lLCBpbXBsZW1lbnRpbmcg
YTxicj4KJmd0OyBnbnV0bHNfcHJpdmtleV90IHdpdGggc29tZSBjYXZlYXRzIChSU0Egb25seSwg
UEtDUyMxIHBhZGRpbmcgb25seSw8YnI+CiZndDsgbm8gYXV0aCwgbm8gcG9saWN5LCBvbmx5IHRo
ZSBkZWZhdWx0IHBhcmVudCwgLi4uKS48YnI+CiZndDsgPGJyPgomZ3Q7IDxhIGhyZWY9Imh0dHA6
Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9kd213Mi9vcGVuY29ubmVjdC5naXQvYmxvYi90cG0y
Oi9nbnV0bHNfdHBtMl9lc3lzLmMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPgpo
dHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvZHdtdzIvb3BlbmNvbm5lY3QuZ2l0L2Jsb2Iv
dHBtMjovZ251dGxzX3RwbTJfZXN5cy5jPC9hPjxicj4KJmd0OyA8YSBocmVmPSJodHRwOi8vZ2l0
LmluZnJhZGVhZC5vcmcvdXNlcnMvZHdtdzIvb3BlbmNvbm5lY3QuZ2l0L2Jsb2IvdHBtMjovZ251
dGxzX3RwbTIuYyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+Cmh0dHA6Ly9naXQu
aW5mcmFkZWFkLm9yZy91c2Vycy9kd213Mi9vcGVuY29ubmVjdC5naXQvYmxvYi90cG0yOi9nbnV0
bHNfdHBtMi5jPC9hPjxicj4KJmd0OyA8YnI+CiZndDsgSSdkIGxvdmUgKm5vdCogdG8gaGF2ZSB0
byBmaXggYWxsIHRob3NlIGNhdmVhdHMsIGFuZCBmb3IgdGhpcyB0byBsaXZlPGJyPgomZ3Q7IGlu
IGEgbGlicmFyeSBzb21ld2hlcmUgaW5zdGVhZC4gOik8YnI+Cjxicj4KPC9ibG9ja3F1b3RlPgo8
L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+Cjwv
ZGl2Pgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============2006453700589978144==--

