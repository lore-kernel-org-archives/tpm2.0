Content-Type: multipart/mixed; boundary="===============5900249434432619639=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] c3e072: man: specify correct long option
 for '-C'
Date: Fri, 13 Oct 2017 12:25:53 -0700
Message-ID: <59e113413737a_2ea93fa9dce5dc2c613ec@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5900249434432619639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: c3e0729f52040fb30760e8b4157e525e5d3d483e
      https://github.com/01org/tpm2-tools/commit/c3e0729f52040fb30760e8b415=
7e525e5d3d483e
  Author: Satish Bysany <>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M man/tpm2_load.1.md

  Log Message:
  -----------
  man: specify correct long option for '-C'

Manpage says '-n' and '-C' both have the long option '--name'. But
code says '-C' =3D> '--context' and '-n' =3D> '--name'

Signed-off-by: Satish Bysany <>


  Commit: be887aa2894e974ece1885cf862179c64d40ed5f
      https://github.com/01org/tpm2-tools/commit/be887aa2894e974ece1885cf86=
2179c64d40ed5f
  Author: Satish Bysany <>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: enforce-policy does not require arguments

-E option (aka --enforce-policy) is a boolean parameter, so does
not require any more arguments.

See 'man 3 getopt_long' for 'struct option' and its interpretation.

Signed-off-by: Satish Bysany <>


  Commit: 527d6b9e6e482cd9274f5f0fd06a3f27f81d5fdb
      https://github.com/01org/tpm2-tools/commit/527d6b9e6e482cd9274f5f0fd0=
6a3f27f81d5fdb
  Author: Satish Bysany <>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tpm2_unseal: align code with manpage's CLI options

Manpage says -P means --pwdk but code says --pwdi.
Seems --pwdk is used everywhere, so change it accordingly.

Signed-off-by: Satish Bysany <>


Compare: https://github.com/01org/tpm2-tools/compare/5c87d356b6bd...527d6b9=
e6e48

--===============5900249434432619639==--

