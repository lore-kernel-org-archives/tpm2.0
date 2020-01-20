Content-Type: multipart/mixed; boundary="===============2594164912696778166=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Key Certification
Date: Mon, 20 Jan 2020 15:38:54 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E73DF1@ORSMSX101.amr.corp.intel.com>
In-Reply-To: c80c971b-a11c-35bf-5101-fc9db7593c88@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2594164912696778166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Steffen Schwebel [mailto:s.schwebel(a)uvensys.de]
> Sent: Saturday, January 18, 2020 2:11 PM
> To: tpm2 <tpm2(a)lists.01.org>
> Subject: [tpm2] Key Certification
> =

> Hello again,
> =

> so I played around with tpm2 tools some more.
> I managed to get TLS-EAP networking working with keys stored inside the c=
rypto
> chip
> =

> Now I would like to prove that the secret keys used are really stored ins=
ide.

The secret keys, as in AES or the private key as an asymmetric keypair like=
 RSA or EC?

The secret session key, AFAIK, is not stored in the TPM because it would be=
 way to slow.
Just the initial private key for the asymmetric setup for the session key i=
s stored in the TPM.

> If I understand it correctly,=C2=A0 I should be able to just sign keys st=
ored inside the
> TPM with the AIK I created in a previous step.
> =

> so, tpm2_load && tpm2_certify ?

Pretty much, you can certify that the private half of a public key is in th=
e TPM based on name.

> =

> except there seems to be no way to load the keys I created with tpm2tss-
> genkey, right?
> =

> =

> regards,
> Steffen
> =

> --
> Steffen Schwebel
> Mail: s.schwebel(a)uvensys.de
> uvensys GmbH
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============2594164912696778166==--

