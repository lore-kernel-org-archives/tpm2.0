Content-Type: multipart/mixed; boundary="===============4802305709384438148=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 5c87d3: test/system: remove pipe to
 /dev/null for rm -f ca...
Date: Fri, 13 Oct 2017 12:21:33 -0700
Message-ID: <59e1123d4ddb3_a56b3fe445035c281001c5@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4802305709384438148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 5c87d356b6bde7f148aa376dc3d544db29b1d53c
      https://github.com/01org/tpm2-tools/commit/5c87d356b6bde7f148aa376dc3=
d544db29b1d53c
  Author: Alexander Steffen <Alexander.Steffen(a)infineon.com>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M test/system/test_tpm2_activecredential.sh
    M test/system/test_tpm2_akparse.sh
    M test/system/test_tpm2_createpolicy.sh

  Log Message:
  -----------
  test/system: remove pipe to /dev/null for rm -f calls

The -f parameter already suppresses the common but harmless error messages,
e.g. file not found, so this is unnecessary.



--===============4802305709384438148==--

