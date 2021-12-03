Content-Type: multipart/mixed; boundary="===============8315731152872371282=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: "tpm2_import" Integrity Check issue on a Big Endian 32 Bit
 Platform
Date: Fri, 03 Dec 2021 21:21:23 +0000
Message-ID: <SN6PR11MB3437D87EA504B82549DAB241B86A9@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: CADu5HqwHtao46dmH0xuZn_15mtS1LtLa=4HiFcXaVPTQYHo=_g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8315731152872371282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So these are different?
tpm2-tools 5.2
tpm2-tools 5.2 2021-09-28

I'm confused because tpm2-tools 5.2 release was conducted on 2021-09-28. It=
 would be better to reference the tag or sha hash over the date.

The best way to get the version is from the tool itself. It's built into th=
e binary using the source control version during the build.

tpm2 --version
tool=3D"tpm2" version=3D"5.2" tctis=3D"libtss2-tctildr" tcti-default=3Dtcti=
-abrmd

Could you provide us with the output of this for the "5.2 2021-09-28" versi=
on?

As Andreas showed, you could then bisect between those two while we try to =
reproduce. If you could point us to the bad patch, that would
help speed this up.

Thanks again!

________________________________
From: Rajkumar K Sivasamy <rajkumar.k.sivasamy(a)gmail.com>
Sent: Thursday, December 2, 2021 11:02 PM
To: Roberts, William C <william.c.roberts(a)intel.com>
Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>; Desai, Imran <imran.desai(a)=
intel.com>
Subject: Re: [tpm2] "tpm2_import" Integrity Check issue on a Big Endian 32 =
Bit Platform

-   tpm2-tss 3.1.0 and Tpm2-tools 5.2 2021-09-2 8=3D=3D> tpm2_import fails =
with error 0x3DF
-   tpm2-tss 3.0.4 and Tpm2-tools 5.2 2021-09-28 =3D=3D> tpm2_import fails =
with error 0x3DF
-   tpm2-tss 3.0.4 and Tpm2-tools 5.2 =3D=3D> tpm2_import succeeds

Why are you putting dates on some of the tpm2-tools versions but not tpm2-t=
ss?
[Raj] TPM2 Tools Master has this date code "2021-09-28" at "https://github.=
com/tpm2-software/tpm2-tools" for the version, hence I have used it to indi=
cate the source code version of tpm2-tools which I downloaded from https://=
github.com/tpm2-software/tpm2-tools

tpm2-tools 5.2 source was downloaded from link: https://github.com/tpm2-sof=
tware/tpm2-tools/releases/download/5.2/tpm2-tools-5.2.tar.gz
tpm2-tss 3.1.0 was downloaded from https://github.com/tpm2-software/tpm2-tss
tpm2-tss 3.0.4 was downloaded from https://github.com/tpm2-software/tpm2-ts=
s/releases/download/3.0.4/tpm2-tss-3.0.4.tar.gz

Let me know if you would need any further information.

Regards
Raj

On Fri, Dec 3, 2021 at 3:55 AM Roberts, William C <william.c.roberts(a)inte=
l.com<mailto:william.c.roberts(a)intel.com>> wrote:
> From: Rajkumar K Sivasamy <rajkumar.k.sivasamy(a)gmail.com<mailto:rajkuma=
r.k.sivasamy(a)gmail.com>>
> Sent: Thursday, December 2, 2021 2:41 PM
> To: Roberts, William C <william.c.roberts(a)intel.com<mailto:william.c.ro=
berts(a)intel.com>>
> Cc: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org> <tpm2(a)lists.01.org<=
mailto:tpm2(a)lists.01.org>>; Desai, Imran <imran.desai(a)intel.com<mailto:=
imran.desai(a)intel.com>>
> Subject: Re: [tpm2] "tpm2_import" Integrity Check issue on a Big Endian 3=
2 Bit Platform

> Hello William

> I am using below versions:
> tpm2-tss 3.1.0
> tpm2-tools 5.2 2021-09-28

> To further narrow down, I replaced tpm2-tss 3.1.0 with tpm2-tss 3.0.4 and=
 tpm2_import still failed with 0x3DF.

> Now along with tpm2-tss- 3.0.4 I used tpm2-tools 5.2 and tpm2_import succ=
eeds; seems to be a problem with tpm2-tools t.2 2021-09-28.

