Content-Type: multipart/mixed; boundary="===============4416103458880450640=="
MIME-Version: 1.0
From: Oliver, Dario N <dario.n.oliver at intel.com>
Subject: Re: [tpm2] Problem with tpm2_unseal after reboot
Date: Mon, 10 Dec 2018 21:37:02 +0000
Message-ID: <20A6FE0AC912764FB8B5BC5A1A7CB92B2FA007D2@fmsmsx101.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649CB7FDD@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4416103458880450640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The only persistent object I see with tpm2_listpersistent is the child obje=
ct. So I think the parent is not being persisted. =


I am trying again the same set of commands in a NUC device, just to see if =
the problem is not the device itself. After that, I will try you approach a=
nd persist the primary object as well. Hope that works

It is possible that our approach to persist the secret is wrong. in that ca=
se, do you have some docs showing a sealing process that is expected to wor=
k with pcr policies with the versions I am using? =


Thank you!

-----Original Message-----
From: Roberts, William C =

Sent: Monday, December 10, 2018 1:31 PM
To: Oliver, Dario N <dario.n.oliver(a)intel.com>; tpm2(a)lists.01.org
Subject: RE: Problem with tpm2_unseal after reboot

Oliver,

I wonder if this some weird side-effect. I have never had a persistent obje=
ct under a non-persistent object, does this cause the primary object to per=
sist as well? I wonder how you could persist a child object when the primar=
y parent object is unloaded since the primary object seed protects it's chi=
ldren.

What happens if you persist the primary object as well?

Bill


> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Oliver, =

> Dario N
> Sent: Friday, December 7, 2018 2:36 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Problem with tpm2_unseal after reboot
> =

> Hello!
> =

> =

> =

> I am currently having problems to unseal a secret from the tpm.
> =

> I hope that you can detect the issue in my instructions below :)
> =

> =

> =

> The versions that I am using are the following:
> =

> 1.       Tpm2-tss 2.0.0
> =

> 2.       Tpm2-abrmd 2.0.0
> =

> 3.       Tpm2-tools 3.1.0
> =

> =

> =

> The platform I am using is a Compulab Fitlet2 device (Intel Atom  =

> x5-E3950 Apollo Lake), with Fedora 28 and Linux kernel 4.19.x.
> =

> In this case, the device support firmware tpm, and it is enabled in =

> the BIOS
> (fTPM)
> =

> =

> =

> So, after installing the tpm2 stack from github releases, I am sealing =

> a secret with the following commands:
> =

> =

> =

> # Create a random secret to be saved in the TPM
> =

> tpm2_getrandom 32 --output key.bin
> =

> =

> =

> # I use a pcr policy on sha1 banks 0 and 1, this gets the pcr state
> =

> tpm2_pcrlist --sel-list sha1:0,1 --output pcr_state.bin
> =

> =

> =

> # Create a policy with those PCR
> =

> tpm2_createpolicy --policy-pcr --set-list sha1:0,1 \
> =

>                   --pcr-input-file pcr_state.bin
> =

>                   --policy-file policy.bin
> =

> =

> =

> # Create a primary object with endorsement hierarchy
> =

> tpm2_createprimary --hierarchy e --halg sha1 --kalg rsa --context =

> primary.context
> =

> =

> =

> # Create an object to be loaded in the TPM
> =

> tpm2_create --halg sha256 --kalg keyedhash --pubfile key.pub =

> --privfile key.priv \
> =

>             --context-parent primary.context --policy-file policy.bin =

> \
> =

>            --object-attributes =

> "fixedtpm|fixedparent|noda|adminwithpolicy" --in-file key.bin
> =

> =

> =

> # Load the object in the TPM
> =

> tpm2_load --context-parent primary.context --pubfile key.pub =

> --privfile key.priv \
> =

>           --context load.context
> =

> =

> =

> # Persist the object in the TPM
> =

> tpm2_evictcontrol --auth o --context load.context --persistent =

> 0x81010002
> =

> =

> =

> # Check if the object is persisted, looks good
> =

> tpm2_listpersistent
> =

> persistent-handle[0]:0x81010002 key-alg:keyedhash hash-alg:sha256 =

> object- attr:fixedtpm|fixedparent|noda|adminwithpolicy
> =

> =

> =

> # Unseal the object, works!
> =

> tpm2_unseal --item 0x81010002 --set-list sha1:0,1 > compare_key.bin
> =

> =

> =

> # Compare original and unsealed objects, the match :)
> =

> diff compare_key.bin key.bin
> =

> =

> =

> ##############
> =

> # After this initial setup, I reboot the device, and try to unseal the =

> secret again
> =

> ##############
> =

> =

> =

> # After reboot, open a terminal an do
> =

> tpm2_unseal --item 0x81010002 --set-list sha1:0,1 > =

> compare_disk_key.bin
> =

> ERROR: Sys_Unseal failed. Error Code: 0x99d
> =

> ERROR: Unseal failed!
> =

> ERROR: Unable to run tpm2_unseal
> =

> =

> =

> # Use tpm2_rc_decode to decode the error message 0x99d, it is a policy =

> check error!
> =

> tpm2_rc_decode 0x99d
> =

> error layer
> =

>     hex: 0x0
> =

>     identifier: TSS2_TPM_RC_LAYER
> =

>     description: Error produced by the TPM
> =

> format 1 error code
> =

>     hex: 0x1d
> =

>     identifier: TPM2_RC_POLICY_FAIL
> =

>     description: a policy check failed
> =

> session
> =

>     hex: 0x100
> =

>     identifier: TPM2_RC_1
> =

>     description: (null)
> =

> =

> =

> ###############
> =

> # I checked the PCR 0,1, and they have the same values as at the =

> moment to seal the object.
> =

> # So I don't understand why I am having a "TPM2_RC_POLICY_FAIL" error.
> =

> # I tried the same process several times, and each time I end up in =

> the same error state.
> =

> ###############
> =

> =

> =

> Is there something I am missing here?
> =

> Is something additional I need to do to satisfy the policy to unseal the =
data?
> =

> Any help is appreciated!
> =

> =

> =

> Thank you in advance.
> =

> =

> =

> =

> =

> =



--===============4416103458880450640==--

