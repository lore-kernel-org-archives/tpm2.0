Content-Type: multipart/mixed; boundary="===============5831304543891503332=="
MIME-Version: 1.0
From: Ashok Kumar <ashokar.1980 at gmail.com>
Subject: [tpm2] Using TPM to protect private key
Date: Wed, 11 Sep 2019 17:04:18 +0530
Message-ID: <CAE8e83SGvJDQhGuHuSUH-ngVk4GkbergqfP-qA3z8roptkZW7w@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5831304543891503332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

We are planning to use TPM2.0 to protect private key for the certificate.
Need your help to understand/clarify the following.

1) What is the proper way to protect the private key using TPM?

2) Shall we just encrypt the private-key using the TPM? In that case,
     if somebody has root access, then they can execute a tool which can
send
     command to TPM in order to decrypt the private-key. That is still
vulnerable.
     Am I missing something?

3) Are there any abstract API which would work for both TPM1.2 or TPM2.0?
    Or, application (or wrapper API) needs to call hardware specific
library functions?

4) If there are any good document or write-ups about things-to-do to make
use of
    TPM2 functionality in application code (especially to protect private
keys),
     that will be very helpful.

5) We are using Ubuntu 18.04 LTS. What are all the packages (and
dependencies)
     we need to install?

     I see that tss2 package is available in 18.04. But not sure which
package has
     the resource manager. Also, if I want to test with simulator, should
we use
     the one provided by IBM?
     Another TPM2 stack (from Intel) is available in github (tpm2-tss).
Which one
     is better to use in Ubuntu 18.04 LTS.

Regards,
Ashok Kumar

--===============5831304543891503332==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGksPGRpdj48YnI+PC9kaXY+PGRpdj5XZSBhcmUgcGxhbm5pbmcgdG8g
dXNlIFRQTTIuMCB0byBwcm90ZWN0IHByaXZhdGUga2V5IGZvciB0aGUgY2VydGlmaWNhdGUuPC9k
aXY+PGRpdj5OZWVkIHlvdXIgaGVscCB0byB1bmRlcnN0YW5kL2NsYXJpZnkgdGhlIGZvbGxvd2lu
Zy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjEpIFdoYXQgaXMgdGhlIHByb3BlciB3YXkgdG8g
cHJvdGVjdCB0aGUgcHJpdmF0ZSBrZXkgdXNpbmcgVFBNPzwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+MikgU2hhbGwgd2UganVzdCBlbmNyeXB0IHRoZSBwcml2YXRlLWtleSB1c2luZyB0aGUgVFBN
PyBJbiB0aGF0IGNhc2UsPC9kaXY+PGRpdj7CoCDCoCDCoGlmIHNvbWVib2R5IGhhcyByb290IGFj
Y2VzcywgdGhlbiB0aGV5IGNhbiBleGVjdXRlwqBhIHRvb2wgd2hpY2ggY2FuIHNlbmQ8L2Rpdj48
ZGl2PsKgIMKgIMKgY29tbWFuZCB0byBUUE0gaW4gb3JkZXIgdG8gZGVjcnlwdCB0aGUgcHJpdmF0
ZS1rZXkuIFRoYXQgaXMgc3RpbGwgdnVsbmVyYWJsZS48L2Rpdj48ZGl2PsKgIMKgIMKgQW0gSSBt
aXNzaW5nIHNvbWV0aGluZz88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjMpIEFyZSB0aGVyZSBh
bnkgYWJzdHJhY3QgQVBJIHdoaWNoIHdvdWxkIHdvcmsgZm9yIGJvdGggVFBNMS4yIG9yIFRQTTIu
MD88L2Rpdj48ZGl2PsKgIMKgIE9yLCBhcHBsaWNhdGlvbiAob3Igd3JhcHBlciBBUEkpIG5lZWRz
IHRvIGNhbGwgaGFyZHdhcmUgc3BlY2lmaWMgbGlicmFyeSBmdW5jdGlvbnM/PC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj40KSBJZiB0aGVyZSBhcmUgYW55IGdvb2QgZG9jdW1lbnQgb3Igd3JpdGUt
dXBzIGFib3V0IHRoaW5ncy10by1kbyB0byBtYWtlIHVzZSBvZjwvZGl2PjxkaXY+wqAgwqAgVFBN
MiBmdW5jdGlvbmFsaXR5IGluIGFwcGxpY2F0aW9uIGNvZGUgKGVzcGVjaWFsbHkgdG8gcHJvdGVj
dCBwcml2YXRlIGtleXMpLDwvZGl2PjxkaXY+wqAgwqAgwqB0aGF0IHdpbGwgYmUgdmVyeSBoZWxw
ZnVsLsKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2PjUpIFdlIGFyZSB1c2luZyBVYnVu
dHUgMTguMDQgTFRTLiBXaGF0IGFyZSBhbGwgdGhlIHBhY2thZ2VzIChhbmQgZGVwZW5kZW5jaWVz
KTwvZGl2PjxkaXY+wqAgwqAgwqB3ZSBuZWVkIHRvIGluc3RhbGw/PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj7CoCDCoCDCoEkgc2VlIHRoYXQgdHNzMiBwYWNrYWdlIGlzIGF2YWlsYWJsZSBpbiAx
OC4wNC4gQnV0IG5vdCBzdXJlIHdoaWNoIHBhY2thZ2UgaGFzPC9kaXY+PGRpdj7CoCDCoCDCoHRo
ZSByZXNvdXJjZSBtYW5hZ2VyLiBBbHNvLCBpZiBJIHdhbnQgdG8gdGVzdCB3aXRoIHNpbXVsYXRv
ciwgc2hvdWxkIHdlIHVzZTwvZGl2PjxkaXY+wqAgwqAgwqB0aGUgb25lIHByb3ZpZGVkIGJ5IElC
TT88L2Rpdj48ZGl2PsKgIMKgIMKgQW5vdGhlciBUUE0yIHN0YWNrIChmcm9tIEludGVsKSBpcyBh
dmFpbGFibGUgaW4gZ2l0aHViICh0cG0yLXRzcykuIFdoaWNoIG9uZTwvZGl2PjwvZGl2PjxkaXY+
wqAgwqAgwqBpcyBiZXR0ZXIgdG8gdXNlIGluIFVidW50dSAxOC4wNCBMVFMuPC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfc2lnbmF0dXJlIiBkYXRh
LXNtYXJ0bWFpbD0iZ21haWxfc2lnbmF0dXJlIj48ZGl2IGRpcj0ibHRyIj5SZWdhcmRzLDxkaXY+
QXNob2sgS3VtYXI8L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============5831304543891503332==--

