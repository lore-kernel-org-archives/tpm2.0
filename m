Content-Type: multipart/mixed; boundary="===============6784203757912473855=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 561a97: tpm2_getmanufec: don't attempt to
 free a pointer t...
Date: Tue, 19 Dec 2017 08:25:16 -0800
Message-ID: <5a393d6cc8e60_256c2ac45b9a9c102059f@hookshot-fe-88eb02d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6784203757912473855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 561a9778808a1fcbcd4aceb87791b5b51b03a7c9
      https://github.com/intel/tpm2-tools/commit/561a9778808a1fcbcd4aceb877=
91b5b51b03a7c9
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-19 (Tue, 19 Dec 2017)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: don't attempt to free a pointer that is already NULL

Commit cc51f9fe188a ("tpm2_getmanufec: fix a memory leak") fixed a memory
leak in TPMinitialProvisioning(), but after this change a pointer that is
already NULL is attempted to be freed.

This doesn't matter since free(3) is a no-op if a pointer is already NULL
but still it's a good practice to free the resources in the inverse order
than were allocated and also makes no sense to attempt to free a NULL ptr.

Reported-by: Jerry Snitselaar <jsnitsel(a)redhat.com>
Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============6784203757912473855==--

