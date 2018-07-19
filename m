Content-Type: multipart/mixed; boundary="===============5828911671626350412=="
MIME-Version: 1.0
From: Scheie, Peter M <Petre.Scheie at gd-ms.com>
Subject: Re: [tpm2] getting segfaults with tss-2.0.0, abrmd-2.0.0, tools-3.1.0
Date: Thu, 19 Jul 2018 16:18:23 +0000
Message-ID: <0f78cd78b6714694a8cdcf6d02391dcd@AZDC-MMB02.GD-MS.US>
In-Reply-To: 20180719143108.GC19516@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5828911671626350412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----Original Message-----
From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Philip Tricca
Sent: Thursday, July 19, 2018 9:31 AM
To: Joshua Lock
Cc: tpm2(a)lists.01.org
Subject: Re: [tpm2] getting segfaults with tss-2.0.0, abrmd-2.0.0, tools-3.=
1.0

On Thu, Jul 19, 2018 at 11:24:23AM +0100, Joshua Lock wrote:
> =

> =

> On 18/07/2018 22:17, Scheie, Peter M wrote:
> >By the way, does abrmd default to trying to connect to /dev/tpm0?=C2=A0 =
When
> >working with the emulator on my laptop, I have to start abrmd with
> >'--tcti=3Dlibtss2-tcti-mssim.so' but I assume that's just for when there=
 is
> >no TPM device, right?
> =

> Correct, if no --tcti value is passed abrmd defaults to using the device
> tcti:
> https://github.com/tpm2-software/tpm2-abrmd/blob/2296d48a1004aff5f93d6ec2=
3a50819f2a5c5584/src/tcti-dynamic.c#L138
> =

> At line 142 you can see where the default value of the TCTI library file
> property is set to "libtss2-tcti-device.so".
> =

> >So, with tpm2-abrmd running, if I call, say, tpm2_pcrlist or tpm2_nvlist,
> >to just query the TPM, it will display the PCRs or the NV indexes but th=
en
> >follow that with a "Segmentation fault", and syslog shows things like
> >this:
> >
> >Jun 27 22:32:42 localhost audit[1432]: ANOM_ABEND auid=3D1000 uid=3D1000
> >gid=3D1000 ses=3D1 pid=3D1432 comm=3D"gdbus" exe=3D"/usr/bin/tpm2_pcrlis=
t" sig=3D11
> >
> >Jun 27 22:32:42 localhost kernel: gdbus[1432]: segfault at 7f8327acc750 =
ip
> >00007f8327acc750 sp 00007f8326ab2c38 error 14 in
> >libtss2-mu.so.0.0.0[7f8328284000+3f000]
> >
> >Jun 27 22:32:42 localhost kernel[363]: gdbus[1432]: segfault at
> >7f8327acc750 ip 00007f8327acc750 sp 00007f8326ab2c38 error 14 in
> >libtss2-mu.so.0.0.0[7f8328284000+3f000]
> >
> >Trying to write to the TPM, e.g., take ownership, doesn't work at all:
> >
> >localhost:~$ tpm2_takeownership -o ownerpass -e endorsepass -l lockpass
> >
> >ERROR: Could not change hierarchy for Owner. TPM Error:0x9a2
> =

> I just recently learned about tpm2_rc_decode[1], it tells me:
> =

> $ ./tools/aux/tpm2_rc_decode 0x9a2
> tpm:session(1):authorization failure without DA implications
> =

> Is this TPM already configured? Have you replicated on more than one syst=
em?

100% recommend verifying this configuration on a more "typical" Linux
distro since this is nearly impossible for us to repro. Also WRL is
based on OpenEmbedded? Can you get a working system up on a stock Sumo
build?

Philip
_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://lists.01.org/mailman/listinfo/tpm2

**************************************************************
WRL8 is largely yocto based, so one-off OE recipes usually work with it.  T=
hat is, I think WRL8 uses a lot of OE recipes (perhaps even whole layers), =
but it has nothing for tpm2* stuff, so I've been using the OE recipes.   (W=
RL9 is all yocto, I've been told, getting rid of the last bits of proprieta=
ry WR stuff.)  But we're not using OE, i.e., Sumo, itself for a build envir=
onment; it's WR.  I'll see if I can figure out a way to do a stock Sumo bui=
ld.

Peter

--===============5828911671626350412==--

