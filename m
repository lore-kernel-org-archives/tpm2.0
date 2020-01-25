Content-Type: multipart/mixed; boundary="===============2872574736275955084=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: OpenSSL TLS using tpm2-pkcs11 doesn't work on newer
 versions
Date: Sat, 25 Jan 2020 01:51:10 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E7BDB0@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 3b60420193894d54a80fbc66c162af8f@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2872574736275955084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Here's a somewhat proper fix:
https://github.com/tpm2-software/tpm2-pkcs11/pull/397

> -----Original Message-----
> From: Roberts, William C
> Sent: Friday, January 24, 2020 7:16 PM
> To: Jaureguiberry, IgnacioX <ignaciox.jaureguiberry(a)intel.com>;
> tpm2(a)lists.01.org
> Subject: RE: [tpm2] OpenSSL TLS using tpm2-pkcs11 doesn't work on newer
> versions
> =

> I was able to reproduce this by commenting out all the support for other
> algorithms:
> https://github.com/williamcroberts/tpm2-pkcs11/tree/force-raw-rsa
> =

> It dawned on my while eating dinner, that it was likely something where we
> needed to flip the RSA operations.
> The TPM adheres to the true definitions of RSA Encrypt and RSA Decrypt, a=
nd
> when you specify a C_Encrypt() call with A private key object, the code c=
alls
> TPM2_RSA_Encrypt() which is the RSA operation with the public key. Which =
the
> TPM Doesn't throw an error because the handle going to the TPM maps to the
> keypair and the TPM just does the right thing.
> =

> After doing the initial setup, if you swap the RSA encrypt/decrypt calls,=
 it works
> (see patch below).
> =

> We likely need to track and call the proper TPM RSA routines on what the
> operation is when it is RSA X509:
> =

> Key Class                  Interface       Operation
> CKO_PRIVATE      C_Decrypt    tpm_decrypt
> CKO_PUBLIC        C_Decrypt    tpm_encrypt
> CKO_PRIVATE     C_Encrypt        tpm_decrypt
> CKO_PUBLIC        C_Encrypt       tpm_encrypt
> =

> We'll need to get proper support in for this and a regression test perfor=
ming one
> half in the TPM and the other half With OpenSSL. Theirs already tests for
> CKM_RSA_X_509 in pkcs-crypt.int.c, so we likely just need to expand on th=
ose.
> =

