Content-Type: multipart/mixed; boundary="===============3109383766495308973=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: =?utf-8?q?=5Btpm2=5D_Re=3A_How_can_I_use_a_persisted_object_without_it?=
 =?utf-8?q?=E2=80=99s_primary_key=3F?=
Date: Wed, 12 May 2021 18:25:18 +0000
Message-ID: <SN6PR11MB34373A9A7CC6B962C669B50DB8529@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 19483178-A981-4AC4-B392-B709E07384AE@rowan.moul.ca
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3109383766495308973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Given an object with appropriate object attributes, you could tpm2_duplicat=
e the object to move it to a different TPM or the same spot in the TPM. Mor=
e details in man tpm2_duplicate.
I don't think you can use this to get the plain text key, because a public =
key to the new parent is required, but I'm not 100% sure.
________________________________
From: Rowan Moul <lists(a)rowan.moul.ca>
Sent: Thursday, May 6, 2021 8:00 AM
To: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Re: How can I use a persisted object without it=E2=80=99s p=
rimary key?

That makes sense.

What if I want to extract the key from the tpm later? Assuming I did not re=
tain the private portion of the signing key when I created it (perhaps I us=
ed the createLoaded command and it never left the tpm). I was looking throu=
gh all the tools and I did not see one that would let me export the private=
 part of the key even if I re-loaded the primary key (which I assume would =
he required so that it could be used to encrypt the private area before it =
leaves the tpm).
Also, if I wanted to move the signing key to another tpm (or even an altern=
ative key management solution) is there a way to export the key in the clea=
r?

It seems to me that if I don=E2=80=99t need this key to ever leave the tpm =
then the primary key has no purpose beyond being required in the initial cr=
eation command. I=E2=80=99m sure this is not entirely the case though.

Thank you,

Rowan

> On May 6, 2021, at 02:06, Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.=
de> wrote:
>
> =EF=BB=BFPersistent keys inside the TPM are not encrypted with their pare=
nt anymore.
> Only with a TPM-internal flash-encryption that you do not have to care ab=
out.
>
> ________________________________________
> Von: Rowan Moul <lists(a)rowan.moul.ca>
> Gesendet: Donnerstag, 6. Mai 2021 07:17
> An: tpm2(a)lists.01.org
> Betreff: [tpm2] How can I use a persisted object without it=E2=80=99s pri=
mary key?
>
> Hello,
> I=E2=80=99m just trying to get a better sense of how the TPM storage hier=
archy works.
>
> Say I create a primary key under the owner hierarchy, and then I create a=
 signing key under that. I persist the signing key with tpm2_evictcontrol b=
