Content-Type: multipart/mixed; boundary="===============3284703654146489629=="
MIME-Version: 1.0
From: Yasuhiro Hosoda <hosoda-yasuhiro at ntt-el.com>
Subject: Re: [tpm2] tpm2-tss question
Date: Wed, 11 Apr 2018 15:11:07 +0900
Message-ID: <ed0e0f61-6cc2-ce81-afc4-7cf833302060@ntt-el.com>
In-Reply-To: 1318ad60-c8a5-427f-9af7-5419ef1c3492@ntt-el.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3284703654146489629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have one finding about the RM and PolicySecret command,

It says in page 10 of the following document
"TCG TSS 2.0 TAB and Resource Manager specification"
https://trustedcomputinggroup.org/wp-content/uploads/TSS-2.0-TAB-Resource-M=
anager-SpecVer1.0-Rev18_review_END030918.pdf
that
"
The RM performs a mapping from the (unchanging) virtual handle to the =

(currently assigned) TPM
handle. It replaces the virtual handle with the TPM handle in the TPM =

command packet.

NOTE: The TPM 2.0 library specification excludes the handle from command =

stream HMAC calculations to enable this
substitution."
This means that if the virtual handle and the (currently assigned) TPM =

differs,
the HMAC calculations for most of the commands go well.

But, the PolicySecret command takes the policy handle to extend as a =

parameter for HMAC.
If, the virtual handle and the (currently assigned) TPM differs, the =

HMAC calculations
for this command doesn't go well and produces the error code 0x98e.
Is my understanding right?
If so, is there any workaround?

Thank you in advance.
>
>> You said in the former mail that
>> "Unless you took an RM virtualized handle and went directly to the TPM
>> with it, there shouldn't Be a problem"
>> I have checked again and found that my program uses an RM
>> virtualized handle for computing HMAC and if I substitute the virtual
>> handle to real one, the error 0x98e disappears,
>> Any advice?
>>
>>> Thank you for your reply.
>>>
>>> Where can I find necessary information for "get HMAC to work"?
>>>
>>> And, where can I find extended-sessions.sh?
>>>
>>> Many thanks.
>>>> test/system/tests/tcti/abrmd/extended-sessions.sh
>>>>
>>>> That uses abrmd which has an RM extension to allow session handles
>>>> to be marked for non-flushing on client disconnection, but that
>>>> point likely won't concern you.
>>>>
>>>> This test script uses tools that start a pcr policy session, =

>>>> satisfy or build the policy,
>>>> and use it for unsealing data.
>>>>
>>>> It might be good to see if you can get HMAC to work in this =

>>>> framework from a
>>>> Learning perspective and then you could contribute hmac policy =

>>>> session support
>>>> Back to the tools.
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Yasuhiro Hosoda [mailto:hosoda-yasuhiro(a)ntt-el.com]
>>>>> Sent: Thursday, January 18, 2018 3:11 PM
>>>>> To: Roberts, William C <william.c.roberts(a)intel.com>; =

>>>>> tpm2(a)lists.01.org
>>>>> Subject: Re: [tpm2] tpm2-tss question
>>>>>
>>>>> You said that "I would look at how the tpm2-tools do it, they make =

>>>>> for decent
>>>>> reference code."
>>>>> Would you tell me the place of tpm2-tools where I should look as =

>>>>> reference code.
>>>>> Regards,
>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Yasuhiro Hosoda [mailto:hosoda-yasuhiro(a)ntt-el.com]
>>>>>>> Sent: Thursday, January 18, 2018 6:44 AM
>>>>>>> To: Roberts, William C <william.c.roberts(a)intel.com>; =

>>>>>>> tpm2(a)lists.01.org
>>>>>>> Subject: Re: [tpm2] tpm2-tss question
>>>>>>>
>>>>>>> I appreciate much for your help. I am expecting for your =

>>>>>>> information about
>>>>> tpm2-
>>>>>>> tools.
>>>>>> What information are you expecting?
>>>>>>
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: Yasuhiro Hosoda [mailto:hosoda-yasuhiro(a)ntt-el.com]
>>>>>>>>> Sent: Friday, January 12, 2018 1:47 AM
>>>>>>>>> To: Roberts, William C <william.c.roberts(a)intel.com>;
>>>>>>>>> tpm2(a)lists.01.org
>>>>>>>>> Subject: Re: [tpm2] tpm2-tss question
>>>>>>>>>
>>>>>>>>> Hi, Mr. Roberts, William
>>>>>>>>>
>>>>>>>>> Thank you for your advice.
>>>>>>>>> I had already checked the details of this error code.
>>>>>>>>> My understanding is that the problem is not the setting of the =

>>>>>>>>> auth
>>>>>>>>> but there occurs the discrepancy between the virtual handles =

>>>>>>>>> and the
>>>>>>>>> real handles in the resource manager.
>>>>>>>> Unless you took an RM virtualized handle and went directly to =

>>>>>>>> the TPM
>>>>>>>> with it, there shouldn't Be a problem. The RM should be =

>>>>>>>> swapping out
>>>>>>>> virtualized handles with real ones for you before They hit the =

>>>>>>>> tpm, and thus,
>>>>>>> should be transparent.
>>>>>>>> As far as what the problem is, it's hard to tell offhand. I =

>>>>>>>> would look
>>>>>>>> at how the tpm2-tools do it, they make for decent reference code.
>>>>>>>>
>>>>>>>>> Any help will be greatly appreciated
>>>>>>>>>
>>>>>>>>> Regard,
>>>>>>>>>> 0x98e is:
>>>>>>>>>>
>>>>>>>>>> $ ./tpm2_rc_decode 0x98e
>>>>>>>>>> error layer
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex: 0x0
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 identifier: TSS2_TPM_RC_LAYER
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: Error produced by th=
e TPM format 1 error code
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex: 0x0e
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 identifier: TPM2_RC_AUTH_FAIL
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: the authorization HM=
AC check failed and DA =

>>>>>>>>>> counter
>>>>>>>>>> incremented session
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex: 0x100
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 identifier: TPM2_RC_1
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=C2=A0 (null)
>>>>>>>>>>
>>>>>>>>>> SO it looks like you're not setting up the auth properly in =

>>>>>>>>>> the session.
>>>>>>>>>>
>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of =

>>>>>>>>>>> Yasuhiro
>>>>>>>>>>> Hosoda
>>>>>>>>>>> Sent: Wednesday, December 13, 2017 10:59 PM
>>>>>>>>>>> To: tpm2(a)lists.01.org
>>>>>>>>>>> Subject: [tpm2] tpm2-tss question
>>>>>>>>>>>
>>>>>>>>>>> MY name is Yasuhiro Hosoda.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> I am developing a program using TSS1.0(Nov=EF=BC=91=EF=BC=8E201=
6).
>>>>>>>>>>> I encountered a problem with PolicySecret error 0x98e and =

