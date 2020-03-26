Content-Type: multipart/mixed; boundary="===============3881895462834736781=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Failed to initialize tcti context: 0x1
Date: Thu, 26 Mar 2020 16:43:30 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EB25BB@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAE8e83QOwLDB51Kpejdjfi25gcHQSSSbPgHHg==8T-6L5g3CRQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3881895462834736781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Did you get this sorted out? Also which TCTI is giving this error?
What was the output of tpm2_<tool> -v

Something like:
$ tpm2_getrandom -v
tool=3D"tpm2_getrandom" version=3D"4.2-RC0" tctis=3D"libtss2-tctildr" tcti-=
default=3Dtcti-abrmd

Thanks,
Bill

> -----Original Message-----
> From: Ashok Kumar [mailto:ashokar.1980(a)gmail.com]
> Sent: Thursday, March 26, 2020 5:05 AM
> To: Samuel Mutel <samuel.mutel(a)gmail.com>
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Failed to initialize tcti context: 0x1
> =

> Hello,
> =

> Are you having resourcemgr daemon? If so, that may be listening on port 2=
323.
> You may try with option "-p 2323".
> =

> Regards,
> Ashok Kumar
> =

> =

> On Fri, Mar 13, 2020 at 3:41 PM Samuel Mutel <samuel.mutel(a)gmail.com
> <mailto:samuel.mutel(a)gmail.com> > wrote:
> =

> =

> 	Hello,
> =

> 	When I start the command sudo tpm2_listpcrs, I receive the message
> Failed to initialize tcti context: 0x1.
> =

> 	How to resolve this?
> =

> 	Thanks.
> =

> 	_______________________________________________
> 	tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	To unsubscribe send an email to tpm2-leave(a)lists.01.org <mailto:tpm2-
> leave(a)lists.01.org>
> 	%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s


--===============3881895462834736781==--

