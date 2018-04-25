Content-Type: multipart/mixed; boundary="===============5769659869969600506=="
MIME-Version: 1.0
From: Scheie, Peter M <Petre.Scheie at gd-ms.com>
Subject: Re: [tpm2] tpm2_pcrlist fails: Failed to intialize tcti context: 0x1
Date: Wed, 25 Apr 2018 16:43:20 +0000
Message-ID: <f766a5ed0f644924985f86a90988e274@AZDC-MMB02.GD-MS.US>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563FF3F130@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5769659869969600506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi William,
With  @martinezjavier's help, we determined that the problem was tpm-tools =
was being built before tpm2-abrmd.  I added the dependency in a bbappend (a=
nd I just got the message from flihp that the dependency was added to the O=
E recipe for tpm2-tools in https://github.com/flihp/meta-measured/commit/f4=
3341a2e261d2a72695f304f56143d6b66bf868) and then tpm2_pcrlist worked fine.

Peter

-----Original Message-----
From: Roberts, William C [mailto:william.c.roberts(a)intel.com] =

Sent: Wednesday, April 25, 2018 11:36 AM
To: Scheie, Peter M; tpm2(a)lists.01.org
Subject: RE: tpm2_pcrlist fails: Failed to intialize tcti context: 0x1

> When I run tpm2_pcrlist, I get "ERROR: Failed to initialize tcti =

> context: 0x1".  tpm2- abrmd is running (which is necessary, right?).  =

> This is with an actual tpm, not the simulator.  Measured boot via =

> tboot.gz is working successfully.  What am I missing or doing wrong?

Can you run tpm2_pcrlist -v and post the output?

Depending on your version depends on how things get set up. =


3.X and prior releases depend on configure time checks on which TCTI to use=
. So it could have been picking the device or socket (simulator) tcti. Try =
adding --tcti=3Dabrmd.

strace can be handy for understanding what tcti it's trying to access as we=
ll.

On master, things have gotten much better. We just try and dlopen the 3 maj=
or TCTIs we Know about, no compiletime linktime worries.

The search order for TCTIs is documented here:
https://github.com/tpm2-software/tpm2-tools/blob/master/man/common/tcti.md#=
tcti-defaults

Bill




--===============5769659869969600506==--

