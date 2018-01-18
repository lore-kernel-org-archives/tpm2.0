Content-Type: multipart/mixed; boundary="===============8187295338985962644=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2-tss question
Date: Thu, 18 Jan 2018 18:11:18 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FED5895@ORSMSX101.amr.corp.intel.com>
In-Reply-To: c8a3b29c-20b9-b384-7e79-07a3f700a14f@ntt-el.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8187295338985962644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Yasuhiro Hosoda [mailto:hosoda-yasuhiro(a)ntt-el.com]
> Sent: Thursday, January 18, 2018 6:44 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: Re: [tpm2] tpm2-tss question
> =

> I appreciate much for your help. I am expecting for your information abou=
t tpm2-
> tools.

What information are you expecting?

> >
> >> -----Original Message-----
> >> From: Yasuhiro Hosoda [mailto:hosoda-yasuhiro(a)ntt-el.com]
> >> Sent: Friday, January 12, 2018 1:47 AM
> >> To: Roberts, William C <william.c.roberts(a)intel.com>;
> >> tpm2(a)lists.01.org
> >> Subject: Re: [tpm2] tpm2-tss question
> >>
> >> Hi, Mr. Roberts, William
> >>
> >> Thank you for your advice.
> >> I had already checked the details of this error code.
> >> My understanding is that the problem is not the setting of the auth
> >> but there occurs the discrepancy between the virtual handles and the
> >> real handles in the resource manager.
> > Unless you took an RM virtualized handle and went directly to the TPM
> > with it, there shouldn't Be a problem. The RM should be swapping out
> > virtualized handles with real ones for you before They hit the tpm, and=
 thus,
> should be transparent.
> >
> > As far as what the problem is, it's hard to tell offhand. I would look
> > at how the tpm2-tools do it, they make for decent reference code.
> >
> >> Any help will be greatly appreciated
> >>
> >> Regard,
> >>> 0x98e is:
> >>>
> >>> $ ./tpm2_rc_decode 0x98e
> >>> error layer
> >>>     hex: 0x0
> >>>     identifier: TSS2_TPM_RC_LAYER
> >>>     description: Error produced by the TPM format 1 error code
> >>>     hex: 0x0e
> >>>     identifier: TPM2_RC_AUTH_FAIL
> >>>     description: the authorization HMAC check failed and DA counter
> >>> incremented session
> >>>     hex: 0x100
> >>>     identifier: TPM2_RC_1
> >>>     description:  (null)
> >>>
> >>> SO it looks like you're not setting up the auth properly in the sessi=
on.
> >>>
> >>>> -----Original Message-----
> >>>> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Yasuhiro
> >>>> Hosoda
> >>>> Sent: Wednesday, December 13, 2017 10:59 PM
> >>>> To: tpm2(a)lists.01.org
> >>>> Subject: [tpm2] tpm2-tss question
> >>>>
> >>>> MY name is Yasuhiro Hosoda.
> >>>>
> >>>>
> >>>> I am developing a program using TSS1.0(Nov=EF=BC=91=EF=BC=8E2016).
> >>>> I encountered a problem with PolicySecret error 0x98e and need help.
> >>>> My program uses tpmtest.cpp as a base of development.
> >>>> The situation is as follows:
> >>>>
> >>>> 1 Create TPM Keys like this.
> >>>>
> >>>> EK
> >>>> =EF=BD=9C--------
> >>>> =EF=BD=9C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 |
> >>>> MK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AK
> >>>> =EF=BD=9C
> >>>> SK
> >>>>
> >>>> 2 Execute PolicySecret twice using HMAC session. At first, it ends
> >>>> without
> >> error.
> >>>> Then it ends with 0x98e For clarification, I print out the values
> >>>> of Virtual Handle and Real Handle.
> >>>> The value of Virtual/Real Handles differ at 2nd excution of the comm=
and.
> >>>> (See NO 25/26 Below)
> >>>>
> >>>> I understand that the resource manager assigns Virtual Handle and
> >>>> my program calculates HMAC using that handles.
> >>>> On the other hand, TPM may calculate HMAC using Real Handle.
> >>>> That is my hypothesis.
> >>>>
> >>>> Any suggestion about the usage of Session Handle?
> >>>>
> >>>> NO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Command=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Virtual/Real Handle=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 LOC 1.
> >>>> CreatePrimary(EK) real=3D80000000, virtual=3D80000000 8381 2.
> >>>> HierarchyChangeAuth1 8421 3.=C2=A0=C2=A0=C2=A0 HierarchyChangeAuth2 =
8431 4.
> >>>> StartAuthSession(Policy) real=3D3000000,
> >>>> virtual=3D3000000 8480 5.=C2=A0=C2=A0=C2=A0 PolicySecret(ENDORSEMENT=
) 8494 6.
> >>>> Create(MK) 8515 7.=C2=A0=C2=A0=C2=A0 PolicySecret(ENDORSEMENT) 8529 =
8.=C2=A0=C2=A0=C2=A0 Load(MK)
> >>>> real=3D80000001,
> >>>> virtual=3D80000001 8542 9.=C2=A0=C2=A0=C2=A0 Evict(MK) 8552 10.=C2=
=A0=C2=A0=C2=A0 Create(SK) 8590 11.
> >>>> Load(SK) real=3D80000001, virtual=3D80000002 8598 12.
> >>>> PolicySecret(ENDORSEMENT) 8609 13.=C2=A0=C2=A0=C2=A0 Create(AK) 8635=
 14.
