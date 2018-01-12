Content-Type: multipart/mixed; boundary="===============0265389273377538505=="
MIME-Version: 1.0
From: Yasuhiro Hosoda <hosoda-yasuhiro at ntt-el.com>
Subject: Re: [tpm2] tpm2-tss question
Date: Fri, 12 Jan 2018 18:46:34 +0900
Message-ID: <3934a704-80e0-d595-fcd7-4edec7d33c42@ntt-el.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563FE7163A@ORSMSX106.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0265389273377538505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Mr. Roberts, William

Thank you for your advice.
I had already checked the details of this error code.
My understanding is that the problem is not the setting of the auth
but there occurs the discrepancy between the virtual handles and
the real handles in the resource manager.
Any help will be greatly appreciated

Regard,
> 0x98e is:
>
> $ ./tpm2_rc_decode 0x98e
> error layer
>    hex: 0x0
>    identifier: TSS2_TPM_RC_LAYER
>    description: Error produced by the TPM
> format 1 error code
>    hex: 0x0e
>    identifier: TPM2_RC_AUTH_FAIL
>    description: the authorization HMAC check failed and DA counter increm=
ented
> session
>    hex: 0x100
>    identifier: TPM2_RC_1
>    description:  (null)
>
> SO it looks like you're not setting up the auth properly in the session.
>
>> -----Original Message-----
>> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Yasuhiro Ho=
soda
>> Sent: Wednesday, December 13, 2017 10:59 PM
>> To: tpm2(a)lists.01.org
>> Subject: [tpm2] tpm2-tss question
>>
>> MY name is Yasuhiro Hosoda.
>>
>>
>> I am developing a program using TSS1.0(Nov=EF=BC=91=EF=BC=8E2016).
>> I encountered a problem with PolicySecret error 0x98e and need help.
>> My program uses tpmtest.cpp as a base of development.
>> The situation is as follows:
>>
>> 1 Create TPM Keys like this.
>>
>> EK
>> =EF=BD=9C--------
>> =EF=BD=9C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 |
>> MK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AK
>> =EF=BD=9C
>> SK
>>
>> 2 Execute PolicySecret twice using HMAC session. At first, it ends witho=
ut error.
>> Then it ends with 0x98e For clarification, I print out the values of Vir=
tual Handle
>> and Real Handle.
>> The value of Virtual/Real Handles differ at 2nd excution of the command.
>> (See NO 25/26 Below)
>>
>> I understand that the resource manager assigns Virtual Handle and my pro=
gram
>> calculates HMAC using that handles.
>> On the other hand, TPM may calculate HMAC using Real Handle.
>> That is my hypothesis.
>>
>> Any suggestion about the usage of Session Handle?
>>
>> NO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Command=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Virtual/Real Handle=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 LOC 1.=C2=A0=C2=A0=C2=A0 CreatePrimary(EK)
>> real=3D80000000, virtual=3D80000000 8381 2.=C2=A0=C2=A0=C2=A0 HierarchyC=
hangeAuth1 8421
>> 3.=C2=A0=C2=A0=C2=A0 HierarchyChangeAuth2 8431 4.=C2=A0=C2=A0=C2=A0 Star=
tAuthSession(Policy) real=3D3000000,
>> virtual=3D3000000 8480 5.=C2=A0=C2=A0=C2=A0 PolicySecret(ENDORSEMENT) 84=
94 6.=C2=A0=C2=A0=C2=A0 Create(MK) 8515
>> 7.=C2=A0=C2=A0=C2=A0 PolicySecret(ENDORSEMENT) 8529 8.=C2=A0=C2=A0=C2=A0=
 Load(MK) real=3D80000001,
