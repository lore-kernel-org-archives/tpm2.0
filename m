Content-Type: multipart/mixed; boundary="===============6100154693651873888=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] [tpm2][tpm2-abrmd]tpm2-abrmd.service may run before udev rule.
Date: Wed, 27 Nov 2019 14:27:22 -0800
Message-ID: <CAOCvsSn3sd9=DhHTTeVrDOVwPYKDPZu37ZBoswUahJLY4vB4bg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6100154693651873888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've created a situation where systemd starts with most of the root
filesystem in disk cache already (as a side effect) and discovered
that tpm2-abrmd.service has no After or Requires directives.  Systemd
was running tpm2-abrmd,service before the udev rule had chowned the
tpm device and as a result it was hanging until the 5-second restart
countdown finished.  The following patch fixed it for me, by forcing
the resource manager to wait until udev settled.  Patch is against
2.2.0 but should be easy to port.

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
--===============6100154693651873888==--

