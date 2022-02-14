Content-Type: multipart/mixed; boundary="===============3066044964554089974=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] [RELEASE CANDIDATES] tpm2-tss 3.2.0-rc1 3.1.1-rc1 3.0.5-rc1
Date: Mon, 14 Feb 2022 17:43:56 +0000
Message-ID: <AS8P194MB166931EA53EFD50E4F24D01BA6339@AS8P194MB1669.EURP194.PROD.OUTLOOK.COM>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3066044964554089974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

I wanted to announce that I've just tagged versions 3.2.0-rc1 3.1.1-rc1 and=
 3.0.5-rc1 of the tpm2-tss project.

You can find the tags in git and here: https://github.com/tpm2-software/tpm=
2-tss/tags

For your convenience, here are the changelog-changes for this rc:
## [3.2.0-rc1] - 2022-02-14
### Fixed
- Fix buffer upcast leading to misalignment
- Fix check whether SM3 is available
- Update git.mk to support R/O src-dir

### Added
- Add additional IFX root CAs

Since we had only few feedback on -rc0 I want to release final in the next =
few days.

Cheers,
Andreas
--===============3066044964554089974==--

