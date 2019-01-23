Content-Type: multipart/mixed; boundary="===============7707913910375439461=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Issues experimenting with tpm2-tools and keyctl trusted
 keys
Date: Wed, 23 Jan 2019 13:11:20 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D014B4C36D5@exch2010c.sit.fraunhofer.de>
In-Reply-To: 20190121081642.GB976@gandi.net
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7707913910375439461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

have you tried running the same sequences but using tpm2_create instead of =
"keyctl new" and tpm2_unseal instead of "keyctl load" ?
Just to make sure that the TPM side of things is working ok ?

Then it would be narrowed down to finding the diff between the basic comman=
ds and how keyctl uses them.
________________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Thibaut Sautereau [th=
ibaut.sautereau(a)clip-os.org]
Sent: Monday, January 21, 2019 09:16
To: tpm2
Subject: [tpm2] Issues experimenting with tpm2-tools and keyctl trusted keys

Hello folks,

I'm experimenting with TPM 2.0 (using swtpm 0.1.0), tpm2-tools 3.1.3,
tpm2-tss 2.1.0 and the Linux 4.19.16 kernel's trusted keys. I found this
thread [1] about the "policydigest" and "policyhandle" options added to
keyctl but I cannot reproduce the given example [2] using tpm2-tools
instead of the author's Python testing scripts [3]. I wonder if I do
something wrong by executing the following commands:

export TPM2TOOLS_TCTI=3D"device:/dev/tpmrm0"
tpm2_takeownership --clear
# I tried fiddling with the object attributes in the following command
# but AIUI the default ones should be OK
tpm2_createprimary --hierarchy=3Do --halg=3Dsha256 --kalg=3Drsa \
        --context=3D/tmp/primary.context
tpm2_evictcontrol --auth=3Do --context=3D/tmp/primary.context \
        --handle=3D0x80ffffff --persistent=3D0x81010001
tpm2_createpolicy --policy-file=3D/tmp/policy.digest --policy-pcr \
        --set-list=3Dsha256:0 --policy-digest-alg=3Dsha256
policydigest=3D$(xxd -p /tmp/policy.digest | tr -d '\n')
keyid=3D$(keyctl add trusted test \
        "new 32 keyhandle=3D0x81010001 hash=3Dsha256 policydigest=3D$policy=
digest" @u)
keyctl link @us @s
keyctl pipe $keyid > /tmp/blob.hex

Until here, everything works fine.

Now for testing I want to reimport the key from the blob file, but I
need a handle to a TPM_SE_POLICY and thus need to directly use the TPM
device, as the in-kernel resource manager I was using so far would
prevent me from keeping a policy session "opened". So I re-export
TPM2TOOLS_TCTI just as Javier Martinez Canillas showed on GitHub [4]:

export TPM2TOOLS_TCTI=3D"device:/dev/tpm0"
# --auth-policy-session implies --extend-policy-session
tpm2_createpolicy --policy-pcr --set-list=3Dsha256:0 \
        --policy-digest-alg=3Dsha256 --auth-policy-session
keyctl add trusted test2 \
        "load $(cat /tmp/blob.hex) keyhandle=3D0x81010001 policyhandle=3D0x=
03000000" @u

This last command causes: "add_key: Operation not permitted".
In kernel logs, I have:
        [ 1350.287556] tpm tpm0: A TPM error (2466) occurred unsealing
        [ 1350.289856] trusted_key: key_unseal failed (-1)

The TPM error is 0x9a2, i.e. TPM2_RC_BAD_AUTH. I cannot see what I'm
doing wrong. Do you see something obvious?

[1] https://lkml.org/lkml/2015/11/17/520
[2] https://lkml.org/lkml/2015/11/21/125
[3] https://github.com/jsakkine-intel/tpm2-scripts
[4] https://github.com/tpm2-software/tpm2-tools/issues/510#issuecomment-331=
385565

Thanks a lot for your time and your work!

--
Thibaut Sautereau
CLIP OS developper
_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://lists.01.org/mailman/listinfo/tpm2

--===============7707913910375439461==--

