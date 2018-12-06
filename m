Content-Type: multipart/mixed; boundary="===============1665252320800346619=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Esys_CreatePrimary works with Simulator but failing with
 /dev/tpm0
Date: Thu, 06 Dec 2018 10:46:29 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D014B465909@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: CANva-dx3YeKbR198PRw2O362C2HHAVTb-70n95EeR-85X+qb8A@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1665252320800346619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

as Philip mentioned:
$ tpm2_rc_decode 0x1c2
tpm:parameter(1):inconsistent attributes

This means that the combination of attributes inside your inPublic field do=
 not fit together.
That can be the case the physical TPMs implement "only" the PC-Client TPM P=
rofile, which is a subset of all functions defined in the TPM library speci=
fication, whilst the simulator implements them all. Most notably these are =
Hashes and EC-Curves, where pTPMs usually only support up to SHA384 and P25=
6+P384, whilst the simulator has many more algorithms.
In some rare cases it is also a bug due to the pTPM being rev 1.16 whilst t=
he simulator is rev 1.38, but that's pretty rare.

Maybe compare your inPublic to the integration tests. They were all run aga=
inst physical TPMs.
Or post your inPublic declaration and we can point something out.

Good luck,
Andreas
________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Sourajit Mukhopadhyay=
 [smukho16(a)gmail.com]
Sent: Wednesday, December 05, 2018 14:57
To: tpm2(a)lists.01.org
Subject: [tpm2] Esys_CreatePrimary works with Simulator but failing with /d=
ev/tpm0

Dear team,

I am trying to create a primary key using Esys_CreatePrimary. The code work=
s without any issues when trying on the simulator, but fails when trying on=
 a hardware TPM using /dev/tpm0

The error I am getting is:
WARNING:esys:src/tss2-esys/api/Esys_CreatePrimary.c:423:Esys_CreatePrimary_=
Finish() Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_CreatePrimary.c:164:Esys_CreatePrimary() =
Esys Finish ErrorCode (0x000001c2)
Esys_CreatePrimary fail

Can someone point out why I am getting this error? So far I am unable to pi=
npoint the problem.

Best regards,
Sourajit Mukhopadhyay

