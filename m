Content-Type: multipart/mixed; boundary="===============3063349541417780078=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: seal with external public EK
Date: Thu, 01 Sep 2022 14:54:38 +0000
Message-ID: <9e0f50e1f78fe4d8a5547aa97641c4fce7608830.camel@intel.com>
In-Reply-To: FR0P281MB170641DAAFCCBBC8E9EFC847D1789@FR0P281MB1706.DEUP281.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3063349541417780078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-08-31 at 14:32 +0000, Gadacz, Henry wrote:
> Hello everyone,
>  =

> I want to encrypt a larger file on TPM A and decrypt it on TPM B. To
> share a symmetric key for that I have TPM B=E2=80=99s public endorsement =
keys
> on TPM A. The EK of TPM B is created and persisted as followed:
> tpm2_createek -P endPW -w ownerPW -c $EK_HANDLE -G rsa
>  =

> The public part is exported with:
> pm2_readpublic -c $EK_HANDLE -o B_EK.pem -f pem
>  =

> On TPM A I load the public EK key of TPM B:
> tpm2_loadexternal -C o -G rsa -u B_EK.pem -c B_EK.ctx
>  =

> To seal random data that is used as symmetric key to the TPM B EK I
> tried:
> tpm2_getrandom --hex 32 | tpm2_create -C B_EK.ctx -i- -u
> A_transportKey_pub.seal -r A_transportKey_priv.seal
>  =

> But I always get the following error:
> WARNING:esys:src/tss2-esys/api/Esys_Create.c:399:Esys_Create_Finish() =

> Received TPM Error
> ERROR:esys:src/tss2-esys/api/Esys_Create.c:134:Esys_Create() Esys
> Finish ErrorCode (0x0000012f)
> ERROR: Esys_Create(0x12F) - tpm:error(2.0): authValue or authPolicy
> is not available for selected entity
> ERROR: Unable to run tpm2_create
>  =

> Why is an authValue or authPolicy required? I created the EK without
> authorization value or policy.

TL;DR Seal and Unseal the key using an encrypted session and use
tpm2_duplicate to move keys between TPMs.

Becuase the authValue is always checked, even if it's empty. The
associated authValue is stored in the private portion of the object and
only the public portion is loaded. Thus you cannot use any commands
that require authValue.

To move a key, you duplicate command:
tpm2_duplicate(1)  -  This tool duplicates a loaded object so that it
may be used in a different hierarchy.  The new parent key for the
       duplicate may be on the same or different TPM or TPM_RH_NULL.

>  =

> I want to use the sealing method instead of tpm2_rsaencrypt to be
> able to process the symmetric key inside TPM B when doing the
> decryption and don=E2=80=99t need to store a file with the symmetric key =
on
> the disk.
>  =

> Any help on what=E2=80=99s the problem or other suggestions to solve this
> task are really appreciated.

Generally folks seal and unseal a bulk encryption key to the TPM and
then perform the bulk crypto, ie AES or equivilent, within their
application. The primary reason for this is performance, the TPM is
dirt slow.

The second thing to consider is your threat model:

Compromised Bus:
In this scenario the attacker can see traffic on the bus, so unless you
enable a encrypted session, the attacker can see the clear text so the
crypto operation does nothing. In this case unsealing the key WITHIN an
encrypted session ensures that the attacker did not see your key and
your safe.

Compromised Kernel:
In this scenario an attacker can see bytes to and from the TPM through
the kernel driver as well as peer into your address space. In this
scenario we consider using the TPM for bulk encryption and unsealing.
When using the TPM the attacker can see the clear text coming back from
the TPM. Even when using an encrypted session the attacker could peer
into your process and get the decrypted data or just jack the session
key. To protect yourself in a compromised kernel you need some type of
sandboxing feature to protect the process from the operating system.
Think of things like TEEs.

In most Threat Models, folks consider the "Compromised Bus" scenario
and this is how your disk is decrypted when using the TPM. Although not
always within in encrypted session unfortunately. Work is being done on
this front.

>  =

> Best Regards,
> Henry
>  =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============3063349541417780078==--

