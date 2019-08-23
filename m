Content-Type: multipart/mixed; boundary="===============6526098109396253639=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] how to upgrade the TPM access control policy when a
 particular PCR is changed.
Date: Fri, 23 Aug 2019 17:33:57 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEE51A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: A3DEEEBB19900C48B49572CB9C2891C98791139D@SHSMSX108.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6526098109396253639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Zhu, Bing
> Sent: Thursday, August 8, 2019 11:24 AM
> To: Desai, Imran <imran.desai(a)intel.com>; Zhao, Shirley
> <shirley.zhao(a)intel.com>
> Cc: Chen, Luhai <luhai.chen(a)intel.com>; Feng, Roger <roger.feng(a)intel=
.com>;
> tpm2(a)lists.01.org
> Subject: Re: [tpm2] how to upgrade the TPM access control policy when a
> particular PCR is changed.
> =

> Thanks Imran, yes we did a test based on your sample, however, it seems t=
hat
> this is not what we expected.

What's not expected? Policyauthorize lets you tether a policy rooted by a s=
igning entity so you can
change the policy so long as its signed with the trustworthy key.

That example in the manpage is for creating a transient object via tpm2_cre=
ate, however that policy
Could be used for tpm2_nvdefine as well. The steps to satisfy the policy ar=
e the same, however you
Would use nvread rather than unseal to get to the data.

> =

> =

> =

> Shirley (in to list) can tell more details on that.
> =

> =

> =

> Bing
> =

> =

> =

> From: Desai, Imran
> Sent: Thursday, August 8, 2019 07:27 AM
> To: Zhu, Bing <bing.zhu(a)intel.com>
> Cc: tpm2(a)lists.01.org; Zhao, Shirley <shirley.zhao(a)intel.com>; Chen, =
Luhai
> <luhai.chen(a)intel.com>; Feng, Roger <roger.feng(a)intel.com>
> Subject: Re: how to upgrade the TPM access control policy when a particul=
ar PCR
> is changed.
> =

> =

> =

> Hi Bing, refer the example section in man page
> =

> =

> =

> https://github.com/tpm2-software/tpm2-
> tools/blob/master/man/tpm2_policyauthorize.1.md
> =

> =

> =

> =

> On Aug 7, 2019, at 10:49 PM, Zhu, Bing <bing.zhu(a)intel.com
> <mailto:bing.zhu(a)intel.com> > wrote:
> =

> 	Hi,
> =

> 	I have a use case like this:
> =

> 	We create a TPM2.0 NV index, provision a secret into that NV index in
> TPM, and gate its access control with PCR[7] policy, which means that onl=
y when
> PCR[7] value matches the expected value, the read access to this NV index=
 is
> allowed.
> =

> 	In a PC compliant machine, PCR[7] is used by BIOS to extend Secure Boot
> policies/configurations, and verification public key db settings (PK, KEK=
, DB/DBx).
> The reason that we do it like this because we would like to set access co=
ntrol to
> the secret value stored in that NV index. When someone (attacker) is goin=
g to
> disable secure boot, then PCR[7] value changes and doesn't match the valu=
e that
> the original policy was created on that NV index, then accessing to that =
secret
> value will be denied. This is expected behavior that I want.
> =

> 	Now the problem is that when secure boot configurations (like DB/DBx)
> are changed due to OS software upgrade, the PCR[7] will be changed too, t=
hen
> access to that secret in NV index will be denied too.
> =

> 	So we'd like to figure out how to upgrade the associated PCR[7] policy on
> that NV Index, in order to make sure the access to this NV index is still=
 be
> available after upgrade (because this is a legitimate upgrade usage).
> =

> 	we don't know how exactly to do that although I'm aware of that the API
> TPM2_PolicyAuthorize() would probably do this. However, I didn't see anyo=
ne
> who ever did this before somewhere.
> =

> 	So is this possible for someone to implement this as a sample in TPM
> usage? Just give me a clue to do that, then we can contribute it.
> =

> 	Any comment is appreciated! Thanks.
> =

> =

> 	Bing


--===============6526098109396253639==--

