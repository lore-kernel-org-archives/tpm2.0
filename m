Content-Type: multipart/mixed; boundary="===============4193666013481212857=="
MIME-Version: 1.0
From: Steffen Schwebel <s.schwebel at uvensys.de>
Subject: [tpm2] Re: TPM within Containers
Date: Thu, 12 Nov 2020 09:14:32 +0100
Message-ID: <17a961c7-b742-69b3-040b-8d6a077ca10f@uvensys.de>
In-Reply-To: 20201112013022.2865.84931@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4193666013481212857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Although I havent really looked into this, Id assume you would need to
expose the device to the container, like you would do with any other

Alternatively, assuming your USB device is available with drivers working, =
etc. on the host in /dev/bus/usb, you can mount this in the container using=
 privileged mode and the volumes option. For example:

docker run -t -i --privileged -v /dev/bus/usb:/dev/bus/usb ubuntu bash

So, maybe something along the lines of

docker run -t -i --privileged -v /dev/tpm0:/dev/tpm0 ubuntu bash

might be=C2=A0 worthwile to take a look at

Regards,
Steffen Schwebel


On 11/12/20 2:30 AM, Eduardo Falc=C3=A3o wrote:
> Hello everyone
>
> Does anyone know any tutorial to deploy TPM-enabled containers? =

> I was looking for some example with vTPM, instead of simulation tools lik=
e IBM and others.
> In addition, it seems that enabling IMA in containers is a challenging ta=
sk...
> I came across 2 papers, "Container-IMA: A privacy-preserving Integrity Me=
asurement Architecture for Containers" and " Integrity verification of dock=
er containers for a lightweight cloud environment", but there is no tutoria=
l on how to deploy such a container.
>
> Any help is appreciated.
>
> Best regards.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

-- =

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

Durchwahl: 06403 789 36 22 =

Hotline: 06403 789 36 88
Zentrale: 06403 789 36 00
Fax: 06403 789 36 99
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

--===============4193666013481212857==--

