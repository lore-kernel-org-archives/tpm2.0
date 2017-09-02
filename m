Content-Type: multipart/mixed; boundary="===============1464820404036260610=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: [tpm2] hardware TPM2 performance data
Date: Sat, 02 Sep 2017 09:30:45 +0200
Message-ID: <401a10e0-0d19-c70b-173e-bac612d06df7@redhat.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1464820404036260610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello folks,

I was wondering if you have any hardware TPM2 performance data.

The only system I've access with a TPM2 for now, is a Lenovo Thinkpad X1 Ca=
rbon
(4th generation) that has a Intel PTT firmware based TPM2.

Executing the test/system/test_tpm2_unseal.sh takes ~6.5 seconds on my mach=
ine.

But my colleague Russell (please keep him on cc since I don't think he's in=
 the
list) has a machine with an Asus TPM-L R2.0 TTPM Module and it's painfully =
slow.

The same test takes more than 1 minute on his system. Are really hardware T=
PM2s
this slow? I understand that they are slow by design but is unsealing some =
data
really expected to take several seconds?

I would like to know what TPM2 chips are you using and how long the tpm2_un=
seal
test takes to run on your system, to know if Russell's hw TPM2 perf is the =
norm.

Thanks a lot and best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============1464820404036260610==--

