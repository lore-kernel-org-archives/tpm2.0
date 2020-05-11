Content-Type: multipart/mixed; boundary="===============8818213317239202536=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: The script of evictcontrol failed during create ek and ak
Date: Mon, 11 May 2020 14:36:30 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EDC9FC@ORSMSX101.amr.corp.intel.com>
In-Reply-To: BL0PR11MB32522DAD1FB20C4650F2076B8DA10@BL0PR11MB3252.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8818213317239202536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

What's the exact command and error?

> -----Original Message-----
> From: Zhao, Shirley [mailto:shirley.zhao(a)intel.com]
> Sent: Sunday, May 10, 2020 9:31 PM
> To: tpm2(a)lists.01.org
> Cc: Desai, Imran <imran.desai(a)intel.com>
> Subject: [tpm2] Re: The script of evictcontrol failed during create ek an=
d ak
> =

> Oh, I use another parameter to make it persistent, it works as below:
> =

> tpm2_evictcontrol -C o -c ak.ctx -o primary.handle
> =

> But still not sure why assign a handle 0x81010002 doesn't work.
> =

> The TPM has been cleared.
> =

> =

> =

> From: Zhao, Shirley
> Sent: Saturday, May 9, 2020 11:58 AM
> To: 'tpm2(a)lists.01.org' <tpm2(a)lists.01.org>
> Cc: Desai, Imran <imran.desai(a)intel.com>
> Subject: The script of evictcontrol failed during create ek and ak
> =

> =

> =

> Thanks, Imran.
> =

> I have fixed the failure of the script of tpm2_policyauthorize.
> =

> =

> =

> Now, I met another failure when running the script on https://github.com/=
tpm2-
> software/tpm2-tools/blob/master/man/tpm2_createak.1.md
> <https://github.com/tpm2-software/tpm2-
> tools/blob/master/man/tpm2_createak.1.md> .
> =

> The log is:
> =

> $ tpm2_startup --clear --tcti=3Dmssim
> =

> $ tpm2_createek -c ek.handle -G rsa -u ek.pub --tcti=3Dmssim
> =

> $ tpm2_createak -C ek.handle -c ak.ctx -u ak.pub -n ak.name --tcti=3Dmssim
> =

> loaded-key:
> =

>   name:
> 000ba3f7e942e3d87b2c7bebb28f6893c4146bc5a89a4018c9f6b778406f2eac0fea
> =

> $ tpm2_evictcontrol -C o -c ak.ctx 0x81010002 --tcti=3Dmssim
> =

> WARNING:esys:src/tss2-
> esys/api/Esys_ContextLoad.c:279:Esys_ContextLoad_Finish() Received TPM Er=
ror
> =

> ERROR:esys:src/tss2-esys/api/Esys_ContextLoad.c:93:Esys_ContextLoad() Esys
> Finish ErrorCode (0x00000902)
> =

> ERROR: Esys_ContextLoad(0x902) - tpm:warn(2.0): out of memory for object
> contexts
> =

> ERROR:esys:src/tss2-esys/esys_tr.c:357:Esys_TR_Close() Error: Esys handle=
 does
> not exist (70018).
> =

> ERROR: Esys_TR_Close(0x70018) - esapi:The ESYS_TR resource object is bad
> =

> ERROR: Unable to run tpm2_evictcontrol
> =

> =

> =

> Not sure whether it is the handle is wrong, because when check transient =
handle
> as below.
> =

> $ tpm2_getcap handles-transient --tcti=3Dmssim
> =

> - 0x80000000
> =

> - 0x80000001
> =

> - 0x80000002
> =

> =

> =

> But even I update the 0x81010002 into 0x80000000, 0x80000001 or 0x8000000=
2, it
> still result in the same error.
> =

> =

> =

> Please help, thanks.
> =

> =

> =

> *	Shirley
> =

>=20

--===============8818213317239202536==--

