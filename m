Content-Type: multipart/mixed; boundary="===============5007803051753221262=="
MIME-Version: 1.0
From: Rowan Moul <lists at rowan.moul.ca>
Subject: [tpm2] Re: tpm2_createek and transient EK problem
Date: Fri, 28 Feb 2020 07:33:50 -0700
Message-ID: <349B3886-75E6-4CAB-BD52-205A0F3BA51F@rowan.moul.ca>
In-Reply-To: CABatt_xTqcQa0E1VZ2_ARDPPZ8x83zJMo=wfr2gLQpZzVQK2XQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5007803051753221262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Martin,
What version of the tools are you using?

Also, just to clarify terminology, when you say that you =E2=80=9Ctook owne=
rship of the tpm and created an SRK=E2=80=9D what do you mean? That sounds =
a lot like tpm 1.2 which is not compatible with this toolset.

Rowan

> On Feb 28, 2020, at 04:42, Martin Townsend <mtownsend1973(a)gmail.com> wr=
ote:
> =

> =EF=BB=BFHi,
> =

> I'm trying out the tpm2_createek tool and in the manual
> https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_createek=
.1.md
> =

> It explains how to create a transient EK, I following these
> instructions but can't get them to work.  I've taken ownership of the
> TPM and created a SRK.  I then ran the command as listed in the manual
> page:
> =

> tpm2_createek -G rsa -u ek.pub
> ERROR: Expected option -c
> Usage: tpm2_createek [<options>]
> Where <options> are:
>   [ -P | --eh-auth=3D<value>] [ -w | --owner-auth=3D<value>] [ -p |
> --ek-auth=3D<value>] [ -G | --key-algorithm=3D<value>]
>   [ -u | --public=3D<value>] [ -f | --format=3D<value>] [ -c |
> --ek-context=3D<value>] [ -t | --template=3D<value>]
> =

> So I added the -c to save the context to disk and provide the EH authoris=
ation:
> =

> tpm2_createek -G rsa -u ek.pub -c ek.ctx -P xxx
> echo $?
> 0
> =

> so it looks like it's succeeded but I then try the to list the
> transient objects with
> =

> tpm2_getcap handles-transient
> =

> and I get nothing.  The files have been created
> =

> ls -la ek*
> -rw-r--r-- 1 root root 1287 Feb 28  2020 ek.ctx
> -rw-r--r-- 1 root root  316 Feb 28  2020 ek.pub
> =

> Any ideas as to why this is not working for me, do I need to perform
> some other step first?
> =

> Many Thanks,
> Martin.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============5007803051753221262==--

