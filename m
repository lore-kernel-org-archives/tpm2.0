Content-Type: multipart/mixed; boundary="===============7059993414806766563=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] [RFC] OpenSSL 3.0 Integration (tpm2-openssl) for Review
Date: Sun, 28 Feb 2021 23:27:16 +0100
Message-ID: <20210228232716.06E66D55@centrum.cz>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7059993414806766563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

As you probably already know, a new OpenSSL 3.0 is under development, which=
 will heavily change the API for integrating external cipher providers, suc=
h as the TPM2. "Engines" will be replaced by "Providers".

To pioneer this change I refactored the tpm2-tss-engine into a Provider, wh=
ich is now available as a new project:
https://github.com/tpm2-software/tpm2-openssl

It works with the latest OpenSSL master branch (to be openssl-3.0.0-alpha13=
) only.

The TPM2 Provider retains most functions of the TPM2 Engine (ECC is yet to =
be implemented) and preserves the 'TSS2 PRIVATE KEY' file format. In additi=
on to that, the new API enabled some cool features, such as signatures usin=
g a restricted signing key or a direct usage of handles to persistent keys.=
 A full list of currently available features is in the project README.md fi=
le.

Are there any other TPM2 features that should be available via the OpenSSL =
3.0?

Right now the OpenSSL 3.0 is in an "alfa" phase, which allows API changes. =
This is an ongoing opportunity for us to make sure the OpenSSL API has all =
the functions the TPM2 needs, because the integration is not always straigh=
tforward. Once a "beta" phase is reached only bug fixes will be allowed and=
 new features or breaking changes will have to wait. Thus, we should integr=
ate and test as much as we can before the OpenSSL feature freeze.

Please, review the README.md and/or test the Provider (project tpm2-openssl=
) and create a new GitHub Issue if you are missing something or if somethin=
g does not work as expected. Of course, other feedback is welcome too.


Kind Regards,
Petr
--===============7059993414806766563==--

