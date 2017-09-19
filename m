Content-Type: multipart/mixed; boundary="===============9115819108551674808=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] cd3a1c: tpm2_create: rename options for
 public and sensiti...
Date: Tue, 19 Sep 2017 07:10:30 -0700
Message-ID: <59c12556c4ee0_765d3fa904b05c38777aa@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9115819108551674808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: cd3a1c72b278bcf4f8fe5cbdf65ab07610bc8372
      https://github.com/01org/tpm2-tools/commit/cd3a1c72b278bcf4f8fe5cbdf6=
5ab07610bc8372
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-19 (Tue, 19 Sep 2017)

  Changed paths:
    M man/tpm2_create.1.md
    M test/system/test_algs.sh
    M test/system/test_algs_tpm2_unseal.sh
    M test/system/test_smoking.sh
    M test/system/test_tpm2_certify.sh
    M test/system/test_tpm2_create_all.sh
    M test/system/test_tpm2_encryptdecrypt.sh
    M test/system/test_tpm2_evictcontrol.sh
    M test/system/test_tpm2_hmac.sh
    M test/system/test_tpm2_load.sh
    M test/system/test_tpm2_loadexternal.sh
    M test/system/test_tpm2_quote.sh
    M test/system/test_tpm2_readpublic.sh
    M test/system/test_tpm2_rsadecrypt.sh
    M test/system/test_tpm2_rsaencrypt.sh
    M test/system/test_tpm2_sign.sh
    M test/system/test_tpm2_unseal.sh
    M test/system/test_tpm2_verifysignature.sh
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: rename options for public and sensitive portions of the obje=
ct

Next release will already not be backward compatible due a lot of changes,
so let's change the tpm2_create options for the file paths to store public
and sensitive portions of the created object to be consistent with how the
other tools use for these options.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============9115819108551674808==--

