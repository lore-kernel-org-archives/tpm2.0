Content-Type: multipart/mixed; boundary="===============3779623169644715037=="
MIME-Version: 1.0
From: Steffen Schwebel <s.schwebel at uvensys.de>
Subject: [tpm2] Re: OpenSSL TLS using tpm2-pkcs11 doesn't work on newer
 versions
Date: Fri, 24 Jan 2020 09:53:46 +0100
Message-ID: <5e20e86f-d193-c57d-2c70-e67efef9a51d@uvensys.de>
In-Reply-To: 20200122183555.2993.88054@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3779623169644715037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

another way to get this working would be to avoid tpm2-pkcs11 entirely.

Both wpa_supplicant and NetworkManager have versions working with
tpm2-tss-engine already.
For NetworkManager that should be any version > 1.20 and for
wpa_supplicant, its in the current development branch.

Although that might be no fun at all as well with older Ubuntu versions.

regards,
Steffen

On 1/22/20 7:35 PM, Ignacio Jaureguiberry wrote:
> I was trying to make wpa_supplicant use a tpm2-pkcs11 stored private key =
to authenticate against a RADIUS server, I mentioned about it on this discu=
ssion: https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/message/AYU=
BCAFCCXITEVSWA4IFC466LYS6ZIYX/
>
> With some fixes on tpm2-pkcs11, TLS is working and there is an integratio=
n test for that here: https://github.com/tpm2-software/tpm2-pkcs11/blob/mas=
ter/test/integration/tls-tests.sh
>
> I wasn't able to reproduce this on Ubuntu 18, and noted that the test cas=
es ran on top of an Ubuntu 16.04 image. I tried Ubuntu 16.04 and TLS works =
as in the integration test. I also checked that using latest version of wpa=
_supplicant, it does work with tpm2-pkcs11 and creates an EAP-TLS connectio=
n using the TPM.
>
> I've debugged a bit in both OS versions and found that openssl is calling=
 pkey_rsa_sign with different padding modes: RSA_PKCS1_PADDING in Ubuntu 16=
, and RSA_PKCS1_PSS_PADDING in Ubuntu 18. The consequence is that in tpm2-p=
kcs11, sign_init is being called using CKM_RSA_PKCS as mechanism on Ubuntu =
16, but in Ubuntu 18 it is being called with CKM_RSA_X_509, which is not su=
pported.
>
> I think I have to file a bug to OpenSSL, but I don't know too much about =
the PKCS11 specs to support the claims. I'd appreciate any help to file a d=
ecent issue. Also, any workaround is welcome, as replacing OpenSSL in any d=
istribution is very hard given all the software that depends on it.
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
Robert-Bosch-Stra=C3=9Fe 4b =

35440 Linden

HRB: AG Friedberg, 7780
USt-Id: DE282879294

Gesch=C3=A4ftsf=C3=BChrer:
Dr. Thomas Licht, t.licht(a)uvensys.de
Volker Lieder, v.lieder(a)uvensys.de

Mail: info(a)uvensys.de
Internet: www.uvensys.de

Durchwahl: 06403 - 789 3622
Hotline: 06403 - 789 3688
Zentrale: 06403- 789 360
Fax: 06403 - 789 3699
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

--===============3779623169644715037==--

