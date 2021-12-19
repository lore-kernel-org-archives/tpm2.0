Content-Type: multipart/mixed; boundary="===============7408329527978196400=="
MIME-Version: 1.0
From: Juergen Repp <Juergen.Repp at sit.fraunhofer.de>
Subject: [tpm2] Re: tpm2_flushcontext stuck
Date: Sun, 19 Dec 2021 13:17:43 +0100
Message-ID: <4055fbd2-3816-6458-f874-ebd194e588b1@sit.fraunhofer.de>
In-Reply-To: CAEjGaqeTkD1U2Ppb_F08WwG8gEfNJgYtD9tkYfw9tBHztcxu7Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7408329527978196400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am 18.12.21 um 20:34 schrieb Han:
> I probably missed it,=C2=A0 how can I specify to make sure /dev/tpm0 is u=
sed, and not /dev/tpmrm0=C2=A0?=C2=A0 Is it in some configurations?
> =

You can use the TPM without resource manager with:

tpm2_createprimary  -Tdevice:/dev/tpm0 -C o -g sha256 -G ecc -c primary.ctx
tpm2_getcap handles-transient -Tdevice:/dev/tpm0
tpm2_flushcontext -Tdevice:/dev/tpm0 0x80000000



--===============7408329527978196400==--

