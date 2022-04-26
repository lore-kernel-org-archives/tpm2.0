Content-Type: multipart/mixed; boundary="===============1089269356106766496=="
MIME-Version: 1.0
From: Sievert, James <james.sievert at bsci.com>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider...
Date: Tue, 26 Apr 2022 12:06:46 +0000
Message-ID: <
 <DS7PR03MB55763190258B91401A7D93EA9AFB9@DS7PR03MB5576.namprd03.prod.outlook.com>>
In-Reply-To: 20220426134154.91627B4E@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1089269356106766496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks, Petr.  That did the trick (actually, base was sufficient).  In a si=
milar vein, the corresponding private key is also held persistently in the =
TPM, handle 0x81800002.  I'm now attempting the following:

        openssl cms -sign -provider tpm2 -provider default -in file.txt -in=
key handle:0x81800002 -signer handle:0x01000013

I get no output, and a return value of 3.  I get the same result if I refer=
ence the public key certificate as a file:

        openssl cms -sign -provider tpm2 -provider default -in file.txt -in=
key handle:0x81800002 -signer signer.pem

Any insight on that would be appreciated=E2=80=A6

-----Original Message-----
From: Petr Gotthard <petr.gotthard(a)centrum.cz>
Sent: Tuesday, April 26, 2022 7:42 AM
To: Sievert, James <james.sievert(a)bsci.com>; tpm2(a)lists.01.org
Subject: {External} Re: [tpm2] OpenSSL 3 and tpm2 provider...

Hello,
you may be missing "-provider default", please try

$ openssl x509 -provider tpm2 -provider default -in handle:0x01000013 -noou=
t -text


Some explanation why is that is here:
https://github.com/tpm2-software/tpm2-openssl/blob/master/docs/initializati=
on.md#loading-multiple-providers

Petr

______________________________________________________________
> Od: "Sievert, James" <james.sievert(a)bsci.com<mailto:james.sievert(a)bsc=
i.com>>
> Komu: "tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>" <tpm2(a)lists.01.=
org<mailto:tpm2(a)lists.01.org>>
> Datum: 26.04.2022 13:32
> P=C5=99edm=C4=9Bt: [tpm2] OpenSSL 3 and tpm2 provider...
>
>Hi,
>
>I'm using the following OpenSSL version under Ubuntu 22.04:  OpenSSL 3.0.2=
 15 Mar 2022 (Library: OpenSSL 3.0.2 15 Mar 2022).
>
>I have an EC public key certificate held persistently in a TPM 2.0, handle=
 0x01000013.  I'm attempting the following:
