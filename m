Content-Type: multipart/mixed; boundary="===============8174338559509378479=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2-tools tpm2_takeownership w/ Intel NUC
Date: Tue, 24 Jul 2018 18:28:12 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C07E14@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 15CA292A0CD93849BA2105D0F0B2D8A1EB96EA53@ORSMSX105.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8174338559509378479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Decoding that error provides:
tpm2_rc_decode 0x9a2tpm:session(1):authorization failure without DA implica=
tions

-c option only toggles the clear bit on tpm2_clear and it requires the Lock=
out Auth value.
Perhaps something else is getting to the Lockout auth and setting it before=
 you?

FYI releases greater than 3.X no longer have the tpm2_takeownership tool, i=
t was split apart in:
https://github.com/tpm2-software/tpm2-tools/pull/703


> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Agerstam, Ma=
ts G
> Sent: Friday, July 20, 2018 3:01 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] tpm2-tools tpm2_takeownership w/ Intel NUC
> =

> Hi,
> =

> =

> =

> I'm pretty new to the TPM toolset, but have been struggling a bit getting=
 some of
> the fundamental pieces working. The issue I'm running into is when trying=
 to take
> ownership of the TPM which results in an error:
> =

> ERROR: Could not change hierarchy for Owner. TPM Error:0x9a2
> =

> =

> =

> Even though I have not been successful in previously trying to take owner=
ship,
> tried to run with the -c option, which resulted in
> =

> ERROR: Clearing Failed! TPM error code: 0x921. Looking at the meaning of =
the
> result code it indicated TPM_RC_LOCKOUT.
> =

> =

> =

> Other basic commands, like getting random numbers through tpm_getrandom
> [x] works fine.
> =

> =

> =

> I have a NUC 7i7BNH, BIOS version 56 (from Oct 2017), Ubuntu 16.04 Kernel
> version 4.13.0-45. I'm currently running tpm2-tools 2.1.0, tpm2-tss-2.0.0=
 and
> tpm2-abrmd 1.1.1.
> =

> =

> =

> I have additionally tried to take out the BIOS security jumper, resetting=
/clearing
> the TPM and retrying, without any success. Any guidance or tips on what c=
ould be
> causing this?
> =

> =

> =

> Thanks,
> =

>    Mats
> =

> =



--===============8174338559509378479==--

