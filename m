Content-Type: multipart/mixed; boundary="===============4815617464988383434=="
MIME-Version: 1.0
From: Yasuhiro Hosoda <hosoda-yasuhiro at ntt-el.com>
Subject: Re: [tpm2] tpm2-tss question
Date: Thu, 08 Feb 2018 22:26:09 +0900
Message-ID: <1a5a28dc-433b-29a1-b1c1-e92e23e0b929@ntt-el.com>
In-Reply-To: a4ce55c6-fb04-c970-1fe7-b7a190a52741@ntt-el.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4815617464988383434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You said in the former mail that
"Unless you took an RM virtualized handle and went directly to the TPM
with it, there shouldn't Be a problem"
I have checked again and found that my program uses an RM
virtualized handle for computing HMAC and if I substitute the virtual
handle to real one, the error 0x98e disappears,
Any advice?

> Thank you for your reply.
>
> Where can I find necessary information for "get HMAC to work"?
>
> And, where can I find extended-sessions.sh?
>
> Many thanks.
>> test/system/tests/tcti/abrmd/extended-sessions.sh
>>
>> That uses abrmd which has an RM extension to allow session handles
>> to be marked for non-flushing on client disconnection, but that
>> point likely won't concern you.
>>
>> This test script uses tools that start a pcr policy session, satisfy =

>> or build the policy,
>> and use it for unsealing data.
>>
>> It might be good to see if you can get HMAC to work in this framework =

>> from a
>> Learning perspective and then you could contribute hmac policy =

>> session support
>> Back to the tools.
>>
>>
>>> -----Original Message-----
>>> From: Yasuhiro Hosoda [mailto:hosoda-yasuhiro(a)ntt-el.com]
>>> Sent: Thursday, January 18, 2018 3:11 PM
>>> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01=
.org
>>> Subject: Re: [tpm2] tpm2-tss question
>>>
>>> You said that "I would look at how the tpm2-tools do it, they make =

>>> for decent
>>> reference code."
>>> Would you tell me the place of tpm2-tools where I should look as =

>>> reference code.
>>> Regards,
>>>
>>>>> -----Original Message-----
>>>>> From: Yasuhiro Hosoda [mailto:hosoda-yasuhiro(a)ntt-el.com]
>>>>> Sent: Thursday, January 18, 2018 6:44 AM
>>>>> To: Roberts, William C <william.c.roberts(a)intel.com>; =

>>>>> tpm2(a)lists.01.org
>>>>> Subject: Re: [tpm2] tpm2-tss question
>>>>>
>>>>> I appreciate much for your help. I am expecting for your =

>>>>> information about
>>> tpm2-
>>>>> tools.
>>>> What information are you expecting?
>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Yasuhiro Hosoda [mailto:hosoda-yasuhiro(a)ntt-el.com]
>>>>>>> Sent: Friday, January 12, 2018 1:47 AM
>>>>>>> To: Roberts, William C <william.c.roberts(a)intel.com>;
>>>>>>> tpm2(a)lists.01.org
>>>>>>> Subject: Re: [tpm2] tpm2-tss question
>>>>>>>
>>>>>>> Hi, Mr. Roberts, William
>>>>>>>
>>>>>>> Thank you for your advice.
>>>>>>> I had already checked the details of this error code.
>>>>>>> My understanding is that the problem is not the setting of the auth
>>>>>>> but there occurs the discrepancy between the virtual handles and =

>>>>>>> the
>>>>>>> real handles in the resource manager.
>>>>>> Unless you took an RM virtualized handle and went directly to the =

>>>>>> TPM
>>>>>> with it, there shouldn't Be a problem. The RM should be swapping out
>>>>>> virtualized handles with real ones for you before They hit the =

>>>>>> tpm, and thus,
>>>>> should be transparent.
>>>>>> As far as what the problem is, it's hard to tell offhand. I would =

>>>>>> look
>>>>>> at how the tpm2-tools do it, they make for decent reference code.
>>>>>>
>>>>>>> Any help will be greatly appreciated
>>>>>>>
>>>>>>> Regard,
>>>>>>>> 0x98e is:
>>>>>>>>
>>>>>>>> $ ./tpm2_rc_decode 0x98e
>>>>>>>> error layer
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex: 0x0
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 identifier: TSS2_TPM_RC_LAYER
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: Error produced by the =
TPM format 1 error code
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex: 0x0e
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 identifier: TPM2_RC_AUTH_FAIL
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: the authorization HMAC=
 check failed and DA =

>>>>>>>> counter
>>>>>>>> incremented session
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex: 0x100
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 identifier: TPM2_RC_1
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=C2=A0 (null)
>>>>>>>>
>>>>>>>> SO it looks like you're not setting up the auth properly in the =

>>>>>>>> session.
>>>>>>>>
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of =

>>>>>>>>> Yasuhiro
>>>>>>>>> Hosoda
>>>>>>>>> Sent: Wednesday, December 13, 2017 10:59 PM
>>>>>>>>> To: tpm2(a)lists.01.org
>>>>>>>>> Subject: [tpm2] tpm2-tss question
>>>>>>>>>
>>>>>>>>> MY name is Yasuhiro Hosoda.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I am developing a program using TSS1.0(Nov=EF=BC=91=EF=BC=8E2016).
>>>>>>>>> I encountered a problem with PolicySecret error 0x98e and need =

