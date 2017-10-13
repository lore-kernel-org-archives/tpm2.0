Content-Type: multipart/mixed; boundary="===============4929348398581016172=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 1e1ba9: test: tpm2_createpolicy: explicitly
 define a base ...
Date: Fri, 13 Oct 2017 12:27:54 -0700
Message-ID: <59e113ba69d66_14e83fc0ebac3c4423829@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4929348398581016172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 1e1ba978f7ab87403c0e305862d89dae8688fa61
      https://github.com/01org/tpm2-tools/commit/1e1ba978f7ab87403c0e305862=
d89dae8688fa61
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M test/system/test_tpm2_createpolicy.sh

  Log Message:
  -----------
  test: tpm2_createpolicy: explicitly define a base when comparing hex valu=
es

If the base is omitted in an arithmetic expression bash assumes a base 10,
unless the constant starts with a 0 or 0x. In these cases, base 8 and 16
are used respectively.

So the test was only working because assumes a PCR0 value of 3, which
has the same value in both bases, but this isn't true for all values and
will lead to the following issue:

./test_tpm2_createpolicy.sh: line 57: [[:
9872964b9b40cdd0363fcd6af8c267c9cb34200b: value too great for base
(error token is "9872964b9b40cdd0363fcd6af8c267c9cb34200b")
Failure: Creating Policy Digest with PCR policy for index 0 and sha1
pcr index hash

Fix this by explicitly define a base 16 so bash know that the constant
value is an hexadecimal number.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>



--===============4929348398581016172==--

