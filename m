Content-Type: multipart/mixed; boundary="===============7237784780701426351=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2-pkcs11 update
Date: Mon, 09 Dec 2019 22:01:36 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E58308@ORSMSX101.amr.corp.intel.com>
In-Reply-To: F05FE6C4-748A-4364-9B04-B719CE506781@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7237784780701426351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2(a)infradead.org]
> Sent: Monday, December 9, 2019 2:42 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2 <tpm2(a)list=
s.01.org>
> Subject: RE: [tpm2] tpm2-pkcs11 update
> =

> =

> =

> On 9 December 2019 19:34:41 GMT, "Roberts, William C"
> <william.c.roberts(a)intel.com> wrote:
> >> -----Original Message-----
> >> From: David Woodhouse [mailto:dwmw2(a)infradead.org]
> >> Sent: Monday, December 9, 2019 10:12 AM
> >> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2
> ><tpm2(a)lists.01.org>
> >> Subject: Re: [tpm2] tpm2-pkcs11 update
> >>
> >> On Mon, 2019-12-09 at 15:56 +0000, Roberts, William C wrote:
> >> > All,
> >> >
> >> > I just wanted to update everyone on the status of tpm2-pkcs11
> >> > project. I just did a major push to refactor some of the internals
> >to
> >> > make DB schema changes less likely
> >> > and make the internal handling of attributes far less clunky. This
> >> > week I am going to focus on documentation, testing and bugs and am
> >> > planning the release candidate for next week.
> >>
> >> Can it import/export the keys in a form that is interchangeable with
> >> the ENGINE now? That would be really useful.
> >
> >Not yet, but it should be possible.
> =

> As long as your parent key generation is compatible with the standard use=
d by
> the engines, yes. If not, it can't work.

That's why I said it's possible. Our parent key is completely configurable =
at token
Initialization time and can be an existing persistent key as defined in the=
 PC Client
Guide which is what the engine is hardcoded to.

> --
> Sent from my Android device with K-9 Mail. Please excuse my brevity.

--===============7237784780701426351==--

