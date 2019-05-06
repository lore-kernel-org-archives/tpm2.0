Content-Type: multipart/mixed; boundary="===============2954679883565908434=="
MIME-Version: 1.0
From: Shiv Dev <shivfsdev at gmail.com>
Subject: Re: [tpm2] Creating TPM2 primary key failed!
Date: Mon, 06 May 2019 16:26:28 +0530
Message-ID: <CACX8e9N=smj_=UDfyLC5roMb=Zw8SfBMhYHqcNGA-wYnuwLGbg@mail.gmail.com>
In-Reply-To: 9e9ea2c7-cddc-608a-11bf-98adc044e6d8@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2954679883565908434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Javier,

Thanks for the response.

The tpm2_takeownership command output is shown below
--
[ubuntu(a)localhost ~]$ tpm2_takeownership -c
ERROR: Clearing Failed! TPM error code: 0x921
ERROR: Unable to run tpm2_takeownership
--
The error seems to be lockout now.
#define TPM2_RC_LOCKOUT            ((TPM2_RC) (TPM2_RC_WARN + 0x021))
/* authorizations for objects subject to DA protection are not allowed
at this time because the TPM is in DA lockout mode */

I tried to clear the dictionary lockout..
--
[ubuntu(a)localhost luks]$ tpm2_dictionarylockout -c
ERROR: 0x921 Error clearing dictionary lockout.
ERROR: Unable to run tpm2_dictionarylockout
--
Regards,
Shiv

On Mon, May 6, 2019 at 2:27 PM Javier Martinez Canillas
<javierm(a)redhat.com> wrote:
>
> Hello,
>
> On 5/6/19 7:49 AM, Shiv Dev wrote:
> > Hi,
> >
> >  I am facing an issue with tpm2 with PTT.  The  configuration is RHEL
> > 8 on an intel compute stick.
> >
> > Using clevis-luks-bind  to add a key to the root partition..
> >
> > sudo clevis-luks-bind -f -s 4 -k mykeyfile -d /dev/mmcblk0p3 tpm2
> > '{"pcr_bank":"sha1", "pcr_ids":"4,5,6,7,8,9,10"}'
> > ERROR:
> > CreatePrimary Failed ! ErrorCode: 0x902
> >
> > ERROR: Unable to run tpm2_createprimary
> > Creating TPM2 primary key failed!
> >
> > I believe it is a resource management issue as the abrmd is not being
> > used. I considered the following options.
> >
>
> Yes, your error is TPM2_RC_OBJECT_MEMORY. But clevis doesn't use the abrmd
> but the in-kernel RM (/dev/tpmrm?).
>
> Did you try executing tpm2_takeownership -c before trying to execute clev=
is?
>
> > 1.   As tpm2-flushcontext is not there in the tpm-tools 3.1.1, I built
> > it from the master branch.
> >
> > [ubuntu(a)localhost luks]$ tpm2_getcap -c handles-persistent
> > 0x81000001
> > 0x81010001
> > [ubuntu(a)localhost luks]$ ./tpm2_flushcontext.orig -c 0x81000001
> > WARNING:esys:src/tss2-esys/api/Esys_ReadPublic.c:316:Esys_ReadPublic_Fi=
nish()
> > Received TPM Error
> > ERROR:esys:src/tss2-esys/esys_tr.c:217:Esys_TR_FromTPMPublic_Finish()
> > Error ReadPublic ErrorCode (0x00000902)
> > ERROR:esys:src/tss2-esys/esys_tr.c:307:Esys_TR_FromTPMPublic() Error
> > TR FromTPMPublic ErrorCode (0x00000902)
> > ERROR: Esys_TR_FromTPMPublic(0x902) - tpm:warn(2.0): out of memory for
> > object contexts
> > ERROR: Unable to run ./tpm2_flushcontext.orig
> >
> > 2. I started the tpm2-abrmd process, and then tried the above command.
> >
> > [ubuntu(a)localhost luks]$ sudo systemctl start tpm2-abrmd
> > [sudo] password for ubuntu:
> > [ubuntu(a)localhost luks]$ ps -ef | grep abrmd
> > tss       8014     1  0 10:44 ?        00:00:00 /usr/sbin/tpm2-abrmd
> > ubuntu    8571  7931  0 11:17 pts/0    00:00:00 grep --color=3Dauto abr=
md
> > [ubuntu(a)localhost luks]$ ./tpm2_flushcontext.orig -c 0x81000001
> > WARNING:esys:src/tss2-esys/api/Esys_ReadPublic.c:316:Esys_ReadPublic_Fi=
nish()
> > Received TPM Error
> > ERROR:esys:src/tss2-esys/esys_tr.c:217:Esys_TR_FromTPMPublic_Finish()
> > Error ReadPublic ErrorCode (0x00000902)
> > ERROR:esys:src/tss2-esys/esys_tr.c:307:Esys_TR_FromTPMPublic() Error
> > TR FromTPMPublic ErrorCode (0x00000902)
> > ERROR: Esys_TR_FromTPMPublic(0x902) - tpm:warn(2.0): out of memory for
> > object contexts
> > ERROR: Unable to run ./tpm2_flushcontext.orig
> >
> > Not sure if the above approaches are correct. Request you to suggest
> > any thing else that I can try.
> >
> > Regards,
> > Shiv
> > _______________________________________________
> > tpm2 mailing list
> > tpm2(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/tpm2
> >
>
> Best regards,
> --
> Javier Martinez Canillas
> Software Engineer - Desktop Hardware Enablement
> Red Hat

--===============2954679883565908434==--

