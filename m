Content-Type: multipart/mixed; boundary="===============8867800908849858345=="
MIME-Version: 1.0
From: Juergen Repp <Juergen.Repp at sit.fraunhofer.de>
Subject: [tpm2] Re: Integrity check failed during tpm2_evictcontrol
Date: Thu, 03 Feb 2022 09:48:33 +0100
Message-ID: <ace00f71-6066-cc1d-b9a6-db00ddb5287a@sit.fraunhofer.de>
In-Reply-To: OF0ACF65B2.D86991A3-ON002587DD.0076F9B1-002587DD.0077185D@ibm.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8867800908849858345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, the commands also work fine with an Infineon TPM and an AMD firmware TP=
M.

Am 02.02.22 um 22:40 schrieb Nicholas A Tufano:
> Hi. I'm using tpm2-tools 4.1.1 and I'm getting this error when I run tpm2=
_evictcontrol immediately following tpm2_createprimary to save the handle t=
o the TPM persistent memory.
> =

> WARNING:esys:src/tss2-esys/api/Esys_ContextLoad.c:279:Esys_ContextLoad_Fi=
nish() Received TPM Error
> ERROR:esys:src/tss2-esys/api/Esys_ContextLoad.c:93:Esys_ContextLoad() Esy=
s Finish ErrorCode (0x000001df)
> ERROR: Esys_ContextLoad(0x1DF) - tpm:parameter(1):integrity check failed
> ERROR:esys:src/tss2-esys/esys_tr.c:357:Esys_TR_Close() Error: Esys handle=
 does not exist (70018).
> ERROR: Esys_TR_Close(0x70018) - esapi:0x18
> ERROR: Unable to run tpm2_evictcontrol
> The commands run to get here
> =

> tpm2_changeauth --tcti=3Dmssim:host=3D::1,port=3D1234 --object-context=3D=
owner test1
> tpm2_createprimary --tcti=3Dmssim:host=3D::1,port=3D1234 --hierarchy=3Do =
--key-auth=3Dtest2 --hash-algorithm=3Dsha256 --key-algorithm=3Decc --key-co=
ntext=3D/tmp/srk_context --hierarchy-auth=3Dtest1
> tpm2_evictcontrol --tcti=3Dmssim:host=3D::1,port=3D1234 --hierarchy=3Do =
=C2=A0--object-context=3D/tmp/srk_context --auth=3Dtest1 0x81000002
> It seems like there is a problem loading the context file that gets gener=
ated from tpm2_createprimary. This flow of commands worked fine when using =
the IBM TPM2 simulator but they do not work on a Nuvoton TPM.
> Any insight would be appreciated. Thanks.
> =

> =

> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============8867800908849858345==--

