Content-Type: multipart/mixed; boundary="===============2179296449293935937=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Question about how to get session handle when create policy
Date: Wed, 18 Dec 2019 15:22:50 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E60F57@ORSMSX101.amr.corp.intel.com>
In-Reply-To: A888B25CD99C1141B7C254171A953E8E490A1059@shsmsx102.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2179296449293935937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Zhao, Shirley
> Sent: Wednesday, December 18, 2019 2:25 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: Question about how to get session handle when create policy
> =

> Hello,
> =

> =

> =

> I want to get the session handle when creating policy, how to do it?
> =

> =

> =

> For example,
> =

> # tpm2_createpolicy --policy-pcr --pcr-list sha256:7 --policy pcr.policy =
--policy-
> session
> =

> 2781c435e602b97eef2a95333b72d085a393907cf32b9f825febe37b1af54820

Createpolicy does just that, creates a policy in the tool, starting and sto=
pping sessions
as needed. If you want the session handle, use tpm2_startauthsession and in=
voke
the policy on that session.

A simple example can be found in the manpages for the policy commands:
https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_policypass=
word.1.md

> =

> =

> =

> I use tpm2_createpolicy to create the policy, and start a policy session =
of type
> TPM_SE_POLICY.
> =

> The policy digest is returned, but I can't get the session handle.
> =

> =

> =

> So how to get the session handle?
> =

> =

> =

> Thanks.
> =

> =

> =

> *	Shirley
> =

> =

> =

> =

> =

>=20

--===============2179296449293935937==--

