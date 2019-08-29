Content-Type: multipart/mixed; boundary="===============5687591596213714357=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Remote Attestation
Date: Thu, 29 Aug 2019 16:36:40 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEFABA@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CANKkrzF3QaAE4PFtoccPPeLnSPr0kQd5mNFiyVFg54XHRj8HSA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5687591596213714357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Matthew Demp=
sky
> Sent: Wednesday, August 28, 2019 8:00 PM
> To: Roberto Carvalho <roberto.nogueira.rc(a)gmail.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Remote Attestation
> =

> Unfortunately, I don't think the complete end-to-end tooling is there yet=
 in
> tpm2-tools to make trivial to do remote attestation. There's still a bit =
that's going
> to require manually handling of TPM2 data structures.
> =

> In the simplistic case that you just want to verify that the client's key=
 securely
> resides in a real TPM2, what you'll need to do is:
> =

> 1. On the client, generate the Endorsement Key (e.g., tpm2_createek -c ek=
.ctx -u
> ek.pub) and get the corresponding EK certificate (typically tpm2_nvread -=
o ek.crt
> 0x1c00002, for an RSA EK).
> 2. Get the "public" data structure corresponding to your secret key (e.g.=
, use
> tpm2_readpublic -c my-key.ctx -o my-key.pub).
> 3. Send ek.pub, ek.crt, and my-key.pub to the server.

FYI bear in mind these are in host endianness, so if you switch architectur=
e endianness
You need to convert these. It would be wise to serialize these properly bef=
ore sending
off the host. Im just using libmu to serialize, which doesn't deal with end=
ianness IRRC/IUUC.

> =

> 4. On the server, validate ek.crt against your TPM CA root store, and tha=
t ek.crt
> and ek.pub's public keys match.
> 5. Validate that my-key.pub is acceptable (e.g., that fixedtpm and
> sensitivedataorigin are set), and that it matches the CSR's public key.
> 6. Convert the ak.pub into ak.name <http://ak.name>  (this is SHA-256 of =
ak.pub,
> skipping the first two bytes, and then prefixing hex "000b" to the result=
).
> 7. Use "tpm2_makecredential -e ek.pub -n `cat ak.name <http://ak.name> ` =
-s
> secret.plain -o secret.encrypted" to encrypt some secret (up to 32 bytes).
> =

> 8. Send secret.encrypted to the client.
> =

> 9. Back on the client, use the example steps in tpm2-
> tools/man/tpm2_activatecredential <https://github.com/tpm2-software/tpm2-
> tools/blob/master/man/tpm2_activatecredential.1.md#examples>  (in particu=
lar,
> the four commands involving "session.ctx") to decrypt secret.encrypted ba=
ck into
> secret.plain.
> =

> =

> =

> Protocol wise, from the server's point of view:
>   (1) By verifying ek.crt, you know it corresponds to a real TPM; and
>   (2) Because of how real TPMs work, you know if the client successfully =
used
> tpm2_activatecredential to decrypt secret.encrypted, then that same TPM h=
as a
> secret key that matches my-key.pub.
> =

> The best way I've thought of utilizing this is to generate a 32-byte rand=
om nonce,
> encrypt using tpm2_makecredential, send it to the client to decrypt as a
> challenge, and have them echo it back. If they're able to do so successfu=
lly, you
> can now sign the CSR and issue them the X.509 certificate knowing my-key.=
pub is
> valid.
> =

> =

> The other option is to just issue the X.509 certificate, but encrypt it u=
sing a
> random 32-byte key, and seal the key using tpm2_makecredential. But this
> means the server doesn't know whether the certificate is actually going t=
o be
> used. If you want to keep a log of all issued certificates, this seems un=
desirable.
> =

> =

> Finally, this is the simplest approach to attestation. If you want to be =
able to do
> more complex attestation (e.g., checking timestamps, PCR or NV index valu=
es, or
> proving that the key was freshly generated), you'll need to instead use t=
he above
> steps to validate an Attestation Key (that is, a key with the "restricted=
" and
> "signing" attributes set in its "public" data file). And then the client =
can use the AK
> to with TPM2_Certify, TPM2_Quote, etc.
> =

> =

> Hopefully that helps somewhat. If any particular steps are unclear, let m=
e know.

--===============5687591596213714357==--

