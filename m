Content-Type: multipart/mixed; boundary="===============2266964427844423233=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE] tpm2-pkcs11 version 1.7.0
Date: Mon, 27 Sep 2021 19:45:49 +0000
Message-ID: <SN6PR11MB34371331F2542B55EC1ADFA4B8A79@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2266964427844423233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce tpm2-pkcs11 version 1.7.0 with the following chang=
elog:

1.7.0 - 2021-09-27
=C2=A0 * DB Schema Change from 5 to 7.
=C2=A0 =C2=A0 - **Backup your DB before upgrading**
=C2=A0 * Fixed compilation issues with GCC11.
=C2=A0 * Fixed errors on releases due to newer compilers from failing by on=
ly adding `-Werror` for non-release builds.
=C2=A0 * Fixed error message when the DB is too new in tpm2\_ptool.
=C2=A0 * Added support for tpm2\_ptool import with ssh-keygen format keys. =
Note: Requires cryptography >=3D 3.0.
=C2=A0 * Changed default long level from error to warning.
=C2=A0 * Added better error message for FAPI backend errors along with [doc=
s/FAPI.md](docs/FAPI.md) document.
=C2=A0 * Changed `tpm2_ptool` make `--algorithm` optional.
=C2=A0 * Fixed error message of wrong attribute name on expected attribute =
check to be false.
=C2=A0 * Added support for ECDSA 256, 384 and 512.
=C2=A0 * Fixed a bug in the Python code DB upgrade path from 4 to 5 where i=
t didn't add AES mode CTR to
=C2=A0 =C2=A0 CKA\_ALLOWED\_MECHANISMS.
=C2=A0 * Added tpm2\_ptool support for ECC key size 192.
=C2=A0 * Added support passwordless login for tokens, ie not setting CKF\_L=
OGIN\_REQUIRED.
=C2=A0 * Fixed Running integration tests when Java version has the `-ea`, l=
ike on Debian 11 and OpenJDK 17.
=C2=A0 * Added support for HMAC keys using tpm2\_ptool and the C\_Sign and =
C\_Verify interfaces.
=C2=A0 =C2=A0 The following interfaces in ptool have support:
=C2=A0 =C2=A0 =C2=A0 - addkey: previous working versions of tpm2-tools will=
 support this.
=C2=A0 =C2=A0 =C2=A0 - link: previous working versions of tpm2-tools will s=
upport this.
=C2=A0 =C2=A0 =C2=A0 - import: requires tpm2-tools 5.2+ for support.
=C2=A0 * Fixed leaking of temp file descriptors in tpm2\_ptool.
=C2=A0 * Fixed wrong free in tpm code, should use Esys\_Free.
=C2=A0 * Fixed a space formatting issue in tpm2\_ptool verify.
=C2=A0 * Fixed leaked file descriptor in tpm2\_ptool.
=C2=A0 * Fixed a few suspicious sizeof usages in str\_padded\_copy
=C2=A0 * Fixed a memory leak of the token list on a failure condition in in=
itialization.

The release can be found here:
=C2=A0 -=C2=A0https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.7=
.0

Thanks,
Bill


--===============2266964427844423233==--

