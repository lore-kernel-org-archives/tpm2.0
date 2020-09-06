Content-Type: multipart/mixed; boundary="===============2802443337047175561=="
MIME-Version: 1.0
From: Hanson Char <hanson.char at gmail.com>
Subject: [tpm2] Remote Attestation With Tpm2 Tools
Date: Sat, 05 Sep 2020 22:54:36 -0700
Message-ID: <CABWgujaDpGkTfwdv-Ln69-UeQ_ohe--=0u83ypkKSci3OdFjjQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2802443337047175561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I just managed to get the 3 scripts provided at


https://tpm2-software.github.io/2020/06/12/Remote-Attestation-With-tpm2-too=
ls.html#scripts-for-implementation-of-the-simple-attestation-framework

to work with the latest tpm2-tss (built from the latest master branches) in
Ubuntu 20.04 (x86-64 with Infineon TPM SLB9670) so I thought I would share
some of what I've found.

1. For the Infineon TPM device SLB9670, I realized the version of the TPM
firmware needed to be upgraded (e.g. to the latest version 7.85.4555.0).
The tpm2_create command in the script would fail when executed against the
TPM firmware version 7.63.3353.0.

2. The three scripts need to be in their individual directories.  For
example:

    =E2=94=9C=E2=94=80=E2=94=80 DN
    =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 device_node.sh
    =E2=94=9C=E2=94=80=E2=94=80 PCA
    =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 private_ca.sh
    =E2=94=94=E2=94=80=E2=94=80 SP
        =E2=94=94=E2=94=80=E2=94=80 service_provider.sh

3. I needed to modify the specific golden PCR value, and the location of
pcr.bin in service_provider.sh.  In particular:

diff --git a/SP/service_provider.sh b/SP/service_provider.sh
index a0b40ec..b6433d6 100755
--- a/SP/service_provider.sh
+++ b/SP/service_provider.sh
@@ -13,7 +13,8 @@ device_service_request=3D0

 # Attestation Data
 GOLDEN_PCR_SELECTION=3D"sha1:0,1,2+sha256:0,1,2"
-GOLDEN_PCR=3D"59bf9091f4cbbd2a8796bfe086a501c57226c42739dcf8ad323e7493ad51=
e38f"
+#
GOLDEN_PCR=3D"59bf9091f4cbbd2a8796bfe086a501c57226c42739dcf8ad323e7493ad51e=
38f"
+GOLDEN_PCR=3D"c7b544e0359614c896ed32b0fd7fad43c32ba7e19d4b613cdbda162f784b=
5781"

 # Service Data
 SERVICE_CONTENT=3D"Hello world!"
