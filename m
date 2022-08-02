Content-Type: multipart/mixed; boundary="===============8052321796613140032=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] [Release] tpm2-tools v5.3-rc0
Date: Tue, 02 Aug 2022 18:04:41 +0000
Message-ID: <20220802180441.2703.54093@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8052321796613140032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

Pleased to announce release for tpm2-tools version 5.3-rc0. Thank you to al=
l the contributors.
You can find the release here: https://github.com/tpm2-software/tpm2-tools/=
releases/tag/5.3-rc0

Note:
1. This is a pre-release - your feedback is much appreciated.
2. Please reference the change log for full list of changes at https://gith=
ub.com/tpm2-software/tpm2-tools/blob/master/docs/CHANGELOG.md =


Highlights:

Feature support:

lib/tpm2_tool.c: add --help=3Dno-man for tpm2 option. Prior to this change =
the
tool parsed no-man as an unrecognized option and errored out. Now it lists
all the available tool options.
tpm2_encodeobject: New tool to encode TPM2 object. It takes public and
private portions of an object and encode them in a combined PEM form called
tssprivkey used by tpm2-tss-engine and other applications.
Support alternative ECC curves for which default EK templates exist
(NIST_P256, NIST_P384, NIST_P521, and SM2_P256).
tools/misc/tpm2_checkquote: add sm2 verification of signature.
crypto: support the TPM2_ECC_SM2_P256 curveID.
fapi: add new command to enable the use of fapi objects for t=CF=80pm2 tool=
s. The
new command tss2_gettpm2object was added. With this command context files
which can be used for tpm2 tool commands can be created.
Support for sign and verify with sm2 algorithms.
tools/tpm2_startauthsession: add sym-algorithm argument for supported
symmetric algorithm.
Attestation (certify, command audit, sessionaudit and quote): add scheme
argument for supported signature schemes. This also enable support for SM
signing.
tpm2_flushcontext: support all options at a time Support the -t/-l/-s
options all at once so folks don't have to call it multiple times.
tools/tpm2_nvread: add human readable output for NV content Enable parsing
and YAML-style output for the different NV index types.
New event types in tpm2_eventlog: EV_EFI_PLATFORM_FIRMWARE_BLOB2,
EV_EFI_HANDOFF_TABLES2, EV_EFI_VARIABLE_BOOT2
VERSION: add version file - Generate the version file with bootstrap and
include in the DIST tarball so endusers can call autoreconf on a dist
tarball which doesn't have git. This alleviates git describe errors on
release tarballs in the autoreconf case.
import: support restricted parents - Support a restricted parent with an
aes128cfb symmetric parameter.
tpm2_load - Added capability to load pem files in TSS2-Private-Key format
for interoperability with tpm2-tss-engine, tpm2-openssl provider
tpm2-pkcs11, and tpm2-pytss.
tpm2_print - Added capability to parse out and print the public portion of a
TSS Private Key in the PEM format with the arg option TSSPRIVKEY_OBJ.
tpm2_loadexternal: Added support to tpm2_loadexternal for parsing and
loading the public portion of a TSS2 Privkey PEM file. The path to the PEM
file must be specified using the -r option while skipping the -G
option for key type.
Support added for calculating cpHash, rpHash, sessions for parameter
encryption and auditing in: tpm2_nvwrite, tpm2_nvcertify, tpm2_nvincrement,
tpm2_nvwritelock, tpm2_nvreadlock, tpm2_nvundefine and tpm2_nvreadpublic.
Support added for calculating cpHash in: tpm2_clear, tpm2_dictionarylockout,
tpm2_clearcontrol, tpm2_sign, tpm2_setprimarypolicy, tpm2_setclock,
tpm2_rsadecrypt, tpm2_duplicate, tpm2_clockrateadjust, tpm2_createprimary,
tpm2_quote, tpm2_policysecret, tpm2_policynv, tpm2_policyauthorizenv,
tpm2_import, tpm2_hmac, tpm2_hierarchycontrol, tpm2_load, tpm2_gettime,
tpm2_evictcontrol, tpm2_encryptdecrypt, tpm2_getpolicydigest,
tpm2_loadexternal, tpm2_commit, tpm2_ecdhkeygen, tpm2_ecdhzgen,
tpm2_ecephemeral, tpm2_geteccparameters, tpm2_flushcontext,
tpm2_pcrallocate, tpm2_pcrevent, tpm2_pcrreset, tpm2_pcrread.
Support for using tcti=3Dnone for cpHash calculations to avoid invoking che=
cks
for active TPM in: tpm2_nvreadpublic, tpm2_nvundefine, tpm2_nvreadlock,
tpm2_nvwritelock, tpm2_nvincrement, tpm2_nvcertify, tpm2_nvdefine,
tpm2_nvwrite.
Bug fixes:

