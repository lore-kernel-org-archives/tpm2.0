Content-Type: multipart/mixed; boundary="===============0671936615505939490=="
MIME-Version: 1.0
From: Ashok Kumar <ashokar.1980 at gmail.com>
Subject: [tpm2] Re: TPM Encryption Key
Date: Fri, 27 Mar 2020 12:04:26 +0530
Message-ID: <CAE8e83SWP_ZjKV36Hz__NU4M+dPO1aVkUAqhb8ZJ0pk8kLn96A@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EB246D@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0671936615505939490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Please see my response inline ... [ashoka]


On Thu, Mar 26, 2020 at 8:56 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

>
>
> > -----Original Message-----
> > From: Ashok Kumar [mailto:ashokar.1980(a)gmail.com]
> > Sent: Thursday, March 26, 2020 6:49 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] TPM Encryption Key
> >
> > Hello,
> >
> > Our requirement is to encrypt the given data (for example, private key)
> with TPM
> > key.
> > As and when required, decrypt the data using the TPM key and use it in
> the
> > application.
> >
> > To address this requirement, did the following.
> >
> > First time initialization:
> >
> > - Generated primary key under owner hierarchy
> > - Created the TPM symmetric key (which is used to encrypt/decrypt
> application
> > data)
> >   under the primary key.
> > - Used Esys_EvictControl() to store the TPM key handle in the TPM
> persistent
> > memory
> >
> > During Encryption/Decryption:
> >
> > - Used Esys_TR_FromTPMPublic() to fetch existing TPM key handle from the
> > persistent memory
>
> I don't understand, tpm2_evictcontrol will give you a persistent key
> handle that=E2=80=99s good.
> Why did you do this step, to get an ESYS_TR handle?
>

[ashoka]
Yes. If this API succeeds, I skipped the above mentioned initialization
steps (including primary key create)
during the process initialization. That was done just to save some time
during the initialization.
Agree that we don't need this step functionality wise as we can recreate
the same primary key handle.

If we make any change in the public params (though that is not expected) in
future release,
thought this approach would help to get the key handle used for encrypting
the private key.


> I also urge folks to use transient memory. tpm2_create will provide a
> public and
> private blob that can be loaded with tpm2_load and then used. Persistent
> memory
> is only so big. So use wisely.
>

[ashoka]
Sure, that sounds good.


>
> > - Used Esys_EncryptDecrypt() to encrypt/decrypt the given data
> >
> > Is this the right approach?
> >
> > It worked fine with simulator. However, it failed with "command code not
> > supported" error with TPM device.
>
> Not many TPMs support symmetric encryption:
>
> Let's look into your TPMs supported command set, do:
>
> tpm2_getcap  commands
>
> $ tpm2_getcap commands | grep -i encrypt
> TPM2_CC_EncryptDecrypt:
> TPM2_CC_RSA_Encrypt:
> TPM2_CC_EncryptDecrypt2:
>
> If you don't have them, it won't work.
>

[ashoka]

tpm2_getcap command is not available in my system. Instead, have
tpm2_dump_capability command.
Confirmed that TPM2_CC_EncryptDecrypt and TPM2_CC_EncryptDecrypt2 commands
are not supported.

RSA_Decrypt and RSA_Encrypt are supported

[admin(a)TPM2-VersaCSG-Ashok: ~] $ tpm2_dump_capability -p 2323 -c commands=
 |
grep -A 8 159
TPMA_CC: 0x02000159
  commandIndex: 0x159
  reserved1:    0x0
  nv:           clear
  extensive:    clear
  flushed:      clear
  cHandles:     0x1
  rHandle:      clear
  V:            clear
  Res:          0x0
[admin(a)TPM2-VersaCSG-Ashok: ~] $ tpm2_dump_capability -p 2323 -c commands=
 |
grep -A 8 174
TPMA_CC: 0x02000174
  commandIndex: 0x174
  reserved1:    0x0
  nv:           clear
  extensive:    clear
  flushed:      clear
  cHandles:     0x1
  rHandle:      clear
  V:            clear
  Res:          0x0

