Content-Type: multipart/mixed; boundary="===============6629654024997034747=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] de6cdf: test: query the list of supported
 hash algorithms ...
Date: Tue, 17 Oct 2017 10:19:18 -0700
Message-ID: <59e63b9625a07_343d3fc767ad3c3410772d@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6629654024997034747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: de6cdf777f87e1522ba29d90cd52812931aea72b
      https://github.com/01org/tpm2-tools/commit/de6cdf777f87e1522ba29d90cd=
52812931aea72b
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-10-17 (Tue, 17 Oct 2017)

  Changed paths:
    A test/system/test_helpers.sh
    M test/system/test_tpm2_create.sh
    M test/system/test_tpm2_createprimary.sh

  Log Message:
  -----------
  test: query the list of supported hash algorithms before calling tpm2_cre=
ate

The unsupported hash algorithms should be ignored before the testing.
It is necessary to implement directly querying the supported algorithms
in form of either hex value of friendly name.

So let's have a common script test_helpers.sh and the tests that need it
can just source it.

This change partially resolves the issue #335 (Make sure that all tests
work on a real TPM hardware) for helping on it regard.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>



--===============6629654024997034747==--

