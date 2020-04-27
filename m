Content-Type: multipart/mixed; boundary="===============6109763614319912879=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: One question in the code of
 tpm2-tools/tools/tpm2_loadexternal.c
Date: Mon, 27 Apr 2020 15:43:05 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649ED7A0A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: A888B25CD99C1141B7C254171A953E8E490EA38C@shsmsx102.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6109763614319912879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Zhao, Shirley [mailto:shirley.zhao(a)intel.com]
> Sent: Sunday, April 26, 2020 3:43 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] One question in the code of tpm2-
> tools/tools/tpm2_loadexternal.c
> =

> Hi, all,
> =

> In the following condition in tools/tpm2_loadexternal.c, if both policy a=
nd auth
> are empty, then it will also set TPMA_OBJECT_USERWITHAUTH.
> Seems it is not correct.

If you're not using a policy and have an empty password, then auth with the=
 empty password.
That's the default behavior. If you specify a policy, we will turn down use=
rwithauth, if you specify
both, we use them both IIRC (policy or auth). If you want different attribu=
tes, the -a option will
give you full control. This should be true on tpm2-tools 4.0+.

> =

>     pub.publicArea.objectAttributes =3D BASE_DEFAULT_ATTRS;
> =

>     if (!(ctx.policy && !ctx.auth)) {
> =

>         pub.publicArea.objectAttributes |=3D TPMA_OBJECT_USERWITHAUTH;
> =

>     }
> =

> =

> =

> And no description about  this scenario in spec, part2, section 8.3.1.
> =

> 6
> =

> userWithAuth
> =

> SET (1): Approval of USER role actions with this object may be with an HM=
AC
> session or with a password using the authValue of the object or a policy =
session.
> CLEAR (0): Approval of USER role actions with this object may only be don=
e with a
> policy session.
> =

> =

> =

> Can you help to give more information?
> =

> =

> =

> Thanks.
> =

> *	Shirley

--===============6109763614319912879==--

