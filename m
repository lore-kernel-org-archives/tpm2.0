Content-Type: multipart/mixed; boundary="===============3043539384633827294=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-tss-engine 1.2.0-rc0
Date: Fri, 14 Jan 2022 12:19:27 +0000
Message-ID: <AS8P194MB1669987A8C47BA20C063A8F9A6549@AS8P194MB1669.EURP194.PROD.OUTLOOK.COM>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3043539384633827294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I just tagged tpm2-tss-engine 1.2.0-rc0 that can be found here: https://git=
hub.com/tpm2-software/tpm2-tss-engine/releases/tag/1.2.0-rc0

NOTE: I changed the tag-scheme from v1.1.0 to 1.2.0 (i.e. removed the leadi=
ng v) in order to use "git describe" during configure.ac
If this breaks anything for you badly, please get in touch.

For convenience, here's the changelog:
### Changed or Fixed
- Updated minimal version of tpm2-tss to 2.4.x
- Fix encoding of emptyauth
- Fix some memory leaks
- Change parent handle to BIGNUM

### Added
- Use of restricted keys for signing
- StirRandom
- Run tests using swtpm
- The ability to import key blobs from things like the tpm2-tools project.
- Compatibility with openssl >=3D1.1.x
- Support for ECDH
- Fix QNX build issues.
- Only set -Werror for non-release builds.
- Additional checks on TPM responses
- CODE_OF_CONDUCT

Best regards,
Andreas
--===============3043539384633827294==--

