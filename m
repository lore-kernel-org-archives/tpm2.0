Content-Type: multipart/mixed; boundary="===============8973555485396607294=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Commands to be run in Factory
Date: Mon, 09 Dec 2019 11:30:31 +0000
Message-ID: <CALtZhhPo_huzVWJLqUEnm7vAKZbcDCnNO4Mcz-5fEsjjfvZ76Q@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8973555485396607294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm developing an embedded Linux device. In the factory, I need to
load an RSA keypair into the TPM2 chip and it has be stored
persistently.

I've put together a script for doing this. Could you please glance
over it and tell me if I've missed anything?

    #!/bin/sh

    # Delete temporary files
    rm /tmp/primary.ctx /tmp/private.blob /tmp/public.blob
/tmp/key_to_persist.ctx > /dev/null 2>&1

    # You need to call this before doing anything with the TPM2 chip
    tpm2_startup --clear

    # The next three lines flush out all the stuff in RAM (as well as
=E2=80=98sessions=E2=80=99 which I don=E2=80=99t quite understand)
    tpm2_flushcontext --transient-object
    tpm2_flushcontext --loaded-session
    tpm2_flushcontext --saved-session

    # The next line removes all persistent keys (just in case there=E2=80=
=99s
some already in there)
    tpm2_getcap handles-persistent | cut -d ' ' -f 2 | xargs -I {} -n1
-r -t tpm2_evictcontrol --hierarchy=3Do --object-context=3D{}

    # Prepare the chip to receive a new RSA key pair
    # (This produces a temporary file primary.ctx which can be discarded la=
ter)
    tpm2_createprimary --hierarchy=3Do --hash-algorithm=3Dsha256
--key-algorithm=3Drsa --key-context=3D/tmp/primary.ctx > /dev/null 2>&1
    tpm2_flushcontext --transient-object

    # Load the RSA key pair into the chip (Yes it is necessary to load
the private key in even if you=E2=80=99re just doing signature verification)
    # (This produces another three temporary files (.blob, .ctx) that
can be discarded later)
    tpm2_import --input=3D/home/service/private.pem
--parent-context=3D/tmp/primary.ctx --key-algorithm=3Drsa
--private=3D/tmp/private.blob --public=3D/tmp/public.blob > /dev/null 2>&1
    tpm2_load --parent-context=3D/tmp/primary.ctx
--private=3D/tmp/private.blob --public=3D/tmp/public.blob
--key-context=3D/tmp/key_to_persist.ctx

    # Lastly, and quite counter-intuitively, you use =E2=80=9Cevictcontrol=
=E2=80=9D to
make the key persistent at address 0x81000000
    tpm2_evictcontrol --hierarchy=3Do
--object-context=3D/tmp/key_to_persist.ctx 0x81000000

    # Do the clean-up again
    tpm2_flushcontext --transient-object
    tpm2_flushcontext --loaded-session
    tpm2_flushcontext --saved-session
--===============8973555485396607294==--

