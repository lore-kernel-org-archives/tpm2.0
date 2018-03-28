Content-Type: multipart/mixed; boundary="===============2782092370272316895=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] Problem with Infineon Iridium SLB 9670 TPM2.0
Date: Wed, 28 Mar 2018 10:40:16 -0700
Message-ID: <20180328174016.GA25666@intel.com>
In-Reply-To: CAHUNapQacFucznccuXp5SeKm566wwXCGz91ckvJ-JcupuNqM1A@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2782092370272316895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey Trevor,

On Wed, Mar 28, 2018 at 11:51:26AM -0400, Trevor Woerner wrote:
> Wow, what a great time to come across this thread!
> =

> I also have been trying to use TPM on a RPi3 and was seeing the exact same
> problems. I, however, was using OE and meta-measured to build my images. =
It
> turns out that meta-measured/recipes-tpm/tpm2-tools wasn't DEPENDing on
> tpm2-abrmd, so all builds as a result were not enabling the tabrmd TCTI.
> =

> Hence: https://github.com/flihp/meta-measured/pull/68
> =

> By the way, what's the difference between "abrmd" and "tabrmd"?

There isn't one really. The daemon was named 'tpm2-abrmd' instead of
'tabrmd' based on some early user feedback. Having the 'tpm2' in the
name of the daemon made its purpose more clear according to this user.
'tabrmd' is the same name just with the 'tpm2' collapsed into the rest
of the acronym.

I can see where having an additional variation would cause confusion.

> It seems
> rather confusing that the tools list "tabrmd" as a TCTI, but in order to
> use it one specifies "abrmd". Something feels wrong.

Being consistent is important especially w/r/t documentation. Seems like
a worthy bug for the tools issue tracker.

Also thanks for giving meta-measured some love. I've been neglecting it
a bit on account of work on the impending 2.0 release of the core TSS2
libraries. Once we ship the next major release of all components my plan
is to work on upstreaming the recipes to whatever OE layer is
appropriate to get them properly supported.

Philip

> # tpm2_pcrlist -v
> tool=3D"tpm2_pcrlist" version=3D"" tctis=3D"tabrmd,socket,device,"
> =

> # tpm2_pcrlist -T tabrmd
> ERROR: Unknown tcti, got: "tabrmd"
> =

> # tpm2_pcrlist -T abrmd
> sha1 :
>   0  : 0000000000000000000000000000000000000000
>   1  : 0000000000000000000000000000000000000000
> ...

> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2


--===============2782092370272316895==--

