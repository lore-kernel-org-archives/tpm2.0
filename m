Content-Type: multipart/mixed; boundary="===============3152696814438154098=="
MIME-Version: 1.0
From: Ignacio Jaureguiberry <ignaciox.jaureguiberry at intel.com>
Subject: [tpm2] OpenSSL TLS using tpm2-pkcs11 doesn't work on newer versions
Date: Wed, 22 Jan 2020 18:35:55 +0000
Message-ID: <20200122183555.2993.88054@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3152696814438154098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I was trying to make wpa_supplicant use a tpm2-pkcs11 stored private key to=
 authenticate against a RADIUS server, I mentioned about it on this discuss=
ion: https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/message/AYUBC=
AFCCXITEVSWA4IFC466LYS6ZIYX/

With some fixes on tpm2-pkcs11, TLS is working and there is an integration =
test for that here: https://github.com/tpm2-software/tpm2-pkcs11/blob/maste=
r/test/integration/tls-tests.sh

I wasn't able to reproduce this on Ubuntu 18, and noted that the test cases=
 ran on top of an Ubuntu 16.04 image. I tried Ubuntu 16.04 and TLS works as=
 in the integration test. I also checked that using latest version of wpa_s=
upplicant, it does work with tpm2-pkcs11 and creates an EAP-TLS connection =
using the TPM.

I've debugged a bit in both OS versions and found that openssl is calling p=
key_rsa_sign with different padding modes: RSA_PKCS1_PADDING in Ubuntu 16, =
and RSA_PKCS1_PSS_PADDING in Ubuntu 18. The consequence is that in tpm2-pkc=
s11, sign_init is being called using CKM_RSA_PKCS as mechanism on Ubuntu 16=
, but in Ubuntu 18 it is being called with CKM_RSA_X_509, which is not supp=
orted.

I think I have to file a bug to OpenSSL, but I don't know too much about th=
e PKCS11 specs to support the claims. I'd appreciate any help to file a dec=
ent issue. Also, any workaround is welcome, as replacing OpenSSL in any dis=
tribution is very hard given all the software that depends on it.
--===============3152696814438154098==--