ut I do NOT persist the primary key.
> How am I able to use the signing key on subsequent boots without the prim=
ary key existing in the TPM memory? Isn=E2=80=99t it needed to decrypt the =
signing key? Or is the persisted signing key not encrypted by the primary k=
ey when it resides inside the TPM hardware?
>
> Thanks,
>
> Rowan
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============3109383766495308973==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBD
YWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij4NCkdpdmVuIGFuIG9iamVjdCB3aXRoIGFwcHJvcHJpYXRlIG9i
amVjdCBhdHRyaWJ1dGVzLCB5b3UgY291bGQgdHBtMl9kdXBsaWNhdGUgdGhlIG9iamVjdCB0byBt
b3ZlIGl0IHRvIGEgZGlmZmVyZW50IFRQTSBvciB0aGUgc2FtZSBzcG90IGluIHRoZSBUUE0uIE1v
cmUgZGV0YWlscyBpbiBtYW4gdHBtMl9kdXBsaWNhdGUuPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250
LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXpl
OiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpJIGRvbid0IHRoaW5rIHlvdSBjYW4gdXNl
IHRoaXMgdG8gZ2V0IHRoZSBwbGFpbiB0ZXh0IGtleSwgYmVjYXVzZSBhIHB1YmxpYyBrZXkgdG8g
dGhlIG5ldyBwYXJlbnQgaXMgcmVxdWlyZWQsIGJ1dCBJJ20gbm90IDEwMCUgc3VyZS48L2Rpdj4N
CjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9kaXY+DQo8aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5l
LWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4NCjxkaXYgaWQ9ImRpdlJwbHlGd2RNc2ci
IGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0iZm9udC1z
aXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gUm93YW4gTW91bCAmbHQ7bGlz
dHNAcm93YW4ubW91bC5jYSZndDs8YnI+DQo8Yj5TZW50OjwvYj4gVGh1cnNkYXksIE1heSA2LCAy
MDIxIDg6MDAgQU08YnI+DQo8Yj5Ubzo8L2I+IEZ1Y2hzLCBBbmRyZWFzICZsdDthbmRyZWFzLmZ1
Y2hzQHNpdC5mcmF1bmhvZmVyLmRlJmd0Ozxicj4NCjxiPkNjOjwvYj4gdHBtMkBsaXN0cy4wMS5v
cmcgJmx0O3RwbTJAbGlzdHMuMDEub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBbdHBtMl0g
UmU6IEhvdyBjYW4gSSB1c2UgYSBwZXJzaXN0ZWQgb2JqZWN0IHdpdGhvdXQgaXTigJlzIHByaW1h
cnkga2V5PzwvZm9udD4NCjxkaXY+Jm5ic3A7PC9kaXY+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IkJv
ZHlGcmFnbWVudCI+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+
DQo8ZGl2IGNsYXNzPSJQbGFpblRleHQiPlRoYXQgbWFrZXMgc2Vuc2UuPGJyPg0KPGJyPg0KV2hh
dCBpZiBJIHdhbnQgdG8gZXh0cmFjdCB0aGUga2V5IGZyb20gdGhlIHRwbSBsYXRlcj8gQXNzdW1p
bmcgSSBkaWQgbm90IHJldGFpbiB0aGUgcHJpdmF0ZSBwb3J0aW9uIG9mIHRoZSBzaWduaW5nIGtl
eSB3aGVuIEkgY3JlYXRlZCBpdCAocGVyaGFwcyBJIHVzZWQgdGhlIGNyZWF0ZUxvYWRlZCBjb21t
YW5kIGFuZCBpdCBuZXZlciBsZWZ0IHRoZSB0cG0pLiBJIHdhcyBsb29raW5nIHRocm91Z2ggYWxs
IHRoZSB0b29scyBhbmQgSSBkaWQgbm90IHNlZQ0KIG9uZSB0aGF0IHdvdWxkIGxldCBtZSBleHBv
cnQgdGhlIHByaXZhdGUgcGFydCBvZiB0aGUga2V5IGV2ZW4gaWYgSSByZS1sb2FkZWQgdGhlIHBy
aW1hcnkga2V5ICh3aGljaCBJIGFzc3VtZSB3b3VsZCBoZSByZXF1aXJlZCBzbyB0aGF0IGl0IGNv
dWxkIGJlIHVzZWQgdG8gZW5jcnlwdCB0aGUgcHJpdmF0ZSBhcmVhIGJlZm9yZSBpdCBsZWF2ZXMg
dGhlIHRwbSkuPGJyPg0KQWxzbywgaWYgSSB3YW50ZWQgdG8gbW92ZSB0aGUgc2lnbmluZyBrZXkg
dG8gYW5vdGhlciB0cG0gKG9yIGV2ZW4gYW4gYWx0ZXJuYXRpdmUga2V5IG1hbmFnZW1lbnQgc29s
dXRpb24pIGlzIHRoZXJlIGEgd2F5IHRvIGV4cG9ydCB0aGUga2V5IGluIHRoZSBjbGVhcj88YnI+
DQo8YnI+DQpJdCBzZWVtcyB0byBtZSB0aGF0IGlmIEkgZG9u4oCZdCBuZWVkIHRoaXMga2V5IHRv
IGV2ZXIgbGVhdmUgdGhlIHRwbSB0aGVuIHRoZSBwcmltYXJ5IGtleSBoYXMgbm8gcHVycG9zZSBi
ZXlvbmQgYmVpbmcgcmVxdWlyZWQgaW4gdGhlIGluaXRpYWwgY3JlYXRpb24gY29tbWFuZC4gSeKA
mW0gc3VyZSB0aGlzIGlzIG5vdCBlbnRpcmVseSB0aGUgY2FzZSB0aG91Z2guPGJyPg0KPGJyPg0K
VGhhbmsgeW91LDxicj4NCjxicj4NClJvd2FuPGJyPg0KPGJyPg0KJmd0OyBPbiBNYXkgNiwgMjAy
MSwgYXQgMDI6MDYsIEZ1Y2hzLCBBbmRyZWFzICZsdDthbmRyZWFzLmZ1Y2hzQHNpdC5mcmF1bmhv
ZmVyLmRlJmd0OyB3cm90ZTo8YnI+DQomZ3Q7IDxicj4NCiZndDsg77u/UGVyc2lzdGVudCBrZXlz
IGluc2lkZSB0aGUgVFBNIGFyZSBub3QgZW5jcnlwdGVkIHdpdGggdGhlaXIgcGFyZW50IGFueW1v
cmUuPGJyPg0KJmd0OyBPbmx5IHdpdGggYSBUUE0taW50ZXJuYWwgZmxhc2gtZW5jcnlwdGlvbiB0
aGF0IHlvdSBkbyBub3QgaGF2ZSB0byBjYXJlIGFib3V0Ljxicj4NCiZndDsgPGJyPg0KJmd0OyBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPg0KJmd0OyBWb246IFJv
d2FuIE1vdWwgJmx0O2xpc3RzQHJvd2FuLm1vdWwuY2EmZ3Q7PGJyPg0KJmd0OyBHZXNlbmRldDog
RG9ubmVyc3RhZywgNi4gTWFpIDIwMjEgMDc6MTc8YnI+DQomZ3Q7IEFuOiB0cG0yQGxpc3RzLjAx
Lm9yZzxicj4NCiZndDsgQmV0cmVmZjogW3RwbTJdIEhvdyBjYW4gSSB1c2UgYSBwZXJzaXN0ZWQg
b2JqZWN0IHdpdGhvdXQgaXTigJlzIHByaW1hcnkga2V5Pzxicj4NCiZndDsgPGJyPg0KJmd0OyBI
ZWxsbyw8YnI+DQomZ3Q7IEnigJltIGp1c3QgdHJ5aW5nIHRvIGdldCBhIGJldHRlciBzZW5zZSBv
ZiBob3cgdGhlIFRQTSBzdG9yYWdlIGhpZXJhcmNoeSB3b3Jrcy48YnI+DQomZ3Q7IDxicj4NCiZn
dDsgU2F5IEkgY3JlYXRlIGEgcHJpbWFyeSBrZXkgdW5kZXIgdGhlIG93bmVyIGhpZXJhcmNoeSwg
YW5kIHRoZW4gSSBjcmVhdGUgYSBzaWduaW5nIGtleSB1bmRlciB0aGF0LiBJIHBlcnNpc3QgdGhl
IHNpZ25pbmcga2V5IHdpdGggdHBtMl9ldmljdGNvbnRyb2wgYnV0IEkgZG8gTk9UIHBlcnNpc3Qg
dGhlIHByaW1hcnkga2V5Ljxicj4NCiZndDsgSG93IGFtIEkgYWJsZSB0byB1c2UgdGhlIHNpZ25p
bmcga2V5IG9uIHN1YnNlcXVlbnQgYm9vdHMgd2l0aG91dCB0aGUgcHJpbWFyeSBrZXkgZXhpc3Rp
bmcgaW4gdGhlIFRQTSBtZW1vcnk/IElzbuKAmXQgaXQgbmVlZGVkIHRvIGRlY3J5cHQgdGhlIHNp
Z25pbmcga2V5PyBPciBpcyB0aGUgcGVyc2lzdGVkIHNpZ25pbmcga2V5IG5vdCBlbmNyeXB0ZWQg
YnkgdGhlIHByaW1hcnkga2V5IHdoZW4gaXQgcmVzaWRlcyBpbnNpZGUgdGhlIFRQTSBoYXJkd2Fy
ZT88YnI+DQomZ3Q7IDxicj4NCiZndDsgVGhhbmtzLDxicj4NCiZndDsgPGJyPg0KJmd0OyBSb3dh
bjxicj4NCiZndDsgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X188YnI+DQomZ3Q7IHRwbTIgbWFpbGluZyBsaXN0IC0tIHRwbTJAbGlzdHMuMDEub3JnPGJyPg0K
Jmd0OyBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIHRwbTItbGVhdmVAbGlzdHMuMDEu
b3JnPGJyPg0KJmd0OyAlKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVy
bmFsX25hbWUpczxicj4NCiZndDsgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX188YnI+DQomZ3Q7IHRwbTIgbWFpbGluZyBsaXN0IC0tIHRwbTJAbGlzdHMuMDEu
b3JnPGJyPg0KJmd0OyBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIHRwbTItbGVhdmVA
bGlzdHMuMDEub3JnPGJyPg0KJmd0OyAlKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClz
LyUoX2ludGVybmFsX25hbWUpczxicj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fPGJyPg0KdHBtMiBtYWlsaW5nIGxpc3QgLS0gdHBtMkBsaXN0cy4wMS5v
cmc8YnI+DQpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIHRwbTItbGVhdmVAbGlzdHMu
MDEub3JnPGJyPg0KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5h
bF9uYW1lKXM8L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--===============3109383766495308973==--