@@ -175,7 +176,7 @@ system_software_state_validation() {
    software_status_string=3D"Attestation quote signature validation"
    tpm2_checkquote --public d_s_service_aik.pub  --qualification "$NONCE" \
    --message attestation_quote.dat --signature attestation_quote.signature
\
-   --pcr pcr.bin -Q
+   --pcr ../DN/pcr.bin -Q
    retval=3D$?
    rm -f attestation_quote.signature
    if [ $retval =3D=3D 1 ];then

Hope this helps anyone who may try to run the scripts.

Meanwhile, I wonder how the sequence diagram and the scripts may differ
when privacy is not a concern; and would appreciate any pointers or hints.

Regards,
Hanson

--===============2802443337047175561==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SSBqdXN0IG1hbmFnZWQgdG8gZ2V0IHRoZSAzIHNjcmlwdHMgcHJvdmlk
ZWQgYXQ8ZGl2Pjxicj48L2Rpdj48ZGl2PsKgwqA8YSBocmVmPSJodHRwczovL3RwbTItc29mdHdh
cmUuZ2l0aHViLmlvLzIwMjAvMDYvMTIvUmVtb3RlLUF0dGVzdGF0aW9uLVdpdGgtdHBtMi10b29s
cy5odG1sI3NjcmlwdHMtZm9yLWltcGxlbWVudGF0aW9uLW9mLXRoZS1zaW1wbGUtYXR0ZXN0YXRp
b24tZnJhbWV3b3JrIj5odHRwczovL3RwbTItc29mdHdhcmUuZ2l0aHViLmlvLzIwMjAvMDYvMTIv
UmVtb3RlLUF0dGVzdGF0aW9uLVdpdGgtdHBtMi10b29scy5odG1sI3NjcmlwdHMtZm9yLWltcGxl
bWVudGF0aW9uLW9mLXRoZS1zaW1wbGUtYXR0ZXN0YXRpb24tZnJhbWV3b3JrPC9hPjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+dG8gd29yayB3aXRoIHRoZSBsYXRlc3QgdHBtMi10c3MgKGJ1aWx0
IGZyb20gdGhlIGxhdGVzdCBtYXN0ZXIgYnJhbmNoZXMpIGluIFVidW50dSAyMC4wNCAoeDg2LTY0
IHdpdGggSW5maW5lb24gVFBNIFNMQjk2NzApIHNvIEkgdGhvdWdodCBJIHdvdWxkIHNoYXJlIHNv
bWUgb2Ygd2hhdCBJJiMzOTt2ZSBmb3VuZC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjEuIEZv
ciB0aGUgSW5maW5lb24gVFBNIGRldmljZSBTTEI5NjcwLCBJIHJlYWxpemVkIHRoZSB2ZXJzaW9u
IG9mIHRoZSBUUE0gZmlybXdhcmUgbmVlZGVkIHRvIGJlIHVwZ3JhZGVkIChlLmcuIHRvIHRoZSBs
YXRlc3QgdmVyc2lvbiA3Ljg1LjQ1NTUuMCkuwqAgVGhlIHRwbTJfY3JlYXRlIGNvbW1hbmQgaW4g
dGhlIHNjcmlwdCB3b3VsZCBmYWlsIHdoZW4gZXhlY3V0ZWTCoGFnYWluc3TCoHRoZSBUUE0gZmly
bXdhcmUgdmVyc2lvbsKgNy42My4zMzUzLjAuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4yLiBU
aGUgdGhyZWUgc2NyaXB0cyBuZWVkIHRvIGJlIGluIHRoZWlyIGluZGl2aWR1YWwgZGlyZWN0b3Jp
ZXMuwqAgRm9yIGV4YW1wbGU6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48Zm9udCBmYWNlPSJt
b25vc3BhY2UiPsKgIMKgIOKUnOKUgOKUgCBETjxicj7CoCDCoCDilILCoMKgIOKUlOKUgOKUgCBk
ZXZpY2Vfbm9kZS5zaDxicj7CoCDCoCDilJzilIDilIAgUENBPGJyPsKgIMKgIOKUgsKgwqAg4pSU
4pSA4pSAIHByaXZhdGVfY2Euc2g8YnI+wqAgwqAg4pSU4pSA4pSAIFNQPGJyPsKgIMKgIMKgIMKg
IOKUlOKUgOKUgCBzZXJ2aWNlX3Byb3ZpZGVyLnNoPGJyPjwvZm9udD48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PjMuIEkgbmVlZGVkIHRvIG1vZGlmeSB0aGUgc3BlY2lmaWMgZ29sZGVuIFBDUiB2
YWx1ZSwgYW5kIHRoZSBsb2NhdGlvbiBvZiBwY3IuYmluIGluIHNlcnZpY2VfcHJvdmlkZXIuc2gu
wqAgSW4gcGFydGljdWxhcjo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxmb250IGZhY2U9Im1v
bm9zcGFjZSI+ZGlmZiAtLWdpdCBhL1NQL3NlcnZpY2VfcHJvdmlkZXIuc2ggYi9TUC9zZXJ2aWNl
X3Byb3ZpZGVyLnNoPGJyPmluZGV4IGEwYjQwZWMuLmI2NDMzZDYgMTAwNzU1PGJyPi0tLSBhL1NQ
L3NlcnZpY2VfcHJvdmlkZXIuc2g8YnI+KysrIGIvU1Avc2VydmljZV9wcm92aWRlci5zaDxicj5A
QCAtMTMsNyArMTMsOCBAQCBkZXZpY2Vfc2VydmljZV9yZXF1ZXN0PTA8YnI+PGJyPsKgIyBBdHRl
c3RhdGlvbiBEYXRhPGJyPsKgR09MREVOX1BDUl9TRUxFQ1RJT049JnF1b3Q7c2hhMTowLDEsMitz
aGEyNTY6MCwxLDImcXVvdDs8YnI+LUdPTERFTl9QQ1I9JnF1b3Q7NTliZjkwOTFmNGNiYmQyYTg3
OTZiZmUwODZhNTAxYzU3MjI2YzQyNzM5ZGNmOGFkMzIzZTc0OTNhZDUxZTM4ZiZxdW90Ozxicj4r
IyBHT0xERU5fUENSPSZxdW90OzU5YmY5MDkxZjRjYmJkMmE4Nzk2YmZlMDg2YTUwMWM1NzIyNmM0
MjczOWRjZjhhZDMyM2U3NDkzYWQ1MWUzOGYmcXVvdDs8YnI+K0dPTERFTl9QQ1I9JnF1b3Q7Yzdi
NTQ0ZTAzNTk2MTRjODk2ZWQzMmIwZmQ3ZmFkNDNjMzJiYTdlMTlkNGI2MTNjZGJkYTE2MmY3ODRi
NTc4MSZxdW90Ozxicj48YnI+wqAjIFNlcnZpY2UgRGF0YTxicj7CoFNFUlZJQ0VfQ09OVEVOVD0m
cXVvdDtIZWxsbyB3b3JsZCEmcXVvdDs8YnI+QEAgLTE3NSw3ICsxNzYsNyBAQCBzeXN0ZW1fc29m
dHdhcmVfc3RhdGVfdmFsaWRhdGlvbigpIHs8YnI+wqAgwqAgc29mdHdhcmVfc3RhdHVzX3N0cmlu
Zz0mcXVvdDtBdHRlc3RhdGlvbiBxdW90ZSBzaWduYXR1cmUgdmFsaWRhdGlvbiZxdW90Ozxicj7C
oCDCoCB0cG0yX2NoZWNrcXVvdGUgLS1wdWJsaWMgZF9zX3NlcnZpY2VfYWlrLnB1YiDCoC0tcXVh
bGlmaWNhdGlvbiAmcXVvdDskTk9OQ0UmcXVvdDsgXDxicj7CoCDCoCAtLW1lc3NhZ2UgYXR0ZXN0
YXRpb25fcXVvdGUuZGF0IC0tc2lnbmF0dXJlIGF0dGVzdGF0aW9uX3F1b3RlLnNpZ25hdHVyZSBc
PGJyPi0gwqAgLS1wY3IgcGNyLmJpbiAtUTxicj4rIMKgIC0tcGNyIC4uL0ROL3Bjci5iaW4gLVE8
YnI+wqAgwqAgcmV0dmFsPSQ/PGJyPsKgIMKgIHJtIC1mIGF0dGVzdGF0aW9uX3F1b3RlLnNpZ25h
dHVyZTxicj7CoCDCoCBpZiBbICRyZXR2YWwgPT0gMSBdO3RoZW48YnI+PC9mb250PjwvZGl2Pjxk
aXY+PGZvbnQgZmFjZT0ibW9ub3NwYWNlIj48YnI+PC9mb250PjwvZGl2PjxkaXY+SG9wZSB0aGlz
IGhlbHBzIGFueW9uZSB3aG8gbWF5IHRyeSB0byBydW4gdGhlIHNjcmlwdHMuPC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj5NZWFud2hpbGUsIEkgd29uZGVyIGhvdyB0aGUgc2VxdWVuY2UgZGlhZ3Jh
bSBhbmQgdGhlIHNjcmlwdHMgbWF5IGRpZmZlciB3aGVuIHByaXZhY3kgaXMgbm90IGEgY29uY2Vy
bjsgYW5kIHdvdWxkIGFwcHJlY2lhdGXCoGFueSBwb2ludGVycyBvciBoaW50cy48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PlJlZ2FyZHMsPC9kaXY+PGRpdj5IYW5zb248L2Rpdj48L2Rpdj4K

--===============2802443337047175561==--

