Content-Type: multipart/mixed; boundary="===============0222597643355105540=="
MIME-Version: 1.0
From: Rowan Moul <lists at rowan.moul.ca>
Subject: [tpm2] Re: how unique are primary keys ?
Date: Fri, 05 Jun 2020 16:34:47 -0600
Message-ID: <941AB458-8376-4C6C-995C-808C7773DA1C@rowan.moul.ca>
In-Reply-To: 8b015c5e-624a-ed89-903d-0621df4f4b8d@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0222597643355105540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Primary Keys are created using a deterministic key derivation function, the=
 seed value of the selected hierarchy, and the key =E2=80=9Ctemplate=E2=80=
=9D (effectively the options you pass to tpm2_createprimary). This is the i=
ntended functionality.

Your first two calls are identical, and so they will indeed produce the sam=
e key. The third one passes in unique data from /dev/random which in theory=
 should make it unique, but in practice I=E2=80=99m not sure how that is im=
plemented (eg how much data will it actually read in?). I=E2=80=99m actuall=
y surprised it didn=E2=80=99t fail based on my experience here:
https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/message/5YDZRV63LC=
GX6BZQXRW6S6F77PSS5JU5/
I=E2=80=99m honesty not even convinced that what I did in that thread was a=
ctually correct. Perhaps someone more knowledgeable will answer here and cl=
ear that up.
Another way to make a key unique is to set an authorization value or policy=
, but you would have to have a different value for every key, which is wher=
e the unique data is supposed to come in if you want multiple keys with the=
 same authorization value.


Rowan

> On Jun 4, 2020, at 17:48, ted.h.kim(a)oracle.com wrote:
> =

> =EF=BB=BFFolks,
> =

> How unique are primary keys ?
> =

> As an example:
> =

> $ tpm2_createprimary -Q -C o -c prim1.ctx
> $ tpm2_createprimary -Q -C o -c prim2.ctx
> $ tpm2_createprimary -Q -C o -u /dev/random -c prim3.ctx
> $ tpm2_readpublic -c prim1.ctx > prim1.rp
> $ tpm2_readpublic -c prim2.ctx > prim2.rp
> $ tpm2_readpublic -c prim3.ctx > prim3.rp
> $ diff prim1.rp prim2.rp
> $ diff prim1.rp prim3.rp
> $
> =

> Is it supposed to be like this?
> Shouldn't they be different in some way?
> For prim3, I thought putting some -u data would make a difference, but it=
 seems not.
> =

> FWIW, I am using 4.1 branch of tpm2-tools with swtpm.
> =

> Thanks,
> -ted
> =

> -- =

