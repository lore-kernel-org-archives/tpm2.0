Content-Type: multipart/mixed; boundary="===============6858167549560544084=="
MIME-Version: 1.0
From: Ashok Kumar <ashokar.1980 at gmail.com>
Subject: [tpm2] TPM Encryption Key
Date: Thu, 26 Mar 2020 17:18:38 +0530
Message-ID: <CAE8e83QFfBTKMPO-fQBzDPbk=_dB1uR=YkVZS9WYFqc3utFGMw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6858167549560544084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Our requirement is to encrypt the given data (for example, private key)
with TPM key.
As and when required, decrypt the data using the TPM key and use it in the
application.

To address this requirement, did the following.

First time initialization:

- Generated primary key under owner hierarchy
- Created the TPM symmetric key (which is used to encrypt/decrypt
application data)
  under the primary key.
- Used Esys_EvictControl() to store the TPM key handle in the TPM
persistent memory

During Encryption/Decryption:

- Used Esys_TR_FromTPMPublic() to fetch existing TPM key handle from the
persistent memory
- Used Esys_EncryptDecrypt() to encrypt/decrypt the given data

Is this the right approach?

It worked fine with simulator. However, it failed with "command code not
supported" error
with TPM device.

---x---
WARNING:esys:src/tss2-esys/api/Esys_EncryptDecrypt.c:324:Esys_EncryptDecryp=
t_Finish()
Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_EncryptDecrypt.c:110:Esys_EncryptDecrypt()
Esys Finish ErrorCode (0x00000143)
versa_tpm2_encrypt_decrypt.382: Esys_EncryptDecrypt failed; rc 0x143
Output:
main#568: Wrote 0 bytes of data
[admin(a)TPM2-VersaCSG-Ashok: ~] $ tpm2_rc_decode 0x143
error layer
  hex: 0x0
  identifier: TSS2_TPM_ERROR_LEVEL
  description: Error produced by the TPM
format 0 error code
  hex: 0x43
  name: TPM_RC_COMMAND_CODE
  description: command code not supported
---x---

From the tpm2_dump_capability, looks like Esys_EncryptDecrypt() and
Esys_EncryptDecrypt2() are not supported.

For our usecase, what could be the right alternative method to use? Shall
we use
Esys_RSA_Encrypt()? In that case, which scheme is better? TPM2_ALG_RSAES or
TPM2_ALG_OAEP?

Thanks,
Ashok Kumar

