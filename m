Content-Type: multipart/mixed; boundary="===============3923582246696621719=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] dlopen()'ing raw .so files considered bad
Date: Thu, 31 May 2018 21:12:45 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649BD5769@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAHUNapS5qnzisT4Li6=fS26w0=ydtBX48_16+6aRL20ASE95zQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3923582246696621719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Trevor Woern=
er
> Sent: Thursday, May 31, 2018 1:47 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] dlopen()'ing raw .so files considered bad
> =

> Hey everyone,
> =

> I was playing around with the latest tpm2 tools (i.e. the git master) and=
 I noticed
> that this code is now dlopen()'ing the libraries at runtime.
> =

> That's a very nice feature, but the way it's been implemented is not enti=
rely
> correct.
> =

> The filename parameter to dlopen() should be a library's SONAME, not the =
raw
> .so file. The raw .so file is considered a -dev or -devel package compone=
nt, not a
> component of the library package itself. The raw .so exists as a develop =
crutch,
> but shouldn't be used in production.
> =

> The raw .so will always point to the latest shared library object. But in=
 an ideal
> world, the shared library's API should be denoted by the first number aft=
er ".so.".
> It would be extremely unlikely that the programs linking to today's TSS (=
with its
> current API) would continue to work should an API-breaking change occur i=
n the
> future (thus requiring the first number after ".so." to be incremented).

Per the spec we work on, we can't break it.

> =

> In other words, programs should dlopen() a specific API (e.g. ".so.0") an=
d not just
> "the latest" (i.e. ".so").

Good to know, well make this change in the tools:
https://github.com/tpm2-software/tpm2-tools/pull/1052

> =

> Please see https://lists.debian.org/debian-policy/2002/12/msg00041.html, =
for
> example.
> =

> As is, this is going to mess up people packaging this software for variou=
s distros,
> and users trying to use this software (since they'll have to install the =
-dev
> packages for it to work, which can get messy for non-developer users).
> =

> =

> Thanks and best regards,
>     Trevor


--===============3923582246696621719==--

