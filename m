Content-Type: multipart/mixed; boundary="===============7247598452436579060=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 9f3893: log: fix verbose option
Date: Wed, 15 Nov 2017 11:27:16 -0800
Message-ID: <5a0c95146c9fb_78363fbdccea5c44126443@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7247598452436579060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 9f389320ae2fd5b4551003333d14de39c8ecf776
      https://github.com/intel/tpm2-tools/commit/9f389320ae2fd5b4551003333d=
14de39c8ecf776
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M tools/tpm2_tool.c

  Log Message:
  -----------
  log: fix verbose option

log_set_level() was never being called when verbose
was enabled. So set it when verbose is enabled.

This fixes LOG_INFO not showing up.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============7247598452436579060==--

