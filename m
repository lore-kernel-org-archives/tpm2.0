Content-Type: multipart/mixed; boundary="===============1417497165098752626=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 7a567a: Limit selected PCRs to 8
Date: Wed, 31 Jan 2018 08:46:36 -0800
Message-ID: <5a71f2ec366c2_4ed02ada5a743c1817240@hookshot-fe-7191cb1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1417497165098752626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 7a567a358f7f1f47a5e41b78a1d440b725750f8e
      https://github.com/tpm2-software/tpm2-tools/commit/7a567a358f7f1f47a5=
e41b78a1d440b725750f8e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-31 (Wed, 31 Jan 2018)

  Changed paths:
    M lib/tpm2_policy.c

  Log Message:
  -----------
  Limit selected PCRs to 8

When a PCR selection has more than 8 selections, the pcrSelections
array was being indexed past its end.

Fixes: #778

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============1417497165098752626==--

