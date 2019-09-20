Content-Type: multipart/mixed; boundary="===============5761552405280483100=="
MIME-Version: 1.0
From: Trey Weaver <treyweaver at fastmail.net>
Subject: Re: [tpm2] tpm2 Digest, Vol 27, Issue 23
Date: Fri, 20 Sep 2019 19:46:45 -0400
Message-ID: <00bfec8a-3fbc-4ca7-940f-be8b7930cdfe@www.fastmail.com>
In-Reply-To: mailman.9.1569006001.7204.tpm2@lists.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5761552405280483100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It looked like the command worked OK.  It gave me a handle of 0x800000 or s=
omething.  Then I rebooted my machine and tried the command "tpm2_unseal -c=
 key.ctx" and I got this error:

WARNING:esys:src/tss2-esys/api/Esys_ContextLoad.c:279:Esys_ContextLoad_Fini=
sh() Received TPM Error =

ERROR:esys:src/tss2-esys/api/Esys_ContextLoad.c:93:Esys_ContextLoad() Esys =
Finish ErrorCode (0x000001df) =

ERROR: Esys_ContextLoad(0x1DF) - tpm:parameter(1):integrity check failed
ERROR: Invalid item handle authorization
ERROR: Unable to run tpm2_unseal

Do I need to do anything before I call the unseal after the power cycle?

Thanks.


On Fri, Sep 20, 2019, at 3:00 PM, tpm2-request(a)lists.01.org wrote:
> Send tpm2 mailing list submissions to
> 	tpm2(a)lists.01.org
> =

> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.01.org/mailman/listinfo/tpm2
> or, via email, send a message with subject or body 'help' to
> 	tpm2-request(a)lists.01.org
> =

> You can reach the person managing the list at
> 	tpm2-owner(a)lists.01.org
> =

> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of tpm2 digest..."
> =

> =

> Today's Topics:
> =

>    1. Putting a persistant string into the tpm2 using tpm2_tools.
>       (Trey Weaver)
>    2. Re: Putting a persistant string into the tpm2 using
>       tpm2_tools. (Tadeusz Struk)
> =

> =

> ----------------------------------------------------------------------
> =

> Message: 1
> Date: Fri, 20 Sep 2019 10:34:51 -0400
> From: "Trey Weaver" <treyweaver(a)fastmail.net>
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Putting a persistant string into the tpm2 using
> 	tpm2_tools.
> Message-ID: <62b22807-115d-444b-af44-b1c0ab16daf9(a)www.fastmail.com>
> Content-Type: text/plain; charset=3D"us-ascii"
> =

> I want to put a small string into the TPM2 and be able to recall it =

> over restarts. Here is what I have tried:
> =

> # put data in file that is to be sealed
> echo "my sealed data" > seal.dat
> =

> # create a primary key
> tpm2_createprimary -c primary.ctx
> =

> # create a child key in public and private parts
> tpm2_create -C primary.ctx -u obj.pub -r obj.priv
> =

> # create a sealed object
> tpm2_create -C primary.ctx -i seal.dat -u obj.pub -r obj.priv
> =

> # load the private and public portions into the TPM
> tpm2_load -C primary.ctx -u obj.pub -r obj.priv -c key.ctx
> =

> # unseal the data
> tpm2_unseal -c key.ctx
> =

> But after a power cycle if I run '*tpm2_unseal -c key.ctx*' I get this er=
ror:
> =

> *WARNING:esys:src/tss2-esys/api/Esys_ContextLoad.c:279:Esys_ContextLoad_F=
inish() Received TPM Error ERROR:esys:src/tss2-esys/api/Esys_ContextLoad.c:=
93:Esys_ContextLoad() Esys Finish ErrorCode (0x000001df) ERROR: Esys_Contex=
tLoad(0x1DF) - tpm:parameter(1):integrity check failed ERROR: Invalid item =
handle authorization ERROR: Unable to run tpm2_unseal*
> =

> I am using the tpm_server (emulator) if that makes any difference.
> =

> So what is the best way to load a small string into the tpm2 and be =

> able to pull it out anytime in the future, even after power loss. =

> =

> =

> Thanks
> =

>=20
--===============5761552405280483100==--

