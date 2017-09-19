Content-Type: multipart/mixed; boundary="===============8620189054428758698=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] ceba3d: tpm2_listpersistent: check that -g
 and -G correct ...
Date: Tue, 19 Sep 2017 07:09:12 -0700
Message-ID: <59c125086f6a4_60dd3fa73de1fc3487028@hookshot-fe-92cdb05.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8620189054428758698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: ceba3d9271549263db1d1882e73a8a99cee5b420
      https://github.com/01org/tpm2-tools/commit/ceba3d9271549263db1d1882e7=
3a8a99cee5b420
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-19 (Tue, 19 Sep 2017)

  Changed paths:
    M tools/tpm2_listpersistent.c

  Log Message:
  -----------
  tpm2_listpersistent: check that -g and -G correct values were provided

The tool is using the tpm2_alg_util_from_optarg() function to convert from
the pretty names provided by the user to the hexadecimal algorithm values.

But the same function is used to convert both key and hash algorithms and
so using a key as a hash and viceversa was wrongly taken as correct value.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============8620189054428758698==--

