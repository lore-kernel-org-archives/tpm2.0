Content-Type: multipart/mixed; boundary="===============5714530047987702100=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Sharing TPM 2.0 between containers with access policy
Date: Thu, 18 Jun 2020 19:48:07 +0000
Message-ID: <DM6PR11MB34349B68ADB0500A2DC1B08DB89B0@DM6PR11MB3434.namprd11.prod.outlook.com>
In-Reply-To: AM0PR03MB416242FDEC6CFFC947E97C4DE39B0@AM0PR03MB4162.eurprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5714530047987702100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Oleksii Moisieiev <Oleksii_Moisieiev(a)epam.com>
> Sent: Thursday, June 18, 2020 1:21 PM
> To: Struk, Tadeusz <tadeusz.struk(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Sharing TPM 2.0 between containers with access policy
> =

> Hello Tadeusz.
> =

> Thank you for the answer.
> I've done some investigation and found that passing device /dev/tpmrm0 to=
 the
> containers will do the job. Also problem with tpm_clear can be solved by
> restriction owner access to the tpm. So each container can use keys in TP=
M but
> talk to owner if any changes is needed.
> =

> I have another question: According to the documentation - TPM is having u=
nique
> endoresement key, embedded to the device during manufacturing. So each
> module can be identified by this key.
> How can I retrieve this key embedded to the TPM module?

Only the  endorsement hierarchy primary seed (EPS) is embedded at manufactu=
ring time. So
Calls to tpm2_createprimary with the proper inputs will yield the same key =
every time. Calls
to tpm2_createek should create this for you. The calls to tpm2_getekcertifi=
cate should give you
that manufacturer certificate.

Details on this process can be found in this spec:
  - https://trustedcomputinggroup.org/wp-content/uploads/Credential_Profile=
_EK_V2.0_R14_published.pdf

> =

> Best regards,
> Oleksii.
> ________________________________
> =

> From: Tadeusz Struk <tadeusz.struk(a)intel.com>
> Sent: Friday, June 5, 2020 8:16 PM
> To: Oleksii Moisieiev <Oleksii_Moisieiev(a)epam.com>; tpm2(a)lists.01.org
> <tpm2(a)lists.01.org>
> Subject: Re: [tpm2] Sharing TPM 2.0 between containers with access policy
> =

> On 6/5/20 12:52 AM, Oleksii Moisieiev wrote:
> > Hello all,
> >
> > I have an embedded device, with Docker containers based architecture.
> > This device is operating by software, installed in separate containers.
> >
> >
> > I would like to share TPM2.0 access between this containers with the
> > following restrictions:
> >
> > 1) Forbid Clear TPM command for the containers;
> > 2) Each container should have an access only to the set of keys it owns.
> > 3) Each container can create keys, but not overwrite existing keys
> > that does not related to this container.
> >
> > According to the "TCG TSS 2.0 TAB and Resource Manager Specification"
> > - TPM Resource manager doesn't implement access restrictions right now.
> =

> I think you could run a separate instance of RM in per container to get
> 2 & 3. As for 1, this would need to be prevented on a platform configurat=
ion level,
> like in BIOS or equivalent.
> =

> Thanks,
> --
> Tadeusz

--===============5714530047987702100==--

