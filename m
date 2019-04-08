Content-Type: multipart/mixed; boundary="===============0819037853707217011=="
MIME-Version: 1.0
From: Petr Vandrovec <petr at vmware.com>
Subject: Re: [tpm2] Policy digest zeroed out after successful TPM2_Sign
Date: Mon, 08 Apr 2019 19:14:19 +0000
Message-ID: <0538f6fd-2199-bb87-6190-5b75938046c3@vmware.com>
In-Reply-To: CAO6U=ObLwki+YXSp+zaCtmEw_cXEVp6Kp8G-GAB68OMss--NTw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0819037853707217011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Nick Meyer wrote on 4/8/2019 10:30 AM:
> Hello,
> =

> I'm working on implementing a TPM2_Sign operation protected by a PCR =

> policy. I have discovered that the policy digest appears to be zeroed =

> out as part of the sign operation.

Hi,
   yes, that is correct.  Each policy digest can be used only once.  You =

have to redo all TPM2_PolicyXXX calls for second operation.

> Is there another reason that this /successful/=C2=A0sign operation would =
be =

> invalidating the session?

That is per specification.

Successful sign (or any other) operation resets policy digest back to =

initial state.  Failing sign (or any other) operation leaves policy =

unchanged - you should destruct it yourself to make sure nobody can come =

and reuse it.

All TPM2_Policy* calls should be reasonably fast, so it should not cause =

performance problems to recreate it.  If you are using PolicyAuthorize, =

you can cache result + ticket of signature validation, avoiding most =

expensive calls.

Petr


--===============0819037853707217011==--

