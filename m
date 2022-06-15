Content-Type: multipart/mixed; boundary="===============7454586950008747076=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: Ecrypting and decrypting a file using a TPM2
Date: Wed, 15 Jun 2022 15:21:21 +0200
Message-ID: <20220615152121.213AA4F3@centrum.cz>
In-Reply-To: CAOCvsS=d4=+oVOcbD0yv4CYBVA3QGJgUtJfOKBOayejyApv18Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7454586950008747076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I believe it may be easier to use openssl and its tpm2-openssl provider. Op=
enSSL can encrypt/decrypt files and the tpm2-openssl provider enables the u=
se of TPM-based keys.
=C2=A0
Petr
______________________________________________________________
> Od: "Steven Clark" <davolfman(a)gmail.com>
> Komu: dawn.howe(a)alten.com
> Datum: 15.06.2022 02:27
> P=C5=99edm=C4=9Bt: [tpm2] Re: Ecrypting and decrypting a file using a TPM2
>
> CC: <tpm2(a)lists.01.org>
Generally bulk symmetric encryption is a feature real TPMs don't implement.=
=C2=A0 What you do is generate a random transmission key for AES encryption=
 with something like OpenSSLs libcrypto and encrypt that ephemeral key with=
 the TPM.

On Tue, Jun 14, 2022, 5:06 PM <dawn.howe(a)alten.com <dawn.howe(a)alten.com=
>> wrote:I am writing a c++ application on ubuntu 22.04 server that needs t=
o encrypt and decrypt files and am using the FAPI api. The files need to be=
 secured until the application uses them at a later time, so I am receiving=
 plain files and encrypting them using Fapi_Encrypt(). =

 =

 I tried following the pattern in the integration tests found in the tpm2-t=
