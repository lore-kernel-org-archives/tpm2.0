Content-Type: multipart/mixed; boundary="===============5568006605933078906=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] Creating a TPM EK Public object at the server
Date: Tue, 10 Sep 2019 22:17:40 -0700
Message-ID: <CANKkrzF4Ajc+o6KjO3o31yLL-VPTcoKxmDBX-C9A+gagMmNhdQ@mail.gmail.com>
In-Reply-To: CAP3jAwQQcSiebPVrtVtatdhp-DfxUv4DRCi0LPyb+OG9AMGzCA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5568006605933078906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2019 at 9:33 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
wrote:

> In TPM2.0, do we have to do the same, i.e.
> - send AK public object along with the AK Cert signed  or
>

Do you mean "AK certificate signing request" here? If so, yes, this is
probably the best option.


> - would sending the AK name suffice since it is cryptographically linked
> to EK or
>

TPM2_ActivateCredential doesn't care what sort of object "name" refers to,
as long as the TPM has a secret area loaded for it.

So sending the AK name is not sufficient. The server should check the AK's
public data for suitability as an AK. E.g., you probably want to verify
that "restricted", "fixedTPM", "fixedParent", "sensitiveDataOrigin", and
"sign" are set, and "decrypt" is clear.

- do we just send back the credential blob and secret that Make_credential
> created and since we already have the EK and AK keys loaded in the TPM, we
> don't have to do anything else other than pass the 2 outputs of
> MakeCredential?
>

Correct.

>

--===============5568006605933078906==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgOToz
MyBQTSBSYWh1bCBIYXJkaWthciAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21h
aWwuY29tIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48
ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXY+SW4gVFBN
Mi4wLCBkbyB3ZSBoYXZlIHRvIGRvIHRoZSBzYW1lLCBpLmUuPC9kaXY+PGRpdj4tIHNlbmQgQUsg
cHVibGljIG9iamVjdCBhbG9uZyB3aXRoIHRoZSBBSyBDZXJ0IHNpZ25lZCDCoG9ywqA8L2Rpdj48
L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5EbyB5b3UgbWVhbiAmcXVvdDtB
SyBjZXJ0aWZpY2F0ZSBzaWduaW5nIHJlcXVlc3QmcXVvdDsgaGVyZT8gSWYgc28sIHllcywgdGhp
cyBpcyBwcm9iYWJseSB0aGUgYmVzdCBvcHRpb24uPC9kaXY+PGRpdj48L2Rpdj48ZGl2PsKgPC9k
aXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHgg
MHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmct
bGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXY+LSB3b3VsZCBzZW5kaW5nIHRoZSBBSyBuYW1l
IHN1ZmZpY2Ugc2luY2UgaXQgaXMgY3J5cHRvZ3JhcGhpY2FsbHkgbGlua2VkIHRvIEVLIG9ywqA8
L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5UUE0yX0FjdGl2YXRl
Q3JlZGVudGlhbCBkb2VzbiYjMzk7dCBjYXJlIHdoYXQgc29ydCBvZiBvYmplY3QgJnF1b3Q7bmFt
ZSZxdW90OyByZWZlcnMgdG8sIGFzIGxvbmcgYXMgdGhlIFRQTSBoYXMgYSBzZWNyZXQgYXJlYSBs
b2FkZWQgZm9yIGl0LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+U28gc2VuZGluZyB0aGUgQUsg
bmFtZSBpcyBub3Qgc3VmZmljaWVudC4gVGhlIHNlcnZlciBzaG91bGQgY2hlY2sgdGhlIEFLJiMz
OTtzIHB1YmxpYyBkYXRhIGZvciBzdWl0YWJpbGl0eSBhcyBhbiBBSy4gRS5nLiwgeW91IHByb2Jh
Ymx5IHdhbnQgdG8gdmVyaWZ5IHRoYXQgJnF1b3Q7cmVzdHJpY3RlZCZxdW90OywgJnF1b3Q7Zml4
ZWRUUE0mcXVvdDssICZxdW90O2ZpeGVkUGFyZW50JnF1b3Q7LCAmcXVvdDtzZW5zaXRpdmVEYXRh
T3JpZ2luJnF1b3Q7LCBhbmQgJnF1b3Q7c2lnbiZxdW90OyBhcmUgc2V0LCBhbmQgJnF1b3Q7ZGVj
cnlwdCZxdW90OyBpcyBjbGVhci48L2Rpdj48ZGl2Pjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFz
cz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxl
ZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9
Imx0ciI+PGRpdj4tIGRvIHdlIGp1c3Qgc2VuZCBiYWNrIHRoZSBjcmVkZW50aWFsIGJsb2IgYW5k
IHNlY3JldCB0aGF0IE1ha2VfY3JlZGVudGlhbCBjcmVhdGVkIGFuZCBzaW5jZSB3ZSBhbHJlYWR5
IGhhdmUgdGhlIEVLIGFuZCBBSyBrZXlzIGxvYWRlZCBpbiB0aGUgVFBNLCB3ZSBkb24mIzM5O3Qg
aGF2ZSB0byBkbyBhbnl0aGluZyBlbHNlIG90aGVyIHRoYW4gcGFzcyB0aGUgMiBvdXRwdXRzIG9m
IE1ha2VDcmVkZW50aWFsPzwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48
ZGl2PkNvcnJlY3QuPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0i
bWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIw
NCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48YmxvY2tx
dW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+
PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIg
c3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdi
KDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj48ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwy
MDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9y
ZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+Cjwv
YmxvY2txdW90ZT48L2Rpdj4KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pgo8L2Jsb2NrcXVvdGU+
PC9kaXY+CjwvYmxvY2txdW90ZT48L2Rpdj4KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pgo=

--===============5568006605933078906==--

