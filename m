Content-Type: multipart/mixed; boundary="===============8894221411767494223=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 4b9ef1: tpm2_clearlock: add tool
Date: Fri, 22 Dec 2017 09:17:06 -0800
Message-ID: <5a3d3e1299fda_40122af9f3a67c1049232@hookshot-fe-8867ff3.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8894221411767494223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 4b9ef1d843128fb34b6e4ccfe16dea7303230672
      https://github.com/intel/tpm2-tools/commit/4b9ef1d843128fb34b6e4ccfe1=
6dea7303230672
  Author: Emmanuel <logout(a)free.fr>
  Date:   2017-12-22 (Fri, 22 Dec 2017)

  Changed paths:
    M Makefile.am
    A man/tpm2_clearlock.1.md
    A test/system/tests/clearlock.sh
    A tools/tpm2_clearlock.c

  Log Message:
  -----------
  tpm2_clearlock: add tool

The tpm2_clearlock tools is used to authorize/forbid the use of
tpm2_clear. It used TPM2_ClearControl() to set or clear disableClear
(when disableClear is set it's not possible to call TPM2_Clear()).

One can check for the status of disableClear using the tpm2_getcap tool.

The clearlock.sh test check for the behavior of this newly added tool.

Fixes: #710

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>



--===============8894221411767494223==--

