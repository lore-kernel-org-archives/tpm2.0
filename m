Content-Type: multipart/mixed; boundary="===============4987465920075338408=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Relating tpm2_createprimary, Primary Seeds, and tpm2_clear
Date: Tue, 31 Mar 2020 17:42:34 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EB66EF@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200331155736.2692.99393@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4987465920075338408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: John S [mailto:sedigj(a)gmail.com]
> Sent: Tuesday, March 31, 2020 10:58 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Relating tpm2_createprimary, Primary Seeds, and tpm2_clear
> =

> Hi, have been playing around with tpm2 tools and tss engine for openssl f=
or
> awhile.
> Also reading Practical Guide to TPM 2.0.
> =

> I have found all the resources in the tpm2-tools readme and wiki and beyo=
nd
> quite helping in getting started.
> =

> The book (chapter 10) talks about the primary seeds for the hierarchy, an=
d how
> any amount of key hierarchies can be extended from the primary keys. Prim=
ary
> keys are derived from the primary seeds. My understanding is that the see=
ds are
> unique and permanent in the tpm hardware.

In practice yes, but be aware that the command set does allow for changeEPS=
 and changePPS
To change the Endorsement and Platform seeds. Tpm2_clear changes the owner =
or
Storage Primary Seed (SPS).

> =

> I was anticipating that tpm2_createprimary could be used to get back to t=
he
> primary key (given the same inputs/template) no matter what data is clear=
ed or
> erased.
> =

> Running tpm2_createprimary twice yields same result as evidence by the rsa
> value, as expected.
> =

> But running:
> tpm2_createprimary
> tpm2_clear
> tpm2_createprimary
> =

> yields a totally different key, as can be seen from the resulting rsa val=
ue.
> This is also consistent with the manpage of tpm2_clear:
> "Clears lockout, endorsement and owner hierarchy authorization values." a=
nd
> "NOTE: All objects created under the respective hierarchies are lost."
> =

> This makes tpm2_clear seem like an exceptionally dangerous command, if I =
run it
> once (inadvertently perhaps), I've now destroyed all use of all keys ever=
 created
> on the system. Yet, based on what I thought I understood about the primary
> seeds, I'd always be able to derive back to a key value.
> =

> So, what I am I missing?
> Feel free to link in references.

Clear rolls the primary seed (SPS) which is the Owner Hierarchy seed.

Generally you would a password/auth on Owner hiearchy, so you wouldn't just=
 arbitrarily
Issue that command. And you can disable that command all together with TPM2=
_ClearControl
Or the tools command tpm2_clearcontrol.

https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-3-Com=
mands-01.38.pdf


> =

> A side question:
> I am unable to create a primary Platform key (owner, endorsement, and null
> work). Looks like authorization is expected.
> Is this an expected result based on how the TPM is configured from the ch=
ip
> vendor? In this case Infineon Here is the output:
> $ tpm2_createprimary -C p -c platform_primary.ctx
> WARNING:esys:src/tss2-
> esys/api/Esys_CreatePrimary.c:393:Esys_CreatePrimary_Finish() Received TPM
> Error
> ERROR:esys:src/tss2-esys/api/Esys_CreatePrimary.c:135:Esys_CreatePrimary()
> Esys Finish ErrorCode (0x000009a2)
> ERROR: Esys_CreatePrimary(0x9A2) - tpm:session(1):authorization failure
> without DA implications
> ERROR: Unable to run tpm2_createprimary

IIRC/IIUC the platform hierarchy has a password enabled by the firmware/OS =
at
boot. So that auth failure would be expected.

> =

> Thanks,
> -John
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============4987465920075338408==--

