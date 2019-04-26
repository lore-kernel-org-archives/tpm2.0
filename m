Content-Type: multipart/mixed; boundary="===============4898185338211551144=="
MIME-Version: 1.0
From: Nick Meyer <nimeyer at verizonmedia.com>
Subject: [tpm2] RC 0x99d TPM_RC_POLICY_FAIL causes?
Date: Fri, 26 Apr 2019 11:55:44 -0500
Message-ID: <CAO6U=OYYpk3+92QD_hKnX7g+QP-=fosE3zeYx2KDp6zfy=JYyw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4898185338211551144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

We have a set of boxes that use TPM2_Sign() to sign a cryptographic
challenge during a startup process. The signing key is protected by a PCR
policy; this policy is the only policy in the session authorizing the sign.
Occasionally, one of these boxes will start returning 0x99d and refuse to
sign the challenge, after which it seems to be stuck in this inconsistent
state until we generate a new signing key.

We are currently in the process of investigating if the PCRs have changed
in these cases; in the meantime, I wanted to ask here if there are any
other causes beyond the PCRs changing that could cause this error code, so
that we can investigate. We also believe it unlikely that the PCR update
counter is an issue as we would be expecting a TPM_RC_PCR_CHANGED return
code in this case.

Appreciate any insight you may have.

<http://www.verizonmedia.com>

Nick Meyer

--===============4898185338211551144==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGVsbG8sPGRpdj48YnI+PC9kaXY+PGRpdj5XZSBoYXZlIGEgc2V0IG9m
IGJveGVzIHRoYXQgdXNlIFRQTTJfU2lnbigpIHRvIHNpZ24gYSBjcnlwdG9ncmFwaGljIGNoYWxs
ZW5nZSBkdXJpbmcgYSBzdGFydHVwIHByb2Nlc3MuIFRoZSBzaWduaW5nIGtleSBpcyBwcm90ZWN0
ZWQgYnkgYSBQQ1IgcG9saWN5OyB0aGlzIHBvbGljeSBpcyB0aGUgb25seSBwb2xpY3kgaW4gdGhl
IHNlc3Npb24gYXV0aG9yaXppbmcgdGhlIHNpZ24uIE9jY2FzaW9uYWxseSwgb25lIG9mIHRoZXNl
IGJveGVzIHdpbGwgc3RhcnQgcmV0dXJuaW5nIDB4OTlkIGFuZCByZWZ1c2UgdG8gc2lnbiB0aGUg
Y2hhbGxlbmdlLCBhZnRlciB3aGljaCBpdCBzZWVtcyB0byBiZSBzdHVjayBpbiB0aGlzIGluY29u
c2lzdGVudCBzdGF0ZSB1bnRpbCB3ZSBnZW5lcmF0ZSBhIG5ldyBzaWduaW5nIGtleS48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PldlIGFyZSBjdXJyZW50bHkgaW4gdGhlIHByb2Nlc3Mgb2YgaW52
ZXN0aWdhdGluZyBpZiB0aGUgUENScyBoYXZlIGNoYW5nZWQgaW4gdGhlc2UgY2FzZXM7IGluIHRo
ZSBtZWFudGltZSwgSSB3YW50ZWQgdG8gYXNrIGhlcmUgaWYgdGhlcmUgYXJlIGFueSBvdGhlciBj
YXVzZXMgYmV5b25kIHRoZSBQQ1JzIGNoYW5naW5nIHRoYXQgY291bGQgY2F1c2UgdGhpcyBlcnJv
ciBjb2RlLCBzbyB0aGF0IHdlIGNhbiBpbnZlc3RpZ2F0ZS4gV2UgYWxzbyBiZWxpZXZlIGl0IHVu
bGlrZWx5IHRoYXQgdGhlIFBDUiB1cGRhdGUgY291bnRlciBpcyBhbiBpc3N1ZSBhcyB3ZSB3b3Vs
ZCBiZSBleHBlY3RpbmcgYSBUUE1fUkNfUENSX0NIQU5HRUQgcmV0dXJuIGNvZGUgaW4gdGhpcyBj
YXNlLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QXBwcmVjaWF0ZSBhbnkgaW5zaWdodCB5b3Ug
bWF5IGhhdmUuPC9kaXY+PGRpdj48YnIgY2xlYXI9ImFsbCI+PGRpdj48ZGl2IGRpcj0ibHRyIiBj
bGFzcz0iZ21haWxfc2lnbmF0dXJlIiBkYXRhLXNtYXJ0bWFpbD0iZ21haWxfc2lnbmF0dXJlIj48
YSBocmVmPSJodHRwOi8vd3d3LnZlcml6b25tZWRpYS5jb20iIHN0eWxlPSJwYWRkaW5nLWJvdHRv
bToxZW07ZGlzcGxheTppbmxpbmUtYmxvY2siIHRhcmdldD0iX2JsYW5rIj48aW1nIHNyYz0iaHR0
cHM6Ly9zLnlpbWcuY29tL2N2L2FwaXYyL2RlZmF1bHQvMjAxOTA0MTYvdmVyaXpvbm1lZGlhX2Vt
YWlsc2lnXzQwMHg4OS5qcGciIHN0eWxlPSJoZWlnaHQ6MzNweDt3aWR0aDoxNDVweCIgd2lkdGg9
IjE0NSIgaGVpZ2h0PSIzMyI+PC9hPjxicj48cCBzdHlsZT0ibWFyZ2luOjBweDtmb250LWZhbWls
eTomIzM5O1Zlcml6b24gTkhHIERTJiMzOTssQXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6MWVt
O3RleHQtYWxpZ246bGVmdDtsaW5lLWhlaWdodDoxMDAlO2NvbG9yOmJsYWNrIj48c3BhbiBzdHls
ZT0iZm9udC13ZWlnaHQ6Ym9sZCI+TmljayBNZXllcjwvc3Bhbj48YnI+PGJyPjwvcD48L2Rpdj48
L2Rpdj48L2Rpdj48L2Rpdj4K

--===============4898185338211551144==--

