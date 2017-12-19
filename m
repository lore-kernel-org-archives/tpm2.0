Content-Type: multipart/mixed; boundary="===============6806702599913825394=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 81a47c: command line: change option names
 from output to o...
Date: Tue, 19 Dec 2017 08:02:22 -0800
Message-ID: <5a39380e90f11_566c2afbca233c00796d@hookshot-fe-2cc8887.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6806702599913825394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 81a47c9762d8cec7f1cdd514b1d21fb8e75fde0e
      https://github.com/intel/tpm2-tools/commit/81a47c9762d8cec7f1cdd514b1=
d21fb8e75fde0e
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-19 (Tue, 19 Dec 2017)

  Changed paths:
    M man/tpm2_getmanufec.1.md
    M man/tpm2_getrandom.1.md
    M man/tpm2_hash.1.md
    M man/tpm2_hmac.1.md
    M man/tpm2_nvread.1.md
    M man/tpm2_pcrlist.1.md
    M man/tpm2_readpublic.1.md
    M man/tpm2_unseal.1.md
    M test/system/tests/disabled/import.sh
    M tools/tpm2_getmanufec.c
    M tools/tpm2_getrandom.c
    M tools/tpm2_hash.c
    M tools/tpm2_hmac.c
    M tools/tpm2_nvread.c
    M tools/tpm2_pcrlist.c
    M tools/tpm2_readpublic.c
    M tools/tpm2_send.c
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  command line: change option names from output to out-file

When comparing command line switches that are specified to select an
output file, most of the tools use option 'out-file' and only a few of
them use option 'output' or other rarer names such as 'outfile'. In
order to rationalize option naming a bit, we turn all these option
names into 'out-file'.

Fixes: #729

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


  Commit: ba1a77fb333e0e38064b8ab73b856f7b5e842430
      https://github.com/intel/tpm2-tools/commit/ba1a77fb333e0e38064b8ab73b=
856f7b5e842430
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-19 (Tue, 19 Dec 2017)

  Changed paths:
    M man/tpm2_getmanufec.1.md
    M man/tpm2_getpubak.1.md
    M man/tpm2_getpubek.1.md
    M tools/tpm2_getmanufec.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_getpubek.c

  Log Message:
  -----------
  command line: change 'alg' to 'algorithm'

Most tools use the 'algorithm' command line switch, so rename the option
name for the few that are using it's shorthand 'alg'.

Fixes: #729

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


  Commit: d6c0ba46926c440bca8a7e03600e40068ba828cd
      https://github.com/intel/tpm2-tools/commit/d6c0ba46926c440bca8a7e0360=
0e40068ba828cd
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-19 (Tue, 19 Dec 2017)

  Changed paths:
    M man/tpm2_changeauth.1.md
    M man/tpm2_clear.1.md
    M man/tpm2_pcrevent.1.md
    M man/tpm2_quote.1.md
    M tools/tpm2_changeauth.c
    M tools/tpm2_clear.c
    M tools/tpm2_pcrevent.c
    M tools/tpm2_quote.c

  Log Message:
  -----------
  command line: '*password' becomes '*passwd'

The passwd shorthand is used for a large part of all password-related
option names.

Fixes: #729

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


  Commit: 5d4c08ff688de1d928bb37d4b536433aa0a79a76
      https://github.com/intel/tpm2-tools/commit/5d4c08ff688de1d928bb37d4b5=
36433aa0a79a76
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-19 (Tue, 19 Dec 2017)

  Changed paths:
    M man/tpm2_sign.1.md
    M man/tpm2_verifysignature.1.md
    M tools/tpm2_sign.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  command line: replace 'msg' by 'message'

Makes more clear what 'msg' is.

Fixes: #729

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


  Commit: 0d1d02e843a01e37d555914da29aebfefb8a521d
      https://github.com/intel/tpm2-tools/commit/0d1d02e843a01e37d555914da2=
9aebfefb8a521d
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-19 (Tue, 19 Dec 2017)

  Changed paths:
    M tools/tpm2_hash.c
    M tools/tpm2_send.c

  Log Message:
  -----------
  command lines: various fixes

This fixes some typos and other small errors related to command line
options.

Fixes: #729

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


  Commit: bad4999b948b9e4761bdcaf0b89c1e567571c692
      https://github.com/intel/tpm2-tools/commit/bad4999b948b9e4761bdcaf0b8=
9c1e567571c692
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-19 (Tue, 19 Dec 2017)

  Changed paths:
    M tools/tpm2_create.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_evictcontrol.c
    M tools/tpm2_getmanufec.c
    M tools/tpm2_getpubek.c
    M tools/tpm2_hmac.c
    M tools/tpm2_load.c
    M tools/tpm2_nvread.c
    M tools/tpm2_nvreadlock.c
    M tools/tpm2_nvrelease.c
    M tools/tpm2_nvwrite.c
    M tools/tpm2_rsadecrypt.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  command line: replace 1 with required_argument in the option list

Make sure options are defined the same way in all tools in order to
simplify further development.

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


  Commit: d932ed67d3d8bb7d66ec4e1229b6469110976614
      https://github.com/intel/tpm2-tools/commit/d932ed67d3d8bb7d66ec4e1229=
b6469110976614
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-19 (Tue, 19 Dec 2017)

  Changed paths:
    M lib/tpm2_options.c
    M tools/tpm2_certify.c
    M tools/tpm2_changeauth.c
    M tools/tpm2_clear.c
    M tools/tpm2_dictionarylockout.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_pcrevent.c
    M tools/tpm2_pcrlist.c
    M tools/tpm2_quote.c
    M tools/tpm2_readpublic.c
    M tools/tpm2_sign.c
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  command line: correly present command line options in the code

The command line option code was a bit difficult to read because of
missing spaces, column offsets and so on. Strealine this to make it
easier to grasp (and to parse when using a tool).

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


Compare: https://github.com/intel/tpm2-tools/compare/d58e882554d2...d932ed6=
7d3d8

--===============6806702599913825394==--

