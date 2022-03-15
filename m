Content-Type: multipart/mixed; boundary="===============3855884061546786254=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-pkcs11 1.8.0-rc0
Date: Tue, 15 Mar 2022 15:56:58 +0000
Message-ID: <SN6PR11MB343753E5501C5DA4DCE56038B8109@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3855884061546786254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

tpm2-pkcs11 version 1.8.0-rc0 with the following CHANGELOG:
## [1.8.0-rc0 ] - 2022-03-15
### Fixed
- Fix GetRandom Memory Leak
- Fix some spelling mistakes
- Fix unit test test_parser
- Fix importing of RSA private key through pkcs11 interface should fail.
- Fix ECDSA signature length calculation.
- Fix memory leak of tokens.
- Fix suspicious sizeof usage in _str_padded_copy
- Fix encoding errors when importing a certificate into the pkcs11 store.
- Fix try/finally scope issues in tpm2\_ptool.
- Fix, an OOB access in db upgrade path.
- Fix ECDSA length calculation that was causing issues with Mutual TLS in F=
irefox and Chrome.

### Changed
- remove unused macro set_safe_rc

### Added
- Add support for OpenSSL 3. Note that calls through engine are no longer s=
upported on OpenSSL3.
- Add tpm2_ptool export commandlet for exporting token keys into PEM and TP=
M blob format.

Can be found here:
  - https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.8.0-rc0

Thanks,
Bill

--===============3855884061546786254==--

