Content-Type: multipart/mixed; boundary="===============7895152335591240146=="
MIME-Version: 1.0
From: Niklas Andersson <niklas.andersson at fredenheim.se>
Subject: [tpm2] Re: tpm2_createprimary question about unique field
Date: Thu, 13 Feb 2020 09:57:39 +0100
Message-ID: <CAJ8N_u_ReJwRwAW2P_e1nqvYrQQ7WZ0Kax1YyKb6h7ZdXZz1vg@mail.gmail.com>
In-Reply-To: D7FB7D3D-C65A-438A-9D1D-D3539E92ADDF@rowan.moul.ca
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7895152335591240146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Adding one byte should not be needed in the latest version I believe.
Reason the byte was skipped earlier is because it just contains the byte
size of the following struct. When you output the struct to a file the file
size is obvious, and thus renders this byte obsolete.

Hope this helps.

- Niklas

On Thu, Feb 13, 2020, 02:12 Rowan Moul <lists(a)rowan.moul.ca> wrote:

> =EF=BB=BFWhat is the purpose of appending 0x00 0x01 to the beginning of t=
he
> unique data
> <https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_createp=
rimary.1.md#create-a-primary-object-that-follows-the-guidance-of-tcg-provis=
ioning-guide>?
> I'm sure it's just something obvious that I'm not seeing, but I can't seem
> to figure it out despite looking over the code and reading through TCG
> documents.
>
> All I can determine is that I get a "buffer_size: 4096 with offset: 46 are
> insufficient for object of size 51919" error if I don't have it. The obje=
ct
> size reported varies depending on data that I pass in. The amount of data
> is always 32 random bytes in my tests, but randomly generated. The object
> size seems far too large, which leads me to believe that something is
> reading past the end of the file, although I didn't see any obvious issues
> in the code that reads the files.
>
> It seems like more explanation is needed on the man page about the
> required format of this file, as the description given doesn't lead to the
> successful creation of a primary key unless you understand that you are
> supposed to add that to the front of the file rather than it just being an
> example.
>
> Thanks,
> Rowan
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============7895152335591240146==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPkFkZGluZyBvbmUgYnl0ZSBzaG91bGQgbm90IGJlIG5lZWRlZCBpbiB0
aGUgbGF0ZXN0IHZlcnNpb24gSSBiZWxpZXZlLiBSZWFzb24gdGhlIGJ5dGUgd2FzIHNraXBwZWQg
ZWFybGllciBpcyBiZWNhdXNlIGl0IGp1c3QgY29udGFpbnMgdGhlIGJ5dGUgc2l6ZSBvZiB0aGUg
Zm9sbG93aW5nIHN0cnVjdC4gV2hlbiB5b3Ugb3V0cHV0IHRoZSBzdHJ1Y3QgdG8gYSBmaWxlIHRo
ZSBmaWxlIHNpemUgaXMgb2J2aW91cywgYW5kIHRodXMgcmVuZGVycyB0aGlzIGJ5dGUgb2Jzb2xl
dGUuwqA8ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5Ib3BlIHRoaXMg
aGVscHMuwqA8L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj4t
IE5pa2xhczwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9
Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFRodSwgRmViIDEzLCAyMDIwLCAwMjoxMiBSb3dh
biBNb3VsICZsdDs8YSBocmVmPSJtYWlsdG86bGlzdHNAcm93YW4ubW91bC5jYSI+bGlzdHNAcm93
YW4ubW91bC5jYTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21h
aWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBz
b2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0iYXV0byI+PGRpdiBkaXI9Imx0ciI+PGZv
bnQgZmFjZT0iSGVsdmV0aWNhIj48c3BhbiBzdHlsZT0iZm9udC1zdHlsZTpub3JtYWwiPu+7vzxz
cGFuIHN0eWxlPSJjb2xvcjpyZ2IoMzYsNDEsNDYpIj5XaGF0IGlzIHRoZSBwdXJwb3NlIG9mIGFw
cGVuZGluZyAweDAwIDB4MDEgdG8gdGhlwqA8L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9ibG9iL21hc3Rlci9tYW4vdHBtMl9jcmVhdGVw
cmltYXJ5LjEubWQjY3JlYXRlLWEtcHJpbWFyeS1vYmplY3QtdGhhdC1mb2xsb3dzLXRoZS1ndWlk
YW5jZS1vZi10Y2ctcHJvdmlzaW9uaW5nLWd1aWRlIiBzdHlsZT0iY29sb3I6cmdiKDUsOTksMTkz
KSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+PHNwYW4gc3R5bGU9ImNvbG9yOnJn
YigzLDEwMiwyMTQpIj5iZWdpbm5pbmcgb2YgdGhlIHVuaXF1ZSBkYXRhPC9zcGFuPjwvYT48c3Bh
biBzdHlsZT0iY29sb3I6cmdiKDM2LDQxLDQ2KSI+PyBJJiMzOTttIHN1cmUgaXQmIzM5O3MganVz
dCBzb21ldGhpbmcgb2J2aW91cyB0aGF0IEkmIzM5O20gbm90IHNlZWluZywgYnV0IEkgY2FuJiMz
OTt0IHNlZW0gdG8gZmlndXJlIGl0IG91dCBkZXNwaXRlIGxvb2tpbmcgb3ZlciB0aGUgY29kZSBh
bmQgcmVhZGluZyB0aHJvdWdoIFRDRyBkb2N1bWVudHMuPC9zcGFuPjwvc3Bhbj48L2ZvbnQ+PGRp
diBkaXI9Imx0ciI+PHAgc3R5bGU9Im1hcmdpbi1ib3R0b206MTJwdDtiYWNrZ3JvdW5kLWNvbG9y
OndoaXRlIj48c3BhbiBzdHlsZT0iY29sb3I6cmdiKDM2LDQxLDQ2KTtmb250LXN0eWxlOm5vcm1h
bCI+PGZvbnQgZmFjZT0iSGVsdmV0aWNhIj5BbGwgScKgY2FuwqBkZXRlcm1pbmUgaXMgdGhhdCBJ
IGdldCBhICZxdW90O2J1ZmZlcl9zaXplOiA0MDk2IHdpdGggb2Zmc2V0OiA0NiBhcmUgaW5zdWZm
aWNpZW50IGZvciBvYmplY3Qgb2Ygc2l6ZSA1MTkxOSZxdW90OyBlcnJvciBpZiBJIGRvbiYjMzk7
dCBoYXZlIGl0LiBUaGUgb2JqZWN0IHNpemUgcmVwb3J0ZWQgdmFyaWVzIGRlcGVuZGluZyBvbiBk
YXRhIHRoYXQgSSBwYXNzIGluLiBUaGUgYW1vdW50IG9mIGRhdGEgaXMgYWx3YXlzIDMyIHJhbmRv
bSBieXRlcyBpbiBteSB0ZXN0cywgYnV0IHJhbmRvbWx5IGdlbmVyYXRlZC4gVGhlIG9iamVjdCBz
aXplIHNlZW1zIGZhciB0b28gbGFyZ2UsIHdoaWNoIGxlYWRzIG1lIHRvIGJlbGlldmUgdGhhdCBz
b21ldGhpbmcgaXMgcmVhZGluZyBwYXN0IHRoZSBlbmQgb2YgdGhlIGZpbGUsIGFsdGhvdWdoIEkg
ZGlkbiYjMzk7dCBzZWUgYW55IG9idmlvdXMgaXNzdWVzIGluIHRoZSBjb2RlIHRoYXQgcmVhZHMg
dGhlIGZpbGVzLjx1PjwvdT48dT48L3U+PC9mb250Pjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdp
bi1yaWdodDowY207bWFyZ2luLWJvdHRvbToxMnB0O21hcmdpbi1sZWZ0OjBjbTtiYWNrZ3JvdW5k
LWNvbG9yOndoaXRlO2JveC1zaXppbmc6Ym9yZGVyLWJveDtmb250LXZhcmlhbnQtbGlnYXR1cmVz
Om5vcm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOnJnYigzNiw0MSw0Nik7Zm9udC1zdHlsZTpub3Jt
YWwiPjxmb250IGZhY2U9IkhlbHZldGljYSI+SXQgc2VlbXMgbGlrZSBtb3JlIGV4cGxhbmF0aW9u
IGlzIG5lZWRlZCBvbiB0aGUgbWFuIHBhZ2UgYWJvdXQgdGhlIHJlcXVpcmVkIGZvcm1hdCBvZiB0
aGlzIGZpbGUsIGFzIHRoZSBkZXNjcmlwdGlvbiBnaXZlbiBkb2VzbiYjMzk7dCBsZWFkIHRvIHRo
ZSBzdWNjZXNzZnVsIGNyZWF0aW9uIG9mIGEgcHJpbWFyeSBrZXkgdW5sZXNzIHlvdSB1bmRlcnN0
YW5kIHRoYXQgeW91IGFyZSBzdXBwb3NlZCB0byBhZGQgdGhhdCB0byB0aGUgZnJvbnQgb2YgdGhl
IGZpbGUgcmF0aGVyIHRoYW4gaXQganVzdCBiZWluZyBhbiBleGFtcGxlLjwvZm9udD48L3NwYW4+
PC9wPjxwIHN0eWxlPSJtYXJnaW4tYm90dG9tOjEycHQ7YmFja2dyb3VuZC1jb2xvcjp3aGl0ZSI+
PGZvbnQgZmFjZT0iSGVsdmV0aWNhIj48c3BhbiBzdHlsZT0iZm9udC1zdHlsZTpub3JtYWwiPlRo
YW5rcyw8L3NwYW4+PC9mb250PjwvcD48Zm9udCBmYWNlPSJIZWx2ZXRpY2EiPjxzcGFuIHN0eWxl
PSJmb250LXN0eWxlOm5vcm1hbCI+Um93YW48L3NwYW4+PC9mb250PjwvZGl2PjwvZGl2PjwvZGl2
Pl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgp0cG0y
IG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdl
dD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KVG8g
dW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnRwbTItbGVhdmVA
bGlzdHMuMDEub3JnPC9hPjxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8l
KF9pbnRlcm5hbF9uYW1lKXM8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============7895152335591240146==--

