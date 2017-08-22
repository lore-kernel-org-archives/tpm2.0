Content-Type: multipart/mixed; boundary="===============0802761330606753352=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 434370: travis: remove tpm2-abrmd patch
 that has already b...
Date: Tue, 22 Aug 2017 12:04:16 -0700
Message-ID: <599c8030b6d8e_35f63f8350a1dc28936ec@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0802761330606753352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 4343708e5a24a315fb16b01281ebf4fa8524c46c
      https://github.com/01org/tpm2-tools/commit/4343708e5a24a315fb16b01281=
ebf4fa8524c46c
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-22 (Tue, 22 Aug 2017)

  Changed paths:
    R .ci/patches/abrmd/0001-Fix-buffer-may-be-used-uninitialized.patch

  Log Message:
  -----------
  travis: remove tpm2-abrmd patch that has already been merged

The tpm2-tools repository has a local hack to allow travis to apply a set
of patches that are needed for tpm2-abrmd to be build with tpm2-tss master
branch. But one of those patches have already been merged in tpm2-abrmd so
trying to apply it fails, which makes the other patches to not be applied.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============0802761330606753352==--

