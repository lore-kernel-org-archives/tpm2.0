Content-Type: multipart/mixed; boundary="===============6926246127376095376=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Fwd: How Is This Possible If There Are No Keys ? ? ?
Date: Thu, 05 Dec 2019 09:50:00 +0000
Message-ID: <CALtZhhNCSJ=ST1WLxUHWv3mf5rLJRX05A3huEXLr5_7ayqMjKg@mail.gmail.com>
In-Reply-To: CALtZhhNfQcgPiwE_QuYa7kuWdu+EQEvucCE=eyz3nZWEG-Xirw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6926246127376095376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/5/19, Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de> wrote:
> The key is inside key_context_file_for_tpm2
>
> It's stored in there protected by a TPM-internal second key.
>
> When you call the command, it gets loaded into the TPM, used
> to verify the signature and then flushed from the TPM again.

When I reboot my device and then try to do the signature verification
again, I get this back:

    tpm2_verifysignature -Q -c key_context_file_for_tpm2 -g sha256 -m
rootfs_hacked.tar -f rsassa -s signature_file
    WARNING:esys:src/tss2-esys/api/Esys_ContextLoad.c:279:Esys_ContextLoad_=
Finish()
Received TPM Error
    ERROR:esys:src/tss2-esys/api/Esys_ContextLoad.c:93:Esys_ContextLoad()
Esys Finish ErrorCode (0x000001df)
    ERROR: Esys_ContextLoad(0x1DF) - tpm:parameter(1):integrity check failed
    ERROR: Unable to run tpm2_verifysignature


So after I reboot my device, I'm not able to use that
"key_context_file_for_tpm2" again. So this would mean that I would
have to load the pubilc key in again.

I'm not allowed to store any RSA keys on the hard disk of my device.
One of my boss's bosses has handed down an edict that all keys will be
loaded into the TPM2 chip once in the factory, and after that there
will be no RSA keys stored on the hard disk ever.

How on earth can I get a public key persistently into the TPM2?

If it turns out that I need to load the entire
private-and-public-key-pair into the TPM2 chip in order to make it
persistent, then I will do that.
--===============6926246127376095376==--

