Content-Type: multipart/mixed; boundary="===============7927192864757175671=="
MIME-Version: 1.0
From: Ignacio Jaureguiberry <ignaciox.jaureguiberry at intel.com>
Subject: [tpm2] wpa_supplicant fails to use tpm2_pkcs11 key
Date: Wed, 27 Nov 2019 14:20:24 +0000
Message-ID: <20191127142024.2967.91616@new-ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7927192864757175671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm trying to use pkcs11 to authenticate a Wifi client using wpa_supplicant=
 against a radius server (EAP-TLS auth using server and client certificates=
, no password) using a tpm2 private key.
I've installed tpm2-tss 2.3.x branch, tpm2-tools master and tpm2-pkcs11 mas=
ter. System is ubuntu server 18.04. I'm using p11tools and opensc to add pk=
cs11 support to wpa. All software except tpm2-* are from official ubuntu re=
positories.

I ran the pkcs11 store initialization as specified in the docs:

```
tpm2_ptool init
tpm2_ptool addtoken --pid=3D1 --sopin=3Dmysopin --userpin=3Dmyuserpin --lab=
el=3Dlabel
tpm2_ptool addkey --algorithm rsa2048 --label label --userpin myuserpin
```

I've created a CSR using the tpm2 key:

```
openssl req -new -engine pkcs11 -keyform engine -key "pkcs11:model=3DIntel;=
manufacturer=3DIntel;serial=3D0000000000000000;token=3Dlabel;id=3D%37%61%61=
%37%62%33%33%33%35%62%37%64%62%37%37%30;object=3D3;type=3Dsecret-key;pin-va=
lue=3Dmyuserpin" -out client5.csr
```

Then moved the CSR to the radius server to create the certificate. The resu=
lt of some steps is a client_tpm.pem file.

Finally I'm running wpa_supplicant with this wpa.conf config file:

```
# Configure OpenSSL to load the PKCS#11 engine and tpm2-pkcs11 module
pkcs11_engine_path=3D/usr/lib/x86_64-linux-gnu/engines-1.1/pkcs11.so
pkcs11_module_path=3D/usr/lib/x86_64-linux-gnu/pkcs11/libtpm2_pkcs11.so

network=3D{
        ssid=3D"TPMAP"
        key_mgmt=3DWPA-EAP
        eap=3DTLS
        identity=3D"testing"

        # use OpenSSL PKCS#11 engine for this network
        engine=3D1
        engine_id=3D"pkcs11"

        pin=3D"myuserpin"

        # select the private key on ID (output from p11tool above)
        key_id=3D"62356461333863313935373361313763"

        # CA certificate and client signed certificate paths
        ca_cert=3D"/root/wpa_supplicant/ca.pem"
        client_cert=3D"/root/wpa_supplicant/client_tpm.pem"
}
```

```
TPM2_PKCS11_LOG_LEVEL=3D2 wpa_supplicant -c  wpa.conf -i wlp1s0
```

