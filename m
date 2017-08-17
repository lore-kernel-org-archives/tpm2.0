Content-Type: multipart/mixed; boundary="===============7271977738199258612=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] d8b66a: takeownership: replace a loop with
 a func for clar...
Date: Thu, 17 Aug 2017 10:24:28 -0700
Message-ID: <5995d14c66d61_22a53f9de70fbc3831628@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7271977738199258612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: d8b66a560834d5de1432dc30f2fbe2cab9f26aac
      https://github.com/01org/tpm2-tools/commit/d8b66a560834d5de1432dc30f2=
fbe2cab9f26aac
  Author: Doug Goldstein <cardoe(a)cardoe.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M tools/tpm2_takeownership.c

  Log Message:
  -----------
  takeownership: replace a loop with a func for clarity

By unrolling this loop and replacing it with a function call its easier
to audit the code when reading through the code.

Signed-off-by: Doug Goldstein <cardoe(a)cardoe.com>


  Commit: 35d14a93292be1e0ead21584c129294bbf6d1814
      https://github.com/01org/tpm2-tools/commit/35d14a93292be1e0ead21584c1=
29294bbf6d1814
  Author: Doug Goldstein <cardoe(a)cardoe.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M tools/tpm2_takeownership.c

  Log Message:
  -----------
  takeownership: drop another loop for clarity

Drop the internal anonymous structure and the loop over it to make the
code hopefully a little easier to audit and read.

Signed-off-by: Doug Goldstein <cardoe(a)cardoe.com>


Compare: https://github.com/01org/tpm2-tools/compare/e7c19330ace6...35d14a9=
3292b

--===============7271977738199258612==--

