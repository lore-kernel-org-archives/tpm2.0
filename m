Content-Type: multipart/mixed; boundary="===============0082771539721783443=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] [tpm2-driver] Error at boot : A TPM error (256) occurred
 continue selftest
Date: Mon, 26 Aug 2019 15:39:50 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEEBFA@ORSMSX101.amr.corp.intel.com>
In-Reply-To: DB638850A6A2434A93ECADDA0BC838909CEB63D6@ORSMSX104.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0082771539721783443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Tricca, Philip B
> Sent: Monday, August 26, 2019 10:31 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; Gael GUEGAN
> <Gael.Guegan(a)non.se.com>; tpm2(a)lists.01.org; javierm(a)redhat.com
> Subject: RE: [tpm2] [tpm2-driver] Error at boot : A TPM error (256) occur=
red
> continue selftest
> =

> A bit more data on the "why": if the TPM receives a startup command when =
it is
> not required (TPM has *already* completed startup) then it will return
> TPM_RC_INITIALIZE (you can test this using the tpm2_startup command from
> tpm2-tools). By the time the kernel takes over the platform firmware shou=
ld

Ahh yes Section 9.3 of the commands doc is actually more clear than the Arc=
hitecture doc:
" Additional TPM2_Startup() commands are not allowed after it has completed=
 successfully. If a TPM requires
TPM2_Startup() and another command is received, or if the TPM receives TPM2=
_Startup() when it is not
required, the TPM shall return TPM_RC_INITIALIZE."

> have already initialized the TPM. The kernel sends a startup command rega=
rdless
> since we have no guarantee that the firmware did what it was supposed to =
do. So
> in the common case the kernel will receive this RC in response to the Sta=
rtup
> command.
> =

> Reporting this as an error is inaccurate but harmless. I'm not seeing thi=
s on my
> 4.19 kernel so this may have already been addressed upstream. Might be wo=
rth
> an email to the drivers maintainers if you can repro on a newer kernel.
> =

> Philip
> =

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Roberts, Wil=
liam C
> Sent: 23 August, 2019 10:22
> To: Gael GUEGAN <Gael.Guegan(a)non.se.com>; tpm2(a)lists.01.org;
> javierm(a)redhat.com
> Subject: Re: [tpm2] [tpm2-driver] Error at boot : A TPM error (256) occur=
red
> continue selftest
> =

> You should be able to ignore that. But I am unsure of what is leading you=
 to that
> state. Is someone Sending a selftest command before a startup command? The
> startup command, when not in field upgrade Mode, should be startup. So wh=
en
> the tpm initializes, it expects one of the first commands as described In=
 the spec:
> https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1-
> Architecture-01.38.pdf
> =

> The first command sent to the tpm should be a startup command..... you ca=
n see
> that in Figure 5 on page 57 Of the spec above and described in detail in =
section
> 12.2.2
> =

> Bill
> =

> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Gael GUEGAN
> > Sent: Thursday, August 8, 2019 3:35 AM
> > To: tpm2(a)lists.01.org; javierm(a)redhat.com
> > Subject: [tpm2] [tpm2-driver] Error at boot : A TPM error (256)
> > occurred continue selftest
> >
> > Hello all,
> >
> >
> >
> > I am working with the linux kernel version 4.9 on an embedded target.
> >
> > And I am having the following error message from the TPM driver at boot=
 :
> >
> >
> >
> > > $  dmesg | grep TPM
> >
> > [    2.946137] tpm_tis_spi spi32766.0: 2.0 TPM (device-id 0x0, rev-id 7=
8)
> >
> > [    2.975824] tpm tpm0: A TPM error (256) occurred continue selftest
> >
> >
> >
> > So I have seen that this error 256 correspond to TPM2_RC_INITIALIZE =3D
> > 0x0100, and that it is thrown  from this function
> > <https://github.com/torvalds/linux/blob/v4.9/drivers/char/tpm/tpm-
> > interface.c#L422>  (be32_to_cpu() when executing a tpm_transmit_cmd()).
> >
> >
> >
> > However can someone explain why I am having this error ? Is it
> > possible that it is because I am trying to access to the TPM during
> > its initialization phase / selftest phase ?
> >
> > Can I ignore this error without worry ?
> >
> >
> >
> >
> >
> > Thank for your help,
> >
> >
> >
> >
> >
> > Gael GUEGAN
> =

> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============0082771539721783443==--