This doesn't work, output (truncated to relevant section only) is:
```
wlp1s0: CTRL-EVENT-SUBNET-STATUS-UPDATE status=3D0
wlp1s0: CTRL-EVENT-EAP-STARTED EAP authentication started
wlp1s0: CTRL-EVENT-EAP-PROPOSED-METHOD vendor=3D0 method=3D4 -> NAK
wlp1s0: CTRL-EVENT-EAP-PROPOSED-METHOD vendor=3D0 method=3D13
INFO on line: "390" in file: "src/pkcs11.c": enter "C_GetFunctionList"
INFO on line: "390" in file: "src/pkcs11.c": return "C_GetFunctionList" val=
ue: 0
INFO on line: "378" in file: "src/pkcs11.c": enter "C_Initialize"
INFO on line: "1737" in file: "src/lib/db.c": Using sqlite3 DB: "/root/.tpm=
2_pkcs11/tpm2_pkcs11.sqlite3"
INFO on line: "337" in file: "src/lib/tpm.c": tcti=3D(null)
INFO on line: "378" in file: "src/pkcs11.c": return "C_Initialize" value: 0
INFO on line: "386" in file: "src/pkcs11.c": enter "C_GetInfo"
WARNING on line: "56" in file: "src/lib/general.c": Could not strtoul(6c80e=
77): Success
INFO on line: "386" in file: "src/pkcs11.c": return "C_GetInfo" value: 0
INFO on line: "394" in file: "src/pkcs11.c": enter "C_GetSlotList"
INFO on line: "394" in file: "src/pkcs11.c": return "C_GetSlotList" value: 0
INFO on line: "394" in file: "src/pkcs11.c": enter "C_GetSlotList"
INFO on line: "394" in file: "src/pkcs11.c": return "C_GetSlotList" value: 0
INFO on line: "398" in file: "src/pkcs11.c": enter "C_GetSlotInfo"
INFO on line: "398" in file: "src/pkcs11.c": return "C_GetSlotInfo" value: 0
INFO on line: "402" in file: "src/pkcs11.c": enter "C_GetTokenInfo"
INFO on line: "402" in file: "src/pkcs11.c": return "C_GetTokenInfo" value:=
 0
INFO on line: "430" in file: "src/pkcs11.c": enter "C_OpenSession"
INFO on line: "430" in file: "src/pkcs11.c": return "C_OpenSession" value: 0
INFO on line: "486" in file: "src/pkcs11.c": enter "C_FindObjectsInit"
INFO on line: "486" in file: "src/pkcs11.c": return "C_FindObjectsInit" val=
ue: 0
INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects" value: 0
INFO on line: "494" in file: "src/pkcs11.c": enter "C_FindObjectsFinal"
INFO on line: "494" in file: "src/pkcs11.c": return "C_FindObjectsFinal" va=
lue: 0
INFO on line: "486" in file: "src/pkcs11.c": enter "C_FindObjectsInit"
INFO on line: "486" in file: "src/pkcs11.c": return "C_FindObjectsInit" val=
ue: 0
INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects" value: 0
INFO on line: "494" in file: "src/pkcs11.c": enter "C_FindObjectsFinal"
INFO on line: "494" in file: "src/pkcs11.c": return "C_FindObjectsFinal" va=
lue: 0
INFO on line: "486" in file: "src/pkcs11.c": enter "C_FindObjectsInit"
INFO on line: "486" in file: "src/pkcs11.c": return "C_FindObjectsInit" val=
ue: 0
INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects" value: 0
INFO on line: "494" in file: "src/pkcs11.c": enter "C_FindObjectsFinal"
INFO on line: "494" in file: "src/pkcs11.c": return "C_FindObjectsFinal" va=
lue: 0
INFO on line: "442" in file: "src/pkcs11.c": enter "C_GetSessionInfo"
INFO on line: "442" in file: "src/pkcs11.c": return "C_GetSessionInfo" valu=
e: 0
INFO on line: "454" in file: "src/pkcs11.c": enter "C_Login"
INFO on line: "454" in file: "src/pkcs11.c": return "C_Login" value: 0
INFO on line: "486" in file: "src/pkcs11.c": enter "C_FindObjectsInit"
INFO on line: "486" in file: "src/pkcs11.c": return "C_FindObjectsInit" val=
ue: 0
INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects" value: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects" value: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects" value: 0
INFO on line: "494" in file: "src/pkcs11.c": enter "C_FindObjectsFinal"
INFO on line: "494" in file: "src/pkcs11.c": return "C_FindObjectsFinal" va=
lue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue" v=
alue: 0
wlp1s0: CTRL-EVENT-EAP-METHOD EAP vendor 0 method 13 (TLS) selected
wlp1s0: CTRL-EVENT-EAP-PEER-CERT depth=3D1 subject=3D'/C=3DFR/ST=3DRadius/L=
=3DSomewhere/O=3DExample Inc./emailAddress=3Dadmin(a)example.org/CN=3DExamp=
le Certificate Authority' hash=3D4953d5815718f3e6c082969bd950d84c1b8dbba87c=
b45c4b15335387b34abdb8
wlp1s0: CTRL-EVENT-EAP-PEER-CERT depth=3D0 subject=3D'/C=3DFR/ST=3DRadius/O=
=3DExample Inc./CN=3DExample Server Certificate/emailAddress=3Dadmin(a)exam=
ple.org' hash=3D677cee54ddad924c818909397a5b3d1a8ff64d45ab8796648d47aa5fdc2=
d3f8f
INFO on line: "550" in file: "src/pkcs11.c": enter "C_SignInit"
INFO on line: "550" in file: "src/pkcs11.c": return "C_SignInit" value: 112
SSL: SSL3 alert: write (local SSL3 detected an error):fatal:internal error
OpenSSL: openssl_handshake - SSL_connect error:8207A070:PKCS#11 module:pkcs=
11_private_encrypt:Mechanism invalid
OpenSSL: pending error: error:141F0006:SSL routines:tls_construct_cert_veri=
fy:EVP lib
^Cnl80211: deinit ifname=3Dp2p-dev-wlp1s0 disabled_11b_rates=3D0
p2p-dev-wlp1s0: CTRL-EVENT-TERMINATING =

wlp1s0: CTRL-EVENT-DISCONNECTED bssid=3D58:6d:8f:9d:2f:9e reason=3D3 locall=
y_generated=3D1
nl80211: deinit ifname=3Dwlp1s0 disabled_11b_rates=3D0
wlp1s0: CTRL-EVENT-TERMINATING =

INFO on line: "438" in file: "src/pkcs11.c": enter "C_CloseAllSessions"
INFO on line: "438" in file: "src/pkcs11.c": return "C_CloseAllSessions" va=
lue: 0
```

I've found some related issues, but I'm not sure it's the same problem:

https://bugzilla.redhat.com/show_bug.cgi?id=3D1685470
https://forums.openvpn.net/viewtopic.php?f=3D6&t=3D28181
http://openssl.6102.n7.nabble.com/Issue-with-smartcard-authentication-for-o=
penvpn-tt76415.html

They mention that OpenSSL is expecting a raw signature and pkcs11 is return=
ing something else, but I'm not certain if this is actually the case and if=
 so, how can I fix it.

Can anyone give me pointer on what else to try? Is this an OpenSSL bug or c=
an be solved from the tpm2-pkcs11 side?
--===============7927192864757175671==--

