Content-Type: multipart/mixed; boundary="===============3910175678221214228=="
MIME-Version: 1.0
From: M D <dsmm4444 at gmail.com>
Subject: [tpm2] keyctl add trusted fails with Invalid argument
Date: Mon, 04 Jun 2018 09:30:08 -0700
Message-ID: <CACUY3eqTvc_-b42j_fdtGgEfBpk1guov=b0tVzYMJdb689LyvA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3910175678221214228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,
I am trying to create a trusted key as per instructions from the following =
page
https://sourceforge.net/p/linux-ima/wiki/Home/

I have a machine with TPM

root(a)proj:/data/tpm# dmesg | grep -i tpm
[    0.000000] ACPI: TPM2 0x000000008CD0D0C0 000034 (v03
Tpm2Tabl 00000001 AMI  00000000)
[    1.397424] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0x1A, rev-id 16)

The kernel also has the required options enabled as listed by the wiki.

I have
CONFIG_TRUSTED_KEYS=3Dy
CONFIG_ENCRYPTED_KEYS=3Dy

When I try to execute the command,

keyctl add trusted kmk-trusted "new 32" @u

I observe the error, "add_key: Invalid argument"

I am able to create user keys with the command

root(a)proj:/data/tpm# keyctl add user mykey "new 32" @u
410756505

I did try searching for answers on the web but was unable to
understand why the error occurs. I also have successfully taken
ownership of the tpm using the following instructions

root(a)proj:~# tpm2_takeownership -o 1234 -e 1234 -l 1234
root(a)proj:~# echo $?
0
root(a)proj:~#

The wiki also mentions that the following instruction needs to be
executed prior to creating the trusted key

# To create and save the kernel master key (trusted type):
$ su -c 'modprobe trusted encrypted'
$ su -c 'keyctl add trusted kmk-trusted "new 32" @u'


As I have the TRUSTED_KEYS and ENCRYPTED_KEYS as part of the kernel
and not as modules, I have not executed the command, modprobe trusted
encrypted


Could someone please help me understand what I am missing?

Regards,
Max

--===============3910175678221214228==--

