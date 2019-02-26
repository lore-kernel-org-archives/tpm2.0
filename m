Content-Type: multipart/mixed; boundary="===============8403579696895862901=="
MIME-Version: 1.0
From: Petko Manolov <sti at nucleusys.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 20, Issue 17
Date: Tue, 26 Feb 2019 13:20:45 +0200
Message-ID: <20190226112045.GB4322@p310>
In-Reply-To: D707E35E-98C6-4463-87B5-B6F787A3CE98@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8403579696895862901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

	Hey Imran,

Thanks for looking at this one.  Unfortunately i can't reproduce your resul=
ts on =

either of my machines.  Here is a slightly modified script as "-I-" doesn't=
 work =

for me with tpm2_load:

---
#!/bin/bash

rm -f   pcr0.sha256 \
        pcr.signature \
        session.ctx \
        signing_key.ctx \
	sealing_key.ctx \
        signing_key.name \
        signing_key_private.pem \
        signing_key_public.pem


tpm2_clear

openssl genrsa -out signing_key_private.pem 2048
openssl rsa -in signing_key_private.pem -out signing_key_public.pem -pubout
tpm2_loadexternal -G rsa -a o -u signing_key_public.pem -o signing_key.ctx =
-n signing_key.name
tpm2_pcrlist -L sha256:0 -o pcr0.sha256
tpm2_startauthsession -S session.ctx
tpm2_policypcr -S session.ctx -L sha256:0 -F pcr0.sha256 -f pcr.policy
tpm2_flushcontext -S session.ctx
rm -f session.ctx
openssl dgst -sha256 -sign signing_key_private.pem -out pcr.signature pcr.p=
olicy
tpm2_startauthsession -S session.ctx
tpm2_policyauthorize -S session.ctx -o authorized.policy -f pcr.policy -n s=
igning_key.name
tpm2_flushcontext -S session.ctx
rm -f session.ctx
tpm2_createprimary -Q -a o -g sha256 -G rsa -o prim.ctx
echo "primary created"
tpm2_create -Q -g sha256 -u sealing_pubkey.pub -r sealing_prikey.pub -I da-=
key -C prim.ctx -L authorized.policy
echo " -I- "
tpm2_verifysignature -c signing_key.ctx -G sha256 -m pcr.policy -s pcr.sign=
ature -t verification.tkt -f rsassa
tpm2_startauthsession -a -S session.ctx
tpm2_policypcr -Q -S session.ctx -L sha256:0 -f pcr.policy
tpm2_policyauthorize -S session.ctx -o authorized.policy -f pcr.policy -n s=
igning_key.name -t verification.tkt
tpm2_load -Q -C prim.ctx -u sealing_pubkey.pub -r sealing_prikey.pub -o sea=
ling_key.ctx
tpm2_unseal -p "session:session.ctx" -c sealing_key.ctx -o unsealed
echo $unsealed
tpm2_flushcontext -S session.ctx
rm -f session.ctx
---

and the result being the same:

---
Generating RSA private key, 2048 bit long modulus
.....................................................+++++
...+++++
e is 65537 (0x10001)
writing RSA key
transient-context: signing_key.ctx
name: 0x000b2e70e1f0c627f7a6bd6cb39e0b8fb205224b412cc69a69d7a7fccc3c4d1a6204
sha256:
  0 : 0xAE356E2BE05D368ECC8918AC6E0812E046E278B57884729C0859A94330EE9695
session-context: session.ctx
policy-digest: 0x742C12E7BD0AB460FCF76253DBBB95D39C09C09D87E36FDFBBE3A60F41=
DBF635
session-context: session.ctx
47b69be668ccacfc8b1fb50c3740500dc69153439a726b8f86a5e05ea1529ff1
primary created
 -I-
session-context: session.ctx
47b69be668ccacfc8b1fb50c3740500dc69153439a726b8f86a5e05ea1529ff1
WARNING:esys:../tpm2-tss/src/tss2-esys/api/Esys_Unseal.c:295:Esys_Unseal_Fi=
nish() Received TPM Error
ERROR:esys:../tpm2-tss/src/tss2-esys/api/Esys_Unseal.c:101:Esys_Unseal() Es=
ys Finish ErrorCode (0x0000008f)
ERROR: Esys_Unseal(0x8F) - tpm:handle(unk):invalid nonce size or nonce valu=
e mismatch
ERROR: Unseal failed!
ERROR: Unable to run tpm2_unseal
---

---
root(a)alpha-board-a81d160db6b9:/tmp# tpm2_getcap -c properties-fixed | gre=
p -i vendor_string -A2
TPM2_PT_VENDOR_STRING_1:
  raw: 0x496E7465
  value: "Inte"
TPM2_PT_VENDOR_STRING_2:
  raw: 0x6C000000
  value: "l"
TPM2_PT_VENDOR_STRING_3:
  raw: 0x0
  value: ""
TPM2_PT_VENDOR_STRING_4:
  raw: 0x0
  value: ""
root(a)alpha-board-a81d160db6b9:/tmp#  tpm2_getcap --version
tool=3D"tpm2_getcap" version=3D"3.0.2-858-g88956e75" tctis=3D"dynamic" tcti=
-default=3Dtabrmd dlclose=3Denabled
---


I wonder if this could be a build flags issue or something else as the TPM =

version pretty much looks the same?


thanks,
Petko

--===============8403579696895862901==--

