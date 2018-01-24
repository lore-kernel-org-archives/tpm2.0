Content-Type: multipart/mixed; boundary="===============5315624853463295308=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] f848a8: tpm2_errata: mute the noises when
 more data is ava...
Date: Wed, 24 Jan 2018 13:48:23 -0800
Message-ID: <5a68ff2713d6_1f42b2aee57f5dc0867499@hookshot-fe-dfcc362.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5315624853463295308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: f848a808515f52ff005b13568c674c9ff033dc04
      https://github.com/intel/tpm2-tools/commit/f848a808515f52ff005b13568c=
674c9ff033dc04
  Author: Jia Zhang <zhang.jia(a)linux.alibaba.com>
  Date:   2018-01-24 (Wed, 24 Jan 2018)

  Changed paths:
    M lib/tpm2_errata.c

  Log Message:
  -----------
  tpm2_errata: mute the noises when more data is available

Infineon SLB9665 (PT_REV 1.16) is affected by the errata
"Sign/decrypt attribute encoding" and the related test case thus
needs -Z option.

However, the test cases print lots of noises about more-data-available
because this tpm chip always responds more data available when the
requesting property is PT_FIXED. Digging into the internal, PT_VAR is
implied as the potentially available data.

More worse, launching test.sh -Z causes each test case generating the
noises.

The errata logic only requires the first few fields from PT_FIXED so
the check for more_data can be ignored in order to mute the noises
when the errata is applied.

Signed-off-by: Jia Zhang <zhang.jia(a)linux.alibaba.com>



--===============5315624853463295308==--

