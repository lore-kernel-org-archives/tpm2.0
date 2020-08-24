Content-Type: multipart/mixed; boundary="===============0735457817643209209=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE] tpm2-pkcs11 1.4.0
Date: Mon, 24 Aug 2020 18:27:46 +0000
Message-ID: <SN6PR11MB343753B22896C10220549A38B8560@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0735457817643209209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce the release of tpm2-pkcs11 version 1.4.0. There ar=
e two highlights for this release
That I would like to point out:

- Support for integrating with the tss2-fapi library via selectable backend=
s. The ESAPI and Sqlite3 database will continue to be the default.
- Support for "linking" existing tpm2 objects into a token. These objects c=
an be raw tpm blobs from tpm2_create, or tss2 engine PEM blobs.

The release has the following CHANGELOG:

### 1.4.0 - 2020-08-24

  * Fix superflous error message when falling back from TPM2\_EncryptDecryp=
t2 interface.

  * Support importing EC keys via tpm2\_ptool import.

  * C\_InitToken: Fix improper SRK handle of 0x81000000, it should be 0x810=
00001.

  * Fix a leak in in tpm.c of an EVP\_PKEY object.

  * C\_GenerateKeyPair: was not adding PSS signatures as supported by RSA o=
bjects, add it.

  * Fix PSS signatures. Non-FIPS mode TPMs produce PSS signatures with a

    max salt len that poses interoperability issues with verifying clients,

    notably TLS in OpenSSL.

  * Fix Java PKCS11 Provider Signature Verification: #401

  * VerifyRecover support, known working with Public Key RSA objects and

    mechanism CKM_RSA_PKCS.

  * db: Modfiy search and create behavior. See

    [docs/INITIALIZING.md](https://github.com/tpm2-software/tpm2-pkcs11/blo=
b/master/docs/INITIALIZING.md)

    for details.

  * Fix printf(3) format specifier errors.

  * ci: increase CI coverage to: Fedora 30, Ubuntu 16.04, Ubuntu 18.04.

  * configure: check for Python version >=3D 3.7 and pass to Automake. No

    need to set PYTHON\_INTERPRETER anymore.

  * Fix segfault/memory corruption bugs in C\_Destroy().

  * Fix segfault when no user pin is provisioned.

  * Support C\_SetAttributeValue.

  * Support for selectable backend using TPM2\_PKCS11\_BACKEND=3Desysdb bei=
ng current version.

  * Support for backend fapi that uses the tss2-fapi keystore instead of an=
 sqlite db.

    - This is auto-detected based on tss2-fapi being installed at configure=
 time, and can be controlled

      via --enable/disable-fapi.

  * C\_CreateObject: Support for CKO\_DATA objects only with CKA\_PRIVATE s=
et to CK\_TRUE. Token

    defaults to CK_TRUE.

  * Fix: src/lib/ssl\_util.c:555:54: error: passing argument 3 of 'EVP\_PKE=
Y\_verify\_recover' from incompatible pointer type

  * Added tpm2\_ptool link commandlet for linking existing tpm2 objects int=
o a compatible token. For details see

    [this](https://github.com/tpm2-software/tpm2-pkcs11/blob/master/docs/IN=
TEROPERABILITY.md) document.

    Supported tpm2 objects are:

      - serialized TPM2B_PUBLIC and TPM2B_PRIVATE data structures, as produ=
ced by

      [tpm2_create](https://github.com/tpm2-software/tpm2-tools/blob/master=
/man/tpm2_create.1.md) -u and -r outputs

      respectively.

      - PEM encoded keys produced by

      [tpm2tss-genkey](https://github.com/tpm2-software/tpm2-tss-engine/blo=
b/master/man/tpm2tss-genkey.1.md)

The release can be found here:
https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.4.0
--===============0735457817643209209==--

