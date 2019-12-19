Content-Type: multipart/mixed; boundary="===============6098173098088973190=="
MIME-Version: 1.0
From: Zhao, Shirley <shirley.zhao at intel.com>
Subject: [tpm2] Re: Question about how to get session handle when create policy
Date: Thu, 19 Dec 2019 03:09:59 +0000
Message-ID: <A888B25CD99C1141B7C254171A953E8E490A1101@shsmsx102.ccr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E60F57@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6098173098088973190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks, Robert. =

Just confirm, please review the following command, then 0x3000000 is the se=
ssion handle, right? =

# tpm2_startauthsession -a -S session.ctx
session-handle: 0x3000000
# tpm2_policypcr -S session.ctx -L sha256:0 -f pcr.policy
# tpm2_flushcontext

- Shirley =


-----Original Message-----
From: Roberts, William C <william.c.roberts(a)intel.com> =

Sent: Wednesday, December 18, 2019 11:23 PM
To: Zhao, Shirley <shirley.zhao(a)intel.com>; tpm2(a)lists.01.org
Subject: RE: Question about how to get session handle when create policy



> -----Original Message-----
> From: Zhao, Shirley
> Sent: Wednesday, December 18, 2019 2:25 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; =

> tpm2(a)lists.01.org
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

> # tpm2_createpolicy --policy-pcr --pcr-list sha256:7 --policy =

> pcr.policy --policy- session
> =

> 2781c435e602b97eef2a95333b72d085a393907cf32b9f825febe37b1af54820

Createpolicy does just that, creates a policy in the tool, starting and sto=
pping sessions as needed. If you want the session handle, use tpm2_startaut=
hsession and invoke the policy on that session.

A simple example can be found in the manpages for the policy commands:
https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_policypass=
word.1.md

> =

> =

> =

> I use tpm2_createpolicy to create the policy, and start a policy =

> session of type TPM_SE_POLICY.
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

--===============6098173098088973190==--

