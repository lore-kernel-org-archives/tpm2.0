Content-Type: multipart/mixed; boundary="===============1517765069196288436=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: =?utf-8?q?=5Btpm2=5D_Re=3A_How_can_I_use_a_persisted_object_without_it?=
 =?utf-8?q?=E2=80=99s_primary_key=3F?=
Date: Thu, 06 May 2021 08:06:39 +0000
Message-ID: <AM8P194MB16754C4A05DE2F394660D7B0A6589@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: D0FC0D15-722A-4ED9-BD61-EE80C0BCC649@rowan.moul.ca
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1517765069196288436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Persistent keys inside the TPM are not encrypted with their parent anymore.
Only with a TPM-internal flash-encryption that you do not have to care abou=
t.

________________________________________
Von: Rowan Moul <lists(a)rowan.moul.ca>
Gesendet: Donnerstag, 6. Mai 2021 07:17
An: tpm2(a)lists.01.org
Betreff: [tpm2] How can I use a persisted object without it=E2=80=99s prima=
ry key?

Hello,
I=E2=80=99m just trying to get a better sense of how the TPM storage hierar=
chy works.

Say I create a primary key under the owner hierarchy, and then I create a s=
igning key under that. I persist the signing key with tpm2_evictcontrol but=
 I do NOT persist the primary key.
How am I able to use the signing key on subsequent boots without the primar=
y key existing in the TPM memory? Isn=E2=80=99t it needed to decrypt the si=
gning key? Or is the persisted signing key not encrypted by the primary key=
 when it resides inside the TPM hardware?

Thanks,

Rowan
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============1517765069196288436==--

