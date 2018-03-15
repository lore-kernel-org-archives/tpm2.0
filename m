Content-Type: multipart/mixed; boundary="===============8956069589258408824=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2_nvwrite failing
Date: Thu, 15 Mar 2018 22:03:01 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FEF442A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAAxBZJtjWDzxwfMTfikPqucRjaAxwZGMaz5Opb7mk=uM5bQQrQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8956069589258408824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You're using the owner hierarchy for authorization, where
as you want to use the nv index for authorization.
So when you write and read, your -a needs to match your -x value.

This worked for me:
#!/bin/sh

echo "my nv daat" > /tmp/idfile

NVRAM=3D0x1800005
HIERACHY=3D0x40000001
PCRS=3Dsha256:0,1,2,3
PCRVALUE=3D/tmp/pcrvalue
POLICY=3D/tmp/policy

echo "Releasing NVRAM - this might fail, but this is OK"
tpm2_nvrelease -x $NVRAM -a $HIERACHY

echo "Constructing policy"
tpm2_pcrlist -Q -L $PCRS -o $PCRVALUE
tpm2_createpolicy -P -L $PCRS -F $PCRVALUE -f $POLICY

echo "Defining area"
tpm2_nvdefine -x $NVRAM -a $HIERACHY -s 64  -L $POLICY -t "policywrite|poli=
cyread"
#tpm2_nvdefine -x $NVRAM -a $HIERACHY -s 64 -t "policyread|policywrite"

echo "Writing ID"
cat /tmp/idfile | tpm2_nvwrite -x $NVRAM -a $NVRAM -L $PCRS -F $PCRVALUE
#cat /tmp/idfile | tpm2_nvwrite -x $NVRAM -a $HIERACHY

echo "Reading ID - first attempt should fail if the policy works"
tpm2_nvread -x $NVRAM -a $NVRAM

echo "Reading ID - second attempt should work"
tpm2_nvread -x $NVRAM -a $NVRAM -L $PCRS -F $PCRVALUE

--- EOF ----


As far as nv.sh failures, I don't see them on the simulator. So I would nee=
d more information
to understand what the issue you might be.


From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Ian Oliver
Sent: Tuesday, March 13, 2018 6:06 AM
To: tpm2(a)lists.01.org
Subject: [tpm2] tpm2_nvwrite failing

Hi

Using 1.3-rc2 of tpm2_tools
We're seeing tpm2_nvwrite fail with policies, both in the nv.sh test file a=
nd when run manually
Here's the script which basically follows nv.sh.=C2=A0 NB: the file /tmp/id=
file exists and contains data!


#!/bin/sh

NVRAM=3D0x1800005
HIERACHY=3D0x40000001
PCRS=3Dsha256:0,1,2,3
PCRVALUE=3D/tmp/pcrvalue
POLICY=3D/tmp/policy

echo "Releasing NVRAM - this might fail, but this is OK"
tpm2_nvrelease -x $NVRAM -a $HIERACHY

echo "Constructing policy"
tpm2_pcrlist -Q -L $PCRS -o $PCRVALUE
tpm2_createpolicy -P -L $PCRS -F $PCRVALUE -f $POLICY

echo "Defining area"
tpm2_nvdefine -x $NVRAM -a $HIERACHY -s 64=C2=A0 -L $POLICY -t "policyread|=
policywrite"
#tpm2_nvdefine -x $NVRAM -a $HIERACHY -s 64 -t "policyread|policywrite"

echo "Writing ID"
cat /tmp/idfile | tpm2_nvwrite -x $NVRAM -a $HIERACHY -L $PCRS -F $PCRVALUE
#cat /tmp/idfile | tpm2_nvwrite -x $NVRAM -a $HIERACHY

echo "Reading ID - first attempt should fail if the policy works"
tpm2_nvread -x $NVRAM -a $HIERACHY
tpm2_nvread -x $NVRAM -a $HIERACHY -L $PCRS -F $PCRVALUE


Specifically:

15$tpm2_nvrelease -x 0x1800005 -a 0x40000001
16$tpm2_pcrlist -Q -L sha256:0,1,2,3 -o /tmp/pcrvalue
17$tpm2_createpolicy -P -L sha256:0,1,2,3 -F /tmp/pcrvalue -f /tmp/policy
18$tpm2_nvdefine -x 0x1800005 -a 0x40000001 -s 64 -L /tmp/policy -t "policy=
read|policywrite"
19$tpm2_nvlist

0x1800005:
=C2=A0 hash algorithm:
=C2=A0=C2=A0=C2=A0 friendly: sha256
=C2=A0=C2=A0=C2=A0 value: 0xB
=C2=A0 attributes:
=C2=A0=C2=A0=C2=A0 friendly: policywrite|policyread
=C2=A0=C2=A0=C2=A0 value: 0x8000800
=C2=A0 size: 64
=C2=A0 authorization policy: 60DF98CF0931EE42B5372DBC49E7B1966559A62A159B12=
C90556240D37E2D938

20$echo -n "test" | tpm2_nvwrite -x 0x1800005 -a 0x40000001 -L sha256:0,1,2=
,3 -F /tmp/pcrvalue
ERROR: Failed to write NV area at index 0x1800005 (25165829) offset 0x0. Er=
ror:0x12f
21$cat /tmp/idfile | tpm2_nvwrite -x 0x1800005 -a 0x40000001 -L sha256:0,1,=
2,3 -F /tmp/pcrvalue
ERROR: Failed to write NV area at index 0x1800005 (25165829) offset 0x0. Er=
ror:0x12f
22$tpm2_rc_decode 0x12f
error layer
=C2=A0 hex: 0x0
=C2=A0 identifier: TSS2_TPM_ERROR_LEVEL
=C2=A0 description: Error produced by the TPM
format 0 error code
=C2=A0 hex: 0x2f
=C2=A0 name: TPM_RC_AUTH_UNAVAILABLE
=C2=A0 description: authValue or authPolicy is not available for selected e=
ntity.
t.
Ian


-- =

Dr. Ian Oliver
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:=C2=A0 via Amazon
Twitter: @i_j_oliver

--===============8956069589258408824==--

