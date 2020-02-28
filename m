Content-Type: multipart/mixed; boundary="===============7686071475507598745=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_createek and transient EK problem
Date: Fri, 28 Feb 2020 14:39:38 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E96E09@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 349B3886-75E6-4CAB-BD52-205A0F3BA51F@rowan.moul.ca
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7686071475507598745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Rowan Moul [mailto:lists(a)rowan.moul.ca]
> Sent: Friday, February 28, 2020 8:34 AM
> To: Martin Townsend <mtownsend1973(a)gmail.com>
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: tpm2_createek and transient EK problem
> =

> Hi Martin,
> What version of the tools are you using?
> =

> Also, just to clarify terminology, when you say that you =E2=80=9Ctook ow=
nership of the
> tpm and created an SRK=E2=80=9D what do you mean? That sounds a lot like =
tpm 1.2 which
> is not compatible with this toolset.

You can still do the same with TPM 2.0, the steps are just slightly differe=
nt and the SRK
could be of a different key type.

> =

> Rowan
> =

> > On Feb 28, 2020, at 04:42, Martin Townsend <mtownsend1973(a)gmail.com>
> wrote:
> >
> > =EF=BB=BFHi,
> >
> > I'm trying out the tpm2_createek tool and in the manual
> > https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_creat
> > eek.1.md
> >
> > It explains how to create a transient EK, I following these
> > instructions but can't get them to work.  I've taken ownership of the
> > TPM and created a SRK.  I then ran the command as listed in the manual
> > page:
> >
> > tpm2_createek -G rsa -u ek.pub
> > ERROR: Expected option -c
> > Usage: tpm2_createek [<options>]
> > Where <options> are:
> >   [ -P | --eh-auth=3D<value>] [ -w | --owner-auth=3D<value>] [ -p |
> > --ek-auth=3D<value>] [ -G | --key-algorithm=3D<value>]
> >   [ -u | --public=3D<value>] [ -f | --format=3D<value>] [ -c |
> > --ek-context=3D<value>] [ -t | --template=3D<value>]
> >
> > So I added the -c to save the context to disk and provide the EH author=
isation:
> >
> > tpm2_createek -G rsa -u ek.pub -c ek.ctx -P xxx echo $?
> > 0
> >
> > so it looks like it's succeeded but I then try the to list the
> > transient objects with
> >
> > tpm2_getcap handles-transient
> >
> > and I get nothing.  The files have been created
> >
> > ls -la ek*
> > -rw-r--r-- 1 root root 1287 Feb 28  2020 ek.ctx
> > -rw-r--r-- 1 root root  316 Feb 28  2020 ek.pub
> >
> > Any ideas as to why this is not working for me, do I need to perform
> > some other step first?
> >
> > Many Thanks,
> > Martin.
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email to
> > tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============7686071475507598745==--

