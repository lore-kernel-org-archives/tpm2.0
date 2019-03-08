Content-Type: multipart/mixed; boundary="===============3629869961071485513=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Attestation CA (privacy CA) example
Date: Fri, 08 Mar 2019 11:31:05 -0800
Message-ID: <CAP3jAwRXnm6=NQ=FXR6nHBSLwdQLeqqEFKxnwKtiPQ-jVhBEhw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3629869961071485513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi All,
I'm working on doing something very similar to this but with TPM2.0
https://github.com/srajiv/testsuite/blob/master/tcg/highlevel/tpm/Tspi_TPM_=
CreateIdentity.c

Are there an examples for this using TCG TSS2.0 (not the IBMs TSS
version).  The TPM structures/ commands are so different between the 2
versions that I cannot reuse  anything also the AIK Enrollment with privacy
CA is quite different between TPM1.2 and TPM2.0. (for example, in 1.2, the
blob is encrypted with CA's pub key which is not present in 2.0)

I'm looking for some thing like this:
https://ebrary.net/24760/computer_science/privacy

Any suggestions?
Thanks,
Rahul

--===============3629869961071485513==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGkgQWxsLDxkaXY+
SSYjMzk7bSB3b3JraW5nIG9uIGRvaW5nIHNvbWV0aGluZyB2ZXJ5IHNpbWlsYXIgdG8gdGhpcyBi
dXQgd2l0aCBUUE0yLjA8L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9zcmFq
aXYvdGVzdHN1aXRlL2Jsb2IvbWFzdGVyL3RjZy9oaWdobGV2ZWwvdHBtL1RzcGlfVFBNX0NyZWF0
ZUlkZW50aXR5LmMiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vc3Jhaml2L3Rl
c3RzdWl0ZS9ibG9iL21hc3Rlci90Y2cvaGlnaGxldmVsL3RwbS9Uc3BpX1RQTV9DcmVhdGVJZGVu
dGl0eS5jPC9hPjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFyZSB0aGVyZSBhbiBleGFt
cGxlcyBmb3IgdGhpcyB1c2luZyBUQ0cgVFNTMi4wIChub3QgdGhlIElCTXMgVFNTIHZlcnNpb24p
LsKgIFRoZSBUUE0gc3RydWN0dXJlcy8gY29tbWFuZHMgYXJlIHNvIGRpZmZlcmVudCBiZXR3ZWVu
IHRoZSAyIHZlcnNpb25zIHRoYXQgSSBjYW5ub3QgcmV1c2UgwqBhbnl0aGluZyBhbHNvIHRoZSBB
SUsgRW5yb2xsbWVudCB3aXRoIHByaXZhY3kgQ0EgaXMgcXVpdGUgZGlmZmVyZW50IGJldHdlZW4g
VFBNMS4yIGFuZCBUUE0yLjAuIChmb3IgZXhhbXBsZSwgaW4gMS4yLCB0aGUgYmxvYiBpcyBlbmNy
eXB0ZWQgd2l0aCBDQSYjMzk7cyBwdWIga2V5IHdoaWNoIGlzIG5vdCBwcmVzZW50IGluIDIuMCk8
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5O20gbG9va2luZyBmb3Igc29tZSB0aGluZyBs
aWtlIHRoaXM6PC9kaXY+PGRpdj48YSBocmVmPSJodHRwczovL2VicmFyeS5uZXQvMjQ3NjAvY29t
cHV0ZXJfc2NpZW5jZS9wcml2YWN5Ij5odHRwczovL2VicmFyeS5uZXQvMjQ3NjAvY29tcHV0ZXJf
c2NpZW5jZS9wcml2YWN5PC9hPjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFueSBzdWdn
ZXN0aW9ucz88L2Rpdj48ZGl2PlRoYW5rcyw8L2Rpdj48ZGl2PlJhaHVsPC9kaXY+PC9kaXY+PC9k
aXY+PC9kaXY+Cg==

--===============3629869961071485513==--