> >>>> PolicySecret(ENDORSEMENT) 8645 15.=C2=A0=C2=A0=C2=A0 Load(AK) real=
=3D80000001,
> >>>> virtual=3D80000003 8655 16.=C2=A0=C2=A0=C2=A0 FlushContext(POLICY) 8=
664 17.
> >>>> StartAuthSession(POLICY) real=3D3000000, virtual=3D3000000 8668 18.
> >>>> StartAuthSession(HMAC) real=3D2000001, virtual=3D2000001 8678 19.
> >>>> ComputeCommandHMAC(LoadExternal) real=3D80000000, virtual=3D80000004
> >>>> 3706 20.=C2=A0=C2=A0=C2=A0 ComputeCommandHMAC(HMAC_Start) real=3D800=
00001,
> >>>> virtual=3D80000005 3706 21.=C2=A0=C2=A0=C2=A0 PolicySecret(SK) 8711 =
22.
> >>>> FlushContext(HMAC) 8717 23.=C2=A0=C2=A0=C2=A0 FlushContext(POLICY) 8=
724 24.
> >>>> CertifyCreation(SK) 8738 25.=C2=A0=C2=A0=C2=A0 StartAuthSession(POLI=
CY)
> >>>> real=3D3000000, virtual=3D3000001 8745 26.=C2=A0=C2=A0=C2=A0 StartAu=
thSession(HMAC)
> >>>> real=3D2000001, virtual=3D2000000 8754 27.
> >>>> ComputeCommandHMAC(LoadExternal) real=3D80000000, virtual=3D80000005
> >>>> 8782 28.=C2=A0=C2=A0=C2=A0 ComputeCommandHMAC(HMAC_Start) real=3D800=
00001,
> >>>> virtual=3D80000004 8782 29.=C2=A0=C2=A0=C2=A0 PolicySecret(SK) 8789
> >>>>
> >>>> The whole=C2=A0 source program can be found here.
> >>>> https://github.com/intel/tpm2-tss/files/1516612/tpmtest.cpp_0x98e_2
> >>>> .t
> >>>> xt
> >>>>
> >>>>
> >>>> Kind regards,
> >>>>
> >>>> --
> >>>> Yasuhiro Hosoda
> >>>>
> >>>> NTT Electronics Corporation =EF=BC=88NEL)
> >>>> Security Support Project
> >>>>
> >>>>
> >>>> _______________________________________________
> >>>> tpm2 mailing list
> >>>> tpm2(a)lists.01.org
> >>>> https://lists.01.org/mailman/listinfo/tpm2
> >>


--===============8187295338985962644==--

