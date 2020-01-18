Content-Type: multipart/mixed; boundary="===============2108057389812911726=="
MIME-Version: 1.0
From: Steffen Schwebel <s.schwebel at uvensys.de>
Subject: [tpm2] Key Certification
Date: Sat, 18 Jan 2020 21:10:37 +0100
Message-ID: <c80c971b-a11c-35bf-5101-fc9db7593c88@uvensys.de>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2108057389812911726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello again,

so I played around with tpm2 tools some more.
I managed to get TLS-EAP networking working with keys stored inside the
crypto chip

Now I would like to prove that the secret keys used are really stored
inside.

If I understand it correctly,=C2=A0 I should be able to just sign keys stor=
ed
inside the TPM with the AIK I created in a previous step.

so, tpm2_load && tpm2_certify ?

except there seems to be no way to load the keys I created with
tpm2tss-genkey, right?


regards,
Steffen

-- =

Steffen Schwebel
Mail: s.schwebel(a)uvensys.de
uvensys GmbH

--===============2108057389812911726==--