--===============1665252320800346619==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+UCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9
PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBmcHN0eWxlPSIxIiBvY3NpPSIwIj4KPGRpdiBzdHlsZT0i
ZGlyZWN0aW9uOiBsdHI7Zm9udC1mYW1pbHk6IFRhaG9tYTtjb2xvcjogIzAwMDAwMDtmb250LXNp
emU6IDEwcHQ7Ij4KPGRpdj5IaSw8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PmFzIFBoaWxp
cCBtZW50aW9uZWQ6PC9kaXY+CjxkaXY+JCB0cG0yX3JjX2RlY29kZSAweDFjMjxicj4KdHBtOnBh
cmFtZXRlcigxKTppbmNvbnNpc3RlbnQgYXR0cmlidXRlczxicj4KPC9kaXY+CjxkaXY+PGJyPgo8
L2Rpdj4KPGRpdj5UaGlzIG1lYW5zIHRoYXQgdGhlIGNvbWJpbmF0aW9uIG9mIGF0dHJpYnV0ZXMg
aW5zaWRlIHlvdXIgaW5QdWJsaWMgZmllbGQgZG8gbm90IGZpdCB0b2dldGhlci48L2Rpdj4KPGRp
dj5UaGF0IGNhbiBiZSB0aGUgY2FzZSB0aGUgcGh5c2ljYWwgVFBNcyBpbXBsZW1lbnQgJnF1b3Q7
b25seSZxdW90OyB0aGUgUEMtQ2xpZW50IFRQTSBQcm9maWxlLCB3aGljaCBpcyBhIHN1YnNldCBv
ZiBhbGwgZnVuY3Rpb25zIGRlZmluZWQgaW4gdGhlIFRQTSBsaWJyYXJ5IHNwZWNpZmljYXRpb24s
IHdoaWxzdCB0aGUgc2ltdWxhdG9yIGltcGxlbWVudHMgdGhlbSBhbGwuIE1vc3Qgbm90YWJseSB0
aGVzZSBhcmUgSGFzaGVzIGFuZCBFQy1DdXJ2ZXMsIHdoZXJlCiBwVFBNcyB1c3VhbGx5IG9ubHkg
c3VwcG9ydCB1cCB0byBTSEEzODQgYW5kIFAyNTYmIzQzO1AzODQsIHdoaWxzdCB0aGUgc2ltdWxh
dG9yIGhhcyBtYW55IG1vcmUgYWxnb3JpdGhtcy48L2Rpdj4KPGRpdj5JbiBzb21lIHJhcmUgY2Fz
ZXMgaXQgaXMgYWxzbyBhIGJ1ZyBkdWUgdG8gdGhlIHBUUE0gYmVpbmcgcmV2IDEuMTYgd2hpbHN0
IHRoZSBzaW11bGF0b3IgaXMgcmV2IDEuMzgsIGJ1dCB0aGF0J3MgcHJldHR5IHJhcmUuPGJyPgo8
L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pk1heWJlIGNvbXBhcmUgeW91ciBpblB1YmxpYyB0
byB0aGUgaW50ZWdyYXRpb24gdGVzdHMuIFRoZXkgd2VyZSBhbGwgcnVuIGFnYWluc3QgcGh5c2lj
YWwgVFBNcy48L2Rpdj4KPGRpdj5PciBwb3N0IHlvdXIgaW5QdWJsaWMgZGVjbGFyYXRpb24gYW5k
IHdlIGNhbiBwb2ludCBzb21ldGhpbmcgb3V0LjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+
R29vZCBsdWNrLDwvZGl2Pgo8ZGl2PkFuZHJlYXM8YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250
LWZhbWlseTogVGltZXMgTmV3IFJvbWFuOyBjb2xvcjogIzAwMDAwMDsgZm9udC1zaXplOiAxNnB4
Ij4KPGhyIHRhYmluZGV4PSItMSI+CjxkaXYgaWQ9ImRpdlJwRjc2MTc4NiIgc3R5bGU9ImRpcmVj
dGlvbjogbHRyOyI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iVGFob21hIiBjb2xvcj0iIzAwMDAwMCI+
PGI+RnJvbTo8L2I+IHRwbTIgW3RwbTItYm91bmNlc0BsaXN0cy4wMS5vcmddIG9uIGJlaGFsZiBv
ZiBTb3VyYWppdCBNdWtob3BhZGh5YXkgW3NtdWtobzE2QGdtYWlsLmNvbV08YnI+CjxiPlNlbnQ6
PC9iPiBXZWRuZXNkYXksIERlY2VtYmVyIDA1LCAyMDE4IDE0OjU3PGJyPgo8Yj5Ubzo8L2I+IHRw
bTJAbGlzdHMuMDEub3JnPGJyPgo8Yj5TdWJqZWN0OjwvYj4gW3RwbTJdIEVzeXNfQ3JlYXRlUHJp
bWFyeSB3b3JrcyB3aXRoIFNpbXVsYXRvciBidXQgZmFpbGluZyB3aXRoIC9kZXYvdHBtMDxicj4K
PC9mb250Pjxicj4KPC9kaXY+CjxkaXY+PC9kaXY+CjxkaXY+CjxkaXYgZGlyPSJsdHIiPgo8ZGl2
IGRpcj0ibHRyIj4KPGRpdiBkaXI9Imx0ciI+RGVhciB0ZWFtLAo8ZGl2Pjxicj4KPC9kaXY+Cjxk
aXY+SSBhbSB0cnlpbmcgdG8gY3JlYXRlIGEgcHJpbWFyeSBrZXkgdXNpbmcgRXN5c19DcmVhdGVQ
cmltYXJ5LiBUaGUgY29kZSB3b3JrcyB3aXRob3V0IGFueSBpc3N1ZXMgd2hlbiB0cnlpbmcgb24g
dGhlIHNpbXVsYXRvciwgYnV0IGZhaWxzIHdoZW4gdHJ5aW5nIG9uIGEgaGFyZHdhcmUgVFBNIHVz
aW5nIC9kZXYvdHBtMCZuYnNwOzwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+VGhlIGVycm9y
IEkgYW0gZ2V0dGluZyBpczo8L2Rpdj4KPGRpdj4KPGRpdj5XQVJOSU5HOmVzeXM6c3JjL3RzczIt
ZXN5cy9hcGkvRXN5c19DcmVhdGVQcmltYXJ5LmM6NDIzOkVzeXNfQ3JlYXRlUHJpbWFyeV9GaW5p
c2goKSBSZWNlaXZlZCBUUE0gRXJyb3ImbmJzcDs8L2Rpdj4KPGRpdj5FUlJPUjplc3lzOnNyYy90
c3MyLWVzeXMvYXBpL0VzeXNfQ3JlYXRlUHJpbWFyeS5jOjE2NDpFc3lzX0NyZWF0ZVByaW1hcnko
KSBFc3lzIEZpbmlzaCBFcnJvckNvZGUgKDB4MDAwMDAxYzIpJm5ic3A7PC9kaXY+CjxkaXY+RXN5
c19DcmVhdGVQcmltYXJ5IGZhaWw8L2Rpdj4KPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5D
YW4gc29tZW9uZSBwb2ludCBvdXQgd2h5IEkgYW0gZ2V0dGluZyZuYnNwO3RoaXMgZXJyb3I/IFNv
IGZhciBJIGFtIHVuYWJsZSB0byBwaW5wb2ludCB0aGUmbmJzcDtwcm9ibGVtLjwvZGl2Pgo8ZGl2
Pjxicj4KPC9kaXY+CjxkaXY+QmVzdCByZWdhcmRzLDwvZGl2Pgo8ZGl2PlNvdXJhaml0IE11a2hv
cGFkaHlheTwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8
L2JvZHk+CjwvaHRtbD4K

--===============1665252320800346619==--

