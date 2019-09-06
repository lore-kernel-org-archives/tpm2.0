Content-Type: multipart/mixed; boundary="===============5621622249276619840=="
MIME-Version: 1.0
From: Zhao, Shirley <shirley.zhao at intel.com>
Subject: Re: [tpm2] how to upgrade the TPM access control policy when a
 particular PCR is changed.
Date: Fri, 06 Sep 2019 00:54:58 +0000
Message-ID: <A888B25CD99C1141B7C254171A953E8E49072261@shsmsx102.ccr.corp.intel.com>
In-Reply-To: 688D07BB9E3A9E4A852BA1336D1910FF9078F01A@fmsmsx104.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5621622249276619840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for your feedback, Imran. =


But another problem will come if saved into NV index using tpm2_policyautho=
rizenv. =

The NV index need the auth value to read/write.  =

So if no UI to let user enter password, how to save the auth value? =


- Shirley

-----Original Message-----
From: Desai, Imran =

Sent: Friday, September 6, 2019 6:08 AM
To: Zhu, Bing <bing.zhu(a)intel.com>; Roberts, William C <william.c.roberts=
(a)intel.com>; Zhao, Shirley <shirley.zhao(a)intel.com>
Cc: Chen, Luhai <luhai.chen(a)intel.com>; Feng, Roger <roger.feng(a)intel.c=
om>; tpm2(a)lists.01.org
Subject: RE: how to upgrade the TPM access control policy when a particular=
 PCR is changed.

Shirley/ Bing/ Luhai/ Roger -- To summarize the 2 issues for usage of tpm2_=
policyauthorize

1. You do not have a way to save a public key for signature verification 2.=
 Once a new policy is signed, there is no way to invalidate the old signed =
policy

The two issues can be addressed using the tpm2_policyauthorizenv instead.
Instead of signing auth policies, the auth policy is written directly to th=
e NV index.
At any point, only one policy digest exists in the NV index effectively inv=
alidating older policies.
And since there is no policy signage involved, there is no need to save/sum=
mon a public key.

The tool is currently staged as a PR https://github.com/tpm2-software/tpm2-=
tools/pull/1728.

Thanks and Regards,

Imran Desai
________________________________________
From: Zhu, Bing
Sent: Monday, August 26, 2019 10:38 AM
To: Roberts, William C; Zhao, Shirley; Desai, Imran
Cc: Chen, Luhai; Feng, Roger; tpm2(a)lists.01.org
Subject: RE: how to upgrade the TPM access control policy when a particular=
 PCR is changed.

> -----Original Message-----
> From: Roberts, William C
> Sent: Monday, August 26, 2019 08:24 AM
> To: Zhao, Shirley <shirley.zhao(a)intel.com>; Zhu, Bing =

> <bing.zhu(a)intel.com>; Desai, Imran <imran.desai(a)intel.com>
> Cc: Chen, Luhai <luhai.chen(a)intel.com>; Feng, Roger =

> <roger.feng(a)intel.com>; tpm2(a)lists.01.org
> Subject: RE: how to upgrade the TPM access control policy when a =

> particular PCR is changed.
>
>
>
> > -----Original Message-----
> > From: Zhao, Shirley
> > Sent: Saturday, August 24, 2019 4:18 AM
> > To: Roberts, William C <william.c.roberts(a)intel.com>; Zhu, Bing =

> > <bing.zhu(a)intel.com>; Desai, Imran <imran.desai(a)intel.com>
> > Cc: Chen, Luhai <luhai.chen(a)intel.com>; Feng, Roger =

> > <roger.feng(a)intel.com>; tpm2(a)lists.01.org
> > Subject: RE: how to upgrade the TPM access control policy when a =

> > particular PCR is changed.
> >
> > Yes, I have tried nvdefine/nvread/nvwrite.
> > It works, using nvdefine to create a NV index with policywrite/policyre=
ad.
> > Using tpm2_policyauthorize to update the policy.
> >
> > The problem here is tpm2_policyauthorize need to save a signature to =

> > verify the policy is valid.
> > If there is no place to save the signature, it can't work.
>
> I don't understand, you don't have anywhere to save the signature output?
>
> > And the second problem is all the policy signed with the key can =

> > work, which can't make the old policy unusable.
>
> You need to create a more complex policy. You can include an nv index =

> counter In the policy, and when you switch policies increment the nv =

> index. Any policy with older values of nv index wont work.

Looks like this is going to be more complicated when considering TPM NV cou=
nter power failure issue which results in a "leap over" increment. (but thi=
s happens very rarely)

