Content-Type: multipart/mixed; boundary="===============1883744870715144314=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: OpenSSL TLS using tpm2-pkcs11 doesn't work on newer
 versions
Date: Thu, 23 Jan 2020 14:43:34 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E787D2@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200122183555.2993.88054@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1883744870715144314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Ignacio Jaureguiberry [mailto:ignaciox.jaureguiberry(a)intel.com]
> Sent: Wednesday, January 22, 2020 12:36 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] OpenSSL TLS using tpm2-pkcs11 doesn't work on newer versi=
ons
> =

> I was trying to make wpa_supplicant use a tpm2-pkcs11 stored private key =
to
> authenticate against a RADIUS server, I mentioned about it on this discus=
sion:
> https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/message/AYUBCAFC=
CXITEV
> SWA4IFC466LYS6ZIYX/
> =

> With some fixes on tpm2-pkcs11, TLS is working and there is an integratio=
n test
> for that here: https://github.com/tpm2-software/tpm2-
> pkcs11/blob/master/test/integration/tls-tests.sh
> =

> I wasn't able to reproduce this on Ubuntu 18, and noted that the test cas=
es ran
> on top of an Ubuntu 16.04 image. I tried Ubuntu 16.04 and TLS works as in=
 the
> integration test. I also checked that using latest version of wpa_supplic=
ant, it
> does work with tpm2-pkcs11 and creates an EAP-TLS connection using the TP=
M.

Increasing our distro coverage is definitely something I need/want to do fo=
r tpm2-pkcs11.
I already did this for many of the other tpm2 projects like tpm2-tools and =
tpm2-tss.

> =

> I've debugged a bit in both OS versions and found that openssl is calling
> pkey_rsa_sign with different padding modes: RSA_PKCS1_PADDING in Ubuntu
> 16, and RSA_PKCS1_PSS_PADDING in Ubuntu 18. The consequence is that in

This seems like a good change, IIUC PKCS1 padding has some known issues, so=
 changing
To PSS is a good move.

> tpm2-pkcs11, sign_init is being called using CKM_RSA_PKCS as mechanism on
> Ubuntu 16, but in Ubuntu 18 it is being called with CKM_RSA_X_509, which =
is not
> supported.

CKM_RSA_X_509 is supported, it's raw RSA encryption and AFAICT it's been su=
pported
since release 1.0. If it's signing with raw RSA, It must apply the PSS padd=
ing
separately. Which it does looking at OSSL 1_1_1 code:

-- code ---
        } else if (rctx->pad_mode =3D=3D RSA_PKCS1_PSS_PADDING) {
            if (!setup_tbuf(rctx, ctx))
                return -1;
            if (!RSA_padding_add_PKCS1_PSS_mgf1(rsa,
                                                rctx->tbuf, tbs,
                                                rctx->md, rctx->mgf1md,
                                                rctx->saltlen))
                return -1;
            ret =3D RSA_private_encrypt(RSA_size(rsa), rctx->tbuf,
                                      sig, rsa, RSA_NO_PADDING);
---

So this makes sense to what you're seeing hitting the pkey_rsa_sign versus =
the calls hitting
pkcs11 C_SignInit.

> =

> I think I have to file a bug to OpenSSL, but I don't know too much about =
the
> PKCS11 specs to support the claims. I'd appreciate any help to file a dec=
ent issue.
> Also, any workaround is welcome, as replacing OpenSSL in any distribution=
 is very
> hard given all the software that depends on it.

Probably not, it's probably something we need to fix in the pkcs11 library =
which is
very much an under development project. We should try and replicate the bug
first, and deduce that it is their bug before we file. We don't want to cry=
 wolf here.

I would capture the parameters going into the C_SignInit and subsequent C_S=
ign calls
and create a test in test/integration/pkcs-crypt.int.c that reproduces the =
error.

If you get me the inputs soon, I can develop this test and get a fix out. I=
 am out
all next week Jan 27-Jan31.

Another great way to debug deeper is both pkcs11spy and setting the env var=
iable
"export TPM2_PKCS11_DEBUG_LOG=3D2" to get verbose logs out of the tpm2-pkcs=
11
Library. You can find the pkcs11spy project at:
https://github.com/OpenSC/OpenSC/wiki/Using-OpenSC

Also, specifying versions of OSSL and tpm2-pkcs11 as well as more logs and =
specific error messages you share,
the easier it will be for us to help debug.

Thanks,
Bill

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============1883744870715144314==--

