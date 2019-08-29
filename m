Content-Type: multipart/mixed; boundary="===============3696218884941610035=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] Remote Attestation
Date: Wed, 28 Aug 2019 18:00:15 -0700
Message-ID: <CANKkrzF3QaAE4PFtoccPPeLnSPr0kQd5mNFiyVFg54XHRj8HSA@mail.gmail.com>
In-Reply-To: CAMCD9MvqBL4jwmA+dVaFrHz32mxVu=_K2qdNJ+VydumO0d-nuQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3696218884941610035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Unfortunately, I don't think the complete end-to-end tooling is there yet
in tpm2-tools to make trivial to do remote attestation. There's still a bit
that's going to require manually handling of TPM2 data structures.

In the simplistic case that you just want to verify that the client's key
securely resides in a real TPM2, what you'll need to do is:

1. On the client, generate the Endorsement Key (e.g., tpm2_createek -c
ek.ctx -u ek.pub) and get the corresponding EK certificate (typically
tpm2_nvread -o ek.crt 0x1c00002, for an RSA EK).
2. Get the "public" data structure corresponding to your secret key (e.g.,
use tpm2_readpublic -c my-key.ctx -o my-key.pub).
3. Send ek.pub, ek.crt, and my-key.pub to the server.

4. On the server, validate ek.crt against your TPM CA root store, and that
ek.crt and ek.pub's public keys match.
5. Validate that my-key.pub is acceptable (e.g., that fixedtpm and
sensitivedataorigin are set), and that it matches the CSR's public key.
6. Convert the ak.pub into ak.name (this is SHA-256 of ak.pub, skipping the
first two bytes, and then prefixing hex "000b" to the result).
7. Use "tpm2_makecredential -e ek.pub -n `cat ak.name` -s secret.plain -o
secret.encrypted" to encrypt some secret (up to 32 bytes).
8. Send secret.encrypted to the client.

9. Back on the client, use the example steps in
tpm2-tools/man/tpm2_activatecredential
<https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_activatec=
redential.1.md#examples>
(in
particular, the four commands involving "session.ctx") to decrypt
secret.encrypted back into secret.plain.


Protocol wise, from the server's point of view:
  (1) By verifying ek.crt, you know it corresponds to a real TPM; and
  (2) Because of how real TPMs work, you know if the client successfully
used tpm2_activatecredential to decrypt secret.encrypted, then that same
TPM has a secret key that matches my-key.pub.

The best way I've thought of utilizing this is to generate a 32-byte random
nonce, encrypt using tpm2_makecredential, send it to the client to decrypt
as a challenge, and have them echo it back. If they're able to do so
successfully, you can now sign the CSR and issue them the X.509 certificate
knowing my-key.pub is valid.


The other option is to just issue the X.509 certificate, but encrypt it
using a random 32-byte key, and seal the key using tpm2_makecredential. But
this means the server doesn't know whether the certificate is actually
going to be used. If you want to keep a log of all issued certificates,
this seems undesirable.


Finally, this is the simplest approach to attestation. If you want to be
able to do more complex attestation (e.g., checking timestamps, PCR or NV
index values, or proving that the key was freshly generated), you'll need
to instead use the above steps to validate an Attestation Key (that is, a
key with the "restricted" and "signing" attributes set in its "public" data
file). And then the client can use the AK to with TPM2_Certify, TPM2_Quote,
etc.


Hopefully that helps somewhat. If any particular steps are unclear, let me
know.

