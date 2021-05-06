Content-Type: multipart/mixed; boundary="===============4036146680426593049=="
MIME-Version: 1.0
From: Rowan Moul <lists at rowan.moul.ca>
Subject: =?utf-8?q?=5Btpm2=5D_How_can_I_use_a_persisted_object_without_it=E2=80=99?=
 =?utf-8?q?s_primary_key=3F?=
Date: Wed, 05 May 2021 23:17:30 -0600
Message-ID: <D0FC0D15-722A-4ED9-BD61-EE80C0BCC649@rowan.moul.ca>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4036146680426593049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
--===============4036146680426593049==--

