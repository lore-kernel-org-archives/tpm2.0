Content-Type: multipart/mixed; boundary="===============4244414666995994001=="
MIME-Version: 1.0
From: Roberto Carvalho <roberto.nogueira.rc at gmail.com>
Subject: Re: [tpm2] Remote Attestation
Date: Sun, 01 Sep 2019 22:13:55 -0300
Message-ID: <CAMCD9Mv=7h6KdCtvwM-A0+ZKkTT=6jN6=BBdPgn-pxy9jsLu7g@mail.gmail.com>
In-Reply-To: CANKkrzF3QaAE4PFtoccPPeLnSPr0kQd5mNFiyVFg54XHRj8HSA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4244414666995994001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have already applied the questions of verifying Ek with CA and
deciphering secret.encrypted back to secret.plain, my question now is about
using quote.

Let's say the client does the following:
 tpm2_quote -Q -c ak.ctx -l sha256:15,16,17 -q
46b9658af2686c2961f12646a7d236720f1360a0 -m quote.out -s quotesig.out -o
quotepcr.out -g sha256
then send quote.out, quotesig.out and *quotepcr.out* to the server
and purposely keep the quotepcr.out file on disk.

At the next check when the server sends a different nonce the client can
use the command:
tpm2_quote -Q -c ak.ctx -l sha256:15,16,17 -q
a43dee8d7d2e81970316844c3586adc536a6de64 -m quote2.out -s quotesig2.out -o
quotepcr2.out -g sha256

And sending the quote2.out, quotesig2.out, and *quotepcr.out (First file
command)* files to the server, even if the PCR's have been extended or
changed, the server will return SUCCESS on its tpm2_checkquote check as it
will be validating using an old PCR setting. .

How could I solve this?

Em qua, 28 de ago de 2019 =C3=A0s 22:00, Matthew Dempsky <matthew(a)dempsky=
.org>
escreveu:

> Unfortunately, I don't think the complete end-to-end tooling is there yet
> in tpm2-tools to make trivial to do remote attestation. There's still a b=
it
> that's going to require manually handling of TPM2 data structures.
>
> In the simplistic case that you just want to verify that the client's key
> securely resides in a real TPM2, what you'll need to do is:
>
> 1. On the client, generate the Endorsement Key (e.g., tpm2_createek -c
> ek.ctx -u ek.pub) and get the corresponding EK certificate (typically
> tpm2_nvread -o ek.crt 0x1c00002, for an RSA EK).
> 2. Get the "public" data structure corresponding to your secret key (e.g.,
> use tpm2_readpublic -c my-key.ctx -o my-key.pub).
> 3. Send ek.pub, ek.crt, and my-key.pub to the server.
>
> 4. On the server, validate ek.crt against your TPM CA root store, and that
> ek.crt and ek.pub's public keys match.
> 5. Validate that my-key.pub is acceptable (e.g., that fixedtpm and
> sensitivedataorigin are set), and that it matches the CSR's public key.
> 6. Convert the ak.pub into ak.name (this is SHA-256 of ak.pub, skipping
> the first two bytes, and then prefixing hex "000b" to the result).
> 7. Use "tpm2_makecredential -e ek.pub -n `cat ak.name` -s secret.plain -o
> secret.encrypted" to encrypt some secret (up to 32 bytes).
> 8. Send secret.encrypted to the client.
>
> 9. Back on the client, use the example steps in
> tpm2-tools/man/tpm2_activatecredential
> <https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_activat=
ecredential.1.md#examples> (in
> particular, the four commands involving "session.ctx") to decrypt
> secret.encrypted back into secret.plain.
>
>
> Protocol wise, from the server's point of view:
>   (1) By verifying ek.crt, you know it corresponds to a real TPM; and
>   (2) Because of how real TPMs work, you know if the client successfully
> used tpm2_activatecredential to decrypt secret.encrypted, then that same
> TPM has a secret key that matches my-key.pub.
>
> The best way I've thought of utilizing this is to generate a 32-byte
> random nonce, encrypt using tpm2_makecredential, send it to the client to
> decrypt as a challenge, and have them echo it back. If they're able to do
> so successfully, you can now sign the CSR and issue them the X.509
> certificate knowing my-key.pub is valid.
>
>
> The other option is to just issue the X.509 certificate, but encrypt it
> using a random 32-byte key, and seal the key using tpm2_makecredential. B=
ut
> this means the server doesn't know whether the certificate is actually
> going to be used. If you want to keep a log of all issued certificates,
> this seems undesirable.
>
>
> Finally, this is the simplest approach to attestation. If you want to be
> able to do more complex attestation (e.g., checking timestamps, PCR or NV
> index values, or proving that the key was freshly generated), you'll need
> to instead use the above steps to validate an Attestation Key (that is, a
> key with the "restricted" and "signing" attributes set in its "public" da=
ta
> file). And then the client can use the AK to with TPM2_Certify, TPM2_Quot=
e,
> etc.
>
>
> Hopefully that helps somewhat. If any particular steps are unclear, let me
> know.
>

