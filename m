Content-Type: multipart/mixed; boundary="===============2128758480472109174=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Thu, 16 Apr 2020 17:34:40 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649ED20FC@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAP3jAwQPtNTHmaTE1NSgP+Nw5zhki0a_kF-jMiAB2_sNap-Tvw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2128758480472109174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
> Sent: Wednesday, April 15, 2020 1:06 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: Desai, Imran <imran.desai(a)intel.com>; tpm2(a)lists.01.org
> Subject: Re: [tpm2] Re: ESys_ActivateCredential
> =

> Thanks Bill. I am taking help from the poky team on this.
> Getting back to the Activate Credential issue, since my code worked fine =
as a
> single application as well as being run inside another process but as a s=
ingle
> thread (including makeCredential and activateCred).
> My guess for failing is:
> 1. When server sends secret/credBlob, they dont match ---> But i ran gdb =
and
> checked all bytes and they match, so thats not an issue, server is runnin=
g same
> OpenSSL as client, so no mismatch in version for single-threaded vs multi-
> threaded 2. Probably AK key or EK key is not loaded or changed
> --> to prove this, i would need to use Esys_ReadPublic , if it fails,
> --> implies its not loaded, if it succeeds, I need to verify ek_pub and
> --> ak_name is same when we created it
> Assuming I have the ESYS_CONTEXT saved as well as the ESYS_TR handle for =
both
> AK and EK saved,  Esys_ReadPublic should still work right, as it only nee=
ds these
> 2?

What do you mean ESYS_CONTEXT saved? I may be misunderstanding you here,
But you can't save those, it's a pointer so it has the same lifecycle as th=
e process.
Also, AFIAK, they are not thread safe. Each thread needs its own ESYS_CONTE=
XT
from Esys_Initialize().

For Esys_ReadPublic(), you need an ESYS_CONTEXT and an ESYS_TR. Like ESYS_C=
ONTEXT
Pointers that cannot be shared, ESYS_TR's are handle's that eventually get =
turned into a
pointer under the hood, so you can't share those either. You can serialize =
and reserialize to
pass from thread A to B. =


If you want to use the same ESYS_CONTEXT and ESYS_TR from thread A and B, y=
ou need
to lock ALL ESYS CALLS. But if you're going to do that, does multi-threadin=
g really get
you any benefit.

> =

> Any other reason for failing?
> Thanks,
> Rahul
> =

> On Wed, Apr 15, 2020 at 8:25 AM Roberts, William C <william.c.roberts(a)i=
ntel.com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> 	> -----Original Message-----
> 	> From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> ]
> 	> Sent: Monday, April 13, 2020 6:55 PM
> 	> To: Roberts, William C <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	> Cc: Desai, Imran <imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com> >; tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 	> Subject: Re: [tpm2] Re: ESys_ActivateCredential
> 	>
> 	> What is the latest stable release for tpm2_tss ?
> =

> 	Really? Github has a releases tab, use it.
> 	https://github.com/tpm2-software/tpm2-tss/releases
> =

> =

