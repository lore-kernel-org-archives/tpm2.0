Content-Type: multipart/mixed; boundary="===============3839577382659816343=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] RSA key pairs are gone when I reboot
Date: Tue, 03 Dec 2019 15:54:03 +0000
Message-ID: <CALtZhhN1mypXuHrt1ydFS0c1aL5zmO3FnOqWQt74-pg6h+5ghQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3839577382659816343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I use OpenSSL to generate an RSA key pair:

    openssl genrsa -out private.pem 2048

I then use the utility "tpm2_ptool" to load the key pair into the TPM2 chip:

    tpm2_ptool init
    tpm2_ptool addtoken --pid=3D1 --sopin=3Dmysopin --userpin=3D123456 --la=
bel monkey
    tpm2_ptool import --userpin 123456 --privkey private.pem --label
monkey --algorithm rsa

I am able to confirm that the key pair is inside the TPM2 chip by
using ssh-keygen:

    ssh-keygen -D libtpm2_pkcs11.so

The output from ssh-keygen confirms that the keys are in there.

Next. . . I reboot my device, and the keypair is gone. It's no longer
in there. So it appears that the key was only in RAM and then it gets
wiped upon reboot.

How do I store an RSA key pair persistently/permanently inside the TPM2 chi=
p?
--===============3839577382659816343==--

