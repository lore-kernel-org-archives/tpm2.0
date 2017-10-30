Content-Type: multipart/mixed; boundary="===============8219246948739302208=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 06e2b6: test: don't extend a PCR with more
 digest values t...
Date: Mon, 30 Oct 2017 08:21:07 -0700
Message-ID: <59f743634d1ba_2b703fd4d9153c34118132@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8219246948739302208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 06e2b6d94a2b258b5468910ce252e534edae9eb9
      https://github.com/01org/tpm2-tools/commit/06e2b6d94a2b258b5468910ce2=
52e534edae9eb9
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-30 (Mon, 30 Oct 2017)

  Changed paths:
    M test/system/test_tpm2_pcrextend.sh

  Log Message:
  -----------
  test: don't extend a PCR with more digest values than supported banks

The list of digest values used to extend a PCR are defined by passing a
TPML_DIGEST_VALUES to TPM2_PCR_Extend. By passing a list of values, the
PCR can be extended in all the supported banks on a single TPM2 command.

Since there's no check if the algorithm ID is different for each digest
used, different digest values could be passed for the same PCR bank so a
PCR will be extended multiple times for the same hash algorithm bank.

But this isn't the preferred way to use it, as explained in the TCG spec:

"While the semantics of this command allow multiple extends to a single
PCR bank, this is not the preferred use and the limit on the number of
entries in the list make this use somewhat impractical."

Also, the number of banks will vary depending of the hash algorithms that
are supported by each TPM2 chip, so the test shouldn't make assumption on
the maximum number of digests that could be used. Instead, it should only
attempt to extend the PCR for the banks that are known to be supported.

The test though, assumes that 3 hash digests could be passed since that's
what supported by the TPM2 simulator (sha1, sha256 and sha384). So change
the test to make sure that it will work on all TPM2 chips.

And also change the test to not attempt to extend the same PCR multiple
times for the same bank since the spec says that's not the preferred way
to use the TPM2_PCR_Extend command.

Finally, the test is checking that attempting to extend a PCR with more
digest values than supported banks will fail but there's no check for the
command exit status to make sure that it failed.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============8219246948739302208==--