I'm confused. I read both these lines as I used tpm2-tss 3.0.4 and tpm2-too=
ls 5.2 and it succeeds and fails. Why are you putting dates on some of
the tpm2-tools versions but not tpm2-tss?


> Regards
> Raj

>  On Thu, Dec 2, 2021 at 8:44 PM Roberts, William C <william.c.roberts(a)i=
ntel.com<mailto:william.c.roberts(a)intel.com>> wrote:
> + Imran

> What version of tools and tss are you running?

> I just noticed that the tools CI doesn't have the multi-arch images enabl=
ed. Let me investigate adding this and see if I can reproduce.

> From: Rajkumar K Sivasamy <rajkumar.k.sivasamy(a)gmail.com<mailto:rajkuma=
r.k.sivasamy(a)gmail.com>>
> Sent: Wednesday, December 1, 2021 11:40 PM
> To: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org> <tpm2(a)lists.01.org<=
mailto:tpm2(a)lists.01.org>>
> Subject: [tpm2] "tpm2_import" Integrity Check issue on a Big Endian 32 Bi=
t Platform

> Hello Team

> I am trying to use tpm2_import on a Big Endian 32 Bit platform and runnin=
g into following error:

> -------------------------------------------------------------------------=
-------------------------------------------------------

> Command:
> openssl genrsa -out private.pem 2048
> tpm2_import -C 0x81000001 -G rsa -i private.pem -u key.pub -r key.priv

> Error:
> ERROR:esys:src/tss2-esys/api/Esys_Import.c:110:Esys_Import() Esys Finish =
ErrorCode (0x000003df)
> ERROR: Esys_HMAC(0x3DF) - tpm:parameter(3):integrity check failed
> ERROR: Unable to run tpm2_import
> -------------------------------------------------------------------------=
-------------------------------------------------------

> Need pointers to debug this issue.
> Have any of you come across this error with tpm2_import on Big Endian 32 =
Bit Platform? Do we have a fix Or can you provide inputs on the source wher=
e I can look > at for further debugging?

> Thanks
> Raj

