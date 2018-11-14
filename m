Content-Type: multipart/mixed; boundary="===============1078007714574500045=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2-tools who uses transient handles in workflows?
Date: Wed, 14 Nov 2018 01:19:52 +0100
Message-ID: <2667ebfa-679c-0f89-676e-feacf49246d3@redhat.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649C8AE73@ORSMSX106.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1078007714574500045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Bill,

On 11/9/18 4:40 PM, Roberts, William C wrote:
> We're working on porting the tpm2-tools to use ESAPI so can we provide be=
tter session support and drive down session
> related bugs.
> =

> With that said, ESAPI doesn't support using transient object handles. Int=
ernally the library keeps track of ESYS_TR handles,
> Which are handles on steroids (meta data). Because there is no way to ext=
ract the transient object handle, as ESAPI considers
> That an implementation detail that shouldn't be exposed to regular users,=
 we can (in order of sanity with 1 being most sane):
> =

> 1. Require save/load context
> 2. Try and change ESAPI to expose this
>    a. uses a serialized in memory ESYS_TR and find the handle via offset =
(sic)
> 3. serialize ESYS handles to disk
> 4. serialize ESYS handles and base64 output to stdout
> =

> I'm leaning towards 1, it would require additional TPM commands, but it w=
orks in RM and non-RM environments which
> I think means fielding less questions about where did my object go on exi=
t when it said it was handle XXX.  However,
> That breaks a possible workflow, and we want to get 4.0 release right, so=
 we can stop with backwards incompatible
> changes.
> =

> Thoughts, opinions?
>

Yes, I agree with you that (1) is the saner option. Transient objects handl=
es
only really worked when the TPM was accessed directly and the handles were =
not
virtualized. But I guess that accessing the TPM directly is really not the =
most
common setup.

With both the in-kernel and the user-space resource managers, we had to use=
 a
context save/load anyways. I just tried the following commands using differ=
ent
TCTI with the latest stable versions.

a) Accessing the TPM directly without a resource manager:


$ export TPM2TOOLS_TCTI_NAME=3Ddevice
$ export TPM2TOOLS_DEVICE_FILE=3D/dev/tpm0

$ tpm2_createprimary -H o -g sha256 -G ecc
ObjectAttribute: 0x00030072

CreatePrimary Succeed ! Handle: 0x80000000

$ tpm2_create -H 0x80000000 -g sha256 -G keyedhash -u pub -r priv
algorithm:
  value: sha256
  raw: 0xb
attributes:
  value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|sign
  raw: 0x40072
type: =

  value: keyedhash
  raw: 0x8
  keyedhash: d4596c017ab954e9db7d7681eece41592cd675270745e7851d2b2c68e282cb=
f3


Handles do work in this case as expected since are not virtualized.

b) Accessing the TPM through the in-kernel resource manager:


$ export TPM2TOOLS_DEVICE_FILE=3D/dev/tpmrm0

$ tpm2_createprimary -H o -g sha256 -G ecc
ObjectAttribute: 0x00030072

CreatePrimary Succeed ! Handle: 0x80ffffff

$ tpm2_create -H 0x80ffffff -g sha256 -G keyedhash -u pub -r priv
WARNING:tcti:src/tss2-tcti/tcti-device.c:158:tcti_device_receive() Got EOF =
instead of response. =

ERROR: =

Create Object Failed ! ErrorCode: 0xa0008

ERROR: Unable to run tpm2_create

$ tpm2_rc_decode 0xa0008
error layer
  hex: 0xa0000
  identifier: TSS2_TCTI_RC_LAYER
  description: Error from the TCTI
base error code
  identifier: TSS2_BASE_RC_NO_CONNECTION
  description: Fails to connect to next lower layer


In this case it doesn't work, because as we know the kernel flushes all the
contexts associated with objects and sessions when the file is closed.

Doing a context load/save does work of course since a new transient object
is loaded on context load.


$ tpm2_createprimary -H o -g sha256 -G ecc -C primary.context
ObjectAttribute: 0x00030072

CreatePrimary Succeed ! Handle: 0x80ffffff

$ tpm2_create -c primary.context -g sha256 -G keyedhash -u pub -r priv
algorithm:
  value: sha256
  raw: 0xb
attributes:
  value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|sign
  raw: 0x40072
type: =

  value: keyedhash
  raw: 0x8
  keyedhash: 33282b64ac1423d264818c5e64be48d94d49970dfd4776237be2009a2181e2=
a7


c) Accessing the TPM through the tpm2-abrmd:


$ export TPM2TOOLS_TCTI_NAME=3Dtabrmd

$ tpm2_createprimary -H o -g sha256 -G ecc
ObjectAttribute: 0x00030072

CreatePrimary Succeed ! Handle: 0x800000ff

$ tpm2_create -H 0x800000ff -g sha256 -G keyedhash -u pub -r priv
ERROR: =

Create Object Failed ! ErrorCode: 0x184

ERROR: Unable to run tpm2_create

$ tpm2_rc_decode 0x184
error layer
  hex: 0x0
  identifier: TSS2_TPM_RC_LAYER
  description: Error produced by the TPM
format 1 error code
  hex: 0x04
  identifier: TPM2_RC_VALUE
  description: value is out of range or is not correct for the context
handle
  hex:0x100
  identifier:  TPM2_RC_1
  description:  (null)


I though this used to work? I noticed that we are a little behind in Fedora=
 and
ship tpm2-abrmd-2.0.1, so maybe this works in 2.0.3?

But again context save/load does work with the tpm2-abrmd:


$ tpm2_createprimary -H o -g sha256 -G ecc -C primary.context
ObjectAttribute: 0x00030072

CreatePrimary Succeed ! Handle: 0x800000ff

$ tpm2_create -c primary.context -g sha256 -G keyedhash -u pub -r priv
algorithm:
  value: sha256
  raw: 0xb
attributes:
  value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|sign
  raw: 0x40072
type: =

  value: keyedhash
  raw: 0x8
  keyedhash: a3353165c9090ead288bbb2eece7997de254c6c4d9b89843181c45a0bf7b7e=
48


Now, I assume that this is only about handles for transient objects and for
persistent objects nothing changes. We will continue using handles there and
ESAPI can expose those just fine?

Another thing that we never finished discussing is how to properly support
session contexts with the tools when using the in-kernel resource manager
(since the session contexts are also flushed on file decriptor close).

I remember you mentioned once having a small daemon that would keep the file
opened, and used it as a proxy instead of accessing the /dev/tpmrm? chardev
directly. I don't think we never made progress on that front.

Another option is to only support simple policies (i.e: like tpm2_unseal do=
es)
when using the in-kernel resource manager, but I think that in this case we
should warn the user instead of getting cryptic TPM errors like in the exam=
ple
shown above.

It would be a pity though to not support sessions for the /dev/tpmrm, speci=
ally
now that Imran added support for TPM2_PolicyAuthorize so data can be sealed=
 and
not worry about brittle PCRs.
 =

> Bill
> =


Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============1078007714574500045==--

