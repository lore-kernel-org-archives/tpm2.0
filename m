Content-Type: multipart/mixed; boundary="===============3364152383052986182=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: FAPI Provision Could not open: /HN
Date: Mon, 15 Mar 2021 09:00:13 +0000
Message-ID: <AM0P194MB0307B76E98CE00F17C8D13B8A66C9@AM0P194MB0307.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: SN6PR11MB34372BA019923FFEFED20214B8909@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3364152383052986182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

What does a "find /home/wcrobert/.local/share/tpm2-tss" give back ?
And what's your fapi-config.json ?

________________________________________
Von: Roberts, William C <william.c.roberts(a)intel.com>
Gesendet: Donnerstag, 11. M=C3=A4rz 2021 21:30
An: tpm2(a)lists.01.org
Betreff: [tpm2] FAPI Provision Could not open: /HN

I have never been able to run a successfull tss2 provision command (ever), =
the most current error is this:

$ tss2 provision

ERROR:fapijson:src/tss2-fapi/ifapi_json_serialize.c:529:ifapi_json_IFAPI_OB=
JECT_serialize() Invalid call get_json ErrorCode (0x00060001)
ERROR:fapi:src/tss2-fapi/ifapi_keystore.c:710:ifapi_keystore_store_async() =
ErrorCode (0x00060001) Object for /home/wcrobert/.local/share/tpm2-tss/user=
/keystore//P_ECCP256SHA256/HN/object.json could not be serialized.
ERROR:fapi:src/tss2-fapi/api/Fapi_Provision.c:1290:Fapi_Provision_Finish() =
ErrorCode (0x00060001) Could not open: /HN
WARNING:fapi:src/tss2-fapi/ifapi_io.c:421:ifapi_io_remove_directories() Rem=
oving: /usr/local/var/lib/tpm2-tss/system/keystore/P_ECCP256SHA256/HS/SRK/o=
bject.json
WARNING:fapi:src/tss2-fapi/ifapi_io.c:421:ifapi_io_remove_directories() Rem=
oving: /usr/local/var/lib/tpm2-tss/system/keystore/P_ECCP256SHA256/HS/objec=
t.json
WARNING:fapi:src/tss2-fapi/ifapi_io.c:421:ifapi_io_remove_directories() Rem=
oving: /usr/local/var/lib/tpm2-tss/system/keystore/P_ECCP256SHA256/LOCKOUT/=
object.json
WARNING:fapi:src/tss2-fapi/ifapi_io.c:421:ifapi_io_remove_directories() Rem=
oving: /usr/local/var/lib/tpm2-tss/system/keystore/P_ECCP256SHA256/HE/EK/ob=
ject.json
WARNING:fapi:src/tss2-fapi/ifapi_io.c:421:ifapi_io_remove_directories() Rem=
oving: /usr/local/var/lib/tpm2-tss/system/keystore/P_ECCP256SHA256/HE/objec=
t.json
ERROR:fapi:src/tss2-fapi/api/Fapi_Provision.c:168:Fapi_Provision() ErrorCod=
e (0x00060001) Provision
Fapi_Provision(0x60001) - fapi:Catch all for all errors not otherwise speci=
fied

Any ideas?

System Details Below:

tpm2-tss version
pkg-config --modversion tss2-fapi
3.1.0-dev

tpm2-tss$ git describe 3.0.0-136-gc651d559d036

tpm2-tools version:
tss2 getrandom --version
tool=3D"getrandom" version=3D"5.0-92-g46ffe7eed571"

I have a working connection to a swtpm via tpm2-abrmd as confirmed by:'
tpm2 getrandom --hex --tcti=3Dtabrmd 4

I have modified my /usr/local/etc/tpm2-tss/fapi-config.json to include:
"ek_cert_less" : "yes"
"tcti": "tabrmd"

My user wcrobert is part of tss group:

$groups
wcrobert adm cdrom sudo dip plugdev lpadmin sambashare kvm libvirt tss dock=
er



--===============3364152383052986182==--

