Content-Type: multipart/mixed; boundary="===============3437885123082228581=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: [tpm2] tpm2-tools 3.1.3 release candidate 0
Date: Thu, 20 Sep 2018 21:45:11 +0100
Message-ID: <de01827e2f7b2c78afda598020df993801f72603.camel@linux.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3437885123082228581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've just tagged and signed an rc0 for tpm2-tools 3.1.3. The folks at
Red Hat found a couple of unintended behavioural changes which violate
the semantic versioning policy. This release addresses those changes
and should be updated to in order to preserve expected behaviour for
users.

* Restore support for the TPM2TOOLS_* env vars for TCTI configuration,
in addition to supporting the new unified TPM2TOOLS_ENV_TCTI (#1171)
* Fix tpm2_getcap to print properties with the TPM_PT prefix, rather
than TPM2_PT (1175)

https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.3-rc0

Please do test this release. If there aren't any reported issues I'll
do a final release in a week.

Regards,
Joshua


--===============3437885123082228581==--