ools. (tpm2-tools/test/integration/fapi/fapi-encrypt-decrypt.sh)
 =

 It basically does the following:
 Fapi_Initialize(&global_fapi_context, NULL);
 Fapi_Provision (global_fapi_context, NULL, NULL, NULL);
 =

 const char * key_type =3D "noDa, decrypt, system";
 char * auth_value =3D NULL; // no password
 char * policy_path =3D NULL;
 Fapi_CreateKey (global_fapi_context, key_path, key_type, policy_path, auth=
_value);
 =

 Fapi_Encrypt (global_fapi_context, key_path, (const uint8_t*)data, size, &=
cipherText, &cipherTextSize);
 =

 The files (data buffer) I need to encrypt are about 3k bytes big. =

 =

 The encryption fails because the file is too big. The error comes from =

 .../tpm2-tss/src/tss2-fapi/api/Fapi_Encrypt.c line 309:
 =

 if (encKeyObject->misc.key.public.publicArea.type =3D=3D TPM2_ALG_RSA) {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TPM2B_DATA null_da=
ta =3D { .size =3D 0, .buffer =3D {} };
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TPM2B_PUBLIC_KEY_R=
SA *rsa_message =3D (TPM2B_PUBLIC_KEY_RSA *)&context->aux_data;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t key_size =
=3D
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encK=
eyObject->misc.key.public.publicArea.parameters.rsaDetail.keyBits / 8;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (context->cmd.D=
ata_EncryptDecrypt.in_dataSize > key_size) {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto=
_error_reset_state(r, TSS2_FAPI_RC_BAD_VALUE,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0"Size to big for RSA encryption.", error_cleanup);
 =

 =

 Is my strategy completely wrong? What's the proper way to do this?=C2=A0 I=
s my strategy ok, but need to generate a different type of key?
 =

 I'm new to this technology and am curious how it ought to be done.
 _______________________________________________
 tpm2 mailing list -- tpm2(a)lists.01.org <tpm2(a)lists.01.org>
 To unsubscribe send an email to tpm2-leave(a)lists.01.org <tpm2-leave(a)li=
sts.01.org>
 %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s


--===============7454586950008747076==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5JIGJlbGlldmUgaXQg
bWF5IGJlIGVhc2llciB0byB1c2Ugb3BlbnNzbCBhbmQgaXRzIHRwbTItb3BlbnNzbCBwcm92aWRl
ci4gT3BlblNTTCBjYW4gZW5jcnlwdC9kZWNyeXB0IGZpbGVzIGFuZCB0aGUgdHBtMi1vcGVuc3Ns
IHByb3ZpZGVyIGVuYWJsZXMgdGhlIHVzZSBvZiBUUE0tYmFzZWQga2V5cy48L3A+Cgo8cCBzdHls
ZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNwOzwvcD4KCjxwIHN0eWxl
PSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+UGV0cjwvcD4KCjxwIHN0eWxlPSJw
YWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+X19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnIgLz4KJmd0OyBPZDogIlN0
ZXZlbiBDbGFyayIgJmx0O2Rhdm9sZm1hbkBnbWFpbC5jb20mZ3Q7PGJyIC8+CiZndDsgS29tdTog
ZGF3bi5ob3dlQGFsdGVuLmNvbTxiciAvPgomZ3Q7IERhdHVtOiAxNS4wNi4yMDIyIDAyOjI3PGJy
IC8+CiZndDsgUMWZZWRtxJt0OiBbdHBtMl0gUmU6IEVjcnlwdGluZyBhbmQgZGVjcnlwdGluZyBh
IGZpbGUgdXNpbmcgYSBUUE0yPGJyIC8+CiZndDs8L3A+Cgo8cCBzdHlsZT0icGFkZGluZzowIDAg
MCAwOyBtYXJnaW46MCAwIDAgMDsiPiZndDsgQ0M6ICZsdDt0cG0yQGxpc3RzLjAxLm9yZyZndDs8
L3A+Cgo8ZGl2IGRpcj0iYXV0byI+CjxkaXY+R2VuZXJhbGx5IGJ1bGsgc3ltbWV0cmljIGVuY3J5
cHRpb24gaXMgYSBmZWF0dXJlIHJlYWwgVFBNcyBkb24ndCBpbXBsZW1lbnQuJm5ic3A7IFdoYXQg
eW91IGRvIGlzIGdlbmVyYXRlIGEgcmFuZG9tIHRyYW5zbWlzc2lvbiBrZXkgZm9yIEFFUyBlbmNy
eXB0aW9uIHdpdGggc29tZXRoaW5nIGxpa2UgT3BlblNTTHMgbGliY3J5cHRvIGFuZCBlbmNyeXB0
IHRoYXQgZXBoZW1lcmFsIGtleSB3aXRoIHRoZSBUUE0uPGJyIC8+CjxiciAvPgoKPGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPgo8ZGl2IGNsYXNzPSJnbWFpbF9hdHRyIiBkaXI9Imx0ciI+T24gVHVl
LCBKdW4gMTQsIDIwMjIsIDU6MDYgUE0gJmx0OzxhIGhyZWY9Im1haWx0bzpkYXduLmhvd2VAYWx0
ZW4uY29tIj5kYXduLmhvd2VAYWx0ZW4uY29tPC9hPiZndDsgd3JvdGU6PC9kaXY+CjxibG9ja3F1
b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjogMCAwIDAgLjhleDsgYm9yZGVy
LWxlZnQ6IDFweCAjY2NjIHNvbGlkOyBwYWRkaW5nLWxlZnQ6IDFleDsiPkkgYW0gd3JpdGluZyBh
IGMrKyBhcHBsaWNhdGlvbiBvbiB1YnVudHUgMjIuMDQgc2VydmVyIHRoYXQgbmVlZHMgdG8gZW5j
cnlwdCBhbmQgZGVjcnlwdCBmaWxlcyBhbmQgYW0gdXNpbmcgdGhlIEZBUEkgYXBpLiBUaGUgZmls
ZXMgbmVlZCB0byBiZSBzZWN1cmVkIHVudGlsIHRoZSBhcHBsaWNhdGlvbiB1c2VzIHRoZW0gYXQg
YSBsYXRlciB0aW1lLCBzbyBJIGFtIHJlY2VpdmluZyBwbGFpbiBmaWxlcyBhbmQgZW5jcnlwdGlu
ZyB0aGVtIHVzaW5nIEZhcGlfRW5jcnlwdCgpLiA8YnIgLz4KIDxiciAvPgogSSB0cmllZCBmb2xs
b3dpbmcgdGhlIHBhdHRlcm4gaW4gdGhlIGludGVncmF0aW9uIHRlc3RzIGZvdW5kIGluIHRoZSB0
cG0yLXRvb2xzLiAodHBtMi10b29scy90ZXN0L2ludGVncmF0aW9uL2ZhcGkvZmFwaS1lbmNyeXB0
LWRlY3J5cHQuc2gpPGJyIC8+CiA8YnIgLz4KIEl0IGJhc2ljYWxseSBkb2VzIHRoZSBmb2xsb3dp
bmc6PGJyIC8+CiBGYXBpX0luaXRpYWxpemUoJmFtcDtnbG9iYWxfZmFwaV9jb250ZXh0LCBOVUxM
KTs8YnIgLz4KIEZhcGlfUHJvdmlzaW9uIChnbG9iYWxfZmFwaV9jb250ZXh0LCBOVUxMLCBOVUxM
LCBOVUxMKTs8YnIgLz4KIDxiciAvPgogY29uc3QgY2hhciAqIGtleV90eXBlID0gIm5vRGEsIGRl
Y3J5cHQsIHN5c3RlbSI7PGJyIC8+CiBjaGFyICogYXV0aF92YWx1ZSA9IE5VTEw7IC8vIG5vIHBh
c3N3b3JkPGJyIC8+CiBjaGFyICogcG9saWN5X3BhdGggPSBOVUxMOzxiciAvPgogRmFwaV9DcmVh
dGVLZXkgKGdsb2JhbF9mYXBpX2NvbnRleHQsIGtleV9wYXRoLCBrZXlfdHlwZSwgcG9saWN5X3Bh
dGgsIGF1dGhfdmFsdWUpOzxiciAvPgogPGJyIC8+CiBGYXBpX0VuY3J5cHQgKGdsb2JhbF9mYXBp
X2NvbnRleHQsIGtleV9wYXRoLCAoY29uc3QgdWludDhfdCopZGF0YSwgc2l6ZSwgJmFtcDtjaXBo
ZXJUZXh0LCAmYW1wO2NpcGhlclRleHRTaXplKTs8YnIgLz4KIDxiciAvPgogVGhlIGZpbGVzIChk
YXRhIGJ1ZmZlcikgSSBuZWVkIHRvIGVuY3J5cHQgYXJlIGFib3V0IDNrIGJ5dGVzIGJpZy4gPGJy
IC8+CiA8YnIgLz4KIFRoZSBlbmNyeXB0aW9uIGZhaWxzIGJlY2F1c2UgdGhlIGZpbGUgaXMgdG9v
IGJpZy4gVGhlIGVycm9yIGNvbWVzIGZyb20gPGJyIC8+CiAuLi4vdHBtMi10c3Mvc3JjL3RzczIt
ZmFwaS9hcGkvRmFwaV9FbmNyeXB0LmMgbGluZSAzMDk6PGJyIC8+CiA8YnIgLz4KIGlmIChlbmNL
ZXlPYmplY3QtJmd0O21pc2Mua2V5LnB1YmxpYy5wdWJsaWNBcmVhLnR5cGUgPT0gVFBNMl9BTEdf
UlNBKSB7PGJyIC8+CiAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7IFRQTTJCX0RBVEEgbnVsbF9kYXRhID0geyAuc2l6ZSA9IDAsIC5idWZmZXIg
PSB7fSB9OzxiciAvPgogJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyBUUE0yQl9QVUJMSUNfS0VZX1JTQSAqcnNhX21lc3NhZ2UgPSAoVFBNMkJf
UFVCTElDX0tFWV9SU0EgKikmYW1wO2NvbnRleHQtJmd0O2F1eF9kYXRhOzxiciAvPgogJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBzaXplX3Qg
a2V5X3NpemUgPTxiciAvPgogJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IGVuY0tleU9iamVjdC0mZ3Q7bWlzYy5rZXku
cHVibGljLnB1YmxpY0FyZWEucGFyYW1ldGVycy5yc2FEZXRhaWwua2V5Qml0cyAvIDg7PGJyIC8+
CiAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
IGlmIChjb250ZXh0LSZndDtjbWQuRGF0YV9FbmNyeXB0RGVjcnlwdC5pbl9kYXRhU2l6ZSAmZ3Q7
IGtleV9zaXplKSB7PGJyIC8+CiAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgZ290b19lcnJvcl9yZXNldF9zdGF0ZShy
LCBUU1MyX0ZBUElfUkNfQkFEX1ZBTFVFLDxiciAvPgogJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7IlNpemUgdG8gYmlnIGZvciBSU0EgZW5jcnlwdGlvbi4iLCBlcnJvcl9j
bGVhbnVwKTs8YnIgLz4KIDxiciAvPgogPGJyIC8+CiBJcyBteSBzdHJhdGVneSBjb21wbGV0ZWx5
IHdyb25nPyBXaGF0J3MgdGhlIHByb3BlciB3YXkgdG8gZG8gdGhpcz8mbmJzcDsgSXMgbXkgc3Ry
YXRlZ3kgb2ssIGJ1dCBuZWVkIHRvIGdlbmVyYXRlIGEgZGlmZmVyZW50IHR5cGUgb2Yga2V5Pzxi
ciAvPgogPGJyIC8+CiBJJ20gbmV3IHRvIHRoaXMgdGVjaG5vbG9neSBhbmQgYW0gY3VyaW91cyBo
b3cgaXQgb3VnaHQgdG8gYmUgZG9uZS48YnIgLz4KIF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fPGJyIC8+CiB0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVm
PSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxiciAvPgog
VG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2
ZUBsaXN0cy4wMS5vcmciPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxiciAvPgogJSh3ZWJf
cGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8L2Jsb2NrcXVv
dGU+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjxiciAvPgoK

--===============7454586950008747076==--

