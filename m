Content-Type: multipart/mixed; boundary="===============6102591216482257177=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] OpenSSL Compatibility in tpm2_MakeCredential
Date: Fri, 16 Aug 2019 14:03:46 -0700
Message-ID: <CAP3jAwT0xBrQj_-vhpzERd=Nwv=wjwZG_pKfHCmG=P-tziJdFg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6102591216482257177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Experts,

What is OpenSSL version being used to implement the TPM_MakeCredential off
the TPM chip? (i'm talking about the tpm2_makecredential.c code in
tpm2_tools/, that has 2 implementations, one using TPM chip and one using
OpenSSL)

I copied the code on my server but it seems that mine supports 1.0.2n and
my manager said that they will not upgrade to newer versions until next
year.

How can I compile this ? How do I make it compatible with 1.0.2n are there
ways to copy code present in  the  OpenSSL version used in tpm2_tools?
* This is a snippet of the compiler errors I get in my local file:*
*tpm2_common.c: In function =E2=80=98encrypt_seed_with_rsa_public_key=E2=80=
=99:*
*tpm2_common.c:894:5: warning: implicit declaration of function
=E2=80=98RSA_padding_add_PKCS1_OAEP_mgf1=E2=80=99 [-Wimplicit-function-decl=
aration]*
*     int return_code =3D RSA_padding_add_PKCS1_OAEP_mgf1(encoded,*
*     ^*
*tpm2_common.c: In function =E2=80=98aes_encrypt_buffers=E2=80=99:*
*tpm2_common.c:1194:5: warning: implicit declaration of function
=E2=80=98tpm_alg_to_ossl=E2=80=99 [-Wimplicit-function-declaration]*
*     const EVP_CIPHER *cipher =3D tpm_alg_to_ossl(sym);*
*...*
*tpm2_common.c:1441:5: error: incompatible type for argument 1 of
=E2=80=98EVP_DigestUpdate=E2=80=99*
*     return EVP_DigestUpdate(ctx->md_ctx, data, len);*
*     ^*
*In file included from tpm2_common.c:11:0:*
*/usr/include/node/openssl/evp.h:573:5: note: expected =E2=80=98struct EVP_=
MD_CTX
*=E2=80=99 but argument is of type =E2=80=98EVP_MD_CTX=E2=80=99*
* int EVP_DigestUpdate(EVP_MD_CTX *ctx, const void *d, size_t cnt);*
*     ^*
*tpm2_common.c: In function =E2=80=98HMAC_Final=E2=80=99:*
*tpm2_common.c:1452:5: error: incompatible type for argument 1 of
=E2=80=98EVP_DigestFinal_ex=E2=80=99*
*     if (!EVP_DigestFinal_ex(ctx->md_ctx, buf, &i))*

1.0.2 does not seem to have it or arguments are different!

Thanks,
Rahul
     ^

--===============6102591216482257177==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGVsbG8gRXhwZXJ0
cyw8ZGl2Pjxicj48L2Rpdj48ZGl2PldoYXQgaXMgT3BlblNTTCB2ZXJzaW9uIGJlaW5nIHVzZWQg
dG8gaW1wbGVtZW50IHRoZSBUUE1fTWFrZUNyZWRlbnRpYWwgb2ZmIHRoZSBUUE0gY2hpcD8gKGkm
IzM5O20gdGFsa2luZyBhYm91dCB0aGUgdHBtMl9tYWtlY3JlZGVudGlhbC5jIGNvZGUgaW4gdHBt
Ml90b29scy8sIHRoYXQgaGFzIDIgaW1wbGVtZW50YXRpb25zLCBvbmUgdXNpbmcgVFBNIGNoaXAg
YW5kIG9uZSB1c2luZyBPcGVuU1NMKTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBjb3BpZWQg
dGhlIGNvZGUgb24gbXkgc2VydmVyIGJ1dCBpdCBzZWVtcyB0aGF0IG1pbmUgc3VwcG9ydHMgMS4w
LjJuIGFuZCBteSBtYW5hZ2VyIHNhaWQgdGhhdCB0aGV5IHdpbGwgbm90IHVwZ3JhZGUgdG8gbmV3
ZXIgdmVyc2lvbnMgdW50aWwgbmV4dCB5ZWFyLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SG93
IGNhbiBJIGNvbXBpbGUgdGhpcyA/IEhvdyBkbyBJIG1ha2UgaXQgY29tcGF0aWJsZSB3aXRoIDEu
MC4ybiBhcmUgdGhlcmUgd2F5cyB0byBjb3B5IGNvZGUgcHJlc2VudCBpbiDCoHRoZSDCoE9wZW5T
U0wgdmVyc2lvbiB1c2VkIGluIHRwbTJfdG9vbHM/PC9kaXY+PGRpdj48dT48Yj7CoFRoaXMgaXMg
YSBzbmlwcGV0IG9mIHRoZSBjb21waWxlciBlcnJvcnMgSSBnZXQgaW4gbXkgbG9jYWwgZmlsZTo8
L2I+PC91PjwvZGl2PjxkaXY+PGRpdj48aT48Zm9udCBjb2xvcj0iIzAwMDBmZiI+dHBtMl9jb21t
b24uYzogSW4gZnVuY3Rpb24g4oCYZW5jcnlwdF9zZWVkX3dpdGhfcnNhX3B1YmxpY19rZXnigJk6
PC9mb250PjwvaT48L2Rpdj48ZGl2PjxpPjxmb250IGNvbG9yPSIjMDAwMGZmIj50cG0yX2NvbW1v
bi5jOjg5NDo1OiB3YXJuaW5nOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhS
U0FfcGFkZGluZ19hZGRfUEtDUzFfT0FFUF9tZ2Yx4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRl
Y2xhcmF0aW9uXTwvZm9udD48L2k+PC9kaXY+PGRpdj48aT48Zm9udCBjb2xvcj0iIzAwMDBmZiI+
wqAgwqAgwqBpbnQgcmV0dXJuX2NvZGUgPSBSU0FfcGFkZGluZ19hZGRfUEtDUzFfT0FFUF9tZ2Yx
KGVuY29kZWQsPC9mb250PjwvaT48L2Rpdj48ZGl2PjxpPjxmb250IGNvbG9yPSIjMDAwMGZmIj7C
oCDCoCDCoF48L2ZvbnQ+PC9pPjwvZGl2PjxkaXY+PGk+PGZvbnQgY29sb3I9IiMwMDAwZmYiPnRw
bTJfY29tbW9uLmM6IEluIGZ1bmN0aW9uIOKAmGFlc19lbmNyeXB0X2J1ZmZlcnPigJk6PC9mb250
PjwvaT48L2Rpdj48ZGl2PjxpPjxmb250IGNvbG9yPSIjMDAwMGZmIj50cG0yX2NvbW1vbi5jOjEx
OTQ6NTogd2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdHBtX2Fs
Z190b19vc3Ns4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXTwvZm9udD48L2k+
PC9kaXY+PGRpdj48aT48Zm9udCBjb2xvcj0iIzAwMDBmZiI+wqAgwqAgwqBjb25zdCBFVlBfQ0lQ
SEVSICpjaXBoZXIgPSB0cG1fYWxnX3RvX29zc2woc3ltKTs8L2ZvbnQ+PC9pPjwvZGl2PjwvZGl2
PjxkaXY+PGk+PGZvbnQgY29sb3I9IiMwMDAwZmYiPi4uLjwvZm9udD48L2k+PC9kaXY+PGRpdj48
ZGl2PjxpPjxmb250IGNvbG9yPSIjMDAwMGZmIj50cG0yX2NvbW1vbi5jOjE0NDE6NTogZXJyb3I6
IGluY29tcGF0aWJsZSB0eXBlIGZvciBhcmd1bWVudCAxIG9mIOKAmEVWUF9EaWdlc3RVcGRhdGXi
gJk8L2ZvbnQ+PC9pPjwvZGl2PjxkaXY+PGk+PGZvbnQgY29sb3I9IiMwMDAwZmYiPsKgIMKgIMKg
cmV0dXJuIEVWUF9EaWdlc3RVcGRhdGUoY3R4LSZndDttZF9jdHgsIGRhdGEsIGxlbik7PC9mb250
PjwvaT48L2Rpdj48ZGl2PjxpPjxmb250IGNvbG9yPSIjMDAwMGZmIj7CoCDCoCDCoF48L2ZvbnQ+
PC9pPjwvZGl2PjxkaXY+PGk+PGZvbnQgY29sb3I9IiMwMDAwZmYiPkluIGZpbGUgaW5jbHVkZWQg
ZnJvbSB0cG0yX2NvbW1vbi5jOjExOjA6PC9mb250PjwvaT48L2Rpdj48ZGl2PjxpPjxmb250IGNv
bG9yPSIjMDAwMGZmIj4vdXNyL2luY2x1ZGUvbm9kZS9vcGVuc3NsL2V2cC5oOjU3Mzo1OiBub3Rl
OiBleHBlY3RlZCDigJhzdHJ1Y3QgRVZQX01EX0NUWCAq4oCZIGJ1dCBhcmd1bWVudCBpcyBvZiB0
eXBlIOKAmEVWUF9NRF9DVFjigJk8L2ZvbnQ+PC9pPjwvZGl2PjxkaXY+PGk+PGZvbnQgY29sb3I9
IiMwMDAwZmYiPsKgaW50IEVWUF9EaWdlc3RVcGRhdGUoRVZQX01EX0NUWCAqY3R4LCBjb25zdCB2
b2lkICpkLCBzaXplX3QgY250KTs8L2ZvbnQ+PC9pPjwvZGl2PjxkaXY+PGk+PGZvbnQgY29sb3I9
IiMwMDAwZmYiPsKgIMKgIMKgXjwvZm9udD48L2k+PC9kaXY+PGRpdj48aT48Zm9udCBjb2xvcj0i
IzAwMDBmZiI+dHBtMl9jb21tb24uYzogSW4gZnVuY3Rpb24g4oCYSE1BQ19GaW5hbOKAmTo8L2Zv
bnQ+PC9pPjwvZGl2PjxkaXY+PGk+PGZvbnQgY29sb3I9IiMwMDAwZmYiPnRwbTJfY29tbW9uLmM6
MTQ1Mjo1OiBlcnJvcjogaW5jb21wYXRpYmxlIHR5cGUgZm9yIGFyZ3VtZW50IDEgb2Yg4oCYRVZQ
X0RpZ2VzdEZpbmFsX2V44oCZPC9mb250PjwvaT48L2Rpdj48ZGl2PjxpPjxmb250IGNvbG9yPSIj
MDAwMGZmIj7CoCDCoCDCoGlmICghRVZQX0RpZ2VzdEZpbmFsX2V4KGN0eC0mZ3Q7bWRfY3R4LCBi
dWYsICZhbXA7aSkpPC9mb250PjwvaT48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjEuMC4yIGRv
ZXMgbm90IHNlZW0gdG8gaGF2ZSBpdCBvciBhcmd1bWVudHMgYXJlIGRpZmZlcmVudCE8L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyw8L2Rpdj48ZGl2PlJhaHVsPC9kaXY+PGRpdj7CoCDC
oCDCoF48L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============6102591216482257177==--

