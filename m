Content-Type: multipart/mixed; boundary="===============9135391835795891121=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.org>
Subject: [tpm2] [RC] tpm2-abrmd 2.4.1-rc0
Date: Mon, 14 Feb 2022 20:54:17 -0800
Message-ID: <1d455cd7-5798-13ba-2128-697181d152ea@twobit.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9135391835795891121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

I've just tagged the first release candidate for tpm2-abrmd version 2.4.1:

https://github.com/tpm2-software/tpm2-abrmd/releases/tag/2.4.1-rc0

This is a bugfix release. CHANGELOG.md is currently as follows:

### Added
   - Contributor Covenant Code of Conduct.

### Fixed
   - superflous warning messages about tcti status.
     - `WARNING **: 11:00:56.205: tcti_conf before: "(null)"`
     - `WARNING **: 11:00:56.205: tcti_conf after: "mssim"`
   - GCC 11 build error: error: argument 2 of `__atomic_load=E2=80=99 disca=
rds =

=E2=80=98volatile=E2=80=99 qualifier`
   - Initialize gerror pointer variable to NULL to fix use of =

unitialized memory and segfault.
   - Updated missing defaults in manpage.
   - Port CI to composite actions in tpm2-software/ci.

### Removed
   - Dependency on 'which' utility in configure.ac.
   - ubuntu-16.04 from CI.

Best,
Philip
--===============9135391835795891121==--

