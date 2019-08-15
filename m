Content-Type: multipart/mixed; boundary="===============5385214814214559110=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: [tpm2] Key distribution using tpm2_import
Date: Thu, 15 Aug 2019 13:28:48 -0700
Message-ID: <CANKkrzF7PE-2akwNaqKkTpGpD-itz+2Z78_v-_q9GYG_nm=O=A@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5385214814214559110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm responding to https://lists.01.org/pipermail/tpm2/2019-June/001204.html,
which I found referenced at
https://github.com/tpm2-software/tpm2-tools/issues/1556.

In "A Practical Guide to TPM 2.0", the instructions claim "At this point,
the local platform has received an HMAC key from the IT central system *that
has never been decrypted in the local system=E2=80=99s memory.*" [emphasis =
added]

You would reverse the steps:
> 1. The receiving application would check that IT signature matches and
> that the cert chain is valid. Use normal OSSL.
> 2. decrypt the blob (key) with RSA Decrypt using the TPM private key
> corresponding with the public portion used for encrypt
> 3. Now that you have the plaintext blob (actual symmetric key), call
> tpm2_import.


If you're using the TPM to simply decrypt and get the plaintext blob /
actual symmetric key, then haven't you exposed it to the local system's
memory?

I think to avoid that, you need to use tpm2_duplicate to generate the
duplicated key using the target parent storage key [1], and then use
tpm2_import to directly import the duplicated key under the storage key [2].

What I'm a little unclear about is whether, before calling tpm2_duplicate,
there's a way to ensure that the storage key *can't* be used to simply
decrypt and expose the key to system memory. I imagine this requires
attestation about the storage key's attributes.

[1]
https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_duplicate.=
1.md#examples
[2]
https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_import.1.m=
d#import-a-duplicated-key

