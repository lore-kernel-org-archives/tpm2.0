Content-Type: multipart/mixed; boundary="===============1466168843518550957=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 0d0d65: tpm2_getpubek: drop unused
 options
Date: Thu, 01 Mar 2018 13:37:51 -0800
Message-ID: <5a9872afeb223_51362ad708431c1427318@hookshot-fe-6b2eebc.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1466168843518550957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 0d0d6564d79811252954549ca6818948ed8c1518
      https://github.com/tpm2-software/tpm2-tools/commit/0d0d6564d798112529=
54549ca6818948ed8c1518
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M tools/tpm2_getpubek.c

  Log Message:
  -----------
  tpm2_getpubek: drop unused options

Options v and h are not used in the tool specific code, and
are handled by tpm2_tool.c framework. Drop them.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2e309d19e4f8ad1bf96101da369c2bca94d94449
      https://github.com/tpm2-software/tpm2-tools/commit/2e309d19e4f8ad1bf9=
6101da369c2bca94d94449
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M CHANGELOG.md
    M Makefile.am
    A man/tpm2_createek.1.md
    R man/tpm2_getpubek.1.md
    M test/system/tests/activecredential.sh
    A test/system/tests/createek.sh
    M test/system/tests/getpubak.sh
    R test/system/tests/getpubek.sh
    M test/system/tests/makecredential.sh
    M test/system/tests/output_formats.sh
    M test/system/tests/quote.sh
    A tools/tpm2_createek.c
    R tools/tpm2_getpubek.c

  Log Message:
  -----------
  tpm2_getpubek: rename to tpm2_createek

Add the --format option for outputing the EK in a different
format.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ccf70d0fb08a3f7639cad456f0dbb2855a301d99
      https://github.com/tpm2-software/tpm2-tools/commit/ccf70d0fb08a3f7639=
cad456f0dbb2855a301d99
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M CHANGELOG.md
    M Makefile.am
    A man/tpm2_createak.1.md
    R man/tpm2_getpubak.1.md
    M test/system/tests/activecredential.sh
    A test/system/tests/createak.sh
    R test/system/tests/getpubak.sh
    M test/system/tests/makecredential.sh
    M test/system/tests/output_formats.sh
    M test/system/tests/quote.sh
    A tools/tpm2_createak.c
    R tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: rename to tpm2_creataek

Add the --format option for outputing the AK in a different
format.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3c45f206e9ac9ba8cfa05005d725373524cc4694
      https://github.com/tpm2-software/tpm2-tools/commit/3c45f206e9ac9ba8cf=
a05005d725373524cc4694
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M tools/tpm2_createek.c

  Log Message:
  -----------
  tpm2_createek: cleanups

Cleanup the session data code and remove superfolous memcpy.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 69ec583b2ff58082cbe4e8e99b8b77c9447492ae
      https://github.com/tpm2-software/tpm2-tools/commit/69ec583b2ff58082cb=
e4e8e99b8b77c9447492ae
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M CHANGELOG.md
    M man/tpm2_createek.1.md
    M tools/tpm2_createek.c

  Log Message:
  -----------
  tpm2_createek: support non-persistent EK creation

Support non-persistent (ie no evictcontrol) on the created EK handle.

This does not work with RMs as they will call flushcontext on tool
disconnect, and thus the handle will be gone.

Since our tests are all written against having an RM presnet (abrmd),
we cannot add a test at this time.

However, with the simulator running, one can do:
$ export TPM2TOOLS_TCTI_NAME=3D"socket"
$ tpm2_createek -g rsa -p ek.pub -f tss -c out.ctx
$ tpm2_getcap -c handles-transient
0x80000000
$ tpm2_flushcontext -H 0x80000000
$ tpm2_getcap -c handles-transient
<empty output>
$ tpm2_loadexternal -H o -u ek.pub -C out.ctx
$ tpm2_getcap -c handles-transient
- 0x80000000

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 6d3a71238462cb07db276386b17970b9c2d51145
      https://github.com/tpm2-software/tpm2-tools/commit/6d3a71238462cb07db=
276386b17970b9c2d51145
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M Makefile.am
    A lib/tpm2_ctx_mgmt.c
    A lib/tpm2_ctx_mgmt.h
    M lib/tpm2_hierarchy.c
    M lib/tpm2_hierarchy.h
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: refactor out create_primary

Refactor out the routines needed for creating a primary object.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 89a6e69963d81d0957336402474fb783e1789149
      https://github.com/tpm2-software/tpm2-tools/commit/89a6e69963d81d0957=
336402474fb783e1789149
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M CHANGELOG.md
    M tools/tpm2_createek.c

  Log Message:
  -----------
  tpm2_createek: update to use create_primary func

Now that tpm2_hierarchy has a routine for creating a primary key,
use this when creating an ek.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: cfdd8f0e5fed9a62752e0f86237fc58f63955cde
      https://github.com/tpm2-software/tpm2-tools/commit/cfdd8f0e5fed9a6275=
2e0f86237fc58f63955cde
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M tools/tpm2_evictcontrol.c

  Log Message:
  -----------
  tpm2_evictcontrol: update to use ctx mgmt routine

