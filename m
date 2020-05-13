Content-Type: multipart/mixed; boundary="===============0448520861978507610=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: default TCTI name - how to compile the default as tabrmd
Date: Wed, 13 May 2020 19:01:33 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EDDA9D@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 19cfb77a-869b-62bc-0f5e-d4d32a41f570@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0448520861978507610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: ted.h.kim(a)oracle.com [mailto:ted.h.kim(a)oracle.com]
> Sent: Wednesday, May 13, 2020 11:20 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] default TCTI name - how to compile the default as tabrmd
> =

> Folks,
> =

> After I built the tools, I found that the default TCTI was device rather =
than the
> tabrmd.
> =

> # tpm2_getcap -v
> tool=3D"tpm2_getcap" version=3D"4.1.2-rc0" tctis=3D"libtss2-tctildr"
> tcti-default=3Dtcti-device
> =

> But what I think I want is that the tcti-default=3Dtabrmd.
> =

> I know about the -T option and the TPM2TOOLS_TCTI environment variable.
> But can I just compile it to have it default to tabrmd?
> Is this some "configure" option or something?
> How do I change how it compiles?
> =


Sound like the tpm2-abrmd TCTI isn't on the searchpath. Do you have tpm2-ab=
rmd compiled
and installed?

Does this command work:
pkg-config --libs tss2-tcti-tabrmd
-L/usr/local/lib -ltss2-tcti-tabrmd

Perhaps wherever it's installed isn't on the searchpath, which you could up=
date with LD_LIBRARY_PATH, or
Just symlink similar to what Tadeusz mentions.

--===============0448520861978507610==--

