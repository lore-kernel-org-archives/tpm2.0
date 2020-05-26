Content-Type: multipart/mixed; boundary="===============8627479437293257879=="
MIME-Version: 1.0
From: Steffen Schwebel <s.schwebel at uvensys.de>
Subject: [tpm2] Re: Trying to decrypt a file encrypted with a TPM.
Date: Tue, 26 May 2020 10:53:27 +0200
Message-ID: <42e0a302-1d1a-60ab-b613-6ef6a5d1c680@uvensys.de>
In-Reply-To: 20200526084633.2859.35927@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8627479437293257879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You dont need TPM in this scenario.

What would work would be to generate a private / public key pair with
TPM on Computer A.

Then, you could use that public key on Computer B to encrypt some data.
That way only the TPM on A could decrypt that file again.

Best regards,
Steffen

On 5/26/20 10:46 AM, oscargomezf(a)gmail.com wrote:
> Thank you for your help.
>
> Therefore, if I generate a public and a private rsa2048 key with gpg in a=
 Computer (A) (Linux platform), How can I encrypt a file with this public k=
ey with a TPM in another Computer (B) for sending to the computer A in orde=
r to be decrypted?
>
> Could I be able to do that?
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

--===============8627479437293257879==--

