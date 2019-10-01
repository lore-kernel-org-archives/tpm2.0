Content-Type: multipart/mixed; boundary="===============9210585315635267894=="
MIME-Version: 1.0
From: Oliver, Dario N <dario.n.oliver at intel.com>
Subject: [tpm2] Cannot build tpm2-tss@2.2.3 and tpm2-abrmd@2.0.3 with Automake
 1.6 
Date: Tue, 01 Oct 2019 17:10:04 +0000
Message-ID: <20A6FE0AC912764FB8B5BC5A1A7CB92B4255A062@FMSMSX103.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9210585315635267894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I just noticed that I am no longer able to build tpm2-tss and tpm-abrmd (th=
e specified versions) with the latest automake 1.6.
I am not sure if tpm2-tools(a)3.2.0  have the same problem.
This is caused by automake 1.6, there are several other persons having the =
same problem because of broken compatibility, i.e. https://gitlab.gnome.org=
/GNOME/libgdata/issues/24
The latest versions of tss, abrmd and tools works fine. Maybe there is a fi=
x in those version that you could consider porting to the older versions?
The workaround is not using automake 1.6, and rolling back to 1.5. =


In summary,

Versions that do not work with automake 1.6:

	- TPM2_TSS_VERSION=3D2.2.3
	- TPM2_ABRMD_VERSION=3D2.0.3
	- TPM2_TOOLS_VERSION=3D3.2.0 ?

The error will be the following, and using --disable-dependency-tracking wi=
ll not help (a make error will appear anyways)

	config.status: error: Something went wrong bootstrapping makefile fragments
	    for automatic dependency tracking.  Try re-running configure with the
	    '--disable-dependency-tracking' option to at least be able to build
	    the package (albeit without support for automatic dependency tracking).

Versions that work with automake 1.6:

 - TPM2_TSS_VERSION=3D2.3.1
 - TPM2_ABRMD_VERSION=3D2.2.0
 - TPM2_TOOLS_VERSION=3D4.0

Regards,

Nicolas Oliver
--===============9210585315635267894==--

