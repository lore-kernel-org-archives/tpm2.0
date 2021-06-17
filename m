Content-Type: multipart/mixed; boundary="===============5354985131388592326=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Sample applications
Date: Wed, 16 Jun 2021 18:33:52 -0700
Message-ID: <CAOCvsSmrvVmpu3EikH8pjsNudUUGd5-zh=LaF+rxdSWVUDwKyQ@mail.gmail.com>
In-Reply-To: CAFmPt0paEyn1K+a80ex6hmjqNxcLqTe-=86qBhpS4Mw3FKorzA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5354985131388592326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2021 at 3:12 PM @rubynerd <x(a)rubynerd.net> wrote:
>
> Hi all,
>
> I'm looking to build an application which creates a key on a TPM & uses t=
he TPM to decrypt some application initialisation secrets delivered to the =
application via a control-plane, which verifies the key the TPM will use is=
 on a TPM.
>
> I'm struggling to find any sample applications/explanations/cookbooks for=
 tmp2-tools to prototype out how this would work =E2=80=94 in fact, I can't=
 find an explainer of how to convert a key from "tss" format to PEM format.=
 Is there something I've missed, or is there a sample TPM application or so=
mething kicking about I can refer to? I'm aware there are specification PDF=
's, but these are unapproachable to someone with attention-span disabilitie=
s.
>
> Thanks,
> Luke
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

With tpm2-tools it's pretty easy if you've got a remotely up to date
version.  Most of the tools that need to interact with outside keys
natively support the SSL key types.  So you just interact with them on
the command line.

If you want to actually program using the ESAPI and use outside key
formats my recommendation would be get comfortable reading the
structure definitions in the TPM2 specs (sometimes assisted by the
actual header files from the TSS), the ESAPI spec, and the OpenSSL API
man pages and learn to tear a key down into low level structures in
one API to reassemble in the other format.  The math is still the same
after all.
--===============5354985131388592326==--

