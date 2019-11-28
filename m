Content-Type: multipart/mixed; boundary="===============6659273160309715268=="
MIME-Version: 1.0
From: Ignacio Jaureguiberry <ignaciox.jaureguiberry at intel.com>
Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
Date: Thu, 28 Nov 2019 17:53:50 +0000
Message-ID: <20191128175350.2967.39835@new-ml01.vlan13.01.org>
In-Reply-To: CAJ8N_u_uhXpof_H+gGcJzQTxXVDnkZgSpiH-QorsS5JAwfeEvQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6659273160309715268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've ran wpa_supplicant through gdb (./configure --enable-debug on tpm2-pkc=
s11) and reached this point:

The function return CKR_MECHANISM_INVALID is common_init (src/lib/sign.c:21=
2), called from C_SignInit (src/pkcs11.c:550). common_init calls is_mech_su=
pported (src/lib/sign.c:95) with a CK_MECHANISM_TYPE=3D=3D3 (CKM_RSA_X_509)=
, but is_mech_supported returns false. Apparently, supported mechanism are:=
 CKM_RSA_PKCS, CKM_SHA1_RSA_PKCS, CKM_SHA256_RSA_PKCS, CKM_SHA384_RSA_PKCS,=
 CKM_SHA512_RSA_PKCS, CKM_AES_CBC, CKM_ECDSA, CKM_ECDSA_SHA1.

Any idea what else to try?
--===============6659273160309715268==--

