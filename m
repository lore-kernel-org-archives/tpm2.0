Content-Type: multipart/mixed; boundary="===============7199955514428786498=="
MIME-Version: 1.0
From: Steffen Schwebel <s.schwebel at uvensys.de>
Subject: [tpm2] Re: Save Hash to TPM Memory
Date: Sun, 09 Feb 2020 23:53:50 +0100
Message-ID: <82de9825-b716-c77e-6033-f9935625fafb@uvensys.de>
In-Reply-To: CAGkJ=LH0rnTyjXvkT_hhKs_ZAoz1baD71Q6PhS=yjLFubWDaLA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7199955514428786498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

take a look at nvwrite. you might need to define the nv first with nvdefine.

https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_nvdefine.1=
.md
https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_nvwrite.1.=
md

Chapter 11 from the Guide should also be helpful

https://link.springer.com/content/pdf/10.1007%2F978-1-4302-6584-9.pdf

regards,
Steffen Schwebel


On 2/9/20 11:29 PM, Ben Saunders wrote:
> Hi guys,
>
> I would like some help if at all=C2=A0possible. I'm fairly new to the TPM
> but have been able to get some stuff working like the
> following:https://gist.github.com/dnoliver/04364e72d8b81368f72ad4e6896f68=
8d
>
> I want to save and load an sha256sum of an important file to check if
> its been modified
>
> If I run: sha256sum importantfile.txt i get:
> aea86e3c73495f205929cfebba0d63f1382c8ac59be081b6351681415f4063cf
> =C2=A0importantfile.txt
>
> I would like to save the sum into the TPM and quickly=C2=A0retrieve it and
> update it when necessary.I think with a session would be appropriate.=C2=
=A0
>
> Any help would be appreciated, thankyou so much
>
> Ben
>
>
> -- =

> Ben Saunders
> 0421 935 776
>
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

--===============7199955514428786498==--

