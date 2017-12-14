Content-Type: multipart/mixed; boundary="===============1952204787368451305=="
MIME-Version: 1.0
From: Yasuhiro Hosoda <hosoda-yasuhiro at ntt-el.com>
Subject: [tpm2] tpm2-tss question
Date: Thu, 14 Dec 2017 15:58:57 +0900
Message-ID: <52a6881d-5626-3dde-3ad0-2b06a1726502@ntt-el.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1952204787368451305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

MY name is Yasuhiro Hosoda.


I am developing a program using TSS1.0(Nov=EF=BC=91=EF=BC=8E2016).
I encountered a problem with PolicySecret error 0x98e and need help.
My program uses tpmtest.cpp as a base of development.
The situation is as follows:

1 Create TPM Keys like this.

EK
=EF=BD=9C--------
=EF=BD=9C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 |
MK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AK
=EF=BD=9C
SK

2 Execute PolicySecret twice using HMAC session. At first, it ends =

without error. Then it ends with 0x98e
For clarification, I print out the values of Virtual Handle and Real Handle.
The value of Virtual/Real Handles differ at 2nd excution of the command. =

(See NO 25/26 Below)

I understand that the resource manager assigns Virtual Handle and my =

program calculates HMAC using that handles.
On the other hand, TPM may calculate HMAC using Real Handle.
That is my hypothesis.

Any suggestion about the usage of Session Handle?

NO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Command=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Virtual/Real Handle=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 LOC
1.=C2=A0=C2=A0=C2=A0 CreatePrimary(EK) real=3D80000000, virtual=3D80000000 =
8381
2.=C2=A0=C2=A0=C2=A0 HierarchyChangeAuth1 8421
3.=C2=A0=C2=A0=C2=A0 HierarchyChangeAuth2 8431
4.=C2=A0=C2=A0=C2=A0 StartAuthSession(Policy) real=3D3000000, virtual=3D300=
0000 8480
5.=C2=A0=C2=A0=C2=A0 PolicySecret(ENDORSEMENT) 8494
6.=C2=A0=C2=A0=C2=A0 Create(MK) 8515
7.=C2=A0=C2=A0=C2=A0 PolicySecret(ENDORSEMENT) 8529
8.=C2=A0=C2=A0=C2=A0 Load(MK) real=3D80000001, virtual=3D80000001 8542
9.=C2=A0=C2=A0=C2=A0 Evict(MK) 8552
10.=C2=A0=C2=A0=C2=A0 Create(SK) 8590
11.=C2=A0=C2=A0=C2=A0 Load(SK) real=3D80000001, virtual=3D80000002 8598
12.=C2=A0=C2=A0=C2=A0 PolicySecret(ENDORSEMENT) 8609
13.=C2=A0=C2=A0=C2=A0 Create(AK) 8635
14.=C2=A0=C2=A0=C2=A0 PolicySecret(ENDORSEMENT) 8645
15.=C2=A0=C2=A0=C2=A0 Load(AK) real=3D80000001, virtual=3D80000003 8655
16.=C2=A0=C2=A0=C2=A0 FlushContext(POLICY) 8664
17.=C2=A0=C2=A0=C2=A0 StartAuthSession(POLICY) real=3D3000000, virtual=3D30=
00000 8668
18.=C2=A0=C2=A0=C2=A0 StartAuthSession(HMAC) real=3D2000001, virtual=3D2000=
001 8678
19.=C2=A0=C2=A0=C2=A0 ComputeCommandHMAC(LoadExternal) real=3D80000000, vir=
tual=3D80000004 3706
20.=C2=A0=C2=A0=C2=A0 ComputeCommandHMAC(HMAC_Start) real=3D80000001, virtu=
al=3D80000005 3706
21.=C2=A0=C2=A0=C2=A0 PolicySecret(SK) 8711
22.=C2=A0=C2=A0=C2=A0 FlushContext(HMAC) 8717
23.=C2=A0=C2=A0=C2=A0 FlushContext(POLICY) 8724
24.=C2=A0=C2=A0=C2=A0 CertifyCreation(SK) 8738
25.=C2=A0=C2=A0=C2=A0 StartAuthSession(POLICY) real=3D3000000, virtual=3D30=
00001 8745
26.=C2=A0=C2=A0=C2=A0 StartAuthSession(HMAC) real=3D2000001, virtual=3D2000=
000 8754
27.=C2=A0=C2=A0=C2=A0 ComputeCommandHMAC(LoadExternal) real=3D80000000, vir=
tual=3D80000005 8782
28.=C2=A0=C2=A0=C2=A0 ComputeCommandHMAC(HMAC_Start) real=3D80000001, virtu=
al=3D80000004 8782
29.=C2=A0=C2=A0=C2=A0 PolicySecret(SK) 8789

The whole=C2=A0 source program can be found here.
https://github.com/intel/tpm2-tss/files/1516612/tpmtest.cpp_0x98e_2.txt


Kind regards,

-- =

Yasuhiro Hosoda

NTT Electronics Corporation =EF=BC=88NEL)
Security Support Project



--===============1952204787368451305==--

