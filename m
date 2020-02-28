Content-Type: multipart/mixed; boundary="===============6177821122292917096=="
MIME-Version: 1.0
From: Martin Townsend <mtownsend1973 at gmail.com>
Subject: [tpm2] Re: tpm2_createek and transient EK problem
Date: Fri, 28 Feb 2020 15:52:55 +0000
Message-ID: <CABatt_yj+nS7DjspoFW4fQhu74=5M=OmFH=ppKvEoarhhnZaFQ@mail.gmail.com>
In-Reply-To: AD8F57F2-9753-4809-BCD7-533461F2891A@rowan.moul.ca
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6177821122292917096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 3:46 PM Rowan Moul <lists(a)rowan.moul.ca> wrote:
>
> I think William=E2=80=99s response about the resource manager flushing tr=
ansient handles is more in-line with the behaviour you are seeing so his su=
ggestions there should help solve this specific issue.
>
> But I will point out that tpm2_takeownership was removed in tpm2-tools 4.=
0.0. In that same version, tpm2_createek was added so if you have both thos=
e tools available at the same time I think you might have multiple versions=
 installed and that could cause you issues going forward.
> And yes you are correct the Owner Hierarchy is the same as the Storage Hi=
erarchy. The first term is more correct, while the second (I think) is used=
 to draw comparison with tpm 1.2, for those familiar, which only had one hi=
erarchy.
>
> Rowan
>
> >>> On Feb 28, 2020, at 08:26, Martin Townsend <mtownsend1973(a)gmail.com=
> wrote:
> >> =EF=BB=BFOn Fri, Feb 28, 2020 at 2:39 PM Roberts, William C
> >> <william.c.roberts(a)intel.com> wrote:
> >>> -----Original Message-----
> >>> From: Rowan Moul [mailto:lists(a)rowan.moul.ca]
> >>> Sent: Friday, February 28, 2020 8:34 AM
> >>> To: Martin Townsend <mtownsend1973(a)gmail.com>
> >>> Cc: tpm2(a)lists.01.org
> >>> Subject: [tpm2] Re: tpm2_createek and transient EK problem
> >>> Hi Martin,
> >>> What version of the tools are you using?
> >>> Also, just to clarify terminology, when you say that you =E2=80=9Ctoo=
k ownership of the
> >>> tpm and created an SRK=E2=80=9D what do you mean? That sounds a lot l=
ike tpm 1.2 which
> >>> is not compatible with this toolset.
> >> You can still do the same with TPM 2.0, the steps are just slightly di=
fferent and the SRK
> >> could be of a different key type.
> >>> Rowan
> >>>> On Feb 28, 2020, at 04:42, Martin Townsend <mtownsend1973(a)gmail.co=
m>
> >>> wrote:
> >>>> =EF=BB=BFHi,
> >>>> I'm trying out the tpm2_createek tool and in the manual
> >>>> https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_cre=
at
> >>>> eek.1.md
> >>>> It explains how to create a transient EK, I following these
> >>>> instructions but can't get them to work.  I've taken ownership of the
> >>>> TPM and created a SRK.  I then ran the command as listed in the manu=
al
> >>>> page:
> >>>> tpm2_createek -G rsa -u ek.pub
> >>>> ERROR: Expected option -c
> >>>> Usage: tpm2_createek [<options>]
> >>>> Where <options> are:
> >>>> [ -P | --eh-auth=3D<value>] [ -w | --owner-auth=3D<value>] [ -p |
> >>>> --ek-auth=3D<value>] [ -G | --key-algorithm=3D<value>]
> >>>> [ -u | --public=3D<value>] [ -f | --format=3D<value>] [ -c |
> >>>> --ek-context=3D<value>] [ -t | --template=3D<value>]
> >>>> So I added the -c to save the context to disk and provide the EH aut=
horisation:
> >>>> tpm2_createek -G rsa -u ek.pub -c ek.ctx -P xxx echo $?
> >>>> 0
> >>>> so it looks like it's succeeded but I then try the to list the
> >>>> transient objects with
> >>>> tpm2_getcap handles-transient
> >>>> and I get nothing.  The files have been created
> >>>> ls -la ek*
> >>>> -rw-r--r-- 1 root root 1287 Feb 28  2020 ek.ctx
> >>>> -rw-r--r-- 1 root root  316 Feb 28  2020 ek.pub
> >>>> Any ideas as to why this is not working for me, do I need to perform
> >>>> some other step first?
> >>>> Many Thanks,
> >>>> Martin.
> >>>> _______________________________________________
> >>>> tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an emai=
l to
> >>>> tpm2-leave(a)lists.01.org
> >>>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >>> _______________________________________________
> >>> tpm2 mailing list -- tpm2(a)lists.01.org
> >>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> >>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >
> > Thanks for the replies.
> >
> > I'm using the latest releases I think
> > tpm2-tools =3D 4.1.1
> > tpm2-tss =3D 2.3.2
> > tpm2-abrmd =3D 2.3.0
> >
> > I've not used 1.2 so apologies for any confusion with terminology. By
> > taking ownership I mean running tpm2_takeownership and by creating SRK
> > I mean creating a primary key for the Storage Hierarchy with
> > tpm2_createprimary -C owner ... I get confused with the naming for
> > this hierarchy as sometimes I see if referred to as Storage Hierarchy
> > and other times Owner Hierarchy, I take it they are the same thing.
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

Ah, I was using 4.0.0 and have just moved over to 4.1.1 to see if the
transients EK would work with this version.  You are right the
tpm2_takeownership is no longer there.  Looks like it's been renamed
to tpm2_changeauth, I shall port my script over to using this.

Thanks for clarifying about Storage/Owner, I'll try and stick to Owner
from now on :)
--===============6177821122292917096==--

