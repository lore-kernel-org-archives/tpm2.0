Content-Type: multipart/mixed; boundary="===============0533366361578192790=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Problem with tpm2_unseal after reboot
Date: Tue, 11 Dec 2018 20:12:57 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649CBA378@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20A6FE0AC912764FB8B5BC5A1A7CB92B2FA00963@fmsmsx101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0533366361578192790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Oliver, Dario N
> Sent: Monday, December 10, 2018 7:01 PM
> To: Javier Martinez Canillas <javierm(a)redhat.com>
> Cc: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: RE: [tpm2] Problem with tpm2_unseal after reboot
> =

> I have good and bad news :)
> =

> =

> =

> Good news:
> =

> =

> =

> I tested this in my NUC, the exact same process described below, and after
> rebooting the device, I was able to unseal the secret without problems. B=
ut I
> noticed that my persistent objects were several, so I tried to tpm2_evict=
control
> them to clean up. The command failed, and I tried a tpm2_takeownership =
=E2=80=93c, and
> it failed with =E2=80=9Cauthorization failure without DA implications=E2=
=80=9D. I got in an error state
> again, so I tried to do a TPM clear (by removing the security jumper in t=
he NUC).
> Each time I send a tpm clear with that process, and boot again, my persis=
tent
> objects are still there, and I run into the same errors. No luck with the=
 NUC.
> =

> =

> =

> I moved back to my fitlet2 with fTPM, and flash the firmware again, I wan=
ted to
> test again with a clean state. Then, I cleared the TPM using the BIOS men=
u in the
> fitlet. I reboot the device, and do a tpm2_listpersistent, everything is =
clean now! I
> tested the process described below, and now I can unseal my secret after
> reboot. So, flashing the firmware again, and clearing the TPM solved my p=
roblem.
> After 3 reboots, I am still able to get my secret.
> =

> =

> =

> Bad News:
> =

> =

> =

> 1.       I don=E2=80=99t know why I run into that error state after tryin=
g to do
> tpm2_evictcontrol (to clear persistent objects), or tpm2_takeownership =
=E2=80=93c. For a
> =E2=80=9Creal=E2=80=9D scenario, having to completely reset the device (a=
nd loose the secrets in
> the tpm) Is not an option. So I wonder how you recover from this state?

I don=E2=80=99t know offhand how to recover.

> =

> 2.       I am unable to clear the TPM in a NUC! I will keep looking at
> =

> 3.       Your statement that =E2=80=9Cthe primary object is not persisted=
=E2=80=9D made sense to
> me, until I get it working after the tpm2 clear in the BIOS. Now I have l=
ess idea of
> which will be the explanation of what happened.

I am very surprised that works, but perhaps the TPM does some magic when pe=
rsisting
an object I am not aware of.

> =

> =

> =

> My problem is solved, and I thank you for your help and time.

That's at least one positive

> =

> =

> =

> If you want to enlighten me why I run into that error state, it will be g=
reat for me
> :)
> =

> =

> =

> Thank you!
> =

> =

> =

> From: Javier Martinez Canillas [mailto:javierm(a)redhat.com]
> Sent: Monday, December 10, 2018 2:18 PM
> To: Oliver, Dario N <dario.n.oliver(a)intel.com>
> Cc: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: Re: [tpm2] Problem with tpm2_unseal after reboot
> =

> =

> =

> Hello,
> =

> =

> =

> I don=E2=80=99t have access to a machine with a TPM2 now but I=E2=80=99ll=
 test it tomorro.
> =

> =

> =

> I think Bill is right here though and the problem is that the primary key=
 isn=E2=80=99t
> present in the TPM2.
> =

> =

> =

> Could you please execute the tpm2_primary command after the reboot? The
> primary keys are generated using a key derivation function that=E2=80=99s=
 deterministic
> using the hierarchy seed so the PK should be the same.
> =

> =

> =

> Best regards,
> =

> Javier
> =

> =

> =

> On Mon, 10 Dec 2018 at 22:37, Oliver, Dario N <dario.n.oliver(a)intel.com
> <mailto:dario.n.oliver(a)intel.com> > wrote:
> =

> The only persistent object I see with tpm2_listpersistent is the child ob=
ject. So I
> think the parent is not being persisted.
> =

> I am trying again the same set of commands in a NUC device, just to see i=
f the
> problem is not the device itself. After that, I will try you approach and=
 persist the
> primary object as well. Hope that works
> =

> It is possible that our approach to persist the secret is wrong. in that =
case, do you
> have some docs showing a sealing process that is expected to work with pcr
> policies with the versions I am using?
> =

> Thank you!
> =

> -----Original Message-----
> From: Roberts, William C
> Sent: Monday, December 10, 2018 1:31 PM
> To: Oliver, Dario N <dario.n.oliver(a)intel.com <mailto:dario.n.oliver(a)=
intel.com>
> >; tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> Subject: RE: Problem with tpm2_unseal after reboot
> =

> Oliver,
> =

> I wonder if this some weird side-effect. I have never had a persistent ob=
ject
> under a non-persistent object, does this cause the primary object to pers=
ist as
> well? I wonder how you could persist a child object when the primary pare=
nt
> object is unloaded since the primary object seed protects it's children.
> =

