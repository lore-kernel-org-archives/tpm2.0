Content-Type: multipart/mixed; boundary="===============1631819306757966568=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-pkcs11 1.7.0-rc0
Date: Fri, 03 Sep 2021 15:02:27 +0000
Message-ID: <SN6PR11MB3437765E70B35A0E666D2B82B8CF9@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1631819306757966568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce the release of tpm2-pkcs11 1.7.0-rc0 at the follow=
ing changelog:

### 1.7.0-rc0 - 2021-09-02
  * DB Schema Change from 5 to 7.
    - **Backup your DB before upgrading**
  * Fixed compilation issues with GCC11.
  * Fixed erros on releases due to newer compilers from failing by only add=
ing `-Werror` for non-release builds.
  * Fixed error message when the DB is too new in tpm2\_ptool.
  * Added support for tpm2\_ptool import with ssh-keygen format keys. Note:=
 Requires cryptography >=3D 3.0.
  * Changed default long level from error to warning.
  * Added better error message for FAPI backend errors along with [docs/FAP=
I.md](docs/FAPI.md) document.
  * Changed `tpm2_ptool` make `--algorithm` optional.
  * Fixed error message of wrong attribute name on expected attribute check=
 to be false.
  * Added support for ECDSA 256, 384 and 512.
  * Fixed a bug in the Python code DB upgrade path from 4 to 5 where it did=
n't add AES mode CTR to
    CKA\_ALLOWED\_MECHANISMS.
  * Added tpm2\_ptool support for ECC key size 192.
  * Added support passwordless login for tokens, ie not setting CKF\_LOGIN\=
_REQUIRED.
  * Fixed Running integration tests when Java version has the `-ea`, like o=
n Debian 11 and OpenJDK 17.
  * Added support for HMAC keys using tpm2\_ptool and the C\_Sign and C\_Ve=
rify interfaces.
    The following interfaces in ptool have support:
      - addkey: previous working versions of tpm2-tools will support this.
      - link: previous working versions of tpm2-tools will support this.
      - import: requires tpm2-tools 5.2+ for support.
  * Fixed leaking of temp file descriptors in tpm2\_ptool.
  * Fixed wrong free in tpm code, should use Esys\_Free.
  * Fixed a space formatting issue in tpm2\_ptool verify.
  * Fixed leaked file descriptor in tpm2\_ptool.

The release can be found at:
  - https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.7.0-rc0

Thanks,
Bill
--===============1631819306757966568==--

