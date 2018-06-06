Content-Type: multipart/mixed; boundary="===============8904583631417984106=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] tpm2-tss 2.0.0 release candidate
Date: Wed, 06 Jun 2018 14:17:40 -0700
Message-ID: <20180606211740.GD2727@intel.com>
In-Reply-To: 20180606131836.GA28519@linux-uys3
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8904583631417984106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2018 at 09:18:36AM -0400, Trevor Woerner wrote:
> On Tue 2018-06-05 @ 12:17:42 PM, Philip Tricca wrote:
> > RC3 was just tagged and signed. This RC got held up while we sorted out
> > how to best deal with the active PCR bank issue identified with the
> > latest simulator rlease and VMWare. The solution implemented is what we
> > think is the best for compatibility and "future-proofing".
> > =

> > This RC can be found here:
> > https://github.com/tpm2-software/tpm2-tss/releases/tag/2.0.0_rc3
> =

> I've built the latest tpm2 software:
> 	tpm2-tss @ fafc92108e
> 	tpm2-abrmd @ 7285806ad8
> 	tpm2-tools @ 6b257d1e63
> =

> and I'm still seeing:
> =

> 	root(a)raspberrypi3:~# tpm2_pcrlist -v
> 	tool=3D"tpm2_pcrlist" version=3D"3.0.2-535-g6b257d1" tctis=3D"dynamic" t=
cti-default=3Dtabrmd dlclose=3Denabled
> 	root(a)raspberrypi3:~# tpm2_pcrlist   =

> 	ERROR: Could not dlopen library: "libtss2-tcti-tabrmd.so"
> 	ERROR: Could not load tcti, got: "tabrmd"
> 	root(a)raspberrypi3:~# tpm2_pcrlist -T device:/dev/tpm0
> 	ERROR: Could not dlopen library: "libtss2-tcti-device.so"
> 	ERROR: Could not load tcti, got: "device"
> =

> From what I can tell, patches were added to tpm2-abrmd and tpm2-tools, ma=
ybe
> something was missed?

The most expediant path to a resolution is probably creating an 'issue'
on github.

> Also, for tpm2-abrmd, the following options have been removed?

All of this is documented in the CHANGELOG.md (typos and all):

> 	--max-transient-objects=3D20

Changed: 'max-transient-objects' command line option renamted to
'max-transients'

> 	--fail-on-loaded-trans

Removed: Command line option --fail-on-loaded-trans.

Philip

--===============8904583631417984106==--

