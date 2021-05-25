Content-Type: multipart/mixed; boundary="===============4251452794802216542=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: tpm2-tools, tpm2-pkcs11, and OpenSSL 3.0
Date: Tue, 25 May 2021 12:18:26 +0200
Message-ID: <20210525121826.59350073@centrum.cz>
In-Reply-To: SN6PR11MB3437381D3FE7A9F0E5940DD9B8269@sn6pr11mb3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4251452794802216542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I spent some time with OpenSSL 3.0 so I could help.
=C2=A0
In generall, all EC_KEY and RSA_KEY functions are deprecated for public use=
 as this is a low-level API. There is no easy fix though-- the low-level fu=
nctions need to be replaced by the high-level EVP API and there is no simpl=
e 1:1 mapping. The affected functions need to be rewritten almost completel=
y, but in case of tpm2-tools and tpm2-pkcs11 the impact is not so high.
=C2=A0
The good thing is that the EVP API is not(!) new. It has been there since O=
penSSL 1.1.0, so one could write an implementation that works with both Ope=
nSSL 1.1.x and OpenSSL 3.0. In fact, the OpenSSL 3.0 aims to have a very li=
mited impact on "well-behaved" applications that refrain from using the (no=
w deprecated) low-level APIs. An app that uses the EVP API from 1.1.x shall=
 work with the 3.0 too.
