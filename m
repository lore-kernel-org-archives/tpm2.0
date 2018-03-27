Content-Type: multipart/mixed; boundary="===============5264555310877347133=="
MIME-Version: 1.0
From: Tomasz Przybysz <tomaszp at mikronika.pl>
Subject: [tpm2] How to protect and encrypt communication between host and TPM
Date: Tue, 27 Mar 2018 08:55:09 +0200
Message-ID: <57a1de55-a2a2-249d-b70a-a6fbfbf9e7a2@mikronika.pl>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5264555310877347133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, we are working on TPM2.0 integration with our devices.
We use Infineon TPM 2.0 chip and It works as expect.

We are using tpm2-tss 1.4.0 library.
We want to use transient RSA key generated inside device. Key is of
course protected by its parent password,
but we want to protect i2c communication between host and tpm chip. We
want communication be encrypted, we don't want to send
parent's password or key's password in clear text.

We have found good example tpmclient.int.cpp, but there is an example
how to encrypt access to the NV Index. There is no anything about RSA keys.
How to call Tss2_Sys_Create for creating RSA key and then set password
to use with session protected by TPM2_SE_HMAC and password.

In the example there is StartAuthSessionWithParams and StartAuthSession.
There is KDFa function called but we need something shared password to
create session key.
Which shared keys ? Is this parent's key password or keys password ?

Thanks in advance,
Tom



--===============5264555310877347133==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CgogICAgPG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250
ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPgogIDwvaGVhZD4KICA8Ym9keSB0ZXh0PSIj
MDAwMDAwIiBiZ2NvbG9yPSIjRkZGRkZGIj4KICAgIDxkaXYgY2xhc3M9Im1vei10ZXh0LXBsYWlu
IiB3cmFwPSJ0cnVlIiBzdHlsZT0iZm9udC1mYW1pbHk6CiAgICAgIC1tb3otZml4ZWQ7IGZvbnQt
c2l6ZTogMTRweDsiIGxhbmc9IngtdW5pY29kZSI+CiAgICAgIDxwcmUgd3JhcD0iIj5IaSwgd2Ug
YXJlIHdvcmtpbmcgb24gVFBNMi4wIGludGVncmF0aW9uIHdpdGggb3VyIGRldmljZXMuCldlIHVz
ZSBJbmZpbmVvbiBUUE0gMi4wIGNoaXAgYW5kIEl0IHdvcmtzIGFzIGV4cGVjdC4KCldlIGFyZSB1
c2luZyB0cG0yLXRzcyAxLjQuMCBsaWJyYXJ5LgpXZSB3YW50IHRvIHVzZSB0cmFuc2llbnQgUlNB
IGtleSBnZW5lcmF0ZWQgaW5zaWRlIGRldmljZS4gS2V5IGlzIG9mCmNvdXJzZSBwcm90ZWN0ZWQg
YnkgaXRzIHBhcmVudCBwYXNzd29yZCwKYnV0IHdlIHdhbnQgdG8gcHJvdGVjdCBpMmMgY29tbXVu
aWNhdGlvbiBiZXR3ZWVuIGhvc3QgYW5kIHRwbSBjaGlwLiBXZQp3YW50IGNvbW11bmljYXRpb24g
YmUgZW5jcnlwdGVkLCB3ZSBkb24ndCB3YW50IHRvIHNlbmQKcGFyZW50J3MgcGFzc3dvcmQgb3Ig
a2V5J3MgcGFzc3dvcmQgaW4gY2xlYXIgdGV4dC4KCldlIGhhdmUgZm91bmQgZ29vZCBleGFtcGxl
IHRwbWNsaWVudC5pbnQuY3BwLCBidXQgdGhlcmUgaXMgYW4gZXhhbXBsZQpob3cgdG8gZW5jcnlw
dCBhY2Nlc3MgdG8gdGhlIE5WIEluZGV4LiBUaGVyZSBpcyBubyBhbnl0aGluZyBhYm91dCBSU0Eg
a2V5cy4KSG93IHRvIGNhbGwgVHNzMl9TeXNfQ3JlYXRlIGZvciBjcmVhdGluZyBSU0Ega2V5IGFu
ZCB0aGVuIHNldCBwYXNzd29yZAp0byB1c2Ugd2l0aCBzZXNzaW9uIHByb3RlY3RlZCBieSBUUE0y
X1NFX0hNQUMgYW5kIHBhc3N3b3JkLgoKSW4gdGhlIGV4YW1wbGUgdGhlcmUgaXMgU3RhcnRBdXRo
U2Vzc2lvbldpdGhQYXJhbXMgYW5kIFN0YXJ0QXV0aFNlc3Npb24uClRoZXJlIGlzIEtERmEgZnVu
Y3Rpb24gY2FsbGVkIGJ1dCB3ZSBuZWVkIHNvbWV0aGluZyBzaGFyZWQgcGFzc3dvcmQgdG8KY3Jl
YXRlIHNlc3Npb24ga2V5LgpXaGljaCBzaGFyZWQga2V5cyA/IElzIHRoaXMgcGFyZW50J3Mga2V5
IHBhc3N3b3JkIG9yIGtleXMgcGFzc3dvcmQgPwoKVGhhbmtzIGluIGFkdmFuY2UsClRvbQoKCjwv
cHJlPgogICAgPC9kaXY+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==

--===============5264555310877347133==--

