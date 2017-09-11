Content-Type: multipart/mixed; boundary="===============8661244857214741016=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] d50cf8: test: add a tpm2_readlock test case
 to tpm2_nv.sh
Date: Mon, 11 Sep 2017 10:43:04 -0700
Message-ID: <59b6cb28a1d3c_1f583fb586069c3c729af@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8661244857214741016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: d50cf81a9db7fb3898a21dfc592d6d5f2d529567
      https://github.com/01org/tpm2-tools/commit/d50cf81a9db7fb3898a21dfc59=
2d6d5f2d529567
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-11 (Mon, 11 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_nv.sh

  Log Message:
  -----------
  test: add a tpm2_readlock test case to tpm2_nv.sh

There's no test for tpm2_nvreadlock, add a test case for it to the NV
test. Also print a success message if test finish successfully like's
done in the other tests.

Fixes: #462

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============8661244857214741016==--

