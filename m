Content-Type: multipart/mixed; boundary="===============1112536205340980526=="
MIME-Version: 1.0
From: Sourajit Mukhopadhyay <smukho16 at gmail.com>
Subject: [tpm2] Esys_CreatePrimary works with Simulator but failing with
 /dev/tpm0
Date: Wed, 05 Dec 2018 14:57:36 +0100
Message-ID: <CANva-dx3YeKbR198PRw2O362C2HHAVTb-70n95EeR-85X+qb8A@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1112536205340980526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear team,

I am trying to create a primary key using Esys_CreatePrimary. The code
works without any issues when trying on the simulator, but fails when
trying on a hardware TPM using /dev/tpm0

The error I am getting is:
WARNING:esys:src/tss2-esys/api/Esys_CreatePrimary.c:423:Esys_CreatePrimary_=
Finish()
Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_CreatePrimary.c:164:Esys_CreatePrimary()
Esys Finish ErrorCode (0x000001c2)
Esys_CreatePrimary fail

Can someone point out why I am getting this error? So far I am unable to
pinpoint the problem.

Best regards,
Sourajit Mukhopadhyay

--===============1112536205340980526==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+RGVhciB0ZWFtLDxk
aXY+PGJyPjwvZGl2PjxkaXY+SSBhbSB0cnlpbmcgdG8gY3JlYXRlIGEgcHJpbWFyeSBrZXkgdXNp
bmcgRXN5c19DcmVhdGVQcmltYXJ5LiBUaGUgY29kZSB3b3JrcyB3aXRob3V0IGFueSBpc3N1ZXMg
d2hlbiB0cnlpbmcgb24gdGhlIHNpbXVsYXRvciwgYnV0IGZhaWxzIHdoZW4gdHJ5aW5nIG9uIGEg
aGFyZHdhcmUgVFBNIHVzaW5nIC9kZXYvdHBtMMKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5U
aGUgZXJyb3IgSSBhbSBnZXR0aW5nIGlzOjwvZGl2PjxkaXY+PGRpdj5XQVJOSU5HOmVzeXM6c3Jj
L3RzczItZXN5cy9hcGkvRXN5c19DcmVhdGVQcmltYXJ5LmM6NDIzOkVzeXNfQ3JlYXRlUHJpbWFy
eV9GaW5pc2goKSBSZWNlaXZlZCBUUE0gRXJyb3LCoDwvZGl2PjxkaXY+RVJST1I6ZXN5czpzcmMv
dHNzMi1lc3lzL2FwaS9Fc3lzX0NyZWF0ZVByaW1hcnkuYzoxNjQ6RXN5c19DcmVhdGVQcmltYXJ5
KCkgRXN5cyBGaW5pc2ggRXJyb3JDb2RlICgweDAwMDAwMWMyKcKgPC9kaXY+PGRpdj5Fc3lzX0Ny
ZWF0ZVByaW1hcnkgZmFpbDwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Q2FuIHNvbWVv
bmUgcG9pbnQgb3V0IHdoeSBJIGFtIGdldHRpbmfCoHRoaXMgZXJyb3I/IFNvIGZhciBJIGFtIHVu
YWJsZSB0byBwaW5wb2ludCB0aGXCoHByb2JsZW0uPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5C
ZXN0IHJlZ2FyZHMsPC9kaXY+PGRpdj5Tb3VyYWppdCBNdWtob3BhZGh5YXk8L2Rpdj48L2Rpdj48
L2Rpdj48L2Rpdj4K

--===============1112536205340980526==--

