Content-Type: multipart/mixed; boundary="===============0384590359418958552=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: tpm2_nvdefine fails with inconsistent attributes...
Date: Mon, 10 Jan 2022 13:08:54 -0800
Message-ID: <CAOCvsSn8G6j=EvYeWK9=sjqesdg4Ho4j_DvLPEgFRKC36W3Mug@mail.gmail.com>
In-Reply-To: OFF31632E1.42591036-ON002587A0.00516E2E-852587A0.0051AFEF@ibm.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0384590359418958552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It might also just be attempting to use platform authorization on real
hardware while not being the system firmware.  UEFI tends to lock out the
platform on every boot because that's what it's supposed to do?

On Fri, Dec 3, 2021, 6:52 AM Kenneth Goldman <kgoldman(a)us.ibm.com> wrote:

> My guess is that you do not set the TPMA_NVA_PLATFORMCREATE attribute.
>
> The IBM utility sets it for you when the platform hierarchy authorizes the
> command, since it must be set.
>
> --
> Ken Goldman   kgoldman(a)us.ibm.com
> 914-945-2415 (862-2415)
>
>
> [image: Inactive hide details for "Sievert, James" ---12/03/2021 09:37:25
> AM---Hi, I=E2=80=99m using tpm2-tools 4.1.1 on Ubuntu 20.04. I=E2=80=99m =
i]"Sievert,
> James" ---12/03/2021 09:37:25 AM---Hi, I=E2=80=99m using tpm2-tools 4.1.1=
 on Ubuntu
