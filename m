Content-Type: multipart/mixed; boundary="===============5279495762722075376=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Implementing a TPM EA Policy with Fingerprints
Date: Mon, 28 Oct 2019 13:34:18 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E2BEFF@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAJLNp_Wj9Ke=5yHhHVxzG6rc4Uyh+5r0gmfECjWV1JRuQeuzwA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5279495762722075376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Arun Sudhir [mailto:arunsudhir19(a)gmail.com]
> Sent: Tuesday, October 22, 2019 1:33 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Implementing a TPM EA Policy with Fingerprints
> =

> Hi,
> =

> I have read about EA Policies in the book "A Practical Guide to TPM 2.0".=
 I
> understand the theoritical part of how everything works with EA policies.=
 My
> question is regarding how to implement an EA policy with a fingerprint
> authentication attached to it in Windows.
> =

> How does communication work between the TPM and the fingerprint reader if
> someone tries to access an object attached to such a policy? I read in th=
e TPM
> Software Stack chapter on the same book that policies can have callbacks.=
 So
> does the policy have a callback function to code that we write - which , =
in turn,
> shows up the fingerprint dialog, captures the fingerprint and then hashes=
 a string
> "Arun's fingerprint" (say) if the fingerprint matches "Arun". If that is =
the case,
> what stops someone some swapping out that function to just supplying a ha=
sh of
> that string (and skip the fingerprint altogether)?

Any security check worth its salt would be performed in the TPM not in the =
untrusted
OS side. Session keep in an internal policy digest that gets updated on pol=
icy commands.
So the TPM is enforcing that it's Arun's fingerprint matches. However, sinc=
e a TPM isn't
hooked directly to a fingerprint reader, you have to supply the information=
 to the TPM
via a policy command, somehow.

I would imagine you would take the fingerprint data and generate some secre=
t value
from it. Perhaps taking the fingerprint data buffer and hashing it and then=
 using that
to issue a TPM2_PolicySecret command.

> =

> If there is someone who has done this, i'd really appreciate tips or even=
 sample
> code on how it is done.
> =

> Thanks
> Arun

--===============5279495762722075376==--