Use the context managment routine evictcontrol rather than
the raw sysapi call.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: dff1ac7fb4f7083eb4d59007334919aab2010355
      https://github.com/tpm2-software/tpm2-tools/commit/dff1ac7fb4f7083eb4=
d59007334919aab2010355
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M tools/tpm2_createek.c

  Log Message:
  -----------
  tpm2_createek: remove unused -d option

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 08e2dafacf61270340b509ee42d884fb81a9aded
      https://github.com/tpm2-software/tpm2-tools/commit/08e2dafacf61270340=
b509ee42d884fb81a9aded
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M man/tpm2_evictcontrol.1.md

  Log Message:
  -----------
  tpm2_evictcontrol: update to use lib

Update to use the internal lib routines.

Update it to have a default hierarchy when not specified.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3cbc46d53ff64758184b41282fb6ff5e18db81b6
      https://github.com/tpm2-software/tpm2-tools/commit/3cbc46d53ff6475818=
4b41282fb6ff5e18db81b6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M man/tpm2_createak.1.md
    M tools/tpm2_createak.c

  Log Message:
  -----------
  tpm2_createak: support non-persistent AK creation

Support non-persistent (ie no evictcontrol) on the created AK handle.

This does not work with RMs as they will call flushcontext on tool
disconnect, and thus the handle will be gone.

Since our tests are all written against having an RM presnet (abrmd),
we cannot add a test at this time.

However, with the simulator running, one can do:
$ export TPM2TOOLS_TCTI_NAME=3D"socket"
$ tpm2_createek -H 0x81010000 -p ek.pub
$ tpm2_createak -E 0x81010000 -c ak.ctx -p ak.pub -n ak.name
loaded-key:
  handle: 80000001
  name: 000bdcdad5d1010328954925740c602c2791bcd10115a87a4954ff25932bc09540b1
$ tpm2_getcap -c handles-transient
- 0x80000001
$ tpm2_flushcontext -H 0x80000001
$ tpm2_getcap -c handles-transient
<empty output>
$ tpm2_loadexternal -H o -u ak.pub -C ak.ctx
$ tpm2_getcap -c handles-transient
- 0x80000000

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d5bfd4ec3946fb932cd319b7e6caed89d45871f4
      https://github.com/tpm2-software/tpm2-tools/commit/d5bfd4ec3946fb932c=
d319b7e6caed89d45871f4
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M tools/tpm2_createek.c

  Log Message:
  -----------
  tpm2_createek: add handle output

When a transient handle is generated, output this handle
as a YAML scalar.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: fc3618aa53147c7dcdd327bbc5a1e3240e8e4a7d
      https://github.com/tpm2-software/tpm2-tools/commit/fc3618aa53147c7dcd=
d327bbc5a1e3240e8e4a7d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M tools/tpm2_createek.c

  Log Message:
  -----------
  tpm2_createek: allow no options

Allow defaults to be used and thus no options required.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 76e455b3fbd9da0f7ebb8e3610d852b7e40d35f9
      https://github.com/tpm2-software/tpm2-tools/commit/76e455b3fbd9da0f7e=
bb8e3610d852b7e40d35f9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M man/tpm2_loadexternal.1.md
    M tools/tpm2_loadexternal.c

  Log Message:
  -----------
  tpm2_loadexternal: output loaded handle

Rather then needing to use tpm2_getcap for the loaded
handle, which can be confusing when multiple handles
are loaded, augment the tpm2_loadexternal to output it.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5b5a44a42c332bb7a02456130097703c2afbce3d
      https://github.com/tpm2-software/tpm2-tools/commit/5b5a44a42c332bb7a0=
2456130097703c2afbce3d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M lib/files.h

  Log Message:
  -----------
  lib/files: add missing prototype

The prototype for serializing a TPM2B_SENSITIVE to disk was
missing. Add it.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b968df8ec4a1bb8d770257ce005be4c53c04950c
      https://github.com/tpm2-software/tpm2-tools/commit/b968df8ec4a1bb8d77=
0257ce005be4c53c04950c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M lib/files.c
    M lib/files.h
    M man/tpm2_createak.1.md
    M tools/tpm2_create.c
    M tools/tpm2_createak.c
    M tools/tpm2_import.c
    M tools/tpm2_load.c

  Log Message:
  -----------
  tpm2_createak: support private key output

Support output of the private key via -r option.
Some of the tools were still improperly serializing
data to disk, fix this here to keep "git bisectability"

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 40b70a694a93bf3c1da051c7440a9daa996d1f9d
      https://github.com/tpm2-software/tpm2-tools/commit/40b70a694a93bf3c1d=
a051c7440a9daa996d1f9d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M tools/tpm2_load.c

  Log Message:
  -----------
  tpm2_load: output error on invalid handle

Output an error when the parent key handle is invalid.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 24a7caf5c261222efda5f4d9a22f269cca6401e8
      https://github.com/tpm2-software/tpm2-tools/commit/24a7caf5c261222efd=
a5f4d9a22f269cca6401e8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M tools/tpm2_createak.c

  Log Message:
  -----------
  tpm2_createak: refactor

Move the structures around to make it clear what values are being used
where.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/tpm2-software/tpm2-tools/compare/9725b2b5f624..=
.24a7caf5c261

--===============1466168843518550957==--

