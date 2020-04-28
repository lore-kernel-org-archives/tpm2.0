Content-Type: multipart/mixed; boundary="===============3271634297544496285=="
MIME-Version: 1.0
From: Muthukumar S <muthu.smk at gmail.com>
Subject: [tpm2] Re: Usage of openssl command line API as library function
Date: Tue, 28 Apr 2020 22:08:08 +0530
Message-ID: <CANGCWd0JcFe4oM=E=CUqBmhbiKpyb8_qpd77iDBd5CqTO=PyPQ@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649ED855D@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3271634297544496285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Robert,

Thanks for your quick response.

As you said , I am exactly looking for openssl symmetric key operation.

As said in my intial thead ,below are the implementation that I have done
so far in my application.

1) created rsa "priv_key" using tpm2tss-rsa-gen key using tpm
2) created a random key (and saved as input_random_key) using
Esys_GetRandom() using tpm and kept as it is .

3) By using below openssl s/w APIs ,just want to encrypt the "private key"
along with "random key" and save the encrypted file .
openssl enc -aes-256-cbc -salt -in priv_key -out output_enc_key -k
input_random_key

4) do decrypt with below openssl command with input "random key" and get
back the "private key"
openssl enc -aes-256-cbc -d -in output_enc_key -out decrypted_output_key -k
input_random_rum

Here comes my query, *how to use the above two openssl command line API* *as
an library function* inside "c" code.

Thanks,
Muthukumar


On Tue, Apr 28, 2020, 8:12 PM Roberts, William C <
william.c.roberts(a)intel.com wrote:

