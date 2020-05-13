Content-Type: multipart/mixed; boundary="===============0386960715167668696=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: default TCTI name - how to compile the default as tabrmd
Date: Wed, 13 May 2020 11:20:26 -0700
Message-ID: <33d2366d-df82-7c23-8e78-f6f776214641@intel.com>
In-Reply-To: 19cfb77a-869b-62bc-0f5e-d4d32a41f570@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0386960715167668696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/13/20 9:20 AM, ted.h.kim(a)oracle.com wrote:
> Folks,
> =

> After I built the tools, I found that the default TCTI was device rather
> than the tabrmd.
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

This can be done by setting a symbolic link libts2-tcti-default.so
pointing to libts2-tcti-tabrmd.so

# ln -s /usr/lib/libts2-tcti-tabrmd.so /usr/lib/libts2-tcti-default.so


-- =

Tadeusz
--===============0386960715167668696==--

