Content-Type: multipart/mixed; boundary="===============1061575166535829762=="
MIME-Version: 1.0
From: Martin Townsend <mtownsend1973 at gmail.com>
Subject: [tpm2] Re: tpm2_createek and transient EK problem
Date: Fri, 28 Feb 2020 15:36:40 +0000
Message-ID: <CABatt_xYtcXf5o4rn3=TG5udXT-97DzbHN=qqb0L08SAVxWs1A@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E96E21@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1061575166535829762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 2:45 PM Roberts, William C
<william.c.roberts(a)intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Roberts, William C [mailto:william.c.roberts(a)intel.com]
> > Sent: Friday, February 28, 2020 8:35 AM
> > To: Martin Townsend <mtownsend1973(a)gmail.com>; tpm2(a)lists.01.org
> > Subject: [tpm2] Re: tpm2_createek and transient EK problem
> >
> >
> >
> > > -----Original Message-----
> > > From: Martin Townsend [mailto:mtownsend1973(a)gmail.com]
> > > Sent: Friday, February 28, 2020 5:42 AM
> > > To: tpm2(a)lists.01.org
> > > Subject: [tpm2] tpm2_createek and transient EK problem
> > >
> > > Hi,
> > >
> > > I'm trying out the tpm2_createek tool and in the manual
> > > https://github.com/tpm2-software/tpm2-
> > > tools/blob/master/man/tpm2_createek.1.md
> > >
> > > It explains how to create a transient EK, I following these
> > > instructions but can't get them to work.  I've taken ownership of the
> > > TPM and created a SRK.  I then ran the command as listed in the manual
> > > page:
> > >
> > > tpm2_createek -G rsa -u ek.pub
> > > ERROR: Expected option -c
> > > Usage: tpm2_createek [<options>]
> > > Where <options> are:
> > >     [ -P | --eh-auth=3D<value>] [ -w | --owner-auth=3D<value>] [ -p |
> > > --ek- auth=3D<value>] [ -G | --key-algorithm=3D<value>]
> > >     [ -u | --public=3D<value>] [ -f | --format=3D<value>] [ -c |
> > > --ek-context=3D<value>] [ - t | --template=3D<value>]
> > >
> > > So I added the -c to save the context to disk and provide the EH auth=
orisation:
> > >
> > > tpm2_createek -G rsa -u ek.pub -c ek.ctx -P xxx echo $?
> > > 0
> > >
> > > so it looks like it's succeeded but I then try the to list the
> > > transient objects with
> > >
> > > tpm2_getcap handles-transient
> > >
> > > and I get nothing.  The files have been created
> >
> > So a resource manager will flush all transient objects when the client =
disconnects.
> > So in this case, when tpm2_createek exits, the RM flushes. This assumes=
 you're
> > Using a resource manager (RM), like tpm2-abrmd or the in kernel RM
> > /dev/tpmrm0.
> >
> > If you're not using an RM, and using the device directly  (/dev/tpm0), =
I am not
> > really sure why it wouldn't remain loaded.
> >
> > Once you have the transient EK in a context file, you can just pass tha=
t to any
> > tools -c or -C Option (depends on command and use). The tools will noti=
ce that
> > you need to restore the object from the context file and perform a Cont=
extLoad
> > command.
> >
> > Typically, the EK is persisted at a specific handle, I thought it was i=
n the PC client
> > spec or Credential Profile EK spec:
> >  https://trustedcomputinggroup.org/wp-
> > content/uploads/TCG_PC_Client_Platform_TPM_Profile_PTP_Specification_Fam
> > ily_2.0_Revision_1.3v22.pdf
> > https://trustedcomputinggroup.org/wp-
> > content/uploads/TCG_IWG_Credential_Profile_EK_V2.1_R13.pdf
> >
> > However, I can't find that handle, so perhaps I am miss remembering, bu=
t you
> > can persist it via the tpm2_evictcontrol command
> >
>
> Ahh the provisioning guide has it in Table 2:
> https://trustedcomputinggroup.org/wp-content/uploads/TCG-TPM-v2.0-Provisi=
oning-Guidance-Published-v1r1.pdf
>
> The EK should be persisted at: 0x81010001
>
> If you want to conform with the spec
>
>
>
>

Hi Wiliam,

Thank you for the reply, this is something I didn't know about the
resource manager.  I'm fairly new to TPM so I'm on a bit of a steep
learning curve.

I have no idea if it's using a resource manager, there is a ABRMD process:
tss        834     1  0 14:12 ?        00:00:00 /usr/sbin/tpm2-abrmd
and there is also the kernel device
ls -la /dev/tpmrm0
crw-rw---- 1 tss tss 253, 65536 Sep 21 14:11 /dev/tpmrm0

How would I know what the tools are using? Can I force it to not use a
resource manager to see if the transient object is there?

I have already tried the method of making the key persist and this
works fine but thank you for the proper handle value, I was using
0x81010000 :)
--===============1061575166535829762==--

