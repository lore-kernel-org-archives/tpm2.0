Content-Type: multipart/mixed; boundary="===============3748074836788122618=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Thu, 16 Apr 2020 21:37:11 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649ED32A4@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAP3jAwS_1U6z0N+Za8zm1haaC2MOUD-aF-HCdY2mghVV52aKxg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3748074836788122618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
> Sent: Thursday, April 16, 2020 2:08 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: Desai, Imran <imran.desai(a)intel.com>; tpm2(a)lists.01.org
> Subject: Re: [tpm2] Re: ESys_ActivateCredential
> =

> Hi Bill,
> So the main thread does a lot of other stuff, tpm2 is just one of them, i=
n order to
> avoid blocking main thread, I create another pthread.

This is exactly what the async API is for. You can call the async API and t=
hen select()/poll() on the
FD's Esys_GetPollHandles()

/* this won't block */
TSS2_RC
Esys_GetRandom_Async(
    ESYS_CONTEXT *esysContext,
    ESYS_TR shandle1,
    ESYS_TR shandle2,
    ESYS_TR shandle3,
    UINT16 bytesRequested);

Main thread does stuff..... it sounds like an event loop (gui thread?), so =
it would
call  Select() with a super low timeout.
If fd is ready:
    Esys_GetRandom_Finish(
        ESYS_CONTEXT *esysContext,
        TPM2B_DIGEST **randomBytes);
}

> This is my logic:
> global variables are ESYS_CONTEXT etcx, ESYS_TR ekHandle, ESYS_TR akHandl=
e so
> all threads can see this
> main_thread():
>   Calls Esys_initialize() and saves the context
>   Reads EK_CERT and stores in global variable
>   creates a new pthread, T_1 and continues with its other work
> T_1():
>   Checks if ectx is not null and
>  creates EK --saves the handle (ESYS_TR ekHandle) and EK_PUB object
> creates AK -- saves the handle (ESYS_TR akhandle) and another global vari=
able for
> ak_name
> sends EK_CERT, EK_PUB,AK_NAME in a buffer to server (marshaled)
> thread exits
> =

> Server side again has main thread that accepts it and creates a new threa=
d S_1()
> to handle this, S_1() only does external_make_credential(), (basically Gi=
tHub
> code) and sends SECRET and CREDBLOB back to client
> =

> Clients main_thread copies the SECRET/CREDBLOB to a global var and again
> creates a new thread T_2 to handle this,
> T_2():
> T_2 makes sure T_1 is done (which is always done)
> Now since ectx,ekHandle,akHandle are all global, it just calls
> Esys_ActivateCredential() (after creating the  necessary session, of cour=
se )
> Esys_Activate...() fails returning 0x2c4 (always..ran it 20times...always)
> =

> Now if I do all this in one thread, i.e main, T_1,S_1,T_2 ,it works like =
a charm!

Somewhere something must not be as described, have you ran your program thr=
ough ASAN
To make sure it's not memory corruption? If it's not that, something somewh=
ere must be stomping
on the state.

Why not just make T_1 perform T_2 task as well. Start T1, it sends to serve=
r and waits for response,
Gets response and does the activate credential. This would avoid you having=
 to fire up additional
threads, which is slow.

> =

> Now I see you mentioned that each thread needs its own Esys_Initialize()!=
! If
> that's the case, then I would HAVE to make them persistent, no?

No its more of how you share data and design it. I typically use a message =
passing design,
I have a thread sleeping on a message queue and wake up that thread with a =
 task, and then
In my main event loop check the result queue to see if I have anything to d=
o. Thiers lots
of ways to do this. But typically firing off a thread every time isn't the =
best approach even if
it works. If you want your main thread responsive on a busy system, its bes=
t not to ask for
a new thread everytime.

But in the sake of completeness, I have a skeleton multi-threaded applicati=
on that does something
Similar:

Main - esys init
T1 - Creates key
Main - does stuff (like go to a server)
T2 - Signs with key

https://gist.github.com/williamcroberts/a3966e2131ba7e0adbf3ea757d36f15d

How are you synchronizing your threads? Everything must be mutually exclusi=
ve for ESYS....
Im making sure that T1 starts after ESYS_Initialize and that T2 waits on T1=
 and that main, which
Destroys everything waits on T2.


> Thanks,
> Rahul
> =

