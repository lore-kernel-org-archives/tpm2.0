Content-Type: multipart/mixed; boundary="===============6262707503609777202=="
MIME-Version: 1.0
From: Jerry Snitselaar <jsnitsel at redhat.com>
Subject: [tpm2] tpm2-tools, tpm2-pkcs11, and OpenSSL 3.0
Date: Mon, 24 May 2021 14:34:50 -0700
Message-ID: <87mtsjn7d1.fsf@redhat.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6262707503609777202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Both tpm2-tools and tpm2-pkcs11 make use of some functions that are
being deprecated in openssl 3.0. Are there plans to move away from using
those deprecated functions? Currently tpm2-tools will build with
-Wno-error=3Ddeprecated-declarations, but tpm2-pkcs11 trips over
EVP_PKEY_get0_EC_KEY now returning a const EC_KEY *, and ECDSA_do_verify
taking a non const parameter. Someone suggested doing something like:

       EVP_PKEY_CTX    *pctx =3D NULL;
       if ((pctx =3D EVP_PKEY_CTX_new(pkey, NULL)) =3D=3D NULL) {
               goto fail;
       }

       if (EVP_PKEY_verify_init(pctx) !=3D 1 ||
           EVP_PKEY_verify(pctx, sigbuf, siglen,
           dgstbuf, dgstlen) !=3D 1) {
               goto fail;
       }
 fail:
       EVP_PKEY_CTX_free(pctx);


but I imagine the ASN.1 framing stuff mentioned in do_sig_verify_ec()
would still be an issue, yes? I don't know openssl, so I don't know
if you could get away with casting the pointer to EC_KEY *.

There is work going on to support openssl 3.0 in RHEL9, so this came up.

Regards,
Jerry

--===============6262707503609777202==--

