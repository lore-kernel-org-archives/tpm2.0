Content-Type: multipart/mixed; boundary="===============8020681730369299182=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Thu, 09 Apr 2020 17:23:44 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EBBEFC@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAP3jAwS5tgRZJ5f9OYDHBVNCE_p570Z=oKLPDdav9SFcwe9SFg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8020681730369299182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
> Sent: Thursday, April 9, 2020 11:18 AM
> To: Desai, Imran <imran.desai(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: ESys_ActivateCredential
> =

> How do I know if  RM is being used?


If you set the tcti to the device tcti, it will open /dev/tpm0 by default. =
And that wont
Be an RM. You can also give it an option. Esys_Initialize() takes a tcti as=
 an option,
NULL will cause it to use the default search behavior of the Tss2_TctiLdr, =
see:

https://github.com/tpm2-software/tpm2-tss/blob/master/man/Tss2_TctiLdr_Init=
ialize.3.in
https://github.com/tpm2-software/tpm2-tss/blob/master/man/Tss2_Tcti_Device_=
Init.3.in
https://github.com/tpm2-software/tpm2-tss/blob/master/man/tss2-tcti-device.=
7.in

You can use man locally if you prefer as well:
man 3 Tss2_TctiLdr_Initialize
man 7 tss2-tcti-device
man 3 Tss2_Tcti_Device_Init

Note that https://github.com/tpm2-software/tpm2-tss/blob/master/man/Tss2_Tc=
ti_Device_Init.3.in
Has sample code in it.

If you're using the tools, it supports explicitly choosing the TCTI:
https://github.com/tpm2-software/tpm2-tools/blob/master/man/common/tcti.md

Also note that the /dev/tpmrm0 (Notice the RM) is an in-kernel resource man=
ager.


> When I do ESys_Initialize, I see these WARNINGs, wondering if it's okay f=
or multi-
> thread
> WARNING:esys:src/tss2-esys/esys_tcti_default.c:137:tcti_from_file() Could=
 not
> load TCTI file: libtss2-tcti-default.so <http://libtss2-tcti-default.so/>=
 libtss2-tcti-
> default.so <http://libtss2-tcti-default.so/>
> WARNING:esys:src/tss2-esys/esys_tcti_default.c:137:tcti_from_file() Could=
 not
> load TCTI file: libtss2-tcti-tabrmd.so <http://libtss2-tcti-tabrmd.so/>
> =

> In my single threaded process, everything works so smoothly [root]# ./tpm
> WARNING:esys:src/tss2-esys/esys_tcti_default.c:137:tcti_from_file() Could=
 not
> load TCTI file: libtss2-tcti-default.so <http://libtss2-tcti-default.so/>
> WARNING:esys:src/tss2-esys/esys_tcti_default.c:137:tcti_from_file() Could=
 not
> load TCTI file: libtss2-tcti-tabrmd.so <http://libtss2-tcti-tabrmd.so/> E=
SYS
> Initialization: Pass
> =

> Read TPM EK Certificate: Pass
> =

> TPM EK Certificate Root-CA Verification: Pass
> =

> Clear TPM State: Pass
> =

> Created EK Primary object: Pass
> #####Handle 0x418368
> =

> Create Attestation Key: Pass
> #####Ak_Handle 0x41836b
> =

> Original Credential=3D"deadbeefdeadbeefdead"
> =

> Make Credential: Pass
> #####Encrypted Credential
> Blob=3D"0020508e439bc6512d044bb8739e8d61c8ce3664d25f3572389b46c8797e562a
> 45c412864f020a7f1bbcab7a34f0"
> =

> #####Encrypted
> Secret=3D"b70689bb0ed9fa8324cfa03d727e6c6795069b4f0943108409b89009b9cc76c
> 76bddb31a5ccf34cfebc5d3fe715899bb725a8a3c8fe4a6046233869123f3e978051aec
> e0d7af0ad6f85164a32fd2c5ad756e8c3b72f6311126de79a30c0d72aa0a6f3f437f6bc
> 077c41d3cc6450c71e803ca6074d34ce3debf5114f4bac2fd7ee6a87ef9f07d83079477
> 5dda4f77e4620cbaf9aeb302040ee2a66a352b9fffaa5447c09a249bb22d9d989b7f14
> 06612a90b8d8bce6bb940fbfd1d50f31398403a2643c73bec336e6fcca46f29f9b6aa87
> fd11d53ec6f145d61b2a61dffc783ae2b2c66184435d633d0b5a420efa01748e39d687
> e1eb9fcc1759c184972779bfc"
> =

> Activating Credential: Pass
> #####Recovered Credential=3D"deadbeefdeadbeefdead"
> =

> [root]#
> =

> =

> =

> On Wed, Apr 8, 2020 at 7:02 PM Rahul Hardikar <rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > wrote:
> =

> =

> 	Thanks guys, I'll try this but  i also wanted to know if there is a way =
to
> know if the TPM still has the EK and AK keys loaded? I have the EK handle=
 and AK
> handle (not made it persistent) but I want to make sure it's present as t=
hese are
> necessary for ActivateCredential to succeed
> 	ESys_ActivateCredential complaining about secret parameter doesn't
> make sense to me, I tested on server side, ak_name is same as that sent a=
nd so is
> EK_PUB object as well as  EK_Cert in nvram, I call the same
> external_makecredential call that's in the GitHub to create secret and ma=
de sure
> secret,credblob matches on the client side when received from server.
> =

> 	Thanks,
> 	Rahul
> =

> 	On Tue, Mar 17, 2020 at 6:19 AM Imran Desai <imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com> > wrote:
> =

> =

> 		Set this up with all handles in use made persistent. If you still see
> issues, gdb-break or turn on debug logging at the Esys call and compare t=
he
> function arguments.
> 		_______________________________________________
> 		tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 		To unsubscribe send an email to tpm2-leave(a)lists.01.org
> <mailto:tpm2-leave(a)lists.01.org>
> 		%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =



--===============8020681730369299182==--

