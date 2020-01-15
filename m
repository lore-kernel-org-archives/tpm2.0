Content-Type: multipart/mixed; boundary="===============5407732266471614195=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Device Identity Attestation with tpm2-tools
Date: Wed, 15 Jan 2020 16:21:24 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E66BF7@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200115161350.2574.54954@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5407732266471614195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: nicolasoliver03(a)gmail.com [mailto:nicolasoliver03(a)gmail.com]
> Sent: Wednesday, January 15, 2020 10:14 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Device Identity Attestation with tpm2-tools
> =

> Thanks for that info,
> =

> For reference to others, TPM2_ChangeEPS and TPM2_ChangePPS can be found
> in https://www.trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-
> Part-3-Commands-01.38.pdf, page 280.
> =

> I noticed that the https://github.com/tpm2-software/tpm2-
> tools/blob/master/man/tpm2_changeeps.1.md man page is a copy of
> https://github.com/tpm2-software/tpm2-
> tools/blob/master/man/tpm2_changepps.1.md. I created an issue for that
> https://github.com/tpm2-software/tpm2-tools/issues/1887

Darn that's my fault, thanks for pointing that out!

> =

> An example for that 1% of the times is present here
> https://github.com/intel/INTEL-SA-00086-Linux-Recovery-Tools, where you h=
ave
> to regenerate the Endorsement Platform Seed after patching the Intel ME/T=
XE

Ahh yes I forgot about that one... Thanks!

> =

> Good to know that the endorsement key are not 100% immutable
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============5407732266471614195==--

