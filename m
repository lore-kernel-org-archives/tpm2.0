Content-Type: multipart/mixed; boundary="===============5842125179874080140=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] tpm2_startauthsession 4.x is using getrandom and I need to
 stop that.
Date: Wed, 13 Nov 2019 10:30:04 -0800
Message-ID: <CAOCvsS=RhdQy2Oyt06TUX1C3EdkZwDG6-hQj_2OKtbNnJ08GmQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5842125179874080140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We developed our boot scripts using a nightly build of tpm2-tools from
before the conversion to ESAPI.  We now have multiple layers of
storage encryption that depend on policy authorization in our future
production configuration.  After taking the time to upgrade to the
stable release and rewrite all our commands across the tree the system
now hangs on boot.

Somewhere in the call stack tpm2_startauthsession is now asking for
random numbers using the getrandom() syscall and hanging.  Thanks to
kernel patches from a recent CVE getrandom() now blocks in the early
boot before about 4000 interrupts have happened.  Its going to be up
to me to fix this, very quickly.

I'd like for whatever patch to be as high level as possible, and
hopefully it's an oversight that could be integrated back into the
project, but I don't see any smoking guns yet in
tpm2_startauthsession.c and there's a lot of time pressure. If anyone
has any suggestions where to start looking it would be nice.

Disabling the possibility of encryption for communication on a local
bus may be a much easier sell to the bosses than trusting all HWRNGs
on the system explicitly.
--===============5842125179874080140==--

