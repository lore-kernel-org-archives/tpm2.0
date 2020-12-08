Content-Type: multipart/mixed; boundary="===============1224759159099341911=="
MIME-Version: 1.0
From: Paul Moore <paul at paul-moore.com>
Subject: [tpm2] Re: Help combining multiple policy assertions (logical AND)
Date: Tue, 08 Dec 2020 12:38:53 -0500
Message-ID: <CAHC9VhSePGMw0aKkY7gd+76_GyzbE4C+F9w5UgbHSEypAmau3g@mail.gmail.com>
In-Reply-To: SN6PR11MB3437B6EDA271340CF041BA07B8CE0@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1224759159099341911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 7, 2020 at 10:04 AM Roberts, William C
<william.c.roberts(a)intel.com> wrote:
> > -----Original Message-----
> > From: Paul Moore <paul(a)paul-moore.com>
> > Sent: Friday, December 4, 2020 11:11 AM

...

> > So basically I would need to do this to lock/seal the nvindex:
> >
> > # lock the nvindex
> > tpm2_startauthsession -S /tmp/session.ctx
> > tpm2_policypcr -S /tmp/session.ctx ... -L /tmp/A.policy
> > tpm2_policynv -S /tmp/session.ctx ... -L /tmp/B.policy
> > tpm2_policyauthorize -S /tmp/session.ctx ... -L /tmp/C.policy
> > tpm2_nvdefine -a "ownerwrite|ownerread|policyread" \
> >   ... -L /tmp/C.policy
> > tpm2_flushcontext /tmp/session.ctx
> >
> > # use /tmp/C.policy to generate the signature
> > openssl dgst -sha256 --sign key.pem \
> >   -out policy.signature /tmp/C.policy
> >
> > Yes?
>
> I think so. I think you can also drop the -L output until you end up with=
 the policy you want.

A quick update for the list archives and anyone following this thread
- the above example is close, but not correct.  The problem lies in
the policy that is signed using openssl.  The example above signs the
output from tpm2_policyauthorize (/tmp/C.policy) when it should sign
the output from tpm2_policynv (/tmp/B.policy); it looks like you need
to sign the last policy in the chain *before* you call
tpm2_policyauthorize.  To be honest, this makes sense, but it seems
like an easy mistake to make and I'm guessing I'm not the first (or
the last) to screw this up :)

> > > Another thing to consider, can you use tss2_ tools? They have a policy
> > > language that manages this all for you with a WYSIWIG policy builder:
> > > https://tpm2-software.github.io/fapipolicies/

Are there any docs, examples, blog posts, etc. talking about the FAPI
JSON policies?  I see a variety of manpages (which are pretty sparse
if I'm honest) and the web-based policy editor you mentioned, but
other than that there doesn't seem to be much in the way of docs.

Help?

-- =

paul moore
www.paul-moore.com
--===============1224759159099341911==--

