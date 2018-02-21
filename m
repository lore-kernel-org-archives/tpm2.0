Content-Type: multipart/mixed; boundary="===============1968910560067670600=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 4dc289: tpm2_createpolicy: clean up
 output
Date: Wed, 21 Feb 2018 13:49:08 -0800
Message-ID: <5a8de954447ee_2b5912b1cebf43c14114998@hookshot-fe-dfcc362.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1968910560067670600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 4dc289d5c763b89e8dfdb89f5e61f7f6fb914925
      https://github.com/tpm2-software/tpm2-tools/commit/4dc289d5c763b89e8d=
fdb89f5e61f7f6fb914925
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: clean up output

Output a more human friendly name for what it is, in the form
of a YAML map.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: af612331e522667c8e93d343e4be59efcca44051
      https://github.com/tpm2-software/tpm2-tools/commit/af612331e522667c8e=
93d343e4be59efcca44051
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M test/system/tests/getcap.sh
    M tools/tpm2_getcap.c

  Log Message:
  -----------
  tpm2_getcap: fix prefix matching on cap names

The logic was using strncmp on the canonical name
and thus performing a prefix match.

Ie this would work:
tpm2_getcap -c properties-fixedsdjfhsdjhdj

Fix this so it has to be an exact match.

Add a regression test to ensure this never happens again.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 16c8b5366d6cd91734b83ba2afa62734a2ef96a5
      https://github.com/tpm2-software/tpm2-tools/commit/16c8b5366d6cd91734=
b83ba2afa62734a2ef96a5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M lib/tpm2_alg_util.c

  Log Message:
  -----------
  lib/tpm2_alg_util: fix memcpy

A double pointer was being passed to memcpy, and it should
have just been the base pointer. This was causing some
memory corruption issues that were not being caught until
now, correct it by fixing the pointer argument to memcpy.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 68f359e075a9877ad5d813d3da80a9c0de31325a
      https://github.com/tpm2-software/tpm2-tools/commit/68f359e075a9877ad5=
d813d3da80a9c0de31325a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M tools/tpm2_policypcr.c

  Log Message:
  -----------
  tpm2_policypcr: use hyphen vs underscore

Output the policy digest as policy-digest: 0x1234 vs
policy_digest: 0x1234

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7455516601b72a4bd29b8068271c00e3c294bc42
      https://github.com/tpm2-software/tpm2-tools/commit/7455516601b72a4bd2=
9b8068271c00e3c294bc42
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M test/system/helpers.sh
    M test/system/tests/create.sh
    M test/system/tests/createprimary.sh

  Log Message:
  -----------
  tests/helpers: add helpers for yaml

Add 2 helpers for common YAML operations to reduce duplication.
One routine for accessing maps, the other for just verifying the
output loads.


  Commit: 836ef5067f8e86c467fbf8837654f9cbbe5c7e51
      https://github.com/tpm2-software/tpm2-tools/commit/836ef5067f8e86c467=
fbf8837654f9cbbe5c7e51
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M test/system/tests/listpersistent.sh

  Log Message:
  -----------
  tests/listpersistent: rename yaml_get to avoid confusion

yaml_get exists in helpers.sh, which could be confusing to have
in listpersistent as well. This currently is not a problem as
listpersistent does NOT source helpers.sh at the moment.

However, just rename it to yaml_get_len() to be:
1. Collision resistent with helpers.sh
2. More clear to the reader that this is different than yaml_get()
   in helpers.sh

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a6ca56e804d0f6e1b485038498551fd358da8f38
      https://github.com/tpm2-software/tpm2-tools/commit/a6ca56e804d0f6e1b4=
85038498551fd358da8f38
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M man/tpm2_getcap.1.md
    M test/system/tests/dictionarylockout.sh
    M test/system/tests/getcap.sh
    M test/system/tests/nv.sh
    M test/system/tests/quote.sh
    M tools/tpm2_getcap.c

  Log Message:
  -----------
  tpm2_getcap: cleanups and convert to YAML output

Update tpm2_getcap to output a YAML compliant map, and update
tests that use getcap.

