Content-Type: multipart/mixed; boundary="===============0090815197949915276=="
MIME-Version: 1.0
From: parimalanitesh at gmail.com
Subject: [tpm2] TPM2 PKCS11 intergration error for Openstack Barbican
Date: Mon, 09 Aug 2021 14:34:54 +0000
Message-ID: <20210809143454.2797.189@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0090815197949915276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Everyone,

This is Nitesh. I'm working on integrating TPM as a backend to store keys f=
or Openstack Barbican project.

Existing PKCS11 Crytpo Plugin procedure to generate the hmac and mkek is ht=
tps://docs.openstack.org/barbican/stein/install/barbican-backend.html#pkcs-=
11-crypto-plugin.

I'm trying to integrate TPM as backend with TPM2-PKCS11 package for Opensta=
ck Barbican. https://github.com/tpm2-software/tpm2-pkcs11

When i try to run "barbican-manage  hsm gen_hmac --library-path /usr/lib64/=
pkcs11/libtpm2_pkcs11.so.0 --passphrase stack --slot-id 1 --label my_hmac_l=
abel"
ERROR: cannot load library '/usr/lib64/pkcs11/libtpm2_pkcs11.so.0': /usr/li=
b64/libtss2-fapi.so.1: undefined symbol: Esys_TRSess_GetAuthRequired.  Addi=
tionally, ctypes.util.find_library() did not manage to locate a library cal=
led '/usr/lib64/pkcs11/libtpm2_pkcs11.so.0'

I don't know why i'm getting the error message.
Following are the packages which i've installed

libtss2-esys0-2.3.0-2.41.x86_64
libtss2-tctildr0-2.3.0-2.41.x86_64
libtss2-tcti-tabrmd0-2.0.2-12.18.x86_64
libtss2-fapi1-3.1.0-lp152.116.2.x86_64
libtss2-rc0-2.3.0-2.41.x86_64
tpm2-0-tss-2.3.0-2.41.x86_64
libtss2-mu0-2.3.0-2.41.x86_64
libtss2-tcti-device0-2.3.0-2.41.x86_64
tpm2-tss-engine-1.0.1-2.8.x86_64
libtss2-fapi0-2.4.5-1.11.x86_64
libtss2-sys0-2.3.0-2.41.x86_64
libtss2-tcti-mssim0-2.3.0-2.41.x86_64
libtss2-sys1-3.1.0-lp152.116.2.x86_64
tpm2-pkcs11-tool-1.6.0+git20210503.c2d53cc-lp152.6.1.noarch
tpm2.0-abrmd-2.0.2-12.18.x86_64
tpm2-pkcs11-1.6.0+git20210503.c2d53cc-lp152.6.1.x86_64
tpm2.0-tools-4.1-1.57.x86_64
tpm-tools-pkcs11-1.3.9.1-4.3.1.x86_64
tpm2-pkcs11-tool-1.6.0+git20210503.c2d53cc-lp152.6.1.noarch
openssl-ibmpkcs11-1.0.1-3.6.x86_64
libpkcs11-helper1-1.27.0+git20201117.9fa1503-lp152.38.1.x86_64
pkcs11-helper-1.27.0+git20201117.9fa1503-lp152.38.1.x86_64

Did i miss any package or any other configuration is required ?

I've debugged the error  to some extent.
Actually "Esys_TRSess_SetAttributes" is a function which is giving the erro=
r at https://github.com/tpm2-software/tpm2-tss/blob/master/src/tss2-fapi/fa=
pi_util.c#L2061
But that function defination is actually present in "https://github.com/tpm=
2-software/tpm2-tss/blob/5c178b2b61a05e1873be30cfeb4629bba5be900d/include/t=
ss2/tss2_esys.h" and "https://github.com/tpm2-software/tpm2-tss/blob/928897=
0a3e657cdee85d08d3813199ec864de3ad/src/tss2-esys/esys_tr.c"

I see "tss2_esys.h" is not included as a header file in  "https://github.co=
m/tpm2-software/tpm2-tss/blob/master/src/tss2-fapi/fapi_util.c."

Please let me know what i've to do to resolve this issue.

--
Regard's

Nitesh
--===============0090815197949915276==--