>>>>>>>>>>> need help.
>>>>>>>>>>> My program uses tpmtest.cpp as a base of development.
>>>>>>>>>>> The situation is as follows:
>>>>>>>>>>>
>>>>>>>>>>> 1 Create TPM Keys like this.
>>>>>>>>>>>
>>>>>>>>>>> EK
>>>>>>>>>>> =EF=BD=9C--------
>>>>>>>>>>> =EF=BD=9C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 |
>>>>>>>>>>> MK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AK
>>>>>>>>>>> =EF=BD=9C
>>>>>>>>>>> SK
>>>>>>>>>>>
>>>>>>>>>>> 2 Execute PolicySecret twice using HMAC session. At first, =

>>>>>>>>>>> it ends
>>>>>>>>>>> without
>>>>>>>>> error.
>>>>>>>>>>> Then it ends with 0x98e For clarification, I print out the =

>>>>>>>>>>> values
>>>>>>>>>>> of Virtual Handle and Real Handle.
>>>>>>>>>>> The value of Virtual/Real Handles differ at 2nd excution of =

>>>>>>>>>>> the command.
>>>>>>>>>>> (See NO 25/26 Below)
>>>>>>>>>>>
>>>>>>>>>>> I understand that the resource manager assigns Virtual =

>>>>>>>>>>> Handle and
>>>>>>>>>>> my program calculates HMAC using that handles.
>>>>>>>>>>> On the other hand, TPM may calculate HMAC using Real Handle.
>>>>>>>>>>> That is my hypothesis.
>>>>>>>>>>>
>>>>>>>>>>> Any suggestion about the usage of Session Handle?
>>>>>>>>>>>
>>>>>>>>>>> NO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Command=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Virtual/Real Handle=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LOC 1.
>>>>>>>>>>> CreatePrimary(EK) real=3D80000000, virtual=3D80000000 8381 2.
>>>>>>>>>>> HierarchyChangeAuth1 8421 3. HierarchyChangeAuth2 8431 4.
>>>>>>>>>>> StartAuthSession(Policy) real=3D3000000,
>>>>>>>>>>> virtual=3D3000000 8480 5. PolicySecret(ENDORSEMENT) 8494 6.
>>>>>>>>>>> Create(MK) 8515 7. PolicySecret(ENDORSEMENT) 8529 8.=C2=A0=C2=
=A0=C2=A0 =

>>>>>>>>>>> Load(MK)
>>>>>>>>>>> real=3D80000001,
>>>>>>>>>>> virtual=3D80000001 8542 9.=C2=A0=C2=A0=C2=A0 Evict(MK) 8552 10.=
 Create(SK) =

>>>>>>>>>>> 8590 11.
>>>>>>>>>>> Load(SK) real=3D80000001, virtual=3D80000002 8598 12.
>>>>>>>>>>> PolicySecret(ENDORSEMENT) 8609 13. Create(AK) 8635 14.
>>>>>>>>>>> PolicySecret(ENDORSEMENT) 8645 15.=C2=A0=C2=A0=C2=A0 Load(AK) r=
eal=3D80000001,
>>>>>>>>>>> virtual=3D80000003 8655 16. FlushContext(POLICY) 8664 17.
>>>>>>>>>>> StartAuthSession(POLICY) real=3D3000000, virtual=3D3000000 8668=
 18.
>>>>>>>>>>> StartAuthSession(HMAC) real=3D2000001, virtual=3D2000001 8678 1=
9.
>>>>>>>>>>> ComputeCommandHMAC(LoadExternal) real=3D80000000,
>>>>> virtual=3D80000004
>>>>>>>>>>> 3706 20. ComputeCommandHMAC(HMAC_Start) real=3D80000001,
>>>>>>>>>>> virtual=3D80000005 3706 21.=C2=A0=C2=A0=C2=A0 PolicySecret(SK) =
8711 22.
>>>>>>>>>>> FlushContext(HMAC) 8717 23. FlushContext(POLICY) 8724 24.
>>>>>>>>>>> CertifyCreation(SK) 8738 25. StartAuthSession(POLICY)
>>>>>>>>>>> real=3D3000000, virtual=3D3000001 8745 26. StartAuthSession(HMA=
C)
>>>>>>>>>>> real=3D2000001, virtual=3D2000000 8754 27.
>>>>>>>>>>> ComputeCommandHMAC(LoadExternal) real=3D80000000,
>>>>> virtual=3D80000005
>>>>>>>>>>> 8782 28. ComputeCommandHMAC(HMAC_Start) real=3D80000001,
>>>>>>>>>>> virtual=3D80000004 8782 29.=C2=A0=C2=A0=C2=A0 PolicySecret(SK) =
8789
>>>>>>>>>>>
>>>>>>>>>>> The whole=C2=A0 source program can be found here.
>>>>>>>>>>> https://github.com/intel/tpm2-tss/files/1516612/tpmtest.cpp_0x9=
8e_2 =

>>>>>>>>>>>
>>>>>>>>>>> .t
>>>>>>>>>>> xt
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Kind regards,
>>>>>>>>>>>
>>>>>>>>>>> -- =

>>>>>>>>>>> Yasuhiro Hosoda
>>>>>>>>>>>
>>>>>>>>>>> NTT Electronics Corporation =EF=BC=88NEL)
>>>>>>>>>>> Security Support Project
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> _______________________________________________
>>>>>>>>>>> tpm2 mailing list
>>>>>>>>>>> tpm2(a)lists.01.org
>>>>>>>>>>> https://lists.01.org/mailman/listinfo/tpm2
>>>>>
>>>
>
> -- =

>

-- =



