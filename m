Content-Type: multipart/mixed; boundary="===============7363992382962526241=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
Date: Fri, 29 Nov 2019 14:54:35 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E48851@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20191128175350.2967.39835@new-ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7363992382962526241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Ignacio Jaureguiberry [mailto:ignaciox.jaureguiberry(a)intel.com]
> Sent: Thursday, November 28, 2019 11:54 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
> =

> I've ran wpa_supplicant through gdb (./configure --enable-debug on tpm2-
> pkcs11) and reached this point:
> =

> The function return CKR_MECHANISM_INVALID is common_init
> (src/lib/sign.c:212), called from C_SignInit (src/pkcs11.c:550). common_i=
nit calls
> is_mech_supported (src/lib/sign.c:95) with a CK_MECHANISM_TYPE=3D=3D3
> (CKM_RSA_X_509), but is_mech_supported returns false. Apparently, support=
ed
> mechanism are: CKM_RSA_PKCS, CKM_SHA1_RSA_PKCS,
> CKM_SHA256_RSA_PKCS, CKM_SHA384_RSA_PKCS, CKM_SHA512_RSA_PKCS,
> CKM_AES_CBC, CKM_ECDSA, CKM_ECDSA_SHA1.
> =

> Any idea what else to try?

I *think* it would come back supported. We populate each objects supported =
mechanisms in
the db:
https://github.com/tpm2-software/tpm2-pkcs11/blob/master/tools/tpm2_pkcs11/=
commandlets_keys.py#L181

and I populate those. What object was it using in C_SignInit?


> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============7363992382962526241==--

