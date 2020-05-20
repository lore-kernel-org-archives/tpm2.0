Content-Type: multipart/mixed; boundary="===============2979731121506026186=="
MIME-Version: 1.0
From: Steffen Schwebel <s.schwebel at uvensys.de>
Subject: [tpm2] Re: Trying to decrypt a file encrypted with a TPM.
Date: Wed, 20 May 2020 13:50:23 +0200
Message-ID: <968ed6e9-9e8a-96be-0e35-84fe318cbba2@uvensys.de>
In-Reply-To: 20200520093354.2843.3259@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2979731121506026186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

With asymmetric keys, you encrypt something with the public key.

You need the public key of the recipient and encrypt with it.
That way only the keeper of the private key can decrypt it.

You wont be able to decrypt that file anywhere else, except on that
system...

On 5/20/20 11:33 AM, oscargomezf(a)gmail.com wrote:
> Hi everyone,
>
> I have encrypted a file using a TPM with the following commands:
>
> tpm2_createprimary -c primary.ctx
> tpm2_create -C primary.ctx -Grsa2048 -u key.pub -r key.priv
>
> tpm2_flushcontext -t
>
> tpm2_load -C primary.ctx -u key.pub -r key.priv -c key.ctx
> echo "my message" > msg.dat
> tpm2_rsaencrypt -c key.ctx -o msg.enc msg.dat
>
> Therefore, I am able to encrypt the file msg.dat to msg.enc. And I have t=
he following keys:
>
> 1. primary.ctx
> 2. key.pub
> 3. key.priv
> 4. key.ctx
>
> So far so good. However, I need to decrypt the file in msg.enc in another=
 embedded system (Linux platform) without a TPM.
>
> How can I do that? What tools do I need to use?
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

--===============2979731121506026186==--

