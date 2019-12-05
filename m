Content-Type: multipart/mixed; boundary="===============1609130058749066314=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How Is This Possible If There Are No Keys ? ? ?
Date: Thu, 05 Dec 2019 17:55:59 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E4C709@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0163C1D4D1@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1609130058749066314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Fuchs, Andreas [mailto:andreas.fuchs(a)sit.fraunhofer.de]
> Sent: Thursday, December 5, 2019 8:17 AM
> To: cauldwell.thomas(a)gmail.com; tpm2 <tpm2(a)lists.01.org>
> Subject: [tpm2] Re: How Is This Possible If There Are No Keys ? ? ?
> =

> try 0x81000002
> 0x81010000 and following are endorsement hierarchy handles...
> if that's not enough, try specifying the owner hierarchy via parameter
> =

> see https://github.com/tpm2-software/tpm2-tss-
> engine/blob/8acc6181f27c1b60263ab9ad5e28f4638e0460ed/test/rsasign_persiste
> nt.sh#L33
> for a working example...

You can't persist a public only object, from the commands spec for TPM2_Loa=
dExternal:
If objectHandle references a Transient Object:
The TPM shall return TPM_RC_ATTRIBUTES if
1) it is in the hierarchy of TPM_RH_NULL,
2) only the public portion of the object is loaded, or
3) the stClear is SET in the object or in an ancestor key.

> ________________________________________
> From: Frederick Gotham [cauldwell.thomas(a)gmail.com]
> Sent: Thursday, December 05, 2019 15:11
> To: Fuchs, Andreas; tpm2
> Subject: Re: [tpm2] How Is This Possible If There Are No Keys ? ? ?
> =

> On 12/5/19, Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de> wrote:
> > No, you take your object context file and _choose_ the persistent
> > handle to store it under.
> =

> =

> I tried this:
> =

>     tpm2_loadexternal -G rsa -u public.pem -c key_context_file_for_tpm2
>     tpm2_evictcontrol -c key_context_file_for_tpm2 0x81010002
> =

> And here's how the output I got:
> =

>     WARNING:esys:src/tss2-
> esys/api/Esys_EvictControl.c:326:Esys_EvictControl_Finish()
> Received TPM Error
>     ERROR:esys:src/tss2-esys/api/Esys_EvictControl.c:114:Esys_EvictContro=
l()
> Esys Finish ErrorCode (0x00000282)
>     ERROR: Esys_EvictControl(0x282) - tpm:handle(2):inconsistent attribut=
es
>     ERROR:esys:src/tss2-esys/esys_tr.c:357:Esys_TR_Close() Error: Esys ha=
ndle
> does not exist (70018).
>     ERROR: Esys_TR_Close(0x70018) - esapi:0x18
>     ERROR: Unable to run tpm2_evictcontrol
> =

> I've tried leaving out the "0x81010002" at the end but I get the same err=
or output.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============1609130058749066314==--

