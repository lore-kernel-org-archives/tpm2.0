Content-Type: multipart/mixed; boundary="===============4951729460865659907=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Pipe the TMP2 directly into /dev/random
Date: Fri, 13 Dec 2019 09:53:41 +0000
Message-ID: <CALtZhhMoeDg_Tx5_x7p4WPPudyUV8JuwbGZ_J3qq=msZ76cEHg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4951729460865659907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

I realise that we can use rng-tools to use the TPM2 to seed the random
number generator built into the Linux kernel.

What I'd like to ask though, is if anyone has done any work connecting
/dev/random directly to the TPM2 so that there's no software
pseudo-randomness at all.

If this hasn't been done, would anyone like to work on it with me?

Frederick
--===============4951729460865659907==--

