Content-Type: multipart/mixed; boundary="===============2967115589864738184=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-openssl 1.1.1-rc0
Date: Fri, 23 Sep 2022 15:12:48 +0200
Message-ID: <20220923151248.7F2585CC@centrum.cz>
In-Reply-To: 20220114161914.F16B8401@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2967115589864738184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
=C2=A0
I made a tpm2-openssl 1.1.1-rc0: https://github.com/tpm2-software/tpm2-open=
ssl/releases/tag/1.1.1-rc0
=C2=A0
This is bugfix release that provides:

- Support for older TPM chips that do not support the CreateLoaded operatio=
n.
- Loading of NV index objects larger than TPM2_PT_NV_BUFFER_MAX.
- Loading of PEM certificates from the NV index.
- Support for the 'openssl cms' command for RSA keys.
- Building of tpm2-openssl on Windows (thanks to @mhummels).
- Ability to run autoreconf on the release tarball.

Kind Regards,
Petr
--===============2967115589864738184==--

