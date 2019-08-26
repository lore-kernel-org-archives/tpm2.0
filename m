Content-Type: multipart/mixed; boundary="===============0869989440613237878=="
MIME-Version: 1.0
From: Zhu, Bing <bing.zhu at intel.com>
Subject: Re: [tpm2] how to upgrade the TPM access control policy when a
 particular PCR is changed.
Date: Mon, 26 Aug 2019 17:38:03 +0000
Message-ID: <A3DEEEBB19900C48B49572CB9C2891C987938484@SHSMSX108.ccr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DEEBE1@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0869989440613237878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Roberts, William C
> Sent: Monday, August 26, 2019 08:24 AM
> To: Zhao, Shirley <shirley.zhao(a)intel.com>; Zhu, Bing <bing.zhu(a)intel=
.com>;
> Desai, Imran <imran.desai(a)intel.com>
> Cc: Chen, Luhai <luhai.chen(a)intel.com>; Feng, Roger <roger.feng(a)intel=
.com>;
> tpm2(a)lists.01.org
> Subject: RE: how to upgrade the TPM access control policy when a particul=
ar PCR
> is changed.
> =

> =

> =

> > -----Original Message-----
> > From: Zhao, Shirley
> > Sent: Saturday, August 24, 2019 4:18 AM
> > To: Roberts, William C <william.c.roberts(a)intel.com>; Zhu, Bing
> > <bing.zhu(a)intel.com>; Desai, Imran <imran.desai(a)intel.com>
> > Cc: Chen, Luhai <luhai.chen(a)intel.com>; Feng, Roger
> > <roger.feng(a)intel.com>; tpm2(a)lists.01.org
> > Subject: RE: how to upgrade the TPM access control policy when a
> > particular PCR is changed.
> >
> > Yes, I have tried nvdefine/nvread/nvwrite.
> > It works, using nvdefine to create a NV index with policywrite/policyre=
ad.
> > Using tpm2_policyauthorize to update the policy.
> >
> > The problem here is tpm2_policyauthorize need to save a signature to
> > verify the policy is valid.
> > If there is no place to save the signature, it can't work.
> =

> I don't understand, you don't have anywhere to save the signature output?
> =

> > And the second problem is all the policy signed with the key can work,
> > which can't make the old policy unusable.
> =

> You need to create a more complex policy. You can include an nv index cou=
nter
> In the policy, and when you switch policies increment the nv index. Any p=
olicy
> with older values of nv index wont work.

Looks like this is going to be more complicated when considering TPM NV cou=
nter power failure issue which results in a "leap over" increment. (but thi=
s happens very rarely)  =


> >
> >
> > - Shirley
> >
> > -----Original Message-----
> > From: Roberts, William C
> > Sent: Saturday, August 24, 2019 1:34 AM
> > To: Zhu, Bing <bing.zhu(a)intel.com>; Desai, Imran
> > <imran.desai(a)intel.com>; Zhao, Shirley <shirley.zhao(a)intel.com>
> > Cc: Chen, Luhai <luhai.chen(a)intel.com>; Feng, Roger
> > <roger.feng(a)intel.com>; tpm2(a)lists.01.org
> > Subject: RE: how to upgrade the TPM access control policy when a
> > particular PCR is changed.
> >
> >
> >
> > > -----Original Message-----
> > > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Zhu, Bing
> > > Sent: Thursday, August 8, 2019 11:24 AM
> > > To: Desai, Imran <imran.desai(a)intel.com>; Zhao, Shirley
> > > <shirley.zhao(a)intel.com>
> > > Cc: Chen, Luhai <luhai.chen(a)intel.com>; Feng, Roger
> > > <roger.feng(a)intel.com>; tpm2(a)lists.01.org
> > > Subject: Re: [tpm2] how to upgrade the TPM access control policy
> > > when a particular PCR is changed.
> > >
> > > Thanks Imran, yes we did a test based on your sample, however, it
> > > seems that this is not what we expected.
> >
> > What's not expected? Policyauthorize lets you tether a policy rooted
> > by a signing entity so you can change the policy so long as its signed =
with the
> trustworthy key.
> >
> > That example in the manpage is for creating a transient object via
> > tpm2_create, however that policy Could be used for tpm2_nvdefine as
> > well. The steps to satisfy the policy are the same, however you Would
> > use nvread rather than unseal to get to the data.
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
> > > Cc: tpm2(a)lists.01.org; Zhao, Shirley <shirley.zhao(a)intel.com>; Ch=
en,
> > > Luhai <luhai.chen(a)intel.com>; Feng, Roger <roger.feng(a)intel.com>
> > > Subject: Re: how to upgrade the TPM access control policy when a
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
> > > On Aug 7, 2019, at 10:49 PM, Zhu, Bing <bing.zhu(a)intel.com
> > > <mailto:bing.zhu(a)intel.com> > wrote:
> > >
> > > 	Hi,
> > >
> > > 	I have a use case like this:
> > >
> > > 	We create a TPM2.0 NV index, provision a secret into that NV index
> > > in TPM, and gate its access control with PCR[7] policy, which means
> > > that only when PCR[7] value matches the expected value, the read
> > > access to this NV index is allowed.
> > >
> > > 	In a PC compliant machine, PCR[7] is used by BIOS to extend Secure
> > > Boot policies/configurations, and verification public key db
> > > settings (PK, KEK,
> > DB/DBx).
> > > The reason that we do it like this because we would like to set
> > > access control to the secret value stored in that NV index. When
> > > someone
> > > (attacker) is going to disable secure boot, then PCR[7] value
> > > changes and doesn't match the value that the original policy was
> > > created on that NV index, then accessing to that secret value will
> > > be denied. This is
> > expected behavior that I want.
> > >
> > > 	Now the problem is that when secure boot configurations (like
> > > DB/DBx) are changed due to OS software upgrade, the PCR[7] will be
> > > changed too, then access to that secret in NV index will be denied to=
o.
> > >
> > > 	So we'd like to figure out how to upgrade the associated PCR[7]
> > > policy on that NV Index, in order to make sure the access to this NV
> > > index is still be available after upgrade (because this is a
> > > legitimate upgrade
> > usage).
> > >
> > > 	we don't know how exactly to do that although I'm aware of that the
> > > API
> > > TPM2_PolicyAuthorize() would probably do this. However, I didn't see
> > > anyone who ever did this before somewhere.
> > >
> > > 	So is this possible for someone to implement this as a sample in
> > > TPM usage? Just give me a clue to do that, then we can contribute it.
> > >
> > > 	Any comment is appreciated! Thanks.
> > >
> > >
> > > 	Bing


--===============0869989440613237878==--