> After you generate the keypair, can't you call:
> openssl rsa -in key.pem -pubout -out pubkey.pem
>
> Specifying the inkey and the engine, there are examples in the
> Test scripts. Then from there you have a normal public key pem file
> You can pass to openssl like normal without engine stuff, so it wont
> Use the engine and just do software.
>
> If you want a random key, again just generate it and use the openssl
> symmetric
> Key operations. So if you wanted to do something like encrypt a file and
> share
> The decryption key, the steps would be
> 1. generate aes key
> 2. encrypt the file data
> 3. encrypt the key with the public key
> 4. decrypt the key with the private key
> 5. decrypt the file with the obtained decrypted aes key
>
>
> > -----Original Message-----
> > From: muthu.smk(a)gmail.com [mailto:muthu.smk(a)gmail.com]
> > Sent: Tuesday, April 28, 2020 7:33 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] Re: Usage of openssl command line API as library
> function along
> > with tpm-tss engine
> >
> > seems this iesys_crypto_sym_aes_encrypt() API and
> iesys_crypto_pk_encrypt()
> > API uses TPM for encryption and decryption .  What i want is to use pure
> openssl
> > API (s/w based encryption) with the input of tpm generated hardware priv
> key
> > and random key and do encrypt & decrypt it as explained in the first
> thread .
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============3271634297544496285==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPkhpIFJvYmVydCw8ZGl2IGRpcj0iYXV0byI+PGJyPjxkaXYgZGlyPSJh
dXRvIj5UaGFua3MgZm9yIHlvdXIgcXVpY2sgcmVzcG9uc2UuPGJyPjxkaXYgZGlyPSJhdXRvIj48
YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPkFzIHlvdSBzYWlkICwgSSBhbSBleGFjdGx5IGxvb2tp
bmcgZm9yIG9wZW5zc2wgc3ltbWV0cmljIGtleSBvcGVyYXRpb24uPC9kaXY+PGRpdiBkaXI9ImF1
dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+QXMgc2FpZCBpbiBteSBpbnRpYWwgdGhlYWQg
LGJlbG93IGFyZSB0aGUgaW1wbGVtZW50YXRpb24gdGhhdCBJIGhhdmUgZG9uZSBzbyBmYXIgaW4g
bXkgYXBwbGljYXRpb24uPC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0i
YXV0byI+MSkgY3JlYXRlZCByc2EgJnF1b3Q7cHJpdl9rZXkmcXVvdDsgdXNpbmcgdHBtMnRzcy1y
c2EtZ2VuIGtleSB1c2luZyB0cG3CoDwvZGl2PjxkaXYgZGlyPSJhdXRvIj4yKSBjcmVhdGVkIGEg
cmFuZG9tIGtleSAoYW5kIHNhdmVkIGFzIGlucHV0X3JhbmRvbV9rZXkpIHVzaW5nIEVzeXNfR2V0
UmFuZG9tKCkgdXNpbmcgdHBtIGFuZCBrZXB0IGFzIGl0IGlzIC48L2Rpdj48ZGl2IGRpcj0iYXV0
byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj4zKSBCeSB1c2luZyBiZWxvdyBvcGVuc3NsIHMv
dyBBUElzICxqdXN0IHdhbnQgdG8gZW5jcnlwdCB0aGUgJnF1b3Q7cHJpdmF0ZSBrZXkmcXVvdDsg
YWxvbmcgd2l0aCAmcXVvdDtyYW5kb20ga2V5JnF1b3Q7IGFuZCBzYXZlIHRoZSBlbmNyeXB0ZWQg
ZmlsZSAuPC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpzYW5z
LXNlcmlmO2ZvbnQtc2l6ZToxMi44cHgiPm9wZW5zc2wgZW5jIC1hZXMtMjU2LWNiYyAtc2FsdCAt
aW4gcHJpdl9rZXkgLW91dCBvdXRwdXRfZW5jX2tleSAtayBpbnB1dF9yYW5kb21fa2V5PC9zcGFu
PjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjQpIGRvIGRl
Y3J5cHQgd2l0aCBiZWxvdyBvcGVuc3NsIGNvbW1hbmQgd2l0aCBpbnB1dCAmcXVvdDtyYW5kb20g
a2V5JnF1b3Q7IGFuZCBnZXQgYmFjayB0aGUgJnF1b3Q7cHJpdmF0ZSBrZXkmcXVvdDvCoDxicj48
L2Rpdj48ZGl2IGRpcj0iYXV0byI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OnNhbnMtc2VyaWY7
Zm9udC1zaXplOjEyLjhweCI+b3BlbnNzbCBlbmMgLWFlcy0yNTYtY2JjIC1kIC1pbiBvdXRwdXRf
ZW5jX2tleSAtb3V0IGRlY3J5cHRlZF9vdXRwdXRfa2V5IC1rwqA8L3NwYW4+PHNwYW4gc3R5bGU9
ImZvbnQtZmFtaWx5OnNhbnMtc2VyaWY7Zm9udC1zaXplOjEyLjhweCI+aW5wdXRfcmFuZG9tX3J1
bTwvc3Bhbj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0
byI+SGVyZSBjb21lcyBteSBxdWVyeSwgPGI+aG93IHRvIHVzZSB0aGUgYWJvdmUgdHdvIG9wZW5z
c2wgY29tbWFuZCBsaW5lIEFQSTwvYj7CoDxiPmFzIGFuIGxpYnJhcnkgZnVuY3Rpb248L2I+IGlu
c2lkZSAmcXVvdDtjJnF1b3Q7IGNvZGUuPC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48
ZGl2IGRpcj0iYXV0byI+VGhhbmtzLDwvZGl2PjxkaXYgZGlyPSJhdXRvIj5NdXRodWt1bWFyPC9k
aXY+PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSIgZGlyPSJhdXRvIj48ZGl2IGRpcj0i
bHRyIj5PbiBUdWUsIEFwciAyOCwgMjAyMCwgODoxMiBQTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0
OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHJlbD0ibm9yZWZl
cnJlciBub3JlZmVycmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb208L2E+IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21h
aWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBz
b2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij5BZnRlciB5b3UgZ2VuZXJhdGUgdGhlIGtleXBhaXIsIGNh
biYjMzk7dCB5b3UgY2FsbDo8YnI+Cm9wZW5zc2wgcnNhIC1pbiBrZXkucGVtIC1wdWJvdXQgLW91
dCBwdWJrZXkucGVtPGJyPgo8YnI+ClNwZWNpZnlpbmcgdGhlIGlua2V5IGFuZCB0aGUgZW5naW5l
LCB0aGVyZSBhcmUgZXhhbXBsZXMgaW4gdGhlPGJyPgpUZXN0IHNjcmlwdHMuIFRoZW4gZnJvbSB0
aGVyZSB5b3UgaGF2ZSBhIG5vcm1hbCBwdWJsaWMga2V5IHBlbSBmaWxlPGJyPgpZb3UgY2FuIHBh
c3MgdG8gb3BlbnNzbCBsaWtlIG5vcm1hbCB3aXRob3V0IGVuZ2luZSBzdHVmZiwgc28gaXQgd29u
dDxicj4KVXNlIHRoZSBlbmdpbmUgYW5kIGp1c3QgZG8gc29mdHdhcmUuPGJyPgo8YnI+CklmIHlv
dSB3YW50IGEgcmFuZG9tIGtleSwgYWdhaW4ganVzdCBnZW5lcmF0ZSBpdCBhbmQgdXNlIHRoZSBv
cGVuc3NsIHN5bW1ldHJpYzxicj4KS2V5IG9wZXJhdGlvbnMuIFNvIGlmIHlvdSB3YW50ZWQgdG8g
ZG8gc29tZXRoaW5nIGxpa2UgZW5jcnlwdCBhIGZpbGUgYW5kIHNoYXJlPGJyPgpUaGUgZGVjcnlw
dGlvbiBrZXksIHRoZSBzdGVwcyB3b3VsZCBiZTxicj4KMS4gZ2VuZXJhdGUgYWVzIGtleTxicj4K
Mi4gZW5jcnlwdCB0aGUgZmlsZSBkYXRhPGJyPgozLiBlbmNyeXB0IHRoZSBrZXkgd2l0aCB0aGUg
cHVibGljIGtleTxicj4KNC4gZGVjcnlwdCB0aGUga2V5IHdpdGggdGhlIHByaXZhdGUga2V5PGJy
Pgo1LiBkZWNyeXB0IHRoZSBmaWxlIHdpdGggdGhlIG9idGFpbmVkIGRlY3J5cHRlZCBhZXMga2V5
PGJyPgo8YnI+Cjxicj4KJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4KJmd0OyBG
cm9tOiA8YSBocmVmPSJtYWlsdG86bXV0aHUuc21rQGdtYWlsLmNvbSIgcmVsPSJub3JlZmVycmVy
IG5vcmVmZXJyZXIgbm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bXV0aHUu
c21rQGdtYWlsLmNvbTwvYT4gW21haWx0bzo8YSBocmVmPSJtYWlsdG86bXV0aHUuc21rQGdtYWls
LmNvbSIgcmVsPSJub3JlZmVycmVyIG5vcmVmZXJyZXIgbm9yZWZlcnJlciBub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+bXV0aHUuc21rQGdtYWlsLmNvbTwvYT5dPGJyPgomZ3Q7IFNlbnQ6IFR1
ZXNkYXksIEFwcmlsIDI4LCAyMDIwIDc6MzMgQU08YnI+CiZndDsgVG86IDxhIGhyZWY9Im1haWx0
bzp0cG0yQGxpc3RzLjAxLm9yZyIgcmVsPSJub3JlZmVycmVyIG5vcmVmZXJyZXIgbm9yZWZlcnJl
ciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgom
Z3Q7IFN1YmplY3Q6IFt0cG0yXSBSZTogVXNhZ2Ugb2Ygb3BlbnNzbCBjb21tYW5kIGxpbmUgQVBJ
IGFzIGxpYnJhcnkgZnVuY3Rpb24gYWxvbmc8YnI+CiZndDsgd2l0aCB0cG0tdHNzIGVuZ2luZTxi
cj4KJmd0OyA8YnI+CiZndDsgc2VlbXMgdGhpcyBpZXN5c19jcnlwdG9fc3ltX2Flc19lbmNyeXB0
KCkgQVBJIGFuZCBpZXN5c19jcnlwdG9fcGtfZW5jcnlwdCgpPGJyPgomZ3Q7IEFQSSB1c2VzIFRQ
TSBmb3IgZW5jcnlwdGlvbiBhbmQgZGVjcnlwdGlvbiAuwqAgV2hhdCBpIHdhbnQgaXMgdG8gdXNl
IHB1cmUgb3BlbnNzbDxicj4KJmd0OyBBUEkgKHMvdyBiYXNlZCBlbmNyeXB0aW9uKSB3aXRoIHRo
ZSBpbnB1dCBvZiB0cG0gZ2VuZXJhdGVkIGhhcmR3YXJlIHByaXYga2V5PGJyPgomZ3Q7IGFuZCBy
YW5kb20ga2V5IGFuZCBkbyBlbmNyeXB0ICZhbXA7IGRlY3J5cHQgaXQgYXMgZXhwbGFpbmVkIGlu
IHRoZSBmaXJzdCB0aHJlYWQgLjxicj4KJmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXzxicj4KJmd0OyB0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVm
PSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIG5v
cmVmZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9h
Pjxicj4KJmd0OyBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0
bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgcmVsPSJub3JlZmVycmVyIG5vcmVmZXJyZXIgbm9y
ZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5v
cmc8L2E+PGJyPgomZ3Q7ICUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50
ZXJuYWxfbmFtZSlzPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+CjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============3271634297544496285==--

