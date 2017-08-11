Content-Type: multipart/mixed; boundary="===============7702013768163681370=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] dbb44b: test: tpm2_evictcontrol clean up
Date: Fri, 11 Aug 2017 08:57:37 -0700
Message-ID: <598dd3f143b9f_22c53fb9acd4bc3c43071@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7702013768163681370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: dbb44b5325025b657d57a1b29e21b09b9249772c
      https://github.com/01org/tpm2-tools/commit/dbb44b5325025b657d57a1b29e=
21b09b9249772c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-11 (Fri, 11 Aug 2017)

  Changed paths:
    M test/system/test_tpm2_evictcontrol.sh
    M test/system/test_tpm2_loadexternal.sh

  Log Message:
  -----------
  test: tpm2_evictcontrol clean up

Clean up the tpm2_evictcontrol test so:
1. Files get cleaned up on exit
2. The script is easier to read
3. Clean out whitespace errors
4. Enhance error reporting

New failures have command executed, line number
and return code all printed.

Example:
$ ./test_tpm2_loadexternal.sh
Argument mismatched!
Please type "tpm2_takeownership -h" get the usage!
tpm2_takeownership -x on line 62 failed: 1

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============7702013768163681370==--

