Content-Type: multipart/mixed; boundary="===============2650238870754312818=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: Re: [tpm2] what the different between 0x1d5 and 0x3d5
Date: Thu, 01 Nov 2018 15:47:39 +0800
Message-ID: <CA+tBKVjSH9vXnAgw_KjTubcOZX7v34OW0J-MmOgxdV7gziaHtw@mail.gmail.com>
In-Reply-To: 28a8dda7-a4a4-fc47-a86d-91747d94adf3@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2650238870754312818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

782     TSS2_RC rval =3D TSS2_RETRY_EXP(Tss2_Sys_Import(sapi_context, phand=
le,
783                 &sessionsData, enc_sensitive_key, public,
784                 private, encrypted_seed, sym_alg,
785                 imported_private, &npsessionsDataOut));
786     if (rval !=3D TPM2_RC_SUCCESS) {
787         LOG_ERROR("Tss2_Sys_Import() failed: %#x", rval);
788         return -1;
789     }


This function returns 0x3d5, and I don't know which parameter should be
checked.

On Thu, Nov 1, 2018 at 12:47 AM Tadeusz Struk <tadeusz.struk(a)intel.com>
wrote:

> On 10/31/18 2:15 AM, Terry An wrote:
> > [root(a)localhost tpm2-init]# tpm2_rc_decode  0x1d5
> > tpm:parameter(1):structure is the wrong size
> > [root(a)localhost tpm2-init]# tpm2_rc_decode  0x3d5
> > tpm:parameter(3):structure is the wrong size
> >
> > I'm so confusing where my code is wrong.
>
> The first error code indicates that the size of the
> first parameter is wrong, and the second error code
> says that the size of the third parameter is wrong.
> See section 6.6 of:
> https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-2-S=
tructures-01.38.pdf
> for details.
>
> --
> Tadeusz
>

--===============2650238870754312818==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj43ODLCoCDCoCDCoFRTUzJfUkMgcnZh
bCA9IFRTUzJfUkVUUllfRVhQKFRzczJfU3lzX0ltcG9ydChzYXBpX2NvbnRleHQsIHBoYW5kbGUs
PC9kaXY+PGRpdj43ODPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZhbXA7c2Vzc2lvbnNEYXRh
LCBlbmNfc2Vuc2l0aXZlX2tleSwgcHVibGljLDwvZGl2PjxkaXY+Nzg0wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBwcml2YXRlLCBlbmNyeXB0ZWRfc2VlZCwgc3ltX2FsZyw8L2Rpdj48ZGl2Pjc4
NcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW1wb3J0ZWRfcHJpdmF0ZSwgJmFtcDtucHNlc3Np
b25zRGF0YU91dCkpOzwvZGl2PjxkaXY+Nzg2wqAgwqAgwqBpZiAocnZhbCAhPSBUUE0yX1JDX1NV
Q0NFU1MpIHs8L2Rpdj48ZGl2Pjc4N8KgIMKgIMKgIMKgIMKgTE9HX0VSUk9SKCZxdW90O1RzczJf
U3lzX0ltcG9ydCgpIGZhaWxlZDogJSN4JnF1b3Q7LCBydmFsKTs8L2Rpdj48ZGl2Pjc4OMKgIMKg
IMKgIMKgIMKgcmV0dXJuIC0xOzwvZGl2PjxkaXY+Nzg5wqAgwqAgwqB9PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGlzIGZ1bmN0aW9uIHJldHVybnMgMHgzZDUsIGFu
ZCBJIGRvbiYjMzk7dCBrbm93IHdoaWNoIHBhcmFtZXRlciBzaG91bGQgYmUgY2hlY2tlZC48L2Rp
dj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIi
Pk9uIFRodSwgTm92IDEsIDIwMTggYXQgMTI6NDcgQU0gVGFkZXVzeiBTdHJ1ayAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOnRhZGV1c3ouc3RydWtAaW50ZWwuY29tIj50YWRldXN6LnN0cnVrQGludGVsLmNv
bTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRk
aW5nLWxlZnQ6MWV4Ij5PbiAxMC8zMS8xOCAyOjE1IEFNLCBUZXJyeSBBbiB3cm90ZTo8YnI+CiZn
dDsgW3Jvb3RAbG9jYWxob3N0IHRwbTItaW5pdF0jIHRwbTJfcmNfZGVjb2RlwqAgMHgxZDU8YnI+
CiZndDsgdHBtOnBhcmFtZXRlcigxKTpzdHJ1Y3R1cmUgaXMgdGhlIHdyb25nIHNpemU8YnI+CiZn
dDsgW3Jvb3RAbG9jYWxob3N0IHRwbTItaW5pdF0jIHRwbTJfcmNfZGVjb2RlwqAgMHgzZDU8YnI+
CiZndDsgdHBtOnBhcmFtZXRlcigzKTpzdHJ1Y3R1cmUgaXMgdGhlIHdyb25nIHNpemU8YnI+CiZn
dDsgPGJyPgomZ3Q7IEkmIzM5O20gc28gY29uZnVzaW5nIHdoZXJlIG15IGNvZGUgaXMgd3Jvbmcu
PGJyPgo8YnI+ClRoZSBmaXJzdCBlcnJvciBjb2RlIGluZGljYXRlcyB0aGF0IHRoZSBzaXplIG9m
IHRoZTxicj4KZmlyc3QgcGFyYW1ldGVyIGlzIHdyb25nLCBhbmQgdGhlIHNlY29uZCBlcnJvciBj
b2RlPGJyPgpzYXlzIHRoYXQgdGhlIHNpemUgb2YgdGhlIHRoaXJkIHBhcmFtZXRlciBpcyB3cm9u
Zy48YnI+ClNlZSBzZWN0aW9uIDYuNiBvZjogPGEgaHJlZj0iaHR0cHM6Ly90cnVzdGVkY29tcHV0
aW5nZ3JvdXAub3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy9UUE0tUmV2LTIuMC1QYXJ0LTItU3RydWN0
dXJlcy0wMS4zOC5wZGYiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
dHJ1c3RlZGNvbXB1dGluZ2dyb3VwLm9yZy93cC1jb250ZW50L3VwbG9hZHMvVFBNLVJldi0yLjAt
UGFydC0yLVN0cnVjdHVyZXMtMDEuMzgucGRmPC9hPjxicj4KZm9yIGRldGFpbHMuPGJyPgo8YnI+
Ci0tIDxicj4KVGFkZXVzejxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============2650238870754312818==--