> On Thu, Apr 16, 2020 at 10:34 AM Roberts, William C <william.c.roberts(a)=
intel.com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> 	> -----Original Message-----
> 	> From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> ]
> 	> Sent: Wednesday, April 15, 2020 1:06 PM
> 	> To: Roberts, William C <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	> Cc: Desai, Imran <imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com> >; tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 	> Subject: Re: [tpm2] Re: ESys_ActivateCredential
> 	>
> 	> Thanks Bill. I am taking help from the poky team on this.
> 	> Getting back to the Activate Credential issue, since my code worked
> fine as a
> 	> single application as well as being run inside another process but as a
> single
> 	> thread (including makeCredential and activateCred).
> 	> My guess for failing is:
> 	> 1. When server sends secret/credBlob, they dont match ---> But i ran
> gdb and
> 	> checked all bytes and they match, so thats not an issue, server is
> running same
> 	> OpenSSL as client, so no mismatch in version for single-threaded vs
> multi-
> 	> threaded 2. Probably AK key or EK key is not loaded or changed
> 	> --> to prove this, i would need to use Esys_ReadPublic , if it fails,
> 	> --> implies its not loaded, if it succeeds, I need to verify ek_pub and
> 	> --> ak_name is same when we created it
> 	> Assuming I have the ESYS_CONTEXT saved as well as the ESYS_TR
> handle for both
> 	> AK and EK saved,  Esys_ReadPublic should still work right, as it only
> needs these
> 	> 2?
> =

> 	What do you mean ESYS_CONTEXT saved? I may be misunderstanding
> you here,
> 	But you can't save those, it's a pointer so it has the same lifecycle as=
 the
> process.
> 	Also, AFIAK, they are not thread safe. Each thread needs its own
> ESYS_CONTEXT
> 	from Esys_Initialize().
> =

> 	For Esys_ReadPublic(), you need an ESYS_CONTEXT and an ESYS_TR. Like
> ESYS_CONTEXT
> 	Pointers that cannot be shared, ESYS_TR's are handle's that eventually
> get turned into a
> 	pointer under the hood, so you can't share those either. You can seriali=
ze
> and reserialize to
> 	pass from thread A to B.
> =

> 	If you want to use the same ESYS_CONTEXT and ESYS_TR from thread A
> and B, you need
> 	to lock ALL ESYS CALLS. But if you're going to do that, does multi-
> threading really get
> 	you any benefit.
> =

> 	>
> 	> Any other reason for failing?
> 	> Thanks,
> 	> Rahul
> 	>
> 	> On Wed, Apr 15, 2020 at 8:25 AM Roberts, William C
> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > wrote:
> 	>
> 	>
> 	>       > -----Original Message-----
> 	>       > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> ]
> 	>       > Sent: Monday, April 13, 2020 6:55 PM
> 	>       > To: Roberts, William C <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>       > Cc: Desai, Imran <imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >;
> tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > Subject: Re: [tpm2] Re: ESys_ActivateCredential
> 	>       >
> 	>       > What is the latest stable release for tpm2_tss ?
> 	>
> 	>       Really? Github has a releases tab, use it.
> 	>       https://github.com/tpm2-software/tpm2-tss/releases
> 	>
> 	>
> 	>       >
> 	>       > Thanks,
> 	>       > Rahul
> 	>       >
> 	>       > On Mon, Apr 13, 2020 at 4:38 PM Rahul Hardikar
> 	> <rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> > wrote:
> 	>       >
> 	>       >
> 	>       >       Looks like the version I have is old, the file tss2_tcti=
ldr.h does
> not
> 	> exist
> 	>       >
> 	>       >
> 	>       >       On Mon, Apr 13, 2020 at 12:31 PM Rahul Hardikar
> 	>       > <rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> > > >
> wrote:
> 	>       >
> 	>       >
> 	>       >               Ok, got it. I'm using ESAPI C APIs. But its pret=
ty much the
> same as
> 	>       > the tpm2 tools implementation.
> 	>       >               How do i add debugs in my poky directory?  I hav=
e tpm2.0-
> 	>       > tss_2.1.4.bb <http://tss_2.1.4.bb>  <http://tss_2.1.4.bb>
> <http://tpm2.0-tss_2.1.4.bb>  file.
> 	>       >               Also, how to add compile-time log flags to my sr=
c file that
> uses
> 	>       > ESAPI calls? Running separately was easy, I just called
> 	>       > TSS2_LOG=3D"all+ERROR,tcti+DEBUG"
> 	>       >
> 	>       >               On Mon, Apr 13, 2020 at 7:20 AM Roberts, William=
 C
