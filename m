Content-Type: multipart/mixed; boundary="===============1269956892341028842=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 6b4f25: log: fix verbose option
Date: Wed, 15 Nov 2017 11:26:35 -0800
Message-ID: <5a0c94eb45e09_ebf3fbe55607c3481372@hookshot-fe-92cdb05.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1269956892341028842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 6b4f25725709b5b0659c9f08c895843268d70ae0
      https://github.com/intel/tpm2-tools/commit/6b4f25725709b5b0659c9f08c8=
95843268d70ae0
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



--===============1269956892341028842==--

