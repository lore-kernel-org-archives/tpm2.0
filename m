Content-Type: multipart/mixed; boundary="===============2962011623632044399=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] cannot find the definition of "TSS2_TCTI_CONTEXT"
Date: Thu, 18 Oct 2018 09:01:08 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D01473479FE@exch2010c.sit.fraunhofer.de>
In-Reply-To: CA+tBKVgDv+MMg0=s6sxVfA1+b3BqDMseqwjVia_3oSim5aqLAw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2962011623632044399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The SYS, ESYS and TCTI Contexts are all opaque structures.
Reason is that they may change size (grow or shrink) in the future and shal=
l not break ABI doing so.

Examples for initilizing can be found in the integration tests:
- TCTI: https://github.com/tpm2-software/tpm2-tss/blob/master/test/integrat=
ion/sapi-context-util.c#L23
- SYS: https://github.com/tpm2-software/tpm2-tss/blob/master/test/integrati=
on/sapi-context-util.c#L127
- ESYS: https://github.com/tpm2-software/tpm2-tss/blob/master/test/integrat=
ion/main-esapi.c#L210

Hope this helps.

Cheers,
Andreas
________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Terry An [terry.an.bj=
(a)gmail.com]
Sent: Thursday, October 18, 2018 10:27
To: tpm2(a)lists.01.org
Subject: [tpm2] cannot find the definition of "TSS2_TCTI_CONTEXT"

