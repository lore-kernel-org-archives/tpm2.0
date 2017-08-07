Content-Type: multipart/mixed; boundary="===============6669294378619056971=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Question about eviction
Date: Mon, 07 Aug 2017 17:42:45 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563EAABF6E@ORSMSX103.amr.corp.intel.com>
In-Reply-To: CAJ-RDKd_PbzRez5DVk2QCiPqBKRi=Ek3zqffyDejVPmxipii8w@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6669294378619056971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For the generation of unique, section 27.5.3.1 describes how it is done in =
detail:
https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1-Arc=
hitecture-01.38.pdf
Since your key was RSA, unique is the public modules of the key.

Decoding your error code:
$ ./tools/tpm2_rc_decode 0x284
error layer
  hex: 0x0
  identifier: TSS2_TPM_ERROR_LEVEL
  description: Error produced by the TPM
format 1 error code
  hex: 0x04
  identifier: TPM_RC_VALUE
  description: value is out of range or is not correct for the context
handle
  hex:0x200
  identifier:  TPM_RC_2
  description:  (null)

I think points us to the problem. Based on page 118 of "A Practical Guide t=
o TPM2.0",
It states, "TPM2_FlushContext removes a key from the TPM.". The Resource Ma=
nager (RM)
is calling FLushContext and thus your just creating primary keys that are g=
etting removed
when the command exits.

You're options are 3 fold:
1. use the -c option for saving the key that can be re-loaded from LoadCont=
ext.
    See test/system/test_tpm2_createprimary_all.sh
2. Don't use an RM and use the --tcti=3Ddevice option. Note that no other c=
lients can
    Be using the TPM if you do this.
3. Use the experimental tpm-shell branch: =

    https://github.com/williamcroberts/tpm2.0-tools/tree/tpm-shell

From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of yongkwan park
Sent: Monday, August 7, 2017 12:23 AM
To: tpm2(a)lists.01.org
Subject: [tpm2] Question about eviction

Hi folks,

I want to make a primary key and evict it to make it persistent.
But, failed.

Here is what I did accroding to "How to use tpm2 tools",

pi(a)raspberrypi:~/work/TPM2.0-TSS-1.1.0$ tpm2_createprimary -A o -K object=
pass -g 0x000b -G 0x0001
nameAlg =3D 0x000b
type =3D 0x0001

CreatePrimary Succeed ! Handle: 0x800000ff

pi(a)raspberrypi:~/work/TPM2.0-TSS-1.1.0$ tpm2_createprimary -A o -K object=
pass -g 0x000b -G 0x0001
nameAlg =3D 0x000b
type =3D 0x0001

CreatePrimary Succeed ! Handle: 0x800000ff

pi(a)raspberrypi:~/work/TPM2.0-TSS-1.1.0$ tpm2_evictcontrol -A o -H 0x80000=
0ff -S 0x81000100 -P objectpass
persistentHandle: 0x81000100
ERROR: EvictControl failed, error code: 0x284


The following are questions.

Q1. In tools/tpm2_createprimary.c,=C2=A0inPublic->t.publicArea.unique.rsa.t=
.size is set to zero. It is written in the TPM2 spec part1, "The caller may=
 also set the size of this field to zero and the TPM will replace it with a=
 correctly sized structure." I think this means that unique field will be s=
et with random values by TPM. Is it correct?=C2=A0

tpm2_createprimary was executed twice in a row at the previous test. Those =
two tests were successful seeing the messages. If those primary keys were g=
enerated by random values (unique field is zero), result keys would be diff=
erent. But, the handles of two keys(0x800000ff) are the same at the message=
s. Can anyone explain the meaning?

Q2. I tried to evict the primary key with tpm2_evictcontrol, but failed. Ca=
n anyone tell what's wrong at the command?=C2=A0

Thank you.


-- =

Yongkwan "Ethan" Park=C2=A0/ Principle Engineer
------------------------------------------------------------------
Security Platform,Inc.=C2=A0(http://www.securityplatform.co.kr=C2=A0)
CONSEC #C-7, GCCEI Bldg.
12 Daewangpangyo-ro 645beon-gil
Bundang-gu, Seongnam-si, Gyeonggi-do,Korea=C2=A0
T. 82-70-7613-0094
M.=C2=A082-10-5156-8532=C2=A0 =C2=A0 E.=C2=A0yongkwan.park(a)securityplatfo=
rm.co.kr

--===============6669294378619056971==--