Also, add the -l option while there, for listing valid -c option
strings.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 05c8192ee65b526b18f134dd26f49fc63269df78
      https://github.com/tpm2-software/tpm2-tools/commit/05c8192ee65b526b18=
f134dd26f49fc63269df78
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: update to yaml output

When verbose is enabled, tpm2_getmanufec outputs the hash of the public key,
print it in yaml map format:

public-key-hash:
  sha256: 3acdc877d22227b3c3b1db8fef12a804deae92f4e14a2d0fcc72f26b9e80e2af

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c23c084e6bbd309f629448d13fbafec05ae1dd03
      https://github.com/tpm2-software/tpm2-tools/commit/c23c084e6bbd309f62=
9448d13fbafec05ae1dd03
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M test/system/tests/getrandom.sh
    M tools/tpm2_getrandom.c

  Log Message:
  -----------
  tpm2_getrandom: use tpm2_tool_output over printf

tpm2_tool_output respects the -Q or quiet option, so use
that over printf.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b270481a8d8217dd1ba4e5848add65d9f58121ce
      https://github.com/tpm2-software/tpm2-tools/commit/b270481a8d8217dd1b=
a4e5848add65d9f58121ce
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M test/system/tests/hash.sh
    M tools/tpm2_hash.c

  Log Message:
  -----------
  tpm2_hash: update to YAML output

Output a yaml map in the following format:

hash:
  alg: sha256
  hash: c9ccf3344512b3e923d3e9cd31669136cc3a28be068309b77408ca1725d55897
ticket: b5d7b1336d9c7a35686caf691e9780e318ea5afd1f07528831fbdd5c9d746171

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0748018d4a547a943dc45da25da0e455cf0df176
      https://github.com/tpm2-software/tpm2-tools/commit/0748018d4a547a943d=
c45da25da0e455cf0df176
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M tools/tpm2_load.c

  Log Message:
  -----------
  tpm2_load: update to YAML output

output the loaded handle as:

handle: 0x12345678

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 458bedaea477044ed2e4150d52d0322a02947b6c
      https://github.com/tpm2-software/tpm2-tools/commit/458bedaea477044ed2=
e4150d52d0322a02947b6c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M test/system/tests/pcrevent.sh
    M tools/tpm2_pcrevent.c

  Log Message:
  -----------
  tpm2_pcrevent: update to YAML output

Output the pcrevent data in a YAML map output of
<hash-alg>: <hash>

For example:
sha1: 4922917da42434300361f5bef38e12bfb3755b5e
sha256: 56fad2c1d3967ff0ce1781f21302b28bdd1eeb81f02fc8a1136867c5bd5853d2
sha384: 2f5002bb0f4c5c8da7670dd6c6a3ad5afb4dfb07a677ec8139d2f0866ac0ea28be8=
c1d9d1dc9ea01b0d536da9b8b9ab2

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9374bd70f444b5bf905337a06537cfd2c5150854
      https://github.com/tpm2-software/tpm2-tools/commit/9374bd70f444b5bf90=
5337a06537cfd2c5150854
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M test/system/tests/pcrevent.sh
    M test/system/tests/pcrlist.sh
    M tools/tpm2_pcrlist.c

  Log Message:
  -----------
  tpm2_pcrlist: update to YAML compliant map

Output a map of hash algorithms to a map of PCR index
and value.

For example (truncated):

sha1:
  0 : 0x0000000000000000000000000000000000000003
sha384:
  0: 0x00000000000000000000000000000000000000000000000000000000000000000000=
0000000000000000000000000003

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: e6d6aa3376e5e2eee1953949df2295fd2a993294
      https://github.com/tpm2-software/tpm2-tools/commit/e6d6aa3376e5e2eee1=
953949df2295fd2a993294
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-21 (Wed, 21 Feb 2018)

  Changed paths:
    M test/system/tests/quote.sh
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: output in YAML format

Output the quote in a map in the following format:

quoted: ff544..0
signature:
  alg: hmac
  sig: 541e3..b

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/tpm2-software/tpm2-tools/compare/1f218d99dec6..=
.e6d6aa3376e5

--===============1968910560067670600==--

