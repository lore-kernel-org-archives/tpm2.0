Content-Type: multipart/mixed; boundary="===============1245290863226453994=="
MIME-Version: 1.0
From: luc.riedhauser at bluewin.ch
Subject: [tpm2] tpm2_create sealing object without user data
Date: Thu, 23 Dec 2021 08:42:31 +0000
Message-ID: <20211223084231.2803.33718@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1245290863226453994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

My goal is to verify the integrity of a file (its hash is 962f4b6aeb8b2d74d=
c595257cb4384fc266283816acc4940622f29ad748bcb6e) with a pcr policy. But I d=
o not need to include a secret user data. So here is what I've done so far:

- tpm2_pcrreset 16
- tpm2_pcrextend 16:sha256=3D962f4b6aeb8b2d74dc595257cb4384fc266283816acc49=
40622f29ad748bcb6e

- `tpm2_createprimary -C o -G rsa2048 -c primary`
- `tpm2_startauthsession -S session`
- `tpm2_policypcr -S session -l sha256:16 -L pcr16_policy`
- `tpm2_flushcontext session`
- `tpm2_create -C primary -g sha256 -u pcr16.pub -r pcr16.priv -L pcr16_pol=
icy` =3D> here I do NOT include any user data
- `tpm2_load -C primary -u pcr16.pub -r pcr16.priv -c pcr16`
- `tpm2_evictcontrol -c pcr16 0x81010000 -C o`

Until now I've created a sealing object that I stored on the NV-RAM. Now I =
want to verify the file against the policy I've just created. So I reset PC=
R16, hash my file again and extend PCR16 with the new hash.

- And now start a policy session with `tpm2_startauthsession --policy-sessi=
on -S session`
- `tpm2_policypcr -S session -l sha256:16` to include the PCR value into th=
e session

Now comes the problem

- tpm2_unseal -p session:session -c 0x81010000

returns an ERROR:

WARNING:esys:src/tss2-esys/api/Esys_Unseal.c:295:Esys_Unseal_Finish() Recei=
ved TPM Error =

ERROR:esys:src/tss2-esys/api/Esys_Unseal.c:98:Esys_Unseal() Esys Finish Err=
orCode (0x0000018a) =

ERROR: Esys_Unseal(0x18A) - tpm:handle(1):the type of the value is not appr=
opriate for the use
ERROR: Unable to run tpm2_unseal

I'm pretty sure that this comes from the fact that I did not include any us=
er data when creating the sealing object.


So my question: If I just want to verify the integrity of a file, is unseal=
 still the right command?
--===============1245290863226453994==--

