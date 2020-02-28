Content-Type: multipart/mixed; boundary="===============5382456137171016757=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_createek and transient EK problem
Date: Fri, 28 Feb 2020 14:45:35 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E96E21@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E96DEE@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5382456137171016757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Roberts, William C [mailto:william.c.roberts(a)intel.com]
> Sent: Friday, February 28, 2020 8:35 AM
> To: Martin Townsend <mtownsend1973(a)gmail.com>; tpm2(a)lists.01.org
> Subject: [tpm2] Re: tpm2_createek and transient EK problem
> =

> =

> =

> > -----Original Message-----
> > From: Martin Townsend [mailto:mtownsend1973(a)gmail.com]
> > Sent: Friday, February 28, 2020 5:42 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] tpm2_createek and transient EK problem
> >
> > Hi,
> >
> > I'm trying out the tpm2_createek tool and in the manual
> > https://github.com/tpm2-software/tpm2-
> > tools/blob/master/man/tpm2_createek.1.md
> >
> > It explains how to create a transient EK, I following these
> > instructions but can't get them to work.  I've taken ownership of the
> > TPM and created a SRK.  I then ran the command as listed in the manual
> > page:
> >
> > tpm2_createek -G rsa -u ek.pub
> > ERROR: Expected option -c
> > Usage: tpm2_createek [<options>]
> > Where <options> are:
> >     [ -P | --eh-auth=3D<value>] [ -w | --owner-auth=3D<value>] [ -p |
> > --ek- auth=3D<value>] [ -G | --key-algorithm=3D<value>]
> >     [ -u | --public=3D<value>] [ -f | --format=3D<value>] [ -c |
> > --ek-context=3D<value>] [ - t | --template=3D<value>]
> >
> > So I added the -c to save the context to disk and provide the EH author=
isation:
> >
> > tpm2_createek -G rsa -u ek.pub -c ek.ctx -P xxx echo $?
> > 0
> >
> > so it looks like it's succeeded but I then try the to list the
> > transient objects with
> >
> > tpm2_getcap handles-transient
> >
> > and I get nothing.  The files have been created
> =

> So a resource manager will flush all transient objects when the client di=
sconnects.
> So in this case, when tpm2_createek exits, the RM flushes. This assumes y=
ou're
> Using a resource manager (RM), like tpm2-abrmd or the in kernel RM
> /dev/tpmrm0.
> =

> If you're not using an RM, and using the device directly  (/dev/tpm0), I =
am not
> really sure why it wouldn't remain loaded.
> =

> Once you have the transient EK in a context file, you can just pass that =
to any
> tools -c or -C Option (depends on command and use). The tools will notice=
 that
> you need to restore the object from the context file and perform a Contex=
tLoad
> command.
> =

> Typically, the EK is persisted at a specific handle, I thought it was in =
the PC client
> spec or Credential Profile EK spec:
>  https://trustedcomputinggroup.org/wp-
> content/uploads/TCG_PC_Client_Platform_TPM_Profile_PTP_Specification_Fam
> ily_2.0_Revision_1.3v22.pdf
> https://trustedcomputinggroup.org/wp-
> content/uploads/TCG_IWG_Credential_Profile_EK_V2.1_R13.pdf
> =

> However, I can't find that handle, so perhaps I am miss remembering, but =
you
> can persist it via the tpm2_evictcontrol command
> =


Ahh the provisioning guide has it in Table 2:
https://trustedcomputinggroup.org/wp-content/uploads/TCG-TPM-v2.0-Provision=
ing-Guidance-Published-v1r1.pdf

The EK should be persisted at: 0x81010001

If you want to conform with the spec




--===============5382456137171016757==--