> 	>       > <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>  <mailto:william.c.roberts(a)intel=
.com
> <mailto:william.c.roberts(a)intel.com> >
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>  <mailto:william.c.roberts(a)intel=
.com
> <mailto:william.c.roberts(a)intel.com> > > >
> 	> wrote:
> 	>       >
> 	>       >
> 	>       >                       > -----Original Message-----
> 	>       >                       > From: Rahul Hardikar
> [mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> ]
> 	>       >                       > Sent: Friday, April 10, 2020 4:15 PM
> 	>       >                       > To: Roberts, William C <william.c.robe=
rts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > >
> 	>       >                       > Cc: Desai, Imran <imran.desai(a)intel.=
com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >;
> 	> tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       >                       > Subject: Re: [tpm2] Re: ESys_ActivateC=
redential
> 	>       >                       >
> 	>       >                       > Hi Bill,
> 	>       >                       > I have this on my system: Is tpmrm0 sa=
me as tabrmd?
> I
> 	>       > believe mine is using this
> 	>       >                       > right now , i'm changing it to what yo=
u mentioned  to
> 	>       > see if it helps.
> 	>       >                       > [root(a)nfvis ~]# ls -l /dev/tpm*
> 	>       >                       > crw-rw----. 1 tss root  10,   224 Apr =
 8 23:19 /dev/tpm0
> 	>       >                       > crw-rw----. 1 tss tss  254, 65536 Apr =
 8 23:19
