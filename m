Content-Type: multipart/mixed; boundary="===============0305913912413760134=="
MIME-Version: 1.0
From: Paul Moore <paul at paul-moore.com>
Subject: [tpm2] Re: Help combining multiple policy assertions (logical AND)
Date: Fri, 04 Dec 2020 12:11:26 -0500
Message-ID: <CAHC9VhRjbbqsVzQ6Kx3jjaxvVeA=To6p599qcx53J_Q41bS4KQ@mail.gmail.com>
In-Reply-To: SN6PR11MB3437FB37A028568C0553C4A7B8F10@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0305913912413760134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 4, 2020 at 10:06 AM Roberts, William C
<william.c.roberts(a)intel.com> wrote:
> > -----Original Message-----
> > From: Paul Moore <paul(a)paul-moore.com>
> > Sent: Thursday, December 3, 2020 3:42 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] Help combining multiple policy assertions (logical AND)
> >
> > Hello,
> >
> > I'm currently attempting to combine multiple policy assertions together=
 using a
> > logical AND into a single signed policy that can be used to control acc=
ess to a TPM2
> > nvindex.  I currently have a working simple example with a single polic=
y assertion
> > based on PCR values, but I'm struggling trying to add an additional pol=
icy assertion
> > (I would like to control access both based on PCR values and a second n=
vindex
> > value).
> >
> > My current, single assertion example is shown below, any help you can p=
rovide
> > on how to add a tpm2_policynv assertion would be greatly appreciated.
>
> For logical AND you just extend the current policy hash by calling tpm2_p=
olicynv. So
> After calling tpm2_policypcr, just call tpm2_policynv with the NV index .=
..

Hmm, so the policy that is output via the '-L <policy>' argument is
the combination of all previous policies in the session AND'd
together?  That's good to know, thank you.

So basically I would need to do this to lock/seal the nvindex:

# lock the nvindex
tpm2_startauthsession -S /tmp/session.ctx
tpm2_policypcr -S /tmp/session.ctx ... -L /tmp/A.policy
tpm2_policynv -S /tmp/session.ctx ... -L /tmp/B.policy
tpm2_policyauthorize -S /tmp/session.ctx ... -L /tmp/C.policy
tpm2_nvdefine -a "ownerwrite|ownerread|policyread" \
  ... -L /tmp/C.policy
tpm2_flushcontext /tmp/session.ctx

# use /tmp/C.policy to generate the signature
openssl dgst -sha256 --sign key.pem \
  -out policy.signature /tmp/C.policy

Yes?

> Is their another question I'm missing here, I usually am missing somethin=
g obvious
> people ask :-p

No that's it, assuming the above works :)

> Another thing to consider, can you use tss2_ tools? They have a policy la=
nguage that manages
> this all for you with a WYSIWIG policy builder:
> https://tpm2-software.github.io/fapipolicies/

The policy builder isn't that interesting to me, but expressing a
policy via JSON may be useful, I'll have to take a look.  Thanks.

-- =

paul moore
www.paul-moore.com
--===============0305913912413760134==--

