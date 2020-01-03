Content-Type: multipart/mixed; boundary="===============0470645013369763261=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Dropping Openssl < 1.1 support
Date: Fri, 03 Jan 2020 14:58:04 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E6343C@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0163C421FC@EXCH2010B.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0470645013369763261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Fuchs, Andreas [mailto:andreas.fuchs(a)sit.fraunhofer.de]
> Sent: Friday, January 3, 2020 3:38 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: RE: Dropping Openssl < 1.1 support
> =

> Also, Debian Jessie comes with OpenSSL 1.0.x until 2020-06 and Ubuntu 16.=
04
> until 2021-06.
> End of Life for Ubuntu 16.04 is 2024, but I think End of Support would be=
 early
> eanough.

2024 is for paying customers and is security fixes only. I wonder if they a=
re going to maintain OSSL 1.0.2
Patches on top of the last release to support this, or If they have a 1.1 u=
pgrade plan.

> =

> As much as I like kicking OSSL < 1.1, IMHO Ubuntu 16.04 is the big obstac=
le, since
> it's used Quite a lot.

This is what my concern was, was older, slower to update, LTS distros. =


> =

> my 2 cents,
> Andreas
> =

> ________________________________________
> From: Roberts, William C [william.c.roberts(a)intel.com]
> Sent: Thursday, January 02, 2020 18:39
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Dropping Openssl < 1.1 support
> =

> Now that the new year is upon us, we should consider dropping OSSL < 1.1
> support since it's no longer supported. I'm proposing on everyone's mainl=
ine, we
> drop That support and the next major feature bump release contains this c=
hange.
> Any objections?
> =

> Bill
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============0470645013369763261==--

