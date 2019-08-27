Content-Type: multipart/mixed; boundary="===============5226521002475120990=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] Creating a TPM EK Public object at the server
Date: Tue, 27 Aug 2019 11:21:11 -0700
Message-ID: <CANKkrzE759ifm5iGWgresC8HbOy+B8vEptf_J=QQrvVhWLuTbg@mail.gmail.com>
In-Reply-To: CAP3jAwRgHb4UCEQS9Dqa0LvmKyPX_AB64F-wujSyuLg9P6Ao1A@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5226521002475120990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2019, 11:01 AM Rahul Hardikar <rahulhardikar(a)gmail.com>
wrote:

> 1. Do we need to also copy the standard AuthPolicy digest into the
> structure too? This is definitely needed in TPM to recreate the EK but do
> we need it for make_credential_external?
>

Conceptually, the "Make Credential" operation just needs to know the EK's
public key and encryption scheme details (eg, SHA256 and AES-128-OFB).

It's assumed that the auth policy is appropriate, since the TPM
manufacturer certified the public key (and like you said, the EK can't be
regenerated with a different policy); and you can assume the policy is
satisfiable, because otherwise the EK can't be used to decrypt the
credential blob.

The tpm2_makecredential tool takes the EK's "public" structure as input
(which does include auth policy) though because it's an easy way to get the
public key and encryption scheme details all in one package.

See usage example at
https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_activatecr=
edential.1.md#examples

2. The EKCert is in ASN.1 DER format which i convert to PEM, is it okay to
> copy it directly or do I need to convert it to some other format and then
> copy the ek public key?
>

tpm2_makecredential doesn't use the EK certificate. It's expected that you
validate that separately, and then match it against the public key
contained in the EK's "pubic" data.

>

--===============5226521002475120990==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIiBkaXI9ImF1dG8iPjxkaXYg
ZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIEF1ZyAyNywgMjAxOSwgMTE6MDEg
QU0gUmFodWwgSGFyZGlrYXIgJmx0OzxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWls
LmNvbSI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8L2Rpdj48YmxvY2tx
dW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXIt
bGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj48ZGl2
PjEuIERvIHdlIG5lZWQgdG8gYWxzbyBjb3B5IHRoZSBzdGFuZGFyZCBBdXRoUG9saWN5IGRpZ2Vz
dCBpbnRvIHRoZSBzdHJ1Y3R1cmUgdG9vPyBUaGlzIGlzIGRlZmluaXRlbHkgbmVlZGVkIGluIFRQ
TSB0byByZWNyZWF0ZSB0aGUgRUsgYnV0IGRvIHdlIG5lZWQgaXQgZm9yIG1ha2VfY3JlZGVudGlh
bF9leHRlcm5hbD88L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PGRpdiBkaXI9ImF1dG8i
Pjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+Q29uY2VwdHVhbGx5LCB0aGUgJnF1b3Q7TWFrZSBD
cmVkZW50aWFsJnF1b3Q7IG9wZXJhdGlvbiBqdXN0IG5lZWRzIHRvIGtub3cgdGhlIEVLJiMzOTtz
IHB1YmxpYyBrZXkgYW5kIGVuY3J5cHRpb24gc2NoZW1lIGRldGFpbHMgKGVnLCBTSEEyNTYgYW5k
IEFFUy0xMjgtT0ZCKS48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJh
dXRvIj5JdCYjMzk7cyBhc3N1bWVkIHRoYXQgdGhlIGF1dGggcG9saWN5IGlzIGFwcHJvcHJpYXRl
LCBzaW5jZSB0aGUgVFBNIG1hbnVmYWN0dXJlciBjZXJ0aWZpZWQgdGhlIHB1YmxpYyBrZXkgKGFu
ZCBsaWtlIHlvdSBzYWlkLCB0aGUgRUsgY2FuJiMzOTt0IGJlIHJlZ2VuZXJhdGVkIHdpdGggYSBk
aWZmZXJlbnQgcG9saWN5KTsgYW5kIHlvdSBjYW4gYXNzdW1lIHRoZSBwb2xpY3kgaXMgc2F0aXNm
aWFibGUsIGJlY2F1c2Ugb3RoZXJ3aXNlIHRoZSBFSyBjYW4mIzM5O3QgYmUgdXNlZCB0byBkZWNy
eXB0IHRoZSBjcmVkZW50aWFsIGJsb2IuPC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48
ZGl2IGRpcj0iYXV0byI+VGhlIHRwbTJfbWFrZWNyZWRlbnRpYWwgdG9vbCB0YWtlcyB0aGUgRUsm
IzM5O3MgJnF1b3Q7cHVibGljJnF1b3Q7IHN0cnVjdHVyZSBhcyBpbnB1dCAod2hpY2ggZG9lcyBp
bmNsdWRlIGF1dGggcG9saWN5KSB0aG91Z2ggYmVjYXVzZSBpdCYjMzk7cyBhbiBlYXN5IHdheSB0
byBnZXQgdGhlIHB1YmxpYyBrZXkgYW5kIGVuY3J5cHRpb24gc2NoZW1lIGRldGFpbHMgYWxsIGlu
IG9uZSBwYWNrYWdlLjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1
dG8iPlNlZSB1c2FnZSBleGFtcGxlIGF0wqA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBt
Mi1zb2Z0d2FyZS90cG0yLXRvb2xzL2Jsb2IvbWFzdGVyL21hbi90cG0yX2FjdGl2YXRlY3JlZGVu
dGlhbC4xLm1kI2V4YW1wbGVzIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0y
LXRvb2xzL2Jsb2IvbWFzdGVyL21hbi90cG0yX2FjdGl2YXRlY3JlZGVudGlhbC4xLm1kI2V4YW1w
bGVzPC9hPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxf
cXVvdGUiIGRpcj0iYXV0byI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0i
bWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0
OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRpdj4yLiBUaGUgRUtDZXJ0IGlzIGluIEFTTi4xIERFUiBm
b3JtYXQgd2hpY2ggaSBjb252ZXJ0IHRvIFBFTSwgaXMgaXQgb2theSB0byBjb3B5IGl0IGRpcmVj
dGx5IG9yIGRvIEkgbmVlZCB0byBjb252ZXJ0IGl0IHRvIHNvbWUgb3RoZXIgZm9ybWF0IGFuZCB0
aGVuIGNvcHkgdGhlIGVrIHB1YmxpYyBrZXk/PC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjwvZGl2
PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPnRwbTJfbWFrZWNyZWRl
bnRpYWwgZG9lc24mIzM5O3QgdXNlIHRoZSBFSyBjZXJ0aWZpY2F0ZS4gSXQmIzM5O3MgZXhwZWN0
ZWQgdGhhdCB5b3UgdmFsaWRhdGUgdGhhdCBzZXBhcmF0ZWx5LCBhbmQgdGhlbiBtYXRjaCBpdCBh
Z2FpbnN0IHRoZSBwdWJsaWMga2V5IGNvbnRhaW5lZCBpbiB0aGUgRUsmIzM5O3MgJnF1b3Q7cHVi
aWMmcXVvdDsgZGF0YS48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSIgZGlyPSJhdXRvIj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDti
b3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KPC9ibG9ja3F1b3Rl
PjwvZGl2PjwvZGl2Pgo=

--===============5226521002475120990==--

