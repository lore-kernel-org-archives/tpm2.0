Content-Type: multipart/mixed; boundary="===============7226881160113310401=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Help combining multiple policy assertions (logical AND)
Date: Mon, 07 Dec 2020 15:04:45 +0000
Message-ID: <SN6PR11MB3437B6EDA271340CF041BA07B8CE0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: CAHC9VhRjbbqsVzQ6Kx3jjaxvVeA=To6p599qcx53J_Q41bS4KQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7226881160113310401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Paul Moore <paul(a)paul-moore.com>
> Sent: Friday, December 4, 2020 11:11 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Help combining multiple policy assertions (logical AN=
D)
> =

> On Fri, Dec 4, 2020 at 10:06 AM Roberts, William C <william.c.roberts(a)i=
ntel.com>
> wrote:
> > > -----Original Message-----
> > > From: Paul Moore <paul(a)paul-moore.com>
> > > Sent: Thursday, December 3, 2020 3:42 PM
> > > To: tpm2(a)lists.01.org
> > > Subject: [tpm2] Help combining multiple policy assertions (logical
> > > AND)
> > >
> > > Hello,
> > >
> > > I'm currently attempting to combine multiple policy assertions
> > > together using a logical AND into a single signed policy that can be
> > > used to control access to a TPM2 nvindex.  I currently have a
> > > working simple example with a single policy assertion based on PCR
> > > values, but I'm struggling trying to add an additional policy
> > > assertion (I would like to control access both based on PCR values an=
d a
> second nvindex value).
> > >
> > > My current, single assertion example is shown below, any help you
> > > can provide on how to add a tpm2_policynv assertion would be greatly
> appreciated.
> >
> > For logical AND you just extend the current policy hash by calling
> > tpm2_policynv. So After calling tpm2_policypcr, just call tpm2_policynv=
 with the
> NV index ...
> =

> Hmm, so the policy that is output via the '-L <policy>' argument is the
> combination of all previous policies in the session AND'd together?  That=
's good to
> know, thank you.
> =

> So basically I would need to do this to lock/seal the nvindex:
> =

> # lock the nvindex
> tpm2_startauthsession -S /tmp/session.ctx tpm2_policypcr -S /tmp/session.=
ctx
> ... -L /tmp/A.policy tpm2_policynv -S /tmp/session.ctx ... -L /tmp/B.poli=
cy
> tpm2_policyauthorize -S /tmp/session.ctx ... -L /tmp/C.policy tpm2_nvdefi=
ne -a
> "ownerwrite|ownerread|policyread" \
>   ... -L /tmp/C.policy
> tpm2_flushcontext /tmp/session.ctx
> =

> # use /tmp/C.policy to generate the signature openssl dgst -sha256 --sign
> key.pem \
>   -out policy.signature /tmp/C.policy
> =

> Yes?

I think so. I think you can also drop the -L output until you end up with t=
he policy you want.  A policy is only a single
hash, so every time you invoke a successful policy command, the little regi=
ster in the TPM that keeps the current policy value
gets extended. Then you capture that value with the -L output. Then you can=
 use that when creating the object, so later when
you need to use the object, that hash value has to match and all the steps =
must succeed, like checking PCR state, policy signed,
etc. Because you're always extending the policy hash,  it's a logical AND. =
The first thing when I saw policyOR was that I wanted
policyAND and couldn't find it. Then Imran pointed this out to me. When you=
 think about it, it's just like extending a PCR, you
measure this and this and this ...

> =

> > Is their another question I'm missing here, I usually am missing
> > something obvious people ask :-p
> =

> No that's it, assuming the above works :)
> =

> > Another thing to consider, can you use tss2_ tools? They have a policy
> > language that manages this all for you with a WYSIWIG policy builder:
> > https://tpm2-software.github.io/fapipolicies/
> =

> The policy builder isn't that interesting to me, but expressing a policy =
via JSON
> may be useful, I'll have to take a look.  Thanks.
> =

> --
> paul moore
> www.paul-moore.com

--===============7226881160113310401==--

