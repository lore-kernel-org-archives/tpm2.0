Content-Type: multipart/mixed; boundary="===============7406051037048073951=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] [RELEASE] tpm2-openssl 1.1.0
Date: Tue, 22 Mar 2022 15:22:21 +0100
Message-ID: <20220322152221.2AEC1565@centrum.cz>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7406051037048073951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
 =

I released the tpm2-openssl version 1.1.0 (same as 1.1.0-rc0):
 =

### Fixed
- Fixed segmentation fault when a signature algorithm is being initialized
  without a private key.

### Added
- Added support for the `TPM2OPENSSL_PARENT_AUTH` environment variable.
- Added the Code of Conduct and Contributing guidelines.


The release can be found here:
https://github.com/tpm2-software/tpm2-openssl/releases/tag/1.1.0

Regards,
Petr
--===============7406051037048073951==--

