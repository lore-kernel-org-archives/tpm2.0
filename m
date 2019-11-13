Content-Type: multipart/mixed; boundary="===============6516678449912670552=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: tpm2_startauthsession 4.x is using getrandom and I need to
 stop that.
Date: Wed, 13 Nov 2019 13:29:05 -0800
Message-ID: <CAOCvsSk3L=uXTSJOZi6=N993+6rdvmxao6672Kr5JGEib6TY=w@mail.gmail.com>
In-Reply-To: CAOCvsS=RhdQy2Oyt06TUX1C3EdkZwDG6-hQj_2OKtbNnJ08GmQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6516678449912670552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've got buy-in from the team on using the kernel cmdline to seed the
crng from TPM and CPU HWRNGs.
For anyone else who gets this problem rng_core.default_quality=3D1000
will work on kernels too old to have CONFIG_RANDOM_TRUST_CPU
--===============6516678449912670552==--

