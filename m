Content-Type: multipart/mixed; boundary="===============7869045799037348607=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] f0d192: nv: don't exceed max nv buffer size
 for TSS
Date: Mon, 18 Dec 2017 08:36:19 -0800
Message-ID: <5a37ee83d212e_711d2b2347419c14325c7@hookshot-fe-7191cb1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7869045799037348607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: f0d1920910166c093d08172f31501767f8b04328
      https://github.com/intel/tpm2-tools/commit/f0d1920910166c093d08172f31=
501767f8b04328
  Author: Jerry Snitselaar <jsnitsel(a)redhat.com>
  Date:   2017-12-18 (Mon, 18 Dec 2017)

  Changed paths:
    M tools/tpm2_nvread.c
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  nv: don't exceed max nv buffer size for TSS

Currently if a tpm device supports a max nv buffer size greater than
tss supports we can get buffer overflows. Check the size returned by
the tpm device, and use the min of that and the max supported by tss.

Signed-off-by: Jerry Snitselaar <jsnitsel(a)redhat.com>



--===============7869045799037348607==--

