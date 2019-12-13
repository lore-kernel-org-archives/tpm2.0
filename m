Content-Type: multipart/mixed; boundary="===============0320961494162783780=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: [tpm2][tpm2-abrmd]tpm2-abrmd.service may run before udev
 rule.
Date: Fri, 13 Dec 2019 11:42:56 -0800
Message-ID: <CAOCvsS=dnf=E7OBbWwu6hLiD8G8rzSTap3LwuDEDb6-2zyFq0g@mail.gmail.com>
In-Reply-To: 9de29687-a740-1354-d6fb-c2eeabe0b3ba@twobit.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0320961494162783780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I pulled the patch for the wrong branch.  Here's the version for
2.3.0.  I was wondering why it had the wrong email.
From a2cb4d84507a12d0cf701ad12cbe2e1416e1f091 Mon Sep 17 00:00:00 2001
From: Steven Clark <davolfman(a)gmail.com>
Date: Tue, 3 Dec 2019 01:39:28 +0000
Subject: [PATCH 1/1] Hold Resource Manager until tpm is accessible

In testing in an unusual boot scenario it was discovered that
tpm2-abrmd.service was starting before udev had changed ownership
of the TPM device from root to TSS.  This patch changes the
Systemd unit file to force a udev settle before starting the
resource manager service.

Signed-off-by: Steven Clark <davolfman(a)gmail.com>
---
 dist/tpm2-abrmd.service.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dist/tpm2-abrmd.service.in b/dist/tpm2-abrmd.service.in
index 00aa031..4300cb3 100644
--- a/dist/tpm2-abrmd.service.in
+++ b/dist/tpm2-abrmd.service.in
@@ -1,5 +1,7 @@
 [Unit]
 Description=3DTPM2 Access Broker and Resource Management Daemon
+After=3Dsystemd-udev-settle.service
+Requires=3Dsystemd-udev-settle.service

 [Service]
 Type=3Ddbus
-- =

2.18.1

On Thu, Dec 12, 2019 at 11:09 AM Philip Tricca <flihp(a)twobit.org> wrote:
>
> Thanks Steve. I don't have much time these days to work on this stuff so
> no worries about the delay. I'll get this in and turn the crank on a
> bugfix release.
>
> Thanks,
> Philip
>
> On 12/12/19 10:52 AM, Steven Clark wrote:
> > Here's a version with a sign-off.  By the time I hit a lull I had to
> > resynthesize the repository used to build the patch.  At least I get
> > some process practice with something innocuous this way.
> >
> > From 4b95f1d7988a2f4d4d5e1f7b19602a8f0b1c66a4 Mon Sep 17 00:00:00 2001
> > From: Steven Clark <davolfman(a)gmail.com>
> > Date: Wed, 27 Nov 2019 21:10:00 +0000
> > Subject: [PATCH 1/1] Hold Resource Manager until tpm is accessible
> >
> > In testing in an unusual boot scenario it was discovered that
> > tpm2-abrmd.service was starting before udev had changed ownership
> > of the TPM device from root to TSS.  This patch changes the
> > Systemd unit file to force a udev settle before starting the
> > resource manager service.
> >
> > Signed-off-by: Steven Clark <davolfman(a)gmail.com>
> > ---
> >  dist/tpm2-abrmd.service.in | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/dist/tpm2-abrmd.service.in b/dist/tpm2-abrmd.service.in
> > index 00aa031..4300cb3 100644
> > --- a/dist/tpm2-abrmd.service.in
> > +++ b/dist/tpm2-abrmd.service.in
> > @@ -1,5 +1,7 @@
> >  [Unit]
> >  Description=3DTPM2 Access Broker and Resource Management Daemon
> > +After=3Dsystemd-udev-settle.service
> > +Requires=3Dsystemd-udev-settle.service
> >
> >  [Service]
> >  Type=3Ddbus
> >
>
--===============0320961494162783780==--

