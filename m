Content-Type: multipart/mixed; boundary="===============3486836278945420360=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Check to see if signature is okay, then reboot
Date: Wed, 04 Dec 2019 14:33:36 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E4BE0F@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CALtZhhPUgMQX7UQUAY1dXKOeML9X_RzUkmezAnwMkU7J0svj7A@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3486836278945420360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Frederick Gotham [mailto:cauldwell.thomas(a)gmail.com]
> Sent: Wednesday, December 4, 2019 7:41 AM
> To: tpm2 <tpm2(a)lists.01.org>
> Subject: [tpm2] Check to see if signature is okay, then reboot
> =

> I'm trying to use the TPM2 check to verify a signature. Here's what I'm d=
oing:
> =

>     # 1 : Generate a key pair
>     openssl genrsa -out rsa.private 2048
>     openssl rsa -in rsa.private -out rsa.public -pubout -outform PEM
> =

>     # 2 : Create two firmware files, the real one and the hacked one
>     echo "this is our actual   firmware yeah" > rootfs.tar
>     echo "this it our hacked  firmware yeah" > rootfs_hacked.tar
> =

>     # 3 : Create a signature file
>     openssl dgst -sha256 -sign rsa.private -out signature_file rootfs.tar
> =

>     # 4 : Use the TPM2 chip to verify the signature

Verifying a signature with the TPM doesn't really provide much for
guarantees directly over software verification. Especially when it's
an externally sourced public key. Unless you're in an environment where
OSSL doesn't exist, and your just using it as an offload mechanism.

>     tpm2_loadexternal -G rsa -u rsa.public -c key_context_file_for_tpm2
>     tpm2_verifysignature -Q -c key_context_file_for_tpm2 -g sha256 -m
> rootfs_hacked.tar -f rsassa -s signature_file
> =

>     return_code=3D$?
>     echo The returned code was: ${return_code}
> =

>     case $return_code in
>             0) echo 0 means success;;
>             1) echo 1 means general error;;
>             2) echo 2 means options handling error;;
>             3) echo 3 means authentication error;;
>             4) echo 4 means tcti error;;
>             5) echo 5 means unsupported scheme;;
>     esac
> =

> =

> This works fine. But of course then I reboot, and I try to verify the sig=
nature again
> with this one line:
> =

>     tpm2_verifysignature -Q -c key_context_file_for_tpm2 -g sha256 -m
> rootfs_hacked.tar -f rsassa -s signature_file
> =

> This fails. . . presumably because the key was in volatile memory the las=
t time
> around (and so it got wiped upon reboot).

You need to call tpm2_loadexternal again to load the public portion of the =
key into
The TPM or you need to mark the pubic object persistent with tpm2_evictcont=
rol.
However, I would urge against that. Just load the object when you need it. =
A RM
Should take care of flushing "transient" objects when your don't with them,=
 or if
Using the TPM directly, tpm2_flushcontext.

Those files used in the -C and -c options are context files. Between comman=
d invocations
The tools save the object context for re-use during, essentially, that boot=
 of the TPM.
After reboot, you need to re-get a context file, in your case tpm2_loadexte=
rnal will
provide it.


> =

> So I load the public key back in again, and this time around I want to ma=
ke it
> persistent. So after I load it in, I get a list of all handles with these=
 four commands:
> =

>     tpm2_getcap handles-transient
>     tpm2_getcap handles-persistent
>     tpm2_getcap handles-loaded-session
>     tpm2_getcap handles-saved-session
> =

> All of these four commands return nothing. If I haven't got a handle then=
 I can't
> make it persistent.
> =

> Any ideas?
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============3486836278945420360==--

