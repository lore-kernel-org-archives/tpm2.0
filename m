Content-Type: multipart/mixed; boundary="===============1448875010034121195=="
MIME-Version: 1.0
From: Roberto Carvalho <roberto.nogueira.rc at gmail.com>
Subject: Re: [tpm2] Remote Attestation
Date: Sun, 01 Sep 2019 22:40:06 -0300
Message-ID: <CAMCD9MsjrWykV442gscNaEJv8mDx1b3GgaQr_Fkrji4xv+F57Q@mail.gmail.com>
In-Reply-To: CAMCD9Mv=7h6KdCtvwM-A0+ZKkTT=6jN6=BBdPgn-pxy9jsLu7g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1448875010034121195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I did the test without extending the PCR, so it gave no error, my
apologies, the quote works as expected.

Em dom, 1 de set de 2019 22:13, Roberto Carvalho <
roberto.nogueira.rc(a)gmail.com> escreveu:

> I have already applied the questions of verifying Ek with CA and
> deciphering secret.encrypted back to secret.plain, my question now is abo=
ut
> using quote.
>
> Let's say the client does the following:
>  tpm2_quote -Q -c ak.ctx -l sha256:15,16,17 -q
> 46b9658af2686c2961f12646a7d236720f1360a0 -m quote.out -s quotesig.out -o
> quotepcr.out -g sha256
> then send quote.out, quotesig.out and *quotepcr.out* to the server
> and purposely keep the quotepcr.out file on disk.
>
> At the next check when the server sends a different nonce the client can
> use the command:
> tpm2_quote -Q -c ak.ctx -l sha256:15,16,17 -q
> a43dee8d7d2e81970316844c3586adc536a6de64 -m quote2.out -s quotesig2.out -o
> quotepcr2.out -g sha256
>
> And sending the quote2.out, quotesig2.out, and *quotepcr.out (First file
> command)* files to the server, even if the PCR's have been extended or
> changed, the server will return SUCCESS on its tpm2_checkquote check as it
> will be validating using an old PCR setting. .
>
> How could I solve this?
>
> Em qua, 28 de ago de 2019 =C3=A0s 22:00, Matthew Dempsky <matthew(a)demps=
ky.org>
> escreveu:
>
>> Unfortunately, I don't think the complete end-to-end tooling is there yet
>> in tpm2-tools to make trivial to do remote attestation. There's still a =
bit
>> that's going to require manually handling of TPM2 data structures.
>>
>> In the simplistic case that you just want to verify that the client's key
>> securely resides in a real TPM2, what you'll need to do is:
>>
>> 1. On the client, generate the Endorsement Key (e.g., tpm2_createek -c
>> ek.ctx -u ek.pub) and get the corresponding EK certificate (typically
>> tpm2_nvread -o ek.crt 0x1c00002, for an RSA EK).
>> 2. Get the "public" data structure corresponding to your secret key
>> (e.g., use tpm2_readpublic -c my-key.ctx -o my-key.pub).
>> 3. Send ek.pub, ek.crt, and my-key.pub to the server.
>>
>> 4. On the server, validate ek.crt against your TPM CA root store, and
>> that ek.crt and ek.pub's public keys match.
>> 5. Validate that my-key.pub is acceptable (e.g., that fixedtpm and
>> sensitivedataorigin are set), and that it matches the CSR's public key.
>> 6. Convert the ak.pub into ak.name (this is SHA-256 of ak.pub, skipping
>> the first two bytes, and then prefixing hex "000b" to the result).
>> 7. Use "tpm2_makecredential -e ek.pub -n `cat ak.name` -s secret.plain
>> -o secret.encrypted" to encrypt some secret (up to 32 bytes).
>> 8. Send secret.encrypted to the client.
>>
>> 9. Back on the client, use the example steps in
>> tpm2-tools/man/tpm2_activatecredential
>> <https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_activa=
tecredential.1.md#examples> (in
>> particular, the four commands involving "session.ctx") to decrypt
>> secret.encrypted back into secret.plain.
>>
>>
>> Protocol wise, from the server's point of view:
>>   (1) By verifying ek.crt, you know it corresponds to a real TPM; and
>>   (2) Because of how real TPMs work, you know if the client successfully
>> used tpm2_activatecredential to decrypt secret.encrypted, then that same
>> TPM has a secret key that matches my-key.pub.
>>
>> The best way I've thought of utilizing this is to generate a 32-byte
>> random nonce, encrypt using tpm2_makecredential, send it to the client to
>> decrypt as a challenge, and have them echo it back. If they're able to do
>> so successfully, you can now sign the CSR and issue them the X.509
>> certificate knowing my-key.pub is valid.
>>
>>
>> The other option is to just issue the X.509 certificate, but encrypt it
>> using a random 32-byte key, and seal the key using tpm2_makecredential. =
But
>> this means the server doesn't know whether the certificate is actually
>> going to be used. If you want to keep a log of all issued certificates,
>> this seems undesirable.
>>
>>
>> Finally, this is the simplest approach to attestation. If you want to be
>> able to do more complex attestation (e.g., checking timestamps, PCR or NV
>> index values, or proving that the key was freshly generated), you'll need
>> to instead use the above steps to validate an Attestation Key (that is, a
>> key with the "restricted" and "signing" attributes set in its "public" d=
ata
>> file). And then the client can use the AK to with TPM2_Certify, TPM2_Quo=
te,
>> etc.
>>
>>
>> Hopefully that helps somewhat. If any particular steps are unclear, let
>> me know.
>>
>