--===============8315731152872371282==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KU28gdGhlc2UgYXJlIGRpZmZlcmVudD88L2Rpdj4KPGRpdiBzdHls
ZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZv
bnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgp0cG0yLXRvb2xzIDUuMjwvZGl2
Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+CnRwbTItdG9v
bHMgNS4yIDIwMjEtMDktMjg8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmks
IEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJn
YigwLCAwLCAwKTsiPgo8YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJy
aSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjog
cmdiKDAsIDAsIDApOyI+CkknbSBjb25mdXNlZCBiZWNhdXNlIHRwbTItdG9vbHMgNS4yIHJlbGVh
c2Ugd2FzIGNvbmR1Y3RlZCBvbiAyMDIxLTA5LTI4LiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gcmVm
ZXJlbmNlIHRoZSB0YWcgb3Igc2hhIGhhc2ggb3ZlciB0aGUgZGF0ZS48L2Rpdj4KPGRpdiBzdHls
ZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZv
bnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgo8YnI+CjwvZGl2Pgo8ZGl2IHN0
eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsg
Zm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+ClRoZSBiZXN0IHdheSB0byBn
ZXQgdGhlIHZlcnNpb24gaXMgZnJvbSB0aGUgdG9vbCBpdHNlbGYuIEl0J3MgYnVpbHQgaW50byB0
aGUgYmluYXJ5IHVzaW5nIHRoZSBzb3VyY2UgY29udHJvbCB2ZXJzaW9uIGR1cmluZyB0aGUgYnVp
bGQuPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0
aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4K
PGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2
ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsi
Pgo8c3BhbiBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IENhbGlicmks
IEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsiPnRwbTIgLS12
ZXJzaW9uPC9zcGFuPjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJp
LCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij4KdG9vbD0mcXVvdDt0cG0yJnF1b3Q7IHZlcnNpb249JnF1b3Q7NS4yJnF1
b3Q7IHRjdGlzPSZxdW90O2xpYnRzczItdGN0aWxkciZxdW90OyB0Y3RpLWRlZmF1bHQ9dGN0aS1h
YnJtZDxicj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwg
SGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwg
MCk7Ij4KPGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFs
LCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAw
LCAwKTsiPgpDb3VsZCB5b3UgcHJvdmlkZSB1cyB3aXRoIHRoZSBvdXRwdXQgb2YgdGhpcyBmb3Ig
dGhlICZxdW90OzxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNTUsIDI1NSwgMjU1
KTtkaXNwbGF5OmlubGluZSAhaW1wb3J0YW50Ij41LjIgMjAyMS0wOS0yOCZxdW90OyB2ZXJzaW9u
Pzwvc3Bhbj48L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBI
ZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAw
KTsiPgo8c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LCAyNTUsIDI1NSk7ZGlz
cGxheTppbmxpbmUgIWltcG9ydGFudCI+PGJyPgo8L3NwYW4+PC9kaXY+CjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KPHNwYW4gc3R5bGU9ImJhY2tncm91bmQt
Y29sb3I6cmdiKDI1NSwgMjU1LCAyNTUpO2Rpc3BsYXk6aW5saW5lICFpbXBvcnRhbnQiPkFzIEFu
ZHJlYXMgc2hvd2VkLCB5b3UgY291bGQgdGhlbiBiaXNlY3QgYmV0d2VlbiB0aG9zZSB0d28gd2hp
bGUgd2UgdHJ5IHRvIHJlcHJvZHVjZS4gSWYgeW91IGNvdWxkIHBvaW50IHVzIHRvIHRoZSBiYWQg
cGF0Y2gsIHRoYXQgd291bGQ8L3NwYW4+PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBD
YWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij4KPHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6cmdiKDI1
NSwgMjU1LCAyNTUpO2Rpc3BsYXk6aW5saW5lICFpbXBvcnRhbnQiPmhlbHAgc3BlZWQgdGhpcyB1
cC48L3NwYW4+PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwg
SGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwg
MCk7Ij4KPHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6cmdiKDI1NSwgMjU1LCAyNTUpO2Rp
c3BsYXk6aW5saW5lICFpbXBvcnRhbnQiPjxicj4KPC9zcGFuPjwvZGl2Pgo8ZGl2IHN0eWxlPSJm
b250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1z
aXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+CjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5k
LWNvbG9yOnJnYigyNTUsIDI1NSwgMjU1KTtkaXNwbGF5OmlubGluZSAhaW1wb3J0YW50Ij5UaGFu
a3MgYWdhaW4hPC9zcGFuPjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwg
QXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdi
KDAsIDAsIDApOyI+Cjxicj4KPC9kaXY+CjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9kaXY+Cjxo
ciBzdHlsZT0iZGlzcGxheTppbmxpbmUtYmxvY2s7d2lkdGg6OTglIiB0YWJpbmRleD0iLTEiPgo8
ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0iQ2FsaWJyaSwgc2Fu
cy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8
L2I+IFJhamt1bWFyIEsgU2l2YXNhbXkgJmx0O3Jhamt1bWFyLmsuc2l2YXNhbXlAZ21haWwuY29t
Jmd0Ozxicj4KPGI+U2VudDo8L2I+IFRodXJzZGF5LCBEZWNlbWJlciAyLCAyMDIxIDExOjAyIFBN
PGJyPgo8Yj5Ubzo8L2I+IFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7d2lsbGlhbS5jLnJvYmVydHNA
aW50ZWwuY29tJmd0Ozxicj4KPGI+Q2M6PC9iPiB0cG0yQGxpc3RzLjAxLm9yZyAmbHQ7dHBtMkBs
aXN0cy4wMS5vcmcmZ3Q7OyBEZXNhaSwgSW1yYW4gJmx0O2ltcmFuLmRlc2FpQGludGVsLmNvbSZn
dDs8YnI+CjxiPlN1YmplY3Q6PC9iPiBSZTogW3RwbTJdICZxdW90O3RwbTJfaW1wb3J0JnF1b3Q7
IEludGVncml0eSBDaGVjayBpc3N1ZSBvbiBhIEJpZyBFbmRpYW4gMzIgQml0IFBsYXRmb3JtPC9m
b250Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8L2Rpdj4KPGRpdj4KPGRpdiBkaXI9Imx0ciI+CjxkaXY+
LSAmbmJzcDsgPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyBmb250LWZhbWlseTomcXVvdDtD
YWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPnRwbTItdHNzIDMuMS4wPC9zcGFuPiBhbmQKPHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMXB0OyBmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNh
bnMtc2VyaWYiPlRwbTItdG9vbHMgNS4yIDIwMjEtMDktMiA4PC9zcGFuPj09Jmd0OyB0cG0yX2lt
cG9ydCBmYWlscyB3aXRoIGVycm9yIDB4M0RGPGJyPgo8L2Rpdj4KPGRpdj4tICZuYnNwOyB0cG0y
LXRzcyA8c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7IGZvbnQtZmFtaWx5OiZxdW90O0NhbGli
cmkmcXVvdDssc2Fucy1zZXJpZiI+CjMuMC40PC9zcGFuPiBhbmQgPHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMXB0OyBmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPlRw
bTItdG9vbHMgNS4yIDIwMjEtMDktMjgKPC9zcGFuPj09Jmd0OyB0cG0yX2ltcG9ydCBmYWlscyB3
aXRoIGVycm9yIDB4M0RGIDwvZGl2Pgo8ZGl2Pi0gJm5ic3A7IHRwbTItdHNzIDxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTFwdDsgZm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNl
cmlmIj4KMy4wLjQ8L3NwYW4+IGFuZCA8c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7IGZvbnQt
ZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+VHBtMi10b29scyA1LjIKPC9z
cGFuPj09Jmd0OyB0cG0yX2ltcG9ydCBzdWNjZWVkczwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+Cjxk
aXY+V2h5IGFyZSB5b3UgcHV0dGluZyBkYXRlcyBvbiBzb21lIG9mIHRoZSB0cG0yLXRvb2xzIHZl
cnNpb25zIGJ1dCBub3QgdHBtMi10c3M/PHNwYW4gY2xhc3M9InhfZ21haWwtaW0geF9nbWFpbC1I
T0VuWmIiPjxicj4KPC9zcGFuPjwvZGl2Pgo8ZGl2PltSYWpdIFRQTTIgVG9vbHMgTWFzdGVyIGhh
cyB0aGlzIGRhdGUgY29kZSAmcXVvdDsyMDIxLTA5LTI4JnF1b3Q7IGF0ICZxdW90OzxhIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMiPmh0dHBzOi8vZ2l0
aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHM8L2E+JnF1b3Q7IGZvciB0aGUgdmVyc2lv
biwgaGVuY2UgSSBoYXZlIHVzZWQgaXQgdG8gaW5kaWNhdGUgdGhlIHNvdXJjZSBjb2RlIHZlcnNp
b24gb2YgdHBtMi10b29scyB3aGljaAogSSBkb3dubG9hZGVkIGZyb20gPGEgaHJlZj0iaHR0cHM6
Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scyI+aHR0cHM6Ly9naXRodWIuY29t
L3RwbTItc29mdHdhcmUvdHBtMi10b29sczwvYT48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2
PnRwbTItdG9vbHMgNS4yIHNvdXJjZSB3YXMgZG93bmxvYWRlZCBmcm9tIGxpbms6IDxhIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvcmVsZWFzZXMvZG93
bmxvYWQvNS4yL3RwbTItdG9vbHMtNS4yLnRhci5neiI+Cmh0dHBzOi8vZ2l0aHViLmNvbS90cG0y
LXNvZnR3YXJlL3RwbTItdG9vbHMvcmVsZWFzZXMvZG93bmxvYWQvNS4yL3RwbTItdG9vbHMtNS4y
LnRhci5nejwvYT48L2Rpdj4KPGRpdj50cG0yLXRzcyAzLjEuMCB3YXMgZG93bmxvYWRlZCBmcm9t
IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzIj4KaHR0
cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3M8L2E+PC9kaXY+CjxkaXY+dHBt
Mi10c3MgMy4wLjQgd2FzIGRvd25sb2FkZWQgZnJvbSA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5j
b20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy9yZWxlYXNlcy9kb3dubG9hZC8zLjAuNC90cG0yLXRz
cy0zLjAuNC50YXIuZ3oiPgpodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRz
cy9yZWxlYXNlcy9kb3dubG9hZC8zLjAuNC90cG0yLXRzcy0zLjAuNC50YXIuZ3o8L2E+PC9kaXY+
CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5MZXQgbWUga25vdyBpZiB5b3Ugd291bGQgbmVlZCBhbnkg
ZnVydGhlciBpbmZvcm1hdGlvbi48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PlJlZ2FyZHM8
YnI+CjwvZGl2Pgo8ZGl2PlJhajxicj4KPC9kaXY+CjwvZGl2Pgo8YnI+CjxkaXYgY2xhc3M9Inhf
Z21haWxfcXVvdGUiPgo8ZGl2IGRpcj0ibHRyIiBjbGFzcz0ieF9nbWFpbF9hdHRyIj5PbiBGcmks
IERlYyAzLCAyMDIxIGF0IDM6NTUgQU0gUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJt
YWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+CjwvZGl2Pgo8YmxvY2txdW90ZSBjbGFzcz0ieF9nbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDsgYm9yZGVyLWxlZnQ6MXB4
IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7IHBhZGRpbmctbGVmdDoxZXgiPgomZ3Q7IEZyb206IFJh
amt1bWFyIEsgU2l2YXNhbXkgJmx0OzxhIGhyZWY9Im1haWx0bzpyYWprdW1hci5rLnNpdmFzYW15
QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhamt1bWFyLmsuc2l2YXNhbXlAZ21haWwuY29t
PC9hPiZndDs8YnI+CiZndDsgU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDIsIDIwMjEgMjo0MSBQ
TTxicj4KJmd0OyBUbzogUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2ls
bGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVy
dHNAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDsgQ2M6IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxp
c3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7PGEg
aHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0
cy4wMS5vcmc8L2E+Jmd0OzsgRGVzYWksIEltcmFuICZsdDs8YSBocmVmPSJtYWlsdG86aW1yYW4u
ZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9h
PiZndDs8YnI+CiZndDsgU3ViamVjdDogUmU6IFt0cG0yXSAmcXVvdDt0cG0yX2ltcG9ydCZxdW90
OyBJbnRlZ3JpdHkgQ2hlY2sgaXNzdWUgb24gYSBCaWcgRW5kaWFuIDMyIEJpdCBQbGF0Zm9ybQo8
YnI+CiZuYnNwOzxicj4KJmd0OyBIZWxsbyBXaWxsaWFtPGJyPgo8YnI+CiZndDsgSSBhbSB1c2lu
ZyBiZWxvdyB2ZXJzaW9uczo8YnI+CiZndDsgdHBtMi10c3MgMy4xLjA8YnI+CiZndDsgdHBtMi10
b29scyA1LjIgMjAyMS0wOS0yODxicj4KPGJyPgomZ3Q7IFRvIGZ1cnRoZXIgbmFycm93IGRvd24s
IEkgcmVwbGFjZWQgdHBtMi10c3MgMy4xLjAgd2l0aCB0cG0yLXRzcyAzLjAuNCBhbmQgdHBtMl9p
bXBvcnQgc3RpbGwgZmFpbGVkIHdpdGggMHgzREYuPGJyPgo8YnI+CiZndDsgTm93IGFsb25nIHdp
dGggdHBtMi10c3MtIDMuMC40IEkgdXNlZCB0cG0yLXRvb2xzIDUuMiBhbmQgdHBtMl9pbXBvcnQg
c3VjY2VlZHM7IHNlZW1zIHRvIGJlIGEgcHJvYmxlbSB3aXRoIHRwbTItdG9vbHMgdC4yIDIwMjEt
MDktMjguPGJyPgo8YnI+CkknbSBjb25mdXNlZC4gSSByZWFkIGJvdGggdGhlc2UgbGluZXMgYXMg
SSB1c2VkIHRwbTItdHNzIDMuMC40IGFuZCB0cG0yLXRvb2xzIDUuMiBhbmQgaXQgc3VjY2VlZHMg
YW5kIGZhaWxzLiBXaHkgYXJlIHlvdSBwdXR0aW5nIGRhdGVzIG9uIHNvbWUgb2Y8YnI+CnRoZSB0
cG0yLXRvb2xzIHZlcnNpb25zIGJ1dCBub3QgdHBtMi10c3M/PGJyPgo8YnI+Cjxicj4KJmd0OyBS
ZWdhcmRzPGJyPgomZ3Q7IFJhajxicj4KPGJyPgomZ3Q7Jm5ic3A7IE9uIFRodSwgRGVjIDIsIDIw
MjEgYXQgODo0NCBQTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxs
aWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0
c0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+CiZndDsgKyBJbXJhbjxicj4KPGJyPgomZ3Q7
IFdoYXQgdmVyc2lvbiBvZiB0b29scyBhbmQgdHNzIGFyZSB5b3UgcnVubmluZz88YnI+Cjxicj4K
Jmd0OyBJIGp1c3Qgbm90aWNlZCB0aGF0IHRoZSB0b29scyBDSSBkb2Vzbid0IGhhdmUgdGhlIG11
bHRpLWFyY2ggaW1hZ2VzIGVuYWJsZWQuIExldCBtZSBpbnZlc3RpZ2F0ZSBhZGRpbmcgdGhpcyBh
bmQgc2VlIGlmIEkgY2FuIHJlcHJvZHVjZS48YnI+Cjxicj4KJmd0OyBGcm9tOiBSYWprdW1hciBL
IFNpdmFzYW15ICZsdDs8YSBocmVmPSJtYWlsdG86cmFqa3VtYXIuay5zaXZhc2FteUBnbWFpbC5j
b20iIHRhcmdldD0iX2JsYW5rIj5yYWprdW1hci5rLnNpdmFzYW15QGdtYWlsLmNvbTwvYT4mZ3Q7
PGJyPgomZ3Q7IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMSwgMjAyMSAxMTo0MCBQTTxicj4K
Jmd0OyBUbzogPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7
IFN1YmplY3Q6IFt0cG0yXSAmcXVvdDt0cG0yX2ltcG9ydCZxdW90OyBJbnRlZ3JpdHkgQ2hlY2sg
aXNzdWUgb24gYSBCaWcgRW5kaWFuIDMyIEJpdCBQbGF0Zm9ybQo8YnI+CiZuYnNwOyZuYnNwOzxi
cj4KJmd0OyBIZWxsbyBUZWFtPGJyPgo8YnI+CiZndDsgSSBhbSB0cnlpbmcgdG8gdXNlIHRwbTJf
aW1wb3J0IG9uIGEgQmlnIEVuZGlhbiAzMiBCaXQgcGxhdGZvcm0gYW5kIHJ1bm5pbmcgaW50byBm
b2xsb3dpbmcgZXJyb3I6PGJyPgo8YnI+CiZndDsgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08YnI+Cjxicj4KJmd0
OyBDb21tYW5kOiA8YnI+CiZndDsgb3BlbnNzbCBnZW5yc2EgLW91dCBwcml2YXRlLnBlbSAyMDQ4
PGJyPgomZ3Q7IHRwbTJfaW1wb3J0IC1DIDB4ODEwMDAwMDEgLUcgcnNhIC1pIHByaXZhdGUucGVt
IC11IGtleS5wdWIgLXIga2V5LnByaXY8YnI+Cjxicj4KJmd0OyBFcnJvcjo8YnI+CiZndDsgRVJS
T1I6ZXN5czpzcmMvdHNzMi1lc3lzL2FwaS9Fc3lzX0ltcG9ydC5jOjExMDpFc3lzX0ltcG9ydCgp
IEVzeXMgRmluaXNoIEVycm9yQ29kZSAoMHgwMDAwMDNkZik8YnI+CiZndDsgRVJST1I6IEVzeXNf
SE1BQygweDNERikgLSB0cG06cGFyYW1ldGVyKDMpOmludGVncml0eSBjaGVjayBmYWlsZWQ8YnI+
CiZndDsgRVJST1I6IFVuYWJsZSB0byBydW4gdHBtMl9pbXBvcnQ8YnI+CiZndDsgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPGJyPgo8YnI+CiZndDsgTmVlZCBwb2ludGVycyB0byBkZWJ1ZyB0aGlzIGlzc3VlLjxi
cj4KJmd0OyBIYXZlIGFueSBvZiB5b3UgY29tZSBhY3Jvc3MgdGhpcyBlcnJvciB3aXRoIHRwbTJf
aW1wb3J0IG9uIEJpZyBFbmRpYW4gMzIgQml0IFBsYXRmb3JtPyBEbyB3ZSBoYXZlIGEgZml4IE9y
IGNhbiB5b3UgcHJvdmlkZSBpbnB1dHMgb24gdGhlIHNvdXJjZSB3aGVyZSBJIGNhbiBsb29rICZn
dDsgYXQgZm9yIGZ1cnRoZXIgZGVidWdnaW5nPzxicj4KPGJyPgomZ3Q7IFRoYW5rczxicj4KJmd0
OyBSYWo8L2Jsb2NrcXVvdGU+CjwvZGl2Pgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============8315731152872371282==--

