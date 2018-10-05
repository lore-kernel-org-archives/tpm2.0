Content-Type: multipart/mixed; boundary="===============1784399702576689939=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Fri, 05 Oct 2018 10:19:40 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0142678531@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: CAJU7za+icpa=m8RKmG=g5HSowoxJBrAKocNtVmr2mOb17Vw80w@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1784399702576689939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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


--===============1784399702576689939==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+UCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9
PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBmcHN0eWxlPSIxIiBvY3NpPSIwIj4KPGRpdiBzdHlsZT0i
ZGlyZWN0aW9uOiBsdHI7Zm9udC1mYW1pbHk6IFRhaG9tYTtjb2xvcjogIzAwMDAwMDtmb250LXNp
emU6IDEwcHQ7Ij4KPGRpdj5UaGF0J3MgYSBnb29kIHBvaW50IGFjdHVhbGx5LjwvZGl2Pgo8ZGl2
Pjxicj4KPC9kaXY+CjxkaXY+SG93ZXZlciwgVFNTMiBGQVBJIHdpbGwgbm90IHVzZSB0aGUgJnF1
b3Q7d2VpcmQmcXVvdDsgVVVJRHMgZm9yIGtleXMgYW55bW9yZSwgYnV0IHBhdGgtbGlrZSBzdHJp
bmdzLjwvZGl2Pgo8ZGl2Pjxicj4KU2VlIDxhIGhyZWY9Imh0dHBzOi8vdHJ1c3RlZGNvbXB1dGlu
Z2dyb3VwLm9yZy93cC1jb250ZW50L3VwbG9hZHMvVFNTLUZlYXR1cmUtQVBJLXZlcnNpb24tLjEy
X1Jldmlldy5wZGYiIHRhcmdldD0iX2JsYW5rIj4KaHR0cHM6Ly90cnVzdGVkY29tcHV0aW5nZ3Jv
dXAub3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy9UU1MtRmVhdHVyZS1BUEktdmVyc2lvbi0uMTJfUmV2
aWV3LnBkZjwvYT48L2Rpdj4KPGRpdj5wYWdlIDE2IChleGFtcGxlcykgYW5kIGFsbCBvZiBzZWN0
aW9uIDQgZm9yIGV4cGxhbmF0aW9uLjxicj4KPC9kaXY+CjxkaXY+Tm90ZSB0aGF0IHRoYXQgd2Fz
IGEgdmVyeSBlYXJseSB2ZXJzaW9uIGFuZCBoYXMgYmVlbiByZXZpc2VkIHNpbmNlIHRoZW4sIGJ1
dCB0aGUgZ2VuZXJhbCBjb25jZXB0IHN0aWxsIHN0aWNrcy48YnI+CjwvZGl2Pgo8ZGl2Pjxicj4K
PC9kaXY+CjxkaXY+VGh1cywgdGhlIFVSSS1TY2hlbWUgd2lsbCBoYXZlIHRvIGNoYW5nZSBhbnl3
YXlzLjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+VGhlIGJpZ2dlc3QgcG9pbnQgZm9yIHRo
ZSBVUkktU2NoZW1lIElNSE8gd2FzIHRoYXQgaXQgYWxsb3dlZCBzeXN0ZW0gdnMgdXNlciBrZXlz
LCB3aGljaCB3YXMgb3RoZXJ3aXNlIG5vdCBwb3NzaWJsZS4gVGhlIHBhdGgtc2NoZW1lIG9mIEZB
UEkgbm93IGFscmVhZHkgZW5jb2RlcyB0aGlzIGZyb20gVFNTIHNpZGUuPC9kaXY+CjxkaXY+PGJy
Pgo8L2Rpdj4KPGRpdj5NeSBwZXJzb25hbCBpZGVhIHdhczo8L2Rpdj4KPGRpdj4tIHByZWZpeGVz
IDB4ODEgKHBlcnNpc3RlbnQpIGFuZCAweDAxIChOVi1TcGFjZSkgd2lsbCBwb2ludCB0byBUUE0t
aW50ZXJuYWwgKGFzIGFwcGxpY2FibGUgb25lIG9yIHRoZSBvdGhlcik8YnI+CjwvZGl2Pgo8ZGl2
Pi0gSWYgbm90IGl0IGxvb2tzIGZvciBhIEZBUEkga2V5c3RvcmUgcGF0aDwvZGl2Pgo8ZGl2Pi0g
SWYgbm90IGl0IGxvb2tzIGlmIGEgZmlsZSBvZiB0aGlzIG5hbWUgZXhpc3RzPGJyPgo8L2Rpdj4K
PGRpdj48YnI+CjwvZGl2Pgo8ZGl2PldlIGNvdWxkIG9mIGNvdXJzZSBwcmVmaXggYWxsIG9mIGl0
LCBidXQgcXVlc3Rpb24gaXMsIHdoZXRoZXIgaXQncyB3b3J0aCBpdCA/PC9kaXY+CjxkaXY+PGJy
Pgo8L2Rpdj4KPGRpdj5XaGF0IGRvIHBlb3BsZSB0aGluayA/PGJyPgo8L2Rpdj4KPGRpdj48YnI+
CjwvZGl2Pgo8ZGl2PkNoZWVycyw8L2Rpdj4KPGRpdj5BbmRyZWFzPGJyPgo8L2Rpdj4KPGRpdj48
YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogVGltZXMgTmV3IFJvbWFuOyBjb2xv
cjogIzAwMDAwMDsgZm9udC1zaXplOiAxNnB4Ij4KPGhyIHRhYmluZGV4PSItMSI+CjxkaXYgaWQ9
ImRpdlJwRjQzNjg2MCIgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyI+PGZvbnQgc2l6ZT0iMiIgZmFj
ZT0iVGFob21hIiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IE5pa29zIE1hdnJvZ2lhbm5v
cG91bG9zIFtuLm1hdnJvZ2lhbm5vcG91bG9zQGdtYWlsLmNvbV08YnI+CjxiPlNlbnQ6PC9iPiBG
cmlkYXksIE9jdG9iZXIgMDUsIDIwMTggMTE6NTQ8YnI+CjxiPlRvOjwvYj4gRGF2aWQgV29vZGhv
dXNlPGJyPgo8Yj5DYzo8L2I+IEZ1Y2hzLCBBbmRyZWFzOyBKYW1lcyBCb3R0b21sZXk7IHRwbTJA
bGlzdHMuMDEub3JnPGJyPgo8Yj5TdWJqZWN0OjwvYj4gUmU6IFt0cG0yXSBDb25mbGljdGluZyBU
UE0yIGVuZ2luZXMgYW5kIHN0b3JhZ2UgZm9ybWF0czxicj4KPC9mb250Pjxicj4KPC9kaXY+Cjxk
aXY+PC9kaXY+CjxkaXY+CjxkaXYgZGlyPSJsdHIiPgo8ZGl2Pkl0IHdvdWxkIGNlcnRhaW5seSBi
ZSBnb29kIHRvIGhhdmUgYSBzdGFuZGFyZCwgdW5hbWJpZ3VvdXMgd2F5IHRvIHJlZmVyZW5jZSBp
dGVtcyBpbiBhIFRQTSByYXRoZXIgdGhhbiBqdXN0IGhleCBudW1iZXJzLiBXZSB3ZXJlIGFyZSB0
aGF0IHNpdHVhdGlvbiB3aXRoIEhTTXMgNSB5ZWFycyBhZ28sIGFuZCB0aGUgc3dpdGNoIHRvIHBr
Y3MxMTogVVJJcyBoZWxwZWQgaW1wcm92ZSBzb2Z0d2FyZSBpbnRlcmZhY2VzIGdyZWF0bHkgKGlu
IGFwYWNoZQogdG9kYXkgeW91IHNwZWNpZnkgYSBmaWxlIG9yIGEgc21hcnQgY2FyZCBvYmplY3Qg
PHNwYW4+aW50ZXJjaGFuZ2VhYmx5PC9zcGFuPikuIFRoZSB0cG11cmkgc2NoZW1lIHRoYXQgRGF2
aWQgcG9pbnRlZCBjb3VsZCBiZSBhIGdvb2Qgc3RhcnRpbmcgcG9pbnQuPC9kaXY+CjxkaXY+PGJy
Pgo8L2Rpdj4KPGRpdj5yZWdhcmRzLDwvZGl2Pgo8ZGl2Pk5pa29zPGJyPgo8L2Rpdj4KPGRpdiBk
aXI9Imx0ciI+CjxkaXY+PGJyPgo8ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+CjxkaXYgZGlyPSJs
dHIiPk9uIFRodSwgT2N0IDQsIDIwMTggYXQgNjoxNyBQTSBEYXZpZCBXb29kaG91c2UgJmx0Ozxh
IGhyZWY9Im1haWx0bzpkd213MkBpbmZyYWRlYWQub3JnIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJu
b29wZW5lciBub3JlZmVycmVyIj5kd213MkBpbmZyYWRlYWQub3JnPC9hPiZndDsgd3JvdGU6PGJy
Pgo8L2Rpdj4KPGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAg
MCAwIC44ZXg7IGJvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkOyBwYWRkaW5nLWxlZnQ6MWV4Ij4K
PGJyPgpGV0lXIEkgaGF2ZSB0aGUgR251VExTIGNvZGUgYWxzbyB3b3JraW5nLCBpbmNsdWRpbmcg
d2l0aCBFQyBrZXlzIChhbmQgSTxicj4KdGhpbmsgSSBrbm93IGhvdyB0byB0ZWxsIEdudVRMUyBu
b3QgdG8gYXNrIG1lIHRvIGRvIFNIQTUxMikuIEkgc2hvdWxkPGJyPgpiZSBhYmxlIHRvIGFkanVz
dCBpdCB0byBjb25mb3JtIHRvIHdoYXRldmVyIGNvbnNlbnN1cyB3ZSByZWFjaC48YnI+Cjxicj4K
Y2YuIDxhIGhyZWY9Imh0dHBzOi8vdG9vbHMuaWV0Zi5vcmcvaHRtbC9kcmFmdC1tYXZyb2dpYW5u
b3BvdWxvcy10cG11cmktMDEiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPgpodHRw
czovL3Rvb2xzLmlldGYub3JnL2h0bWwvZHJhZnQtbWF2cm9naWFubm9wb3Vsb3MtdHBtdXJpLTAx
PC9hPjxicj4KPGJyPgo8YnI+Ck9uIFRodSwgMjAxOC0xMC0wNCBhdCAxNjowNCAmIzQzOzAwMDAs
IEZ1Y2hzLCBBbmRyZWFzIHdyb3RlOjxicj4KJmd0OyBTaG91bGQgd2UgdHJ5IHRvIHNldHVwIGEg
d2lraSBvciBtYXJrZG93biB0byBzdGFydCBjb252ZXJnaW5nIGludG8gYSBzaW5nbGUgZm9ybSA/
PGJyPgomZ3Q7IEkgdGhpbmsgd2UgY2FuIGFsc28gZWFzaWx5IHNldCBOT0RBIGZvciB0aGUgcHJp
bWFyeSwgYmVjYXVzZSB0aGV5IGhhdmUgdG8gYXV0aCB2YWx1ZSBhbnl3YXlzLjxicj4KJmd0OyA8
YnI+CiZndDsgQEphbWVzOiBob3cgZG8geW91IGhhbmRsZSB0aGUga2V5LWlkcyA/IEFsbHdheXMg
YXNzdW1lIHRoZW0gdG8gYmUgZmlsZXMgPzxicj4KJmd0OyBJIGhhdmUgYSBQUiBmb3IgcGVyc2lz
dGVudCBUUE0ga2V5cywgd2hlcmUgYWxsIGtleSBpZHMgc3RhcnRpbmcgd2l0aCAweCBhcmUgaW50
ZXJwcmV0ZWQgYXMgVFBNIGtleXMuPGJyPgomZ3Q7IEZvciB0aGUgZnV0dXJlIEknbGwgYWxzbyB3
YW50IHRvIHJlZmVyZW5jZSBGQVBJIGtleXMgKHBhdGgtbGlrZSBmb3JtYXQpLjxicj4KJmd0OyBU
aHVzLCBhbnkgY2x1ZXMgb24gaG93IHRvIGhhbmRsZSB0aGluZ3MgY29uc2lzdGVudGx5IGhlcmUg
Pzxicj4KJmd0OyA8YnI+CiZndDsgdHBtMi10c3MtZW5naW5lIHdpbGwgcHJvcGFibHkgbm90IHN1
cHBvcnQgcG9saWNpZXMgZnJvbSB5b3VyIGZvcm1hdCB0aGVuLCBidXQgd2FpdCB1bnRpbCBGQVBJ
ICh3aXRoIGludGVncmF0ZWQgcG9saWN5IGVuZ2luZSkgaXMgYXZhaWxhYmxlLjxicj4KJmd0OyBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgomZ3Q7IEZyb206IERh
dmlkIFdvb2Rob3VzZSBbPGEgaHJlZj0ibWFpbHRvOmR3bXcyQGluZnJhZGVhZC5vcmciIHRhcmdl
dD0iX2JsYW5rIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPmR3bXcyQGluZnJhZGVhZC5vcmc8
L2E+XTxicj4KJmd0OyBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMDMsIDIwMTggMjI6NDc8YnI+
CiZndDsgVG86IEphbWVzIEJvdHRvbWxleTsgRnVjaHMsIEFuZHJlYXM7IDxhIGhyZWY9Im1haWx0
bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9vcGVuZXIgbm9yZWZl
cnJlciI+CnRwbTJAbGlzdHMuMDEub3JnPC9hPjsgTmlrb3MgTWF2cm9naWFubm9wb3Vsb3M8YnI+
CiZndDsgU3ViamVjdDogUmU6IFt0cG0yXSBDb25mbGljdGluZyBUUE0yIGVuZ2luZXMgYW5kIHN0
b3JhZ2UgZm9ybWF0czxicj4KJmd0OyA8YnI+CiZndDsgT24gV2VkLCAyMDE4LTEwLTAzIGF0IDEx
OjM1ICYjNDM7MDEwMCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOjxicj4KJmd0OyAmZ3Q7IDxicj4K
Jmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7IEZ1bGwgcGF0Y2ggYmVsb3csIGZvciByZWZlcmVuY2Uu
IERvbid0IGhlY2tsZSB0b28gaGFyZDsgaXQgZXhpc3RzPGJyPgomZ3Q7ICZndDsgbW9zdGx5IHRv
IGRvY3VtZW50IHRoZSBjdXJyZW50IGluY29tcGF0aWJpbGl0aWVzLiBJJ2xsIGxldCB0aGUgdHdv
IG9mPGJyPgomZ3Q7ICZndDsgeW91IGNvbWUgdG8gYW4gYWdyZWVtZW50IG9uIHRoZSBjb3JyZWN0
IHdheSB0byByZXNvbHZlIHRoZW0sIHdoaWxlIEk8YnI+CiZndDsgJmd0OyB0aHJvdyB0b2dldGhl
ciBzb21lIEdudVRMUyBjb2RlIHRvIHVzZSB0aGUgc2FtZSBQRU0gZmlsZXMuPGJyPgomZ3Q7IDxi
cj4KJmd0OyBPSy4uLiBPcGVuQ29ubmVjdCBub3cgc3VwcG9ydHMgYm90aCBPcGVuU1NMIGVuZ2lu
ZXMsIGFuZCBJJ3ZlIHRocm93bjxicj4KJmd0OyB0b2dldGhlciBzb21lIEdudVRMUyBjb2RlIGNy
aWJiaW5nIGZyb20gdHBtMi10c3MtZW5naW5lLCBpbXBsZW1lbnRpbmcgYTxicj4KJmd0OyBnbnV0
bHNfcHJpdmtleV90IHdpdGggc29tZSBjYXZlYXRzIChSU0Egb25seSwgUEtDUyMxIHBhZGRpbmcg
b25seSw8YnI+CiZndDsgbm8gYXV0aCwgbm8gcG9saWN5LCBvbmx5IHRoZSBkZWZhdWx0IHBhcmVu
dCwgLi4uKS48YnI+CiZndDsgPGJyPgomZ3Q7IDxhIGhyZWY9Imh0dHA6Ly9naXQuaW5mcmFkZWFk
Lm9yZy91c2Vycy9kd213Mi9vcGVuY29ubmVjdC5naXQvYmxvYi90cG0yOi9nbnV0bHNfdHBtMl9l
c3lzLmMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPgpodHRwOi8vZ2l0LmluZnJh
ZGVhZC5vcmcvdXNlcnMvZHdtdzIvb3BlbmNvbm5lY3QuZ2l0L2Jsb2IvdHBtMjovZ251dGxzX3Rw
bTJfZXN5cy5jPC9hPjxicj4KJmd0OyA8YSBocmVmPSJodHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcv
dXNlcnMvZHdtdzIvb3BlbmNvbm5lY3QuZ2l0L2Jsb2IvdHBtMjovZ251dGxzX3RwbTIuYyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+Cmh0dHA6Ly9naXQuaW5mcmFkZWFkLm9yZy91
c2Vycy9kd213Mi9vcGVuY29ubmVjdC5naXQvYmxvYi90cG0yOi9nbnV0bHNfdHBtMi5jPC9hPjxi
cj4KJmd0OyA8YnI+CiZndDsgSSdkIGxvdmUgKm5vdCogdG8gaGF2ZSB0byBmaXggYWxsIHRob3Nl
IGNhdmVhdHMsIGFuZCBmb3IgdGhpcyB0byBsaXZlPGJyPgomZ3Q7IGluIGEgbGlicmFyeSBzb21l
d2hlcmUgaW5zdGVhZC4gOik8YnI+Cjxicj4KPC9ibG9ja3F1b3RlPgo8L2Rpdj4KPC9kaXY+Cjwv
ZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============1784399702576689939==--

