Content-Type: multipart/mixed; boundary="===============3120994002495680993=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Trying to decrypt a file encrypted with a TPM.
Date: Wed, 20 May 2020 15:08:14 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EEFED1@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 968ed6e9-9e8a-96be-0e35-84fe318cbba2@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3120994002495680993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The TPM follows the true meanings of RSA Encrypt and RSA Decrypt:

RSA Encrypt: Do math with public key
RSA Decrypt: Do math with private key

So you feed one into encrypt then decrypt or vice versa depending on what
Properties you want.

Encrypt to Decrypt: You want to send something only the private key holder =
can
Access. For instance, you want to furlough a symmetric key from a server, y=
ou
Could encrypt the key with the clients public key (RSA Encrypt) and then se=
nd
It to the client. The client would then call RSA Decrypt. This pattern give=
s you
privacy. Note there is no forward secrecy here like if you do other, better
ways of key exchange. This is just an example.

Decrypt to Encrypt: This is for verifying the authenticity of a message. Th=
ink signing.
You get a hash, perform RSA Decrypt (math with private key), and append tha=
t to the
Message. Now someone wants to make sure it's from you and not tampered with,
They use your public key, perform RSA Encrypt (math with public key) and ge=
t the
Expected hash of the message. They then compare that to a hash they calcula=
te. =


RSA Encrypt is supported by the TPM as a helper. You don't really need to u=
se the
TPM because it's with the public key, it can just be done anywhere as the p=
ublic
Key is public.

Hopefully this clears it up.


> -----Original Message-----
> From: Steffen Schwebel [mailto:s.schwebel(a)uvensys.de]
> Sent: Wednesday, May 20, 2020 6:50 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Trying to decrypt a file encrypted with a TPM.
> =

> With asymmetric keys, you encrypt something with the public key.
> =

> You need the public key of the recipient and encrypt with it.
> That way only the keeper of the private key can decrypt it.
> =

> You wont be able to decrypt that file anywhere else, except on that syste=
m...
> =

> On 5/20/20 11:33 AM, oscargomezf(a)gmail.com wrote:
> > Hi everyone,
> >
> > I have encrypted a file using a TPM with the following commands:
> >
> > tpm2_createprimary -c primary.ctx
> > tpm2_create -C primary.ctx -Grsa2048 -u key.pub -r key.priv
> >
> > tpm2_flushcontext -t
> >
> > tpm2_load -C primary.ctx -u key.pub -r key.priv -c key.ctx echo "my
> > message" > msg.dat tpm2_rsaencrypt -c key.ctx -o msg.enc msg.dat
> >
> > Therefore, I am able to encrypt the file msg.dat to msg.enc. And I have=
 the
> following keys:
> >
> > 1. primary.ctx
> > 2. key.pub
> > 3. key.priv
> > 4. key.ctx
> >
> > So far so good. However, I need to decrypt the file in msg.enc in anoth=
er
> embedded system (Linux platform) without a TPM.
> >
> > How can I do that? What tools do I need to use?
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email to
> > tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =

> --
> Steffen Schwebel
> Mail: s.schwebel(a)uvensys.de
> uvensys GmbH
> =

> Firmensitz und Sitz der Gesellschaft:
> uvensys GmbH
> Schorbachstra=C3=9Fe 11
> 35510 Butzbach
> =

> HRB: AG Friedberg, 7780
> USt-Id: DE282879294
> =

> Gesch=C3=A4ftsf=C3=BChrer:
> Dr. Thomas Licht, t.licht(a)uvensys.de
> Volker Lieder, v.lieder(a)uvensys.de
> =

> Mail: info(a)uvensys.de
> Internet: www.uvensys.de
> =

> Durchwahl: 06033 - 18 19 225
> Hotline: 06033 - 18 19 288
> Zentrale: 06033 - 18 19 20
> Fax: 06033 - 18 19 299
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> Jegliche Stellungnahmen und Meinungen dieser E-Mail sind alleine die des =
Autors
> und nicht notwendigerweise die der Firma. Falls erforderlich, k=C3=B6nnen=
 Sie eine
> gesonderte schriftliche Best=C3=A4tigung anfordern.
> =

> Any views or opinions presented in this email are solely those of the aut=
hor and
> do not necessarily represent those of the company. If verification is req=
uired
> please request a hard-copy version.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============3120994002495680993==--

