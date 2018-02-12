Content-Type: multipart/mixed; boundary="===============6072155408747936097=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 9daf00: tpm2_createprimary:
 refactor onrun() and cleanup
Date: Mon, 12 Feb 2018 10:38:42 -0800
Message-ID: <5a81df32a827f_60ec2af1daf6dc08629dd@hookshot-fe-2cc8887.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6072155408747936097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 9daf005b0fea684b18168bf9c6fb7e52e8af07cd
      https://github.com/tpm2-software/tpm2-tools/commit/9daf005b0fea684b18=
168bf9c6fb7e52e8af07cd
  Author: Kristen Carlson Accardi <kristen(a)linux.intel.com>
  Date:   2018-02-12 (Mon, 12 Feb 2018)

  Changed paths:
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: refactor onrun() and cleanup

Cleanup onrun() a little bit to make it easier to read, and refactor
the code to eliminate the .C flag. Use the .H flag instead of the .A
flag to be more consistent with the options.

Signed-off-by: Kristen Carlson Accardi <kristen(a)linux.intel.com>


  Commit: 1c74ad7f96222a6aa04a15bb2ee989baee736bc2
      https://github.com/tpm2-software/tpm2-tools/commit/1c74ad7f96222a6aa0=
4a15bb2ee989baee736bc2
  Author: Kristen Carlson Accardi <kristen(a)linux.intel.com>
  Date:   2018-02-12 (Mon, 12 Feb 2018)

  Changed paths:
    M tools/tpm2_tool.c

  Log Message:
  -----------
  tpm2_tool: log an error when tool onrun() fails.

If onrun() returns failure, log an error.

Signed-off-by: Kristen Carlson Accardi <kristen(a)linux.intel.com>


Compare: https://github.com/tpm2-software/tpm2-tools/compare/0a14be277c05..=
.1c74ad7f9622

--===============6072155408747936097==--