>
>$ openssl x509 -provider tpm2 -in handle:0x01000013 -noout -text
>
>and finding that OpenSSL x509 is unable to load the public key:
>
>Certificate:
>    Data:
>        Version: 3 (0x2)
>        Serial Number: 9177472452311271732 (0x7f5cee922ff24934)
>        Signature Algorithm: ecdsa-with-SHA256
>        Issuer: CN =3D aaaa, OU =3D yyyy, O =3D zzzz
>        Validity
>            Not Before: Apr 25 16:43:35 2022 GMT
>            Not After : Dec 31 12:00:00 2045 GMT
>        Subject: CN =3D xxxx, OU =3D yyyy, O =3D zzzz
>        Subject Public Key Info:
>            Public Key Algorithm: id-ecPublicKey
>            Unable to load Public Key
>402C48BB567F0000:error:03000072:digital envelope routines:X509_PUBKEY_get0=
:decode error:../crypto/x509/x_pubkey.c:458:
>402C48BB567F0000:error:03000072:digital envelope routines:X509_PUBKEY_get0=
:decode error:../crypto/x509/x_pubkey.c:458:
>        X509v3 extensions:
>            X509v3 Basic Constraints: critical
>                CA:FALSE
>            X509v3 Authority Key Identifier:
>                B0:06:08:77:FC:C0:3B:0A:F5:8E:0C:B8:F1:DE:A9:55:8B:E5:F1:79
>            X509v3 Extended Key Usage:
>                TLS Web Client Authentication, Code Signing, E-mail Protec=
tion, TLS Web Server Authentication
>            X509v3 Subject Key Identifier:
>                4D:5D:71:84:B5:D9:7B:B1:11:52:58:BC:5E:BE:A8:0D:8C:AE:17:63
>            X509v3 Key Usage: critical
>                Digital Signature, Non Repudiation, Key Encipherment
>    Signature Algorithm: ecdsa-with-SHA256
>    Signature Value:
>        30:44:02:20:5b:ce:5e:3f:67:85:11:42:d5:5f:2a:ba:cd:12:
>        f2:e7:bd:0e:f5:9e:ae:d1:65:8d:9c:d3:dc:7c:8d:63:ec:07:
>        02:20:33:3f:b6:22:39:62:ff:3b:9f:21:eb:43:e1:9e:40:31:
>        39:fb:14:a8:1f:c9:33:48:18:99:33:dd:03:86:2c:0e
>
>I am able to do this:
>
>$ openssl x509 -provider tpm2 -in handle:0x01000013 | openssl x509 -in
>/dev/stdin -noout -text
>Certificate:
>    Data:
>        Version: 3 (0x2)
>        Serial Number: 9177472452311271732 (0x7f5cee922ff24934)
>        Signature Algorithm: ecdsa-with-SHA256
>        Issuer: CN =3D aaaa, OU =3D yyyy, O =3D zzzz
>        Validity
>            Not Before: Apr 25 16:43:35 2022 GMT
>            Not After : Dec 31 12:00:00 2045 GMT
>        Subject: CN =3D xxxx, OU =3D yyyy, O =3D zzzz
>        Subject Public Key Info:
>            Public Key Algorithm: id-ecPublicKey
>                Public-Key: (256 bit)
>                pub:
>                    04:eb:d3:da:02:5a:43:4e:5c:1a:b5:09:e7:6a:8e:
>                    1e:65:9f:eb:ab:35:d5:33:f9:1f:16:bf:d8:0d:c6:
>                    f0:09:ae:10:60:3d:82:cf:46:29:a0:a9:24:47:dd:
>                    e2:5a:ea:97:b6:c1:6a:fa:b2:8a:7c:30:36:36:1a:
>                    8a:e2:91:62:4b
>                ASN1 OID: prime256v1
>                NIST CURVE: P-256
>        X509v3 extensions:
>            X509v3 Basic Constraints: critical
>                CA:FALSE
>            X509v3 Authority Key Identifier:
>                B0:06:08:77:FC:C0:3B:0A:F5:8E:0C:B8:F1:DE:A9:55:8B:E5:F1:79
>            X509v3 Extended Key Usage:
>                TLS Web Client Authentication, Code Signing, E-mail Protec=
tion, TLS Web Server Authentication
>            X509v3 Subject Key Identifier:
>                4D:5D:71:84:B5:D9:7B:B1:11:52:58:BC:5E:BE:A8:0D:8C:AE:17:63
>            X509v3 Key Usage: critical
>                Digital Signature, Non Repudiation, Key Encipherment
>    Signature Algorithm: ecdsa-with-SHA256
>    Signature Value:
>        30:44:02:20:5b:ce:5e:3f:67:85:11:42:d5:5f:2a:ba:cd:12:
>        f2:e7:bd:0e:f5:9e:ae:d1:65:8d:9c:d3:dc:7c:8d:63:ec:07:
>        02:20:33:3f:b6:22:39:62:ff:3b:9f:21:eb:43:e1:9e:40:31:
>        39:fb:14:a8:1f:c9:33:48:18:99:33:dd:03:86:2c:0e
>
>Any help would be appreciated.
>Thanks.
>
>
>----------
>
>_______________________________________________
>tpm2 mailing list -- tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
>To unsubscribe send an email to tpm2-leave(a)lists.01.org<mailto:tpm2-leav=
e(a)lists.01.org>
>%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>


