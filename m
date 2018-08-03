Content-Type: multipart/mixed; boundary="===============3237585313391392354=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: [tpm2] tpm2-tools 3.0.5 release candidate 0
Date: Fri, 03 Aug 2018 18:31:09 +0200
Message-ID: <ae7c3444-044c-a048-c023-c00fe6827dca@redhat.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3237585313391392354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I've just tagged and signed a -rc0 for tpm2-tools 3.0.5. It contains a coup=
le
of fixes backported from the 3.X branch. These are the following:

* Fix inclusion of object attribute specifiers section in tpm2_create and
  tpm2_createprimary man pages.
* Use better object attribute defaults for authentication, preventing an em=
pty
  password being used for authentication when a policy is set.

  https://github.com/tpm2-software/tpm2-tools/releases/tag/3.0.5-rc0

Please test. If there aren't reported issues, I'll do a final release in a =
week.

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============3237585313391392354==--

