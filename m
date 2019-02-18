Content-Type: multipart/mixed; boundary="===============5731691993812498842=="
MIME-Version: 1.0
From: Petko Manolov <sti at nucleusys.com>
Subject: Re: [tpm2] facilitating BIOS update with seamless PCR policy change
Date: Mon, 18 Feb 2019 10:20:26 +0100
Message-ID: <20190218092026.GA5320@carbon>
In-Reply-To: 20190218084837.GA4620@carbon
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5731691993812498842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I am sorry that this didn't go through because of the attached script.  I'm =

embedding it to this email so i'd like to apologize about the bloat.

---

#!/bin/bash

source common.sh

#   Create a signing authority
openssl genrsa -out signing_key_private.pem 2048
openssl rsa -in signing_key_private.pem -out signing_key_public.pem -pubout
tpm2_loadexternal -G rsa -a o -u signing_key_public.pem -o signing_key.ctx \
	-n signing_key.name

echo "Signing authority created"

#   Create a policy to be authorized like a pcr policy:
tpm2_pcrlist -L $PCRS -o pcrs.sha256
tpm2_startauthsession -S session.ctx
tpm2_policypcr -S session.ctx -L $PCRS -F pcrs.sha256 -f pcr.policy
tpm2_flushcontext -S session.ctx
rm -f session.ctx

echo "pcr policy created"

#   Sign the policy
openssl dgst -sha256 -sign signing_key_private.pem -out pcr.signature pcr.p=
olicy

echo "policy is signed"

#   Authorize the policy in the policy digest:
tpm2_startauthsession -S session.ctx
tpm2_policyauthorize -S session.ctx -o authorized.policy -f pcr.policy \
	-n signing_key.name
tpm2_flushcontext -S session.ctx
rm -f session.ctx

echo "policy authorized"

#   Create a TPM object like a sealing object with the authorized policy
#   based authentication:
echo "secret to seal 123" > secret_file
tpm2_createprimary -Q -a o -g sha256 -G rsa -o prim.ctx
tpm2_create -Q -g sha256 -u sealing_pubkey.pub -r sealing_prikey.pub \
	-I secret_file -C prim.ctx -L authorized.policy

echo "sealing object created"

#   Satisfy policy and unseal the secret:
tpm2_verifysignature -c signing_key.ctx -G sha256 -m pcr.policy \
	-s pcr.signature -t verification.tkt -f rsassa
tpm2_startauthsession -a -S session.ctx
tpm2_policypcr -Q -S session.ctx -L $PCRS -f pcr.policy
tpm2_policyauthorize -S session.ctx -o authorized.policy -f pcr.policy \
	-n signing_key.name -t verification.tkt
tpm2_load -Q -C prim.ctx -u sealing_pubkey.pub -r sealing_prikey.pub \
	-o sealing_key.ctx
tpm2_unseal -p "session:session.ctx" -c sealing_key.ctx -o unsealed
cat unsealed
tpm2_flushcontext -S session.ctx
rm -f session.ctx unsealed

echo "the end"

---


thanks,
Petko


On 19-02-18 09:48:37, Petko Manolov wrote:
> 	Hello again,
> =

> I managed to get authorized PCR policies to work for me.  The attached sc=
ript =

> works fine on my thinkpad and on rpi3 with Infineon's SLB9670 SPI TPM2.
> =

> However, i stumbled upon a problem with an fTPM implementation in a very =
recent =

> AMI BIOS.  Everything seems to be working properly, until i get tpm2_unse=
al to =

> give me the error below.  The tpm2-tools is built with at-the-time tip of=
 git =

> commit id:
> =

> 	872076e1b31f22b18391c6761d47575a93891cd7
> =

> tpm2_unseal -v:
> =

> 	tool=3D"tpm2_unseal" version=3D"3.0.2-858-g88956e75" tctis=3D"dynamic" t=
cti-default=3Dtabrmd dlclose=3Denabled
> =

> tpm-tss is v2.1.0 and tpm-abrmd is v2.0.3.  Unfortunately the error messa=
ge does =

> not mean much for me so any help will be greatly appreciated.
> =

> =

> thanks,
> Petko
> =

> =

> =

> ---
> =

> Generating RSA private key, 2048 bit long modulus
> ..............................+++++
> ...........................................+++++
> e is 65537 (0x10001)
> writing RSA key
> transient-context: signing_key.ctx
> name: 0x000b5e069ba4b591842c25155d812f635970dabe7cee663aff121088940f88e2d=
a80
> Signing authority created
> sha256:
>   0 : 0x647992CBC9EEBF49D367559D870620C324B1A4307EB2A6166F1ACEC0DC186AEA
>   1 : 0x519B03509291B643DA7FEC4407FFC47C1C18AF706A611ECA1C159D4608342338
>   2 : 0x369BB94CEB4A1DF8E76720141B64C57EC70E6C620F07B27E335E70AD2DDC25DB
>   3 : 0x369BB94CEB4A1DF8E76720141B64C57EC70E6C620F07B27E335E70AD2DDC25DB
> session-context: session.ctx
> policy-digest: 0x22035897291FE4681D7800685BFC5C73EBCBB88C7A579AB20C2E345A=
9815FDFE
> pcr policy created
> policy is signed
> session-context: session.ctx
> 45a41a53c9f74f09b72151af6ffdd199fe1129eff2b749b8e481b6b21f2281f1
> policy authorized
> sealing object created
> session-context: session.ctx
> 45a41a53c9f74f09b72151af6ffdd199fe1129eff2b749b8e481b6b21f2281f1
> WARNING:esys:../tpm2-tss/src/tss2-esys/api/Esys_Unseal.c:295:Esys_Unseal_=
Finish() Received TPM Error
> ERROR:esys:../tpm2-tss/src/tss2-esys/api/Esys_Unseal.c:101:Esys_Unseal() =
Esys Finish ErrorCode (0x0000008f)
> ERROR: Esys_Unseal(0x8F) - tpm:handle(unk):invalid nonce size or nonce va=
lue mismatch
> ERROR: Unseal failed!
> ERROR: Unable to run tpm2_unseal
> cat: unsealed: No such file or directory
> the end



--===============5731691993812498842==--

