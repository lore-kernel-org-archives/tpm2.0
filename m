Content-Type: multipart/mixed; boundary="===============2538388343031782996=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: Re: [tpm2] getting segfaults with tss-2.0.0, abrmd-2.0.0, tools-3.1.0
Date: Thu, 19 Jul 2018 11:24:23 +0100
Message-ID: <eac55281-2b3f-1d1f-132c-65c99883fde3@linux.intel.com>
In-Reply-To: b8a792c20cf64e448d1a3e8f4252f0b3@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2538388343031782996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 18/07/2018 22:17, Scheie, Peter M wrote:
> By the way, does abrmd default to trying to connect to /dev/tpm0?=C2=A0 W=
hen =

> working with the emulator on my laptop, I have to start abrmd with =

> '--tcti=3Dlibtss2-tcti-mssim.so' but I assume that's just for when there =

> is no TPM device, right?

Correct, if no --tcti value is passed abrmd defaults to using the device =

tcti:
https://github.com/tpm2-software/tpm2-abrmd/blob/2296d48a1004aff5f93d6ec23a=
50819f2a5c5584/src/tcti-dynamic.c#L138

At line 142 you can see where the default value of the TCTI library file =

property is set to "libtss2-tcti-device.so".

> So, with tpm2-abrmd running, if I call, say, tpm2_pcrlist or =

> tpm2_nvlist, to just query the TPM, it will display the PCRs or the NV =

> indexes but then follow that with a "Segmentation fault", and syslog =

> shows things like this:
> =

> Jun 27 22:32:42 localhost audit[1432]: ANOM_ABEND auid=3D1000 uid=3D1000 =

> gid=3D1000 ses=3D1 pid=3D1432 comm=3D"gdbus" exe=3D"/usr/bin/tpm2_pcrlist=
" sig=3D11
> =

> Jun 27 22:32:42 localhost kernel: gdbus[1432]: segfault at 7f8327acc750 =

> ip 00007f8327acc750 sp 00007f8326ab2c38 error 14 in =

> libtss2-mu.so.0.0.0[7f8328284000+3f000]
> =

> Jun 27 22:32:42 localhost kernel[363]: gdbus[1432]: segfault at =

> 7f8327acc750 ip 00007f8327acc750 sp 00007f8326ab2c38 error 14 in =

> libtss2-mu.so.0.0.0[7f8328284000+3f000]
> =

> Trying to write to the TPM, e.g., take ownership, doesn't work at all:
> =

> localhost:~$ tpm2_takeownership -o ownerpass -e endorsepass -l lockpass
> =

> ERROR: Could not change hierarchy for Owner. TPM Error:0x9a2

I just recently learned about tpm2_rc_decode[1], it tells me:

$ ./tools/aux/tpm2_rc_decode 0x9a2
tpm:session(1):authorization failure without DA implications

Is this TPM already configured? Have you replicated on more than one system?

Joshua

--===============2538388343031782996==--

