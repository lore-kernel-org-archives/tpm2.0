Content-Type: multipart/mixed; boundary="===============5628063932828140333=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 3ea878: man: explain in tpm2_evictcontrol
 page how objects...
Date: Thu, 14 Sep 2017 12:34:49 -0700
Message-ID: <59bad9d929e30_2405d3f9c2d217c40500f1@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5628063932828140333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 3ea878cbde11bca5d966a0a345374a513d2b934a
      https://github.com/01org/tpm2-tools/commit/3ea878cbde11bca5d966a0a345=
374a513d2b934a
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-14 (Thu, 14 Sep 2017)

  Changed paths:
    M man/tpm2_evictcontrol.1.md

  Log Message:
  -----------
  man: explain in tpm2_evictcontrol page how objects are evicted

The specification says "If objectHandle is a persistent object, then the
call evicts the persistent object" and "if objectHandle is a persistent
object handle, then it shall be the same value as persistentHandle".

So the tool is doing the correct thing by requiring both the object and
persistent handles to be defined and being the same to evict an object.

But this isn't documented in the tool man page and it may not be evident
to people not familiar with the TCG TPM specification.

While being there, remove a -X option from one of the examples since the
tpm2_evictcontrol tool doesn't have one.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============5628063932828140333==--