--===============3284703654146489629==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4
Ij5JIGhhdmUgb25lIGZpbmRpbmcgYWJvdXQgdGhlIFJNIGFuZAogICAgICBQb2xpY3lTZWNyZXQg
Y29tbWFuZCw8YnI+CiAgICAgIDxicj4KICAgICAgSXQgc2F5cyBpbiBwYWdlIDEwIG9mIHRoZSBm
b2xsb3dpbmcgZG9jdW1lbnQ8YnI+CiAgICAgICJUQ0cgVFNTIDIuMCBUQUIgYW5kIFJlc291cmNl
IE1hbmFnZXIgc3BlY2lmaWNhdGlvbiI8YnI+CjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRl
eHQiIGhyZWY9Imh0dHBzOi8vdHJ1c3RlZGNvbXB1dGluZ2dyb3VwLm9yZy93cC1jb250ZW50L3Vw
bG9hZHMvVFNTLTIuMC1UQUItUmVzb3VyY2UtTWFuYWdlci1TcGVjVmVyMS4wLVJldjE4X3Jldmll
d19FTkQwMzA5MTgucGRmIj5odHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91cC5vcmcvd3AtY29u
dGVudC91cGxvYWRzL1RTUy0yLjAtVEFCLVJlc291cmNlLU1hbmFnZXItU3BlY1ZlcjEuMC1SZXYx
OF9yZXZpZXdfRU5EMDMwOTE4LnBkZjwvYT48YnI+CiAgICAgIHRoYXQgPGJyPgogICAgICAiPGJy
PgogICAgICBUaGUgUk0gcGVyZm9ybXMgYSBtYXBwaW5nIGZyb20gdGhlICh1bmNoYW5naW5nKSB2
aXJ0dWFsIGhhbmRsZSB0bwogICAgICB0aGUgKGN1cnJlbnRseSBhc3NpZ25lZCkgVFBNPGJyPgog
ICAgICBoYW5kbGUuIEl0IHJlcGxhY2VzIHRoZSB2aXJ0dWFsIGhhbmRsZSB3aXRoIHRoZSBUUE0g
aGFuZGxlIGluIHRoZQogICAgICBUUE0gY29tbWFuZCBwYWNrZXQuPGJyPgogICAgICA8YnI+CiAg
ICAgIE5PVEU6IFRoZSBUUE0gMi4wIGxpYnJhcnkgc3BlY2lmaWNhdGlvbiBleGNsdWRlcyB0aGUg
aGFuZGxlIGZyb20KICAgICAgY29tbWFuZCBzdHJlYW0gSE1BQyBjYWxjdWxhdGlvbnMgdG8gZW5h
YmxlIHRoaXM8YnI+CiAgICAgIHN1YnN0aXR1dGlvbi4iPGJyPgogICAgICBUaGlzIG1lYW5zIHRo
YXQgaWYgdGhlIHZpcnR1YWwgaGFuZGxlIGFuZCB0aGUgKGN1cnJlbnRseSBhc3NpZ25lZCkKICAg
ICAgVFBNIGRpZmZlcnMsPGJyPgogICAgICB0aGUgSE1BQyBjYWxjdWxhdGlvbnMgZm9yIG1vc3Qg
b2YgdGhlIGNvbW1hbmRzIGdvIHdlbGwuPGJyPgogICAgICA8YnI+CiAgICAgIEJ1dCwgdGhlIFBv
bGljeVNlY3JldCBjb21tYW5kIHRha2VzIHRoZSBwb2xpY3kgaGFuZGxlIHRvIGV4dGVuZCBhcwog
ICAgICBhIHBhcmFtZXRlciBmb3IgSE1BQy48YnI+CiAgICAgIElmLCB0aGUgdmlydHVhbCBoYW5k
bGUgYW5kIHRoZSAoY3VycmVudGx5IGFzc2lnbmVkKSBUUE0gZGlmZmVycywKICAgICAgdGhlIEhN
QUMgY2FsY3VsYXRpb25zPGJyPgogICAgICBmb3IgdGhpcyBjb21tYW5kIGRvZXNuJ3QgZ28gd2Vs
bCBhbmQgcHJvZHVjZXMgdGhlIGVycm9yIGNvZGUKICAgICAgMHg5OGUuPGJyPgogICAgICBJcyBt
eSB1bmRlcnN0YW5kaW5nIHJpZ2h0Pzxicj4KICAgICAgSWYgc28sIGlzIHRoZXJlIGFueSB3b3Jr
YXJvdW5kPzxicj4KICAgICAgPGJyPgogICAgICBUaGFuayB5b3UgaW4gYWR2YW5jZS48YnI+CiAg
ICA8L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCiAgICAgIGNpdGU9Im1pZDoxMzE4
YWQ2MC1jOGE1LTQyN2YtOWFmNy01NDE5ZWYxYzM0OTJAbnR0LWVsLmNvbSI+PGJyPgogICAgICA8
YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICAgIGNpdGU9Im1pZDoxYTVhMjhkYy00MzNiLTI5
YTEtYjFjMS1lOTJlMjNlMGI5MjlAbnR0LWVsLmNvbSI+WW91CiAgICAgICAgc2FpZCBpbiB0aGUg
Zm9ybWVyIG1haWwgdGhhdCA8YnI+CiAgICAgICAgIlVubGVzcyB5b3UgdG9vayBhbiBSTSB2aXJ0
dWFsaXplZCBoYW5kbGUgYW5kIHdlbnQgZGlyZWN0bHkgdG8KICAgICAgICB0aGUgVFBNIDxicj4K
ICAgICAgICB3aXRoIGl0LCB0aGVyZSBzaG91bGRuJ3QgQmUgYSBwcm9ibGVtIiA8YnI+CiAgICAg
ICAgSSBoYXZlIGNoZWNrZWQgYWdhaW4gYW5kIGZvdW5kIHRoYXQgbXkgcHJvZ3JhbSB1c2VzIGFu
IFJNIDxicj4KICAgICAgICB2aXJ0dWFsaXplZCBoYW5kbGUgZm9yIGNvbXB1dGluZyBITUFDIGFu
ZCBpZiBJIHN1YnN0aXR1dGUgdGhlCiAgICAgICAgdmlydHVhbCA8YnI+CiAgICAgICAgaGFuZGxl
IHRvIHJlYWwgb25lLCB0aGUgZXJyb3IgMHg5OGUgZGlzYXBwZWFycywgPGJyPgogICAgICAgIEFu
eSBhZHZpY2U/IDxicj4KICAgICAgICA8YnI+CiAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+VGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LiA8YnI+CiAgICAgICAgICA8YnI+CiAgICAgICAg
ICBXaGVyZSBjYW4gSSBmaW5kIG5lY2Vzc2FyeSBpbmZvcm1hdGlvbiBmb3IgImdldCBITUFDIHRv
IHdvcmsiPwogICAgICAgICAgPGJyPgogICAgICAgICAgPGJyPgogICAgICAgICAgQW5kLCB3aGVy
ZSBjYW4gSSBmaW5kIGV4dGVuZGVkLXNlc3Npb25zLnNoPyA8YnI+CiAgICAgICAgICA8YnI+CiAg
ICAgICAgICBNYW55IHRoYW5rcy4gPGJyPgogICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+dGVzdC9zeXN0ZW0vdGVzdHMvdGN0aS9hYnJtZC9leHRlbmRlZC1zZXNzaW9ucy5zaAogICAg
ICAgICAgICA8YnI+CiAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgVGhhdCB1c2VzIGFicm1k
IHdoaWNoIGhhcyBhbiBSTSBleHRlbnNpb24gdG8gYWxsb3cgc2Vzc2lvbgogICAgICAgICAgICBo
YW5kbGVzIDxicj4KICAgICAgICAgICAgdG8gYmUgbWFya2VkIGZvciBub24tZmx1c2hpbmcgb24g
Y2xpZW50IGRpc2Nvbm5lY3Rpb24sIGJ1dAogICAgICAgICAgICB0aGF0IDxicj4KICAgICAgICAg
ICAgcG9pbnQgbGlrZWx5IHdvbid0IGNvbmNlcm4geW91LiA8YnI+CiAgICAgICAgICAgIDxicj4K
ICAgICAgICAgICAgVGhpcyB0ZXN0IHNjcmlwdCB1c2VzIHRvb2xzIHRoYXQgc3RhcnQgYSBwY3Ig
cG9saWN5IHNlc3Npb24sCiAgICAgICAgICAgIHNhdGlzZnkgb3IgYnVpbGQgdGhlIHBvbGljeSwg
PGJyPgogICAgICAgICAgICBhbmQgdXNlIGl0IGZvciB1bnNlYWxpbmcgZGF0YS4gPGJyPgogICAg
ICAgICAgICA8YnI+CiAgICAgICAgICAgIEl0IG1pZ2h0IGJlIGdvb2QgdG8gc2VlIGlmIHlvdSBj
YW4gZ2V0IEhNQUMgdG8gd29yayBpbiB0aGlzCiAgICAgICAgICAgIGZyYW1ld29yayBmcm9tIGEg
PGJyPgogICAgICAgICAgICBMZWFybmluZyBwZXJzcGVjdGl2ZSBhbmQgdGhlbiB5b3UgY291bGQg
Y29udHJpYnV0ZSBobWFjCiAgICAgICAgICAgIHBvbGljeSBzZXNzaW9uIHN1cHBvcnQgPGJyPgog
ICAgICAgICAgICBCYWNrIHRvIHRoZSB0b29scy4gPGJyPgogICAgICAgICAgICA8YnI+CiAgICAg
ICAgICAgIDxicj4KICAgICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+LS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0gPGJyPgogICAgICAgICAgICAgIEZyb206IFlhc3VoaXJvIEhvc29k
YSBbPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIKICAgICAgICAgICAgICAgIGhyZWY9
Im1haWx0bzpob3NvZGEteWFzdWhpcm9AbnR0LWVsLmNvbSIKICAgICAgICAgICAgICAgIG1vei1k
by1ub3Qtc2VuZD0idHJ1ZSI+bWFpbHRvOmhvc29kYS15YXN1aGlyb0BudHQtZWwuY29tPC9hPl0K
ICAgICAgICAgICAgICA8YnI+CiAgICAgICAgICAgICAgU2VudDogVGh1cnNkYXksIEphbnVhcnkg
MTgsIDIwMTggMzoxMSBQTSA8YnI+CiAgICAgICAgICAgICAgVG86IFJvYmVydHMsIFdpbGxpYW0g
QyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIgogICAgICAgICAgICAgICAgaHJlZj0i
bWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIKICAgICAgICAgICAgICAgIG1vei1k
by1ub3Qtc2VuZD0idHJ1ZSI+Jmx0O3dpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSZndDs8L2E+
OwogICAgICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiCiAgICAg
ICAgICAgICAgICBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIG1vei1kby1ub3Qtc2Vu
ZD0idHJ1ZSI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+CiAgICAgICAgICAgICAgPGJyPgogICAgICAg
ICAgICAgIFN1YmplY3Q6IFJlOiBbdHBtMl0gdHBtMi10c3MgcXVlc3Rpb24gPGJyPgogICAgICAg
ICAgICAgIDxicj4KICAgICAgICAgICAgICBZb3Ugc2FpZCB0aGF0ICJJIHdvdWxkIGxvb2sgYXQg
aG93IHRoZSB0cG0yLXRvb2xzIGRvIGl0LAogICAgICAgICAgICAgIHRoZXkgbWFrZSBmb3IgZGVj
ZW50IDxicj4KICAgICAgICAgICAgICByZWZlcmVuY2UgY29kZS4iIDxicj4KICAgICAgICAgICAg
ICBXb3VsZCB5b3UgdGVsbCBtZSB0aGUgcGxhY2Ugb2YgdHBtMi10b29scyB3aGVyZSBJIHNob3Vs
ZAogICAgICAgICAgICAgIGxvb2sgYXMgcmVmZXJlbmNlIGNvZGUuIDxicj4KICAgICAgICAgICAg
ICBSZWdhcmRzLCA8YnI+CiAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgIDxibG9ja3F1
b3RlIHR5cGU9ImNpdGUiPgogICAgICAgICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0gPGJyPgogICAgICAgICAgICAgICAgICBGcm9tOiBZ
YXN1aGlybyBIb3NvZGEgWzxhCiAgICAgICAgICAgICAgICAgICAgY2xhc3M9Im1vei10eHQtbGlu
ay1mcmVldGV4dCIKICAgICAgICAgICAgICAgICAgICBocmVmPSJtYWlsdG86aG9zb2RhLXlhc3Vo
aXJvQG50dC1lbC5jb20iCiAgICAgICAgICAgICAgICAgICAgbW96LWRvLW5vdC1zZW5kPSJ0cnVl
Ij5tYWlsdG86aG9zb2RhLXlhc3VoaXJvQG50dC1lbC5jb208L2E+XQogICAgICAgICAgICAgICAg
ICA8YnI+CiAgICAgICAgICAgICAgICAgIFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDE4LCAyMDE4
IDY6NDQgQU0gPGJyPgogICAgICAgICAgICAgICAgICBUbzogUm9iZXJ0cywgV2lsbGlhbSBDIDxh
CiAgICAgICAgICAgICAgICAgICAgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIKICAgICAg
ICAgICAgICAgICAgICBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIgog
ICAgICAgICAgICAgICAgICAgIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+Jmx0O3dpbGxpYW0uYy5y
b2JlcnRzQGludGVsLmNvbSZndDs8L2E+OwogICAgICAgICAgICAgICAgICA8YSBjbGFzcz0ibW96
LXR4dC1saW5rLWFiYnJldmlhdGVkIgogICAgICAgICAgICAgICAgICAgIGhyZWY9Im1haWx0bzp0
cG0yQGxpc3RzLjAxLm9yZyIKICAgICAgICAgICAgICAgICAgICBtb3otZG8tbm90LXNlbmQ9InRy
dWUiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiA8YnI+CiAgICAgICAgICAgICAgICAgIFN1YmplY3Q6
IFJlOiBbdHBtMl0gdHBtMi10c3MgcXVlc3Rpb24gPGJyPgogICAgICAgICAgICAgICAgICA8YnI+
CiAgICAgICAgICAgICAgICAgIEkgYXBwcmVjaWF0ZSBtdWNoIGZvciB5b3VyIGhlbHAuIEkgYW0g
ZXhwZWN0aW5nIGZvcgogICAgICAgICAgICAgICAgICB5b3VyIGluZm9ybWF0aW9uIGFib3V0IDxi
cj4KICAgICAgICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgICAgICA8L2Jsb2NrcXVv
dGU+CiAgICAgICAgICAgICAgdHBtMi0gPGJyPgogICAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5
cGU9ImNpdGUiPgogICAgICAgICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+dG9vbHMu
IDxicj4KICAgICAgICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgICAgICAgIFdoYXQg
aW5mb3JtYXRpb24gYXJlIHlvdSBleHBlY3Rpbmc/IDxicj4KICAgICAgICAgICAgICAgIDxicj4K
ICAgICAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgICAgICAgICAg
ICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICAgICAgICAgICAgICA8YmxvY2txdW90
ZSB0eXBlPSJjaXRlIj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLSA8YnI+CiAgICAgICAgICAg
ICAgICAgICAgICBGcm9tOiBZYXN1aGlybyBIb3NvZGEgWzxhCiAgICAgICAgICAgICAgICAgICAg
ICAgIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiCiAgICAgICAgICAgICAgICAgICAgICAg
IGhyZWY9Im1haWx0bzpob3NvZGEteWFzdWhpcm9AbnR0LWVsLmNvbSIKICAgICAgICAgICAgICAg
ICAgICAgICAgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj5tYWlsdG86aG9zb2RhLXlhc3VoaXJvQG50
dC1lbC5jb208L2E+XQogICAgICAgICAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgICAg
ICAgICAgU2VudDogRnJpZGF5LCBKYW51YXJ5IDEyLCAyMDE4IDE6NDcgQU0gPGJyPgogICAgICAg
ICAgICAgICAgICAgICAgVG86IFJvYmVydHMsIFdpbGxpYW0gQyA8YQogICAgICAgICAgICAgICAg
ICAgICAgICBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIgogICAgICAgICAgICAgICAgICAg
ICAgICBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIgogICAgICAgICAg
ICAgICAgICAgICAgICBtb3otZG8tbm90LXNlbmQ9InRydWUiPiZsdDt3aWxsaWFtLmMucm9iZXJ0
c0BpbnRlbC5jb20mZ3Q7PC9hPjsKICAgICAgICAgICAgICAgICAgICAgIDxicj4KICAgICAgICAg
ICAgICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiCiAgICAgICAg
ICAgICAgICAgICAgICAgIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIKICAgICAgICAg
ICAgICAgICAgICAgICAgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj50cG0yQGxpc3RzLjAxLm9yZzwv
YT4gPGJyPgogICAgICAgICAgICAgICAgICAgICAgU3ViamVjdDogUmU6IFt0cG0yXSB0cG0yLXRz
cyBxdWVzdGlvbiA8YnI+CiAgICAgICAgICAgICAgICAgICAgICA8YnI+CiAgICAgICAgICAgICAg
ICAgICAgICBIaSwgTXIuIFJvYmVydHMsIFdpbGxpYW0gPGJyPgogICAgICAgICAgICAgICAgICAg
ICAgPGJyPgogICAgICAgICAgICAgICAgICAgICAgVGhhbmsgeW91IGZvciB5b3VyIGFkdmljZS4g
PGJyPgogICAgICAgICAgICAgICAgICAgICAgSSBoYWQgYWxyZWFkeSBjaGVja2VkIHRoZSBkZXRh
aWxzIG9mIHRoaXMgZXJyb3IKICAgICAgICAgICAgICAgICAgICAgIGNvZGUuIDxicj4KICAgICAg
ICAgICAgICAgICAgICAgIE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgcHJvYmxlbSBpcyBu
b3QgdGhlCiAgICAgICAgICAgICAgICAgICAgICBzZXR0aW5nIG9mIHRoZSBhdXRoIDxicj4KICAg
ICAgICAgICAgICAgICAgICAgIGJ1dCB0aGVyZSBvY2N1cnMgdGhlIGRpc2NyZXBhbmN5IGJldHdl
ZW4gdGhlCiAgICAgICAgICAgICAgICAgICAgICB2aXJ0dWFsIGhhbmRsZXMgYW5kIHRoZSA8YnI+
CiAgICAgICAgICAgICAgICAgICAgICByZWFsIGhhbmRsZXMgaW4gdGhlIHJlc291cmNlIG1hbmFn
ZXIuIDxicj4KICAgICAgICAgICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgICAg
ICAgICAgVW5sZXNzIHlvdSB0b29rIGFuIFJNIHZpcnR1YWxpemVkIGhhbmRsZSBhbmQgd2VudAog
ICAgICAgICAgICAgICAgICAgIGRpcmVjdGx5IHRvIHRoZSBUUE0gPGJyPgogICAgICAgICAgICAg
ICAgICAgIHdpdGggaXQsIHRoZXJlIHNob3VsZG4ndCBCZSBhIHByb2JsZW0uIFRoZSBSTSBzaG91
bGQKICAgICAgICAgICAgICAgICAgICBiZSBzd2FwcGluZyBvdXQgPGJyPgogICAgICAgICAgICAg
ICAgICAgIHZpcnR1YWxpemVkIGhhbmRsZXMgd2l0aCByZWFsIG9uZXMgZm9yIHlvdSBiZWZvcmUK
ICAgICAgICAgICAgICAgICAgICBUaGV5IGhpdCB0aGUgdHBtLCBhbmQgdGh1cywgPGJyPgogICAg
ICAgICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgICAgICAgIHNob3VsZCBiZSB0
cmFuc3BhcmVudC4gPGJyPgogICAgICAgICAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRl
Ij5BcyBmYXIgYXMgd2hhdCB0aGUgcHJvYmxlbSBpcywKICAgICAgICAgICAgICAgICAgICBpdCdz
IGhhcmQgdG8gdGVsbCBvZmZoYW5kLiBJIHdvdWxkIGxvb2sgPGJyPgogICAgICAgICAgICAgICAg
ICAgIGF0IGhvdyB0aGUgdHBtMi10b29scyBkbyBpdCwgdGhleSBtYWtlIGZvciBkZWNlbnQKICAg
ICAgICAgICAgICAgICAgICByZWZlcmVuY2UgY29kZS4gPGJyPgogICAgICAgICAgICAgICAgICAg
IDxicj4KICAgICAgICAgICAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj5BbnkgaGVs
cCB3aWxsIGJlIGdyZWF0bHkKICAgICAgICAgICAgICAgICAgICAgIGFwcHJlY2lhdGVkIDxicj4K
ICAgICAgICAgICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICAgICAgICAgIFJlZ2FyZCwg
PGJyPgogICAgICAgICAgICAgICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+MHg5OGUg
aXM6IDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgICAgICAg
ICAgICAkIC4vdHBtMl9yY19kZWNvZGUgMHg5OGUgPGJyPgogICAgICAgICAgICAgICAgICAgICAg
ICBlcnJvciBsYXllciA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgIMKgwqDCoMKgwqAgaGV4
OiAweDAgPGJyPgogICAgICAgICAgICAgICAgICAgICAgICDCoMKgwqDCoMKgIGlkZW50aWZpZXI6
IFRTUzJfVFBNX1JDX0xBWUVSIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgwqDCoMKgwqDC
oCBkZXNjcmlwdGlvbjogRXJyb3IgcHJvZHVjZWQgYnkgdGhlIFRQTQogICAgICAgICAgICAgICAg
ICAgICAgICBmb3JtYXQgMSBlcnJvciBjb2RlIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAg
wqDCoMKgwqDCoCBoZXg6IDB4MGUgPGJyPgogICAgICAgICAgICAgICAgICAgICAgICDCoMKgwqDC
oMKgIGlkZW50aWZpZXI6IFRQTTJfUkNfQVVUSF9GQUlMIDxicj4KICAgICAgICAgICAgICAgICAg
ICAgICAgwqDCoMKgwqDCoCBkZXNjcmlwdGlvbjogdGhlIGF1dGhvcml6YXRpb24gSE1BQyBjaGVj
awogICAgICAgICAgICAgICAgICAgICAgICBmYWlsZWQgYW5kIERBIGNvdW50ZXIgPGJyPgogICAg
ICAgICAgICAgICAgICAgICAgICBpbmNyZW1lbnRlZCBzZXNzaW9uIDxicj4KICAgICAgICAgICAg
ICAgICAgICAgICAgwqDCoMKgwqDCoCBoZXg6IDB4MTAwIDxicj4KICAgICAgICAgICAgICAgICAg
ICAgICAgwqDCoMKgwqDCoCBpZGVudGlmaWVyOiBUUE0yX1JDXzEgPGJyPgogICAgICAgICAgICAg
ICAgICAgICAgICDCoMKgwqDCoMKgIGRlc2NyaXB0aW9uOsKgIChudWxsKSA8YnI+CiAgICAgICAg
ICAgICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgU08gaXQgbG9va3Mg
bGlrZSB5b3UncmUgbm90IHNldHRpbmcgdXAgdGhlIGF1dGgKICAgICAgICAgICAgICAgICAgICAg
ICAgcHJvcGVybHkgaW4gdGhlIHNlc3Npb24uIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAg
PGJyPgogICAgICAgICAgICAgICAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4tLS0t
LU9yaWdpbmFsCiAgICAgICAgICAgICAgICAgICAgICAgICAgTWVzc2FnZS0tLS0tIDxicj4KICAg
ICAgICAgICAgICAgICAgICAgICAgICBGcm9tOiB0cG0yIFs8YSBjbGFzcz0ibW96LXR4dC1saW5r
LWZyZWV0ZXh0IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgaHJlZj0ibWFpbHRvOnRwbTIt
Ym91bmNlc0BsaXN0cy4wMS5vcmciCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBtb3otZG8t
bm90LXNlbmQ9InRydWUiPm1haWx0bzp0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnPC9hPl0KICAg
ICAgICAgICAgICAgICAgICAgICAgICBPbiBCZWhhbGYgT2YgWWFzdWhpcm8gPGJyPgogICAgICAg
ICAgICAgICAgICAgICAgICAgIEhvc29kYSA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgICAg
U2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAxMywgMjAxNyAxMDo1OSBQTSA8YnI+CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgVG86IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQi
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5v
cmciCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBtb3otZG8tbm90LXNlbmQ9InRydWUiPnRw
bTJAbGlzdHMuMDEub3JnPC9hPgogICAgICAgICAgICAgICAgICAgICAgICAgIDxicj4KICAgICAg
ICAgICAgICAgICAgICAgICAgICBTdWJqZWN0OiBbdHBtMl0gdHBtMi10c3MgcXVlc3Rpb24gPGJy
PgogICAgICAgICAgICAgICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAg
ICBNWSBuYW1lIGlzIFlhc3VoaXJvIEhvc29kYS4gPGJyPgogICAgICAgICAgICAgICAgICAgICAg
ICAgIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICA8YnI+CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgSSBhbSBkZXZlbG9waW5nIGEgcHJvZ3JhbSB1c2luZwogICAgICAgICAgICAgICAg
ICAgICAgICAgIFRTUzEuMChOb3bvvJHvvI4yMDE2KS4gPGJyPgogICAgICAgICAgICAgICAgICAg
ICAgICAgIEkgZW5jb3VudGVyZWQgYSBwcm9ibGVtIHdpdGggUG9saWN5U2VjcmV0CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgZXJyb3IgMHg5OGUgYW5kIG5lZWQgaGVscC4gPGJyPgogICAgICAg
ICAgICAgICAgICAgICAgICAgIE15IHByb2dyYW0gdXNlcyB0cG10ZXN0LmNwcCBhcyBhIGJhc2Ug
b2YKICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZlbG9wbWVudC4gPGJyPgogICAgICAgICAg
ICAgICAgICAgICAgICAgIFRoZSBzaXR1YXRpb24gaXMgYXMgZm9sbG93czogPGJyPgogICAgICAg
ICAgICAgICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICAxIENyZWF0
ZSBUUE0gS2V5cyBsaWtlIHRoaXMuIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICA8YnI+
CiAgICAgICAgICAgICAgICAgICAgICAgICAgRUsgPGJyPgogICAgICAgICAgICAgICAgICAgICAg
ICAgIO+9nC0tLS0tLS0tIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICDvvZzCoMKgwqDC
oMKgIMKgIMKgIHwgPGJyPgogICAgICAgICAgICAgICAgICAgICAgICAgIE1LwqDCoMKgwqDCoMKg
IEFLIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICDvvZwgPGJyPgogICAgICAgICAgICAg
ICAgICAgICAgICAgIFNLIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICA8YnI+CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgMiBFeGVjdXRlIFBvbGljeVNlY3JldCB0d2ljZSB1c2luZyBI
TUFDCiAgICAgICAgICAgICAgICAgICAgICAgICAgc2Vzc2lvbi4gQXQgZmlyc3QsIGl0IGVuZHMg
PGJyPgogICAgICAgICAgICAgICAgICAgICAgICAgIHdpdGhvdXQgPGJyPgogICAgICAgICAgICAg
ICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgICAgICAgICAgICA8L2Jsb2NrcXVv
dGU+CiAgICAgICAgICAgICAgICAgICAgICBlcnJvci4gPGJyPgogICAgICAgICAgICAgICAgICAg
ICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICAgICAgICAgICAgICAgIDxibG9j
a3F1b3RlIHR5cGU9ImNpdGUiPlRoZW4gaXQgZW5kcyB3aXRoIDB4OThlCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgRm9yIGNsYXJpZmljYXRpb24sIEkgcHJpbnQgb3V0IHRoZSB2YWx1ZXMgPGJy
PgogICAgICAgICAgICAgICAgICAgICAgICAgIG9mIFZpcnR1YWwgSGFuZGxlIGFuZCBSZWFsIEhh
bmRsZS4gPGJyPgogICAgICAgICAgICAgICAgICAgICAgICAgIFRoZSB2YWx1ZSBvZiBWaXJ0dWFs
L1JlYWwgSGFuZGxlcyBkaWZmZXIgYXQKICAgICAgICAgICAgICAgICAgICAgICAgICAybmQgZXhj
dXRpb24gb2YgdGhlIGNvbW1hbmQuIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICAoU2Vl
IE5PIDI1LzI2IEJlbG93KSA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPGJyPgogICAg
ICAgICAgICAgICAgICAgICAgICAgIEkgdW5kZXJzdGFuZCB0aGF0IHRoZSByZXNvdXJjZSBtYW5h
Z2VyIGFzc2lnbnMKICAgICAgICAgICAgICAgICAgICAgICAgICBWaXJ0dWFsIEhhbmRsZSBhbmQg
PGJyPgogICAgICAgICAgICAgICAgICAgICAgICAgIG15IHByb2dyYW0gY2FsY3VsYXRlcyBITUFD
IHVzaW5nIHRoYXQgaGFuZGxlcy4KICAgICAgICAgICAgICAgICAgICAgICAgICA8YnI+CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgT24gdGhlIG90aGVyIGhhbmQsIFRQTSBtYXkgY2FsY3VsYXRl
IEhNQUMKICAgICAgICAgICAgICAgICAgICAgICAgICB1c2luZyBSZWFsIEhhbmRsZS4gPGJyPgog
ICAgICAgICAgICAgICAgICAgICAgICAgIFRoYXQgaXMgbXkgaHlwb3RoZXNpcy4gPGJyPgogICAg
ICAgICAgICAgICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICBBbnkg
c3VnZ2VzdGlvbiBhYm91dCB0aGUgdXNhZ2Ugb2YgU2Vzc2lvbgogICAgICAgICAgICAgICAgICAg
ICAgICAgIEhhbmRsZT8gPGJyPgogICAgICAgICAgICAgICAgICAgICAgICAgIDxicj4KICAgICAg
ICAgICAgICAgICAgICAgICAgICBOT8KgwqDCoMKgwqAgQ29tbWFuZMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFZpcnR1YWwvUmVhbAogICAgICAgICAgICAgICAgICAgICAgICAgIEhhbmRsZcKgwqDCoMKg
wqDCoMKgwqAgTE9DIDEuIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICBDcmVhdGVQcmlt
YXJ5KEVLKSByZWFsPTgwMDAwMDAwLAogICAgICAgICAgICAgICAgICAgICAgICAgIHZpcnR1YWw9
ODAwMDAwMDAgODM4MSAyLiA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgSGllcmFyY2h5
Q2hhbmdlQXV0aDEgODQyMSAzLgogICAgICAgICAgICAgICAgICAgICAgICAgIEhpZXJhcmNoeUNo
YW5nZUF1dGgyIDg0MzEgNC4gPGJyPgogICAgICAgICAgICAgICAgICAgICAgICAgIFN0YXJ0QXV0
aFNlc3Npb24oUG9saWN5KSByZWFsPTMwMDAwMDAsIDxicj4KICAgICAgICAgICAgICAgICAgICAg
ICAgICB2aXJ0dWFsPTMwMDAwMDAgODQ4MCA1LgogICAgICAgICAgICAgICAgICAgICAgICAgIFBv
bGljeVNlY3JldChFTkRPUlNFTUVOVCkgODQ5NCA2LiA8YnI+CiAgICAgICAgICAgICAgICAgICAg
ICAgICAgQ3JlYXRlKE1LKSA4NTE1IDcuwqDCoMKgCiAgICAgICAgICAgICAgICAgICAgICAgICAg
UG9saWN5U2VjcmV0KEVORE9SU0VNRU5UKSA4NTI5IDguwqDCoMKgIExvYWQoTUspCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgICAgICAgICAgICAgIHJlYWw9ODAw
MDAwMDEsIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICB2aXJ0dWFsPTgwMDAwMDAxIDg1
NDIgOS7CoMKgwqAgRXZpY3QoTUspIDg1NTIgMTAuCiAgICAgICAgICAgICAgICAgICAgICAgICAg
Q3JlYXRlKFNLKSA4NTkwIDExLiA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgTG9hZChT
SykgcmVhbD04MDAwMDAwMSwgdmlydHVhbD04MDAwMDAwMiA4NTk4CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgMTIuIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICBQb2xpY3lTZWNyZXQo
RU5ET1JTRU1FTlQpIDg2MDkgMTMuwqDCoMKgCiAgICAgICAgICAgICAgICAgICAgICAgICAgQ3Jl
YXRlKEFLKSA4NjM1IDE0LiA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgUG9saWN5U2Vj
cmV0KEVORE9SU0VNRU5UKSA4NjQ1IDE1LsKgwqDCoCBMb2FkKEFLKQogICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlYWw9ODAwMDAwMDEsIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICB2
aXJ0dWFsPTgwMDAwMDAzIDg2NTUgMTYuwqDCoMKgCiAgICAgICAgICAgICAgICAgICAgICAgICAg
Rmx1c2hDb250ZXh0KFBPTElDWSkgODY2NCAxNy4gPGJyPgogICAgICAgICAgICAgICAgICAgICAg
ICAgIFN0YXJ0QXV0aFNlc3Npb24oUE9MSUNZKSByZWFsPTMwMDAwMDAsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmlydHVhbD0zMDAwMDAwIDg2NjggMTguIDxicj4KICAgICAgICAgICAgICAg
ICAgICAgICAgICBTdGFydEF1dGhTZXNzaW9uKEhNQUMpIHJlYWw9MjAwMDAwMSwKICAgICAgICAg
ICAgICAgICAgICAgICAgICB2aXJ0dWFsPTIwMDAwMDEgODY3OCAxOS4gPGJyPgogICAgICAgICAg
ICAgICAgICAgICAgICAgIENvbXB1dGVDb21tYW5kSE1BQyhMb2FkRXh0ZXJuYWwpCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmVhbD04MDAwMDAwMCwgPGJyPgogICAgICAgICAgICAgICAgICAg
ICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAg
ICAgICAgICAgICAgICAgICAgPC9ibG9ja3F1b3RlPgogICAgICAgICAgICAgICAgICA8L2Jsb2Nr
cXVvdGU+CiAgICAgICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgICAgPC9ibG9j
a3F1b3RlPgogICAgICAgICAgICAgIHZpcnR1YWw9ODAwMDAwMDQgPGJyPgogICAgICAgICAgICAg
IDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgICAgICAgICAgPGJsb2NrcXVvdGUgdHlw
ZT0iY2l0ZSI+CiAgICAgICAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAg
ICAgICAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgICAgICAgICAg
ICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICAgICAgICAgICAgICAgIDxi
bG9ja3F1b3RlIHR5cGU9ImNpdGUiPjM3MDYgMjAuCiAgICAgICAgICAgICAgICAgICAgICAgICAg
Q29tcHV0ZUNvbW1hbmRITUFDKEhNQUNfU3RhcnQpIHJlYWw9ODAwMDAwMDEsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgICAgICAgICAgICAgIHZpcnR1YWw9ODAw
MDAwMDUgMzcwNiAyMS7CoMKgwqAgUG9saWN5U2VjcmV0KFNLKQogICAgICAgICAgICAgICAgICAg
ICAgICAgIDg3MTEgMjIuIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICBGbHVzaENvbnRl
eHQoSE1BQykgODcxNyAyMy4KICAgICAgICAgICAgICAgICAgICAgICAgICBGbHVzaENvbnRleHQo
UE9MSUNZKSA4NzI0IDI0LiA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgQ2VydGlmeUNy
ZWF0aW9uKFNLKSA4NzM4IDI1LgogICAgICAgICAgICAgICAgICAgICAgICAgIFN0YXJ0QXV0aFNl
c3Npb24oUE9MSUNZKSA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgcmVhbD0zMDAwMDAw
LCB2aXJ0dWFsPTMwMDAwMDEgODc0NSAyNi4KICAgICAgICAgICAgICAgICAgICAgICAgICBTdGFy
dEF1dGhTZXNzaW9uKEhNQUMpIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICByZWFsPTIw
MDAwMDEsIHZpcnR1YWw9MjAwMDAwMCA4NzU0IDI3LiA8YnI+CiAgICAgICAgICAgICAgICAgICAg
ICAgICAgQ29tcHV0ZUNvbW1hbmRITUFDKExvYWRFeHRlcm5hbCkKICAgICAgICAgICAgICAgICAg
ICAgICAgICByZWFsPTgwMDAwMDAwLCA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgIDwvYmxv
Y2txdW90ZT4KICAgICAgICAgICAgICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgICAg
ICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAg
ICAgICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAg
ICAgICAgICAgICAgdmlydHVhbD04MDAwMDAwNSA8YnI+CiAgICAgICAgICAgICAgPGJsb2NrcXVv
dGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4K
ICAgICAgICAgICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICAgICAg
ICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICAgICAgICAgICAgICA8Ymxv
Y2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICAgICAgICAgICAgICAgICAgPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSI+ODc4MiAyOC4KICAgICAgICAgICAgICAgICAgICAgICAgICBDb21wdXRlQ29t
bWFuZEhNQUMoSE1BQ19TdGFydCkgcmVhbD04MDAwMDAwMSwKICAgICAgICAgICAgICAgICAgICAg
ICAgICA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgdmlydHVhbD04MDAwMDAwNCA4Nzgy
IDI5LsKgwqDCoCBQb2xpY3lTZWNyZXQoU0spCiAgICAgICAgICAgICAgICAgICAgICAgICAgODc4
OSA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgICAgICAg
ICAgICAgIFRoZSB3aG9sZcKgIHNvdXJjZSBwcm9ncmFtIGNhbiBiZSBmb3VuZCBoZXJlLiA8YnI+
CiAgICAgICAgICAgICAgICAgICAgICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4
dCIKaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL3RwbTItdHNzL2ZpbGVzLzE1MTY2MTIv
dHBtdGVzdC5jcHBfMHg5OGVfMiIKICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1vei1kby1u
b3Qtc2VuZD0idHJ1ZSI+aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL3RwbTItdHNzL2ZpbGVzLzE1
MTY2MTIvdHBtdGVzdC5jcHBfMHg5OGVfMjwvYT4KICAgICAgICAgICAgICAgICAgICAgICAgICA8
YnI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgLnQgPGJyPgogICAgICAgICAgICAgICAgICAg
ICAgICAgIHh0IDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICA8YnI+CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgICAgICAgICAgICAgIEtpbmQgcmVnYXJk
cywgPGJyPgogICAgICAgICAgICAgICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLcKgPGJyPgogICAgICAgICAgICAgICAgICAgICAgICAgIFlhc3VoaXJvIEhvc29k
YSA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgICAgICAg
ICAgICAgIE5UVCBFbGVjdHJvbmljcyBDb3Jwb3JhdGlvbiDvvIhORUwpIDxicj4KICAgICAgICAg
ICAgICAgICAgICAgICAgICBTZWN1cml0eSBTdXBwb3J0IFByb2plY3QgPGJyPgogICAgICAgICAg
ICAgICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICAgICAgICAgICAgICA8YnI+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fIDxicj4KICAgICAgICAg
ICAgICAgICAgICAgICAgICB0cG0yIG1haWxpbmcgbGlzdCA8YnI+CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+dHBtMkBsaXN0cy4wMS5v
cmc8L2E+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgICAgICAg
ICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Rw
bTIiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBtb3otZG8tbm90LXNlbmQ9InRydWUiPmh0
dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMjwvYT4KICAgICAgICAgICAg
ICAgICAgICAgICAgICA8YnI+CiAgICAgICAgICAgICAgICAgICAgICAgIDwvYmxvY2txdW90ZT4K
ICAgICAgICAgICAgICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgICAgICAgICAgICA8
L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgICAg
ICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAg
ICAgPGJyPgogICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICA8L2Jsb2NrcXVvdGU+
CiAgICAgICAgICA8YnI+CiAgICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8L2Jsb2NrcXVvdGU+
CiAgICAgIDxwPjxicj4KICAgICAgPC9wPgogICAgICA8cHJlIGNsYXNzPSJtb3otc2lnbmF0dXJl
IiBjb2xzPSI3MiI+LS0gCgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxwPjxicj4KICAg
IDwvcD4KICAgIDxwcmUgY2xhc3M9Im1vei1zaWduYXR1cmUiIGNvbHM9IjcyIj4tLSAKCjwvcHJl
PgogIDwvYm9keT4KPC9odG1sPgo=

--===============3284703654146489629==--

