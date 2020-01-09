Content-Type: multipart/mixed; boundary="===============7390004521864431360=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: some questions about Identity
Date: Thu, 09 Jan 2020 09:28:38 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163C46FE8@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: 18a6bd1e-30cb-2ed5-7f3d-f9ab40b8ed46@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7390004521864431360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

What you need are an EK-Certificate that identifies the TPM as original (by=
 TPM vendor)
and a Platform Certificate that assigns the TPM to a platform with serial n=
umber and stuff.

The former is typically available.
The latter is typically not provided yet; Sorry.

But keep us posted if you get hold of some Platform Certificates.

Cheers,
Andreas
________________________________________
From: Steffen Schwebel [s.schwebel(a)uvensys.de]
Sent: Thursday, January 09, 2020 09:34
To: tpm2
Subject: [tpm2] some questions about Identity

Hello,

Currently I'm helping a company to roll-out tpm2 support for their Linux
Laptops.
These are mainly Dell Laptops and they come with activate TPM and secure
boot.

Everything working nicely so far.
Right now Im looking for a way to confirm that the device is really the
one Dell provided to us.
Im still waiting for an answer on Dell for that but Im assuming it
should be possible to identify any given system by the Key the OEM deployed.

Am I correct in assuming that? What would be the correct way to do that?

I hope I'm asking this questions in the right mailing list.
This is my first message to the group.

Regards,
Steffen

--
Steffen Schwebel
Mail: s.schwebel(a)uvensys.de
uvensys GmbH

Firmensitz und Sitz der Gesellschaft:
uvensys GmbH
Schorbachstra=C3=9Fe 11
35510 Butzbach

HRB: AG Friedberg, 7780
USt-Id: DE282879294

Gesch=C3=A4ftsf=C3=BChrer:
Dr. Thomas Licht, t.licht(a)uvensys.de
Volker Lieder, v.lieder(a)uvensys.de

Mail: info(a)uvensys.de
Internet: www.uvensys.de

Durchwahl: 06033 - 18 19 225
Hotline: 06033 - 18 19 288
Zentrale: 06033 - 18 19 20
Fax: 06033 - 18 19 299
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

Jegliche Stellungnahmen und Meinungen dieser E-Mail sind
alleine die des Autors und nicht notwendigerweise die der
Firma. Falls erforderlich, k=C3=B6nnen Sie eine gesonderte
schriftliche Best=C3=A4tigung anfordern.

Any views or opinions presented in this email are solely
those of the author and do not necessarily represent those
of the company. If verification is required please request
a hard-copy version.

_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============7390004521864431360==--