> 	>       > /dev/tpmrm0 Thanks, Rahul
> 	>       >
> 	>       >                       In theory, yes. In practice no.
> 	>       >                       /dev/tpmrm0 is the in kernel resource ma=
nager
> 	>       >                       tpm2-abrmd is the userspace resource man=
ager
> 	>       >
> 	>       >                       tpm2-abrmd has a few features tpmrm0 doe=
sn't have,
> 	>       > but unless you're
> 	>       >                       using policy sessions with tpm2-tools, y=
ou shouldn't
> 	>       > notice a difference.
> 	>       >
> 	>       >                       >
> 	>       >                       > On Fri, Apr 10, 2020 at 11:33 AM Rober=
ts, William C
> 	>       > <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>  <mailto:william.c.roberts(a)intel=
.com
> <mailto:william.c.roberts(a)intel.com> >
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>  <mailto:william.c.roberts(a)intel=
.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>       >                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > > > wrote:
> 	>       >                       >
> 	>       >                       >
> 	>       >                       >
> 	>       >                       >
> 	>       >                       >       > -----Original Message-----
> 	>       >                       >       > From: Rahul Hardikar
> 	>       > [mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> > >
> 	>       >                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> > ]
> 	>       >                       >       > Sent: Friday, April 10, 2020 1=
:08 PM
> 	>       >                       >       > To: Roberts, William C
> 	>       > <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>  <mailto:william.c.roberts(a)intel=
.com
> <mailto:william.c.roberts(a)intel.com> >
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>  <mailto:william.c.roberts(a)intel=
.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>       >                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > > >
> 	>       >                       >       > Cc: Desai, Imran <imran.desai(=
a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>       >                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > > >;
> 	> tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       >                       > <mailto:tpm2(a)lists.01.org <mailto:tp=
m2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       > >
> 	>       >                       >       > Subject: Re: [tpm2] Re: ESys_A=
ctivateCredential
> 	>       >                       >       >
> 	>       >                       >       > Thanks Bill, trying that.
> 	>       >                       >       >  I did not get debug build tpm=
2_tss, isn't it all
> 	>       > prebuilt ? I will have to see
> 	>       >                       > how to
> 	>       >                       >       > do it in poky.
> 	>       >                       >
> 	>       >                       >       If you're getting it from a pack=
age manager, yes.
> But
> 	>       > there's nothing
> 	>       >                       > stopping you
> 	>       >                       >       from using source builds. Some d=
istro's will package
> 	>       > debug symbols for
> 	>       >                       > their
> 	>       >                       >       packages.
> 	>       >                       >
> 	>       >                       >       >
> 	>       >                       >       > On Fri, Apr 10, 2020 at 8:16 A=
M Roberts, William C
> 	>       >                       > <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >  <mailto:william.c.roberts(a)i=
ntel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > >
> 	>       >                       >       > <mailto:william.c.roberts(a)in=
tel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>       >                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > > > > wrote:
> 	>       >                       >       >
> 	>       >                       >       >
> 	>       >                       >       >
> 	>       >                       >       >
> 	>       >                       >       >       > -----Original Message-=
----
> 	>       >                       >       >       > From: Rahul Hardikar
> 	>       > [mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> > >
> 	>       >                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> >
> 	>       >                       >       > <mailto:rahulhardikar(a)gmail.=
com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> > >
> 	>       >                       > ]
> 	>       >                       >       >       > Sent: Thursday, April =
9, 2020 2:51 PM
> 	>       >                       >       >       > To: Roberts, William C
> 	>       > <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>  <mailto:william.c.roberts(a)intel=
.com
> <mailto:william.c.roberts(a)intel.com> >
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>  <mailto:william.c.roberts(a)intel=
.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>       >                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > >
> 	>       >                       >       > <mailto:william.c.roberts(a)in=
tel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>       >                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > > > >
> 	>       >                       >       >       > Cc: Desai, Imran <imra=
n.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>       >                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> 	>       >                       >       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > > >
> 	> >;
> 	>       >                       > tpm2(a)lists.01.org <mailto:tpm2(a)lis=
ts.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> 	>       >                       >       > <mailto:tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > > >
> 	>       >                       >       >       > Subject: Re: [tpm2] Re:
> 	>       > ESys_ActivateCredential
> 	>       >                       >       >       >
> 	>       >                       >       >       > Thanks Bill. I use this
> 	>       >                       >       >       > Esys_Initialize( &ectx=
, NULL, NULL);
> 	>       >                       >       >       >
> 	>       >                       >       >       > so i'm assuming it wou=
ld take the default
> 	>       > libtss2-tcti-tabrmd.so.0.
> 	>       >                       >       >
> 	>       >                       >       >       This should do it for yo=
u:
> 	>       >                       >       >       TSS2_RC
> 	>       >                       >       >       Tss2_TctiLdr_Initialize =
(const char *nameConf,
> 	>       >                       >       >                               =
 TSS2_TCTI_CONTEXT **context);
> 	>       >                       >       >
> 	>       >                       >       >       Set nameConf to the stri=
ng "tabrmd", that
> 	>       > should give you a tcti
> 	>       >                       > pointer
> 	>       >                       >       > you can
> 	>       >                       >       >       pass wot Esys_Initialize=
()
> 	>       >                       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >       > If I need to debug Esy=
s_ActivateCredential
> 	>       > more, how can I do it,
> 	>       >                       > these
> 	>       >                       >       > APIs are
> 	>       >                       >       >       > no more standalone, I =
have integrated it in a
> 	>       > bigger code base and
> 	>       >                       >       > added the
> 	>       >                       >       >       > esys-tss2 and other li=
bs in my poky build, so
> 	>       > now it runs as
> 	>       >                       > different
> 	>       >                       >       > process that
> 	>       >                       >       >       > invokes this function,=
 I can gdb into the
> 	>       > process but I can't seem to
> 	>       >                       > gdb
> 	>       >                       >       > into
> 	>       >                       >       >       > Esys_Activate..( )
> 	>       >                       >       >
> 	>       >                       >       >       Did you build tpm2-tss w=
ith debug symbols?
> 	>       >                       >       >       Add --enable-debug
> 	>       >                       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >       > Thanks,
> 	>       >                       >       >       > Rahul
> 	>       >                       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >       > On Thu, Apr 9, 2020 at=
 10:23 AM Roberts,
> 	>       > William C
> 	>       >                       >       > <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >  <mailto:william.c.roberts(a)i=
ntel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > >
> 	>       >                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >  <mailto:william.c.roberts(a)i=
ntel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > > >
> 	>       >                       >       >       > <mailto:william.c.robe=
rts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>       >                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > >
> 	>       >                       >       > <mailto:william.c.roberts(a)in=
tel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>       >                       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > > > > > wrote:
> 	>       >                       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >       >       > -----Original =
Message-----
> 	>       >                       >       >       >       > From: Rahul Ha=
rdikar
> 	>       > [mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> > >
> 	>       >                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> >
> 	>       >                       >       > <mailto:rahulhardikar(a)gmail.=
com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> > >
> 	>       >                       >       >       > <mailto:rahulhardikar(=
a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	>       >                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> >  <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	>       >                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> > > >
> 	>       >                       >       > ]
> 	>       >                       >       >       >       > Sent: Thursday=
, April 9, 2020 11:18 AM
> 	>       >                       >       >       >       > To: Desai, Imr=
an
> <imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>       >                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> 	>       >                       >       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > > >
> 	>       >                       >       >       > <mailto:imran.desai(a)=
intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> 	>       >                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > > > >
> 	> >
> 	>       >                       >       >       >       > Cc: tpm2(a)lis=
ts.01.org
> <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> 	>       >                       > <mailto:tpm2(a)lists.01.org <mailto:tp=
m2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > > >
> 	>       >                       >       > <mailto:tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> 	>       >                       > <mailto:tpm2(a)lists.01.org <mailto:tp=
m2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > > > >
> 	>       >                       >       >       >       > Subject: [tpm2=
] Re:
> 	>       > ESys_ActivateCredential
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > How do I know =
if  RM is being used?
> 	>       >                       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >       >       If you set the t=
cti to the device tcti, it will
> 	>       > open /dev/tpm0 by
> 	>       >                       >       > default. And
> 	>       >                       >       >       > that wont
> 	>       >                       >       >       >       Be an RM. You ca=
n also give it an option.
> 	>       > Esys_Initialize() takes a
> 	>       >                       > tcti
> 	>       >                       >       > as an
> 	>       >                       >       >       > option,
> 	>       >                       >       >       >       NULL will cause =
it to use the default
> search
> 	>       > behavior of the
> 	>       >                       >       > Tss2_TctiLdr,
> 	>       >                       >       >       > see:
> 	>       >                       >       >       >
> 	>       >                       >       >       >       https://github.c=
om/tpm2-
> software/tpm2-
> 	>       >                       >       >       >
> 	>       > tss/blob/master/man/Tss2_TctiLdr_Initialize.3.in
> <http://Tss2_TctiLdr_Initialize.3.in>
> 	> <http://Tss2_TctiLdr_Initialize.3.in>
> 	>       > <http://Tss2_TctiLdr_Initialize.3.in>
> 	>       >                       > <http://Tss2_TctiLdr_Initialize.3.in>
> 	>       >                       >       > <http://Tss2_TctiLdr_Initializ=
e.3.in>
> 	>       >                       >       >       >       https://github.c=
om/tpm2-
> software/tpm2-
> 	>       >                       >       >       >
> 	>       > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> <http://Tss2_Tcti_Device_Init.3.in>
> 	> <http://Tss2_Tcti_Device_Init.3.in>
> 	>       > <http://Tss2_Tcti_Device_Init.3.in>
> 	>       >                       > <http://Tss2_Tcti_Device_Init.3.in>
> 	>       >                       >       > <http://Tss2_Tcti_Device_Init.=
3.in>
> 	>       >                       >       >       >       https://github.c=
om/tpm2-
> software/tpm2-
> 	>       >                       >       > tss/blob/master/man/tss2-
> 	>       >                       >       >       > tcti-device.7.in <http=
://tcti-device.7.in>
> <http://tcti-device.7.in>
> 	> <http://tcti-device.7.in>
> 	>       > <http://tcti-device.7.in>  <http://tcti-device.7.in>
> 	>       >                       >       >       >
> 	>       >                       >       >       >       You can use man =
locally if you prefer as
> 	>       > well:
> 	>       >                       >       >       >       man 3 Tss2_TctiL=
dr_Initialize
> 	>       >                       >       >       >       man 7 tss2-tcti-=
device
> 	>       >                       >       >       >       man 3 Tss2_Tcti_=
Device_Init
> 	>       >                       >       >       >
> 	>       >                       >       >       >       Note that https:=
//github.com/tpm2-
> 	>       > software/tpm2-
> 	>       >                       >       >       >
> 	>       > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> <http://Tss2_Tcti_Device_Init.3.in>
> 	> <http://Tss2_Tcti_Device_Init.3.in>
> 	>       > <http://Tss2_Tcti_Device_Init.3.in>
> 	>       >                       > <http://Tss2_Tcti_Device_Init.3.in>
> 	>       >                       >       > <http://Tss2_Tcti_Device_Init.=
3.in>
> 	>       >                       >       >       >       Has sample code =
in it.
> 	>       >                       >       >       >
> 	>       >                       >       >       >       If you're using =
the tools, it supports
> 	>       > explicitly choosing the TCTI:
> 	>       >                       >       >       >       https://github.c=
om/tpm2-
> software/tpm2-
> 	>       >                       >       >       > tools/blob/master/man/=
common/tcti.md
> 	>       >                       >       >       >
> 	>       >                       >       >       >       Also note that t=
he /dev/tpmrm0 (Notice
> 	>       > the RM) is an in-kernel
> 	>       >                       >       > resource
> 	>       >                       >       >       > manager.
> 	>       >                       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >       >       > When I do ESys=
_Initialize, I see these
> 	>       > WARNINGs, wondering
> 	>       >                       > if it's
> 	>       >                       >       > okay
> 	>       >                       >       >       > for multi-
> 	>       >                       >       >       >       > thread
> 	>       >                       >       >       >       > WARNING:esys:s=
rc/tss2-
> 	>       >                       >       > esys/esys_tcti_default.c:137:t=
cti_from_file()
> 	>       >                       >       >       > Could not
> 	>       >                       >       >       >       > load TCTI file=
: libtss2-tcti-default.so
> 	>       > <http://libtss2-tcti-
> 	>       >                       >       > default.so/ <http://default.so=
/>
> <http://default.so/>  <http://default.so/>
> 	>       > <http://default.so/> >
> 	>       >                       >       >       > libtss2-tcti-
> 	>       >                       >       >       >       > default.so <ht=
tp://libtss2-tcti-
> 	>       > default.so/ <http://default.so/>  <http://default.so/> >
> 	>       >                       >       >       >       > WARNING:esys:s=
rc/tss2-
> 	>       >                       >       > esys/esys_tcti_default.c:137:t=
cti_from_file()
> 	>       >                       >       >       > Could not
> 	>       >                       >       >       >       > load TCTI file=
: libtss2-tcti-tabrmd.so
> 	>       > <http://libtss2-tcti-
> 	>       >                       >       > tabrmd.so/ <http://tabrmd.so/>
> <http://tabrmd.so/>
> 	> <http://tabrmd.so/>
> 	>       > <http://tabrmd.so/> >
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > In my single t=
hreaded process,
> 	>       > everything works so smoothly
> 	>       >                       >       > [root]#
> 	>       >                       >       >       > ./tpm
> 	>       >                       >       >       >       > WARNING:esys:s=
rc/tss2-
> 	>       >                       >       > esys/esys_tcti_default.c:137:t=
cti_from_file()
> 	>       >                       >       >       > Could not
> 	>       >                       >       >       >       > load TCTI file=
: libtss2-tcti-default.so
> 	>       > <http://libtss2-tcti-
> 	>       >                       >       > default.so/ <http://default.so=
/>
> <http://default.so/>  <http://default.so/>
> 	>       > <http://default.so/> >
> 	>       >                       >       >       >       > WARNING:esys:s=
rc/tss2-
> 	>       >                       >       > esys/esys_tcti_default.c:137:t=
cti_from_file()
> 	>       >                       >       >       > Could not
> 	>       >                       >       >       >       > load TCTI file=
: libtss2-tcti-tabrmd.so
> 	>       > <http://libtss2-tcti-
> 	>       >                       >       > tabrmd.so/ <http://tabrmd.so/>
> <http://tabrmd.so/>
> 	> <http://tabrmd.so/>
> 	>       > <http://tabrmd.so/> >
> 	>       >                       >       >       > ESYS
> 	>       >                       >       >       >       > Initialization=
: Pass
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > Read TPM EK Ce=
rtificate: Pass
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > TPM EK Certifi=
cate Root-CA Verification:
> 	>       > Pass
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > Clear TPM Stat=
e: Pass
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > Created EK Pri=
mary object: Pass
> 	>       >                       >       >       >       > #####Handle 0x=
418368
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > Create Attesta=
tion Key: Pass
> 	>       >                       >       >       >       > #####Ak_Handle=
 0x41836b
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > Original
> 	>       > Credential=3D"deadbeefdeadbeefdead"
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > Make Credentia=
l: Pass
> 	>       >                       >       >       >       > #####Encrypted=
 Credential
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >
> 	>       >                       >
> 	>       >
> 	>
> Blob=3D"0020508e439bc6512d044bb8739e8d61c8ce3664d25f3572389b46c8797e562a
> 	>       >                       >       >       >       > 45c412864f020a=
7f1bbcab7a34f0"
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > #####Encrypted
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >
> 	>       >                       >
> 	>       >
> 	>
> Secret=3D"b70689bb0ed9fa8324cfa03d727e6c6795069b4f0943108409b89009b9cc76c
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >
> 	>       >                       >
> 	>       >
> 	>
> 76bddb31a5ccf34cfebc5d3fe715899bb725a8a3c8fe4a6046233869123f3e978051aec
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >
> 	>       >                       >
> 	>       >
> 	>
> e0d7af0ad6f85164a32fd2c5ad756e8c3b72f6311126de79a30c0d72aa0a6f3f437f6bc
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >
> 	>       >                       >
> 	>       >
> 	>
> 077c41d3cc6450c71e803ca6074d34ce3debf5114f4bac2fd7ee6a87ef9f07d83079477
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >
> 	>       >                       >
> 	>       >
> 	>
> 5dda4f77e4620cbaf9aeb302040ee2a66a352b9fffaa5447c09a249bb22d9d989b7f14
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >
> 	>       >                       >
> 	>       >
> 	>
> 06612a90b8d8bce6bb940fbfd1d50f31398403a2643c73bec336e6fcca46f29f9b6aa87
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >
> 	>       >                       >
> 	>       >
> 	>
> fd11d53ec6f145d61b2a61dffc783ae2b2c66184435d633d0b5a420efa01748e39d687
> 	>       >                       >       >       >       > e1eb9fcc1759c1=
84972779bfc"
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > Activating Cre=
dential: Pass
> 	>       >                       >       >       >       > #####Recovered
> 	>       > Credential=3D"deadbeefdeadbeefdead"
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > [root]#
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       > On Wed, Apr 8,=
 2020 at 7:02 PM Rahul
> 	>       > Hardikar
> 	>       >                       >       >       > <rahulhardikar(a)gmail=
.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> >
> 	>       >                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> > >
> 	>       >                       >       > <mailto:rahulhardikar(a)gmail.=
com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> >
> 	>       >                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> > > >
> 	>       >                       >       >       >       > <mailto:rahulh=
ardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	>       >                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> >
> 	>       >                       >       > <mailto:rahulhardikar(a)gmail.=
com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> > >
> 	>       >                       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> >
> 	>       >                       >       > <mailto:rahulhardikar(a)gmail.=
com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> > >
> 	>       >                       > > >
> 	>       >                       >       >       > > wrote:
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       >       Thanks g=
uys, I'll try this but  i also
> 	>       > wanted to know if there
> 	>       >                       > is a
> 	>       >                       >       > way to
> 	>       >                       >       >       >       > know if the TP=
M still has the EK and AK
> 	>       > keys loaded? I have
> 	>       >                       > the EK
> 	>       >                       >       >       > handle and AK
> 	>       >                       >       >       >       > handle (not ma=
de it persistent) but I
> 	>       > want to make sure it's
> 	>       >                       >       > present as
> 	>       >                       >       >       > these are
> 	>       >                       >       >       >       > necessary for =
ActivateCredential to
> 	>       > succeed
> 	>       >                       >       >       >       >       ESys_Act=
ivateCredential complaining
> 	>       > about secret
> 	>       >                       > parameter
> 	>       >                       >       >       > doesn't
> 	>       >                       >       >       >       > make sense to =
me, I tested on server
> 	>       > side, ak_name is same
> 	>       >                       > as
> 	>       >                       >       > that
> 	>       >                       >       >       > sent and so is
> 	>       >                       >       >       >       > EK_PUB object =
as well as  EK_Cert in
> 	>       > nvram, I call the same
> 	>       >                       >       >       >       > external_makec=
redential call that's in
> the
> 	>       > GitHub to create
> 	>       >                       > secret
> 	>       >                       >       > and
> 	>       >                       >       >       > made sure
> 	>       >                       >       >       >       > secret,credblo=
b matches on the client
> 	>       > side when received
> 	>       >                       > from
> 	>       >                       >       > server.
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       >       Thanks,
> 	>       >                       >       >       >       >       Rahul
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       >       On Tue, =
Mar 17, 2020 at 6:19 AM
> Imran
> 	>       > Desai
> 	>       >                       >       >       > <imran.desai(a)intel.c=
om
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> 	>       >                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > > >
> 	>       >                       >       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> 	>       >                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > > > >
> 	>       >                       >       >       >       > <mailto:imran.=
desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>       >                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>       >                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > > >
> 	>       >                       >       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> 	>       >                       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > > > >
> 	> > >
> 	>       >                       >       >       > wrote:
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >       >               =
Set this up with all handles in use
> 	>       > made persistent. If
> 	>       >                       > you
> 	>       >                       >       > still see
> 	>       >                       >       >       >       > issues, gdb-br=
eak or turn on debug
> 	>       > logging at the Esys call and
> 	>       >                       >       > compare
> 	>       >                       >       >       > the
> 	>       >                       >       >       >       > function argum=
ents.
> 	>       >                       >       >       >       >
> 	>       >                       >       >
> 	>       > _______________________________________________
> 	>       >                       >       >       >       >               =
tpm2 mailing list --
> 	>       > tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       >                       > <mailto:tpm2(a)lists.01.org <mailto:tp=
m2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       > >
> 	>       >                       >       > <mailto:tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > > >
> 	>       >                       > <mailto:tpm2(a)lists.01.org <mailto:tp=
m2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> 	>       >                       >       > <mailto:tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > > > >
> 	>       >                       >       >       > <mailto:tpm2(a)lists.0=
1.org
> <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> 	>       >                       > <mailto:tpm2(a)lists.01.org <mailto:tp=
m2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > > >
> 	>       >                       >       > <mailto:tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> 	>       >                       > <mailto:tpm2(a)lists.01.org <mailto:tp=
m2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > > > > >
> 	>       >                       >       >       >       >               =
To unsubscribe send an email to
> 	>       > tpm2-
> 	>       >                       > leave(a)lists.01.org <mailto:leave(a)l=
ists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> >
> 	> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > >
> 	>       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.0=
1.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >
> 	> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> > > >
> 	>       >                       >       > <mailto:tpm2-leave(a)lists.01.=
org <mailto:tpm2-
> leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> >  <mailto:tpm2-
> <mailto:tpm2->  <mailto:tpm2- <mailto:tpm2-> >
> 	>       > leave(a)lists.01.org <mailto:leave(a)lists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > >  <mailto:t=
pm2-
> <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org>  <mailto:tpm2-
> leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >  <mailto:tpm2-
> <mailto:tpm2->
> 	> <mailto:tpm2- <mailto:tpm2-> >
> 	>       > leave(a)lists.01.org <mailto:leave(a)lists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > > > >
> 	>       >                       >       >       > <mailto:tpm2-leave(a)l=
ists.01.org
> <mailto:tpm2-leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> >
> 	>       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.0=
1.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> > >
> 	> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >
> 	>       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.0=
1.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> > > >
> 	>       >                       > <mailto:tpm2-leave(a)lists.01.org <mai=
lto:tpm2-
> leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> >  <mailto:tpm2-
> <mailto:tpm2->  <mailto:tpm2- <mailto:tpm2-> >
> 	>       > leave(a)lists.01.org <mailto:leave(a)lists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > >  <mailto:t=
pm2-
> <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org>  <mailto:tpm2-
> leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >  <mailto:tpm2-
> <mailto:tpm2->
> 	> <mailto:tpm2- <mailto:tpm2-> >
> 	>       > leave(a)lists.01.org <mailto:leave(a)lists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > > > > >
> 	>       >                       >       >       >       > <mailto:tpm2-l=
eave(a)lists.01.org
> <mailto:tpm2-leave(a)lists.01.org>
> 	> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >
> 	>       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.0=
1.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> > >
> 	> <mailto:tpm2- <mailto:tpm2->  <mailto:tpm2- <mailto:tpm2-> >
> <mailto:tpm2- <mailto:tpm2->  <mailto:tpm2- <mailto:tpm2-> > >
> 	>       >                       > leave(a)lists.01.org <mailto:leave(a)l=
ists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> >
> 	> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > > >
> 	>       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.0=
1.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >
> 	> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> > >
> 	>       > <mailto:tpm2- <mailto:tpm2->  <mailto:tpm2- <mailto:tpm2-> >
> <mailto:tpm2- <mailto:tpm2->  <mailto:tpm2- <mailto:tpm2-> > >
> 	>       >                       > leave(a)lists.01.org <mailto:leave(a)l=
ists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> >
> 	> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > > > >
> 	>       >                       >       > <mailto:tpm2-leave(a)lists.01.=
org <mailto:tpm2-
> leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> >  <mailto:tpm2-
> <mailto:tpm2->  <mailto:tpm2- <mailto:tpm2-> >
> 	>       > leave(a)lists.01.org <mailto:leave(a)lists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > >  <mailto:t=
pm2-
> <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org>  <mailto:tpm2-
> leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >  <mailto:tpm2-
> <mailto:tpm2->
> 	> <mailto:tpm2- <mailto:tpm2-> >
> 	>       > leave(a)lists.01.org <mailto:leave(a)lists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > > >
> 	>       >                       > <mailto:tpm2-leave(a)lists.01.org <mai=
lto:tpm2-
> leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> >  <mailto:tpm2-
> <mailto:tpm2->  <mailto:tpm2- <mailto:tpm2-> >
> 	>       > leave(a)lists.01.org <mailto:leave(a)lists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > >  <mailto:t=
pm2-
> <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org>  <mailto:tpm2-
> leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >  <mailto:tpm2-
> <mailto:tpm2->
> 	> <mailto:tpm2- <mailto:tpm2-> >
> 	>       > leave(a)lists.01.org <mailto:leave(a)lists.01.org>
> <mailto:leave(a)lists.01.org <mailto:leave(a)lists.01.org> > > > > > >
> 	>       >                       >       >       >       >
> 	>       >                       >
> 	>       > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> 	>       >                       >       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >       >
> 	>       >                       >       >
> 	>       >                       >       >
> 	>       >                       >
> 	>       >                       >
> 	>       >
> 	>       >
> 	>
> 	>
> =

> =



--===============3748074836788122618==--

