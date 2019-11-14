Content-Type: multipart/mixed; boundary="===============7305241780184726967=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_startauthsession 4.x is using getrandom and I need to
 stop that.
Date: Thu, 14 Nov 2019 18:29:03 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E44BF1@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAOCvsS=RhdQy2Oyt06TUX1C3EdkZwDG6-hQj_2OKtbNnJ08GmQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7305241780184726967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Steven Clark [mailto:davolfman(a)gmail.com]
> Sent: Wednesday, November 13, 2019 12:30 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] tpm2_startauthsession 4.x is using getrandom and I need t=
o stop
> that.
> =

> We developed our boot scripts using a nightly build of tpm2-tools from be=
fore
> the conversion to ESAPI.  We now have multiple layers of storage encrypti=
on that
> depend on policy authorization in our future production configuration.  A=
fter
> taking the time to upgrade to the stable release and rewrite all our comm=
ands
> across the tree the system now hangs on boot.

I'm glad you were able to get through the painful upgrade path.

> =

> Somewhere in the call stack tpm2_startauthsession is now asking for random
> numbers using the getrandom() syscall and hanging.  Thanks to kernel patc=
hes
> from a recent CVE getrandom() now blocks in the early boot before about 4=
000
> interrupts have happened.  Its going to be up to me to fix this, very qui=
ckly.

So the reason this happens is Esys_StartAuthSession, when nonceCaller is NU=
LL, calls to openssl
RAND_bytes (if configured for OSSL) to set the initial nonce. Sounds like y=
ou got the entropy
source issues solved in your follow up email, which is really the better so=
lution then setting
the nonce to something static or weak.

> =

> I'd like for whatever patch to be as high level as possible, and hopefull=
y it's an
> oversight that could be integrated back into the project, but I don't see=
 any
> smoking guns yet in tpm2_startauthsession.c and there's a lot of time pre=
ssure. If
> anyone has any suggestions where to start looking it would be nice.

You could send a patch to us to specify the nonceCaller and then the caller=
 would
be responsible for the quality of the nonce. You could use it here, but you=
 could
shoot yourself in the foot. But you could also then source the randomness
via a tpm2_getrandom call, but without encrypted sessions, you could be
getting an attacker controlled nonce.

> =

> Disabling the possibility of encryption for communication on a local bus =
may be a
> much easier sell to the bosses than trusting all HWRNGs on the system exp=
licitly.

The comms are not encrypted unless you specify a key. However, the nonce pr=
events
replays of session traffic, which is very important when you have an author=
ization
session. You don't want that traffic to be used to re-auth to the object.

Section 19.6.3.1 of https://trustedcomputinggroup.org/wp-content/uploads/TP=
M-Rev-2.0-Part-1-Architecture-01.38.pdf
will give you all the gory details.

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============7305241780184726967==--

