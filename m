Content-Type: multipart/mixed; boundary="===============2154449711431499307=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 368770: tpm2_evictcontrol: make tool
 smarter to not requir...
Date: Fri, 15 Sep 2017 07:53:03 -0700
Message-ID: <59bbe94f2620f_61e63f93e9da3c2c32655@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2154449711431499307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 368770a0df10c6a95f2d7681d2ffe74d6a2c6250
      https://github.com/01org/tpm2-tools/commit/368770a0df10c6a95f2d7681d2=
ffe74d6a2c6250
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-15 (Fri, 15 Sep 2017)

  Changed paths:
    M man/tpm2_evictcontrol.1.md
    M tools/tpm2_evictcontrol.c

  Log Message:
  -----------
  tpm2_evictcontrol: make tool smarter to not require -S to evict objects

The TCG TPM specification requires the same handle to be provided for both
objectHandle and persistentHandle but this implementation detail leaked in
the tool and so users need to provide both a -S and -H options to evict an
object.

But the tool can be smarter, the handles are not just opaque values but
they encode information. The first byte is the TPM_HT (Handle Type) and
for persistent objects handles this is TPM_HT_PERSISTENT (0x81).

Fixes: #492

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============2154449711431499307==--