> 	>
> 	> Thanks,
> 	> Rahul
> 	>
> 	> On Mon, Apr 13, 2020 at 4:38 PM Rahul Hardikar
> <rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> > wrote:
> 	>
> 	>
> 	>       Looks like the version I have is old, the file tss2_tctildr.h do=
es not
> exist
> 	>
> 	>
> 	>       On Mon, Apr 13, 2020 at 12:31 PM Rahul Hardikar
> 	> <rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> > > =
wrote:
> 	>
> 	>
> 	>               Ok, got it. I'm using ESAPI C APIs. But its pretty much =
the same as
> 	> the tpm2 tools implementation.
> 	>               How do i add debugs in my poky directory?  I have tpm2.0-
> 	> tss_2.1.4.bb <http://tss_2.1.4.bb>  <http://tpm2.0-tss_2.1.4.bb>  file.
> 	>               Also, how to add compile-time log flags to my src file t=
hat uses
> 	> ESAPI calls? Running separately was easy, I just called
> 	> TSS2_LOG=3D"all+ERROR,tcti+DEBUG"
> 	>
> 	>               On Mon, Apr 13, 2020 at 7:20 AM Roberts, William C
> 	> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> <mailto:william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.c=
om> > >
> wrote:
> 	>
> 	>
> 	>                       > -----Original Message-----
> 	>                       > From: Rahul Hardikar [mailto:rahulhardikar(a)g=
mail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> ]
> 	>                       > Sent: Friday, April 10, 2020 4:15 PM
> 	>                       > To: Roberts, William C <william.c.roberts(a)in=
tel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>                       > Cc: Desai, Imran <imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >;
> tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>                       > Subject: Re: [tpm2] Re: ESys_ActivateCredential
> 	>                       >
> 	>                       > Hi Bill,
> 	>                       > I have this on my system: Is tpmrm0 same as ta=
brmd? I
> 	> believe mine is using this
> 	>                       > right now , i'm changing it to what you mentio=
ned  to
> 	> see if it helps.
> 	>                       > [root(a)nfvis ~]# ls -l /dev/tpm*
> 	>                       > crw-rw----. 1 tss root  10,   224 Apr  8 23:19=
 /dev/tpm0
