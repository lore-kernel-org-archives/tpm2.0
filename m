Content-Type: multipart/mixed; boundary="===============1444749399513286799=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Help needed to setup an AES key
Date: Thu, 25 Apr 2019 15:57:29 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D2F00A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAJ_Jvonca+Zb7_=5o7yJH0WTGBrNw6qV63nrboURyYunKPZdFg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1444749399513286799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Nicolas Broq=
uet
> Sent: Sunday, April 21, 2019 12:07 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Help needed to setup an AES key
> =

> Hello everyone,
> =

> =

> New to the TPM world, I've been reading various docs and forums the past =
two
> weeks and I am now attempting to put all the learning into practice.
> More specifically, I'm trying to have the TPM create an AES key.
> Here is what I did so far:
> =

> =

> =

> =

> 	DEFAULT_HIERARCHY=3D"o"
> 	DEFAULT_ATTRIBUTES=3D"restricted|decrypt|fixedtpm|fixedparent|sensi
> tivedataorigin|userwithauth|noda"
> 	DEFAULT_PERSISTENT_HANDLE=3D"0x81010001"
> 	PARENT_PERSISTENT_HANDLE=3D"0x81010002"
> =

> 	tpm2_createprimary --hierarchy=3D$DEFAULT_HIERARCHY --auth-
> hierarchy=3D"$OWNER_PASSWORD" --object-attributes=3D$DEFAULT_ATTRIBUTES --
> halg sha256 --kalg rsa2048:aes128cfb --out-context-name=3D$PRIMARY_CONTEXT
> =

> =

> 	tpm2_evictcontrol --hierarchy=3D$DEFAULT_HIERARCHY --
> context=3D$PRIMARY_CONTEXT --auth-hierarchy=3D$OWNER_PASSWORD --
> persistent=3D$DEFAULT_PERSISTENT_HANDLE
> =

> =

> 	tpm2_create --context-parent=3D$PRIMARY_CONTEXT --object-
> attributes=3D$DEFAULT_ATTRIBUTES --pubfile=3D$PUBFILE --privfile=3D$PRIVF=
ILE --halg
> sha256 --kalg rsa2048:aes128cfb
> =

> =

> 	tpm2_load --quiet --context=3D$PRIMARY_CONTEXT --pubfile=3D$PUBFILE --
> privfile=3D$PRIVFILE --out-context=3D$PARENT_CONTEXT
> =

> =

> 	tpm2_evictcontrol --hierarchy=3D$DEFAULT_HIERARCHY --
> context=3D$PARENT_CONTEXT --auth-hierarchy=3D$OWNER_PASSWORD --
> persistent=3D$PARENT_PERSISTENT_HANDLE
> =

> =

> =

> All of that is working great; a call to tpm2_listpersistent shows the two=
 keys and
> their persistent handle.
> =

> =

> Then I try to add an AES key to that hierarchy. I want this key to be usa=
ble only if
> some policy is satisfied:
> =

> =

> =

> 	tpm2_create --context-parent=3D$PARENT_CONTEXT --kalg=3Daes --
> pubfile=3D$PUBFILE --privfile=3D$PRIVFILE --policy-file=3D$AUTHORIZED_POL=
ICY

Where did you get policy-file from?

> =

> =

> This call returns the following:
> =

> =

> =

> 	WARNING:esys:src/tss2-
> esys/api/Esys_Create.c:412:Esys_Create_Finish() Received TPM Error
> 	ERROR:esys:src/tss2-esys/api/Esys_Create.c:156:Esys_Create() Esys
> Finish ErrorCode (0x000002c4)
> 	ERROR: Esys_Create(0x2C4) - tpm:parameter(2):value is out of range or is
> not correct for the context
> 	ERROR: Unable to run tpm2_create

FYI there is a scheme in the commands document where there is a thick line =
that indicates
The parameter section for a command. In your case parameter 2 is the public=
 object template.
Doesn't seem to like it.

https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-3-Com=
mands-01.38.pdf

You're likely just hitting different checks within the TPM and not really f=
ixing the above issue. Those checks
have wildly complex interactions and I am by no means an expert. I have fou=
nd the best way is to:
1. see if you can replicate on the software simulator.
2. place software simulator in debugger and figure out what exact check is =
failing.

> =

> =

> I then tried with "aes128" as key algorithm, instead of just "aes":
> =

> 	WARNING:esys:src/tss2-
> esys/api/Esys_Create.c:412:Esys_Create_Finish() Received TPM Error
> 	ERROR:esys:src/tss2-esys/api/Esys_Create.c:156:Esys_Create() Esys
> Finish ErrorCode (0x000002c9)
> 	ERROR: Esys_Create(0x2C9) - tpm:parameter(2):mode of operation not
> supported
> 	ERROR: Unable to run tpm2_create
> =

> =

> I also tried to specify a mode instead ("aes128cfb"):
> =

> 	WARNING:esys:src/tss2-
> esys/api/Esys_Create.c:412:Esys_Create_Finish() Received TPM Error
> 	ERROR:esys:src/tss2-esys/api/Esys_Create.c:156:Esys_Create() Esys
> Finish ErrorCode (0x000002c2)
> 	ERROR: Esys_Create(0x2C2) - tpm:parameter(2):inconsistent attributes
> 	ERROR: Unable to run tpm2_create
> =

> =

> =

> =

> =

> After having read all the MAN pages twice, I still have no idea what is g=
oing on or
> what I did wrong. Most if not all of those commands were merely copy/past=
ed
> from the MAN pages at https://github.com/tpm2-software/tpm2-
> tools/tree/master/man .
> =

> =

> I'm using a Lenovo X1 Carbon (3rd gen) with Intel PTT enabled, so the sys=
tem
> sees a TPM2.0 device. I can provide more information if needed.
> I would greatly appreciate if someone could provide some guidance on this=
 issue;
> the TPM world being fascinating so far, I wouldn't want to be stuck on th=
at
> problem.
> =

> Thanks in advance for your help,
> Regards,
> =

> =

> Nicolas
> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =



--===============1444749399513286799==--

