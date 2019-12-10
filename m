Content-Type: multipart/mixed; boundary="===============6707487911255723398=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2-pkcs11 update
Date: Tue, 10 Dec 2019 14:29:12 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E585AE@ORSMSX101.amr.corp.intel.com>
In-Reply-To: a4d5b1ac08810e8ac5b9c688eaba3bed822d6c76.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6707487911255723398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2(a)infradead.org]
> Sent: Tuesday, December 10, 2019 1:53 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2 <tpm2(a)list=
s.01.org>
> Subject: Re: [tpm2] Re: tpm2-pkcs11 update
> =

> On Mon, 2019-12-09 at 22:06 +0000, David Woodhouse wrote:
> > The engine generates a transient EC key as its parent by default.
> >
> > But yes, if the token generates a persistent key it can export a PEM
> > key for the engine which identifies that same persistent key as its
> > parent.
> >
> > So it's just a matter of making sure the token can use other parent
> > keys than the one it made for itself, including the auto-generated
> > transient ones?
> =

> And ideally, using the *same* parameters for generating the transient
> ones. Even changing the NODA and similar flags changes the hash and
> thus the resulting key.
> =


I don't see it ever doing that part. I won't store the owner hierarchy in p=
laintext on disk.
In many corporate environments, your IT organization owns the TPM, not the =
person
at the terminal. =


However, I thought I read somewhere that persistent handle at a given locat=
ion is
Supposed to be provisioned under the PC Client spec, but I can't find it in=
 the spec.



--===============6707487911255723398==--

