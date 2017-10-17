Content-Type: multipart/mixed; boundary="===============7398737211046671659=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] b98d16: test_tpm2_createpolicy.sh: use file
 to supply expe...
Date: Tue, 17 Oct 2017 10:21:13 -0700
Message-ID: <59e63c09997f5_1a703f85da935c34116325@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7398737211046671659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: b98d16f6c30be27089855f7a27f7badfee934723
      https://github.com/01org/tpm2-tools/commit/b98d16f6c30be27089855f7a27=
f7badfee934723
  Author: Alexander Steffen <Alexander.Steffen(a)infineon.com>
  Date:   2017-10-17 (Tue, 17 Oct 2017)

  Changed paths:
    M test/system/test_tpm2_createpolicy.sh

  Log Message:
  -----------
  test_tpm2_createpolicy.sh: use file to supply expected PCR value

For the simulator, PCR0 contains the value 0x03, but this is not
necessarily the case for other TPM implementations. Therefore, use a file
to supply the expected PCR value to tpm2_createpolicy, so that the expected
policy digest remains unchanged and the test passes for all TPMs.



--===============7398737211046671659==--

