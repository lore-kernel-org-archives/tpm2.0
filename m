Content-Type: multipart/mixed; boundary="===============5103902456001310907=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 21, Issue 16
Date: Fri, 29 Mar 2019 16:53:44 +0000
Message-ID: <688D07BB9E3A9E4A852BA1336D1910FF83F329D4@fmsmsx104.amr.corp.intel.com>
In-Reply-To: mailman.2604.1553844484.2109.tpm2@lists.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5103902456001310907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

@songwu you can see the example for policycommandcode here https://github.c=
om/tpm2-software/tpm2-tools/blob/master/man/tpm2_policycommandcode.1.md

________________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of tpm2-request(a)lists.=
01.org [tpm2-request(a)lists.01.org]
Sent: Friday, March 29, 2019 12:28 AM
To: tpm2(a)lists.01.org
Subject: tpm2 Digest, Vol 21, Issue 16

Send tpm2 mailing list submissions to
        tpm2(a)lists.01.org

To subscribe or unsubscribe via the World Wide Web, visit
        https://lists.01.org/mailman/listinfo/tpm2
or, via email, send a message with subject or body 'help' to
        tpm2-request(a)lists.01.org

You can reach the person managing the list at
        tpm2-owner(a)lists.01.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of tpm2 digest..."


Today's Topics:

   1. Re: Get error 0x99D in function Tss2_Sys_AC_Send() when
      sending data from TPM to AC (Shen, Songwu)


----------------------------------------------------------------------

Message: 1
Date: Fri, 29 Mar 2019 07:27:59 +0000
From: "Shen, Songwu" <songwu.shen(a)intel.com>
To: "Struk, Tadeusz" <tadeusz.struk(a)intel.com>, "tpm2(a)lists.01.org"
        <tpm2(a)lists.01.org>, "Tricca, Philip B" <philip.b.tricca(a)intel.=
com>
Subject: Re: [tpm2] Get error 0x99D in function Tss2_Sys_AC_Send()
        when sending data from TPM to AC
Message-ID:
        <14BD9F96BC6E0B4F8E42994AF8E306D4CAE1C9(a)shsmsx102.ccr.corp.intel.=
com>
Content-Type: text/plain; charset=3D"us-ascii"

Hi Tadeusz,

Maybe before calling TSS2_Sys_AC_SEND(), we should call Tss2_Sys_PolicyComm=
andCode() to set policySession->commandCode to TPM2_CC_AC_Send according to=
 the spec.

But I still don't know how to program it, could you provide any sample for =
Tss2_Sys_PolicyCommandCode() and Tss2_Sys_AC_SEND()?

Thanks
Songwu

From: Shen, Songwu
Sent: Friday, March 29, 2019 10:24 AM
To: Struk, Tadeusz <tadeusz.struk(a)intel.com>; tpm2(a)lists.01.org; Tricca=
, Philip B <philip.b.tricca(a)intel.com>
Subject: RE: Get error 0x99D in function Tss2_Sys_AC_Send() when sending da=
ta from TPM to AC


Hi Tadeusz,



Thank you for correction:)
I look into the spec and I'm sending TPM2_AC_SEND command,
it mentioned that policySession->commandCode of policy session context is r=
equired to be TPM_CC_AC_SEND, otherwise it will report TPM_RC_POLICY_FAIL.
But I can't find the definition of policySession in TPM spec part2, and com=
mandCode:



[cid:image001.png(a)01D4E619.3AC002A0]

Could you help?



Thanks

Songwu



-----Original Message-----
From: Struk, Tadeusz
Sent: Friday, March 29, 2019 6:37 AM
To: Shen, Songwu <songwu.shen(a)intel.com<mailto:songwu.shen(a)intel.com>>;=
 tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>; Tricca, Philip B <philip.=
b.tricca(a)intel.com<mailto:philip.b.tricca(a)intel.com>>
Subject: Re: Get error 0x99D in function Tss2_Sys_AC_Send() when sending da=
ta from TPM to AC



Hello,

On 3/28/19 1:06 AM, Shen, Songwu wrote:

> Under Windows, I encounter an error 0x99D response from the TPM when call=
ing function Tss2_Sys_AC_Send() to send data from TPM to Attached Component.

>

> And searching in the TPM spec, looks like this is the error:



As far as I can see the 0x99D is a policy check failed.

The spec says that for TPM2_AC_Send the authorization for sendObject is req=
uired to be a policy session.

Make sure that you setup your authorization correctly.



Thanks,

--

Tadeusz

--===============5103902456001310907==--

