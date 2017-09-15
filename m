Content-Type: multipart/mixed; boundary="===============8016362276739365895=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 4c655b: tpm2_load: don't make -n option to
 be required
Date: Fri, 15 Sep 2017 11:18:09 -0700
Message-ID: <59bc1961465c5_4df3fe0c1cc3c38237fc@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8016362276739365895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 4c655b646d6951ec1304a5cba33c09d9153306f6
      https://github.com/01org/tpm2-tools/commit/4c655b646d6951ec1304a5cba3=
3c09d9153306f6
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-15 (Fri, 15 Sep 2017)

  Changed paths:
    M man/tpm2_load.1.md
    M tools/tpm2_load.c

  Log Message:
  -----------
  tpm2_load: don't make -n option to be required

The tool requires the option for a file path to store the structure name
of the object, but this shouldn't really be a required option. In fact,
the whole option checking seems bogus so just check for the options that
should be required and not the ones that should be optional.

While being there, make this clear in the man page as well.

Fixes: #494

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============8016362276739365895==--

