Content-Type: multipart/mixed; boundary="===============2844963799002731408=="
MIME-Version: 1.0
From: parimalanitesh at gmail.com
Subject: [tpm2] Re: TPM2 PKCS11 intergration error for Openstack Barbican
Date: Wed, 11 Aug 2021 10:16:50 +0000
Message-ID: <20210811101650.2797.57486@ml01.vlan13.01.org>
In-Reply-To: 20210810130133.2797.46387@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2844963799002731408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi All,

I didn't get the rpm for 3.1.x or 3.0.x =

I've got RPM for 2.4.5 version and i'm ending up with below error

()[root(a)e9ab983ac792 sles15_sp3]# barbican-manage hsm gen_hmac --library-=
path /usr/lib64/pkcs11/libtpm2_pkcs11.so.0 --passphrase stack --slot-id 1 -=
-label my_hmac_label

** (process:614): CRITICAL **: 09:58:20.157: failed to allocate dbus proxy =
object: Could not connect: No such file or directory
WARNING:tcti:src/tss2-tcti/tctildr.c:79:tcti_from_init() TCTI init for func=
tion 0x7f17e82582a0 failed with a0008
WARNING:tcti:src/tss2-tcti/tctildr.c:109:tcti_from_info() Could not initial=
ize TCTI named: tcti-abrmd
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not initia=
lize TCTI file: libtss2-tcti-tabrmd.so.0
WARNING:tcti:src/tss2-tcti/tcti-device.c:189:tcti_device_receive() The unde=
rlying IPC mechanism does not support asynchronous I/O. The 'timeout' param=
eter is set to TSS2_TCTI_TIMEOUT_BLOCK
WARNING:tcti:src/tss2-tcti/tcti-device.c:189:tcti_device_receive() The unde=
rlying IPC mechanism does not support asynchronous I/O. The 'timeout' param=
eter is set to TSS2_TCTI_TIMEOUT_BLOCK
WARNING:fapi:src/tss2-fapi/api/Fapi_List.c:226:Fapi_List_Finish() Profile o=
f path not provisioned: /HS/SRK
ERROR:fapi:src/tss2-fapi/api/Fapi_List.c:81:Fapi_List() ErrorCode (0x000600=
34) Entities_List
ERROR: Listing FAPI token objects failed.

** (process:614): CRITICAL **: 09:58:20.167: failed to allocate dbus proxy =
object: Could not connect: No such file or directory
WARNING:tcti:src/tss2-tcti/tctildr.c:79:tcti_from_init() TCTI init for func=
tion 0x7f17e82582a0 failed with a0008
WARNING:tcti:src/tss2-tcti/tctildr.c:109:tcti_from_info() Could not initial=
ize TCTI named: tcti-abrmd
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not initia=
lize TCTI file: libtss2-tcti-tabrmd.so.0
ERROR: HSM returned response code: 0x91 CKR_OPERATION_NOT_INITIALIZED


Package versions

libtss2-mu0-2.4.5-1.11.x86_64
libtss2-tctildr0-2.4.5-1.11.x86_64
libtss2-sys0-2.4.5-1.11.x86_64
libtss2-fapi1-3.1.0-lp152.116.2.x86_64
libtss2-esys0-2.4.5-1.11.x86_64
libtss2-tcti-device0-2.4.5-1.11.x86_64
libtss2-tcti-tabrmd0-2.3.3-1.12.x86_64
libtss2-rc0-2.4.5-1.11.x86_64
libtss2-tcti-mssim0-2.4.5-1.11.x86_64
libtss2-sys1-3.1.0-lp153.117.1.x86_64
libtss2-fapi0-2.4.5-1.11.x86_64


tpm2-0-tss-2.4.5-1.11.x86_64
tpm2.0-tools-4.3.0-2.3.x86_64
tpm2.0-abrmd-2.3.3-1.12.x86_64
tpm2-tss-engine-1.0.1-4.3.1.x86_64
tpm2-pkcs11-1.6.0+git20210503.c2d53cc-lp152.6.1.x86_64
tpm-tools-pkcs11-1.3.9.1-4.3.1.x86_64

I don't have the rpm for tpm2-pkcs11 so when i'm installing it with =


zypper addrepo https://download.opensuse.org/repositories/home:brassh:branc=
hes:security/openSUSE_Tumbleweed/home:brassh:branches:security.repo
zypper refresh
zypper install tpm2-pkcs11

libtss2-fapi0-2.4.5-1.11.x86_64 is overridden by libtss2-fapi1-3.1.0-lp152.=
116.2.x86_64 =


Can you please tell me what configuration I'm missing

Thanks
Nitesh
--===============2844963799002731408==--

