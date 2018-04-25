Content-Type: multipart/mixed; boundary="===============8594411686506958181=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2_pcrlist fails: Failed to intialize tcti context: 0x1
Date: Wed, 25 Apr 2018 16:35:50 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FF3F130@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 5fdc4164cca248988ae189701101eb01@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8594411686506958181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> When I run tpm2_pcrlist, I get "ERROR: Failed to initialize tcti context:=
 0x1".  tpm2-
> abrmd is running (which is necessary, right?).  This is with an actual tp=
m, not the
> simulator.  Measured boot via tboot.gz is working successfully.  What am =
I missing
> or doing wrong?

Can you run tpm2_pcrlist -v and post the output?

Depending on your version depends on how things get set up. =


3.X and prior releases depend on configure time checks on which TCTI to use=
. So it could have been
picking the device or socket (simulator) tcti. Try adding --tcti=3Dabrmd.

strace can be handy for understanding what tcti it's trying to access as we=
ll.

On master, things have gotten much better. We just try and dlopen the 3 maj=
or TCTIs we
Know about, no compiletime linktime worries.

The search order for TCTIs is documented here:
https://github.com/tpm2-software/tpm2-tools/blob/master/man/common/tcti.md#=
tcti-defaults

Bill




--===============8594411686506958181==--

