Content-Type: multipart/mixed; boundary="===============8796789139432325876=="
MIME-Version: 1.0
From: Peter.Huewe at infineon.com
Subject: [tpm2] Re: TPM V2: kernel panic on linux reboot
Date: Wed, 13 Jan 2021 14:39:38 +0000
Message-ID: <4c15766db7024754a57cce26514985ce@infineon.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8796789139432325876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,
I had a short look at your logs and yes, this definitely looks like a drive=
r issue and not related to the tpm2 software stack or the tpm itself.
However, during the development of the drivers and my daily work I did not =
see this happening on my rpi platforms.


I would suggest taking this discussion to the tpm driver mailing list which=
 is located at
   linux-integrity(a)vger.kernel.org
it usually makes sense to subscribe to the mailing list first, before posti=
ng the first message to avoid moderation of the message.
See  http://vger.kernel.org/vger-lists.html#linux-integrity

For the Linux Kernel related mailing lists it is important to post *plainte=
xt* emails *without* attachments. =

Just paste the contents of your logs below your email, especially the dmesg=
 output.

The (first) question is of course if you can reproduce it using the latest =
stable 4.19.167 and the lastest master/mainline  5.11-rc3

Thanks,
Peter



--===============8796789139432325876==--

