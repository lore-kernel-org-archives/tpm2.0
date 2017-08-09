Content-Type: multipart/mixed; boundary="===============5864013280095668056=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 989108: test: tpm2_alg_util clean up
Date: Wed, 09 Aug 2017 08:43:18 -0700
Message-ID: <598b2d96da144_4a6a3fb47ddc7c30434af@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5864013280095668056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 98910869f776bf0b121a26242e02dd1f57bce0d1
      https://github.com/01org/tpm2-tools/commit/98910869f776bf0b121a26242e=
02dd1f57bce0d1
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-09 (Wed, 09 Aug 2017)

  Changed paths:
    M test/unit/test_tpm2_alg_util.c

  Log Message:
  -----------
  test: tpm2_alg_util clean up

Now that PR: https://github.com/01org/tpm2-tss/pull/494
is merged, fix up the tests to stop having to convert
the expanded macro values to a hex string via snprintf.

Now the macros can be stringified and used directly.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============5864013280095668056==--

