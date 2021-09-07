Content-Type: multipart/mixed; boundary="===============7382289084208877619=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] [Release Announcement] tpm2-openssl 1.0.0-rc0
Date: Tue, 07 Sep 2021 19:36:48 +0200
Message-ID: <20210907193648.D5B0955A@centrum.cz>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7382289084208877619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

After 3 years of development the OpenSSL 3.0 has been released today: https=
://www.openssl.org/blog/blog/2021/09/07/OpenSSL3.Final/

This is a major release, which introduces a new API for integrating externa=
l cipher providers.


Consequently, I am pleased to announce the release of tpm2-openssl 1.0.0-rc=
0.

This is a provider for integration of TPM 2.0 to OpenSSL 3.0, which makes t=
he TPM 2.0 accessible via the standard OpenSSL API and command-line tools.

The tpm2-openssl is similar to the tpm2-tss-engine, but it uses a different=
 API. Thanks to the new API the tpm2-openssl provider can offer additional =
features, such as:
=C2=A0- Key generation using the 'openssl pkey' command
=C2=A0- Access to persistent keys via their handles
=C2=A0- Signing using a restricted signing key

See the README for more details: https://github.com/tpm2-software/tpm2-open=
ssl

The pre-release is available here: https://github.com/tpm2-software/tpm2-op=
enssl/releases/tag/1.0.0-rc0

I'd appreciate any feedback.


Kind Regards,
Petr
=C2=A0
--===============7382289084208877619==--

