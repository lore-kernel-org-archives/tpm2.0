Content-Type: multipart/mixed; boundary="===============8613827457081692256=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 955c16: nv: don't exceed max nv buffer size
 for TSS
Date: Mon, 18 Dec 2017 08:36:49 -0800
Message-ID: <5a37eea1eef4_773d2ac845a19c0c3332e@hookshot-fe-7191cb1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8613827457081692256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 955c1689c1efc7604e311943db478d3cd85b3e64
      https://github.com/intel/tpm2-tools/commit/955c1689c1efc7604e311943db=
478d3cd85b3e64
  Author: Jerry Snitselaar <jsnitsel(a)redhat.com>
  Date:   2017-12-18 (Mon, 18 Dec 2017)

  Changed paths:
    M tools/tpm2_nvread.c
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  nv: don't exceed max nv buffer size for TSS

Currently if a tpm device supports a max nv buffer size
greater than tss supports we can get buffer overflows. Check
the size returned by the tpm device, and use the min of
that and the max supported by tss.

Signed-off-by: Jerry Snitselaar <jsnitsel(a)redhat.com>



--===============8613827457081692256==--

