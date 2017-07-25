Content-Type: multipart/mixed; boundary="===============7340844321778310997=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2.0-tools] 1ae94f: tpm2_create: check if keyed-hash
 algorithm was use...
Date: Tue, 25 Jul 2017 16:48:24 -0700
Message-ID: <5977d8c859d83_2055a3fd400983c303581b@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7340844321778310997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2.0-tools
  Commit: 1ae94ffaaccf28ec4622eeaa2da64ba538e35a4a
      https://github.com/01org/tpm2.0-tools/commit/1ae94ffaaccf28ec4622eeaa=
2da64ba538e35a4a
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M man/tpm2_create.8.in
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: check if keyed-hash algorithm was used when sealing data

The TCG specification is clear that only the TPM_ALG_KEYEDHASH algorithm
can be used when the user provides part of the the sensitive data.

The tpm2_create tool behaves according to the specification, but it may
not be clear to the users why it fails, unless are already familiar with
the specs. Make the tool gracefully fail and also add a note to man page.

Fixes: #369

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============7340844321778310997==--