--===============3696218884941610035==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VW5mb3J0dW5hdGVseSwgSSBkb24mIzM5O3QgdGhpbmsgdGhlIGNvbXBs
ZXRlIGVuZC10by1lbmQgdG9vbGluZyBpcyB0aGVyZSB5ZXQgaW4gdHBtMi10b29scyB0byBtYWtl
IHRyaXZpYWwgdG8gZG8gcmVtb3RlIGF0dGVzdGF0aW9uLiBUaGVyZSYjMzk7cyBzdGlsbCBhIGJp
dCB0aGF0JiMzOTtzIGdvaW5nIHRvIHJlcXVpcmUgbWFudWFsbHkgaGFuZGxpbmcgb2YgVFBNMiBk
YXRhIHN0cnVjdHVyZXMuPGRpdj48YnI+PC9kaXY+PGRpdj5JbiB0aGUgc2ltcGxpc3RpYyBjYXNl
IHRoYXQgeW91IGp1c3Qgd2FudCB0byB2ZXJpZnkgdGhhdCB0aGUgY2xpZW50JiMzOTtzIGtleSBz
ZWN1cmVseSByZXNpZGVzIGluIGEgcmVhbCBUUE0yLCB3aGF0IHlvdSYjMzk7bGwgbmVlZCB0byBk
byBpczo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjEuIE9uIHRoZSBjbGllbnQsIGdlbmVyYXRl
IHRoZSBFbmRvcnNlbWVudCBLZXkgKGUuZy4sIHRwbTJfY3JlYXRlZWsgLWMgZWsuY3R4IC11IGVr
LnB1YikgYW5kIGdldCB0aGUgY29ycmVzcG9uZGluZyBFSyBjZXJ0aWZpY2F0ZSAodHlwaWNhbGx5
IHRwbTJfbnZyZWFkIC1vIGVrLmNydCAweDFjMDAwMDIsIGZvciBhbiBSU0EgRUspLjwvZGl2Pjxk
aXY+Mi4gR2V0IHRoZSAmcXVvdDtwdWJsaWMmcXVvdDsgZGF0YSBzdHJ1Y3R1cmUgY29ycmVzcG9u
ZGluZyB0byB5b3VyIHNlY3JldCBrZXkgKGUuZy4sIHVzZSB0cG0yX3JlYWRwdWJsaWMgLWMgbXkt
a2V5LmN0eCAtbyBteS1rZXkucHViKS48L2Rpdj48ZGl2PjMuIFNlbmQgZWsucHViLCBlay5jcnQs
IGFuZCBteS1rZXkucHViIHRvIHRoZSBzZXJ2ZXIuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj40
LiBPbiB0aGUgc2VydmVyLCB2YWxpZGF0ZSBlay5jcnQgYWdhaW5zdCB5b3VyIFRQTSBDQSByb290
IHN0b3JlLCBhbmQgdGhhdCBlay5jcnQgYW5kIGVrLnB1YiYjMzk7cyBwdWJsaWMga2V5cyBtYXRj
aC48L2Rpdj48ZGl2PjUuIFZhbGlkYXRlIHRoYXQgbXkta2V5LnB1YiBpcyBhY2NlcHRhYmxlIChl
LmcuLCB0aGF0IGZpeGVkdHBtIGFuZCBzZW5zaXRpdmVkYXRhb3JpZ2luIGFyZSBzZXQpLCBhbmQg
dGhhdCBpdCBtYXRjaGVzIHRoZSBDU1ImIzM5O3MgcHVibGljIGtleS48L2Rpdj48ZGl2PjYuIENv
bnZlcnQgdGhlIGFrLnB1YiBpbnRvIDxhIGhyZWY9Imh0dHA6Ly9hay5uYW1lIj5hay5uYW1lPC9h
PiAodGhpcyBpcyBTSEEtMjU2IG9mIGFrLnB1Yiwgc2tpcHBpbmcgdGhlIGZpcnN0IHR3byBieXRl
cywgYW5kIHRoZW4gcHJlZml4aW5nIGhleCAmcXVvdDswMDBiJnF1b3Q7IHRvIHRoZSByZXN1bHQp
LjwvZGl2PjxkaXY+Ny4gVXNlICZxdW90O3RwbTJfbWFrZWNyZWRlbnRpYWwgLWUgZWsucHViIC1u
IGBjYXQgPGEgaHJlZj0iaHR0cDovL2FrLm5hbWUiPmFrLm5hbWU8L2E+YCAtcyBzZWNyZXQucGxh
aW4gLW8gc2VjcmV0LmVuY3J5cHRlZCZxdW90OyB0byBlbmNyeXB0IHNvbWUgc2VjcmV0ICh1cCB0
byAzMiBieXRlcykuPGJyPjwvZGl2PjxkaXY+OC4gU2VuZCBzZWNyZXQuZW5jcnlwdGVkIHRvIHRo
ZSBjbGllbnQuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj45LiBCYWNrIG9uIHRoZSBjbGllbnQs
IHVzZSB0aGUgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10
b29scy9ibG9iL21hc3Rlci9tYW4vdHBtMl9hY3RpdmF0ZWNyZWRlbnRpYWwuMS5tZCNleGFtcGxl
cyI+ZXhhbXBsZSBzdGVwcyBpbiB0cG0yLXRvb2xzL21hbi90cG0yX2FjdGl2YXRlY3JlZGVudGlh
bDwvYT7CoChpbiBwYXJ0aWN1bGFyLCB0aGUgZm91ciBjb21tYW5kcyBpbnZvbHZpbmcgJnF1b3Q7
c2Vzc2lvbi5jdHgmcXVvdDspIHRvIGRlY3J5cHQgc2VjcmV0LmVuY3J5cHRlZCBiYWNrIGludG8g
c2VjcmV0LnBsYWluLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PlByb3RvY29sIHdpc2UsIGZyb20gdGhlIHNlcnZlciYjMzk7cyBwb2ludCBvZiB2aWV3OjwvZGl2
PjxkaXY+wqAgKDEpIEJ5IHZlcmlmeWluZyBlay5jcnQsIHlvdSBrbm93IGl0IGNvcnJlc3BvbmRz
IHRvIGEgcmVhbCBUUE07IGFuZDwvZGl2PjxkaXY+wqAgKDIpIEJlY2F1c2Ugb2YgaG93IHJlYWwg
VFBNcyB3b3JrLCB5b3Uga25vdyBpZiB0aGUgY2xpZW50IHN1Y2Nlc3NmdWxseSB1c2VkIHRwbTJf
YWN0aXZhdGVjcmVkZW50aWFsIHRvIGRlY3J5cHQgc2VjcmV0LmVuY3J5cHRlZCwgdGhlbiB0aGF0
IHNhbWUgVFBNIGhhcyBhIHNlY3JldCBrZXkgdGhhdCBtYXRjaGVzIG15LWtleS5wdWIuPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5UaGUgYmVzdCB3YXkgSSYjMzk7dmUgdGhvdWdodCBvZiB1dGls
aXppbmcgdGhpcyBpcyB0byBnZW5lcmF0ZSBhIDMyLWJ5dGUgcmFuZG9tIG5vbmNlLCBlbmNyeXB0
IHVzaW5nIHRwbTJfbWFrZWNyZWRlbnRpYWwsIHNlbmQgaXQgdG8gdGhlIGNsaWVudCB0byBkZWNy
eXB0IGFzIGEgY2hhbGxlbmdlLCBhbmQgaGF2ZSB0aGVtIGVjaG8gaXQgYmFjay4gSWYgdGhleSYj
Mzk7cmUgYWJsZSB0byBkbyBzbyBzdWNjZXNzZnVsbHksIHlvdSBjYW4gbm93IHNpZ24gdGhlIENT
UiBhbmQgaXNzdWUgdGhlbSB0aGUgWC41MDkgY2VydGlmaWNhdGUga25vd2luZyBteS1rZXkucHVi
IGlzIHZhbGlkLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhlIG90
aGVyIG9wdGlvbiBpcyB0byBqdXN0IGlzc3VlIHRoZSBYLjUwOSBjZXJ0aWZpY2F0ZSwgYnV0IGVu
Y3J5cHQgaXQgdXNpbmcgYSByYW5kb20gMzItYnl0ZSBrZXksIGFuZCBzZWFsIHRoZSBrZXkgdXNp
bmcgdHBtMl9tYWtlY3JlZGVudGlhbC4gQnV0IHRoaXMgbWVhbnMgdGhlIHNlcnZlciBkb2VzbiYj
Mzk7dCBrbm93IHdoZXRoZXIgdGhlIGNlcnRpZmljYXRlIGlzIGFjdHVhbGx5IGdvaW5nIHRvIGJl
IHVzZWQuIElmIHlvdSB3YW50IHRvIGtlZXAgYSBsb2cgb2YgYWxsIGlzc3VlZCBjZXJ0aWZpY2F0
ZXMsIHRoaXMgc2VlbXMgdW5kZXNpcmFibGUuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5GaW5hbGx5LCB0aGlzIGlzIHRoZSBzaW1wbGVzdCBhcHByb2FjaCB0byBhdHRl
c3RhdGlvbi4gSWYgeW91IHdhbnQgdG8gYmUgYWJsZSB0byBkbyBtb3JlIGNvbXBsZXggYXR0ZXN0
YXRpb24gKGUuZy4sIGNoZWNraW5nIHRpbWVzdGFtcHMsIFBDUiBvciBOViBpbmRleCB2YWx1ZXMs
IG9yIHByb3ZpbmcgdGhhdCB0aGUga2V5IHdhcyBmcmVzaGx5IGdlbmVyYXRlZCksIHlvdSYjMzk7
bGwgbmVlZCB0byBpbnN0ZWFkIHVzZSB0aGUgYWJvdmUgc3RlcHMgdG8gdmFsaWRhdGUgYW4gQXR0
ZXN0YXRpb24gS2V5ICh0aGF0IGlzLCBhIGtleSB3aXRoIHRoZSAmcXVvdDtyZXN0cmljdGVkJnF1
b3Q7IGFuZCAmcXVvdDtzaWduaW5nJnF1b3Q7IGF0dHJpYnV0ZXMgc2V0IGluIGl0cyAmcXVvdDtw
dWJsaWMmcXVvdDsgZGF0YSBmaWxlKS4gQW5kIHRoZW4gdGhlIGNsaWVudCBjYW4gdXNlIHRoZSBB
SyB0byB3aXRoIFRQTTJfQ2VydGlmeSwgVFBNMl9RdW90ZSwgZXRjLjwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SG9wZWZ1bGx5IHRoYXQgaGVscHMgc29tZXdoYXQuIElm
IGFueSBwYXJ0aWN1bGFyIHN0ZXBzIGFyZSB1bmNsZWFyLCBsZXQgbWUga25vdy48L2Rpdj48L2Rp
dj4K

--===============3696218884941610035==--

