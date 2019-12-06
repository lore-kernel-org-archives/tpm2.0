Content-Type: multipart/mixed; boundary="===============0325003058423881146=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Generate keypair using OpenSSL, then load into TPM2
Date: Fri, 06 Dec 2019 10:47:13 +0000
Message-ID: <CALtZhhPmk-VeBn48kgLp70uydQLSep8dkKSs4_CCzW_Arm5eyw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0325003058423881146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I generate an RSA keypair as follows:

    openssl genrsa -out private.pem 2048

Next I want to load this keypair into the TPM2 and make it persistent.
In future I will use it to verify signatures.

Looking through the manual for TPM2 tools, I notice three tools in
particular, "load", "loadexternal", "import". At first glance it looks
like the one I need here is "import". So here's what I do:

    tpm2_createprimary --hierarchy=3Do --hash-algorithm=3Dsha256
--key-algorithm=3Drsa --key-context=3Dprimary.ctx

    tpm2_flushcontext --transient-object

    tpm2_import -C primary.ctx -G rsa -i private.pem -u key.pub -r key.priv

It works fine up until here. Next I want make it persistent. . . .Oh
wait I can't. I don't have a context file to feed into
"tpm2_evictcontrol". So where do I go from here?
--===============0325003058423881146==--

