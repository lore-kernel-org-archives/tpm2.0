Content-Type: multipart/mixed; boundary="===============4263447286264113730=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 9603e0: rename tpm2.0-tools to tpm2-tools
Date: Thu, 03 Aug 2017 14:06:31 -0700
Message-ID: <59839057cec33_89c3fa252e65c3897773@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4263447286264113730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 9603e05ffd99de19a75cbd5f662cf5510b086a3a
      https://github.com/01org/tpm2-tools/commit/9603e05ffd99de19a75cbd5f66=
2cf5510b086a3a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-03 (Thu, 03 Aug 2017)

  Changed paths:
    M .ci/travis-build-and-run-tests.sh
    M .travis.yml
    M AUTHORS
    M CHANGELOG
    M CONTRIBUTING
    M INSTALL
    M README.md
    M RELEASE
    M configure.ac
    M lib/tpm2_alg_util.h
    M man/tpm2_activatecredential.8.in
    M man/tpm2_akparse.8.in
    M man/tpm2_certify.8.in
    M man/tpm2_create.8.in
    M man/tpm2_createpolicy.8.in
    M man/tpm2_createprimary.8.in
    M man/tpm2_dictionarylockout.8.in
    M man/tpm2_dump_capability.8.in
    M man/tpm2_encryptdecrypt.8.in
    M man/tpm2_evictcontrol.8.in
    M man/tpm2_getmanufec.8.in
    M man/tpm2_getpubak.8.in
    M man/tpm2_getpubek.8.in
    M man/tpm2_getrandom.8.in
    M man/tpm2_hash.8.in
    M man/tpm2_hmac.8.in
    M man/tpm2_listpersistent.8.in
    M man/tpm2_load.8.in
    M man/tpm2_loadexternal.8.in
    M man/tpm2_makecredential.8.in
    M man/tpm2_nvdefine.8.in
    M man/tpm2_nvlist.8.in
    M man/tpm2_nvread.8.in
    M man/tpm2_nvreadlock.8.in
    M man/tpm2_nvrelease.8.in
    M man/tpm2_nvwrite.8.in
    M man/tpm2_pcrlist.8.in
    M man/tpm2_quote.8.in
    M man/tpm2_rc_decode.8.in
    M man/tpm2_readpublic.8.in
    M man/tpm2_rsadecrypt.8.in
    M man/tpm2_rsaencrypt.8.in
    M man/tpm2_send_command.8.in
    M man/tpm2_sign.8.in
    M man/tpm2_startup.8.in
    M man/tpm2_takeownership.8.in
    M man/tpm2_unseal.8.in
    M man/tpm2_verifysignature.8.in
    M manual
    M misc/formatters/tpm2.0-eclipse-cdt-formatter.xml

  Log Message:
  -----------
  rename tpm2.0-tools to tpm2-tools

tpm2.0-tools was renamed to tpm2-tools to get rid of:
1. Periods in names
2. Confusion with a version of the software and not the tpm
3. Consistent naming conventions with tpm2-abrmd and tpm2-TSS.
4. Matches the package name in RPM.

Rename all occurances and ensure that travis links work.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============4263447286264113730==--

