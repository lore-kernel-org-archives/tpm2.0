Content-Type: multipart/mixed; boundary="===============1148141758746418220=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] bac18d: lib: sort TPM2_RC entries for base
 response code v...
Date: Tue, 28 Nov 2017 10:46:12 -0800
Message-ID: <5a1daef424f82_42993f7fbbcb5c30122473@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1148141758746418220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: bac18deb6c95487da940d314bed1696b358cd5d3
      https://github.com/intel/tpm2-tools/commit/bac18deb6c95487da940d314be=
d1696b358cd5d3
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M lib/rc-decode.c

  Log Message:
  -----------
  lib: sort TPM2_RC entries for base response code values

The response code can come from different layers of the software stack,
and these are defined in the entries of the tpm2_tss_layer_entry array.

Sort the entries using the base value for each response code group. It
makes easier to map the entries to the response code levels defined in
the specifications and add more entries.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 122e8f05f8de0d11ef6b86617991ea244533e658
      https://github.com/intel/tpm2-tools/commit/122e8f05f8de0d11ef6b866179=
91ea244533e658
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M lib/rc-decode.c
    M tools/tpm2_rc_decode.c

  Log Message:
  -----------
  tpm2_rc_decode: add support for Resource Manager level errors

Add entries for the TSS2_RESMGR_ERROR_LEVEL and TSS2_RESMGRTPM_ERROR_LEVEL
error levels in the TPM2_RC array. This will allow the tpm2_rc_decode tool
to decode response codes sent by the Resource Manager layer.

For example, if a resource manager validates the command header instead of
leaving it to the TPM2 and returns a command response buffer with the code
for command not supported, the response code would be decoded as following:

$ tpm2_rc_decode 0xb0143
error layer
  hex: 0xb0000
  identifier: TSS2_RESMGRTPM_ERROR_LEVEL
  description: Error from the Resource Manager duplicating TPM error check
format 0 error code
  hex: 0x43
  name: TPM2_RC_COMMAND_CODE
  description: command code not supported

Fixes: #647

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/intel/tpm2-tools/compare/573ce6ee9ea8...122e8f0=
5f8de

--===============1148141758746418220==--

