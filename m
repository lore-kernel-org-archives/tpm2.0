Content-Type: multipart/mixed; boundary="===============7861301402542779756=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] dlopen()'ing raw .so files considered bad
Date: Thu, 31 May 2018 16:18:18 -0700
Message-ID: <20180531231818.GE31407@intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649BD5769@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7861301402542779756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2018 at 09:12:45PM +0000, Roberts, William C wrote:
> =

> =

> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Trevor Woe=
rner
> > Sent: Thursday, May 31, 2018 1:47 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] dlopen()'ing raw .so files considered bad
> > =

> > Hey everyone,
> > =

> > I was playing around with the latest tpm2 tools (i.e. the git master) a=
nd I noticed
> > that this code is now dlopen()'ing the libraries at runtime.
> > =

> > That's a very nice feature, but the way it's been implemented is not en=
tirely
> > correct.
> > =

> > The filename parameter to dlopen() should be a library's SONAME, not th=
e raw
> > .so file. The raw .so file is considered a -dev or -devel package compo=
nent, not a
> > component of the library package itself. The raw .so exists as a develo=
p crutch,
> > but shouldn't be used in production.
> > =

> > The raw .so will always point to the latest shared library object. But =
in an ideal
> > world, the shared library's API should be denoted by the first number a=
fter ".so.".
> > It would be extremely unlikely that the programs linking to today's TSS=
 (with its
> > current API) would continue to work should an API-breaking change occur=
 in the
> > future (thus requiring the first number after ".so." to be incremented).
> =

> Per the spec we work on, we can't break it.
> =

> > =

> > In other words, programs should dlopen() a specific API (e.g. ".so.0") =
and not just
> > "the latest" (i.e. ".so").
> =

> Good to know, well make this change in the tools:
> https://github.com/tpm2-software/tpm2-tools/pull/1052

Have one up for tabrmd as well:
https://github.com/tpm2-software/tpm2-abrmd/pull/471

Philip

> > =

> > Please see https://lists.debian.org/debian-policy/2002/12/msg00041.html=
, for
> > example.
> > =

> > As is, this is going to mess up people packaging this software for vari=
ous distros,
> > and users trying to use this software (since they'll have to install th=
e -dev
> > packages for it to work, which can get messy for non-developer users).
> > =

> > =

> > Thanks and best regards,
> >     Trevor
> =

> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============7861301402542779756==--

