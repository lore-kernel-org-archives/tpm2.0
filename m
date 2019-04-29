Content-Type: multipart/mixed; boundary="===============7613522959412940222=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] RC 0x99d TPM_RC_POLICY_FAIL causes?
Date: Mon, 29 Apr 2019 17:50:56 +0000
Message-ID: <688D07BB9E3A9E4A852BA1336D1910FF83F70636@fmsmsx104.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649D2F9A0@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7613522959412940222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Looks like the PCRs changed. If that is an expected consequence of firmware=
 updates consider using policy authorize tool to address the PCR brittlenes=
s. Besides that I would also look into the errors from session handling inc=
luding whether or not you are starting a real (non-trial) session when tryi=
ng to satisfy the pcr policy.

Thanks and Regards,

Imran Desai
________________________________________
From: Roberts, William C
Sent: Monday, April 29, 2019 7:29 AM
To: Nick Meyer; tpm2(a)lists.01.org; Desai, Imran
Subject: RE: [tpm2] RC 0x99d TPM_RC_POLICY_FAIL causes?

That error is:
tpm:session(1):a policy check failed

Imran, any ideas?

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Nick Meyer
> Sent: Friday, April 26, 2019 9:56 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] RC 0x99d TPM_RC_POLICY_FAIL causes?
>
> Hello,
>
> We have a set of boxes that use TPM2_Sign() to sign a cryptographic chall=
enge
> during a startup process. The signing key is protected by a PCR policy; t=
his policy is
> the only policy in the session authorizing the sign. Occasionally, one of=
 these
> boxes will start returning 0x99d and refuse to sign the challenge, after =
which it
> seems to be stuck in this inconsistent state until we generate a new sign=
ing key.
>
> We are currently in the process of investigating if the PCRs have changed=
 in these
> cases; in the meantime, I wanted to ask here if there are any other causes
> beyond the PCRs changing that could cause this error code, so that we can
> investigate. We also believe it unlikely that the PCR update counter is a=
n issue as
> we would be expecting a TPM_RC_PCR_CHANGED return code in this case.
>
> Appreciate any insight you may have.
>
>  <http://www.verizonmedia.com>
>
>
> Nick Meyer
>
>

--===============7613522959412940222==--