--===============4244414666995994001==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SSBoYXZlIGFscmVhZHkgYXBwbGllZCB0aGUgcXVlc3Rpb25zIG9mIHZl
cmlmeWluZyBFayB3aXRoIENBIGFuZCBkZWNpcGhlcmluZyBzZWNyZXQuZW5jcnlwdGVkIGJhY2sg
dG8gc2VjcmV0LnBsYWluLCBteSBxdWVzdGlvbiBub3cgaXMgYWJvdXQgdXNpbmcgcXVvdGUuPGJy
Pjxicj5MZXQmIzM5O3Mgc2F5IHRoZSBjbGllbnQgZG9lcyB0aGUgZm9sbG93aW5nOjxicj7CoHRw
bTJfcXVvdGUgLVEgLWMgYWsuY3R4IC1sIHNoYTI1NjoxNSwxNiwxNyAtcSA0NmI5NjU4YWYyNjg2
YzI5NjFmMTI2NDZhN2QyMzY3MjBmMTM2MGEwIC1tIHF1b3RlLm91dCAtcyBxdW90ZXNpZy5vdXQg
LW8gcXVvdGVwY3Iub3V0IC1nIHNoYTI1Njxicj50aGVuIHNlbmQgcXVvdGUub3V0LCBxdW90ZXNp
Zy5vdXQgYW5kIDxiPnF1b3RlcGNyLm91dDwvYj4gdG8gdGhlIHNlcnZlcjxicj5hbmQgcHVycG9z
ZWx5IGtlZXAgdGhlIHF1b3RlcGNyLm91dCBmaWxlIG9uIGRpc2suPGJyPjxicj5BdCB0aGUgbmV4
dCBjaGVjayB3aGVuIHRoZSBzZXJ2ZXIgc2VuZHMgYSBkaWZmZXJlbnQgbm9uY2UgdGhlIGNsaWVu
dCBjYW4gdXNlIHRoZSBjb21tYW5kOjxicj50cG0yX3F1b3RlIC1RIC1jIGFrLmN0eCAtbCBzaGEy
NTY6MTUsMTYsMTcgLXEgYTQzZGVlOGQ3ZDJlODE5NzAzMTY4NDRjMzU4NmFkYzUzNmE2ZGU2NCAt
bSBxdW90ZTIub3V0IC1zIHF1b3Rlc2lnMi5vdXQgLW8gcXVvdGVwY3IyLm91dCAtZyBzaGEyNTY8
YnI+PGJyPkFuZCBzZW5kaW5nIHRoZSBxdW90ZTIub3V0LCBxdW90ZXNpZzIub3V0LCBhbmQgPGI+
cXVvdGVwY3Iub3V0IChGaXJzdCBmaWxlIGNvbW1hbmQpPC9iPiBmaWxlcyB0byB0aGUgc2VydmVy
LCBldmVuIGlmIHRoZSBQQ1ImIzM5O3MgaGF2ZSBiZWVuIGV4dGVuZGVkIG9yIGNoYW5nZWQsIHRo
ZSBzZXJ2ZXIgd2lsbCByZXR1cm4gU1VDQ0VTUyBvbiBpdHMgdHBtMl9jaGVja3F1b3RlIGNoZWNr
IGFzIGl0IHdpbGwgYmUgdmFsaWRhdGluZyB1c2luZyBhbiBvbGQgUENSIHNldHRpbmcuIC48YnI+
PGJyPkhvdyBjb3VsZCBJIHNvbHZlIHRoaXM/PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFp
bF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPkVtIHF1YSwgMjggZGUg
YWdvIGRlIDIwMTkgw6BzIDIyOjAwLCBNYXR0aGV3IERlbXBza3kgJmx0OzxhIGhyZWY9Im1haWx0
bzptYXR0aGV3QGRlbXBza3kub3JnIj5tYXR0aGV3QGRlbXBza3kub3JnPC9hPiZndDsgZXNjcmV2
ZXU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdp
bjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0
KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj5VbmZvcnR1bmF0ZWx5LCBJIGRvbiYj
Mzk7dCB0aGluayB0aGUgY29tcGxldGUgZW5kLXRvLWVuZCB0b29saW5nIGlzIHRoZXJlIHlldCBp
biB0cG0yLXRvb2xzIHRvIG1ha2UgdHJpdmlhbCB0byBkbyByZW1vdGUgYXR0ZXN0YXRpb24uIFRo
ZXJlJiMzOTtzIHN0aWxsIGEgYml0IHRoYXQmIzM5O3MgZ29pbmcgdG8gcmVxdWlyZSBtYW51YWxs
eSBoYW5kbGluZyBvZiBUUE0yIGRhdGEgc3RydWN0dXJlcy48ZGl2Pjxicj48L2Rpdj48ZGl2Pklu
IHRoZSBzaW1wbGlzdGljIGNhc2UgdGhhdCB5b3UganVzdCB3YW50IHRvIHZlcmlmeSB0aGF0IHRo
ZSBjbGllbnQmIzM5O3Mga2V5IHNlY3VyZWx5IHJlc2lkZXMgaW4gYSByZWFsIFRQTTIsIHdoYXQg
eW91JiMzOTtsbCBuZWVkIHRvIGRvIGlzOjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+MS4gT24g
dGhlIGNsaWVudCwgZ2VuZXJhdGUgdGhlIEVuZG9yc2VtZW50IEtleSAoZS5nLiwgdHBtMl9jcmVh
dGVlayAtYyBlay5jdHggLXUgZWsucHViKSBhbmQgZ2V0IHRoZSBjb3JyZXNwb25kaW5nIEVLIGNl
cnRpZmljYXRlICh0eXBpY2FsbHkgdHBtMl9udnJlYWQgLW8gZWsuY3J0IDB4MWMwMDAwMiwgZm9y
IGFuIFJTQSBFSykuPC9kaXY+PGRpdj4yLiBHZXQgdGhlICZxdW90O3B1YmxpYyZxdW90OyBkYXRh
IHN0cnVjdHVyZSBjb3JyZXNwb25kaW5nIHRvIHlvdXIgc2VjcmV0IGtleSAoZS5nLiwgdXNlIHRw
bTJfcmVhZHB1YmxpYyAtYyBteS1rZXkuY3R4IC1vIG15LWtleS5wdWIpLjwvZGl2PjxkaXY+My4g
U2VuZCBlay5wdWIsIGVrLmNydCwgYW5kIG15LWtleS5wdWIgdG8gdGhlIHNlcnZlci48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PjQuIE9uIHRoZSBzZXJ2ZXIsIHZhbGlkYXRlIGVrLmNydCBhZ2Fp
bnN0IHlvdXIgVFBNIENBIHJvb3Qgc3RvcmUsIGFuZCB0aGF0IGVrLmNydCBhbmQgZWsucHViJiMz
OTtzIHB1YmxpYyBrZXlzIG1hdGNoLjwvZGl2PjxkaXY+NS4gVmFsaWRhdGUgdGhhdCBteS1rZXku
cHViIGlzIGFjY2VwdGFibGUgKGUuZy4sIHRoYXQgZml4ZWR0cG0gYW5kIHNlbnNpdGl2ZWRhdGFv
cmlnaW4gYXJlIHNldCksIGFuZCB0aGF0IGl0IG1hdGNoZXMgdGhlIENTUiYjMzk7cyBwdWJsaWMg
a2V5LjwvZGl2PjxkaXY+Ni4gQ29udmVydCB0aGUgYWsucHViIGludG8gPGEgaHJlZj0iaHR0cDov
L2FrLm5hbWUiIHRhcmdldD0iX2JsYW5rIj5hay5uYW1lPC9hPiAodGhpcyBpcyBTSEEtMjU2IG9m
IGFrLnB1Yiwgc2tpcHBpbmcgdGhlIGZpcnN0IHR3byBieXRlcywgYW5kIHRoZW4gcHJlZml4aW5n
IGhleCAmcXVvdDswMDBiJnF1b3Q7IHRvIHRoZSByZXN1bHQpLjwvZGl2PjxkaXY+Ny4gVXNlICZx
dW90O3RwbTJfbWFrZWNyZWRlbnRpYWwgLWUgZWsucHViIC1uIGBjYXQgPGEgaHJlZj0iaHR0cDov
L2FrLm5hbWUiIHRhcmdldD0iX2JsYW5rIj5hay5uYW1lPC9hPmAgLXMgc2VjcmV0LnBsYWluIC1v
IHNlY3JldC5lbmNyeXB0ZWQmcXVvdDsgdG8gZW5jcnlwdCBzb21lIHNlY3JldCAodXAgdG8gMzIg
Ynl0ZXMpLjxicj48L2Rpdj48ZGl2PjguIFNlbmQgc2VjcmV0LmVuY3J5cHRlZCB0byB0aGUgY2xp
ZW50LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+OS4gQmFjayBvbiB0aGUgY2xpZW50LCB1c2Ug
dGhlIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMv
YmxvYi9tYXN0ZXIvbWFuL3RwbTJfYWN0aXZhdGVjcmVkZW50aWFsLjEubWQjZXhhbXBsZXMiIHRh
cmdldD0iX2JsYW5rIj5leGFtcGxlIHN0ZXBzIGluIHRwbTItdG9vbHMvbWFuL3RwbTJfYWN0aXZh
dGVjcmVkZW50aWFsPC9hPsKgKGluIHBhcnRpY3VsYXIsIHRoZSBmb3VyIGNvbW1hbmRzIGludm9s
dmluZyAmcXVvdDtzZXNzaW9uLmN0eCZxdW90OykgdG8gZGVjcnlwdCBzZWNyZXQuZW5jcnlwdGVk
IGJhY2sgaW50byBzZWNyZXQucGxhaW4uPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+UHJvdG9jb2wgd2lzZSwgZnJvbSB0aGUgc2VydmVyJiMzOTtzIHBvaW50IG9m
IHZpZXc6PC9kaXY+PGRpdj7CoCAoMSkgQnkgdmVyaWZ5aW5nIGVrLmNydCwgeW91IGtub3cgaXQg
Y29ycmVzcG9uZHMgdG8gYSByZWFsIFRQTTsgYW5kPC9kaXY+PGRpdj7CoCAoMikgQmVjYXVzZSBv
ZiBob3cgcmVhbCBUUE1zIHdvcmssIHlvdSBrbm93IGlmIHRoZSBjbGllbnQgc3VjY2Vzc2Z1bGx5
IHVzZWQgdHBtMl9hY3RpdmF0ZWNyZWRlbnRpYWwgdG8gZGVjcnlwdCBzZWNyZXQuZW5jcnlwdGVk
LCB0aGVuIHRoYXQgc2FtZSBUUE0gaGFzIGEgc2VjcmV0IGtleSB0aGF0IG1hdGNoZXMgbXkta2V5
LnB1Yi48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZSBiZXN0IHdheSBJJiMzOTt2ZSB0aG91
Z2h0IG9mIHV0aWxpemluZyB0aGlzIGlzIHRvIGdlbmVyYXRlIGEgMzItYnl0ZSByYW5kb20gbm9u
Y2UsIGVuY3J5cHQgdXNpbmcgdHBtMl9tYWtlY3JlZGVudGlhbCwgc2VuZCBpdCB0byB0aGUgY2xp
ZW50IHRvIGRlY3J5cHQgYXMgYSBjaGFsbGVuZ2UsIGFuZCBoYXZlIHRoZW0gZWNobyBpdCBiYWNr
LiBJZiB0aGV5JiMzOTtyZSBhYmxlIHRvIGRvIHNvIHN1Y2Nlc3NmdWxseSwgeW91IGNhbiBub3cg
c2lnbiB0aGUgQ1NSIGFuZCBpc3N1ZSB0aGVtIHRoZSBYLjUwOSBjZXJ0aWZpY2F0ZSBrbm93aW5n
IG15LWtleS5wdWIgaXMgdmFsaWQuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5UaGUgb3RoZXIgb3B0aW9uIGlzIHRvIGp1c3QgaXNzdWUgdGhlIFguNTA5IGNlcnRpZmlj
YXRlLCBidXQgZW5jcnlwdCBpdCB1c2luZyBhIHJhbmRvbSAzMi1ieXRlIGtleSwgYW5kIHNlYWwg
dGhlIGtleSB1c2luZyB0cG0yX21ha2VjcmVkZW50aWFsLiBCdXQgdGhpcyBtZWFucyB0aGUgc2Vy
dmVyIGRvZXNuJiMzOTt0IGtub3cgd2hldGhlciB0aGUgY2VydGlmaWNhdGUgaXMgYWN0dWFsbHkg
Z29pbmcgdG8gYmUgdXNlZC4gSWYgeW91IHdhbnQgdG8ga2VlcCBhIGxvZyBvZiBhbGwgaXNzdWVk
IGNlcnRpZmljYXRlcywgdGhpcyBzZWVtcyB1bmRlc2lyYWJsZS48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PkZpbmFsbHksIHRoaXMgaXMgdGhlIHNpbXBsZXN0IGFwcHJv
YWNoIHRvIGF0dGVzdGF0aW9uLiBJZiB5b3Ugd2FudCB0byBiZSBhYmxlIHRvIGRvIG1vcmUgY29t
cGxleCBhdHRlc3RhdGlvbiAoZS5nLiwgY2hlY2tpbmcgdGltZXN0YW1wcywgUENSIG9yIE5WIGlu
ZGV4IHZhbHVlcywgb3IgcHJvdmluZyB0aGF0IHRoZSBrZXkgd2FzIGZyZXNobHkgZ2VuZXJhdGVk
KSwgeW91JiMzOTtsbCBuZWVkIHRvIGluc3RlYWQgdXNlIHRoZSBhYm92ZSBzdGVwcyB0byB2YWxp
ZGF0ZSBhbiBBdHRlc3RhdGlvbiBLZXkgKHRoYXQgaXMsIGEga2V5IHdpdGggdGhlICZxdW90O3Jl
c3RyaWN0ZWQmcXVvdDsgYW5kICZxdW90O3NpZ25pbmcmcXVvdDsgYXR0cmlidXRlcyBzZXQgaW4g
aXRzICZxdW90O3B1YmxpYyZxdW90OyBkYXRhIGZpbGUpLiBBbmQgdGhlbiB0aGUgY2xpZW50IGNh
biB1c2UgdGhlIEFLIHRvIHdpdGggVFBNMl9DZXJ0aWZ5LCBUUE0yX1F1b3RlLCBldGMuPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Ib3BlZnVsbHkgdGhhdCBoZWxwcyBz
b21ld2hhdC4gSWYgYW55IHBhcnRpY3VsYXIgc3RlcHMgYXJlIHVuY2xlYXIsIGxldCBtZSBrbm93
LjwvZGl2PjwvZGl2Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============4244414666995994001==--