>>>>>>>>> help.
>>>>>>>>> My program uses tpmtest.cpp as a base of development.
>>>>>>>>> The situation is as follows:
>>>>>>>>>
>>>>>>>>> 1 Create TPM Keys like this.
>>>>>>>>>
>>>>>>>>> EK
>>>>>>>>> =EF=BD=9C--------
>>>>>>>>> =EF=BD=9C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 |
>>>>>>>>> MK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AK
>>>>>>>>> =EF=BD=9C
>>>>>>>>> SK
>>>>>>>>>
>>>>>>>>> 2 Execute PolicySecret twice using HMAC session. At first, it =

>>>>>>>>> ends
>>>>>>>>> without
>>>>>>> error.
>>>>>>>>> Then it ends with 0x98e For clarification, I print out the values
>>>>>>>>> of Virtual Handle and Real Handle.
>>>>>>>>> The value of Virtual/Real Handles differ at 2nd excution of =

>>>>>>>>> the command.
>>>>>>>>> (See NO 25/26 Below)
>>>>>>>>>
>>>>>>>>> I understand that the resource manager assigns Virtual Handle and
>>>>>>>>> my program calculates HMAC using that handles.
>>>>>>>>> On the other hand, TPM may calculate HMAC using Real Handle.
>>>>>>>>> That is my hypothesis.
>>>>>>>>>
>>>>>>>>> Any suggestion about the usage of Session Handle?
>>>>>>>>>
>>>>>>>>> NO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Command=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Virtual/Real Handle=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LOC 1.
>>>>>>>>> CreatePrimary(EK) real=3D80000000, virtual=3D80000000 8381 2.
>>>>>>>>> HierarchyChangeAuth1 8421 3. HierarchyChangeAuth2 8431 4.
>>>>>>>>> StartAuthSession(Policy) real=3D3000000,
>>>>>>>>> virtual=3D3000000 8480 5. PolicySecret(ENDORSEMENT) 8494 6.
>>>>>>>>> Create(MK) 8515 7.=C2=A0=C2=A0=C2=A0 PolicySecret(ENDORSEMENT) 85=
29 8.=C2=A0=C2=A0=C2=A0 =

>>>>>>>>> Load(MK)
>>>>>>>>> real=3D80000001,
>>>>>>>>> virtual=3D80000001 8542 9.=C2=A0=C2=A0=C2=A0 Evict(MK) 8552 10. C=
reate(SK) 8590 =

>>>>>>>>> 11.
>>>>>>>>> Load(SK) real=3D80000001, virtual=3D80000002 8598 12.
>>>>>>>>> PolicySecret(ENDORSEMENT) 8609 13.=C2=A0=C2=A0=C2=A0 Create(AK) 8=
635 14.
>>>>>>>>> PolicySecret(ENDORSEMENT) 8645 15.=C2=A0=C2=A0=C2=A0 Load(AK) rea=
l=3D80000001,
>>>>>>>>> virtual=3D80000003 8655 16.=C2=A0=C2=A0=C2=A0 FlushContext(POLICY=
) 8664 17.
>>>>>>>>> StartAuthSession(POLICY) real=3D3000000, virtual=3D3000000 8668 1=
8.
>>>>>>>>> StartAuthSession(HMAC) real=3D2000001, virtual=3D2000001 8678 19.
>>>>>>>>> ComputeCommandHMAC(LoadExternal) real=3D80000000,
>>> virtual=3D80000004
>>>>>>>>> 3706 20. ComputeCommandHMAC(HMAC_Start) real=3D80000001,
>>>>>>>>> virtual=3D80000005 3706 21.=C2=A0=C2=A0=C2=A0 PolicySecret(SK) 87=
11 22.
>>>>>>>>> FlushContext(HMAC) 8717 23. FlushContext(POLICY) 8724 24.
>>>>>>>>> CertifyCreation(SK) 8738 25. StartAuthSession(POLICY)
>>>>>>>>> real=3D3000000, virtual=3D3000001 8745 26. StartAuthSession(HMAC)
>>>>>>>>> real=3D2000001, virtual=3D2000000 8754 27.
>>>>>>>>> ComputeCommandHMAC(LoadExternal) real=3D80000000,
>>> virtual=3D80000005
>>>>>>>>> 8782 28. ComputeCommandHMAC(HMAC_Start) real=3D80000001,
>>>>>>>>> virtual=3D80000004 8782 29.=C2=A0=C2=A0=C2=A0 PolicySecret(SK) 87=
89
>>>>>>>>>
>>>>>>>>> The whole=C2=A0 source program can be found here.
>>>>>>>>> https://github.com/intel/tpm2-tss/files/1516612/tpmtest.cpp_0x98e=
_2 =

>>>>>>>>>
>>>>>>>>> .t
>>>>>>>>> xt
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Kind regards,
>>>>>>>>>
>>>>>>>>> -- =

>>>>>>>>> Yasuhiro Hosoda
>>>>>>>>>
>>>>>>>>> NTT Electronics Corporation =EF=BC=88NEL)
>>>>>>>>> Security Support Project
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> _______________________________________________
>>>>>>>>> tpm2 mailing list
>>>>>>>>> tpm2(a)lists.01.org
>>>>>>>>> https://lists.01.org/mailman/listinfo/tpm2
>>>
>

--===============4815617464988383434==--

