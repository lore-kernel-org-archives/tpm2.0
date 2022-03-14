Content-Type: multipart/mixed; boundary="===============1929555188079036837=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-pytss 1.1.0-rc0
Date: Mon, 14 Mar 2022 18:11:32 +0000
Message-ID: <SN6PR11MB3437B000343FD4944FDDA4DAB80F9@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1929555188079036837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce the release of tpm2-pytss version 1.1.0-rc0 which =
can be found on pypi at:
  - https://pypi.org/project/tpm2-pytss/1.1.0rc0/

With the following CHANGELOG:
## 1.1.0-rc0 - 2022-03-14
### Fixed
- Spelling of "Enhanced" in CHANGELOG for 1.0.0 release.
- Ensure that TPM2_GENERATED.VALUE is encoded the same way as other constan=
ts.
- Add support to unmarshal simple TPM2B types (such as TPM2B_ATTEST and TPM=
2B_NAME) directly using the =

  unmarshal method

### Changed
- Drop pkgconfig from runtime dependencies, thus no longer need dev package=
s of built bindings at runtime.
  - NOTE: Version information is cached, a change in the TSS libraries requ=
ires a rebuild of the bindings.

### Added
- Support session contexts from tpm2-tools as well as function to marshal c=
ontext to tpm2-tools format.
- Support two new encoding/decoding classes to go to/from hex or json repre=
sentation of objects.
- Support for creating EK from templates and optionally NV index based temp=
lates.
- Binding to `Esys_TR_GetTpmHandle` as `ESAPI` method `tr_get_tpm_handle`.

Thanks,
Bill

--===============1929555188079036837==--

