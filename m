Content-Type: multipart/mixed; boundary="===============2595261031084444729=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] Get error 0x99D in function Tss2_Sys_AC_Send() when
 sending data from TPM to AC
Date: Thu, 28 Mar 2019 15:37:24 -0700
Message-ID: <1cb83ff2-11d9-d5db-b76c-19e8f9df92fa@intel.com>
In-Reply-To: 14BD9F96BC6E0B4F8E42994AF8E306D4CADF39@shsmsx102.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2595261031084444729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
On 3/28/19 1:06 AM, Shen, Songwu wrote:
> Under Windows, I encounter an error 0x99D response from the TPM when call=
ing function Tss2_Sys_AC_Send() to send data from TPM to Attached Component.
> =

> And searching in the TPM spec, looks like this is the error:

As far as I can see the 0x99D is a policy check failed.
The spec says that for TPM2_AC_Send the authorization for sendObject is req=
uired to be a policy session.
Make sure that you setup your authorization correctly. =


Thanks,
-- =

Tadeusz

--===============2595261031084444729==--

