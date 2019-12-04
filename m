Content-Type: multipart/mixed; boundary="===============5517067663022665523=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Check to see if signature is okay, then reboot
Date: Wed, 04 Dec 2019 13:41:27 +0000
Message-ID: <CALtZhhPUgMQX7UQUAY1dXKOeML9X_RzUkmezAnwMkU7J0svj7A@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5517067663022665523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm trying to use the TPM2 check to verify a signature. Here's what I'm doi=
ng:

    # 1 : Generate a key pair
    openssl genrsa -out rsa.private 2048
    openssl rsa -in rsa.private -out rsa.public -pubout -outform PEM

    # 2 : Create two firmware files, the real one and the hacked one
    echo "this is our actual   firmware yeah" > rootfs.tar
    echo "this it our hacked  firmware yeah" > rootfs_hacked.tar

    # 3 : Create a signature file
    openssl dgst -sha256 -sign rsa.private -out signature_file rootfs.tar

    # 4 : Use the TPM2 chip to verify the signature
    tpm2_loadexternal -G rsa -u rsa.public -c key_context_file_for_tpm2
    tpm2_verifysignature -Q -c key_context_file_for_tpm2 -g sha256 -m
rootfs_hacked.tar -f rsassa -s signature_file

    return_code=3D$?
    echo The returned code was: ${return_code}

    case $return_code in
            0) echo 0 means success;;
            1) echo 1 means general error;;
            2) echo 2 means options handling error;;
            3) echo 3 means authentication error;;
            4) echo 4 means tcti error;;
            5) echo 5 means unsupported scheme;;
    esac


This works fine. But of course then I reboot, and I try to verify the
signature again with this one line:

    tpm2_verifysignature -Q -c key_context_file_for_tpm2 -g sha256 -m
rootfs_hacked.tar -f rsassa -s signature_file

This fails. . . presumably because the key was in volatile memory the
last time around (and so it got wiped upon reboot).

So I load the public key back in again, and this time around I want to
make it persistent. So after I load it in, I get a list of all handles
with these four commands:

    tpm2_getcap handles-transient
    tpm2_getcap handles-persistent
    tpm2_getcap handles-loaded-session
    tpm2_getcap handles-saved-session

All of these four commands return nothing. If I haven't got a handle
then I can't make it persistent.

Any ideas?
--===============5517067663022665523==--

