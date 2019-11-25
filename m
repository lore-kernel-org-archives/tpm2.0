Content-Type: multipart/mixed; boundary="===============6274653303075495302=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Is there a way to get the name for an NV index in
 tpm2_tools?
Date: Mon, 25 Nov 2019 23:52:56 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E47F5A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E47F20@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6274653303075495302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch should do what you want:

https://github.com/williamcroberts/tpm2.0-tools/commit/d69fcfb0c05141fac166=
8f4b2a9665041ab13e73

Ill get this cleaned up and merged to tools

> -----Original Message-----
> From: Roberts, William C [mailto:william.c.roberts(a)intel.com]
> Sent: Monday, November 25, 2019 5:02 PM
> To: Steven Clark <davolfman(a)gmail.com>
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Is there a way to get the name for an NV index in
> tpm2_tools?
> =

> =

> =

> > -----Original Message-----
> > From: Steven Clark [mailto:davolfman(a)gmail.com]
> > Sent: Monday, November 25, 2019 10:56 AM
> > To: Roberts, William C <william.c.roberts(a)intel.com>
> > Cc: tpm2(a)lists.01.org
> > Subject: Re: [tpm2] Is there a way to get the name for an NV index in
> > tpm2_tools?
> >
> > 4.0.0 and 4.1.0rc1 when I've chosen to install it for testing.  So no
> > -c option in
> =

> That went away in 4.0 and is now just an argument to tpm2_getcap. So just
> remove -c and it should work.
> =

> > getcap anymore.  Besides, I'm looking for the name of an NV index not
> > a key or sealed "keyed hash", so there's no context blob.
> =

> Ahh ok, nv index. Currently not output, but that=E2=80=99s an easy fix.
> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6274653303075495302==--

