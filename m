Content-Type: multipart/mixed; boundary="===============8071525998766470395=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] [Release] tpm2-tools v4.2-rc1
Date: Thu, 02 Apr 2020 00:32:08 +0000
Message-ID: <20200402003208.2692.7047@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8071525998766470395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

tpm2-tools release candidate version 4.2-RC1 is published at https://github=
.com/tpm2-software/tpm2-tools/releases/tag/4.2-rc1.
Please provide your feedback for this release candidate.

Thanks and Regards,

Imran Desai

Changelog/ Updates:

### 4.2-RC1 - 2020-04-01

 * Fix various issues reported by static analysis tools.

 * Add integration test for ECC based getekcertificate.

 * Fix for issue #1959 where ARM builds were failing.

 * Add a check in autotools to add "expect" as a package dependency for fap=
i tools.

 * tpm2_createek: Drop the unused -p or --ek-auth option

 * tpm2_policyor: List of policy files should be specified as an argument
   instead of -l option. The -l option is still retained for backwards
   compatibility. See issue#1894.

 * tpm2\_eventlog: add a tool for parsing and displaying the event log.

 * tpm2_createek: Fix an issue where the `template` option looked for args

 * tpm2_hierarchycontrol: Fixed bug where tool operation failed silently

 * tpm2_nvdefine: Fixed an issue where text output suggested failures as pa=
sses

 * tpm2_certify: Add an example usage in man page

 * tpm2_policyor: Fix a bug where tool failed silently when no input were g=
iven

 * tpm2_getekcertificate: Intel (R) PTT EK cert web portal is set as defaul=
t address

 * tpm2_alg_util.c: Fix a bug where string rsa3072 was not parsed

 * .ci/download-deps.sh: Change tss dependency to 2.4.0 to acquire SAPI han=
dles for cpHash calculations

 * tpm2_policycphash: Add a tool to implement enhanced authorization with c=
pHash of a command

 * Add options to tools to enable cpHash outputs: tpm2_nvsetbits, tpm2_nvex=
tend,
   tpm2_nvincrement, tpm2_nvread, tpm2_nvreadlock, tpm2_writelock, tpm2_nvd=
efine,
   tpm2_nvundefine, tpm2_nvcertify, tpm2_policynv, tpm2_policyauthorizenv,
   tpm2_policysecret, tpm2_create, tpm2_load, tpm2_activatecredential, tpm2=
_unseal,
   tpm2_changeauth, tpm2_duplicate, tpm2_import, tpm2_rsadecrypt, tpm2_cert=
ify,
   tpm2_certifycreation, tpm2_hierarchycontrol, tpm2_setprimarypolicy, tpm2=
_clearcontrol,
   tpm2_dictionarylockout, tpm2_evictcontrol, tpm2_setclock, tpm2_clockrate=
adjust,
   tpm2_clear, tpm2_nvwrite, tpm2_encryptdecrypt, tpm2_hmac.

 * tpm2_import: Fix an issue where the imported key always required to have=
 a policy

 * tpm2_policysecret: Fix an issue where authorization model was fixed to p=
assword only

 * Feature API (FAPI) tools added. These additional set of tools implement =
utilities
   using the FAPI which was added to the tpm2-tss v2.4.4:
   tss2_decrypt, tss2_encrypt, tss2_list, tss2_changeauth, tss2_delete,
   tss2_import, tss2_getinfo, tss2_createkey, tss2_createseal, tss2_exportk=
ey,
   tss2_getcertificate, tss2_getplatformcertificates, tss2_gettpmblobs,
   tss2_getappdata, tss2_setappdata, tss2_setcertificate, tss2_sign,
   tss2_verifysignature, tss2_verifyquote, tss2_createnv, tss2_nvextend,
   tss2_nvincrement, tss2_nvread, tss2_nvsetbits, tss2_nvwrite,
   tss2_getdescription, tss2_setdescription, tss2_pcrextend, tss2_quote,
   tss2_pcrread, tss2_authorizepolicy, tss2_exportpolicy, tss2_import,
   tss2_provision, tss2_getrandom, tss2_unseal, tss2_writeauthorizenv

 * tpm2_policycountertimer: Fix an issue where operandB array was reversed =
causing faulty comparisons.
--===============8071525998766470395==--

