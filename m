Content-Type: multipart/mixed; boundary="===============3160735889803107702=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.org>
Subject: [tpm2] [RELEASE] tpm2-abrmd 2.4.1
Date: Sat, 05 Mar 2022 18:43:47 -0800
Message-ID: <f2f8d791-c27c-88c8-33b1-b815ecdbc853@twobit.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3160735889803107702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Version 2.4.1 has been tagged and a release posted to github:

https://github.com/tpm2-software/tpm2-abrmd/releases/tag/2.4.1

This is a bugfix release. The CHANGELOG entry is:
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
--===============3160735889803107702==--

