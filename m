Content-Type: multipart/mixed; boundary="===============1469110101335320003=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: "tpm2_import" Integrity Check issue on a Big Endian 32 Bit
 Platform
Date: Thu, 02 Dec 2021 15:14:28 +0000
Message-ID: <DM6PR11MB3434E92D56A7B032A597ED59B8699@DM6PR11MB3434.namprd11.prod.outlook.com>
In-Reply-To: CADu5Hqz2o0jMMT+q81x=njOygRNqVvb72sFud1cbRXkjgFEwAQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1469110101335320003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ Imran

What version of tools and tss are you running?

I just noticed that the tools CI doesn't have the multi-arch images enabled=
. Let me investigate adding this and see if I can reproduce.
________________________________
From: Rajkumar K Sivasamy <rajkumar.k.sivasamy(a)gmail.com>
Sent: Wednesday, December 1, 2021 11:40 PM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] "tpm2_import" Integrity Check issue on a Big Endian 32 Bit =
Platform

Hello Team

I am trying to use tpm2_import on a Big Endian 32 Bit platform and running =
into following error:

---------------------------------------------------------------------------=
-----------------------------------------------------

Command:

  1.  openssl genrsa -out private.pem 2048

  2.  tpm2_import -C 0x81000001 -G rsa -i private.pem -u key.pub -r key.priv

Error:
ERROR:esys:src/tss2-esys/api/Esys_Import.c:110:Esys_Import() Esys Finish Er=
rorCode (0x000003df)
ERROR: Esys_HMAC(0x3DF) - tpm:parameter(3):integrity check failed
ERROR: Unable to run tpm2_import
---------------------------------------------------------------------------=
-----------------------------------------------------

Need pointers to debug this issue.
Have any of you come across this error with tpm2_import on Big Endian 32 Bi=
t Platform? Do we have a fix Or can you provide inputs on the source where =
I can look at for further debugging?

Thanks
Raj

--===============1469110101335320003==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KKyBJbXJhbjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTog
Q2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBj
b2xvcjogcmdiKDAsIDAsIDApOyI+Cjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7
IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KV2hhdCB2ZXJzaW9uIG9mIHRvb2xzIGFuZCB0c3MgYXJl
IHlvdSBydW5uaW5nPzwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJp
YWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAs
IDAsIDApOyI+Cjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBB
cmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2Io
MCwgMCwgMCk7Ij4KSSBqdXN0IG5vdGljZWQgdGhhdCB0aGUgdG9vbHMgQ0kgZG9lc24ndCBoYXZl
IHRoZSBtdWx0aS1hcmNoIGltYWdlcyBlbmFibGVkLiBMZXQgbWUgaW52ZXN0aWdhdGUgYWRkaW5n
IHRoaXMgYW5kIHNlZSBpZiBJIGNhbiByZXByb2R1Y2UuPC9kaXY+CjxkaXYgaWQ9ImFwcGVuZG9u
c2VuZCI+PC9kaXY+CjxociBzdHlsZT0iZGlzcGxheTppbmxpbmUtYmxvY2s7d2lkdGg6OTglIiB0
YWJpbmRleD0iLTEiPgo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFj
ZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAw
MDAwMCI+PGI+RnJvbTo8L2I+IFJhamt1bWFyIEsgU2l2YXNhbXkgJmx0O3Jhamt1bWFyLmsuc2l2
YXNhbXlAZ21haWwuY29tJmd0Ozxicj4KPGI+U2VudDo8L2I+IFdlZG5lc2RheSwgRGVjZW1iZXIg
MSwgMjAyMSAxMTo0MCBQTTxicj4KPGI+VG86PC9iPiB0cG0yQGxpc3RzLjAxLm9yZyAmbHQ7dHBt
MkBsaXN0cy4wMS5vcmcmZ3Q7PGJyPgo8Yj5TdWJqZWN0OjwvYj4gW3RwbTJdICZxdW90O3RwbTJf
aW1wb3J0JnF1b3Q7IEludGVncml0eSBDaGVjayBpc3N1ZSBvbiBhIEJpZyBFbmRpYW4gMzIgQml0
IFBsYXRmb3JtPC9mb250Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8L2Rpdj4KPGRpdj4KPGRpdiBkaXI9
Imx0ciI+CjxkaXY+SGVsbG8gVGVhbTwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+SSBhbSB0
cnlpbmcgdG8gdXNlIHRwbTJfaW1wb3J0IG9uIGEgQmlnIEVuZGlhbiAzMiBCaXQgcGxhdGZvcm0g
YW5kIHJ1bm5pbmcgaW50byBmb2xsb3dpbmcgZXJyb3I6PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4K
PGRpdj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLTxicj4KPC9kaXY+CjxkaXY+PGI+PGJyPgo8L2I+PC9kaXY+Cjxk
aXY+PGI+Q29tbWFuZDogPC9iPjxicj4KPC9kaXY+CjxkaXY+CjxvbD4KPGxpPgo8cCBzdHlsZT0i
bWFyZ2luOjBpbjsgZm9udC1mYW1pbHk6Q2FsaWJyaTsgZm9udC1zaXplOjExcHQiPm9wZW5zc2wg
Z2VucnNhIC1vdXQgcHJpdmF0ZS5wZW0gMjA0ODwvcD4KPC9saT48bGk+dHBtMl9pbXBvcnQgLUMg
MHg4MTAwMDAwMSAtRyByc2EgLWkgcHJpdmF0ZS5wZW0gLXUga2V5LnB1YiAtciBrZXkucHJpdjwv
bGk+PC9vbD4KPC9kaXY+CjxkaXY+PGI+PGJyPgo8L2I+PC9kaXY+CjxkaXY+PGI+RXJyb3I6PC9i
Pjxicj4KPC9kaXY+CjxkaXY+PC9kaXY+CjxkaXY+RVJST1I6ZXN5czpzcmMvdHNzMi1lc3lzL2Fw
aS9Fc3lzX0ltcG9ydC5jOjExMDpFc3lzX0ltcG9ydCgpIEVzeXMgRmluaXNoIEVycm9yQ29kZSAo
MHgwMDAwMDNkZik8YnI+CkVSUk9SOiBFc3lzX0hNQUMoMHgzREYpIC0gdHBtOnBhcmFtZXRlcigz
KTppbnRlZ3JpdHkgY2hlY2sgZmFpbGVkPGJyPgpFUlJPUjogVW5hYmxlIHRvIHJ1biB0cG0yX2lt
cG9ydDxicj4KPC9kaXY+CjxkaXY+LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPGJyPgo8L2Rpdj4KPGRpdj48YnI+
CjwvZGl2Pgo8ZGl2Pk5lZWQgcG9pbnRlcnMgdG8gZGVidWcgdGhpcyBpc3N1ZS48L2Rpdj4KPGRp
dj5IYXZlIGFueSBvZiB5b3UgY29tZSBhY3Jvc3MgdGhpcyBlcnJvciB3aXRoIHRwbTJfaW1wb3J0
IG9uIEJpZyBFbmRpYW4gMzIgQml0IFBsYXRmb3JtPyBEbyB3ZSBoYXZlIGEgZml4IE9yIGNhbiB5
b3UgcHJvdmlkZSBpbnB1dHMgb24gdGhlIHNvdXJjZSB3aGVyZSBJIGNhbiBsb29rIGF0IGZvciBm
dXJ0aGVyIGRlYnVnZ2luZz88YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+VGhhbmtz
PC9kaXY+CjxkaXY+UmFqPGJyPgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2JvZHk+CjwvaHRtbD4K

--===============1469110101335320003==--

