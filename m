Content-Type: multipart/mixed; boundary="===============8744224588044817049=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Commands to be run in Factory
Date: Mon, 09 Dec 2019 15:48:09 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E5812E@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CALtZhhPo_huzVWJLqUEnm7vAKZbcDCnNO4Mcz-5fEsjjfvZ76Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8744224588044817049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Frederick Gotham [mailto:cauldwell.thomas(a)gmail.com]
> Sent: Monday, December 9, 2019 5:31 AM
> To: tpm2 <tpm2(a)lists.01.org>
> Subject: [tpm2] Commands to be run in Factory
> =

> I'm developing an embedded Linux device. In the factory, I need to load a=
n RSA
> keypair into the TPM2 chip and it has be stored persistently.
> =

> I've put together a script for doing this. Could you please glance over i=
t and tell
> me if I've missed anything?
> =

>     #!/bin/sh
> =

>     # Delete temporary files
>     rm /tmp/primary.ctx /tmp/private.blob /tmp/public.blob
> /tmp/key_to_persist.ctx > /dev/null 2>&1
> =

>     # You need to call this before doing anything with the TPM2 chip
>     tpm2_startup --clear
> =

>     # The next three lines flush out all the stuff in RAM (as well as =E2=
=80=98sessions=E2=80=99 which I
> don=E2=80=99t quite understand)

Sessions are just state associated with a handle. That state is the policy =
hash and any
Encryption/decryption stuff. You can actually use sessions to build encrypt=
ed tunnels to
Your TPM. Sessions can be used to authorize access to TPM objects using var=
ious tpm2_policyxxx
commands.

>     tpm2_flushcontext --transient-object
>     tpm2_flushcontext --loaded-session
>     tpm2_flushcontext --saved-session

On a tpm boot up, transient and sessions shouldn't be present. If you have =
other users of the TPM
doing this could cause them issues. It's best to use a resource manager. If=
 you can't spin up
tpm2-abrmd, the Linux kernel has /dev/tpmrm0, which you can specify in the =
TCTI options
like so:

tpm2_toolxxx -t device:/dev/tpmrm0

or via env
export TPM2TOOLS_TCTI=3Ddevice:/dev/tomrm0

Then you don't need to worry about the tpm2_startup command or flushing non=
-persistent
Objects.

> =

>     # The next line removes all persistent keys (just in case there=E2=80=
=99s some already in
> there)
>     tpm2_getcap handles-persistent | cut -d ' ' -f 2 | xargs -I {} -n1 -r=
 -t
> tpm2_evictcontrol --hierarchy=3Do --object-context=3D{}

If you have python you can make a HEREDOC python script and use something l=
ike
YAML to output this. It would be a little less brittle.

> =

>     # Prepare the chip to receive a new RSA key pair
>     # (This produces a temporary file primary.ctx which can be discarded =
later)
>     tpm2_createprimary --hierarchy=3Do --hash-algorithm=3Dsha256 --key-
> algorithm=3Drsa --key-context=3D/tmp/primary.ctx > /dev/null 2>&1
>     tpm2_flushcontext --transient-object
> =

>     # Load the RSA key pair into the chip (Yes it is necessary to load th=
e private key
> in even if you=E2=80=99re just doing signature verification)
>     # (This produces another three temporary files (.blob, .ctx) that can=
 be
> discarded later)
>     tpm2_import --input=3D/home/service/private.pem --parent-
> context=3D/tmp/primary.ctx --key-algorithm=3Drsa --private=3D/tmp/private=
.blob --
> public=3D/tmp/public.blob > /dev/null 2>&1
>     tpm2_load --parent-context=3D/tmp/primary.ctx --private=3D/tmp/privat=
e.blob --
> public=3D/tmp/public.blob --key-context=3D/tmp/key_to_persist.ctx
> =

>     # Lastly, and quite counter-intuitively, you use =E2=80=9Cevictcontro=
l=E2=80=9D to make the key
> persistent at address 0x81000000
>     tpm2_evictcontrol --hierarchy=3Do
> --object-context=3D/tmp/key_to_persist.ctx 0x81000000

You should use -o persistent.tr rather than a raw handle to access the obje=
ct. Using an
Esys TR object verifies that the name of the object is as expected.

> =

>     # Do the clean-up again
>     tpm2_flushcontext --transient-object
>     tpm2_flushcontext --loaded-session
>     tpm2_flushcontext --saved-session
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============8744224588044817049==--

