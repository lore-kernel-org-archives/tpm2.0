Content-Type: multipart/mixed; boundary="===============2504627719601852387=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 4ee790: lib: clean up potential memory leak
Date: Thu, 19 Oct 2017 09:09:21 -0700
Message-ID: <59e8ce313e341_eff3facf04c1c38325b8@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2504627719601852387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/2.X
  Home:   https://github.com/01org/tpm2-tools
  Commit: 4ee79001a2e7b51d29781cb313bbb55b70d7edbc
      https://github.com/01org/tpm2-tools/commit/4ee79001a2e7b51d29781cb313=
bbb55b70d7edbc
  Author: Jerry Snitselaar <jsnitsel(a)redhat.com>
  Date:   2017-10-19 (Thu, 19 Oct 2017)

  Changed paths:
    M lib/context-util.c

  Log Message:
  -----------
  lib: clean up potential memory leak

In case where sapi_ctx_init fails in sapi_init_from_options, free tcti_ctx.

Signed-off-by: Jerry Snitselaar <jsnitsel(a)redhat.com>



--===============2504627719601852387==--