=C2=A0
=C2=A0
The crucial question is: is it acceptable to require the OpenSSL 1.1.1 as t=
he minimum version for tpm2-tools and tpm2-pkcs11?
=C2=A0
The OpenSSL release strategy indicates the OpenSSL 1.1.1 is now the _only_ =
supported version! The 1.0.2 is no longer supported and also the 1.1.0 is n=
o longer supported.
https://www.openssl.org/policies/releasestrat.html
=C2=A0
Maintaining the support for the EOL OpenSSL (prior 1.1.1) would make the su=
pport for OpenSSL 3.0 more complicated, harder to review and maintain.
Even the tpm2-tools RELEASE.md says that "supporting an EOL crypto library =
is not a good idea".
https://github.com/tpm2-software/tpm2-tools/blob/master/doc/RELEASE.md#open=
ssl
=C2=A0
=C2=A0
So, my recommendation would be to set OpenSSL 1.1.1 as the minimum version =
and then simply rewrite the affected functions using the EVP API from 1.1.1=
, which works also in 3.0. What do you think?
=C2=A0
=C2=A0
Regards,
Petr
=C2=A0
______________________________________________________________
> Od: "Roberts, William C" <william.c.roberts(a)intel.com>
> Komu: "Jerry Snitselaar" <jsnitsel(a)redhat.com>, "tpm2(a)lists.01.org" <=
tpm2(a)lists.01.org>
> Datum: 25.05.2021 01:41
> P=C5=99edm=C4=9Bt: [tpm2] Re: tpm2-tools, tpm2-pkcs11, and OpenSSL 3.0
>
I can look at compiling with OpenSSL 3.0, I haven't even tried yet. But I w=
ould imagineit's all fixable. I don't see anything in the do_sig_verify tha=
t requires a non-const key. I would imagineit's just as simple as updating =
the call sites to match the signatures.I filed bugs:=C2=A0 -=C2=A0https://g=
ithub.com/tpm2-software/tpm2-pkcs11/issues/686 <https://github.com/tpm2-sof=
tware/tpm2-pkcs11/issues/686>=C2=A0 -=C2=A0https://github.com/tpm2-software=
/tpm2-tools/issues/2737 <https://github.com/tpm2-software/tpm2-tools/issues=
/2737>We'll try to get to these soon, as I would imagine distros are eager =
to start the process of transitioning over.BillFrom: Jerry Snitselaar <jsni=
tsel(a)redhat.com>
 Sent: Monday, May 24, 2021 4:34 PM
 To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
 Subject: [tpm2] tpm2-tools, tpm2-pkcs11, and OpenSSL 3.0=C2=A0
 Both tpm2-tools and tpm2-pkcs11 make use of some functions that are
 being deprecated in openssl 3.0. Are there plans to move away from using
 those deprecated functions? Currently tpm2-tools will build with
 -Wno-error=3Ddeprecated-declarations, but tpm2-pkcs11 trips over
 EVP_PKEY_get0_EC_KEY now returning a const EC_KEY *, and ECDSA_do_verify
 taking a non const parameter. Someone suggested doing something like:
 =

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EVP_PKEY_CTX=C2=A0=C2=A0=C2=A0 *pctx =
=3D NULL;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((pctx =3D EVP_PKEY_CTX_new(pkey, =
NULL)) =3D=3D NULL) {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto fail;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
 =

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (EVP_PKEY_verify_init(pctx) !=3D 1=
 ||
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EVP_PKEY_veri=
fy(pctx, sigbuf, siglen,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dgstbuf, dgst=
len) !=3D 1) {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto fail;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
 =C2=A0fail:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EVP_PKEY_CTX_free(pctx);
 =

 =

 but I imagine the ASN.1 framing stuff mentioned in do_sig_verify_ec()
 would still be an issue, yes? I don't know openssl, so I don't know
 if you could get away with casting the pointer to EC_KEY *.
 =

 There is work going on to support openssl 3.0 in RHEL9, so this came up.
 =

 Regards,
 Jerry
 _______________________________________________
 tpm2 mailing list -- tpm2(a)lists.01.org
 To unsubscribe send an email to tpm2-leave(a)lists.01.org
 %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
 =

 ----------
 =

 _______________________________________________
 tpm2 mailing list -- tpm2(a)lists.01.org
 To unsubscribe send an email to tpm2-leave(a)lists.01.org
 %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============4251452794802216542==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5JIHNwZW50IHNvbWUg
dGltZSB3aXRoIE9wZW5TU0wgMy4wIHNvIEkgY291bGQgaGVscC48L3A+Cgo8cCBzdHlsZT0icGFk
ZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNwOzwvcD4KCjxwIHN0eWxlPSJwYWRk
aW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+SW4gZ2VuZXJhbGwsIGFsbCBFQ19LRVkgYW5k
IFJTQV9LRVkgZnVuY3Rpb25zIGFyZSBkZXByZWNhdGVkIGZvciBwdWJsaWMgdXNlIGFzIHRoaXMg
aXMgYSBsb3ctbGV2ZWwgQVBJLiBUaGVyZSBpcyBubyBlYXN5IGZpeCB0aG91Z2gtLSB0aGUgbG93
LWxldmVsIGZ1bmN0aW9ucyBuZWVkIHRvIGJlIHJlcGxhY2VkIGJ5IHRoZSBoaWdoLWxldmVsIEVW
UCBBUEkgYW5kIHRoZXJlIGlzIG5vIHNpbXBsZSAxOjEgbWFwcGluZy4gVGhlIGFmZmVjdGVkIGZ1
bmN0aW9ucyBuZWVkIHRvIGJlIHJld3JpdHRlbiBhbG1vc3QgY29tcGxldGVseSwgYnV0IGluIGNh
c2Ugb2YgdHBtMi10b29scyBhbmQgdHBtMi1wa2NzMTEgdGhlIGltcGFjdCBpcyBub3Qgc28gaGln
aC48L3A+Cgo8cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNw
OzwvcD4KCjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+VGhlIGdv
b2QgdGhpbmcgaXMgdGhhdCB0aGUgRVZQIEFQSSBpcyBub3QoISkgbmV3LiBJdCBoYXMgYmVlbiB0
aGVyZSBzaW5jZSBPcGVuU1NMIDEuMS4wLCBzbyBvbmUgY291bGQgd3JpdGUgYW4gaW1wbGVtZW50
YXRpb24gdGhhdCB3b3JrcyB3aXRoIGJvdGggT3BlblNTTCAxLjEueCBhbmQgT3BlblNTTCAzLjAu
IEluIGZhY3QsIHRoZSBPcGVuU1NMIDMuMCBhaW1zIHRvIGhhdmUgYSB2ZXJ5IGxpbWl0ZWQgaW1w
YWN0IG9uICJ3ZWxsLWJlaGF2ZWQiIGFwcGxpY2F0aW9ucyB0aGF0IHJlZnJhaW4gZnJvbSB1c2lu
ZyB0aGUgKG5vdyBkZXByZWNhdGVkKSBsb3ctbGV2ZWwgQVBJcy4gQW4gYXBwIHRoYXQgdXNlcyB0
aGUgRVZQIEFQSSBmcm9tIDEuMS54IHNoYWxsIHdvcmsgd2l0aCB0aGUgMy4wIHRvby48L3A+Cgo8
cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNwOzwvcD4KCjxw
IHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+Jm5ic3A7PC9wPgoKPHAg
c3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5UaGUgY3J1Y2lhbCBxdWVz
dGlvbiBpczogaXMgaXQgYWNjZXB0YWJsZSB0byByZXF1aXJlIHRoZSBPcGVuU1NMIDEuMS4xIGFz
IHRoZSBtaW5pbXVtIHZlcnNpb24gZm9yIHRwbTItdG9vbHMgYW5kIHRwbTItcGtjczExPzwvcD4K
CjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+Jm5ic3A7PC9wPgoK
PHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5UaGUgT3BlblNTTCBy
ZWxlYXNlIHN0cmF0ZWd5IGluZGljYXRlcyB0aGUgT3BlblNTTCAxLjEuMSBpcyBub3cgdGhlIF9v
bmx5XyBzdXBwb3J0ZWQgdmVyc2lvbiEgVGhlIDEuMC4yIGlzIG5vIGxvbmdlciBzdXBwb3J0ZWQg
YW5kIGFsc28gdGhlIDEuMS4wIGlzIG5vIGxvbmdlciBzdXBwb3J0ZWQuPC9wPgoKPHAgc3R5bGU9
InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5odHRwczovL3d3dy5vcGVuc3NsLm9y
Zy9wb2xpY2llcy9yZWxlYXNlc3RyYXQuaHRtbDwvcD4KCjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAw
IDA7IG1hcmdpbjowIDAgMCAwOyI+Jm5ic3A7PC9wPgoKPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAg
MDsgbWFyZ2luOjAgMCAwIDA7Ij5NYWludGFpbmluZyB0aGUgc3VwcG9ydCBmb3IgdGhlIEVPTCBP
cGVuU1NMIChwcmlvciAxLjEuMSkgd291bGQgbWFrZSB0aGUgc3VwcG9ydCBmb3IgT3BlblNTTCAz
LjAgbW9yZSBjb21wbGljYXRlZCwgaGFyZGVyIHRvIHJldmlldyBhbmQgbWFpbnRhaW4uPC9wPgoK
PHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5FdmVuIHRoZSB0cG0y
LXRvb2xzIFJFTEVBU0UubWQgc2F5cyB0aGF0ICJzdXBwb3J0aW5nIGFuIEVPTCBjcnlwdG8gbGli
cmFyeSBpcyBub3QgYSBnb29kIGlkZWEiLjwvcD4KCjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7
IG1hcmdpbjowIDAgMCAwOyI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10
b29scy9ibG9iL21hc3Rlci9kb2MvUkVMRUFTRS5tZCNvcGVuc3NsPC9wPgoKPHAgc3R5bGU9InBh
ZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij4mbmJzcDs8L3A+Cgo8cCBzdHlsZT0icGFk
ZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNwOzwvcD4KCjxwIHN0eWxlPSJwYWRk
aW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+U28sIG15IHJlY29tbWVuZGF0aW9uIHdvdWxk
IGJlIHRvIHNldCBPcGVuU1NMIDEuMS4xIGFzIHRoZSBtaW5pbXVtIHZlcnNpb24gYW5kIHRoZW4g
c2ltcGx5IHJld3JpdGUgdGhlIGFmZmVjdGVkIGZ1bmN0aW9ucyB1c2luZyB0aGUgRVZQIEFQSSBm
cm9tIDEuMS4xLCB3aGljaCB3b3JrcyBhbHNvIGluIDMuMC4gV2hhdCBkbyB5b3UgdGhpbms/PC9w
PgoKPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij4mbmJzcDs8L3A+
Cgo8cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNwOzwvcD4K
CjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+UmVnYXJkcyw8L3A+
Cgo8cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPlBldHI8L3A+Cgo8
cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNwOzwvcD4KCjxw
IHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+X19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnIgLz4KJmd0
OyBPZDogIlJvYmVydHMsIFdpbGxpYW0gQyIgJmx0O3dpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNv
bSZndDs8YnIgLz4KJmd0OyBLb211OiAiSmVycnkgU25pdHNlbGFhciIgJmx0O2pzbml0c2VsQHJl
ZGhhdC5jb20mZ3Q7LCAidHBtMkBsaXN0cy4wMS5vcmciICZsdDt0cG0yQGxpc3RzLjAxLm9yZyZn
dDs8YnIgLz4KJmd0OyBEYXR1bTogMjUuMDUuMjAyMSAwMTo0MTxiciAvPgomZ3Q7IFDFmWVkbcSb
dDogW3RwbTJdIFJlOiB0cG0yLXRvb2xzLCB0cG0yLXBrY3MxMSwgYW5kIE9wZW5TU0wgMy4wPGJy
IC8+CiZndDs8L3A+Cgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhl
bHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogIzAwMDAwMDsiPkkg
Y2FuIGxvb2sgYXQgY29tcGlsaW5nIHdpdGggT3BlblNTTCAzLjAsIEkgaGF2ZW4ndCBldmVuIHRy
aWVkIHlldC4gQnV0IEkgd291bGQgaW1hZ2luZTwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWls
eTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0
OyBjb2xvcjogIzAwMDAwMDsiPml0J3MgYWxsIGZpeGFibGUuIEkgZG9uJ3Qgc2VlIGFueXRoaW5n
IGluIHRoZSBkb19zaWdfdmVyaWZ5IHRoYXQgcmVxdWlyZXMgYSBub24tY29uc3Qga2V5LiBJIHdv
dWxkIGltYWdpbmU8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFs
LCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6ICMwMDAwMDA7
Ij5pdCdzIGp1c3QgYXMgc2ltcGxlIGFzIHVwZGF0aW5nIHRoZSBjYWxsIHNpdGVzIHRvIG1hdGNo
IHRoZSBzaWduYXR1cmVzLjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwg
QXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogIzAw
MDAwMDsiPkkgZmlsZWQgYnVnczo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGli
cmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6
ICMwMDAwMDA7Ij4mbmJzcDsgLSZuYnNwOzxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0y
LXNvZnR3YXJlL3RwbTItcGtjczExL2lzc3Vlcy82ODYiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0y
LXNvZnR3YXJlL3RwbTItcGtjczExL2lzc3Vlcy82ODY8L2E+PC9kaXY+CjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDEycHQ7IGNvbG9yOiAjMDAwMDAwOyI+Jm5ic3A7IC0mbmJzcDs8YSBocmVmPSJodHRwczov
L2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2lzc3Vlcy8yNzM3Ij5odHRwczov
L2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2lzc3Vlcy8yNzM3PC9hPjwvZGl2
Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogIzAwMDAwMDsiPldlJ2xsIHRyeSB0byBn
ZXQgdG8gdGhlc2Ugc29vbiwgYXMgSSB3b3VsZCBpbWFnaW5lIGRpc3Ryb3MgYXJlIGVhZ2VyIHRv
IHN0YXJ0IHRoZSBwcm9jZXNzIG9mIHRyYW5zaXRpb25pbmcgb3Zlci48L2Rpdj4KPGRpdiBzdHls
ZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZv
bnQtc2l6ZTogMTJwdDsgY29sb3I6ICMwMDAwMDA7Ij5CaWxsPC9kaXY+CjxociAvPgo8ZGl2IGRp
cj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBjb2xvcj0iIzAwMDAwMCIg
c3R5bGU9ImZvbnQtc2l6ZTogMTFwdDsiPjxzdHJvbmc+RnJvbTo8L3N0cm9uZz4gSmVycnkgU25p
dHNlbGFhciAmbHQ7anNuaXRzZWxAcmVkaGF0LmNvbSZndDs8YnIgLz4KIDxzdHJvbmc+U2VudDo8
L3N0cm9uZz4gTW9uZGF5LCBNYXkgMjQsIDIwMjEgNDozNCBQTTxiciAvPgogPHN0cm9uZz5Ubzo8
L3N0cm9uZz4gdHBtMkBsaXN0cy4wMS5vcmcgJmx0O3RwbTJAbGlzdHMuMDEub3JnJmd0OzxiciAv
PgogPHN0cm9uZz5TdWJqZWN0Ojwvc3Ryb25nPiBbdHBtMl0gdHBtMi10b29scywgdHBtMi1wa2Nz
MTEsIGFuZCBPcGVuU1NMIDMuMDwvZm9udD4KPGRpdj4mbmJzcDs8L2Rpdj4KPC9kaXY+CjxkaXYg
Y2xhc3M9IkJvZHlGcmFnbWVudCI+CjxkaXYgY2xhc3M9IlBsYWluVGV4dCI+PGJyIC8+CiBCb3Ro
IHRwbTItdG9vbHMgYW5kIHRwbTItcGtjczExIG1ha2UgdXNlIG9mIHNvbWUgZnVuY3Rpb25zIHRo
YXQgYXJlPGJyIC8+CiBiZWluZyBkZXByZWNhdGVkIGluIG9wZW5zc2wgMy4wLiBBcmUgdGhlcmUg
cGxhbnMgdG8gbW92ZSBhd2F5IGZyb20gdXNpbmc8YnIgLz4KIHRob3NlIGRlcHJlY2F0ZWQgZnVu
Y3Rpb25zPyBDdXJyZW50bHkgdHBtMi10b29scyB3aWxsIGJ1aWxkIHdpdGg8YnIgLz4KIC1Xbm8t
ZXJyb3I9ZGVwcmVjYXRlZC1kZWNsYXJhdGlvbnMsIGJ1dCB0cG0yLXBrY3MxMSB0cmlwcyBvdmVy
PGJyIC8+CiBFVlBfUEtFWV9nZXQwX0VDX0tFWSBub3cgcmV0dXJuaW5nIGEgY29uc3QgRUNfS0VZ
ICosIGFuZCBFQ0RTQV9kb192ZXJpZnk8YnIgLz4KIHRha2luZyBhIG5vbiBjb25zdCBwYXJhbWV0
ZXIuIFNvbWVvbmUgc3VnZ2VzdGVkIGRvaW5nIHNvbWV0aGluZyBsaWtlOjxiciAvPgogPGJyIC8+
CiAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgRVZQX1BLRVlfQ1RYJm5ic3A7
Jm5ic3A7Jm5ic3A7ICpwY3R4ID0gTlVMTDs8YnIgLz4KICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyBpZiAoKHBjdHggPSBFVlBfUEtFWV9DVFhfbmV3KHBrZXksIE5VTEwpKSA9
PSBOVUxMKSB7PGJyIC8+CiAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgZ290byBmYWlsOzxi
ciAvPgogJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnIgLz4KIDxiciAv
PgogJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChFVlBfUEtFWV92ZXJp
ZnlfaW5pdChwY3R4KSAhPSAxIHx8PGJyIC8+CiAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgRVZQX1BLRVlfdmVyaWZ5KHBjdHgsIHNp
Z2J1Ziwgc2lnbGVuLDxiciAvPgogJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGRnc3RidWYsIGRnc3RsZW4pICE9IDEpIHs8YnIgLz4K
ICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBnb3RvIGZhaWw7PGJyIC8+CiAmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgfTxiciAvPgogJm5ic3A7ZmFpbDo8YnIgLz4KICZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBFVlBfUEtFWV9DVFhfZnJlZShwY3R4
KTs8YnIgLz4KIDxiciAvPgogPGJyIC8+CiBidXQgSSBpbWFnaW5lIHRoZSBBU04uMSBmcmFtaW5n
IHN0dWZmIG1lbnRpb25lZCBpbiBkb19zaWdfdmVyaWZ5X2VjKCk8YnIgLz4KIHdvdWxkIHN0aWxs
IGJlIGFuIGlzc3VlLCB5ZXM/IEkgZG9uJ3Qga25vdyBvcGVuc3NsLCBzbyBJIGRvbid0IGtub3c8
YnIgLz4KIGlmIHlvdSBjb3VsZCBnZXQgYXdheSB3aXRoIGNhc3RpbmcgdGhlIHBvaW50ZXIgdG8g
RUNfS0VZICouPGJyIC8+CiA8YnIgLz4KIFRoZXJlIGlzIHdvcmsgZ29pbmcgb24gdG8gc3VwcG9y
dCBvcGVuc3NsIDMuMCBpbiBSSEVMOSwgc28gdGhpcyBjYW1lIHVwLjxiciAvPgogPGJyIC8+CiBS
ZWdhcmRzLDxiciAvPgogSmVycnk8YnIgLz4KIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fPGJyIC8+CiB0cG0yIG1haWxpbmcgbGlzdCAtLSB0cG0yQGxpc3Rz
LjAxLm9yZzxiciAvPgogVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byB0cG0yLWxlYXZl
QGxpc3RzLjAxLm9yZzxiciAvPgogJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8l
KF9pbnRlcm5hbF9uYW1lKXM8L2Rpdj4KPC9kaXY+CjxiciAvPgogPGJyIC8+CiAtLS0tLS0tLS0t
PGJyIC8+CiA8YnIgLz4KIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fPGJyIC8+CiB0cG0yIG1haWxpbmcgbGlzdCAtLSB0cG0yQGxpc3RzLjAxLm9yZzxiciAv
PgogVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byB0cG0yLWxlYXZlQGxpc3RzLjAxLm9y
ZzxiciAvPgogJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9u
YW1lKXMK

--===============4251452794802216542==--

