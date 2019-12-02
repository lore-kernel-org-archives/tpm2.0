Content-Type: multipart/mixed; boundary="===============7806836281124574793=="
MIME-Version: 1.0
From: Tricca, Philip B <philip.b.tricca at intel.com>
Subject: [tpm2] Re: [tpm2][tpm2-abrmd]tpm2-abrmd.service may run before udev
 rule.
Date: Mon, 02 Dec 2019 04:55:12 +0000
Message-ID: <DB638850A6A2434A93ECADDA0BC838909CEE341D@ORSMSX104.amr.corp.intel.com>
In-Reply-To: CAOCvsSn3sd9=DhHTTeVrDOVwPYKDPZu37ZBoswUahJLY4vB4bg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7806836281124574793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Any chance I can get a PR on github? I can pull the patch directly if you p=
refer but no guarantees I'll get all of the metadata right.

-----Original Message-----
From: Steven Clark [mailto:davolfman(a)gmail.com] =

Sent: 27 November, 2019 14:27
To: tpm2(a)lists.01.org
Subject: [tpm2] [tpm2][tpm2-abrmd]tpm2-abrmd.service may run before udev ru=
le.

I've created a situation where systemd starts with most of the root filesys=
tem in disk cache already (as a side effect) and discovered that tpm2-abrmd=
.service has no After or Requires directives.  Systemd was running tpm2-abr=
md,service before the udev rule had chowned the tpm device and as a result =
it was hanging until the 5-second restart countdown finished.  The followin=
g patch fixed it for me, by forcing the resource manager to wait until udev=
 settled.  Patch is against
2.2.0 but should be easy to port.

---
 dist/tpm2-abrmd.service.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dist/tpm2-abrmd.service.in b/dist/tpm2-abrmd.service.in index =
00aa031..4300cb3 100644
--- a/dist/tpm2-abrmd.service.in
+++ b/dist/tpm2-abrmd.service.in
@@ -1,5 +1,7 @@
 [Unit]
 Description=3DTPM2 Access Broker and Resource Management Daemon
+After=3Dsystemd-udev-settle.service
+Requires=3Dsystemd-udev-settle.service

 [Service]
 Type=3Ddbus
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org %(web_page_url)sl=
istinfo%(cgiext)s/%(_internal_name)s
--===============7806836281124574793==--