> 	>                       > crw-rw----. 1 tss tss  254, 65536 Apr  8 23:19
> 	> /dev/tpmrm0 Thanks, Rahul
> 	>
> 	>                       In theory, yes. In practice no.
> 	>                       /dev/tpmrm0 is the in kernel resource manager
> 	>                       tpm2-abrmd is the userspace resource manager
> 	>
> 	>                       tpm2-abrmd has a few features tpmrm0 doesn't hav=
e,
> 	> but unless you're
> 	>                       using policy sessions with tpm2-tools, you shoul=
dn't
> 	> notice a difference.
> 	>
> 	>                       >
> 	>                       > On Fri, Apr 10, 2020 at 11:33 AM Roberts, Will=
iam C
> 	> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> <mailto:william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.c=
om> >
> 	>                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > > wrote:
> 	>                       >
> 	>                       >
> 	>                       >
> 	>                       >
> 	>                       >       > -----Original Message-----
> 	>                       >       > From: Rahul Hardikar
> 	> [mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> > ]
> 	>                       >       > Sent: Friday, April 10, 2020 1:08 PM
> 	>                       >       > To: Roberts, William C
> 	> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> <mailto:william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.c=
om> >
> 	>                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > >
> 	>                       >       > Cc: Desai, Imran <imran.desai(a)intel.=
com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >;
> tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>                       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lis=
ts.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> >
> 	>                       >       > Subject: Re: [tpm2] Re: ESys_ActivateC=
redential
> 	>                       >       >
> 	>                       >       > Thanks Bill, trying that.
> 	>                       >       >  I did not get debug build tpm2_tss, i=
sn't it all
> 	> prebuilt ? I will have to see
> 	>                       > how to
> 	>                       >       > do it in poky.
> 	>                       >
> 	>                       >       If you're getting it from a package mana=
ger, yes. But
> 	> there's nothing
> 	>                       > stopping you
> 	>                       >       from using source builds. Some distro's =
will package
> 	> debug symbols for
> 	>                       > their
> 	>                       >       packages.
> 	>                       >
> 	>                       >       >
> 	>                       >       > On Fri, Apr 10, 2020 at 8:16 AM Robert=
s, William C
> 	>                       > <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >  <mailto:william.c.roberts(a)int=
el.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>                       >       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > > > wrote:
> 	>                       >       >
> 	>                       >       >
> 	>                       >       >
> 	>                       >       >
> 	>                       >       >       > -----Original Message-----
> 	>                       >       >       > From: Rahul Hardikar
> 	> [mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> >
> 	>                       >       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> > >
> 	>                       > ]
> 	>                       >       >       > Sent: Thursday, April 9, 2020 =
2:51 PM
> 	>                       >       >       > To: Roberts, William C
> 	> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> <mailto:william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.c=
om> >
> 	>                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>                       >       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > > >
> 	>                       >       >       > Cc: Desai, Imran <imran.desai(=
a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>                       >       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> >;
> 	>                       > tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.or=
g>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>                       >       > <mailto:tpm2(a)lists.01.org <mailto:tp=
m2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> 	>                       >       >       > Subject: Re: [tpm2] Re:
> 	> ESys_ActivateCredential
> 	>                       >       >       >
> 	>                       >       >       > Thanks Bill. I use this
> 	>                       >       >       > Esys_Initialize( &ectx, NULL, =
NULL);
> 	>                       >       >       >
> 	>                       >       >       > so i'm assuming it would take =
the default
> 	> libtss2-tcti-tabrmd.so.0.
> 	>                       >       >
> 	>                       >       >       This should do it for you:
> 	>                       >       >       TSS2_RC
> 	>                       >       >       Tss2_TctiLdr_Initialize (const c=
har *nameConf,
> 	>                       >       >                                TSS2_TC=
TI_CONTEXT **context);
> 	>                       >       >
> 	>                       >       >       Set nameConf to the string "tabr=
md", that
> 	> should give you a tcti
> 	>                       > pointer
> 	>                       >       > you can
> 	>                       >       >       pass wot Esys_Initialize()
> 	>                       >       >
> 	>                       >       >       >
> 	>                       >       >       >
> 	>                       >       >       > If I need to debug Esys_Activa=
teCredential
> 	> more, how can I do it,
> 	>                       > these
> 	>                       >       > APIs are
> 	>                       >       >       > no more standalone, I have int=
egrated it in a
> 	> bigger code base and
> 	>                       >       > added the
> 	>                       >       >       > esys-tss2 and other libs in my=
 poky build, so
> 	> now it runs as
> 	>                       > different
> 	>                       >       > process that
> 	>                       >       >       > invokes this function, I can g=
db into the
> 	> process but I can't seem to
> 	>                       > gdb
> 	>                       >       > into
> 	>                       >       >       > Esys_Activate..( )
> 	>                       >       >
> 	>                       >       >       Did you build tpm2-tss with debu=
g symbols?
> 	>                       >       >       Add --enable-debug
> 	>                       >       >
> 	>                       >       >       >
> 	>                       >       >       >
> 	>                       >       >       > Thanks,
> 	>                       >       >       > Rahul
> 	>                       >       >       >
> 	>                       >       >       >
> 	>                       >       >       >
> 	>                       >       >       >
> 	>                       >       >       > On Thu, Apr 9, 2020 at 10:23 A=
M Roberts,
> 	> William C
> 	>                       >       > <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >  <mailto:william.c.roberts(a)int=
el.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >  <mailto:william.c.roberts(a)int=
el.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > >
> 	>                       >       >       > <mailto:william.c.roberts(a)in=
tel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>                       >       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > > > > wrote:
> 	>                       >       >       >
> 	>                       >       >       >
> 	>                       >       >       >       > -----Original Message-=
----
> 	>                       >       >       >       > From: Rahul Hardikar
> 	> [mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> >
> 	>                       >       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> > >
> 	>                       >       >       > <mailto:rahulhardikar(a)gmail.=
com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> >  <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> > > >
> 	>                       >       > ]
> 	>                       >       >       >       > Sent: Thursday, April =
9, 2020 11:18 AM
> 	>                       >       >       >       > To: Desai, Imran <imra=
n.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>                       >       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> 	>                       >       >       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >=
 >
> >
> 	>                       >       >       >       > Cc: tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>                       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lis=
ts.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> 	>                       >       > <mailto:tpm2(a)lists.01.org <mailto:tp=
m2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>                       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lis=
ts.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > > >
> 	>                       >       >       >       > Subject: [tpm2] Re:
> 	> ESys_ActivateCredential
> 	>                       >       >       >       >
> 	>                       >       >       >       > How do I know if  RM i=
s being used?
> 	>                       >       >       >
> 	>                       >       >       >
> 	>                       >       >       >       If you set the tcti to t=
he device tcti, it will
> 	> open /dev/tpm0 by
> 	>                       >       > default. And
> 	>                       >       >       > that wont
> 	>                       >       >       >       Be an RM. You can also g=
ive it an option.
> 	> Esys_Initialize() takes a
> 	>                       > tcti
> 	>                       >       > as an
> 	>                       >       >       > option,
> 	>                       >       >       >       NULL will cause it to us=
e the default search
> 	> behavior of the
> 	>                       >       > Tss2_TctiLdr,
> 	>                       >       >       > see:
> 	>                       >       >       >
> 	>                       >       >       >       https://github.com/tpm2-=
software/tpm2-
> 	>                       >       >       >
> 	> tss/blob/master/man/Tss2_TctiLdr_Initialize.3.in
> <http://Tss2_TctiLdr_Initialize.3.in>
> 	> <http://Tss2_TctiLdr_Initialize.3.in>
> 	>                       > <http://Tss2_TctiLdr_Initialize.3.in>
> 	>                       >       > <http://Tss2_TctiLdr_Initialize.3.in>
> 	>                       >       >       >       https://github.com/tpm2-=
software/tpm2-
> 	>                       >       >       >
> 	> tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> <http://Tss2_Tcti_Device_Init.3.in>
> 	> <http://Tss2_Tcti_Device_Init.3.in>
> 	>                       > <http://Tss2_Tcti_Device_Init.3.in>
> 	>                       >       > <http://Tss2_Tcti_Device_Init.3.in>
> 	>                       >       >       >       https://github.com/tpm2-=
software/tpm2-
> 	>                       >       > tss/blob/master/man/tss2-
> 	>                       >       >       > tcti-device.7.in <http://tcti-=
device.7.in>
> <http://tcti-device.7.in>
> 	> <http://tcti-device.7.in>  <http://tcti-device.7.in>
> 	>                       >       >       >
> 	>                       >       >       >       You can use man locally =
if you prefer as
> 	> well:
> 	>                       >       >       >       man 3 Tss2_TctiLdr_Initi=
alize
> 	>                       >       >       >       man 7 tss2-tcti-device
> 	>                       >       >       >       man 3 Tss2_Tcti_Device_I=
nit
> 	>                       >       >       >
> 	>                       >       >       >       Note that https://github=
.com/tpm2-
> 	> software/tpm2-
> 	>                       >       >       >
> 	> tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> <http://Tss2_Tcti_Device_Init.3.in>
> 	> <http://Tss2_Tcti_Device_Init.3.in>
> 	>                       > <http://Tss2_Tcti_Device_Init.3.in>
> 	>                       >       > <http://Tss2_Tcti_Device_Init.3.in>
> 	>                       >       >       >       Has sample code in it.
> 	>                       >       >       >
> 	>                       >       >       >       If you're using the tool=
s, it supports
> 	> explicitly choosing the TCTI:
> 	>                       >       >       >       https://github.com/tpm2-=
software/tpm2-
> 	>                       >       >       > tools/blob/master/man/common/t=
cti.md
> 	>                       >       >       >
> 	>                       >       >       >       Also note that the /dev/=
tpmrm0 (Notice
> 	> the RM) is an in-kernel
> 	>                       >       > resource
> 	>                       >       >       > manager.
> 	>                       >       >       >
> 	>                       >       >       >
> 	>                       >       >       >       > When I do ESys_Initial=
ize, I see these
> 	> WARNINGs, wondering
> 	>                       > if it's
> 	>                       >       > okay
> 	>                       >       >       > for multi-
> 	>                       >       >       >       > thread
> 	>                       >       >       >       > WARNING:esys:src/tss2-
> 	>                       >       > esys/esys_tcti_default.c:137:tcti_from=
_file()
> 	>                       >       >       > Could not
> 	>                       >       >       >       > load TCTI file: libtss=
2-tcti-default.so
> 	> <http://libtss2-tcti-
> 	>                       >       > default.so/ <http://default.so/>  <htt=
p://default.so/>
> 	> <http://default.so/> >
> 	>                       >       >       > libtss2-tcti-
> 	>                       >       >       >       > default.so <http://lib=
tss2-tcti-
> 	> default.so/ <http://default.so/> >
> 	>                       >       >       >       > WARNING:esys:src/tss2-
> 	>                       >       > esys/esys_tcti_default.c:137:tcti_from=
_file()
> 	>                       >       >       > Could not
> 	>                       >       >       >       > load TCTI file: libtss=
2-tcti-tabrmd.so
> 	> <http://libtss2-tcti-
> 	>                       >       > tabrmd.so/ <http://tabrmd.so/>
> <http://tabrmd.so/>
> 	> <http://tabrmd.so/> >
> 	>                       >       >       >       >
> 	>                       >       >       >       > In my single threaded =
process,
> 	> everything works so smoothly
> 	>                       >       > [root]#
> 	>                       >       >       > ./tpm
> 	>                       >       >       >       > WARNING:esys:src/tss2-
> 	>                       >       > esys/esys_tcti_default.c:137:tcti_from=
_file()
> 	>                       >       >       > Could not
> 	>                       >       >       >       > load TCTI file: libtss=
2-tcti-default.so
> 	> <http://libtss2-tcti-
> 	>                       >       > default.so/ <http://default.so/>  <htt=
p://default.so/>
> 	> <http://default.so/> >
> 	>                       >       >       >       > WARNING:esys:src/tss2-
> 	>                       >       > esys/esys_tcti_default.c:137:tcti_from=
_file()
> 	>                       >       >       > Could not
> 	>                       >       >       >       > load TCTI file: libtss=
2-tcti-tabrmd.so
> 	> <http://libtss2-tcti-
> 	>                       >       > tabrmd.so/ <http://tabrmd.so/>
> <http://tabrmd.so/>
> 	> <http://tabrmd.so/> >
> 	>                       >       >       > ESYS
> 	>                       >       >       >       > Initialization: Pass
> 	>                       >       >       >       >
> 	>                       >       >       >       > Read TPM EK Certificat=
e: Pass
> 	>                       >       >       >       >
> 	>                       >       >       >       > TPM EK Certificate Roo=
t-CA Verification:
> 	> Pass
> 	>                       >       >       >       >
> 	>                       >       >       >       > Clear TPM State: Pass
> 	>                       >       >       >       >
> 	>                       >       >       >       > Created EK Primary obj=
ect: Pass
> 	>                       >       >       >       > #####Handle 0x418368
> 	>                       >       >       >       >
> 	>                       >       >       >       > Create Attestation Key=
: Pass
> 	>                       >       >       >       > #####Ak_Handle 0x41836b
> 	>                       >       >       >       >
> 	>                       >       >       >       > Original
> 	> Credential=3D"deadbeefdeadbeefdead"
> 	>                       >       >       >       >
> 	>                       >       >       >       > Make Credential: Pass
> 	>                       >       >       >       > #####Encrypted Credent=
ial
> 	>                       >       >       >       >
> 	>                       >       >       >
> 	>                       >       >
> 	>                       >
> 	>
> Blob=3D"0020508e439bc6512d044bb8739e8d61c8ce3664d25f3572389b46c8797e562a
> 	>                       >       >       >       > 45c412864f020a7f1bbcab=
7a34f0"
> 	>                       >       >       >       >
> 	>                       >       >       >       > #####Encrypted
> 	>                       >       >       >       >
> 	>                       >       >       >
> 	>                       >       >
> 	>                       >
> 	>
> Secret=3D"b70689bb0ed9fa8324cfa03d727e6c6795069b4f0943108409b89009b9cc76c
> 	>                       >       >       >       >
> 	>                       >       >       >
> 	>                       >       >
> 	>                       >
> 	>
> 76bddb31a5ccf34cfebc5d3fe715899bb725a8a3c8fe4a6046233869123f3e978051aec
> 	>                       >       >       >       >
> 	>                       >       >       >
> 	>                       >       >
> 	>                       >
> 	>
> e0d7af0ad6f85164a32fd2c5ad756e8c3b72f6311126de79a30c0d72aa0a6f3f437f6bc
> 	>                       >       >       >       >
> 	>                       >       >       >
> 	>                       >       >
> 	>                       >
> 	>
> 077c41d3cc6450c71e803ca6074d34ce3debf5114f4bac2fd7ee6a87ef9f07d83079477
> 	>                       >       >       >       >
> 	>                       >       >       >
> 	>                       >       >
> 	>                       >
> 	>
> 5dda4f77e4620cbaf9aeb302040ee2a66a352b9fffaa5447c09a249bb22d9d989b7f14
> 	>                       >       >       >       >
> 	>                       >       >       >
> 	>                       >       >
> 	>                       >
> 	>
> 06612a90b8d8bce6bb940fbfd1d50f31398403a2643c73bec336e6fcca46f29f9b6aa87
> 	>                       >       >       >       >
> 	>                       >       >       >
> 	>                       >       >
> 	>                       >
> 	>
> fd11d53ec6f145d61b2a61dffc783ae2b2c66184435d633d0b5a420efa01748e39d687
> 	>                       >       >       >       > e1eb9fcc1759c184972779=
bfc"
> 	>                       >       >       >       >
> 	>                       >       >       >       > Activating Credential:=
 Pass
> 	>                       >       >       >       > #####Recovered
> 	> Credential=3D"deadbeefdeadbeefdead"
> 	>                       >       >       >       >
> 	>                       >       >       >       > [root]#
> 	>                       >       >       >       >
> 	>                       >       >       >       >
> 	>                       >       >       >       >
> 	>                       >       >       >       > On Wed, Apr 8, 2020 at=
 7:02 PM Rahul
> 	> Hardikar
> 	>                       >       >       > <rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> >
> 	>                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> > >
> 	>                       >       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> >
> 	>                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> > > >
> 	>                       >       >       >       > <mailto:rahulhardikar(=
a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> >
> 	>                       >       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> > >
> 	>                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> >
> 	>                       >       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> > >
> 	>                       > > >
> 	>                       >       >       > > wrote:
> 	>                       >       >       >       >
> 	>                       >       >       >       >
> 	>                       >       >       >       >       Thanks guys, I'l=
l try this but  i also
> 	> wanted to know if there
> 	>                       > is a
> 	>                       >       > way to
> 	>                       >       >       >       > know if the TPM still =
has the EK and AK
> 	> keys loaded? I have
> 	>                       > the EK
> 	>                       >       >       > handle and AK
> 	>                       >       >       >       > handle (not made it pe=
rsistent) but I
> 	> want to make sure it's
> 	>                       >       > present as
> 	>                       >       >       > these are
> 	>                       >       >       >       > necessary for Activate=
Credential to
> 	> succeed
> 	>                       >       >       >       >       ESys_ActivateCre=
dential complaining
> 	> about secret
> 	>                       > parameter
> 	>                       >       >       > doesn't
> 	>                       >       >       >       > make sense to me, I te=
sted on server
> 	> side, ak_name is same
> 	>                       > as
> 	>                       >       > that
> 	>                       >       >       > sent and so is
> 	>                       >       >       >       > EK_PUB object as well =
as  EK_Cert in
> 	> nvram, I call the same
> 	>                       >       >       >       > external_makecredentia=
l call that's in the
> 	> GitHub to create
> 	>                       > secret
> 	>                       >       > and
> 	>                       >       >       > made sure
> 	>                       >       >       >       > secret,credblob matche=
s on the client
> 	> side when received
> 	>                       > from
> 	>                       >       > server.
> 	>                       >       >       >       >
> 	>                       >       >       >       >       Thanks,
> 	>                       >       >       >       >       Rahul
> 	>                       >       >       >       >
> 	>                       >       >       >       >       On Tue, Mar 17, =
2020 at 6:19 AM Imran
> 	> Desai
> 	>                       >       >       > <imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> 	>                       >       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >=
 >
> 	>                       >       >       >       > <mailto:imran.desai(a)=
intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> 	>                       >       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >=
 >
> > >
> 	>                       >       >       > wrote:
> 	>                       >       >       >       >
> 	>                       >       >       >       >
> 	>                       >       >       >       >               Set this=
 up with all handles in use
> 	> made persistent. If
> 	>                       > you
> 	>                       >       > still see
> 	>                       >       >       >       > issues, gdb-break or t=
urn on debug
> 	> logging at the Esys call and
> 	>                       >       > compare
> 	>                       >       >       > the
> 	>                       >       >       >       > function arguments.
> 	>                       >       >       >       >
> 	>                       >       >
> 	> _______________________________________________
> 	>                       >       >       >       >               tpm2 mai=
ling list --
> 	> tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>                       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lis=
ts.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> >
> 	>                       >       > <mailto:tpm2(a)lists.01.org <mailto:tp=
m2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> 	>                       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lis=
ts.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>                       >       > <mailto:tpm2(a)lists.01.org <mailto:tp=
m2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > > >
> 	>                       >       >       > <mailto:tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>                       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lis=
ts.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> 	>                       >       > <mailto:tpm2(a)lists.01.org <mailto:tp=
m2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>                       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lis=
ts.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > > > >
> 	>                       >       >       >       >               To unsub=
scribe send an email to
> 	> tpm2-
> 	>                       > leave(a)lists.01.org <mailto:leave(a)lists.01.=
org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> >
> 	> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> > >
> 	>                       >       > <mailto:tpm2-leave(a)lists.01.org <mai=
lto:tpm2-
> leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> >  <mailto:tpm2-
> leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>  <mailto:tpm2-
> <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> > > >
> 	>                       >       >       > <mailto:tpm2-leave(a)lists.01.=
org <mailto:tpm2-
> leave(a)lists.01.org>
> 	> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>
> 	> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >=
 >
> 	>                       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> >  <mailto:tpm2-
> leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>  <mailto:tpm2-
> <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> > > > >
> 	>                       >       >       >       > <mailto:tpm2-leave(a)l=
ists.01.org
> <mailto:tpm2-leave(a)lists.01.org>
> 	> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >
> <mailto:tpm2- <mailto:tpm2->  <mailto:tpm2- <mailto:tpm2-> >
> 	>                       > leave(a)lists.01.org <mailto:leave(a)lists.01.=
org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > >
> 	> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >
> 	> <mailto:tpm2- <mailto:tpm2->  <mailto:tpm2- <mailto:tpm2-> >
> 	>                       > leave(a)lists.01.org <mailto:leave(a)lists.01.=
org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > > >
> 	>                       >       > <mailto:tpm2-leave(a)lists.01.org <mai=
lto:tpm2-
> leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> >  <mailto:tpm2-
> leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>  <mailto:tpm2-
> <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> > >
> 	>                       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> >  <mailto:tpm2-
> leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>  <mailto:tpm2-
> <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> > > > > >
> 	>                       >       >       >       >
> 	>                       >
> 	> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> 	>                       >       >       >       >
> 	>                       >       >       >
> 	>                       >       >       >
> 	>                       >       >
> 	>                       >       >
> 	>                       >
> 	>                       >
> 	>
> 	>
> =

> =



--===============2128758480472109174==--

