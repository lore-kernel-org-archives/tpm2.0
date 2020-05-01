Content-Type: multipart/mixed; boundary="===============8486751448438478616=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Are there any help documents/sites on writing an ESAPI
 program.
Date: Fri, 01 May 2020 10:17:28 -0700
Message-ID: <CAOCvsSmwZ8Ae8x7dpttyRZ=jV_M2X-AHWhO8On0afKkzsiC0rA@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649ED8EBA@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8486751448438478616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

OpenSSL splits ECC into the "ec" and "ecparam" commands as part of
dealing with the fact that there's not just one curve and you need to
know which curve to operate on, unlike RSA.  The "ecparam" can
generate a parameter structure and then a key that meets those
parameters from it, or "ecparam" can just generate a key on one of the
known curves and skip the extra step entirely.  Given that curve IDs
are used by the TPM this is probably the method you'd want to use to
generate a keypair anyway.

All I've really got is "because that's what the Internet told me" and
"because that's what OpenSSL does" however bad those reasons are.  The
32 bytes shared secret applies to ECDH with ECC-P256 and other curves
would have other lengths obviously.  The sources I read on the
operation said you "ECC multiplied" the private key by the public key
of the peer and took the X coordinate as the shared secret.  When
performing the -derive operation on P256 keys with OpenSSL the result
is a 32-byte stream that looks like it's high-entropy.  Also a
tpm2_readpublic of an ECC-p256 key shows a 32-byte X-coordinate so
this seems consistent.  When I run OpenSSL's derive operation with the
reverse pairing I also get the same number so the command does seem to
generate a shared secret.  I'm pretty sure this shared secret is some
sort of raw bitstream because it's not in an ASN.1 representation like
everything else OpenSSL reads or creates, and it's exactly the right
size to be a 256 bit symmetric key or other raw number.

Given the original output of the operation is a point on the curve the
command might also be one part of the process of creating an ephemeral
key.  With a second use case maybe there'd need to be -x and -y
arguments instead of -o?  Or maybe a -F for output format and pack it
into an ASN.1 public key package or TPMS (public?) if the other
format's selected, that way meta data about algorithm and curve ID is
available.
The ASN.1 format OpenSSL stores a public key in is something like
(you'll have to forgive my lack of ASN.1 plaintext notation):
SEQUENCE:
    SEQUENCE:
        OID:
            id-ecPublicKey
        OID:
            <curveID>
    BIT STRING:
            sec1 string format:
                0x00 for octet string
                0x04 for uncompressed
                <x coordinate>
                <y coordinate>



>
> > decode.  The tool should ideally have a -o option that's optional with =
pipe
> > detection to switch to binary like tpm2_getrandom, because the expected
> > output format is a 32-byte integer with no formatting.
>
> Is it? How do you know that (im curious)? Their's code to go from TPM2 da=
ta structures
> To openssl EC_POINT. I was trying to figure out what to do with it then. =
Openssl has
> The app ecparams that shows some PEM output of BEGIN EC PARAMS in scissor=
 lines.
> I wasn't sure if we should go that route.
>
>
--===============8486751448438478616==--

