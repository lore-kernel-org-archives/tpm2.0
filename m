Content-Type: multipart/mixed; boundary="===============0632916916787774723=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] b15e8e: port tpm2_unseal to new option
 handling
Date: Tue, 05 Sep 2017 14:17:20 -0700
Message-ID: <59af14606f5b_f083fc19bc9dc30171796@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0632916916787774723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/tpm2-option-revamp
  Home:   https://github.com/01org/tpm2-tools
  Commit: b15e8e4032c7add522a04c17badf3aef66b84c6c
      https://github.com/01org/tpm2-tools/commit/b15e8e4032c7add522a04c17ba=
df3aef66b84c6c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  port tpm2_unseal to new option handling

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7685373287786e19405687d351b03456993741ae
      https://github.com/01org/tpm2-tools/commit/7685373287786e19405687d351=
b03456993741ae
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_takeownership.c

  Log Message:
  -----------
  tpm2_takeownership: port to new opts

Test:
$ ./test_tpm2_takeownership_all.sh
$ echo $?
0

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/b31f1d502968...7685373=
28778

--===============0632916916787774723==--