tools/tpm2_evictcontrol: fix for calls to Esys_TR_Close on bad handles.
tools/tpm2_nvextend: fix for ESYS_TR handle not being used in calculating t=
he
object name.
tools/tpm2_nvwrite, tools/tpm2_nvread: Policy authorization must be
re-instantiated on each iteration of the read/ write when size exceeds the
allowed operating size (TPM2_PT_NV_BUFFER_MAX). However, information on the
compounded policies cannot be retrieved from the only policy digest read fr=
om
the session and hence the session cannot be re-instantiated. To avoid this
scenario only a single iteration is allowed when policy authorization is in
use.
Fix argument parsing in tpm2_policylocality to fix an issue causing almost
always to generate PolicyLocality(0). There was a logical inversion that
caused almost any argument (including invalid ones) to be interpreted as
zero, except =E2=80=9Czero" would be interpreted as one.
test/fapi/fapi-quote-verify.sh Fix check of qualifying data. Because of a b=
ug
in Fapi_VerifyQuote the qualifying data was not checked correctly. Errors
that were not recognized before occur now. The order of the tests was clean=
ed
up and for every quote and verify quote now the correct combination of the
qualifying data and quote info containing the nonce is used.
tpm2_nvdefine: set TPMA_NV_PLATFORMCREATE when authenticating with the
platform hierarchy.
tools/tpm2_getekcertificate: fixed the url link to ekop.intel.com. There we=
re
two places where the fix was needed: (1.) In the tool source code where a
forward slash was always appended irrespective of it already being part of
the link specified by the user and (2.) In the integration test where curl
tests the link to the ekop.intel.com backend. It now requires the full link
to include the base64 encoded ek pub hash.
tools/tpm2_tool.c: Fix an issue where LOG_WARN is always displayed Despite
setting the 'quiet' flag with -Q.
fapi: fix usage of parameter pcrLog for tss2_quote. pcrLog is an optional
parameter. If pcrLog is not used as parameter currently the pcr log is still
calculated in Fapi_Quote. To avoid this calculation a NULL pointer will be
passed to Fapi_Quote if the parameter pcrLog is not passed. So tss2_quote c=
an
be executed for a user which has no access rights to the files with the
system measurements.
import: fix bug on using scheme wherein if scheme is specified in the
template, the openssl load functions clobber the scheme value and set it to
TPM2_ALG_NULL.
tools/tpm2_sign and tpm2_verifysignature: fix sm2 sign and verifysignature
bugs : (1.) sm2 sign could not get output signature. (2.) sm2 verify tss
format signature failed.
lib/tpm2.c: added workaround for a system api bug where in the flush handle
is erroneously placed in the handle area instead of the parameter area.
nvreadpublic: drop ntoh on attributes The attributes get marshalled to
correct endianess by libmu and don=E2=80=99t need to be changed again.
Removing unused '-i' option from tpm2_print
tpm2_policyor: fix unallocated policy list The TPML_DIGEST policy list was
calloc'd for some reason, however it could just be statically allocated in
the context. The side effect is that when no options or arguments were given
a NPD occured when checking the count of the policy list.
tools/tpm2_certify: fix man page for short options and add tests The short
options for the signing-key-auth and certified-key-auth were swapped. The
case fix in the man page makes it less intuitive but have to go through with
the change so that we don't break any existing scripts. This change does not
affect the long options. Tests have been added to ensure the functionality.
CI:

ci: add ubuntu-22.04. This also requires the min tpm2-tss version to be at
3.2.0 to support the openSSL major version 3.
cirrus.yml: update freebsd version to 13.

Thanks, and regards,

Imran Desai
--===============8052321796613140032==--