--===============6858167549560544084==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SGVsbG8sPGRpdj48YnI+PC9kaXY+PGRpdj5PdXIgcmVxdWlyZW1lbnQg
aXMgdG8gZW5jcnlwdCB0aGUgZ2l2ZW4gZGF0YSAoZm9yIGV4YW1wbGUsIHByaXZhdGUga2V5KSB3
aXRoIFRQTSBrZXkuPC9kaXY+PGRpdj5BcyBhbmQgd2hlbiByZXF1aXJlZCwgZGVjcnlwdCB0aGUg
ZGF0YSB1c2luZyB0aGUgVFBNIGtleSBhbmQgdXNlIGl0IGluIHRoZSBhcHBsaWNhdGlvbi48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRvIGFkZHJlc3MgdGhpcyByZXF1aXJlbWVudCwgZGlkIHRo
ZSBmb2xsb3dpbmcuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5GaXJzdCB0aW1lIGluaXRpYWxp
emF0aW9uOjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+LSBHZW5lcmF0ZWQgcHJpbWFyeSBrZXkg
dW5kZXIgb3duZXIgaGllcmFyY2h5PC9kaXY+PGRpdj4tIENyZWF0ZWQgdGhlIFRQTSBzeW1tZXRy
aWMga2V5ICh3aGljaCBpcyB1c2VkIHRvIGVuY3J5cHQvZGVjcnlwdCBhcHBsaWNhdGlvbiBkYXRh
KTwvZGl2PjxkaXY+wqAgdW5kZXIgdGhlIHByaW1hcnkga2V5LjwvZGl2PjxkaXY+LSBVc2VkIEVz
eXNfRXZpY3RDb250cm9sKCkgdG8gc3RvcmUgdGhlIFRQTSBrZXkgaGFuZGxlIGluIHRoZSBUUE0g
cGVyc2lzdGVudCBtZW1vcnk8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkR1cmluZyBFbmNyeXB0
aW9uL0RlY3J5cHRpb246PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4tIFVzZWTCoEVzeXNfVFJf
RnJvbVRQTVB1YmxpYygpIHRvIGZldGNoIGV4aXN0aW5nIFRQTSBrZXkgaGFuZGxlIGZyb20gdGhl
IHBlcnNpc3RlbnQgbWVtb3J5PC9kaXY+PGRpdj4tIFVzZWQgRXN5c19FbmNyeXB0RGVjcnlwdCgp
IHRvIGVuY3J5cHQvZGVjcnlwdCB0aGUgZ2l2ZW4gZGF0YTwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+SXMgdGhpcyB0aGUgcmlnaHQgYXBwcm9hY2g/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5J
dCB3b3JrZWQgZmluZSB3aXRoIHNpbXVsYXRvci4gSG93ZXZlciwgaXQgZmFpbGVkIHdpdGggJnF1
b3Q7Y29tbWFuZCBjb2RlIG5vdCBzdXBwb3J0ZWQmcXVvdDsgZXJyb3I8L2Rpdj48ZGl2PndpdGgg
VFBNIGRldmljZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pi0tLXgtLS08L2Rpdj48ZGl2PldB
Uk5JTkc6ZXN5czpzcmMvdHNzMi1lc3lzL2FwaS9Fc3lzX0VuY3J5cHREZWNyeXB0LmM6MzI0OkVz
eXNfRW5jcnlwdERlY3J5cHRfRmluaXNoKCkgUmVjZWl2ZWQgVFBNIEVycm9yPGJyPkVSUk9SOmVz
eXM6c3JjL3RzczItZXN5cy9hcGkvRXN5c19FbmNyeXB0RGVjcnlwdC5jOjExMDpFc3lzX0VuY3J5
cHREZWNyeXB0KCkgRXN5cyBGaW5pc2ggRXJyb3JDb2RlICgweDAwMDAwMTQzKTxicj52ZXJzYV90
cG0yX2VuY3J5cHRfZGVjcnlwdC4zODI6IEVzeXNfRW5jcnlwdERlY3J5cHQgZmFpbGVkOyByYyAw
eDE0Mzxicj5PdXRwdXQ6PGJyPm1haW4jNTY4OiBXcm90ZSAwIGJ5dGVzIG9mIGRhdGE8YnI+W2Fk
bWluQFRQTTItVmVyc2FDU0ctQXNob2s6IH5dICQgdHBtMl9yY19kZWNvZGUgMHgxNDM8YnI+ZXJy
b3IgbGF5ZXI8YnI+wqAgaGV4OiAweDA8YnI+wqAgaWRlbnRpZmllcjogVFNTMl9UUE1fRVJST1Jf
TEVWRUw8YnI+wqAgZGVzY3JpcHRpb246IEVycm9yIHByb2R1Y2VkIGJ5IHRoZSBUUE08YnI+Zm9y
bWF0IDAgZXJyb3IgY29kZTxicj7CoCBoZXg6IDB4NDM8YnI+wqAgbmFtZTogVFBNX1JDX0NPTU1B
TkRfQ09ERTxicj7CoCBkZXNjcmlwdGlvbjogY29tbWFuZCBjb2RlIG5vdCBzdXBwb3J0ZWQ8YnI+
PC9kaXY+PGRpdj4tLS14LS0tPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Gcm9tIHRoZSB0cG0y
X2R1bXBfY2FwYWJpbGl0eSwgbG9va3MgbGlrZSBFc3lzX0VuY3J5cHREZWNyeXB0KCkgYW5kIEVz
eXNfRW5jcnlwdERlY3J5cHQyKCkgYXJlIG5vdCBzdXBwb3J0ZWQuPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5Gb3Igb3VyIHVzZWNhc2UsIHdoYXQgY291bGQgYmUgdGhlIHJpZ2h0IGFsdGVybmF0
aXZlIG1ldGhvZCB0byB1c2U/IFNoYWxsIHdlIHVzZTwvZGl2PjxkaXY+RXN5c19SU0FfRW5jcnlw
dCgpPyBJbiB0aGF0IGNhc2UsIHdoaWNoIHNjaGVtZSBpcyBiZXR0ZXI/wqBUUE0yX0FMR19SU0FF
UyBvcjwvZGl2PjxkaXY+VFBNMl9BTEdfT0FFUD88YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj48ZGl2PjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiIGRhdGEtc21hcnRt
YWlsPSJnbWFpbF9zaWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPlRoYW5rcyw8ZGl2PkFzaG9rIEt1
bWFyPC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+Cg==

--===============6858167549560544084==--

