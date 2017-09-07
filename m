Content-Type: multipart/mixed; boundary="===============7924332634940960632=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] d5bcdf: fixups for tpm2_akparse
Date: Thu, 07 Sep 2017 08:54:55 -0700
Message-ID: <59b16bcf3e5b6_77cb3fa94390bc4072773@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7924332634940960632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/tpm2-option-revamp
  Home:   https://github.com/01org/tpm2-tools
  Commit: d5bcdfcc712b9b384e43b703a2ed2de55f19e5ea
      https://github.com/01org/tpm2-tools/commit/d5bcdfcc712b9b384e43b703a2=
ed2de55f19e5ea
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_akparse.c

  Log Message:
  -----------
  fixups for tpm2_akparse

The tool doesn't use the sapi context so it can be removed, also remove
<getopt.h> header include since isn't needed anymore.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 80d05379322b40c7d02125d1083daf1291068c8a
      https://github.com/01org/tpm2-tools/commit/80d05379322b40c7d02125d108=
3daf1291068c8a
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_certify.c

  Log Message:
  -----------
  fixups for tpm2_certify

Remove unneded header include, sapi_context from context struct and
add wrongly removed error logging.


  Commit: a95e68d4bced01a08dd165adff1392719fdc32be
      https://github.com/01org/tpm2-tools/commit/a95e68d4bced01a08dd165adff=
1392719fdc32be
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_create.c

  Log Message:
  -----------
  fixups for tpm2_create

Remove unneded header include, sapi_context from context struct and
add wrongly removed error logging.

Also move the change for the output stream to be unbuffered to the
onstart callback since the original code did it before processing
the tool options.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 0fa39506f7b949c5582a623c2cc680d30dbe1efe
      https://github.com/01org/tpm2-tools/commit/0fa39506f7b949c5582a623c2c=
c680d30dbe1efe
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  fixups for tpm2_createpolicy

Remove unneded header include, sapi_context from context struct and
add wrongly removed error logging.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: d718dea13ace140c02e8cf68110f390301dfee32
      https://github.com/01org/tpm2-tools/commit/d718dea13ace140c02e8cf6811=
0f390301dfee32
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  fixups for tpm2_createprimary

Remove unneded header include, sapi_context from context struct and
add wrongly removed error logging.

Also move the change for the output stream to be unbuffered to the
onstart callback since the original code did it before processing
the tool options.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: d5fc3d3f0798d378fa1128cfcd226371234e871a
      https://github.com/01org/tpm2-tools/commit/d5fc3d3f0798d378fa1128cfcd=
226371234e871a
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_dictionarylockout.c

  Log Message:
  -----------
  fixups for tpm2_dictionarylockout

Remove unneded header include, sapi_context from context struct and
add wrongly removed error logging.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 6329a3066eed6b4117b0c865dcef8f07553fe449
      https://github.com/01org/tpm2-tools/commit/6329a3066eed6b4117b0c865dc=
ef8f07553fe449
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_dump_capability.c

  Log Message:
  -----------
  fixup for tpm2_dumpcapability

Remove unneeded header include

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: de6366e7c5afc9d8d34b70b216dca552a8f49e52
      https://github.com/01org/tpm2-tools/commit/de6366e7c5afc9d8d34b70b216=
dca552a8f49e52
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  fixups for tpm2_encryptdecrypt

Remove unneded header include, sapi_context from context struct and
add wrongly removed error logging.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 4b191a932a001b55a33eae7bce572910ae8dd7bf
      https://github.com/01org/tpm2-tools/commit/4b191a932a001b55a33eae7bce=
572910ae8dd7bf
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_evictcontrol.c

  Log Message:
  -----------
  fixups for tpm2_evictcontrol

Remove unneded header include, sapi_context from context struct and
add wrongly removed error logging.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 5a8d18b352128f62fbf86cbc99158f195328c3f2
      https://github.com/01org/tpm2-tools/commit/5a8d18b352128f62fbf86cbc99=
158f195328c3f2
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  fixups for tpm2_getmanufec

Remove unneded header include and add wrongly removed error logging.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 29a10dd97fa9d7dc6e315743e9f555d583610408
      https://github.com/01org/tpm2-tools/commit/29a10dd97fa9d7dc6e315743e9=
f555d583610408
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  fixups for tpm2_getpubak

Remove unneded header include, sapi_context from context struct and
add wrongly removed error logging.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: ee6249ee61c5fd929d9480a15b4744bb2a714e44
      https://github.com/01org/tpm2-tools/commit/ee6249ee61c5fd929d9480a15b=
4744bb2a714e44
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_getpubek.c

  Log Message:
  -----------
  fixups for tpm2_getpubek

Remove unneded header include, sapi_context from context struct and
add wrongly removed error logging.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 01e337d1dac92b0ca0dd953afb731c17cc2fe5ef
      https://github.com/01org/tpm2-tools/commit/01e337d1dac92b0ca0dd953afb=
731c17cc2fe5ef
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_getrandom.c

  Log Message:
  -----------
  fixups for tpm2_getrandom

Remove unneded header include and sapi_context from context struct.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: e2a2c94e26101429209981f2c5a664ed95ba98f2
      https://github.com/01org/tpm2-tools/commit/e2a2c94e26101429209981f2c5=
a664ed95ba98f2
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_hmac.c

  Log Message:
  -----------
  fixups for tpm2_hmac

Remove unneded header include, sapi_context from context struct and
add wrongly removed error logging.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: c38cd8a321f6d0db8a02041f642669f04933e4b7
      https://github.com/01org/tpm2-tools/commit/c38cd8a321f6d0db8a02041f64=
2669f04933e4b7
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_hash.c

  Log Message:
  -----------
  fixups for tpm2_hash

Remove unneded header include and sapi_context from context struct.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 05b9df90ee449d6af76700282e18de8c910ae3a5
      https://github.com/01org/tpm2-tools/commit/05b9df90ee449d6af76700282e=
18de8c910ae3a5
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_nvdefine.c
    M tools/tpm2_nvreadlock.c
    M tools/tpm2_pcrextend.c

  Log Message:
  -----------
  fixups for tpm2_{nvdefine,nvreadlock,pcrextend}

The sapi_context in the context struct is a left over, remove it.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/01ad76681e0d...05b9df9=
0ee44

--===============7924332634940960632==--

