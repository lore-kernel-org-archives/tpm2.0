Content-Type: multipart/mixed; boundary="===============4038849398535786824=="
MIME-Version: 1.0
From: Muthukumar S <muthu.smk at gmail.com>
Subject: [tpm2] authHandle issues
Date: Wed, 20 May 2020 14:59:26 +0530
Message-ID: <CANGCWd0wLxEi+NOeEoHx1_TLx8Sed6ekJ=PaEkfgt=gdBeXDMQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4038849398535786824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Roberts,

Thanks a lot for your response. As per your suggestion , I remember that I
set "authHandle" as ESYS_TR type. And the test code that I have shared also
has the same implementation.

Below is how I set the "authHandle" , which is of ESYS_TR type and passed
as argument to below Esys_NV_Read () API.

ESYS_TR authHandle =3D 0x40000001;

rc =3D Esys_NV_Read(
                ectx,
		authHandle,
                nv_index2, /* the nv index to read from */
                ESYS_TR_PASSWORD,
                ESYS_TR_NONE,
                ESYS_TR_NONE,
		20,
                0,
                &read_data);
                if (rc !=3D TSS2_RC_SUCCESS) {
                        printf("Esys_NV_Read <ERROR>: 0x%x\n", rc);
                	goto out;
		}

Let me know , anything else am I missing?

BR,
Muthukumar

--===============4038849398535786824==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPkhpIFJvYmVydHMsPGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2
IGRpcj0iYXV0byI+VGhhbmtzIGEgbG90IGZvciB5b3VyIHJlc3BvbnNlLiBBcyBwZXIgeW91ciBz
dWdnZXN0aW9uICwgSSByZW1lbWJlciB0aGF0IEkgc2V0ICZxdW90O2F1dGhIYW5kbGUmcXVvdDsg
YXMgRVNZU19UUiB0eXBlLiBBbmQgdGhlIHRlc3QgY29kZSB0aGF0IEkgaGF2ZSBzaGFyZWQgYWxz
byBoYXMgdGhlIHNhbWUgaW1wbGVtZW50YXRpb24uPC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48
L2Rpdj48ZGl2IGRpcj0iYXV0byI+QmVsb3cgaXMgaG93IEkgc2V0IHRoZSAmcXVvdDthdXRoSGFu
ZGxlJnF1b3Q7ICwgd2hpY2ggaXMgb2YgRVNZU19UUiB0eXBlIGFuZCBwYXNzZWQgYXMgYXJndW1l
bnQgdG8gYmVsb3cgRXN5c19OVl9SZWFkICgpIEFQSS48YnI+PGRpdiBkaXI9ImF1dG8iPjxwcmUg
c3R5bGU9IndoaXRlLXNwYWNlOnByZS13cmFwIj5FU1lTX1RSIGF1dGhIYW5kbGUgPSAweDQwMDAw
MDAxOzwvcHJlPjxwcmUgc3R5bGU9IndoaXRlLXNwYWNlOnByZS13cmFwIj5yYyA9IEVzeXNfTlZf
UmVhZCgKICAgICAgICAgICAgICAgIGVjdHgsCgkJYXV0aEhhbmRsZSwKICAgICAgICAgICAgICAg
IG52X2luZGV4MiwgLyogdGhlIG52IGluZGV4IHRvIHJlYWQgZnJvbSAqLwogICAgICAgICAgICAg
ICAgRVNZU19UUl9QQVNTV09SRCwKICAgICAgICAgICAgICAgIEVTWVNfVFJfTk9ORSwKICAgICAg
ICAgICAgICAgIEVTWVNfVFJfTk9ORSwKCQkyMCwKICAgICAgICAgICAgICAgIDAsCiAgICAgICAg
ICAgICAgICAmYW1wO3JlYWRfZGF0YSk7CiAgICAgICAgICAgICAgICBpZiAocmMgIT0gVFNTMl9S
Q19TVUNDRVNTKSB7CiAgICAgICAgICAgICAgICAgICAgICAgIHByaW50ZigmcXVvdDtFc3lzX05W
X1JlYWQgJmx0O0VSUk9SJmd0OzogMHgleFxuJnF1b3Q7LCByYyk7CiAgICAgICAgICAgICAgICAJ
Z290byBvdXQ7CgkJfTwvcHJlPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5MZXQgbWUga25vdyAsIGFu
eXRoaW5nIGVsc2UgYW0gSSBtaXNzaW5nPzwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+
PGRpdiBkaXI9ImF1dG8iPkJSLDwvZGl2PjxkaXYgZGlyPSJhdXRvIj5NdXRodWt1bWFyPC9kaXY+
PC9kaXY+PC9kaXY+Cg==

--===============4038849398535786824==--

