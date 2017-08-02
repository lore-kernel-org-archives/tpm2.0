Content-Type: multipart/mixed; boundary="===============0290239497011243627=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] c24e90: tpm2_certify: fix tool exit code
Date: Wed, 02 Aug 2017 14:19:38 -0700
Message-ID: <598241ea7daab_d713feda0d23c3c254b5@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0290239497011243627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: c24e901bbbcb8cead6c50d82ed3d8f155bbb5671
      https://github.com/01org/tpm2-tools/commit/c24e901bbbcb8cead6c50d82ed=
3d8f155bbb5671
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M tools/tpm2_certify.c

  Log Message:
  -----------
  tpm2_certify: fix tool exit code

The tpm2_certify execute_tool() is wrongly returning a false value on
error, while the main program takes 0 to be a success value. But also
the function is expected to return an int a not a bool value, so fix
both issues.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 2093a168b7a99884eea0d0a9e749df5c75a16f1b
      https://github.com/01org/tpm2-tools/commit/2093a168b7a99884eea0d0a9e7=
49df5c75a16f1b
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  tpm2_encryptdecrypt: fix tool exit code

The tpm2_encryptdecrypt execute_tool() is wrongly returning a false value
on error, while the main program takes 0 to be a success value. But also
the function is expected to return an int a not a bool value, so fix both
issues.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 1e402379e43a38bd2a8744a8eb1cedd8dc834d33
      https://github.com/01org/tpm2-tools/commit/1e402379e43a38bd2a8744a8eb=
1cedd8dc834d33
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M tools/tpm2_getpubek.c

  Log Message:
  -----------
  tpm2_getpubek: fix tool exit code

The tpm2_getpubek execute_tool() is wrongly returning a false value on
error, while the main program takes 0 to be a success value. But also
the function is expected to return an int a not a bool value, so fix
both issues.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 4d3659996a5412fa4e10ead386e2b1be780ace2a
      https://github.com/01org/tpm2-tools/commit/4d3659996a5412fa4e10ead386=
e2b1be780ace2a
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M tools/tpm2_loadexternal.c

  Log Message:
  -----------
  tpm2_loadexternal: fix tool exit code

The tpm2_loadexternal execute_tool() is wrongly returning a false value on
error, while the main program takes 0 to be a success value. But also the
function is expected to return an int a not a bool, so fix both issues.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 52635941501fe3f5063329073529f3675c15b334
      https://github.com/01org/tpm2-tools/commit/52635941501fe3f50633290735=
29f3675c15b334
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M tools/tpm2_nvlist.c

  Log Message:
  -----------
  tpm2_nvlist: fix tool exit code

The tpm2_nvlist execute_tool() is wrongly return nv_list() !=3D 0. This is
wrong not only because that function returns a bool and not an int, but
also because the nv_list() returns true (!=3D 0) on success and the main
the main program takes 1 to be an error. So fix both issues.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 2b66941d03050a48acf646282d1f832a44086de5
      https://github.com/01org/tpm2-tools/commit/2b66941d03050a48acf646282d=
1f832a44086de5
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: simplify execute_tool() error codes propagation

The tool main function that calls execute_tool() doesn't use the returned
value, it only takes 0 as a succeeds value an everything else as an error.

So it makes no sense to have a gazillion different error codes for each
situation, this just makes the code difficult to read for no gain.

While being there, handle the cases for when getopt_long() finds that the
option or arguments are not correct.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 6758d1469090dacb8c9b0718b5862a29d2e6d9b2
      https://github.com/01org/tpm2-tools/commit/6758d1469090dacb8c9b0718b5=
862a29d2e6d9b2
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: simplify execute_tool() error codes propagation

The tool main function that calls execute_tool() doesn't use the returned
value, it only takes 0 as a succeeds value an everything else as an error.

So it makes no sense to have a gazillion different error codes for each
situation, this just makes the code difficult to read for no gain.

While being there, handle the cases for when getopt_long() finds that the
option or arguments are not correct.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: cbb78fb24a084d2953c519b9d476cf037d47d396
      https://github.com/01org/tpm2-tools/commit/cbb78fb24a084d2953c519b9d4=
76cf037d47d396
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: simplify execute_tool() error codes propagation

The tool main function that calls execute_tool() doesn't use the returned
value, it only takes 0 as a succeeds value an everything else as an error.

So lets just return consistently 1 as an error an 0 as a success, instead
of returning a combination of -1 and value set in the return_val variable.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: cd4191fc01fc894b0a919f04fc0b7f9177e63b94
      https://github.com/01org/tpm2-tools/commit/cd4191fc01fc894b0a919f04fc=
0b7f9177e63b94
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M tools/tpm2_load.c

  Log Message:
  -----------
  tpm2_load: simplify execute_tool() error codes propagation

The tool main function that calls execute_tool() doesn't use the returned
value, it only takes 0 as a succeeds value an everything else as an error.

So it makes no sense to have a gazillion different error codes for each
situation, this just makes the code difficult to read for no gain.

While being there, handle the cases for when getopt_long() finds that the
option or arguments are not correct.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 314c4806288b2e3d47c9b6d7491661d59b5eba61
      https://github.com/01org/tpm2-tools/commit/314c4806288b2e3d47c9b6d749=
1661d59b5eba61
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: simplify execute_tool() error codes propagation

The tool main function that calls execute_tool() doesn't use the returned
value, it only takes 0 as a succeeds value an everything else as an error.

So it makes no sense to have a gazillion different error codes for each
situation, this just makes the code difficult to read for no gain.

While being there, handle the cases for when getopt_long() finds that the
option or arguments are not correct.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/e8c49105e244...314c480=
6288b

--===============0290239497011243627==--