--===============1448875010034121195==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPkkgZGlkIHRoZSB0ZXN0IHdpdGhvdXQgZXh0ZW5kaW5nIHRoZSBQQ1Is
IHNvIGl0IGdhdmUgbm8gZXJyb3IsIG15IGFwb2xvZ2llcywgdGhlIHF1b3RlIHdvcmtzIGFzIGV4
cGVjdGVkLjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIg
Y2xhc3M9ImdtYWlsX2F0dHIiPkVtIGRvbSwgMSBkZSBzZXQgZGUgMjAxOSAyMjoxMywgUm9iZXJ0
byBDYXJ2YWxobyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJvYmVydG8ubm9ndWVpcmEucmNAZ21haWwu
Y29tIj5yb2JlcnRvLm5vZ3VlaXJhLnJjQGdtYWlsLmNvbTwvYT4mZ3Q7IGVzY3JldmV1Ojxicj48
L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAg
LjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRp
cj0ibHRyIj5JIGhhdmUgYWxyZWFkeSBhcHBsaWVkIHRoZSBxdWVzdGlvbnMgb2YgdmVyaWZ5aW5n
IEVrIHdpdGggQ0EgYW5kIGRlY2lwaGVyaW5nIHNlY3JldC5lbmNyeXB0ZWQgYmFjayB0byBzZWNy
ZXQucGxhaW4sIG15IHF1ZXN0aW9uIG5vdyBpcyBhYm91dCB1c2luZyBxdW90ZS48YnI+PGJyPkxl
dCYjMzk7cyBzYXkgdGhlIGNsaWVudCBkb2VzIHRoZSBmb2xsb3dpbmc6PGJyPsKgdHBtMl9xdW90
ZSAtUSAtYyBhay5jdHggLWwgc2hhMjU2OjE1LDE2LDE3IC1xIDQ2Yjk2NThhZjI2ODZjMjk2MWYx
MjY0NmE3ZDIzNjcyMGYxMzYwYTAgLW0gcXVvdGUub3V0IC1zIHF1b3Rlc2lnLm91dCAtbyBxdW90
ZXBjci5vdXQgLWcgc2hhMjU2PGJyPnRoZW4gc2VuZCBxdW90ZS5vdXQsIHF1b3Rlc2lnLm91dCBh
bmQgPGI+cXVvdGVwY3Iub3V0PC9iPiB0byB0aGUgc2VydmVyPGJyPmFuZCBwdXJwb3NlbHkga2Vl
cCB0aGUgcXVvdGVwY3Iub3V0IGZpbGUgb24gZGlzay48YnI+PGJyPkF0IHRoZSBuZXh0IGNoZWNr
IHdoZW4gdGhlIHNlcnZlciBzZW5kcyBhIGRpZmZlcmVudCBub25jZSB0aGUgY2xpZW50IGNhbiB1
c2UgdGhlIGNvbW1hbmQ6PGJyPnRwbTJfcXVvdGUgLVEgLWMgYWsuY3R4IC1sIHNoYTI1NjoxNSwx
NiwxNyAtcSBhNDNkZWU4ZDdkMmU4MTk3MDMxNjg0NGMzNTg2YWRjNTM2YTZkZTY0IC1tIHF1b3Rl
Mi5vdXQgLXMgcXVvdGVzaWcyLm91dCAtbyBxdW90ZXBjcjIub3V0IC1nIHNoYTI1Njxicj48YnI+
QW5kIHNlbmRpbmcgdGhlIHF1b3RlMi5vdXQsIHF1b3Rlc2lnMi5vdXQsIGFuZCA8Yj5xdW90ZXBj
ci5vdXQgKEZpcnN0IGZpbGUgY29tbWFuZCk8L2I+IGZpbGVzIHRvIHRoZSBzZXJ2ZXIsIGV2ZW4g
aWYgdGhlIFBDUiYjMzk7cyBoYXZlIGJlZW4gZXh0ZW5kZWQgb3IgY2hhbmdlZCwgdGhlIHNlcnZl
ciB3aWxsIHJldHVybiBTVUNDRVNTIG9uIGl0cyB0cG0yX2NoZWNrcXVvdGUgY2hlY2sgYXMgaXQg
d2lsbCBiZSB2YWxpZGF0aW5nIHVzaW5nIGFuIG9sZCBQQ1Igc2V0dGluZy4gLjxicj48YnI+SG93
IGNvdWxkIEkgc29sdmUgdGhpcz88YnI+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3Rl
Ij48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+RW0gcXVhLCAyOCBkZSBhZ28gZGUg
MjAxOSDDoHMgMjI6MDAsIE1hdHRoZXcgRGVtcHNreSAmbHQ7PGEgaHJlZj0ibWFpbHRvOm1hdHRo
ZXdAZGVtcHNreS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPm1hdHRoZXdA
ZGVtcHNreS5vcmc8L2E+Jmd0OyBlc2NyZXZldTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9
ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0
OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJs
dHIiPlVuZm9ydHVuYXRlbHksIEkgZG9uJiMzOTt0IHRoaW5rIHRoZSBjb21wbGV0ZSBlbmQtdG8t
ZW5kIHRvb2xpbmcgaXMgdGhlcmUgeWV0IGluIHRwbTItdG9vbHMgdG8gbWFrZSB0cml2aWFsIHRv
IGRvIHJlbW90ZSBhdHRlc3RhdGlvbi4gVGhlcmUmIzM5O3Mgc3RpbGwgYSBiaXQgdGhhdCYjMzk7
cyBnb2luZyB0byByZXF1aXJlIG1hbnVhbGx5IGhhbmRsaW5nIG9mIFRQTTIgZGF0YSBzdHJ1Y3R1
cmVzLjxkaXY+PGJyPjwvZGl2PjxkaXY+SW4gdGhlIHNpbXBsaXN0aWMgY2FzZSB0aGF0IHlvdSBq
dXN0IHdhbnQgdG8gdmVyaWZ5IHRoYXQgdGhlIGNsaWVudCYjMzk7cyBrZXkgc2VjdXJlbHkgcmVz
aWRlcyBpbiBhIHJlYWwgVFBNMiwgd2hhdCB5b3UmIzM5O2xsIG5lZWQgdG8gZG8gaXM6PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj4xLiBPbiB0aGUgY2xpZW50LCBnZW5lcmF0ZSB0aGUgRW5kb3Jz
ZW1lbnQgS2V5IChlLmcuLCB0cG0yX2NyZWF0ZWVrIC1jIGVrLmN0eCAtdSBlay5wdWIpIGFuZCBn
ZXQgdGhlIGNvcnJlc3BvbmRpbmcgRUsgY2VydGlmaWNhdGUgKHR5cGljYWxseSB0cG0yX252cmVh
ZCAtbyBlay5jcnQgMHgxYzAwMDAyLCBmb3IgYW4gUlNBIEVLKS48L2Rpdj48ZGl2PjIuIEdldCB0
aGUgJnF1b3Q7cHVibGljJnF1b3Q7IGRhdGEgc3RydWN0dXJlIGNvcnJlc3BvbmRpbmcgdG8geW91
ciBzZWNyZXQga2V5IChlLmcuLCB1c2UgdHBtMl9yZWFkcHVibGljIC1jIG15LWtleS5jdHggLW8g
bXkta2V5LnB1YikuPC9kaXY+PGRpdj4zLiBTZW5kIGVrLnB1YiwgZWsuY3J0LCBhbmQgbXkta2V5
LnB1YiB0byB0aGUgc2VydmVyLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+NC4gT24gdGhlIHNl
cnZlciwgdmFsaWRhdGUgZWsuY3J0IGFnYWluc3QgeW91ciBUUE0gQ0Egcm9vdCBzdG9yZSwgYW5k
IHRoYXQgZWsuY3J0IGFuZCBlay5wdWImIzM5O3MgcHVibGljIGtleXMgbWF0Y2guPC9kaXY+PGRp
dj41LiBWYWxpZGF0ZSB0aGF0IG15LWtleS5wdWIgaXMgYWNjZXB0YWJsZSAoZS5nLiwgdGhhdCBm
aXhlZHRwbSBhbmQgc2Vuc2l0aXZlZGF0YW9yaWdpbiBhcmUgc2V0KSwgYW5kIHRoYXQgaXQgbWF0
Y2hlcyB0aGUgQ1NSJiMzOTtzIHB1YmxpYyBrZXkuPC9kaXY+PGRpdj42LiBDb252ZXJ0IHRoZSBh
ay5wdWIgaW50byA8YSBocmVmPSJodHRwOi8vYWsubmFtZSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0i
bm9yZWZlcnJlciI+YWsubmFtZTwvYT4gKHRoaXMgaXMgU0hBLTI1NiBvZiBhay5wdWIsIHNraXBw
aW5nIHRoZSBmaXJzdCB0d28gYnl0ZXMsIGFuZCB0aGVuIHByZWZpeGluZyBoZXggJnF1b3Q7MDAw
YiZxdW90OyB0byB0aGUgcmVzdWx0KS48L2Rpdj48ZGl2PjcuIFVzZSAmcXVvdDt0cG0yX21ha2Vj
cmVkZW50aWFsIC1lIGVrLnB1YiAtbiBgY2F0IDxhIGhyZWY9Imh0dHA6Ly9hay5uYW1lIiB0YXJn
ZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5hay5uYW1lPC9hPmAgLXMgc2VjcmV0LnBsYWlu
IC1vIHNlY3JldC5lbmNyeXB0ZWQmcXVvdDsgdG8gZW5jcnlwdCBzb21lIHNlY3JldCAodXAgdG8g
MzIgYnl0ZXMpLjxicj48L2Rpdj48ZGl2PjguIFNlbmQgc2VjcmV0LmVuY3J5cHRlZCB0byB0aGUg
Y2xpZW50LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+OS4gQmFjayBvbiB0aGUgY2xpZW50LCB1
c2UgdGhlIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9v
bHMvYmxvYi9tYXN0ZXIvbWFuL3RwbTJfYWN0aXZhdGVjcmVkZW50aWFsLjEubWQjZXhhbXBsZXMi
IHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPmV4YW1wbGUgc3RlcHMgaW4gdHBtMi10
b29scy9tYW4vdHBtMl9hY3RpdmF0ZWNyZWRlbnRpYWw8L2E+wqAoaW4gcGFydGljdWxhciwgdGhl
IGZvdXIgY29tbWFuZHMgaW52b2x2aW5nICZxdW90O3Nlc3Npb24uY3R4JnF1b3Q7KSB0byBkZWNy
eXB0IHNlY3JldC5lbmNyeXB0ZWQgYmFjayBpbnRvIHNlY3JldC5wbGFpbi48YnI+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Qcm90b2NvbCB3aXNlLCBmcm9tIHRoZSBz
ZXJ2ZXImIzM5O3MgcG9pbnQgb2Ygdmlldzo8L2Rpdj48ZGl2PsKgICgxKSBCeSB2ZXJpZnlpbmcg
ZWsuY3J0LCB5b3Uga25vdyBpdCBjb3JyZXNwb25kcyB0byBhIHJlYWwgVFBNOyBhbmQ8L2Rpdj48
ZGl2PsKgICgyKSBCZWNhdXNlIG9mIGhvdyByZWFsIFRQTXMgd29yaywgeW91IGtub3cgaWYgdGhl
IGNsaWVudCBzdWNjZXNzZnVsbHkgdXNlZCB0cG0yX2FjdGl2YXRlY3JlZGVudGlhbCB0byBkZWNy
eXB0IHNlY3JldC5lbmNyeXB0ZWQsIHRoZW4gdGhhdCBzYW1lIFRQTSBoYXMgYSBzZWNyZXQga2V5
IHRoYXQgbWF0Y2hlcyBteS1rZXkucHViLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhlIGJl
c3Qgd2F5IEkmIzM5O3ZlIHRob3VnaHQgb2YgdXRpbGl6aW5nIHRoaXMgaXMgdG8gZ2VuZXJhdGUg
YSAzMi1ieXRlIHJhbmRvbSBub25jZSwgZW5jcnlwdCB1c2luZyB0cG0yX21ha2VjcmVkZW50aWFs
LCBzZW5kIGl0IHRvIHRoZSBjbGllbnQgdG8gZGVjcnlwdCBhcyBhIGNoYWxsZW5nZSwgYW5kIGhh
dmUgdGhlbSBlY2hvIGl0IGJhY2suIElmIHRoZXkmIzM5O3JlIGFibGUgdG8gZG8gc28gc3VjY2Vz
c2Z1bGx5LCB5b3UgY2FuIG5vdyBzaWduIHRoZSBDU1IgYW5kIGlzc3VlIHRoZW0gdGhlIFguNTA5
IGNlcnRpZmljYXRlIGtub3dpbmcgbXkta2V5LnB1YiBpcyB2YWxpZC48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZSBvdGhlciBvcHRpb24gaXMgdG8ganVzdCBpc3N1
ZSB0aGUgWC41MDkgY2VydGlmaWNhdGUsIGJ1dCBlbmNyeXB0IGl0IHVzaW5nIGEgcmFuZG9tIDMy
LWJ5dGUga2V5LCBhbmQgc2VhbCB0aGUga2V5IHVzaW5nIHRwbTJfbWFrZWNyZWRlbnRpYWwuIEJ1
dCB0aGlzIG1lYW5zIHRoZSBzZXJ2ZXIgZG9lc24mIzM5O3Qga25vdyB3aGV0aGVyIHRoZSBjZXJ0
aWZpY2F0ZSBpcyBhY3R1YWxseSBnb2luZyB0byBiZSB1c2VkLiBJZiB5b3Ugd2FudCB0byBrZWVw
IGEgbG9nIG9mIGFsbCBpc3N1ZWQgY2VydGlmaWNhdGVzLCB0aGlzIHNlZW1zIHVuZGVzaXJhYmxl
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+RmluYWxseSwgdGhpcyBp
cyB0aGUgc2ltcGxlc3QgYXBwcm9hY2ggdG8gYXR0ZXN0YXRpb24uIElmIHlvdSB3YW50IHRvIGJl
IGFibGUgdG8gZG8gbW9yZSBjb21wbGV4IGF0dGVzdGF0aW9uIChlLmcuLCBjaGVja2luZyB0aW1l
c3RhbXBzLCBQQ1Igb3IgTlYgaW5kZXggdmFsdWVzLCBvciBwcm92aW5nIHRoYXQgdGhlIGtleSB3
YXMgZnJlc2hseSBnZW5lcmF0ZWQpLCB5b3UmIzM5O2xsIG5lZWQgdG8gaW5zdGVhZCB1c2UgdGhl
IGFib3ZlIHN0ZXBzIHRvIHZhbGlkYXRlIGFuIEF0dGVzdGF0aW9uIEtleSAodGhhdCBpcywgYSBr
ZXkgd2l0aCB0aGUgJnF1b3Q7cmVzdHJpY3RlZCZxdW90OyBhbmQgJnF1b3Q7c2lnbmluZyZxdW90
OyBhdHRyaWJ1dGVzIHNldCBpbiBpdHMgJnF1b3Q7cHVibGljJnF1b3Q7IGRhdGEgZmlsZSkuIEFu
ZCB0aGVuIHRoZSBjbGllbnQgY2FuIHVzZSB0aGUgQUsgdG8gd2l0aCBUUE0yX0NlcnRpZnksIFRQ
TTJfUXVvdGUsIGV0Yy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkhv
cGVmdWxseSB0aGF0IGhlbHBzIHNvbWV3aGF0LiBJZiBhbnkgcGFydGljdWxhciBzdGVwcyBhcmUg
dW5jbGVhciwgbGV0IG1lIGtub3cuPC9kaXY+PC9kaXY+CjwvYmxvY2txdW90ZT48L2Rpdj4KPC9i
bG9ja3F1b3RlPjwvZGl2Pgo=

--===============1448875010034121195==--

