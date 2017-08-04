Content-Type: multipart/mixed; boundary="===============5014395031183929918=="
MIME-Version: 1.0
From: =?utf-8?q?Kh=C3=A1nh_Nguy=E1=BB=85n_=3Ckhanhnt=2E56_at_gmail=2Ecom=3E?=
Subject: [tpm2] How to use PolicyAuthorize for flexiable PCR policy?
Date: Sat, 05 Aug 2017 01:31:53 +0700
Message-ID: <CAMGQdGLUHXGwm406npDH9qNqPZHWGSuDoD-jS9=inHh2Tu0okA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5014395031183929918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,
I have read in A Practical Guide to TPM 2.0 book, there is a example about
policy for flexible PCRs. Thay said use PolicyAuthorize in case use NVIndex
hold full disk encryption key. I confused about how to use PolicyAuthorize,
so I ask a man in github, he answer but I still not total clear.
Can you list all step use of PolicyAuthorize or give me a example code?
This is that I understand about use of PolicyAuthorize, can you correct me?
- When define new NVIndex:
    + Use TPM create sign key
    + Create a trail session
    + Call PolicyAuthorize with input is sign key
    + Get policydigest and call NVDefineIndex with policydigest.
- When use NVIndex (read or write):
    + Create trail session, call PolicyPCR, call GetDigest to get a
policydigest1
    + Sign policydigest1 with sign key
    + VerifySignature with input is sign key, signature, sign key and get a
ticket
    + Pass ticket, sign key name, policydigest1 to PolicyAuthorize, if all
thing right, policy session->policydigest will change to policydigest
    + Use that policydigest to use with NVIndex.

Thank you!

--===============5014395031183929918==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGkgYWxsLDxkaXY+SSBoYXZlIHJlYWQgaW4gQSBQcmFjdGljYWwgR3Vp
ZGUgdG8gVFBNIDIuMCBib29rLCB0aGVyZSBpcyBhIGV4YW1wbGUgYWJvdXQgcG9saWN5IGZvciBm
bGV4aWJsZSBQQ1JzLiBUaGF5IHNhaWQgdXNlIFBvbGljeUF1dGhvcml6ZSBpbiBjYXNlIHVzZSBO
VkluZGV4IGhvbGQgZnVsbCBkaXNrIGVuY3J5cHRpb24ga2V5LiBJIGNvbmZ1c2VkIGFib3V0IGhv
dyB0byB1c2UgUG9saWN5QXV0aG9yaXplLCBzbyBJIGFzayBhIG1hbiBpbiBnaXRodWIsIGhlIGFu
c3dlciBidXQgSSBzdGlsbCBub3QgdG90YWwgY2xlYXIuPC9kaXY+PGRpdj5DYW4geW91IGxpc3Qg
YWxsIHN0ZXAgdXNlIG9mIFBvbGljeUF1dGhvcml6ZSBvciBnaXZlIG1lIGEgZXhhbXBsZSBjb2Rl
PzwvZGl2PjxkaXY+VGhpcyBpcyB0aGF0IEkgdW5kZXJzdGFuZCBhYm91dCB1c2Ugb2YgUG9saWN5
QXV0aG9yaXplLCBjYW4geW91IGNvcnJlY3QgbWU/PC9kaXY+PGRpdj4tIFdoZW4gZGVmaW5lIG5l
dyBOVkluZGV4OjwvZGl2PjxkaXY+wqAgwqAgKyBVc2UgVFBNIGNyZWF0ZSBzaWduIGtleTwvZGl2
PjxkaXY+wqAgwqAgKyBDcmVhdGUgYSB0cmFpbCBzZXNzaW9uPC9kaXY+PGRpdj7CoCDCoCArIENh
bGwgUG9saWN5QXV0aG9yaXplIHdpdGggaW5wdXQgaXMgc2lnbiBrZXk8L2Rpdj48ZGl2PsKgIMKg
ICsgR2V0IHBvbGljeWRpZ2VzdCBhbmQgY2FsbCBOVkRlZmluZUluZGV4IHdpdGggcG9saWN5ZGln
ZXN0LjwvZGl2PjxkaXY+LSBXaGVuIHVzZSBOVkluZGV4IChyZWFkIG9yIHdyaXRlKTo8L2Rpdj48
ZGl2PsKgIMKgICsgQ3JlYXRlIHRyYWlsIHNlc3Npb24sIGNhbGwgUG9saWN5UENSLCBjYWxsIEdl
dERpZ2VzdCB0byBnZXQgYSBwb2xpY3lkaWdlc3QxPC9kaXY+PGRpdj7CoCDCoCArIFNpZ24gcG9s
aWN5ZGlnZXN0MSB3aXRoIHNpZ24ga2V5PC9kaXY+PGRpdj7CoCDCoCArIFZlcmlmeVNpZ25hdHVy
ZSB3aXRoIGlucHV0IGlzIHNpZ24ga2V5LCBzaWduYXR1cmUsIHNpZ24ga2V5IGFuZCBnZXQgYSB0
aWNrZXQ8L2Rpdj48ZGl2PsKgIMKgICsgUGFzcyB0aWNrZXQsIHNpZ24ga2V5IG5hbWUsIHBvbGlj
eWRpZ2VzdDEgdG8gUG9saWN5QXV0aG9yaXplLCBpZiBhbGwgdGhpbmcgcmlnaHQsIHBvbGljeSBz
ZXNzaW9uLSZndDtwb2xpY3lkaWdlc3Qgd2lsbCBjaGFuZ2UgdG8gcG9saWN5ZGlnZXN0PC9kaXY+
PGRpdj7CoCDCoCArIFVzZSB0aGF0IHBvbGljeWRpZ2VzdCB0byB1c2Ugd2l0aCBOVkluZGV4Ljwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmsgeW91ITwvZGl2PjxkaXY+PGJyPjwvZGl2Pjwv
ZGl2Pgo=

--===============5014395031183929918==--