./src/main.c: In function =E2=80=98tcti_device_init=E2=80=99:
./src/main.c:25:35: error: invalid application of =E2=80=98sizeof=E2=80=99 =
to incomplete type =E2=80=98TSS2_TCTI_CONTEXT=E2=80=99
     if ((tcti_ctx =3D malloc(sizeof(TSS2_TCTI_CONTEXT))) =3D=3D NULL) {

# grep TSS2_TCTI_OPAQUE_CONTEXT_BLOB /usr/include/* -r
sapi/tss2_tcti.h:typedef struct TSS2_TCTI_OPAQUE_CONTEXT_BLOB TSS2_TCTI_CON=
TEXT;
#

and BTW, does anywhere have a demo code to describe how to program with TPM=
2.0 ?


--===============2962011623632044399==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9V2luZG93cy0xMjUyIj4KPHN0eWxlIHR5cGU9InRl
eHQvY3NzIiBpZD0ib3dhUGFyYVN0eWxlIj5QIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTow
O308L3N0eWxlPgo8L2hlYWQ+Cjxib2R5IGZwc3R5bGU9IjEiIG9jc2k9IjAiPgo8ZGl2IHN0eWxl
PSJkaXJlY3Rpb246IGx0cjtmb250LWZhbWlseTogVGFob21hO2NvbG9yOiAjMDAwMDAwO2ZvbnQt
c2l6ZTogMTBwdDsiPgo8ZGl2PlRoZSBTWVMsIEVTWVMgYW5kIFRDVEkgQ29udGV4dHMgYXJlIGFs
bCBvcGFxdWUgc3RydWN0dXJlcy48L2Rpdj4KPGRpdj5SZWFzb24gaXMgdGhhdCB0aGV5IG1heSBj
aGFuZ2Ugc2l6ZSAoZ3JvdyBvciBzaHJpbmspIGluIHRoZSBmdXR1cmUgYW5kIHNoYWxsIG5vdCBi
cmVhayBBQkkgZG9pbmcgc28uPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5FeGFtcGxlcyBm
b3IgaW5pdGlsaXppbmcgY2FuIGJlIGZvdW5kIGluIHRoZSBpbnRlZ3JhdGlvbiB0ZXN0czo8L2Rp
dj4KPGRpdj4tIFRDVEk6IGh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNz
L2Jsb2IvbWFzdGVyL3Rlc3QvaW50ZWdyYXRpb24vc2FwaS1jb250ZXh0LXV0aWwuYyNMMjM8YnI+
CjwvZGl2Pgo8ZGl2Pi0gU1lTOiBodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0y
LXRzcy9ibG9iL21hc3Rlci90ZXN0L2ludGVncmF0aW9uL3NhcGktY29udGV4dC11dGlsLmMjTDEy
Nzxicj4KPC9kaXY+CjxkaXY+LSBFU1lTOiA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBt
Mi1zb2Z0d2FyZS90cG0yLXRzcy9ibG9iL21hc3Rlci90ZXN0L2ludGVncmF0aW9uL21haW4tZXNh
cGkuYyNMMjEwIiB0YXJnZXQ9Il9ibGFuayI+Cmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3
YXJlL3RwbTItdHNzL2Jsb2IvbWFzdGVyL3Rlc3QvaW50ZWdyYXRpb24vbWFpbi1lc2FwaS5jI0wy
MTA8L2E+PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5Ib3BlIHRoaXMgaGVscHMuPC9kaXY+
CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5DaGVlcnMsPC9kaXY+CjxkaXY+QW5kcmVhczxicj4KPC9k
aXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBUaW1lcyBOZXcgUm9tYW47IGNvbG9yOiAjMDAw
MDAwOyBmb250LXNpemU6IDE2cHgiPgo8aHIgdGFiaW5kZXg9Ii0xIj4KPGRpdiBpZD0iZGl2UnBG
ODY4OTkiIHN0eWxlPSJkaXJlY3Rpb246IGx0cjsiPjxmb250IHNpemU9IjIiIGZhY2U9IlRhaG9t
YSIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiB0cG0yIFt0cG0yLWJvdW5jZXNAbGlzdHMu
MDEub3JnXSBvbiBiZWhhbGYgb2YgVGVycnkgQW4gW3RlcnJ5LmFuLmJqQGdtYWlsLmNvbV08YnI+
CjxiPlNlbnQ6PC9iPiBUaHVyc2RheSwgT2N0b2JlciAxOCwgMjAxOCAxMDoyNzxicj4KPGI+VG86
PC9iPiB0cG0yQGxpc3RzLjAxLm9yZzxicj4KPGI+U3ViamVjdDo8L2I+IFt0cG0yXSBjYW5ub3Qg
ZmluZCB0aGUgZGVmaW5pdGlvbiBvZiAmcXVvdDtUU1MyX1RDVElfQ09OVEVYVCZxdW90Ozxicj4K
PC9mb250Pjxicj4KPC9kaXY+CjxkaXY+PC9kaXY+CjxkaXY+CjxkaXYgZGlyPSJsdHIiPgo8ZGl2
IGRpcj0ibHRyIj4KPGRpdiBkaXI9Imx0ciI+CjxkaXY+Li9zcmMvbWFpbi5jOiBJbiBmdW5jdGlv
biCRdGN0aV9kZXZpY2VfaW5pdJI6PC9kaXY+CjxkaXY+Li9zcmMvbWFpbi5jOjI1OjM1OiBlcnJv
cjogaW52YWxpZCBhcHBsaWNhdGlvbiBvZiCRc2l6ZW9mkiB0byBpbmNvbXBsZXRlIHR5cGUgkVRT
UzJfVENUSV9DT05URVhUkjwvZGl2Pgo8ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7aWYgKCh0Y3Rp
X2N0eCA9IG1hbGxvYyhzaXplb2YoVFNTMl9UQ1RJX0NPTlRFWFQpKSkgPT0gTlVMTCkgezwvZGl2
Pgo8ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyZuYnNwOzwvZGl2Pgo8ZGl2Pgo8ZGl2PiMgZ3JlcCBUU1MyX1RDVElfT1BBUVVFX0NPTlRF
WFRfQkxPQiAvdXNyL2luY2x1ZGUvKiAtcjwvZGl2Pgo8ZGl2PnNhcGkvdHNzMl90Y3RpLmg6dHlw
ZWRlZiBzdHJ1Y3QgVFNTMl9UQ1RJX09QQVFVRV9DT05URVhUX0JMT0IgVFNTMl9UQ1RJX0NPTlRF
WFQ7PC9kaXY+CjxkaXY+IyZuYnNwOzwvZGl2Pgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2
PmFuZCBCVFcsIGRvZXMgYW55d2hlcmUgaGF2ZSBhIGRlbW8gY29kZSB0byBkZXNjcmliZSBob3cg
dG8gcHJvZ3JhbSB3aXRoIFRQTTIuMCA/Jm5ic3A7PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPC9k
aXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============2962011623632044399==--

