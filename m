Content-Type: multipart/mixed; boundary="===============3483834269696112030=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] RC 0x99d TPM_RC_POLICY_FAIL causes?
Date: Mon, 29 Apr 2019 14:29:16 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D2F9A0@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAO6U=OYYpk3+92QD_hKnX7g+QP-=fosE3zeYx2KDp6zfy=JYyw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3483834269696112030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

That error is:
tpm:session(1):a policy check failed

Imran, any ideas?

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Nick Meyer
> Sent: Friday, April 26, 2019 9:56 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] RC 0x99d TPM_RC_POLICY_FAIL causes?
> =

> Hello,
> =

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
> =

> We are currently in the process of investigating if the PCRs have changed=
 in these
> cases; in the meantime, I wanted to ask here if there are any other causes
> beyond the PCRs changing that could cause this error code, so that we can
> investigate. We also believe it unlikely that the PCR update counter is a=
n issue as
> we would be expecting a TPM_RC_PCR_CHANGED return code in this case.
> =

> Appreciate any insight you may have.
> =

>  <http://www.verizonmedia.com>
> =

> =

> Nick Meyer
> =

> =



--===============3483834269696112030==--

