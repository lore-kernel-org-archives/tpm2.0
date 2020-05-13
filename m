Content-Type: multipart/mixed; boundary="===============0224534419275481600=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] default TCTI name - how to compile the default as tabrmd
Date: Wed, 13 May 2020 09:20:18 -0700
Message-ID: <19cfb77a-869b-62bc-0f5e-d4d32a41f570@oracle.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0224534419275481600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Folks,

After I built the tools, I found that the default TCTI was device rather =

than the tabrmd.

# tpm2_getcap -v
tool=3D"tpm2_getcap" version=3D"4.1.2-rc0" tctis=3D"libtss2-tctildr" =

tcti-default=3Dtcti-device

But what I think I want is that the tcti-default=3Dtabrmd.

I know about the -T option and the TPM2TOOLS_TCTI environment variable.
But can I just compile it to have it default to tabrmd?
Is this some "configure" option or something?
How do I change how it compiles?

Thanks,
-ted

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============0224534419275481600==--

