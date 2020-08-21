Content-Type: multipart/mixed; boundary="===============0447564080135914236=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Esys primary key creation error
Date: Fri, 21 Aug 2020 15:58:45 +0000
Message-ID: <SN6PR11MB3437FFD7F49D27E2BF0D286EB85B0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: f82e7dfe9a2e4f5a8e3b1eb4a9a93bbc@bosch.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0447564080135914236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You have ESYS_TR_NONE for the 3 session handles, you need
someway to authorize yourself to the hierarchy. This is accomplished
via session handles. If you just need to use a password, set the
first session parameter to ESYS_TR_PASSWORD. Then you will
authorize to the hierarchy using the implicit password session
and an empty or blank password. If you need a specific
password, you can use Esys_TR_SetAuth, and use the hierarchy
as parameter 2 and the auth structure populated as argument 3.

Something like this:
rc =3D Esys_CreatePrimary(esysContext, ESYS_TR_RH_OWNER,
  ESYS_TR_PASSWORD, ESYS_TR_NONE, ESYS_TR_NONE,
  &primaryInSensitive, &primaryInPublic, &outsideInfo, &creationPCR,
  &primaryObjectHandle, &primaryOutPublic, &primaryCreationData,
  &primaryCreationHash, &primaryCreationTicket);

> -----Original Message-----
> From: FIXED-TERM Schick Felix (CR/APA3) <fixed-
> term.Felix.Schick3(a)bosch.com>
> Sent: Thursday, August 20, 2020 8:54 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Esys primary key creation error
> =

> Hello Everybody,
> =

> =

> =

> I am currently experimenting with the Esys-API and have encountered a pro=
blem
> during the primary key creation.
> =

> =

> =

>     TPM2B_PUBLIC * primaryOutPublic;
> =

>     TPM2B_CREATION_DATA * primaryCreationData;
> =

>     TPM2B_DIGEST * primaryCreationHash;
> =

>     TPMT_TK_CREATION  * primaryCreationTicket;
> =

>     ESYS_TR primaryObjectHandle;
> =

> =

> =

>     // Create primary key
> =

>     rc =3D Esys_CreatePrimary(esysContext, ESYS_TR_RH_OWNER, ESYS_TR_NONE,
> ESYS_TR_NONE, ESYS_TR_NONE,
> =

>             &primaryInSensitive, &primaryInPublic, &outsideInfo, &creatio=
nPCR,
> =

>             &primaryObjectHandle, &primaryOutPublic, &primaryCreationData,
> &primaryCreationHash, &primaryCreationTicket);
> =

> =

> =

>     if( rc !=3D TSS2_RC_SUCCESS){
> =

>         std::cerr << "Creation of primary key failed with " <<
> =

>                   "response code: 0x"<< std::hex << rc << std::endl;
> =

>         Esys_Finalize(&esysContext);
> =

>         return EXIT_FAILURE;
> =

>     }
> =

> =

> =

> =

> =

> I get the following error:
> =

> =

> =

> ERROR:esys:src/tss2-esys/esys_iutil.c:1178:check_session_feasibility() Not
> enough sessions provided for the command.
> =

> ERROR:esys:src/tss2-
> esys/api/Esys_CreatePrimary.c:208:Esys_CreatePrimary_Async() Check session
> usage ErrorCode (0x0007000b)
> =

> ERROR:esys:src/tss2-esys/api/Esys_CreatePrimary.c:110:Esys_CreatePrimary()
> Error in async function ErrorCode (0x0007000b)
> =

> =

> =

> I hope this is enough context for the trained eye, I would be very gratef=
ul for
> help with this issue.
> =

> Thank you very much
> =

> =

> =

> Felix Schick
> =

> =



--===============0447564080135914236==--