What you could do, is:
> 1. If you have to store externally generated private keys, use tpm2_impor=
t.
> 2. seal an AES key to the tpm with tpm2_create -I and wrap the key with
> that key.
>
> 1 is the better option. Because once you do that, you can scrub all
> unprotected occurrences of
> the key in plaintext, and let it be a managed TPM object, protected by the
> TPM.
>

[ashoka]
Thanks for your suggestion. After the tpm2_import, how do we get the plain
text (key) back?
What is the command to get the original text?

Thanks,
Ashok Kumar


>
> >
> > ---x---
> > WARNING:esys:src/tss2-
> > esys/api/Esys_EncryptDecrypt.c:324:Esys_EncryptDecrypt_Finish() Received
> TPM
> > Error
> >
> ERROR:esys:src/tss2-esys/api/Esys_EncryptDecrypt.c:110:Esys_EncryptDecryp=
t()
> > Esys Finish ErrorCode (0x00000143)
> > versa_tpm2_encrypt_decrypt.382: Esys_EncryptDecrypt failed; rc 0x143
> > Output:
> > main#568: Wrote 0 bytes of data
> > [admin(a)TPM2-VersaCSG-Ashok: ~] $ tpm2_rc_decode 0x143 error layer
> >   hex: 0x0
> >   identifier: TSS2_TPM_ERROR_LEVEL
> >   description: Error produced by the TPM format 0 error code
> >   hex: 0x43
> >   name: TPM_RC_COMMAND_CODE
> >   description: command code not supported
> >
> > ---x---
> >
> > From the tpm2_dump_capability, looks like Esys_EncryptDecrypt() and
> > Esys_EncryptDecrypt2() are not supported.
> >
> > For our usecase, what could be the right alternative method to use?
> Shall we use
> > Esys_RSA_Encrypt()? In that case, which scheme is better? TPM2_ALG_RSAES
> or
> > TPM2_ALG_OAEP?
> >
> >
> > Thanks,
> > Ashok Kumar
>

