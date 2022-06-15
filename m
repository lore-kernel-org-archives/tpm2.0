Content-Type: multipart/mixed; boundary="===============6255477132039290910=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Ecrypting and decrypting a file using a TPM2
Date: Tue, 14 Jun 2022 17:27:31 -0700
Message-ID: <CAOCvsS=d4=+oVOcbD0yv4CYBVA3QGJgUtJfOKBOayejyApv18Q@mail.gmail.com>
In-Reply-To: 20220615000601.1682.85901@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6255477132039290910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Generally bulk symmetric encryption is a feature real TPMs don't
implement.  What you do is generate a random transmission key for AES
encryption with something like OpenSSLs libcrypto and encrypt that
ephemeral key with the TPM.

On Tue, Jun 14, 2022, 5:06 PM <dawn.howe(a)alten.com> wrote:

> I am writing a c++ application on ubuntu 22.04 server that needs to
> encrypt and decrypt files and am using the FAPI api. The files need to be
> secured until the application uses them at a later time, so I am receiving
> plain files and encrypting them using Fapi_Encrypt().
>
> I tried following the pattern in the integration tests found in the
> tpm2-tools. (tpm2-tools/test/integration/fapi/fapi-encrypt-decrypt.sh)
>
> It basically does the following:
> Fapi_Initialize(&global_fapi_context, NULL);
> Fapi_Provision (global_fapi_context, NULL, NULL, NULL);
>
> const char * key_type =3D "noDa, decrypt, system";
> char * auth_value =3D NULL; // no password
> char * policy_path =3D NULL;
> Fapi_CreateKey (global_fapi_context, key_path, key_type, policy_path,
> auth_value);
>
> Fapi_Encrypt (global_fapi_context, key_path, (const uint8_t*)data, size,
> &cipherText, &cipherTextSize);
>
> The files (data buffer) I need to encrypt are about 3k bytes big.
>
> The encryption fails because the file is too big. The error comes from
> .../tpm2-tss/src/tss2-fapi/api/Fapi_Encrypt.c line 309:
>
> if (encKeyObject->misc.key.public.publicArea.type =3D=3D TPM2_ALG_RSA) {
>                 TPM2B_DATA null_data =3D { .size =3D 0, .buffer =3D {} };
>                 TPM2B_PUBLIC_KEY_RSA *rsa_message =3D (TPM2B_PUBLIC_KEY_R=
SA
> *)&context->aux_data;
>                 size_t key_size =3D
>
> encKeyObject->misc.key.public.publicArea.parameters.rsaDetail.keyBits / 8;
>                 if (context->cmd.Data_EncryptDecrypt.in_dataSize >
> key_size) {
>                     goto_error_reset_state(r, TSS2_FAPI_RC_BAD_VALUE,
>                                            "Size to big for RSA
> encryption.", error_cleanup);
>
>
> Is my strategy completely wrong? What's the proper way to do this?  Is my
> strategy ok, but need to generate a different type of key?
>
> I'm new to this technology and am curious how it ought to be done.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============6255477132039290910==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPjxkaXY+R2VuZXJhbGx5IGJ1bGsgc3ltbWV0cmljIGVuY3J5cHRpb24g
aXMgYSBmZWF0dXJlIHJlYWwgVFBNcyBkb24mIzM5O3QgaW1wbGVtZW50LsKgIFdoYXQgeW91IGRv
IGlzIGdlbmVyYXRlIGEgcmFuZG9tIHRyYW5zbWlzc2lvbiBrZXkgZm9yIEFFUyBlbmNyeXB0aW9u
IHdpdGggc29tZXRoaW5nIGxpa2UgT3BlblNTTHMgbGliY3J5cHRvIGFuZCBlbmNyeXB0IHRoYXQg
ZXBoZW1lcmFsIGtleSB3aXRoIHRoZSBUUE0uPGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90
ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFR1ZSwgSnVuIDE0LCAyMDIy
LCA1OjA2IFBNICAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRhd24uaG93ZUBhbHRlbi5jb20iPmRhd24u
aG93ZUBhbHRlbi5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9
ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNj
Y2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+SSBhbSB3cml0aW5nIGEgYysrIGFwcGxpY2F0aW9u
IG9uIHVidW50dSAyMi4wNCBzZXJ2ZXIgdGhhdCBuZWVkcyB0byBlbmNyeXB0IGFuZCBkZWNyeXB0
IGZpbGVzIGFuZCBhbSB1c2luZyB0aGUgRkFQSSBhcGkuIFRoZSBmaWxlcyBuZWVkIHRvIGJlIHNl
Y3VyZWQgdW50aWwgdGhlIGFwcGxpY2F0aW9uIHVzZXMgdGhlbSBhdCBhIGxhdGVyIHRpbWUsIHNv
IEkgYW0gcmVjZWl2aW5nIHBsYWluIGZpbGVzIGFuZCBlbmNyeXB0aW5nIHRoZW0gdXNpbmcgRmFw
aV9FbmNyeXB0KCkuIDxicj4KPGJyPgpJIHRyaWVkIGZvbGxvd2luZyB0aGUgcGF0dGVybiBpbiB0
aGUgaW50ZWdyYXRpb24gdGVzdHMgZm91bmQgaW4gdGhlIHRwbTItdG9vbHMuICh0cG0yLXRvb2xz
L3Rlc3QvaW50ZWdyYXRpb24vZmFwaS9mYXBpLWVuY3J5cHQtZGVjcnlwdC5zaCk8YnI+Cjxicj4K
SXQgYmFzaWNhbGx5IGRvZXMgdGhlIGZvbGxvd2luZzo8YnI+CkZhcGlfSW5pdGlhbGl6ZSgmYW1w
O2dsb2JhbF9mYXBpX2NvbnRleHQsIE5VTEwpOzxicj4KRmFwaV9Qcm92aXNpb24gKGdsb2JhbF9m
YXBpX2NvbnRleHQsIE5VTEwsIE5VTEwsIE5VTEwpOzxicj4KPGJyPgpjb25zdCBjaGFyICoga2V5
X3R5cGUgPSAmcXVvdDtub0RhLCBkZWNyeXB0LCBzeXN0ZW0mcXVvdDs7PGJyPgpjaGFyICogYXV0
aF92YWx1ZSA9IE5VTEw7IC8vIG5vIHBhc3N3b3JkPGJyPgpjaGFyICogcG9saWN5X3BhdGggPSBO
VUxMOzxicj4KRmFwaV9DcmVhdGVLZXkgKGdsb2JhbF9mYXBpX2NvbnRleHQsIGtleV9wYXRoLCBr
ZXlfdHlwZSwgcG9saWN5X3BhdGgsIGF1dGhfdmFsdWUpOzxicj4KPGJyPgpGYXBpX0VuY3J5cHQg
KGdsb2JhbF9mYXBpX2NvbnRleHQsIGtleV9wYXRoLCAoY29uc3QgdWludDhfdCopZGF0YSwgc2l6
ZSwgJmFtcDtjaXBoZXJUZXh0LCAmYW1wO2NpcGhlclRleHRTaXplKTs8YnI+Cjxicj4KVGhlIGZp
bGVzIChkYXRhIGJ1ZmZlcikgSSBuZWVkIHRvIGVuY3J5cHQgYXJlIGFib3V0IDNrIGJ5dGVzIGJp
Zy4gPGJyPgo8YnI+ClRoZSBlbmNyeXB0aW9uIGZhaWxzIGJlY2F1c2UgdGhlIGZpbGUgaXMgdG9v
IGJpZy4gVGhlIGVycm9yIGNvbWVzIGZyb20gPGJyPgouLi4vdHBtMi10c3Mvc3JjL3RzczItZmFw
aS9hcGkvRmFwaV9FbmNyeXB0LmMgbGluZSAzMDk6PGJyPgo8YnI+CmlmIChlbmNLZXlPYmplY3Qt
Jmd0O21pc2Mua2V5LnB1YmxpYy5wdWJsaWNBcmVhLnR5cGUgPT0gVFBNMl9BTEdfUlNBKSB7PGJy
PgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBUUE0yQl9EQVRBIG51bGxfZGF0YSA9IHsgLnNpemUg
PSAwLCAuYnVmZmVyID0ge30gfTs8YnI+CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFRQTTJCX1BV
QkxJQ19LRVlfUlNBICpyc2FfbWVzc2FnZSA9IChUUE0yQl9QVUJMSUNfS0VZX1JTQSAqKSZhbXA7
Y29udGV4dC0mZ3Q7YXV4X2RhdGE7PGJyPgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzaXplX3Qg
a2V5X3NpemUgPTxicj4KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW5jS2V5T2JqZWN0
LSZndDttaXNjLmtleS5wdWJsaWMucHVibGljQXJlYS5wYXJhbWV0ZXJzLnJzYURldGFpbC5rZXlC
aXRzIC8gODs8YnI+CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChjb250ZXh0LSZndDtjbWQu
RGF0YV9FbmNyeXB0RGVjcnlwdC5pbl9kYXRhU2l6ZSAmZ3Q7IGtleV9zaXplKSB7PGJyPgrCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvX2Vycm9yX3Jlc2V0X3N0YXRlKHIsIFRTUzJf
RkFQSV9SQ19CQURfVkFMVUUsPGJyPgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O1NpemUgdG8gYmlnIGZvciBSU0Eg
ZW5jcnlwdGlvbi4mcXVvdDssIGVycm9yX2NsZWFudXApOzxicj4KPGJyPgo8YnI+CklzIG15IHN0
cmF0ZWd5IGNvbXBsZXRlbHkgd3Jvbmc/IFdoYXQmIzM5O3MgdGhlIHByb3BlciB3YXkgdG8gZG8g
dGhpcz/CoCBJcyBteSBzdHJhdGVneSBvaywgYnV0IG5lZWQgdG8gZ2VuZXJhdGUgYSBkaWZmZXJl
bnQgdHlwZSBvZiBrZXk/PGJyPgo8YnI+CkkmIzM5O20gbmV3IHRvIHRoaXMgdGVjaG5vbG9neSBh
bmQgYW0gY3VyaW91cyBob3cgaXQgb3VnaHQgdG8gYmUgZG9uZS48YnI+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgp0cG0yIG1haWxpbmcgbGlzdCAt
LSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9
Im5vcmVmZXJyZXIiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KVG8gdW5zdWJzY3JpYmUgc2Vu
ZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRh
cmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9h
Pjxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1l
KXM8YnI+CjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============6255477132039290910==--