> diff --git a/src/lib/tpm.c b/src/lib/tpm.c index f906ffbc584e..735151f016=
a7 100644
> --- a/src/lib/tpm.c
> +++ b/src/lib/tpm.c
> @@ -1836,7 +1836,7 @@ CK_RV tpm_encrypt(crypto_op_data *opdata,
>      tpm_encrypt_data *tpm_enc_data =3D opdata->tpm_enc_data;
> =

>      if (tpm_enc_data->is_rsa) {
> -        return tpm_rsa_encrypt(tpm_enc_data, ptext, ptextlen, ctext, cte=
xtlen);
> +        return tpm_rsa_decrypt(tpm_enc_data, ptext, ptextlen, ctext,
> + ctextlen);
>      }
> =

>      tpm_ctx *ctx =3D tpm_enc_data->ctx;
> @@ -1857,7 +1857,7 @@ CK_RV tpm_decrypt(crypto_op_data *opdata,
>      tpm_encrypt_data *tpm_enc_data =3D opdata->tpm_enc_data;
> =

>      if (tpm_enc_data->is_rsa) {
> -        return tpm_rsa_decrypt(tpm_enc_data, ctext, ctextlen, ptext, pte=
xtlen);
> +        return tpm_rsa_encrypt(tpm_enc_data, ctext, ctextlen, ptext,
> + ptextlen);
>      }
> =

>      tpm_ctx *ctx =3D tpm_enc_data->ctx;
> =

> > -----Original Message-----
> > From: Jaureguiberry, IgnacioX
> > Sent: Thursday, January 23, 2020 2:30 PM
> > To: Roberts, William C <william.c.roberts(a)intel.com>;
> > tpm2(a)lists.01.org
> > Subject: RE: [tpm2] OpenSSL TLS using tpm2-pkcs11 doesn't work on
> > newer versions
> >
> > I'm using tpm2-pkcs11 tag 1.0 because latest version requires python
> > 3.7 for the tpm2_ptool to work. This is a bit of work in both Ubuntu 16=
.04 and
> 18.04.
> >
> > I've upgraded to python3.7 in the Ubuntu 18.04 setup and then
> > installed tpm2-
> > pkcs11 to HEAD of master and it still shows the same error: C_SignInit
> > with mechanism CKM_RSA_X_509 returns
> CKR_KEY_FUNCTION_NOT_PERMITTED.
> >
> > -----Original Message-----
> > From: Roberts, William C
> > Sent: Thursday, January 23, 2020 4:33 PM
> > To: Jaureguiberry, IgnacioX <ignaciox.jaureguiberry(a)intel.com>;
> > tpm2(a)lists.01.org
> > Subject: RE: [tpm2] OpenSSL TLS using tpm2-pkcs11 doesn't work on
> > newer versions
> >
> > Backing up your TPM2_PKCS11_STORE, what happens if you bump
> > tpm2-pkcs11 to current master HEAD?
> >
> > Still fail?
> >
> > Bill
> >
> > > -----Original Message-----
> > > From: Jaureguiberry, IgnacioX
> > > Sent: Thursday, January 23, 2020 1:16 PM
> > > To: Roberts, William C <william.c.roberts(a)intel.com>;
> > > tpm2(a)lists.01.org
> > > Subject: RE: [tpm2] OpenSSL TLS using tpm2-pkcs11 doesn't work on
> > > newer versions
> > >
> > > These are the software versions on each setup. For the Ubuntu
> > > packages I'm putting the Ubuntu package and version, and also de
> > > project with its
> > version.
> > >
> > > On the Ubuntu 16.04:
> > > Bundled with Ubuntu:
> > > * libssl1.0.0 [1.0.2g-1] - openssl [1.0.2g]
> > > * libp11-2 [0.3.1-1] - libp11 [0.3.1]
> > > * libengine-pkcs11-openssl [0.2.1-1] - engine_pkcs11 [0.2.1]
> > >
> > > Tpm2 project libraries, built from sources:
> > > * tpm2-tss    [ git sha: eedaf1a - tag 2.3.2 ]
> > > * tpm2-abrmd  [ git sha: e275930 - tag 2.3.1 ]
> > > * tpm2-tools  [ git sha: c971982 - master    ]
> > > * tpm2-pkcs11 [ git sha: 7af62a4 - tag 1.0   ]
> > >
> > > On the Ubuntu 18.04 setup:
> > > Bundled with Ubuntu:
> > > * libssl1.1 [1.1.1-1ubuntu2.1] - openssl [1.1.1]
> > > * libengine-pkcs11-openssl [0.4.7-3] - libp11 [0.4.7]
> > > * opensc-pkcs11 [0.17.0-3] - opensc [0.17.0]
> > > * p11-kit-modules [0.23.9-2] - p11-kit [0.23.9]
> > >
> > > Tpm2 project libraries, built from sources:
> > > * tpm2-tss    [ git sha: eedaf1a - tag 2.3.2 ]
> > > * tpm2-tools  [ git sha: c971982 - master    ]
> > > * tpm2-pkcs11 [ git sha: 7af62a4 - tag 1.0   ]
> > >
> > > I'm sending the logs and function calls captured with pkcs11spy for e=
ach
> setup.
> > > The different mechanism in C_SignInit can be seen on them.
> > >
> > >
> > > -----Original Message-----
> > > From: Roberts, William C
> > > Sent: Thursday, January 23, 2020 11:44 AM
> > > To: Jaureguiberry, IgnacioX <ignaciox.jaureguiberry(a)intel.com>;
> > > tpm2(a)lists.01.org
> > > Subject: RE: [tpm2] OpenSSL TLS using tpm2-pkcs11 doesn't work on
> > > newer versions
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Ignacio Jaureguiberry
> > > > [mailto:ignaciox.jaureguiberry(a)intel.com]
> > > > Sent: Wednesday, January 22, 2020 12:36 PM
> > > > To: tpm2(a)lists.01.org
> > > > Subject: [tpm2] OpenSSL TLS using tpm2-pkcs11 doesn't work on
> > > > newer versions
> > > >
> > > > I was trying to make wpa_supplicant use a tpm2-pkcs11 stored
> > > > private key to authenticate against a RADIUS server, I mentioned
> > > > about it on this
> > > discussion:
> > > > https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/message/AYU
> > > > BC
> > > > AF
> > > > CCXITEV
> > > > SWA4IFC466LYS6ZIYX/
> > > >
> > > > With some fixes on tpm2-pkcs11, TLS is working and there is an
> > > > integration test for that here:
> > > > https://github.com/tpm2-software/tpm2-
> > > > pkcs11/blob/master/test/integration/tls-tests.sh
> > > >
> > > > I wasn't able to reproduce this on Ubuntu 18, and noted that the
> > > > test cases ran on top of an Ubuntu 16.04 image. I tried Ubuntu
> > > > 16.04 and TLS works as in the integration test. I also checked
> > > > that using latest version of wpa_supplicant, it does work with
> > > > tpm2-pkcs11 and creates an EAP-
> > > TLS connection using the TPM.
> > >
> > > Increasing our distro coverage is definitely something I need/want
> > > to do for tpm2-pkcs11.
> > > I already did this for many of the other tpm2 projects like
> > > tpm2-tools and tpm2- tss.
> > >
> > > >
> > > > I've debugged a bit in both OS versions and found that openssl is
> > > > calling pkey_rsa_sign with different padding modes:
> > > > RSA_PKCS1_PADDING in Ubuntu 16, and RSA_PKCS1_PSS_PADDING in
> > Ubuntu
> > > > 18. The consequence is that in
> > >
> > > This seems like a good change, IIUC PKCS1 padding has some known
> > > issues, so changing To PSS is a good move.
> > >
> > > > tpm2-pkcs11, sign_init is being called using CKM_RSA_PKCS as
> > > > mechanism on Ubuntu 16, but in Ubuntu 18 it is being called with
> > > > CKM_RSA_X_509, which is not supported.
> > >
> > > CKM_RSA_X_509 is supported, it's raw RSA encryption and AFAICT it's
> > > been supported since release 1.0. If it's signing with raw RSA, It
> > > must apply the PSS padding separately. Which it does looking at OSSL
> > > 1_1_1
> > code:
> > >
> > > -- code ---
> > >         } else if (rctx->pad_mode =3D=3D RSA_PKCS1_PSS_PADDING) {
> > >             if (!setup_tbuf(rctx, ctx))
> > >                 return -1;
> > >             if (!RSA_padding_add_PKCS1_PSS_mgf1(rsa,
> > >                                                 rctx->tbuf, tbs,
> > >                                                 rctx->md, rctx->mgf1m=
d,
> > >                                                 rctx->saltlen))
> > >                 return -1;
> > >             ret =3D RSA_private_encrypt(RSA_size(rsa), rctx->tbuf,
> > >                                       sig, rsa, RSA_NO_PADDING);
> > > ---
> > >
> > > So this makes sense to what you're seeing hitting the pkey_rsa_sign
> > > versus the calls hitting
> > > pkcs11 C_SignInit.
> > >
> > > >
> > > > I think I have to file a bug to OpenSSL, but I don't know too much
> > > > about the
> > > > PKCS11 specs to support the claims. I'd appreciate any help to
> > > > file a decent
> > > issue.
> > > > Also, any workaround is welcome, as replacing OpenSSL in any
> > > > distribution is very hard given all the software that depends on it.
> > >
> > > Probably not, it's probably something we need to fix in the pkcs11
> > > library which is very much an under development project. We should
> > > try and replicate the bug first, and deduce that it is their bug
> > > before we file. We don't want to cry wolf here.
> > >
> > > I would capture the parameters going into the C_SignInit and
> > > subsequent C_Sign calls and create a test in
> > > test/integration/pkcs-crypt.int.c that reproduces the error.
> > >
> > > If you get me the inputs soon, I can develop this test and get a fix
> > > out. I am out all next week Jan 27-Jan31.
> > >
> > > Another great way to debug deeper is both pkcs11spy and setting the
> > > env variable "export TPM2_PKCS11_DEBUG_LOG=3D2" to get verbose logs
> > > out of the
> > > tpm2-pkcs11 Library. You can find the pkcs11spy project at:
> > > https://github.com/OpenSC/OpenSC/wiki/Using-OpenSC
> > >
> > > Also, specifying versions of OSSL and tpm2-pkcs11 as well as more
> > > logs and specific error messages you share, the easier it will be for=
 us to help
> debug.
> > >
> > > Thanks,
> > > Bill
> > >
> > > > _______________________________________________
> > > > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an
> > > > email to tpm2-leave(a)lists.01.org
> > > > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============2872574736275955084==--

