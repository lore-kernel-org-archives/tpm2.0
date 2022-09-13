Content-Type: multipart/mixed; boundary="===============6575283766281161952=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] [Release] tpm2-tools v5.3-rc1
Date: Tue, 13 Sep 2022 21:25:12 +0000
Message-ID: <20220913212512.1877.56084@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6575283766281161952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

Pleased to announce release for tpm2-tools version 5.3-rc1.

Thank you to all the contributors. You can find the release here: https://g=
ithub.com/tpm2-software/tpm2-tools/releases/tag/5.3-rc1

Note:
1. This is a pre-release - your feedback is much appreciated.
2. Please reference the change log for full list of changes at https://gith=
ub.com/tpm2-software/tpm2-tools/blob/master/docs/CHANGELOG.md =


Fixes in this release candidate:
1. tools/tpm2_pcrreset.c: fix build errors in 32bit systems.
2. Fix tssprivkey formatted PEM generation and load errors on 32 bit system=
s.
3. CI: Add testing of 32bit systems with multiarch/qemu-user-static contain=
ers.
4. Known issue: FAPI tools will not work on 32bit user-static qemu on 64bit=
 host because readdir returns NULL. Follow the issue on https://gitlab.com/=
qemu-project/qemu/-/issues/263

Thanks, and regards,

Imran Desai
--===============6575283766281161952==--

