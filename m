Content-Type: multipart/mixed; boundary="===============2747956210346525441=="
MIME-Version: 1.0
From: arjun kashyap <arjun21k at gmail.com>
Subject: [tpm2] Use endorsement key for encryption and decryption
Date: Sun, 03 Mar 2019 14:57:44 -0600
Message-ID: <CA+tUB7B6yeHEKb5D6J9K__ZCU1L_HPr82w370SsLieA4-iQu3g@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2747956210346525441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

I am using the IBM tpm2.0 simulator. My use case is that I would like to
encrypt data and send to tpm and then decrypt this at the tpm side. I would
want to use the endorsement key (EK) for this purpose. Hence, I would like
to encrypt data using EK's public key and decrypt using EK's private key. I
tried creating EK using tpm2_createek -G rsa -f pem -c - -p ek.pem. Now, I
have the ek.pem( public portion of EK) to encrypt the data. When I load
this key into the tpm and invoke tpm2_rsadecrypt I get an error. I also
tried using tpm2_createprimary to create an EK but failed in the above
attempt. Could anyone please help me out so that I can use EK to
encrypt/decrypt data.

Please let me know if more information is needed.

Thanks in advance.

<https://www.avast.com/sig-email?utm_medium=3Demail&utm_source=3Dlink&utm_c=
ampaign=3Dsig-email&utm_content=3Dwebmail&utm_term=3Dicon>
Virus-free.
www.avast.com
<https://www.avast.com/sig-email?utm_medium=3Demail&utm_source=3Dlink&utm_c=
ampaign=3Dsig-email&utm_content=3Dwebmail&utm_term=3Dlink>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>

--===============2747956210346525441==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGVsbG8gYWxsLDxkaXY+PGJyPjwvZGl2PjxkaXY+SSBhbSB1c2luZyB0
aGUgSUJNwqB0cG0yLjAgc2ltdWxhdG9yLiBNeSB1c2UgY2FzZSBpcyB0aGF0IEkgd291bGQgbGlr
ZSB0byBlbmNyeXB0IGRhdGEgYW5kIHNlbmQgdG8gdHBtwqBhbmQgdGhlbiBkZWNyeXB0IHRoaXMg
YXQgdGhlIHRwbcKgc2lkZS4gSSB3b3VsZCB3YW50IHRvIHVzZSB0aGUgZW5kb3JzZW1lbnQga2V5
IChFSykgZm9yIHRoaXMgcHVycG9zZS4gSGVuY2UsIEkgd291bGQgbGlrZSB0byBlbmNyeXB0IGRh
dGEgdXNpbmcgRUsmIzM5O3MgcHVibGljIGtleSBhbmQgZGVjcnlwdCB1c2luZyBFSyYjMzk7cyBw
cml2YXRlIGtleS4gSSB0cmllZCBjcmVhdGluZyBFSyB1c2luZyB0cG0yX2NyZWF0ZWVrIC1HIHJz
YSAtZiBwZW0gLWMgLSAtcCBlay5wZW0uIE5vdywgSSBoYXZlIHRoZSBlay5wZW0oIHB1YmxpYyBw
b3J0aW9uIG9mIEVLKSB0byBlbmNyeXB0IHRoZSBkYXRhLiBXaGVuIEkgbG9hZCB0aGlzIGtleSBp
bnRvIHRoZSB0cG0gYW5kIGludm9rZSB0cG0yX3JzYWRlY3J5cHQgSSBnZXQgYW4gZXJyb3IuIEkg
YWxzbyB0cmllZCB1c2luZyB0cG0yX2NyZWF0ZXByaW1hcnkgdG8gY3JlYXRlIGFuIEVLIGJ1dCBm
YWlsZWQgaW4gdGhlIGFib3ZlIGF0dGVtcHQuIENvdWxkIGFueW9uZSBwbGVhc2UgaGVscCBtZSBv
dXQgc28gdGhhdCBJIGNhbiB1c2UgRUsgdG8gZW5jcnlwdC9kZWNyeXB0IGRhdGEuPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5QbGVhc2UgbGV0wqBtZSBrbm93IGlmIG1vcmUgaW5mb3JtYXRpb24g
aXMgbmVlZGVkLsKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MgaW4gYWR2YW5jZS48
L2Rpdj48L2Rpdj48ZGl2IGlkPSJEQUI0RkFEOC0yREQ3LTQwQkItQTFCOC00RTJBQTFGOUZERjIi
Pjxicj4KPHRhYmxlIHN0eWxlPSJib3JkZXItdG9wOjFweCBzb2xpZCAjZDNkNGRlIj4KCTx0cj4K
ICAgICAgICA8dGQgc3R5bGU9IndpZHRoOjU1cHg7cGFkZGluZy10b3A6MTNweCI+PGEgaHJlZj0i
aHR0cHM6Ly93d3cuYXZhc3QuY29tL3NpZy1lbWFpbD91dG1fbWVkaXVtPWVtYWlsJmFtcDt1dG1f
c291cmNlPWxpbmsmYW1wO3V0bV9jYW1wYWlnbj1zaWctZW1haWwmYW1wO3V0bV9jb250ZW50PXdl
Ym1haWwmYW1wO3V0bV90ZXJtPWljb24iIHRhcmdldD0iX2JsYW5rIj48aW1nIHNyYz0iaHR0cHM6
Ly9pcG1jZG4uYXZhc3QuY29tL2ltYWdlcy9pY29ucy9pY29uLWVudmVsb3BlLXRpY2stcm91bmQt
b3JhbmdlLWFuaW1hdGVkLW5vLXJlcGVhdC12MS5naWYiIGFsdD0iIiB3aWR0aD0iNDYiIGhlaWdo
dD0iMjkiIHN0eWxlPSJ3aWR0aDogNDZweDsgaGVpZ2h0OiAyOXB4OyI+PC9hPjwvdGQ+CgkJPHRk
IHN0eWxlPSJ3aWR0aDo0NzBweDtwYWRkaW5nLXRvcDoxMnB4O2NvbG9yOiM0MTQyNGU7Zm9udC1z
aXplOjEzcHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7bGluZS1oZWln
aHQ6MThweCI+VmlydXMtZnJlZS4gPGEgaHJlZj0iaHR0cHM6Ly93d3cuYXZhc3QuY29tL3NpZy1l
bWFpbD91dG1fbWVkaXVtPWVtYWlsJmFtcDt1dG1fc291cmNlPWxpbmsmYW1wO3V0bV9jYW1wYWln
bj1zaWctZW1haWwmYW1wO3V0bV9jb250ZW50PXdlYm1haWwmYW1wO3V0bV90ZXJtPWxpbmsiIHRh
cmdldD0iX2JsYW5rIiBzdHlsZT0iY29sb3I6IzQ0NTNlYSI+d3d3LmF2YXN0LmNvbTwvYT4KCQk8
L3RkPgoJPC90cj4KPC90YWJsZT48YSBocmVmPSIjREFCNEZBRDgtMkRENy00MEJCLUExQjgtNEUy
QUExRjlGREYyIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIj48L2E+PC9kaXY+Cg==

--===============2747956210346525441==--

