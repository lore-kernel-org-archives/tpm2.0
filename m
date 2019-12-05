Content-Type: multipart/mixed; boundary="===============6435128822981104512=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: How Is This Possible If There Are No Keys ? ? ?
Date: Thu, 05 Dec 2019 09:29:12 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163C1D074@exch2010c.sit.fraunhofer.de>
In-Reply-To: CALtZhhNwpNLBcYXjwY+z8DL1SGzdEocQC+s-8Dr37y7_wvCJ+Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6435128822981104512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The key is inside key_context_file_for_tpm2

It's stored in there protected by a TPM-internal second key.

When you call the command, it gets loaded into the TPM, used
to verify the signature and then flushed from the TPM again.

If you are interested in the concept behind, look at the TPM specification
under the keywords TPM2_ContextSave and TPM2_ContextLoad.

________________________________________
From: Frederick Gotham [cauldwell.thomas(a)gmail.com]
Sent: Thursday, December 05, 2019 10:16
To: tpm2
Subject: [tpm2] How Is This Possible If There Are No Keys ? ? ?

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
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6435128822981104512==--