> What happens if you persist the primary object as well?
> =

> Bill
> =

> =

> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org
> > <mailto:tpm2-bounces(a)lists.01.org> ] On Behalf Of Oliver, Dario N
> > Sent: Friday, December 7, 2018 2:36 PM
> > To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > Subject: [tpm2] Problem with tpm2_unseal after reboot
> >
> > Hello!
> >
> >
> >
> > I am currently having problems to unseal a secret from the tpm.
> >
> > I hope that you can detect the issue in my instructions below :)
> >
> >
> >
> > The versions that I am using are the following:
> >
> > 1.       Tpm2-tss 2.0.0
> >
> > 2.       Tpm2-abrmd 2.0.0
> >
> > 3.       Tpm2-tools 3.1.0
> >
> >
> >
> > The platform I am using is a Compulab Fitlet2 device (Intel Atom
> > x5-E3950 Apollo Lake), with Fedora 28 and Linux kernel 4.19.x.
> >
> > In this case, the device support firmware tpm, and it is enabled in
> > the BIOS
> > (fTPM)
> >
> >
> >
> > So, after installing the tpm2 stack from github releases, I am sealing
> > a secret with the following commands:
> >
> >
> >
> > # Create a random secret to be saved in the TPM
> >
> > tpm2_getrandom 32 --output key.bin
> >
> >
> >
> > # I use a pcr policy on sha1 banks 0 and 1, this gets the pcr state
> >
> > tpm2_pcrlist --sel-list sha1:0,1 --output pcr_state.bin
> >
> >
> >
> > # Create a policy with those PCR
> >
> > tpm2_createpolicy --policy-pcr --set-list sha1:0,1 \
> >
> >                   --pcr-input-file pcr_state.bin
> >
> >                   --policy-file policy.bin
> >
> >
> >
> > # Create a primary object with endorsement hierarchy
> >
> > tpm2_createprimary --hierarchy e --halg sha1 --kalg rsa --context
> > primary.context
> >
> >
> >
> > # Create an object to be loaded in the TPM
> >
> > tpm2_create --halg sha256 --kalg keyedhash --pubfile key.pub
> > --privfile key.priv \
> >
> >             --context-parent primary.context --policy-file policy.bin
> > \
> >
> >            --object-attributes
> > "fixedtpm|fixedparent|noda|adminwithpolicy" --in-file key.bin
> >
> >
> >
> > # Load the object in the TPM
> >
> > tpm2_load --context-parent primary.context --pubfile key.pub
> > --privfile key.priv \
> >
> >           --context load.context
> >
> >
> >
> > # Persist the object in the TPM
> >
> > tpm2_evictcontrol --auth o --context load.context --persistent
> > 0x81010002
> >
> >
> >
> > # Check if the object is persisted, looks good
> >
> > tpm2_listpersistent
> >
> > persistent-handle[0]:0x81010002 key-alg:keyedhash hash-alg:sha256
> > object- attr:fixedtpm|fixedparent|noda|adminwithpolicy
> >
> >
> >
> > # Unseal the object, works!
> >
> > tpm2_unseal --item 0x81010002 --set-list sha1:0,1 > compare_key.bin
> >
> >
> >
> > # Compare original and unsealed objects, the match :)
> >
> > diff compare_key.bin key.bin
> >
> >
> >
> > ##############
> >
> > # After this initial setup, I reboot the device, and try to unseal the
> > secret again
> >
> > ##############
> >
> >
> >
> > # After reboot, open a terminal an do
> >
> > tpm2_unseal --item 0x81010002 --set-list sha1:0,1 >
> > compare_disk_key.bin
> >
> > ERROR: Sys_Unseal failed. Error Code: 0x99d
> >
> > ERROR: Unseal failed!
> >
> > ERROR: Unable to run tpm2_unseal
> >
> >
> >
> > # Use tpm2_rc_decode to decode the error message 0x99d, it is a policy
> > check error!
> >
> > tpm2_rc_decode 0x99d
> >
> > error layer
> >
> >     hex: 0x0
> >
> >     identifier: TSS2_TPM_RC_LAYER
> >
> >     description: Error produced by the TPM
> >
> > format 1 error code
> >
> >     hex: 0x1d
> >
> >     identifier: TPM2_RC_POLICY_FAIL
> >
> >     description: a policy check failed
> >
> > session
> >
> >     hex: 0x100
> >
> >     identifier: TPM2_RC_1
> >
> >     description: (null)
> >
> >
> >
> > ###############
> >
> > # I checked the PCR 0,1, and they have the same values as at the
> > moment to seal the object.
> >
> > # So I don't understand why I am having a "TPM2_RC_POLICY_FAIL" error.
> >
> > # I tried the same process several times, and each time I end up in
> > the same error state.
> >
> > ###############
> >
> >
> >
> > Is there something I am missing here?
> >
> > Is something additional I need to do to satisfy the policy to unseal th=
e data?
> >
> > Any help is appreciated!
> >
> >
> >
> > Thank you in advance.
> >
> >
> >
> >
> >
> >
> =

> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> https://lists.01.org/mailman/listinfo/tpm2


--===============0533366361578192790==--

