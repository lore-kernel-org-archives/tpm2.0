Content-Type: multipart/mixed; boundary="===============8280316439507680754=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] [tpm2-driver] Error at boot : A TPM error (256) occurred
 continue selftest
Date: Fri, 23 Aug 2019 17:21:32 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEE4ED@ORSMSX101.amr.corp.intel.com>
In-Reply-To: DBBPR04MB6123C606D3A97FA0538D57DFDCD70@DBBPR04MB6123.eurprd04.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8280316439507680754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You should be able to ignore that. But I am unsure of what is leading you t=
o that state. Is someone
Sending a selftest command before a startup command? The startup command, w=
hen not in field upgrade
Mode, should be startup. So when the tpm initializes, it expects one of the=
 first commands as described
In the spec:
https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1-Arc=
hitecture-01.38.pdf

The first command sent to the tpm should be a startup command..... you can =
see that in Figure 5 on page 57
Of the spec above and described in detail in section 12.2.2

Bill

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Gael GUEGAN
> Sent: Thursday, August 8, 2019 3:35 AM
> To: tpm2(a)lists.01.org; javierm(a)redhat.com
> Subject: [tpm2] [tpm2-driver] Error at boot : A TPM error (256) occurred =
continue
> selftest
> =

> Hello all,
> =

> =

> =

> I am working with the linux kernel version 4.9 on an embedded target.
> =

> And I am having the following error message from the TPM driver at boot :
> =

> =

> =

> > $  dmesg | grep TPM
> =

> [    2.946137] tpm_tis_spi spi32766.0: 2.0 TPM (device-id 0x0, rev-id 78)
> =

> [    2.975824] tpm tpm0: A TPM error (256) occurred continue selftest
> =

> =

> =

> So I have seen that this error 256 correspond to TPM2_RC_INITIALIZE =3D 0=
x0100,
> and that it is thrown  from this function
> <https://github.com/torvalds/linux/blob/v4.9/drivers/char/tpm/tpm-
> interface.c#L422>  (be32_to_cpu() when executing a tpm_transmit_cmd()).
> =

> =

> =

> However can someone explain why I am having this error ? Is it possible t=
hat it is
> because I am trying to access to the TPM during its initialization phase =
/ selftest
> phase ?
> =

> Can I ignore this error without worry ?
> =

> =

> =

> =

> =

> Thank for your help,
> =

> =

> =

> =

> =

> Gael GUEGAN


--===============8280316439507680754==--