> >
> >
> > - Shirley
> >
> > -----Original Message-----
> > From: Roberts, William C
> > Sent: Saturday, August 24, 2019 1:34 AM
> > To: Zhu, Bing <bing.zhu(a)intel.com>; Desai, Imran =

> > <imran.desai(a)intel.com>; Zhao, Shirley <shirley.zhao(a)intel.com>
> > Cc: Chen, Luhai <luhai.chen(a)intel.com>; Feng, Roger =

> > <roger.feng(a)intel.com>; tpm2(a)lists.01.org
> > Subject: RE: how to upgrade the TPM access control policy when a =

> > particular PCR is changed.
> >
> >
> >
> > > -----Original Message-----
> > > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Zhu, =

> > > Bing
> > > Sent: Thursday, August 8, 2019 11:24 AM
> > > To: Desai, Imran <imran.desai(a)intel.com>; Zhao, Shirley =

> > > <shirley.zhao(a)intel.com>
> > > Cc: Chen, Luhai <luhai.chen(a)intel.com>; Feng, Roger =

> > > <roger.feng(a)intel.com>; tpm2(a)lists.01.org
> > > Subject: Re: [tpm2] how to upgrade the TPM access control policy =

> > > when a particular PCR is changed.
> > >
> > > Thanks Imran, yes we did a test based on your sample, however, it =

> > > seems that this is not what we expected.
> >
> > What's not expected? Policyauthorize lets you tether a policy rooted =

> > by a signing entity so you can change the policy so long as its =

> > signed with the
> trustworthy key.
> >
> > That example in the manpage is for creating a transient object via =

> > tpm2_create, however that policy Could be used for tpm2_nvdefine as =

> > well. The steps to satisfy the policy are the same, however you =

> > Would use nvread rather than unseal to get to the data.
> >
> > >
> > >
> > >
> > > Shirley (in to list) can tell more details on that.
> > >
> > >
> > >
> > > Bing
> > >
> > >
> > >
> > > From: Desai, Imran
> > > Sent: Thursday, August 8, 2019 07:27 AM
> > > To: Zhu, Bing <bing.zhu(a)intel.com>
> > > Cc: tpm2(a)lists.01.org; Zhao, Shirley <shirley.zhao(a)intel.com>; =

> > > Chen, Luhai <luhai.chen(a)intel.com>; Feng, Roger =

> > > <roger.feng(a)intel.com>
> > > Subject: Re: how to upgrade the TPM access control policy when a =

> > > particular PCR is changed.
> > >
> > >
> > >
> > > Hi Bing, refer the example section in man page
> > >
> > >
> > >
> > > https://github.com/tpm2-software/tpm2-
> > > tools/blob/master/man/tpm2_policyauthorize.1.md
> > >
> > >
> > >
> > >
> > > On Aug 7, 2019, at 10:49 PM, Zhu, Bing <bing.zhu(a)intel.com =

> > > <mailto:bing.zhu(a)intel.com> > wrote:
> > >
> > >   Hi,
> > >
> > >   I have a use case like this:
> > >
> > >   We create a TPM2.0 NV index, provision a secret into that NV =

> > > index in TPM, and gate its access control with PCR[7] policy, =

> > > which means that only when PCR[7] value matches the expected =

> > > value, the read access to this NV index is allowed.
> > >
> > >   In a PC compliant machine, PCR[7] is used by BIOS to extend =

> > > Secure Boot policies/configurations, and verification public key =

> > > db settings (PK, KEK,
> > DB/DBx).
> > > The reason that we do it like this because we would like to set =

> > > access control to the secret value stored in that NV index. When =

> > > someone
> > > (attacker) is going to disable secure boot, then PCR[7] value =

> > > changes and doesn't match the value that the original policy was =

> > > created on that NV index, then accessing to that secret value will =

> > > be denied. This is
> > expected behavior that I want.
> > >
> > >   Now the problem is that when secure boot configurations (like
> > > DB/DBx) are changed due to OS software upgrade, the PCR[7] will be =

> > > changed too, then access to that secret in NV index will be denied to=
o.
> > >
> > >   So we'd like to figure out how to upgrade the associated PCR[7] =

> > > policy on that NV Index, in order to make sure the access to this =

> > > NV index is still be available after upgrade (because this is a =

> > > legitimate upgrade
> > usage).
> > >
> > >   we don't know how exactly to do that although I'm aware of that =

> > > the API
> > > TPM2_PolicyAuthorize() would probably do this. However, I didn't =

> > > see anyone who ever did this before somewhere.
> > >
> > >   So is this possible for someone to implement this as a sample in =

> > > TPM usage? Just give me a clue to do that, then we can contribute it.
> > >
> > >   Any comment is appreciated! Thanks.
> > >
> > >
> > >   Bing

--===============5621622249276619840==--