>> virtual=3D80000001 8542 9.=C2=A0=C2=A0=C2=A0 Evict(MK) 8552 10.=C2=A0=C2=
=A0=C2=A0 Create(SK) 8590 11.=C2=A0=C2=A0=C2=A0 Load(SK)
>> real=3D80000001, virtual=3D80000002 8598 12.=C2=A0=C2=A0=C2=A0 PolicySec=
ret(ENDORSEMENT) 8609
>> 13.=C2=A0=C2=A0=C2=A0 Create(AK) 8635 14.=C2=A0=C2=A0=C2=A0 PolicySecret=
(ENDORSEMENT) 8645 15.=C2=A0=C2=A0=C2=A0 Load(AK)
>> real=3D80000001, virtual=3D80000003 8655 16.=C2=A0=C2=A0=C2=A0 FlushCont=
ext(POLICY) 8664
>> 17.=C2=A0=C2=A0=C2=A0 StartAuthSession(POLICY) real=3D3000000, virtual=
=3D3000000 8668
>> 18.=C2=A0=C2=A0=C2=A0 StartAuthSession(HMAC) real=3D2000001, virtual=3D2=
000001 8678
>> 19.=C2=A0=C2=A0=C2=A0 ComputeCommandHMAC(LoadExternal) real=3D80000000, =
virtual=3D80000004
>> 3706 20.=C2=A0=C2=A0=C2=A0 ComputeCommandHMAC(HMAC_Start) real=3D8000000=
1,
>> virtual=3D80000005 3706 21.=C2=A0=C2=A0=C2=A0 PolicySecret(SK) 8711 22.=
=C2=A0=C2=A0=C2=A0 FlushContext(HMAC) 8717
>> 23.=C2=A0=C2=A0=C2=A0 FlushContext(POLICY) 8724 24.=C2=A0=C2=A0=C2=A0 Ce=
rtifyCreation(SK) 8738
>> 25.=C2=A0=C2=A0=C2=A0 StartAuthSession(POLICY) real=3D3000000, virtual=
=3D3000001 8745
>> 26.=C2=A0=C2=A0=C2=A0 StartAuthSession(HMAC) real=3D2000001, virtual=3D2=
000000 8754
>> 27.=C2=A0=C2=A0=C2=A0 ComputeCommandHMAC(LoadExternal) real=3D80000000, =
virtual=3D80000005
>> 8782 28.=C2=A0=C2=A0=C2=A0 ComputeCommandHMAC(HMAC_Start) real=3D8000000=
1,
>> virtual=3D80000004 8782 29.=C2=A0=C2=A0=C2=A0 PolicySecret(SK) 8789
>>
>> The whole=C2=A0 source program can be found here.
>> https://github.com/intel/tpm2-tss/files/1516612/tpmtest.cpp_0x98e_2.txt
>>
>>
>> Kind regards,
>>
>> --
>> Yasuhiro Hosoda
>>
>> NTT Electronics Corporation =EF=BC=88NEL)
>> Security Support Project
>>
>>
>> _______________________________________________
>> tpm2 mailing list
>> tpm2(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/tpm2


-- =

  __________________________________________
/ =E7=B4=B0=E7=94=B0=E6=B3=B0=E5=BC=98
|=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=
=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80
| NTT=E3=82=A8=E3=83=AC=E3=82=AF=E3=83=88=E3=83=AD=E3=83=8B=E3=82=AF=E3=82=
=B9=E6=A0=AA=E5=BC=8F=E4=BC=9A=E7=A4=BE=EF=BC=88NEL)
|
| =E3=82=B7=E3=82=B9=E3=83=86=E3=83=A0=E5=8C=96=E6=94=AF=E6=8F=B4=E3=82=BB=
=E3=83=B3=E3=82=BF=E3=80=80=E3=80=80
| =E3=82=BB=E3=82=AD=E3=83=A5=E3=83=AA=E3=83=86=E3=82=A3=E6=8A=80=E8=A1=93=
=E6=94=AF=E6=8F=B4=E3=83=97=E3=83=AD=E3=82=B8=E3=82=A7=E3=82=AF=E3=83=88=E3=
=80=80
|=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=
=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=
=80=80=E3=80=80=E3=80=80
|=E3=80=92221-0031 =E7=A5=9E=E5=A5=88=E5=B7=9D=E7=9C=8C=E6=A8=AA=E6=B5=9C=
=E5=B8=82=E7=A5=9E=E5=A5=88=E5=B7=9D=E5=8C=BA
|=E3=80=80=E6=96=B0=E6=B5=A6=E5=B3=B6=E7=94=BA1-1-32
|  =E3=83=8B=E3=83=A5=E3=83=BC=E3=82=B9=E3=83=86=E3=83=BC=E3=82=B8=E6=A8=AA=
=E6=B5=9C
|
|=E3=80=80Tel 050-9000-6109/050-9000-6485(=E7=9B=B4)
|   (9225(=E5=86=85))
|  Fax 045-453-9620
|  E-mail: hosoda-yasuhiro(a)ntt-el.com
|________________________________________/


--===============0265389273377538505==--

