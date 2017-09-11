Content-Type: multipart/mixed; boundary="===============7500042502880449551=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 696cc1: man: update TCTI options man
 according to the new ...
Date: Mon, 11 Sep 2017 10:43:47 -0700
Message-ID: <59b6cb532a5a2_65163f931c757c38621ed@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7500042502880449551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 696cc1bbe384dac33fb673b65e23d53e7cc7e6af
      https://github.com/01org/tpm2-tools/commit/696cc1bbe384dac33fb673b65e=
23d53e7cc7e6af
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-11 (Mon, 11 Sep 2017)

  Changed paths:
    M man/tcti-options.troff

  Log Message:
  -----------
  man: update TCTI options man according to the new options handling

Commit 1cb24d62d6b ("option fixing: move to single getopt") reworked how
the options are handled by the tools, but it also changed how the TCTI
specific options are passed to the TCTI initialization code.

The man pages were not updated and still list the old way to specify the
TCTI specific options, users reading the man page will face this issue:

$ tpm2_pcrlist -L sha1:7 -T device -d /dev/tpm0
tpm2_pcrlist: invalid option -- 'd'
ERROR: Unknown Argument: d

Update man pages so users know that they instead need to do following:

$ tpm2_pcrlist -L sha1:7 -T device:/dev/tpm0

Bank/Algorithm: sha(0x0004)
PCR_07:6d7206871c9c6f38ad3997baceebee95dadec04d

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============7500042502880449551==--

