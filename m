Content-Type: multipart/mixed; boundary="===============4674062790198629255=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: Is the tpm2_create command safe against sniffing attacks?
Date: Mon, 02 Aug 2021 14:58:50 -0400
Message-ID: <OF8BBF26A9.0B99F84B-ON00258725.00602982-85258725.006843B9@ibm.com>
In-Reply-To: CAOCvsSmH40m_Jae0EthvvYBZEcXgykzLuqTe3JNv-jwNooY=wA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4674062790198629255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable





"Steven Clark" <davolfman(a)gmail.com> wrote on 08/02/2021 01:26:56 PM:

> I think it may be an optional standard but my TPM has some certs
> permanently stored in nv-indices in the 0x1c0000x range that can be
> checked against the manufacturer cert.=C2=A0 I haven't=C2=A0learned how to
> leverage those into trusted parameter encryption keys yet but they
> should be able to verify there's a real TPM at the other end at the
> very least (and more if you learn to use them correctly).

The EK certificates in NV are in theory optional, but every TPM
I have encountered has them.

Checking the certificate against the manufacturer's CA is
a standard crypto library function.

Once you have an authentic EK, create a salted session using
the EK.

Once you have the salted session, set the encrypt and/or decrypt bit
when running the command.

Underneath, there's some complicated crypto, but it's all
hidden from the application.

--===============4674062790198629255==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PHR0Pjxmb250IHNpemU9IjIiPiZxdW90O1N0ZXZlbiBDbGFyayZxdW90
OyAmbHQ7ZGF2b2xmbWFuQGdtYWlsLmNvbSZndDsgd3JvdGUgb24gMDgvMDIvMjAyMSAwMToyNjo1
NiBQTTo8YnI+PGJyPiZndDsgSSB0aGluayBpdCBtYXkgYmUgYW4gb3B0aW9uYWwgc3RhbmRhcmQg
YnV0IG15IFRQTSBoYXMgc29tZSBjZXJ0cyA8YnI+Jmd0OyBwZXJtYW5lbnRseSBzdG9yZWQgaW4g
bnYtaW5kaWNlcyBpbiB0aGUgMHgxYzAwMDB4IHJhbmdlIHRoYXQgY2FuIGJlIDxicj4mZ3Q7IGNo
ZWNrZWQgYWdhaW5zdCB0aGUgbWFudWZhY3R1cmVyIGNlcnQuoCBJIGhhdmVuJ3SgbGVhcm5lZCBo
b3cgdG8gPGJyPiZndDsgbGV2ZXJhZ2UgdGhvc2UgaW50byB0cnVzdGVkIHBhcmFtZXRlciBlbmNy
eXB0aW9uIGtleXMgeWV0IGJ1dCB0aGV5IDxicj4mZ3Q7IHNob3VsZCBiZSBhYmxlIHRvIHZlcmlm
eSB0aGVyZSdzIGEgcmVhbCBUUE0gYXQgdGhlIG90aGVyIGVuZCBhdCB0aGUgPGJyPiZndDsgdmVy
eSBsZWFzdCAoYW5kIG1vcmUgaWYgeW91IGxlYXJuIHRvIHVzZSB0aGVtIGNvcnJlY3RseSkuPC9m
b250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj48YnI+VGhlIEVLIGNlcnRpZmljYXRlcyBp
biBOViBhcmUgaW4gdGhlb3J5IG9wdGlvbmFsLCBidXQgZXZlcnkgVFBNPC9mb250PjwvdHQ+PGJy
Pjx0dD48Zm9udCBzaXplPSIyIj5JIGhhdmUgZW5jb3VudGVyZWQgaGFzIHRoZW0uPC9mb250Pjwv
dHQ+PGJyPjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+Q2hlY2tpbmcgdGhlIGNlcnRpZmljYXRlIGFn
YWluc3QgdGhlIG1hbnVmYWN0dXJlcidzIENBIGlzPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBz
aXplPSIyIj5hIHN0YW5kYXJkIGNyeXB0byBsaWJyYXJ5IGZ1bmN0aW9uLjwvZm9udD48L3R0Pjxi
cj48YnI+PHR0Pjxmb250IHNpemU9IjIiPk9uY2UgeW91IGhhdmUgYW4gYXV0aGVudGljIEVLLCBj
cmVhdGUgYSBzYWx0ZWQgc2Vzc2lvbiB1c2luZzwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6
ZT0iMiI+dGhlIEVLLjwvZm9udD48L3R0Pjxicj48YnI+PHR0Pjxmb250IHNpemU9IjIiPk9uY2Ug
eW91IGhhdmUgdGhlIHNhbHRlZCBzZXNzaW9uLCBzZXQgdGhlIGVuY3J5cHQgYW5kL29yIGRlY3J5
cHQgYml0PC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj53aGVuIHJ1bm5pbmcgdGhl
IGNvbW1hbmQuPC9mb250PjwvdHQ+PGJyPjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+VW5kZXJuZWF0
aCwgdGhlcmUncyBzb21lIGNvbXBsaWNhdGVkIGNyeXB0bywgYnV0IGl0J3MgYWxsPC9mb250Pjwv
dHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5oaWRkZW4gZnJvbSB0aGUgYXBwbGljYXRpb24uPC9m
b250PjwvdHQ+PEJSPgo8QlI+CjwvYm9keT48L2h0bWw+Cg==

--===============4674062790198629255==--

