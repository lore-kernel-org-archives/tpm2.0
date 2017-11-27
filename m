Content-Type: multipart/mixed; boundary="===============0436202724825676378=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: [tpm2] tpm: swtpm and libtpms projects tagged
Date: Mon, 27 Nov 2017 09:59:43 -0500
Message-ID: <d1bb0f60-1c09-8189-a5d1-0b762b3ceecb@linux.vnet.ibm.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0436202724825676378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello!

I tagged libtpms with TPM 1.2 and TPM 2 support with tag/v0.6.0-dev1 and =

swtpm with TPM 1.2 and TPM 2 support with tag/v0.1.0-dev2. The git repos =

of the respective projects are here:

libtpms: https://github.com/stefanberger/libtpms

swtpm: https://github.com/stefanberger/swtpm


Note: Recent modifications to libtpms will produce a state file =

(tpm2-00.permall) of 64kb. Previous state files will not work anymore, =

so you may have to remove them.

Compilation instructions can be found on the git hub Wiki pages of these =

projects.

Regards,
     Stefan



--===============0436202724825676378==--