> 20.04.  I=E2=80=99m issuing the following command which is returnin
>
> From: "Sievert, James" <james.sievert(a)bsci.com>
> To: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
> Date: 12/03/2021 09:37 AM
> Subject: [EXTERNAL] [tpm2] tpm2_nvdefine fails with inconsistent
> attributes...
> ------------------------------
>
>
>
> Hi, I=E2=80=99m using tpm2-tools 4.1.1 on Ubuntu 20.04. I=E2=80=99m issui=
ng the following
> command which is returning an inconsistent attributes error:
> bsci(a)ip-10-132-42-225:~$ tpm2_nvdefine 0x1000025 -C p -s 1
> =E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=
=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=
=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=
=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=
=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=
=80=8D=E2=80=8D=E2=80=8D=E2=80=8D=E2=80=8D
> Hi,
>
> I=E2=80=99m using tpm2-tools 4.1.1 on Ubuntu 20.04.  I=E2=80=99m issuing =
the following
> command which is returning an inconsistent attributes error:
>
> bsci(a)ip-10-132-42-225:~$ tpm2_nvdefine   0x1000025 -C p -s 1
> WARNING:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:333:Esys_NV_DefineSp=
ace_Finish()
> Received TPM Error
> ERROR:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:122:Esys_NV_DefineSpac=
e()
> Esys Finish ErrorCode (0x00000182)
> ERROR: Failed to define NV area at index 0x1000025
> ERROR: Esys_NV_DefineSpace(0x182) - tpm:handle(1):inconsistent attributes
> ERROR: Unable to run tpm2_nvdefine
>
> and yes, I am attempting to define the index using the platform hierarchy.
>  ?  This does work using the IBM utilities.
>
> Here are the current properties:
>
> bsci(a)ip-10-132-42-225:~$ tpm2_getcap properties-variable
> TPM2_PT_PERSISTENT:
>   ownerAuthSet:              0
>   endorsementAuthSet:        0
>   lockoutAuthSet:            0
>   reserved1:                 0
>   disableClear:              0
>   inLockout:                 0
>   tpmGeneratedEPS:           0
>   reserved2:                 0
> TPM2_PT_STARTUP_CLEAR:
>   phEnable:                  1
>   shEnable:                  1
>   ehEnable:                  1
>   phEnableNV:                1
>   reserved1:                 0
>   orderly:                   0
> TPM2_PT_HR_NV_INDEX: 0x6
> TPM2_PT_HR_LOADED: 0x0
> TPM2_PT_HR_LOADED_AVAIL: 0x3
> TPM2_PT_HR_ACTIVE: 0x0
> TPM2_PT_HR_ACTIVE_AVAIL: 0x40
> TPM2_PT_HR_TRANSIENT_AVAIL: 0x3
> TPM2_PT_HR_PERSISTENT: 0x0
> TPM2_PT_HR_PERSISTENT_AVAIL: 0x11
> TPM2_PT_NV_COUNTERS: 0x0
> TPM2_PT_NV_COUNTERS_AVAIL: 0xD
> TPM2_PT_ALGORITHM_SET: 0x0
> TPM2_PT_LOADED_CURVES: 0x2
> TPM2_PT_LOCKOUT_COUNTER: 0x0
> TPM2_PT_MAX_AUTH_FAIL: 0x20
> TPM2_PT_LOCKOUT_INTERVAL: 0x1C20
> TPM2_PT_LOCKOUT_RECOVERY: 0x15180
> TPM2_PT_AUDIT_COUNTER_0: 0x0
> TPM2_PT_AUDIT_COUNTER_1: 0x0
>
> Any insight would be appreciated.
> Thanks!_______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============0384590359418958552==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPkl0IG1pZ2h0IGFsc28ganVzdCBiZSBhdHRlbXB0aW5nIHRvIHVzZSBw
bGF0Zm9ybSBhdXRob3JpemF0aW9uIG9uIHJlYWwgaGFyZHdhcmUgd2hpbGUgbm90IGJlaW5nIHRo
ZSBzeXN0ZW0gZmlybXdhcmUuwqAgVUVGSSB0ZW5kcyB0byBsb2NrIG91dCB0aGUgcGxhdGZvcm0g
b24gZXZlcnkgYm9vdCBiZWNhdXNlIHRoYXQmIzM5O3Mgd2hhdCBpdCYjMzk7cyBzdXBwb3NlZCB0
byBkbz88L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNs
YXNzPSJnbWFpbF9hdHRyIj5PbiBGcmksIERlYyAzLCAyMDIxLCA2OjUyIEFNIEtlbm5ldGggR29s
ZG1hbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmtnb2xkbWFuQHVzLmlibS5jb20iPmtnb2xkbWFuQHVz
LmlibS5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29s
aWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdj48cD48Zm9udCBzaXplPSIyIiBmYWNlPSJzYW5zLXNl
cmlmIj5NeSBndWVzcyBpcyB0aGF0IHlvdSBkbyBub3Qgc2V0IHRoZSBUUE1BX05WQV9QTEFURk9S
TUNSRUFURSBhdHRyaWJ1dGUuPC9mb250Pjxicj48YnI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0ic2Fu
cy1zZXJpZiI+VGhlIElCTSB1dGlsaXR5IHNldHMgaXQgZm9yIHlvdSB3aGVuIHRoZSBwbGF0Zm9y
bSBoaWVyYXJjaHkgYXV0aG9yaXplcyB0aGUgY29tbWFuZCwgc2luY2UgaXQgbXVzdCBiZSBzZXQu
PGJyPjxicj4tLTxicj5LZW4gR29sZG1hbiDCoCA8YSBocmVmPSJtYWlsdG86a2dvbGRtYW5AdXMu
aWJtLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+a2dvbGRtYW5AdXMuaWJt
LmNvbTwvYT4gwqAgPGJyPjkxNC05NDUtMjQxNSAoODYyLTI0MTUpPGJyPjwvZm9udD48YnI+PGJy
PjxpbWcgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2IiBzcmM9ImNpZDoxX189OEZCQjBEMzNERkMyRThC
RThmOWU4YTkzZGY5Mzg2OTBAaWJtLmNvbSIgYm9yZGVyPSIwIiBhbHQ9IkluYWN0aXZlIGhpZGUg
ZGV0YWlscyBmb3IgJnF1b3Q7U2lldmVydCwgSmFtZXMmcXVvdDsgLS0tMTIvMDMvMjAyMSAwOToz
NzoyNSBBTS0tLUhpLCBJ4oCZbSB1c2luZyB0cG0yLXRvb2xzIDQuMS4xIG9uIFVidW50dSAyMC4w
NC4gIEnigJltIGkiPjxmb250IHNpemU9IjIiIGNvbG9yPSIjNDI0MjgyIiBmYWNlPSJzYW5zLXNl
cmlmIj4mcXVvdDtTaWV2ZXJ0LCBKYW1lcyZxdW90OyAtLS0xMi8wMy8yMDIxIDA5OjM3OjI1IEFN
LS0tSGksIEnigJltIHVzaW5nIHRwbTItdG9vbHMgNC4xLjEgb24gVWJ1bnR1IDIwLjA0LsKgIEni
gJltIGlzc3VpbmcgdGhlIGZvbGxvd2luZyBjb21tYW5kIHdoaWNoIGlzIHJldHVybmluPC9mb250
Pjxicj48YnI+PGZvbnQgc2l6ZT0iMSIgY29sb3I9IiM1RjVGNUYiIGZhY2U9InNhbnMtc2VyaWYi
PkZyb206ICAgICAgICA8L2ZvbnQ+PGZvbnQgc2l6ZT0iMSIgZmFjZT0ic2Fucy1zZXJpZiI+JnF1
b3Q7U2lldmVydCwgSmFtZXMmcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzpqYW1lcy5zaWV2ZXJ0
QGJzY2kuY29tIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5qYW1lcy5zaWV2ZXJ0
QGJzY2kuY29tPC9hPiZndDs8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjEiIGNvbG9yPSIjNUY1RjVG
IiBmYWNlPSJzYW5zLXNlcmlmIj5UbzogICAgICAgIDwvZm9udD48Zm9udCBzaXplPSIxIiBmYWNl
PSJzYW5zLXNlcmlmIj4mcXVvdDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRh
cmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZxdW90
OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayIg
cmVsPSJub3JlZmVycmVyIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PC9mb250Pjxicj48Zm9u
dCBzaXplPSIxIiBjb2xvcj0iIzVGNUY1RiIgZmFjZT0ic2Fucy1zZXJpZiI+RGF0ZTogICAgICAg
IDwvZm9udD48Zm9udCBzaXplPSIxIiBmYWNlPSJzYW5zLXNlcmlmIj4xMi8wMy8yMDIxIDA5OjM3
IEFNPC9mb250Pjxicj48Zm9udCBzaXplPSIxIiBjb2xvcj0iIzVGNUY1RiIgZmFjZT0ic2Fucy1z
ZXJpZiI+U3ViamVjdDogICAgICAgIDwvZm9udD48Zm9udCBzaXplPSIxIiBmYWNlPSJzYW5zLXNl
cmlmIj5bRVhURVJOQUxdIFt0cG0yXSB0cG0yX252ZGVmaW5lIGZhaWxzIHdpdGggaW5jb25zaXN0
ZW50IGF0dHJpYnV0ZXMuLi48L2ZvbnQ+PGJyPjxociB3aWR0aD0iMTAwJSIgc2l6ZT0iMiIgYWxp
Z249ImxlZnQiIG5vc2hhZGUgc3R5bGU9ImNvbG9yOiM4MDkxYTUiPjxicj48YnI+PGJyPjxmb250
IHNpemU9IjEiIGNvbG9yPSIjRkZGRkZGIiBmYWNlPSJzZXJpZiI+SGksIEnigJltIHVzaW5nIHRw
bTItdG9vbHMgNC4xLjEgb24gVWJ1bnR1IDIwLjA0LiBJ4oCZbSBpc3N1aW5nIHRoZSBmb2xsb3dp
bmcgY29tbWFuZCB3aGljaCBpcyByZXR1cm5pbmcgYW4gaW5jb25zaXN0ZW50IGF0dHJpYnV0ZXMg
ZXJyb3I6IGJzY2lAaXAtMTAtMTMyLTQyLTIyNTp+JCB0cG0yX252ZGVmaW5lIDB4MTAwMDAyNSAt
QyBwIC1zIDEg4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN
4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN
4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCN4oCNPC9mb250Pjxicj48Zm9udCBzaXplPSIy
IiBmYWNlPSJDYWxpYnJpIj5IaSw8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGli
cmkiPsKgPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBmYWNlPSJDYWxpYnJpIj5J4oCZbSB1c2lu
ZyB0cG0yLXRvb2xzIDQuMS4xIG9uIFVidW50dSAyMC4wNC7CoCBJ4oCZbSBpc3N1aW5nIHRoZSBm
b2xsb3dpbmcgY29tbWFuZCB3aGljaCBpcyByZXR1cm5pbmcgYW4gaW5jb25zaXN0ZW50IGF0dHJp
YnV0ZXMgZXJyb3I6PC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBmYWNlPSJDYWxpYnJpIj7CoDwv
Zm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2FsaWJyaSI+YnNjaUBpcC0xMC0xMzItNDIt
MjI1On4kIHRwbTJfbnZkZWZpbmUgwqAgMHgxMDAwMDI1IC1DIHAgLXMgMTwvZm9udD48YnI+PGZv
bnQgc2l6ZT0iMiIgZmFjZT0iQ2FsaWJyaSI+V0FSTklORzplc3lzOnNyYy90c3MyLWVzeXMvYXBp
L0VzeXNfTlZfRGVmaW5lU3BhY2UuYzozMzM6RXN5c19OVl9EZWZpbmVTcGFjZV9GaW5pc2goKSBS
ZWNlaXZlZCBUUE0gRXJyb3I8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGlicmki
PkVSUk9SOmVzeXM6c3JjL3RzczItZXN5cy9hcGkvRXN5c19OVl9EZWZpbmVTcGFjZS5jOjEyMjpF
c3lzX05WX0RlZmluZVNwYWNlKCkgRXN5cyBGaW5pc2ggRXJyb3JDb2RlICgweDAwMDAwMTgyKTwv
Zm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2FsaWJyaSI+RVJST1I6IEZhaWxlZCB0byBk
ZWZpbmUgTlYgYXJlYSBhdCBpbmRleCAweDEwMDAwMjU8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIi
IGZhY2U9IkNhbGlicmkiPkVSUk9SOiBFc3lzX05WX0RlZmluZVNwYWNlKDB4MTgyKSAtIHRwbTpo
YW5kbGUoMSk6aW5jb25zaXN0ZW50IGF0dHJpYnV0ZXM8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIi
IGZhY2U9IkNhbGlicmkiPkVSUk9SOiBVbmFibGUgdG8gcnVuIHRwbTJfbnZkZWZpbmU8L2ZvbnQ+
PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGlicmkiPsKgPC9mb250Pjxicj48Zm9udCBzaXpl
PSIyIiBmYWNlPSJDYWxpYnJpIj5hbmQgeWVzLCBJIGFtIGF0dGVtcHRpbmcgdG8gZGVmaW5lIHRo
ZSBpbmRleCB1c2luZyB0aGUgcGxhdGZvcm0gaGllcmFyY2h5LiDCoDwvZm9udD48Zm9udCBzaXpl
PSIyIiBmYWNlPSJTZWdvZSBVSSBFbW9qaSI+PzwvZm9udD48Zm9udCBzaXplPSIyIiBmYWNlPSJD
YWxpYnJpIj7CoCBUaGlzIGRvZXMgd29yayB1c2luZyB0aGUgSUJNIHV0aWxpdGllcy4gwqA8L2Zv
bnQ+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGlicmkiPsKgPC9mb250Pjxicj48Zm9udCBz
aXplPSIyIiBmYWNlPSJDYWxpYnJpIj5IZXJlIGFyZSB0aGUgY3VycmVudCBwcm9wZXJ0aWVzOjwv
Zm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2FsaWJyaSI+wqA8L2ZvbnQ+PGJyPjxmb250
IHNpemU9IjIiIGZhY2U9IkNhbGlicmkiPmJzY2lAaXAtMTAtMTMyLTQyLTIyNTp+JCB0cG0yX2dl
dGNhcCBwcm9wZXJ0aWVzLXZhcmlhYmxlPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBmYWNlPSJD
YWxpYnJpIj5UUE0yX1BUX1BFUlNJU1RFTlQ6PC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBmYWNl
PSJDYWxpYnJpIj7CoCBvd25lckF1dGhTZXQ6IMKgIMKgIMKgIMKgIMKgIMKgIMKgMDwvZm9udD48
YnI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2FsaWJyaSI+wqAgZW5kb3JzZW1lbnRBdXRoU2V0OiDC
oCDCoCDCoCDCoDA8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGlicmkiPsKgIGxv
Y2tvdXRBdXRoU2V0OiDCoCDCoCDCoCDCoCDCoCDCoDA8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIi
IGZhY2U9IkNhbGlicmkiPsKgIHJlc2VydmVkMTogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMDwv
Zm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2FsaWJyaSI+wqAgZGlzYWJsZUNsZWFyOiDC
oCDCoCDCoCDCoCDCoCDCoCDCoDA8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGli
cmkiPsKgIGluTG9ja291dDogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMDwvZm9udD48YnI+PGZv
bnQgc2l6ZT0iMiIgZmFjZT0iQ2FsaWJyaSI+wqAgdHBtR2VuZXJhdGVkRVBTOiDCoCDCoCDCoCDC
oCDCoCAwPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBmYWNlPSJDYWxpYnJpIj7CoCByZXNlcnZl
ZDI6IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDA8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGZh
Y2U9IkNhbGlicmkiPlRQTTJfUFRfU1RBUlRVUF9DTEVBUjo8L2ZvbnQ+PGJyPjxmb250IHNpemU9
IjIiIGZhY2U9IkNhbGlicmkiPsKgIHBoRW5hYmxlOiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oDE8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGlicmkiPsKgIHNoRW5hYmxlOiDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDE8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9
IkNhbGlicmkiPsKgIGVoRW5hYmxlOiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDE8L2ZvbnQ+
PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGlicmkiPsKgIHBoRW5hYmxlTlY6IMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgMTwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2FsaWJyaSI+
wqAgcmVzZXJ2ZWQxOiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwPC9mb250Pjxicj48Zm9udCBz
aXplPSIyIiBmYWNlPSJDYWxpYnJpIj7CoCBvcmRlcmx5OiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAwPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBmYWNlPSJDYWxpYnJpIj5UUE0yX1BUX0hS
X05WX0lOREVYOiAweDY8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGlicmkiPlRQ
TTJfUFRfSFJfTE9BREVEOiAweDA8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGli
cmkiPlRQTTJfUFRfSFJfTE9BREVEX0FWQUlMOiAweDM8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIi
IGZhY2U9IkNhbGlicmkiPlRQTTJfUFRfSFJfQUNUSVZFOiAweDA8L2ZvbnQ+PGJyPjxmb250IHNp
emU9IjIiIGZhY2U9IkNhbGlicmkiPlRQTTJfUFRfSFJfQUNUSVZFX0FWQUlMOiAweDQwPC9mb250
Pjxicj48Zm9udCBzaXplPSIyIiBmYWNlPSJDYWxpYnJpIj5UUE0yX1BUX0hSX1RSQU5TSUVOVF9B
VkFJTDogMHgzPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBmYWNlPSJDYWxpYnJpIj5UUE0yX1BU
X0hSX1BFUlNJU1RFTlQ6IDB4MDwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2FsaWJy
aSI+VFBNMl9QVF9IUl9QRVJTSVNURU5UX0FWQUlMOiAweDExPC9mb250Pjxicj48Zm9udCBzaXpl
PSIyIiBmYWNlPSJDYWxpYnJpIj5UUE0yX1BUX05WX0NPVU5URVJTOiAweDA8L2ZvbnQ+PGJyPjxm
b250IHNpemU9IjIiIGZhY2U9IkNhbGlicmkiPlRQTTJfUFRfTlZfQ09VTlRFUlNfQVZBSUw6IDB4
RDwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2FsaWJyaSI+VFBNMl9QVF9BTEdPUklU
SE1fU0VUOiAweDA8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGlicmkiPlRQTTJf
UFRfTE9BREVEX0NVUlZFUzogMHgyPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBmYWNlPSJDYWxp
YnJpIj5UUE0yX1BUX0xPQ0tPVVRfQ09VTlRFUjogMHgwPC9mb250Pjxicj48Zm9udCBzaXplPSIy
IiBmYWNlPSJDYWxpYnJpIj5UUE0yX1BUX01BWF9BVVRIX0ZBSUw6IDB4MjA8L2ZvbnQ+PGJyPjxm
b250IHNpemU9IjIiIGZhY2U9IkNhbGlicmkiPlRQTTJfUFRfTE9DS09VVF9JTlRFUlZBTDogMHgx
QzIwPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBmYWNlPSJDYWxpYnJpIj5UUE0yX1BUX0xPQ0tP
VVRfUkVDT1ZFUlk6IDB4MTUxODA8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGli
cmkiPlRQTTJfUFRfQVVESVRfQ09VTlRFUl8wOiAweDA8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIi
IGZhY2U9IkNhbGlicmkiPlRQTTJfUFRfQVVESVRfQ09VTlRFUl8xOiAweDA8L2ZvbnQ+PGJyPjxm
b250IHNpemU9IjIiIGZhY2U9IkNhbGlicmkiPsKgPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBm
YWNlPSJDYWxpYnJpIj5BbnkgaW5zaWdodCB3b3VsZCBiZSBhcHByZWNpYXRlZC4gwqA8L2ZvbnQ+
PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNhbGlicmkiPlRoYW5rcyE8L2ZvbnQ+PHR0Pjxmb250
IHNpemU9IjIiPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
PGJyPnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9y
ZyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+
PGJyPlRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOnRwbTIt
bGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj50cG0y
LWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+JSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2ll
eHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8L2ZvbnQ+PC90dD48YnI+PGJyPjxicj4KPGJyPgo8L3A+
PC9kaXY+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJy
Pgp0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmci
IHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxi
cj4KVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1s
ZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnRwbTIt
bGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2ll
eHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============0384590359418958552==
Content-Type: image/gif
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="graycol.gif"

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7
--===============0384590359418958552==
Content-Type: image/gif
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="graycol.gif"

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7
--===============0384590359418958552==--

