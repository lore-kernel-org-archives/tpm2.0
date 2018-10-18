Content-Type: multipart/mixed; boundary="===============0117712759901867368=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: [tpm2] cannot find the definition of "TSS2_TCTI_CONTEXT"
Date: Thu, 18 Oct 2018 16:27:59 +0800
Message-ID: <CA+tBKVgDv+MMg0=s6sxVfA1+b3BqDMseqwjVia_3oSim5aqLAw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0117712759901867368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

./src/main.c: In function =E2=80=98tcti_device_init=E2=80=99:
./src/main.c:25:35: error: invalid application of =E2=80=98sizeof=E2=80=99 =
to incomplete
type =E2=80=98TSS2_TCTI_CONTEXT=E2=80=99
     if ((tcti_ctx =3D malloc(sizeof(TSS2_TCTI_CONTEXT))) =3D=3D NULL) {

# grep TSS2_TCTI_OPAQUE_CONTEXT_BLOB /usr/include/* -r
sapi/tss2_tcti.h:typedef struct TSS2_TCTI_OPAQUE_CONTEXT_BLOB
TSS2_TCTI_CONTEXT;
#

and BTW, does anywhere have a demo code to describe how to program with
TPM2.0 ?

--===============0117712759901867368==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj4uL3NyYy9t
YWluLmM6IEluIGZ1bmN0aW9uIOKAmHRjdGlfZGV2aWNlX2luaXTigJk6PC9kaXY+PGRpdj4uL3Ny
Yy9tYWluLmM6MjU6MzU6IGVycm9yOiBpbnZhbGlkIGFwcGxpY2F0aW9uIG9mIOKAmHNpemVvZuKA
mSB0byBpbmNvbXBsZXRlIHR5cGUg4oCYVFNTMl9UQ1RJX0NPTlRFWFTigJk8L2Rpdj48ZGl2PsKg
IMKgIMKgaWYgKCh0Y3RpX2N0eCA9IG1hbGxvYyhzaXplb2YoVFNTMl9UQ1RJX0NPTlRFWFQpKSkg
PT0gTlVMTCkgezwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqDCoDwvZGl2PjxkaXY+PGRpdj4jIGdyZXAgVFNTMl9UQ1RJX09QQVFVRV9DT05U
RVhUX0JMT0IgL3Vzci9pbmNsdWRlLyogLXI8L2Rpdj48ZGl2PnNhcGkvdHNzMl90Y3RpLmg6dHlw
ZWRlZiBzdHJ1Y3QgVFNTMl9UQ1RJX09QQVFVRV9DT05URVhUX0JMT0IgVFNTMl9UQ1RJX0NPTlRF
WFQ7PC9kaXY+PGRpdj4jwqA8L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmFuZCBCVFcs
IGRvZXMgYW55d2hlcmUgaGF2ZSBhIGRlbW8gY29kZSB0byBkZXNjcmliZSBob3cgdG8gcHJvZ3Jh
bSB3aXRoIFRQTTIuMCA/wqA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============0117712759901867368==--