> Ted H. Kim, PhD
> ted.h.kim(a)oracle.com
> +1 310-258-7515
> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============0222597643355105540==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPjxkaXYgZGlyPSJs
dHIiPjxzcGFuPlByaW1hcnkgS2V5cyBhcmUgY3JlYXRlZCB1c2luZyBhIGRldGVybWluaXN0aWMg
a2V5IGRlcml2YXRpb24gZnVuY3Rpb24sIHRoZSBzZWVkIHZhbHVlIG9mIHRoZSBzZWxlY3RlZCBo
aWVyYXJjaHksIGFuZCB0aGUga2V5IOKAnHRlbXBsYXRl4oCdIChlZmZlY3RpdmVseSB0aGUgb3B0
aW9ucyB5b3UgcGFzcyB0byB0cG0yX2NyZWF0ZXByaW1hcnkpLiBUaGlzIGlzIHRoZSBpbnRlbmRl
ZCBmdW5jdGlvbmFsaXR5Ljwvc3Bhbj48L2Rpdj48ZGl2IGRpcj0ibHRyIj48YnI+PHNwYW4+WW91
ciBmaXJzdCB0d28gY2FsbHMgYXJlIGlkZW50aWNhbCwgYW5kIHNvIHRoZXkgd2lsbCBpbmRlZWQg
cHJvZHVjZSB0aGUgc2FtZSBrZXkuIFRoZSB0aGlyZCBvbmUgcGFzc2VzIGluIHVuaXF1ZSBkYXRh
IGZyb20gL2Rldi9yYW5kb20gd2hpY2ggaW4gdGhlb3J5IHNob3VsZCBtYWtlIGl0IHVuaXF1ZSwg
YnV0IGluIHByYWN0aWNlIEnigJltIG5vdCBzdXJlIGhvdyB0aGF0IGlzIGltcGxlbWVudGVkIChl
ZyBob3cgbXVjaCBkYXRhIHdpbGwgaXQgYWN0dWFsbHkgcmVhZCBpbj8pLiBJ4oCZbSBhY3R1YWxs
eSBzdXJwcmlzZWQgaXQgZGlkbuKAmXQgZmFpbCBiYXNlZCBvbiBteSBleHBlcmllbmNlIGhlcmU6
PC9zcGFuPjwvZGl2PjxkaXYgZGlyPSJsdHIiPjxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3Jn
L2h5cGVya2l0dHkvbGlzdC90cG0yQGxpc3RzLjAxLm9yZy9tZXNzYWdlLzVZRFpSVjYzTENHWDZC
WlFYUlc2UzZGNzdQU1M1SlU1LyI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlwZXJraXR0eS9saXN0
L3RwbTJAbGlzdHMuMDEub3JnL21lc3NhZ2UvNVlEWlJWNjNMQ0dYNkJaUVhSVzZTNkY3N1BTUzVK
VTUvPC9hPjwvZGl2PjxkaXYgZGlyPSJsdHIiPknigJltIGhvbmVzdHkgbm90IGV2ZW4gY29udmlu
Y2VkIHRoYXQgd2hhdCBJIGRpZCBpbiB0aGF0IHRocmVhZCB3YXMgYWN0dWFsbHkgY29ycmVjdC4g
UGVyaGFwcyBzb21lb25lIG1vcmUga25vd2xlZGdlYWJsZSB3aWxsIGFuc3dlciBoZXJlIGFuZCBj
bGVhciB0aGF0IHVwLjwvZGl2PjxkaXYgZGlyPSJsdHIiPkFub3RoZXIgd2F5IHRvIG1ha2UgYSBr
ZXkgdW5pcXVlIGlzIHRvIHNldCBhbiBhdXRob3JpemF0aW9uIHZhbHVlIG9yIHBvbGljeSwgYnV0
IHlvdSB3b3VsZCBoYXZlIHRvIGhhdmUgYSBkaWZmZXJlbnQgdmFsdWUgZm9yIGV2ZXJ5IGtleSwg
d2hpY2ggaXMgd2hlcmUgdGhlIHVuaXF1ZSBkYXRhIGlzIHN1cHBvc2VkIHRvIGNvbWUgaW4gaWYg
eW91IHdhbnQgbXVsdGlwbGUga2V5cyB3aXRoIHRoZSBzYW1lIGF1dGhvcml6YXRpb24gdmFsdWUu
PC9kaXY+PGRpdiBkaXI9Imx0ciI+PHNwYW4+PC9zcGFuPjxicj48c3Bhbj48L3NwYW4+PGJyPjxz
cGFuPlJvd2FuPC9zcGFuPjxicj48c3Bhbj48L3NwYW4+PGJyPjxibG9ja3F1b3RlIHR5cGU9ImNp
dGUiPjxzcGFuPk9uIEp1biA0LCAyMDIwLCBhdCAxNzo0OCwgdGVkLmgua2ltQG9yYWNsZS5jb20g
d3JvdGU6PC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNw
YW4+PC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+
77u/Rm9sa3MsPC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+
PHNwYW4+PC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNw
YW4+SG93IHVuaXF1ZSBhcmUgcHJpbWFyeSBrZXlzID88L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48
YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj48L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48Ymxv
Y2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj5BcyBhbiBleGFtcGxlOjwvc3Bhbj48YnI+PC9ibG9j
a3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPjwvc3Bhbj48YnI+PC9ibG9ja3F1
b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPiQgdHBtMl9jcmVhdGVwcmltYXJ5IC1R
IC1DIG8gLWMgcHJpbTEuY3R4PC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgdHlw
ZT0iY2l0ZSI+PHNwYW4+JCB0cG0yX2NyZWF0ZXByaW1hcnkgLVEgLUMgbyAtYyBwcmltMi5jdHg8
L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj4kIHRw
bTJfY3JlYXRlcHJpbWFyeSAtUSAtQyBvIC11IC9kZXYvcmFuZG9tIC1jIHByaW0zLmN0eDwvc3Bh
bj48YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPiQgdHBtMl9y
ZWFkcHVibGljIC1jIHByaW0xLmN0eCAmZ3Q7IHByaW0xLnJwPC9zcGFuPjxicj48L2Jsb2NrcXVv
dGU+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+JCB0cG0yX3JlYWRwdWJsaWMgLWMgcHJp
bTIuY3R4ICZndDsgcHJpbTIucnA8L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48YmxvY2txdW90ZSB0
eXBlPSJjaXRlIj48c3Bhbj4kIHRwbTJfcmVhZHB1YmxpYyAtYyBwcmltMy5jdHggJmd0OyBwcmlt
My5ycDwvc3Bhbj48YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFu
PiQgZGlmZiBwcmltMS5ycCBwcmltMi5ycDwvc3Bhbj48YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1
b3RlIHR5cGU9ImNpdGUiPjxzcGFuPiQgZGlmZiBwcmltMS5ycCBwcmltMy5ycDwvc3Bhbj48YnI+
PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPiQ8L3NwYW4+PGJyPjwv
YmxvY2txdW90ZT48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj48L3NwYW4+PGJyPjwvYmxv
Y2txdW90ZT48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj5JcyBpdCBzdXBwb3NlZCB0byBi
ZSBsaWtlIHRoaXM/PC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+PHNwYW4+U2hvdWxkbid0IHRoZXkgYmUgZGlmZmVyZW50IGluIHNvbWUgd2F5Pzwvc3Bhbj48
YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPkZvciBwcmltMywg
SSB0aG91Z2h0IHB1dHRpbmcgc29tZSAtdSBkYXRhIHdvdWxkIG1ha2UgYSBkaWZmZXJlbmNlLCBi
dXQgaXQgc2VlbXMgbm90Ljwvc3Bhbj48YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiPjxzcGFuPjwvc3Bhbj48YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNp
dGUiPjxzcGFuPkZXSVcsIEkgYW0gdXNpbmcgNC4xIGJyYW5jaCBvZiB0cG0yLXRvb2xzIHdpdGgg
c3d0cG0uPC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNw
YW4+PC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+
VGhhbmtzLDwvc3Bhbj48YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxz
cGFuPi10ZWQ8L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48
c3Bhbj48L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bh
bj4tLSA8L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bh
bj5UZWQgSC4gS2ltLCBQaEQ8L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48YmxvY2txdW90ZSB0eXBl
PSJjaXRlIj48c3Bhbj50ZWQuaC5raW1Ab3JhY2xlLmNvbTwvc3Bhbj48YnI+PC9ibG9ja3F1b3Rl
PjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPisxIDMxMC0yNTgtNzUxNTwvc3Bhbj48YnI+
PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPjwvc3Bhbj48YnI+PC9i
bG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+dHBtMiBtYWlsaW5nIGxpc3QgLS0gdHBtMkBsaXN0
cy4wMS5vcmc8L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48
c3Bhbj5UbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIHRwbTItbGVhdmVAbGlzdHMuMDEu
b3JnPC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+
JSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8L3Nw
YW4+PGJyPjwvYmxvY2txdW90ZT48L2Rpdj48L2JvZHk+PC9odG1sPg==
--===============0222597643355105540==--

