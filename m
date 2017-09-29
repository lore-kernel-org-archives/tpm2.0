Content-Type: multipart/mixed; boundary="===============0660833614500439359=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2_nvwrite with policy based authorization
Date: Fri, 29 Sep 2017 11:40:32 +0200
Message-ID: <c20c0d19-e18b-3974-901a-a0dfee6b69b6@redhat.com>
In-Reply-To: 54CD2916B052E04BBDD1393A6800D9FDDB6A9E7B@NJ350EX02.ztgroup.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0660833614500439359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Slash,

On 09/29/2017 06:33 AM, Slash Wu wrote:
> Hi Javier,
> =

> Thanks so much for the reply promptly.
> =

> Currently I defined a NV index like below, do you know if the tpm2_unseal=
 is capable of a 'policywrite' to this NV Space ? and if it does, can you p=
lease give me an example how ?
>
>   0. NV Index: 0x1800001
>   {
>         Hash algorithm(nameAlg):11
>         attributes: policywrite|policydelete|authread|no_da|written|platf=
ormcreate(0x8040462)
>         The size of the data area(dataSize):70
>         Authorization Policy for R/W/D: C001C8000210D0FAA4F4F4F8A78EF4F82=
64E6F8555340D2F04180F8CF110FFDD
>   }
>

TPM2_Unseal doesn't write to the TPM2 but instead returns the data in a loa=
ded
Sealed Data Object. So in a way, it's similar to what TPM2_NV_Read does.

Also, the Handle space is split for the different TPM2 resources. So for ex=
ample,
NV Index Areas start at 0x01000000, Transient Objects at 0x80000000 and Per=
sistent
Objects at 0x81000000. This means that each set of commands are only suppos=
ed to
be used within the Handle range of the resources that they manage.

The similar operation to what you want to do (TPM2_NV_Write), would be to c=
reate
a Sealed Data Object with TPM2_Create, load it to the TPM with TPM2_Load an=
d then
read it with TPM2_Unseal. You define your PCR policy when the object is cre=
ated
and can only later be unsealed (read) if the PCR state satisfies that polic=
y.

You can take a look to the test/system/test_tpm2_unseal.sh for an example o=
n how
this is done. Unless you have a reason to not store the Sealed Data Object =
outside
the TPM2, I would suggest to do something like what that test does.

If you really want to store the Sealed Data Object in the TPM2, then you co=
uld do
something like the following:

# Create PCR policy for SHA-1 bank PCR7
$ tpm2_pcrlist -L sha1:7 -o pcr.bin
$ tpm2_createpolicy -P -L sha1:7 -F pcr.bin -f pcr.policy

# Create a Data Object and seal "mysecret" using the PCR policy
$ tpm2_createprimary -A o -g sha256 -G ecc -C primary.context
$ tpm2_create -g sha256 -G keyedhash -u obj.pub -r obj.priv -I- \
  -c primary.context -L pcr.policy -E <<< mysecret

# Load the object and make a persistent copy in the TPM with Handle 0x81000=
000
$ tpm2_load -c primary.context -u obj.pub -r obj.priv -C load.context
$ tpm2_evictcontrol -A o -c load.context -S 0x81000000

At this point you can delete the obj.{pub,priv} since a copy was made persi=
stent
in the TPM. So now to unseal it, you just need to get the PCR hashes for th=
e PCR
used for sealing, and call TPM2_Unseal passing the Persistent Object Handle=
, i.e

$ tpm2_pcrlist -L sha1:7 -o pcr.bin
$ tpm2_unseal -H 0x81000000 -L sha1:7 -F pcr.bin =

mysecret

> Much appreciate.
> Slash
>

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============0660833614500439359==--

