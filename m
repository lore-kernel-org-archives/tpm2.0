Content-Type: multipart/mixed; boundary="===============5072333852307094500=="
MIME-Version: 1.0
From: Thibaut Sautereau <thibaut.sautereau at clip-os.org>
Subject: Re: [tpm2] Issues experimenting with tpm2-tools and keyctl trusted
 keys
Date: Wed, 23 Jan 2019 13:59:14 +0100
Message-ID: <20190123125914.GA12820@gandi.net>
In-Reply-To: 4bbe9919-a320-0baf-b68c-ce71df565a8a@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5072333852307094500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Javier,

On Wed, Jan 23, 2019 at 10:36:22AM +0100, Javier Martinez Canillas wrote:
> Hello Thibaut,
> =

> On 1/21/19 9:16 AM, Thibaut Sautereau wrote:
> > Hello folks,
> > =

> > I'm experimenting with TPM 2.0 (using swtpm 0.1.0), tpm2-tools 3.1.3,
> > tpm2-tss 2.1.0 and the Linux 4.19.16 kernel's trusted keys. I found this
> > thread [1] about the "policydigest" and "policyhandle" options added to
> > keyctl but I cannot reproduce the given example [2] using tpm2-tools
> > instead of the author's Python testing scripts [3]. I wonder if I do
> > something wrong by executing the following commands:
> >
> =

> Did it work for you when using Jarkko's test scripts?

Yes, it did.

> > export TPM2TOOLS_TCTI=3D"device:/dev/tpmrm0"
> > tpm2_takeownership --clear
> > # I tried fiddling with the object attributes in the following command
> > # but AIUI the default ones should be OK
> > tpm2_createprimary --hierarchy=3Do --halg=3Dsha256 --kalg=3Drsa \
> > 	--context=3D/tmp/primary.context =

> > tpm2_evictcontrol --auth=3Do --context=3D/tmp/primary.context \
> > 	--handle=3D0x80ffffff --persistent=3D0x81010001
> > tpm2_createpolicy --policy-file=3D/tmp/policy.digest --policy-pcr \
> > 	--set-list=3Dsha256:0 --policy-digest-alg=3Dsha256
> > policydigest=3D$(xxd -p /tmp/policy.digest | tr -d '\n')
> > keyid=3D$(keyctl add trusted test \
> > 	"new 32 keyhandle=3D0x81010001 hash=3Dsha256 policydigest=3D$policydig=
est" @u)
> > keyctl link @us @s
> > keyctl pipe $keyid > /tmp/blob.hex
> > =

> > Until here, everything works fine.
> > =

> > Now for testing I want to reimport the key from the blob file, but I
> > need a handle to a TPM_SE_POLICY and thus need to directly use the TPM
> > device, as the in-kernel resource manager I was using so far would
> > prevent me from keeping a policy session "opened". So I re-export
> > TPM2TOOLS_TCTI just as Javier Martinez Canillas showed on GitHub [4]:
> > =

> > export TPM2TOOLS_TCTI=3D"device:/dev/tpm0"
> > # --auth-policy-session implies --extend-policy-session
> > tpm2_createpolicy --policy-pcr --set-list=3Dsha256:0 \
> > 	--policy-digest-alg=3Dsha256 --auth-policy-session
> > keyctl add trusted test2 \
> > 	"load $(cat /tmp/blob.hex) keyhandle=3D0x81010001 policyhandle=3D0x030=
00000" @u
> > =

> =

> You have the policy handle hardcoded to 0x03000000 here, I guess that's c=
orrect
> and is the value printed by tpm2_createpolicy in EXTENDED_POLICY_SESSION_=
HANDLE?

Yes.

> Sorry for saying the obvious, but just in case since I don't see anything=
 wrong
> with your commands.

No worries. Thanks for your help!

-- =

Thibaut Sautereau
CLIP OS developer

--===============5072333852307094500==--

