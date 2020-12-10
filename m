Content-Type: multipart/mixed; boundary="===============0554032142188179994=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Proper way to create a owner-write, any-read TPM2 nvindex?
Date: Thu, 10 Dec 2020 15:44:05 +0000
Message-ID: <SN6PR11MB3437A862557B3D73F3124F35B8CB0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: CAHC9VhT+K8_54j+CesemSg+fQq6dNVMnh2Y9UX43-OdkFJBVqQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0554032142188179994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Paul Moore <paul(a)paul-moore.com>
> Sent: Wednesday, December 9, 2020 1:57 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Proper way to create a owner-write, any-read TPM2
> nvindex?
> =

> On Wed, Dec 9, 2020 at 12:53 PM Roberts, William C
> <william.c.roberts(a)intel.com> wrote:
> > > -----Original Message-----
> > > From: Paul Moore <paul(a)paul-moore.com>
> > > Sent: Tuesday, December 8, 2020 11:48 AM
> > > To: tpm2(a)lists.01.org
> > > Subject: [tpm2] Proper way to create a owner-write, any-read TPM2
> nvindex?
> > >
> > > Hello all,
> > >
> > > I'm trying to define a TPM2 nvindex that is only writable when
> > > authenticated with the owner password, but is readable by anyone,
> regardless of authentication.
> > > Through a combination of looking at the docs and some
> > > trial-and-error I've arrived at the following:
> > >
> > > % tpm2_nvdefine -a "ownerwrite|ownerread|authread" -P $PASSWD
> > > $NVINDEX
> > >
> > > ... which leaves me with two questions:
> > >
> > > * Is this the recommended way to define an owner-write, any-read
> > > TPM2 nvindex?
> >
> > I don't know if it's the "recommended way", but it LGTM.
> =

>  :)
> =

> Thanks.
> =

> > > * Why do I need to specify "authread", and is this correct?  Quickly
> > > skimming the
> > > TPM2 specs, I'm still a bit puzzled by the meaning of
> > > "authread"/TPMA_NV_AUTHREAD.
> > >
> > > Any comments, advice, etc. would be appreciated - thanks!
> >
> > So you can authenticate to a NV index in a multitude of ways:
> > 1. hiearchy auth ie TPMA_NV_OWNER.* bits 2. Policy ie TPMA_NV_POLICY.*
> > bits 3. AuthValue ie password in command header/HMAC session
> =

> I guess my source of confusion is that with "ownerwrite|ownerread|authrea=
d",
> why am I able to read it without any credentials?  For example, using the=
 nvindex
> definition above I can read it without any creds using the command below:
> =

> % tpm2_nvread $NVINDEX

Because the auth value in the land of TPM is the empty auth. If you don't
Specify attributes and use either a policy (-L) or a password (-p) in tpm2_=
nvdefine,
The tool picks attributes that make sense. Ie if you set policy without a p=
assword, you likely
don't want authread|authwrite, because then that would allow policy, or
the emptyauth read and write access to the nv index.

When you start specifying attributes, we use those as is. So if you specify=
 authread,
then you get default empty auth unless you change it, so anyone can read it=
. If you
want that password protected, specify -p mypassword.

> =

> --
> paul moore
> www.paul-moore.com

--===============0554032142188179994==--