--===============0671936615505939490==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGVsbG8sPGRpdj48YnI+PC9kaXY+PGRpdj5Q
bGVhc2Ugc2VlIG15IHJlc3BvbnNlIGlubGluZSAuLi4gW2FzaG9rYV08L2Rpdj48ZGl2PjxiciBj
bGVhcj0iYWxsIj48YnI+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYg
ZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUaHUsIE1hciAyNiwgMjAyMCBhdCA4OjU2
IFBNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2Jl
cnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNv
bTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJn
YigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGJyPgo8YnI+CiZndDsgLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS08YnI+CiZndDsgRnJvbTogQXNob2sgS3VtYXIgW21haWx0bzo8YSBo
cmVmPSJtYWlsdG86YXNob2thci4xOTgwQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFzaG9r
YXIuMTk4MEBnbWFpbC5jb208L2E+XTxicj4KJmd0OyBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjYs
IDIwMjAgNjo0OSBBTTxicj4KJmd0OyBUbzogPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFN1Ympl
Y3Q6IFt0cG0yXSBUUE0gRW5jcnlwdGlvbiBLZXk8YnI+CiZndDsgPGJyPgomZ3Q7IEhlbGxvLDxi
cj4KJmd0OyA8YnI+CiZndDsgT3VyIHJlcXVpcmVtZW50IGlzIHRvIGVuY3J5cHQgdGhlIGdpdmVu
IGRhdGEgKGZvciBleGFtcGxlLCBwcml2YXRlIGtleSkgd2l0aCBUUE08YnI+CiZndDsga2V5Ljxi
cj4KJmd0OyBBcyBhbmQgd2hlbiByZXF1aXJlZCwgZGVjcnlwdCB0aGUgZGF0YSB1c2luZyB0aGUg
VFBNIGtleSBhbmQgdXNlIGl0IGluIHRoZTxicj4KJmd0OyBhcHBsaWNhdGlvbi48YnI+CiZndDsg
PGJyPgomZ3Q7IFRvIGFkZHJlc3MgdGhpcyByZXF1aXJlbWVudCwgZGlkIHRoZSBmb2xsb3dpbmcu
PGJyPgomZ3Q7IDxicj4KJmd0OyBGaXJzdCB0aW1lIGluaXRpYWxpemF0aW9uOjxicj4KJmd0OyA8
YnI+CiZndDsgLSBHZW5lcmF0ZWQgcHJpbWFyeSBrZXkgdW5kZXIgb3duZXIgaGllcmFyY2h5PGJy
PgomZ3Q7IC0gQ3JlYXRlZCB0aGUgVFBNIHN5bW1ldHJpYyBrZXkgKHdoaWNoIGlzIHVzZWQgdG8g
ZW5jcnlwdC9kZWNyeXB0IGFwcGxpY2F0aW9uPGJyPgomZ3Q7IGRhdGEpPGJyPgomZ3Q7wqAgwqB1
bmRlciB0aGUgcHJpbWFyeSBrZXkuPGJyPgomZ3Q7IC0gVXNlZCBFc3lzX0V2aWN0Q29udHJvbCgp
IHRvIHN0b3JlIHRoZSBUUE0ga2V5IGhhbmRsZSBpbiB0aGUgVFBNIHBlcnNpc3RlbnQ8YnI+CiZn
dDsgbWVtb3J5PGJyPgomZ3Q7IDxicj4KJmd0OyBEdXJpbmcgRW5jcnlwdGlvbi9EZWNyeXB0aW9u
Ojxicj4KJmd0OyA8YnI+CiZndDsgLSBVc2VkIEVzeXNfVFJfRnJvbVRQTVB1YmxpYygpIHRvIGZl
dGNoIGV4aXN0aW5nIFRQTSBrZXkgaGFuZGxlIGZyb20gdGhlPGJyPgomZ3Q7IHBlcnNpc3RlbnQg
bWVtb3J5PGJyPgo8YnI+CkkgZG9uJiMzOTt0IHVuZGVyc3RhbmQsIHRwbTJfZXZpY3Rjb250cm9s
IHdpbGwgZ2l2ZSB5b3UgYSBwZXJzaXN0ZW50IGtleSBoYW5kbGUgdGhhdOKAmXMgZ29vZC48YnI+
CldoeSBkaWQgeW91IGRvIHRoaXMgc3RlcCwgdG8gZ2V0IGFuIEVTWVNfVFIgaGFuZGxlPzxicj48
L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5bYXNob2thXTwvZGl2PjxkaXY+WWVzLiBJ
ZiB0aGlzIEFQSSBzdWNjZWVkcywgSSBza2lwcGVkIHRoZSBhYm92ZSBtZW50aW9uZWQgaW5pdGlh
bGl6YXRpb24gc3RlcHMgKGluY2x1ZGluZyBwcmltYXJ5IGtleSBjcmVhdGUpPC9kaXY+PGRpdj5k
dXJpbmcgdGhlIHByb2Nlc3MgaW5pdGlhbGl6YXRpb24uIFRoYXQgd2FzIGRvbmUganVzdCB0byBz
YXZlIHNvbWUgdGltZSBkdXJpbmcgdGhlIGluaXRpYWxpemF0aW9uLjwvZGl2PjxkaXY+QWdyZWUg
dGhhdCB3ZSBkb24mIzM5O3QgbmVlZCB0aGlzIHN0ZXAgZnVuY3Rpb25hbGl0eSB3aXNlIGFzIHdl
IGNhbiByZWNyZWF0ZSB0aGUgc2FtZSBwcmltYXJ5IGtleSBoYW5kbGUuPC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5JZiB3ZSBtYWtlIGFueSBjaGFuZ2UgaW4gdGhlIHB1YmxpYyBwYXJhbXMgKHRo
b3VnaCB0aGF0IGlzIG5vdCBleHBlY3RlZCnCoGluIGZ1dHVyZSByZWxlYXNlLDwvZGl2PjxkaXY+
dGhvdWdodCB0aGlzIGFwcHJvYWNoIHdvdWxkIGhlbHAgdG8gZ2V0IHRoZSBrZXkgaGFuZGxlIHVz
ZWQgZm9yIGVuY3J5cHRpbmcgdGhlIHByaXZhdGUga2V5LsKgPC9kaXY+PGRpdj7CoMKgPC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPgpJIGFsc28gdXJnZSBmb2xrcyB0byB1c2UgdHJhbnNpZW50IG1lbW9yeS4gdHBtMl9j
cmVhdGUgd2lsbCBwcm92aWRlIGEgcHVibGljIGFuZDxicj4KcHJpdmF0ZSBibG9iIHRoYXQgY2Fu
IGJlIGxvYWRlZCB3aXRoIHRwbTJfbG9hZCBhbmQgdGhlbiB1c2VkLiBQZXJzaXN0ZW50IG1lbW9y
eTxicj4KaXMgb25seSBzbyBiaWcuIFNvIHVzZSB3aXNlbHkuPGJyPjwvYmxvY2txdW90ZT48ZGl2
Pjxicj48L2Rpdj48ZGl2Plthc2hva2FdPC9kaXY+PGRpdj5TdXJlLCB0aGF0IHNvdW5kcyBnb29k
LjwvZGl2PjxkaXY+wqA8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPgo8YnI+CiZndDsgLSBVc2VkIEVzeXNfRW5j
cnlwdERlY3J5cHQoKSB0byBlbmNyeXB0L2RlY3J5cHQgdGhlIGdpdmVuIGRhdGE8YnI+CiZndDsg
PGJyPgomZ3Q7IElzIHRoaXMgdGhlIHJpZ2h0IGFwcHJvYWNoPzxicj4KJmd0OyA8YnI+CiZndDsg
SXQgd29ya2VkIGZpbmUgd2l0aCBzaW11bGF0b3IuIEhvd2V2ZXIsIGl0IGZhaWxlZCB3aXRoICZx
dW90O2NvbW1hbmQgY29kZSBub3Q8YnI+CiZndDsgc3VwcG9ydGVkJnF1b3Q7IGVycm9yIHdpdGgg
VFBNIGRldmljZS48YnI+Cjxicj4KTm90IG1hbnkgVFBNcyBzdXBwb3J0IHN5bW1ldHJpYyBlbmNy
eXB0aW9uOjxicj4KPGJyPgpMZXQmIzM5O3MgbG9vayBpbnRvIHlvdXIgVFBNcyBzdXBwb3J0ZWQg
Y29tbWFuZCBzZXQsIGRvOjxicj4KPGJyPgp0cG0yX2dldGNhcMKgIGNvbW1hbmRzPGJyPgo8YnI+
CiQgdHBtMl9nZXRjYXAgY29tbWFuZHMgfCBncmVwIC1pIGVuY3J5cHQ8YnI+ClRQTTJfQ0NfRW5j
cnlwdERlY3J5cHQ6PGJyPgpUUE0yX0NDX1JTQV9FbmNyeXB0Ojxicj4KVFBNMl9DQ19FbmNyeXB0
RGVjcnlwdDI6PGJyPgo8YnI+CklmIHlvdSBkb24mIzM5O3QgaGF2ZSB0aGVtLCBpdCB3b24mIzM5
O3Qgd29yay48YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+W2FzaG9rYV08L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PnRwbTJfZ2V0Y2FwIGNvbW1hbmQgaXMgbm90IGF2YWlsYWJs
ZSBpbiBteSBzeXN0ZW0uIEluc3RlYWQsIGhhdmUgdHBtMl9kdW1wX2NhcGFiaWxpdHkgY29tbWFu
ZC48L2Rpdj48ZGl2PkNvbmZpcm1lZCB0aGF0IFRQTTJfQ0NfRW5jcnlwdERlY3J5cHQgYW5kIFRQ
TTJfQ0NfRW5jcnlwdERlY3J5cHQyIGNvbW1hbmRzIGFyZSBub3Qgc3VwcG9ydGVkLjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+UlNBX0RlY3J5cHQgYW5kIFJTQV9FbmNyeXB0IGFyZSBzdXBwb3J0
ZWQ8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5bYWRtaW5AVFBNMi1WZXJzYUNTRy1Bc2hvazogfl0g
JCB0cG0yX2R1bXBfY2FwYWJpbGl0eSAtcCAyMzIzIC1jIGNvbW1hbmRzIHwgZ3JlcCAtQSA4IDE1
OTxicj5UUE1BX0NDOiAweDAyMDAwMTU5PGJyPsKgIGNvbW1hbmRJbmRleDogMHgxNTk8YnI+wqAg
cmVzZXJ2ZWQxOiDCoCDCoDB4MDxicj7CoCBudjogwqAgwqAgwqAgwqAgwqAgY2xlYXI8YnI+wqAg
ZXh0ZW5zaXZlOiDCoCDCoGNsZWFyPGJyPsKgIGZsdXNoZWQ6IMKgIMKgIMKgY2xlYXI8YnI+wqAg
Y0hhbmRsZXM6IMKgIMKgIDB4MTxicj7CoCBySGFuZGxlOiDCoCDCoCDCoGNsZWFyPGJyPsKgIFY6
IMKgIMKgIMKgIMKgIMKgIMKgY2xlYXI8YnI+wqAgUmVzOiDCoCDCoCDCoCDCoCDCoDB4MDxicj48
L2Rpdj48ZGl2PlthZG1pbkBUUE0yLVZlcnNhQ1NHLUFzaG9rOiB+XSAkIHRwbTJfZHVtcF9jYXBh
YmlsaXR5IC1wIDIzMjMgLWMgY29tbWFuZHMgfCBncmVwIC1BIDggMTc0PGJyPlRQTUFfQ0M6IDB4
MDIwMDAxNzQ8YnI+wqAgY29tbWFuZEluZGV4OiAweDE3NDxicj7CoCByZXNlcnZlZDE6IMKgIMKg
MHgwPGJyPsKgIG52OiDCoCDCoCDCoCDCoCDCoCBjbGVhcjxicj7CoCBleHRlbnNpdmU6IMKgIMKg
Y2xlYXI8YnI+wqAgZmx1c2hlZDogwqAgwqAgwqBjbGVhcjxicj7CoCBjSGFuZGxlczogwqAgwqAg
MHgxPGJyPsKgIHJIYW5kbGU6IMKgIMKgIMKgY2xlYXI8YnI+wqAgVjogwqAgwqAgwqAgwqAgwqAg
wqBjbGVhcjxicj7CoCBSZXM6IMKgIMKgIMKgIMKgIMKgMHgwPGJyPjwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4
IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5n
LWxlZnQ6MWV4Ij4KV2hhdCB5b3UgY291bGQgZG8sIGlzOjxicj4KMS4gSWYgeW91IGhhdmUgdG8g
c3RvcmUgZXh0ZXJuYWxseSBnZW5lcmF0ZWQgcHJpdmF0ZSBrZXlzLCB1c2UgdHBtMl9pbXBvcnQu
PGJyPgoyLiBzZWFsIGFuIEFFUyBrZXkgdG8gdGhlIHRwbSB3aXRoIHRwbTJfY3JlYXRlIC1JIGFu
ZCB3cmFwIHRoZSBrZXkgd2l0aCB0aGF0IGtleS48YnI+Cjxicj4KMSBpcyB0aGUgYmV0dGVyIG9w
dGlvbi4gQmVjYXVzZSBvbmNlIHlvdSBkbyB0aGF0LCB5b3UgY2FuIHNjcnViIGFsbCB1bnByb3Rl
Y3RlZCBvY2N1cnJlbmNlcyBvZjxicj4KdGhlIGtleSBpbiBwbGFpbnRleHQsIGFuZCBsZXQgaXQg
YmUgYSBtYW5hZ2VkIFRQTSBvYmplY3QsIHByb3RlY3RlZCBieSB0aGUgVFBNLjxicj48L2Jsb2Nr
cXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5bYXNob2thXTwvZGl2PjxkaXY+VGhhbmtzIGZvciB5
b3VyIHN1Z2dlc3Rpb24uIEFmdGVyIHRoZSB0cG0yX2ltcG9ydCwgaG93IGRvIHdlIGdldCB0aGUg
cGxhaW4gdGV4dCAoa2V5KSBiYWNrPzwvZGl2PjxkaXY+V2hhdCBpcyB0aGUgY29tbWFuZCB0byBn
ZXQgdGhlIG9yaWdpbmFsIHRleHQ/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9k
aXY+PGRpdj5Bc2hvayBLdW1hcjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0i
Z21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6
MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+Cjxicj4KJmd0OyA8
YnI+CiZndDsgLS0teC0tLTxicj4KJmd0OyBXQVJOSU5HOmVzeXM6c3JjL3RzczItPGJyPgomZ3Q7
IGVzeXMvYXBpL0VzeXNfRW5jcnlwdERlY3J5cHQuYzozMjQ6RXN5c19FbmNyeXB0RGVjcnlwdF9G
aW5pc2goKSBSZWNlaXZlZCBUUE08YnI+CiZndDsgRXJyb3I8YnI+CiZndDsgRVJST1I6ZXN5czpz
cmMvdHNzMi1lc3lzL2FwaS9Fc3lzX0VuY3J5cHREZWNyeXB0LmM6MTEwOkVzeXNfRW5jcnlwdERl
Y3J5cHQoKTxicj4KJmd0OyBFc3lzIEZpbmlzaCBFcnJvckNvZGUgKDB4MDAwMDAxNDMpPGJyPgom
Z3Q7IHZlcnNhX3RwbTJfZW5jcnlwdF9kZWNyeXB0LjM4MjogRXN5c19FbmNyeXB0RGVjcnlwdCBm
YWlsZWQ7IHJjIDB4MTQzPGJyPgomZ3Q7IE91dHB1dDo8YnI+CiZndDsgbWFpbiM1Njg6IFdyb3Rl
IDAgYnl0ZXMgb2YgZGF0YTxicj4KJmd0OyBbYWRtaW5AVFBNMi1WZXJzYUNTRy1Bc2hvazogfl0g
JCB0cG0yX3JjX2RlY29kZSAweDE0MyBlcnJvciBsYXllcjxicj4KJmd0O8KgIMKgaGV4OiAweDA8
YnI+CiZndDvCoCDCoGlkZW50aWZpZXI6IFRTUzJfVFBNX0VSUk9SX0xFVkVMPGJyPgomZ3Q7wqAg
wqBkZXNjcmlwdGlvbjogRXJyb3IgcHJvZHVjZWQgYnkgdGhlIFRQTSBmb3JtYXQgMCBlcnJvciBj
b2RlPGJyPgomZ3Q7wqAgwqBoZXg6IDB4NDM8YnI+CiZndDvCoCDCoG5hbWU6IFRQTV9SQ19DT01N
QU5EX0NPREU8YnI+CiZndDvCoCDCoGRlc2NyaXB0aW9uOiBjb21tYW5kIGNvZGUgbm90IHN1cHBv
cnRlZDxicj4KJmd0OyA8YnI+CiZndDsgLS0teC0tLTxicj4KJmd0OyA8YnI+CiZndDsgRnJvbSB0
aGUgdHBtMl9kdW1wX2NhcGFiaWxpdHksIGxvb2tzIGxpa2UgRXN5c19FbmNyeXB0RGVjcnlwdCgp
IGFuZDxicj4KJmd0OyBFc3lzX0VuY3J5cHREZWNyeXB0MigpIGFyZSBub3Qgc3VwcG9ydGVkLjxi
cj4KJmd0OyA8YnI+CiZndDsgRm9yIG91ciB1c2VjYXNlLCB3aGF0IGNvdWxkIGJlIHRoZSByaWdo
dCBhbHRlcm5hdGl2ZSBtZXRob2QgdG8gdXNlPyBTaGFsbCB3ZSB1c2U8YnI+CiZndDsgRXN5c19S
U0FfRW5jcnlwdCgpPyBJbiB0aGF0IGNhc2UsIHdoaWNoIHNjaGVtZSBpcyBiZXR0ZXI/IFRQTTJf
QUxHX1JTQUVTIG9yPGJyPgomZ3Q7IFRQTTJfQUxHX09BRVA/PGJyPgomZ3Q7IDxicj4KJmd0OyA8
YnI+CiZndDsgVGhhbmtzLDxicj4KJmd0OyBBc2hvayBLdW1hcjxicj4KPC9ibG9ja3F1b3RlPjwv
ZGl2PjwvZGl2Pgo=

--===============0671936615505939490==--