--===============5385214814214559110==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SSYjMzk7bSByZXNwb25kaW5nIHRvwqA8YSBocmVmPSJodHRwczovL2xp
c3RzLjAxLm9yZy9waXBlcm1haWwvdHBtMi8yMDE5LUp1bmUvMDAxMjA0Lmh0bWwiPmh0dHBzOi8v
bGlzdHMuMDEub3JnL3BpcGVybWFpbC90cG0yLzIwMTktSnVuZS8wMDEyMDQuaHRtbDwvYT4sIHdo
aWNoIEkgZm91bmQgcmVmZXJlbmNlZCBhdMKgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3Rw
bTItc29mdHdhcmUvdHBtMi10b29scy9pc3N1ZXMvMTU1NiI+aHR0cHM6Ly9naXRodWIuY29tL3Rw
bTItc29mdHdhcmUvdHBtMi10b29scy9pc3N1ZXMvMTU1NjwvYT4uPGRpdj48YnI+PC9kaXY+PGRp
dj48ZGl2PkluICZxdW90O0EgUHJhY3RpY2FsIEd1aWRlIHRvIFRQTSAyLjAmcXVvdDssIHRoZSBp
bnN0cnVjdGlvbnMgY2xhaW0gJnF1b3Q7QXQgdGhpcyBwb2ludCwgdGhlIGxvY2FsIHBsYXRmb3Jt
IGhhcyByZWNlaXZlZCBhbiBITUFDIGtleSBmcm9tIHRoZSBJVCBjZW50cmFsIHN5c3RlbcKgPGI+
dGhhdCBoYXMgbmV2ZXIgYmVlbiBkZWNyeXB0ZWQgaW4gdGhlIGxvY2FsIHN5c3RlbeKAmXMgbWVt
b3J5LjwvYj4mcXVvdDsgW2VtcGhhc2lzIGFkZGVkXTwvZGl2PjxkaXY+PGJyPjwvZGl2PjwvZGl2
PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBw
eCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxl
ZnQ6MWV4Ij5Zb3Ugd291bGQgcmV2ZXJzZSB0aGUgc3RlcHM6PGJyPjEuIFRoZSByZWNlaXZpbmcg
YXBwbGljYXRpb24gd291bGQgY2hlY2sgdGhhdCBJVCBzaWduYXR1cmUgbWF0Y2hlcyBhbmQgdGhh
dCB0aGUgY2VydCBjaGFpbiBpcyB2YWxpZC4gVXNlIG5vcm1hbCBPU1NMLjxicj4yLiBkZWNyeXB0
IHRoZSBibG9iIChrZXkpIHdpdGggUlNBIERlY3J5cHQgdXNpbmcgdGhlIFRQTSBwcml2YXRlIGtl
eSBjb3JyZXNwb25kaW5nIHdpdGggdGhlIHB1YmxpYyBwb3J0aW9uIHVzZWQgZm9yIGVuY3J5cHQ8
YnI+My4gTm93IHRoYXQgeW91IGhhdmUgdGhlIHBsYWludGV4dCBibG9iIChhY3R1YWwgc3ltbWV0
cmljIGtleSksIGNhbGwgdHBtMl9pbXBvcnQuPC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2Pjxk
aXY+SWYgeW91JiMzOTtyZSB1c2luZyB0aGUgVFBNIHRvIHNpbXBseSBkZWNyeXB0IGFuZCBnZXQg
dGhlIHBsYWludGV4dCBibG9iIC8gYWN0dWFsIHN5bW1ldHJpYyBrZXksIHRoZW4gaGF2ZW4mIzM5
O3QgeW91IGV4cG9zZWQgaXQgdG8gdGhlIGxvY2FsIHN5c3RlbSYjMzk7cyBtZW1vcnk/PGJyPjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSB0aGluayB0byBhdm9pZCB0aGF0LCB5b3UgbmVlZCB0
byB1c2UgdHBtMl9kdXBsaWNhdGUgdG8gZ2VuZXJhdGUgdGhlIGR1cGxpY2F0ZWQga2V5IHVzaW5n
IHRoZSB0YXJnZXQgcGFyZW50IHN0b3JhZ2Uga2V5IFsxXSwgYW5kIHRoZW4gdXNlIHRwbTJfaW1w
b3J0IHRvIGRpcmVjdGx5IGltcG9ydCB0aGUgZHVwbGljYXRlZCBrZXkgdW5kZXIgdGhlIHN0b3Jh
Z2Uga2V5IFsyXS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PldoYXQgSSYjMzk7bSBhIGxpdHRs
ZSB1bmNsZWFyIGFib3V0IGlzIHdoZXRoZXIsIGJlZm9yZSBjYWxsaW5nIHRwbTJfZHVwbGljYXRl
LCB0aGVyZSYjMzk7cyBhIHdheSB0byBlbnN1cmUgdGhhdCB0aGUgc3RvcmFnZSBrZXkgPGk+Y2Fu
JiMzOTt0PC9pPsKgYmUgdXNlZCB0byBzaW1wbHkgZGVjcnlwdCBhbmQgZXhwb3NlIHRoZSBrZXkg
dG8gc3lzdGVtIG1lbW9yeS4gSSBpbWFnaW5lIHRoaXMgcmVxdWlyZXMgYXR0ZXN0YXRpb24gYWJv
dXQgdGhlIHN0b3JhZ2Uga2V5JiMzOTtzIGF0dHJpYnV0ZXMuPC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5bMV3CoDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTIt
dG9vbHMvYmxvYi9tYXN0ZXIvbWFuL3RwbTJfZHVwbGljYXRlLjEubWQjZXhhbXBsZXMiPmh0dHBz
Oi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9tYXN0ZXIvbWFuL3Rw
bTJfZHVwbGljYXRlLjEubWQjZXhhbXBsZXM8L2E+PC9kaXY+PGRpdj5bMl3CoDxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9tYXN0ZXIvbWFu
L3RwbTJfaW1wb3J0LjEubWQjaW1wb3J0LWEtZHVwbGljYXRlZC1rZXkiPmh0dHBzOi8vZ2l0aHVi
LmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9tYXN0ZXIvbWFuL3RwbTJfaW1wb3J0
LjEubWQjaW1wb3J0LWEtZHVwbGljYXRlZC1rZXk8L2E+PC9kaXY+PC9kaXY+Cg==

--===============5385214814214559110==--

