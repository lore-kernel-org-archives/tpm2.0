Content-Type: multipart/mixed; boundary="===============0000922413478050442=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 24556f: tpm2_create: change o and O flags
 to reflect the t...
Date: Fri, 22 Dec 2017 08:20:56 -0800
Message-ID: <5a3d30e85dce5_37e72ad1db993c0c827bd@hookshot-fe-6b2eebc.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0000922413478050442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 24556fda8138de49dfaf197b1017c236b391530d
      https://github.com/intel/tpm2-tools/commit/24556fda8138de49dfaf197b10=
17c236b391530d
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-22 (Fri, 22 Dec 2017)

  Changed paths:
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: change o and O flags to reflect the tool options

Commit cd3a1c72b278 ("tpm2_create: rename options for public and sensitive
portions of the object") renamed the o and O options to u and r so they're
consistent with other tools, but forgot to rename the flags used for these.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============0000922413478050442==--

