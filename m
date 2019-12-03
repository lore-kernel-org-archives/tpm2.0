Content-Type: multipart/mixed; boundary="===============4719370365154130886=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: [tpm2][tpm2-abrmd]tpm2-abrmd.service may run before udev
 rule.
Date: Tue, 03 Dec 2019 10:39:17 -0800
Message-ID: <CAOCvsS=0y0JSzqWOCdNHX+hUnb+iXBnTjFS9UD-0A_0QJi=WXw@mail.gmail.com>
In-Reply-To: CAOCvsSnV93zkxNYkdCSxnomzvQRHZKdpHZ8qF43WAjEO=HYB+Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4719370365154130886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Here's a full patch against 2.3.0, I decided against uploading to
github for now:

From c75d97443efadb8495087a777d06f3c0f5f43e87 Mon Sep 17 00:00:00 2001
From: Steven Clark <davolfman(a)gmail.com>
Date: Tue, 3 Dec 2019 01:39:28 +0000
Subject: [PATCH] Hold Resource Manager until tpm is accessible

In testing in an unusual boot scenario it was discovered that
tpm2-abrmd.service was starting before udev had changed ownership
of the TPM device from root to TSS.  This patch changes the
Systemd unit file to force a udev settle before starting the
resource manager service.
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
--===============4719370365154130886==--