--===============1089269356106766496==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVu
dD0iTWljcm9zb2Z0IEV4Y2hhbmdlIFNlcnZlciI+DQo8IS0tIGNvbnZlcnRlZCBmcm9tIHJ0ZiAt
LT4NCjxzdHlsZT48IS0tIC5FbWFpbFF1b3RlIHsgbWFyZ2luLWxlZnQ6IDFwdDsgcGFkZGluZy1s
ZWZ0OiA0cHQ7IGJvcmRlci1sZWZ0OiAjODAwMDAwIDJweCBzb2xpZDsgfSAtLT48L3N0eWxlPg0K
PC9oZWFkPg0KPGJvZHk+DQo8Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExcHQ7Ij4NCjxkaXY+VGhhbmtzLCBQZXRyLiZuYnNwOyBUaGF0IGRpZCB0
aGUgdHJpY2sgKGFjdHVhbGx5LCBiYXNlIHdhcyBzdWZmaWNpZW50KS4mbmJzcDsgSW4gYSBzaW1p
bGFyIHZlaW4sIHRoZSBjb3JyZXNwb25kaW5nIHByaXZhdGUga2V5IGlzIGFsc28gaGVsZCBwZXJz
aXN0ZW50bHkgaW4gdGhlIFRQTSwgaGFuZGxlIDB4ODE4MDAwMDIuJm5ic3A7IEknbSBub3cgYXR0
ZW1wdGluZyB0aGUgZm9sbG93aW5nOjwvZGl2Pg0KPGRpdj4mbmJzcDs8L2Rpdj4NCjxkaXY+Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDxmb250IGZhY2U9IkNvdXJp
ZXIgTmV3IiBzaXplPSIxIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjhwdDsiPm9wZW5zc2wgY21z
IC1zaWduIC1wcm92aWRlciB0cG0yIC1wcm92aWRlciBkZWZhdWx0IC1pbiA8L3NwYW4+PC9mb250
Pjxmb250IGZhY2U9IkNvdXJpZXIgTmV3IiBzaXplPSIxIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjhwdDsiPmZpbGUudHh0PC9zcGFuPjwvZm9udD48Zm9udCBmYWNlPSJDb3VyaWVyIE5ldyIgc2l6
ZT0iMSI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo4cHQ7Ij4NCi1pbmtleSBoYW5kbGU6MHg4MTgw
MDAwMiAtc2lnbmVyIGhhbmRsZToweDAxMDAwMDEzPC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+
Jm5ic3A7PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiPkkgZ2V0IG5vIG91dHB1dCwg
YW5kIGEgcmV0dXJuIHZhbHVlIG9mIDMuJm5ic3A7IEkgZ2V0IHRoZSBzYW1lIHJlc3VsdCBpZiBJ
IHJlZmVyZW5jZSB0aGUgcHVibGljIGtleSBjZXJ0aWZpY2F0ZSBhcyBhIGZpbGU6PC9mb250Pjwv
ZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIj4mbmJzcDs8L2ZvbnQ+PC9kaXY+DQo8ZGl2
PiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA8Zm9udCBmYWNlPSJD
b3VyaWVyIE5ldyIgc2l6ZT0iMSI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo4cHQ7Ij5vcGVuc3Ns
IGNtcyAtc2lnbiAtcHJvdmlkZXIgdHBtMiAtcHJvdmlkZXIgZGVmYXVsdCAtaW4gPC9zcGFuPjwv
Zm9udD48Zm9udCBmYWNlPSJDb3VyaWVyIE5ldyIgc2l6ZT0iMSI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZTo4cHQ7Ij5maWxlLnR4dDwvc3Bhbj48L2ZvbnQ+PGZvbnQgZmFjZT0iQ291cmllciBOZXci
IHNpemU9IjEiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6OHB0OyI+DQotaW5rZXkgaGFuZGxlOjB4
ODE4MDAwMDIgLXNpZ25lcjwvc3Bhbj48L2ZvbnQ+PGZvbnQgZmFjZT0iQ291cmllciBOZXciIHNp
emU9IjEiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6OHB0OyI+IHNpZ25lci5wZW08L3NwYW4+PC9m
b250PjwvZGl2Pg0KPGRpdj4mbmJzcDs8L2Rpdj4NCjxkaXY+QW55IGluc2lnaHQgb24gdGhhdCB3
b3VsZCBiZSBhcHByZWNpYXRlZOKApjwvZGl2Pg0KPGEgbmFtZT0iX01haWxFbmRDb21wb3NlIj48
L2E+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0KPGRpdj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxi
cj4NCg0KRnJvbTogUGV0ciBHb3R0aGFyZCAmbHQ7cGV0ci5nb3R0aGFyZEBjZW50cnVtLmN6Jmd0
OyA8YnI+DQoNClNlbnQ6IFR1ZXNkYXksIEFwcmlsIDI2LCAyMDIyIDc6NDIgQU08YnI+DQoNClRv
OiBTaWV2ZXJ0LCBKYW1lcyAmbHQ7amFtZXMuc2lldmVydEBic2NpLmNvbSZndDs7IHRwbTJAbGlz
dHMuMDEub3JnPGJyPg0KDQpTdWJqZWN0OiB7RXh0ZXJuYWx9IFJlOiBbdHBtMl0gT3BlblNTTCAz
IGFuZCB0cG0yIHByb3ZpZGVyLi4uPC9kaXY+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0KPGRpdj5IZWxs
byw8L2Rpdj4NCjxkaXY+eW91IG1heSBiZSBtaXNzaW5nICZxdW90Oy1wcm92aWRlciBkZWZhdWx0
JnF1b3Q7LCBwbGVhc2UgdHJ5PC9kaXY+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0KPGRpdj4kIG9wZW5z
c2wgeDUwOSAtcHJvdmlkZXIgdHBtMiAtcHJvdmlkZXIgZGVmYXVsdCAtaW4gaGFuZGxlOjB4MDEw
MDAwMTMgLW5vb3V0IC10ZXh0PC9kaXY+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0KPGRpdj4mbmJzcDs8
L2Rpdj4NCjxkaXY+U29tZSBleHBsYW5hdGlvbiB3aHkgaXMgdGhhdCBpcyBoZXJlOjwvZGl2Pg0K
PGRpdj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLW9wZW5z
c2wvYmxvYi9tYXN0ZXIvZG9jcy9pbml0aWFsaXphdGlvbi5tZCNsb2FkaW5nLW11bHRpcGxlLXBy
b3ZpZGVycyI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi1vcGVuc3NsL2Js
b2IvbWFzdGVyL2RvY3MvaW5pdGlhbGl6YXRpb24ubWQjbG9hZGluZy1tdWx0aXBsZS1wcm92aWRl
cnM8L2E+PC9kaXY+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0KPGRpdj5QZXRyPC9kaXY+DQo8ZGl2PiZu
YnNwOzwvZGl2Pg0KPGRpdj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXzwvZGl2Pg0KPGRpdj4mZ3Q7IE9kOiAmcXVvdDtTaWV2ZXJ0
LCBKYW1lcyZxdW90OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmphbWVzLnNpZXZlcnRAYnNjaS5jb20i
PmphbWVzLnNpZXZlcnRAYnNjaS5jb208L2E+Jmd0OzwvZGl2Pg0KPGRpdj4mZ3Q7IEtvbXU6ICZx
dW90OzxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8
L2E+JnF1b3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJAbGlz
dHMuMDEub3JnPC9hPiZndDs8L2Rpdj4NCjxkaXY+Jmd0OyBEYXR1bTogMjYuMDQuMjAyMiAxMzoz
MjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIENFIj4mZ3Q7IFDFmWVkbcSbdDogW3Rw
bTJdIE9wZW5TU0wgMyBhbmQgdHBtMiBwcm92aWRlci4uLjwvZm9udD48L2Rpdj4NCjxkaXY+Jmd0
OzwvZGl2Pg0KPGRpdj4mZ3Q7SGksPC9kaXY+DQo8ZGl2PiZndDs8L2Rpdj4NCjxkaXY+Jmd0O0kn
bSB1c2luZyB0aGUgZm9sbG93aW5nIE9wZW5TU0wgdmVyc2lvbiB1bmRlciBVYnVudHUgMjIuMDQ6
Jm5ic3A7IE9wZW5TU0wgMy4wLjIgMTUgTWFyIDIwMjIgKExpYnJhcnk6IE9wZW5TU0wgMy4wLjIg
MTUgTWFyIDIwMjIpLjwvZGl2Pg0KPGRpdj4mZ3Q7PC9kaXY+DQo8ZGl2PiZndDtJIGhhdmUgYW4g
RUMgcHVibGljIGtleSBjZXJ0aWZpY2F0ZSBoZWxkIHBlcnNpc3RlbnRseSBpbiBhIFRQTSAyLjAs
IGhhbmRsZSAweDAxMDAwMDEzLiZuYnNwOyBJJ20gYXR0ZW1wdGluZyB0aGUgZm9sbG93aW5nOjwv
ZGl2Pg0KPGRpdj4mZ3Q7PC9kaXY+DQo8ZGl2PiZndDskIG9wZW5zc2wgeDUwOSAtcHJvdmlkZXIg
dHBtMiAtaW4gaGFuZGxlOjB4MDEwMDAwMTMgLW5vb3V0IC10ZXh0PC9kaXY+DQo8ZGl2PiZndDs8
L2Rpdj4NCjxkaXY+Jmd0O2FuZCBmaW5kaW5nIHRoYXQgT3BlblNTTCB4NTA5IGlzIHVuYWJsZSB0
byBsb2FkIHRoZSBwdWJsaWMga2V5OjwvZGl2Pg0KPGRpdj4mZ3Q7PC9kaXY+DQo8ZGl2PiZndDtD
ZXJ0aWZpY2F0ZTo8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyBEYXRhOjwvZGl2
Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFZl
cnNpb246IDMgKDB4Mik8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyBTZXJpYWwgTnVtYmVyOiA5MTc3NDcyNDUyMzExMjcxNzMyICgweDdm
NWNlZTkyMmZmMjQ5MzQpPC9kaXY+DQo8ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgU2lnbmF0dXJlIEFsZ29yaXRobTogZWNkc2Etd2l0aC1TSEEyNTY8
L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyBJc3N1ZXI6IENOID0gYWFhYSwgT1UgPSB5eXl5LCBPID0genp6ejwvZGl2Pg0KPGRpdj4mZ3Q7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFZhbGlkaXR5PC9kaXY+
DQo8ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgTm90IEJlZm9yZTogQXByIDI1IDE2OjQzOjM1IDIwMjIgR01U
PC9kaXY+DQo8ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgTm90IEFmdGVyIDogRGVjIDMxIDEyOjAwOjAwIDIw
NDUgR01UPC9kaXY+DQo8ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgU3ViamVjdDogQ04gPSB4eHh4LCBPVSA9IHl5eXksIE8gPSB6enp6PC9kaXY+DQo8
ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgU3ViamVj
dCBQdWJsaWMgS2V5IEluZm86PC9kaXY+DQo8ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgUHVibGljIEtleSBB
bGdvcml0aG06IGlkLWVjUHVibGljS2V5PC9kaXY+DQo8ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgVW5hYmxl
IHRvIGxvYWQgUHVibGljIEtleTwvZGl2Pg0KPGRpdj4mZ3Q7NDAyQzQ4QkI1NjdGMDAwMDplcnJv
cjowMzAwMDA3MjpkaWdpdGFsIGVudmVsb3BlIHJvdXRpbmVzOlg1MDlfUFVCS0VZX2dldDA6ZGVj
b2RlIGVycm9yOi4uL2NyeXB0by94NTA5L3hfcHVia2V5LmM6NDU4OjwvZGl2Pg0KPGRpdj4mZ3Q7
NDAyQzQ4QkI1NjdGMDAwMDplcnJvcjowMzAwMDA3MjpkaWdpdGFsIGVudmVsb3BlIHJvdXRpbmVz
Olg1MDlfUFVCS0VZX2dldDA6ZGVjb2RlIGVycm9yOi4uL2NyeXB0by94NTA5L3hfcHVia2V5LmM6
NDU4OjwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IFg1MDl2MyBleHRlbnNpb25zOjwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFg1MDl2
MyBCYXNpYyBDb25zdHJhaW50czogY3JpdGljYWw8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBDQTpGQUxTRTwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IFg1MDl2MyBBdXRob3JpdHkgS2V5IElkZW50aWZpZXI6PC9kaXY+DQo8ZGl2PiZndDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgQjA6MDY6MDg6Nzc6RkM6QzA6M0I6MEE6RjU6OEU6
MEM6Qjg6RjE6REU6QTk6NTU6OEI6RTU6RjE6Nzk8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBY
NTA5djMgRXh0ZW5kZWQgS2V5IFVzYWdlOjwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IFRMUyBXZWIgQ2xpZW50IEF1dGhlbnRpY2F0aW9uLCBDb2RlIFNp
Z25pbmcsIEUtbWFpbCBQcm90ZWN0aW9uLCBUTFMgV2ViIFNlcnZlciBBdXRoZW50aWNhdGlvbjwv
ZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFg1MDl2MyBTdWJqZWN0IEtleSBJZGVudGlmaWVyOjwv
ZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDREOjVEOjcx
Ojg0OkI1OkQ5OjdCOkIxOjExOjUyOjU4OkJDOjVFOkJFOkE4OjBEOjhDOkFFOjE3OjYzPC9kaXY+
DQo8ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgWDUwOXYzIEtleSBVc2FnZTogY3JpdGljYWw8L2Rpdj4NCjxk
aXY+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBEaWdpdGFsIFNpZ25hdHVy
ZSwgTm9uIFJlcHVkaWF0aW9uLCBLZXkgRW5jaXBoZXJtZW50PC9kaXY+DQo8ZGl2PiZndDsmbmJz
cDsmbmJzcDsmbmJzcDsgU2lnbmF0dXJlIEFsZ29yaXRobTogZWNkc2Etd2l0aC1TSEEyNTY8L2Rp
dj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyBTaWduYXR1cmUgVmFsdWU6PC9kaXY+DQo8
ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgMzA6NDQ6
MDI6MjA6NWI6Y2U6NWU6M2Y6Njc6ODU6MTE6NDI6ZDU6NWY6MmE6YmE6Y2Q6MTI6PC9kaXY+DQo8
ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgZjI6ZTc6
YmQ6MGU6ZjU6OWU6YWU6ZDE6NjU6OGQ6OWM6ZDM6ZGM6N2M6OGQ6NjM6ZWM6MDc6PC9kaXY+DQo8
ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgMDI6MjA6
MzM6M2Y6YjY6MjI6Mzk6NjI6ZmY6M2I6OWY6MjE6ZWI6NDM6ZTE6OWU6NDA6MzE6PC9kaXY+DQo8
ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgMzk6ZmI6
MTQ6YTg6MWY6Yzk6MzM6NDg6MTg6OTk6MzM6ZGQ6MDM6ODY6MmM6MGU8L2Rpdj4NCjxkaXY+Jmd0
OzwvZGl2Pg0KPGRpdj4mZ3Q7SSBhbSBhYmxlIHRvIGRvIHRoaXM6PC9kaXY+DQo8ZGl2PiZndDs8
L2Rpdj4NCjxkaXY+Jmd0OyQgb3BlbnNzbCB4NTA5IC1wcm92aWRlciB0cG0yIC1pbiBoYW5kbGU6
MHgwMTAwMDAxMyB8IG9wZW5zc2wgeDUwOSAtaW4gPC9kaXY+DQo8ZGl2PiZndDsvZGV2L3N0ZGlu
IC1ub291dCAtdGV4dDwvZGl2Pg0KPGRpdj4mZ3Q7Q2VydGlmaWNhdGU6PC9kaXY+DQo8ZGl2PiZn
dDsmbmJzcDsmbmJzcDsmbmJzcDsgRGF0YTo8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBWZXJzaW9uOiAzICgweDIpPC9kaXY+DQo8ZGl2
PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgU2VyaWFsIE51
bWJlcjogOTE3NzQ3MjQ1MjMxMTI3MTczMiAoMHg3ZjVjZWU5MjJmZjI0OTM0KTwvZGl2Pg0KPGRp
dj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFNpZ25hdHVy
ZSBBbGdvcml0aG06IGVjZHNhLXdpdGgtU0hBMjU2PC9kaXY+DQo8ZGl2PiZndDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgSXNzdWVyOiBDTiA9IGFhYWEsIE9VID0g
eXl5eSwgTyA9IHp6eno8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyBWYWxpZGl0eTwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IE5vdCBC
ZWZvcmU6IEFwciAyNSAxNjo0MzozNSAyMDIyIEdNVDwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IE5vdCBBZnRlciA6IERlYyAzMSAxMjowMDowMCAyMDQ1IEdNVDwvZGl2Pg0KPGRpdj4mZ3Q7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFN1YmplY3Q6IENOID0geHh4
eCwgT1UgPSB5eXl5LCBPID0genp6ejwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFN1YmplY3QgUHVibGljIEtleSBJbmZvOjwvZGl2Pg0K
PGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IFB1YmxpYyBLZXkgQWxnb3JpdGhtOiBpZC1lY1B1YmxpY0tleTwv
ZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFB1YmxpYy1L
ZXk6ICgyNTYgYml0KTwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IHB1Yjo8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAwNDplYjpkMzpkYTowMjo1YTo0Mzo0ZTo1Yzox
YTpiNTowOTplNzo2YTo4ZTo8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAxZTo2NTo5ZjplYjphYjozNTpkNToz
MzpmOToxZjoxNjpiZjpkODowZDpjNjo8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBmMDowOTphZToxMDo2MDoz
ZDo4MjpjZjo0NjoyOTphMDphOToyNDo0NzpkZDo8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBlMjo1YTplYTo5
NzpiNjpjMTo2YTpmYTpiMjo4YTo3YzozMDozNjozNjoxYTo8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA4YTpl
Mjo5MTo2Mjo0YjwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IEFTTjEgT0lEOiBwcmltZTI1NnYxPC9kaXY+DQo8ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgTklTVCBDVVJWRTogUC0yNTY8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBYNTA5djMgZXh0ZW5zaW9uczo8
L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBYNTA5djMgQmFzaWMgQ29uc3RyYWludHM6IGNyaXRp
Y2FsPC9kaXY+DQo8ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgQ0E6
RkFMU0U8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBYNTA5djMgQXV0aG9yaXR5IEtleSBJZGVu
dGlmaWVyOjwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IEIwOjA2OjA4Ojc3OkZDOkMwOjNCOjBBOkY1OjhFOjBDOkI4OkYxOkRFOkE5OjU1OjhCOkU1OkYx
Ojc5PC9kaXY+DQo8ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgWDUwOXYzIEV4dGVuZGVkIEtleSBVc2FnZTo8
L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBUTFMgV2Vi
IENsaWVudCBBdXRoZW50aWNhdGlvbiwgQ29kZSBTaWduaW5nLCBFLW1haWwgUHJvdGVjdGlvbiwg
VExTIFdlYiBTZXJ2ZXIgQXV0aGVudGljYXRpb248L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBY
NTA5djMgU3ViamVjdCBLZXkgSWRlbnRpZmllcjo8L2Rpdj4NCjxkaXY+Jmd0OyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA0RDo1RDo3MTo4NDpCNTpEOTo3QjpCMToxMTo1Mjo1ODpC
Qzo1RTpCRTpBODowRDo4QzpBRToxNzo2MzwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFg1MDl2
MyBLZXkgVXNhZ2U6IGNyaXRpY2FsPC9kaXY+DQo8ZGl2PiZndDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgRGlnaXRhbCBTaWduYXR1cmUsIE5vbiBSZXB1ZGlhdGlvbiwgS2V5IEVu
Y2lwaGVybWVudDwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFNpZ25hdHVyZSBB
bGdvcml0aG06IGVjZHNhLXdpdGgtU0hBMjU2PC9kaXY+DQo8ZGl2PiZndDsmbmJzcDsmbmJzcDsm
bmJzcDsgU2lnbmF0dXJlIFZhbHVlOjwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDMwOjQ0OjAyOjIwOjViOmNlOjVlOjNmOjY3Ojg1OjEx
OjQyOmQ1OjVmOjJhOmJhOmNkOjEyOjwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGYyOmU3OmJkOjBlOmY1OjllOmFlOmQxOjY1OjhkOjlj
OmQzOmRjOjdjOjhkOjYzOmVjOjA3OjwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDAyOjIwOjMzOjNmOmI2OjIyOjM5OjYyOmZmOjNiOjlm
OjIxOmViOjQzOmUxOjllOjQwOjMxOjwvZGl2Pg0KPGRpdj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDM5OmZiOjE0OmE4OjFmOmM5OjMzOjQ4OjE4Ojk5OjMz
OmRkOjAzOjg2OjJjOjBlPC9kaXY+DQo8ZGl2PiZndDs8L2Rpdj4NCjxkaXY+Jmd0O0FueSBoZWxw
IHdvdWxkIGJlIGFwcHJlY2lhdGVkLjwvZGl2Pg0KPGRpdj4mZ3Q7VGhhbmtzLjwvZGl2Pg0KPGRp
dj4mZ3Q7PC9kaXY+DQo8ZGl2PiZndDs8L2Rpdj4NCjxkaXY+Jmd0Oy0tLS0tLS0tLS08L2Rpdj4N
CjxkaXY+Jmd0OzwvZGl2Pg0KPGRpdj4mZ3Q7X19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX188L2Rpdj4NCjxkaXY+Jmd0O3RwbTIgbWFpbGluZyBsaXN0IC0tIDxh
IGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PC9k
aXY+DQo8ZGl2PiZndDtUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1h
aWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+
IDwvZGl2Pg0KPGRpdj4mZ3Q7JSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9p
bnRlcm5hbF9uYW1lKXM8L2Rpdj4NCjxkaXY+Jmd0OzwvZGl2Pg0KPGRpdj4mZ3Q7PC9kaXY+DQo8
ZGl2PiZuYnNwOzwvZGl2Pg0KPC9zcGFuPjwvZm9udD4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--===============1089269356106766496==--

