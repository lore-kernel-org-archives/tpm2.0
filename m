Content-Type: multipart/mixed; boundary="===============2292010823680608340=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] How Is This Possible If There Are No Keys ? ? ?
Date: Thu, 05 Dec 2019 09:16:09 +0000
Message-ID: <CALtZhhNwpNLBcYXjwY+z8DL1SGzdEocQC+s-8Dr37y7_wvCJ+Q@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2292010823680608340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In previous messages I mentioned that I was using tpm2-pkcs11. I am no
longer using tpm2-pkcs11. I am using tpm2-tools at the command line,
and I'm using "device:/dev/tpmrm0".

I am able to check a signature as follows:

    tpm2_verifysignature -T device -Q -c key_context_file_for_tpm2 -g
sha256 -m rootfs_hacked.tar -f rsassa -s signature_file
    WARNING:esys:src/tss2-esys/api/Esys_VerifySignature.c:302:Esys_VerifySi=
gnature_Finish()
Received TPM Error
    ERROR:esys:src/tss2-esys/api/Esys_VerifySignature.c:103:Esys_VerifySign=
ature()
Esys Finish ErrorCode (0x000002db)
    ERROR: Esys_VerifySignature(0x2DB) - tpm:parameter(2):the
signature is not valid
    ERROR: Verify signature failed!
    ERROR: Unable to run tpm2_verifysignature

This signature check is working properly (i.e. I have altered the
original file).

Immediately after I check that signature, I run 4 commands:

    tpm2_getcap handles-transient
    tpm2_getcap handles-persistent
    tpm2_getcap handles-loaded-session
    tpm2_getcap handles-saved-session

All four of these commands return nothing. So if there's no keys
inside the TPM2 chip, then how is the signature verification working?
--===============2292010823680608340==--

