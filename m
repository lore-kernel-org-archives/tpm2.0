Content-Type: multipart/mixed; boundary="===============8091520634383853404=="
MIME-Version: 1.0
From: Niklas Andersson <niklas.andersson at fredenheim.se>
Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
Date: Wed, 27 Nov 2019 16:27:46 +0100
Message-ID: <CAJ8N_u_uhXpof_H+gGcJzQTxXVDnkZgSpiH-QorsS5JAwfeEvQ@mail.gmail.com>
In-Reply-To: 20191127142024.2967.91616@new-ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8091520634383853404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Don't know how to fix it but a "raw signature" is the pure 256 bytes that
makes up the signature. No boilerplate, no padding.

..and thanks for the post. I'll also be looking into the same stuff in a
very short term. Your work is very helpful. Currently working with
CSR-conformance with Microsoft CA - where I run into some issues where I
tried to verify signature with sha256, whilst Microsoft uses sha1. The
error message: "SSL_connect error:8207A070:PKCS#11
module:pkcs11_private_encrypt:Mechanism invalid" looks suspicious. What is
the "mechanism" that pkcs11 tried to use? Not sure if you can get better
debug-data by running inside gdb perhaps, or turn up debugging level in
pkcs11.

- Niklas

Den ons 27 nov. 2019 kl 15:17 skrev Ignacio Jaureguiberry <
ignaciox.jaureguiberry(a)intel.com>:

> I'm trying to use pkcs11 to authenticate a Wifi client using
> wpa_supplicant against a radius server (EAP-TLS auth using server and
> client certificates, no password) using a tpm2 private key.
> I've installed tpm2-tss 2.3.x branch, tpm2-tools master and tpm2-pkcs11
> master. System is ubuntu server 18.04. I'm using p11tools and opensc to a=
dd
> pkcs11 support to wpa. All software except tpm2-* are from official ubuntu
> repositories.
>
> I ran the pkcs11 store initialization as specified in the docs:
>
> ```
> tpm2_ptool init
> tpm2_ptool addtoken --pid=3D1 --sopin=3Dmysopin --userpin=3Dmyuserpin
> --label=3Dlabel
> tpm2_ptool addkey --algorithm rsa2048 --label label --userpin myuserpin
> ```
>
> I've created a CSR using the tpm2 key:
>
> ```
> openssl req -new -engine pkcs11 -keyform engine -key
> "pkcs11:model=3DIntel;manufacturer=3DIntel;serial=3D0000000000000000;toke=
n=3Dlabel;id=3D%37%61%61%37%62%33%33%33%35%62%37%64%62%37%37%30;object=3D3;=
type=3Dsecret-key;pin-value=3Dmyuserpin"
> -out client5.csr
> ```
>
> Then moved the CSR to the radius server to create the certificate. The
> result of some steps is a client_tpm.pem file.
>
> Finally I'm running wpa_supplicant with this wpa.conf config file:
>
> ```
> # Configure OpenSSL to load the PKCS#11 engine and tpm2-pkcs11 module
> pkcs11_engine_path=3D/usr/lib/x86_64-linux-gnu/engines-1.1/pkcs11.so
> pkcs11_module_path=3D/usr/lib/x86_64-linux-gnu/pkcs11/libtpm2_pkcs11.so
>
> network=3D{
>         ssid=3D"TPMAP"
>         key_mgmt=3DWPA-EAP
>         eap=3DTLS
>         identity=3D"testing"
>
>         # use OpenSSL PKCS#11 engine for this network
>         engine=3D1
>         engine_id=3D"pkcs11"
>
>         pin=3D"myuserpin"
>
>         # select the private key on ID (output from p11tool above)
>         key_id=3D"62356461333863313935373361313763"
>
>         # CA certificate and client signed certificate paths
>         ca_cert=3D"/root/wpa_supplicant/ca.pem"
>         client_cert=3D"/root/wpa_supplicant/client_tpm.pem"
> }
> ```
>
> ```
> TPM2_PKCS11_LOG_LEVEL=3D2 wpa_supplicant -c  wpa.conf -i wlp1s0
> ```
>
> This doesn't work, output (truncated to relevant section only) is:
> ```
> wlp1s0: CTRL-EVENT-SUBNET-STATUS-UPDATE status=3D0
> wlp1s0: CTRL-EVENT-EAP-STARTED EAP authentication started
> wlp1s0: CTRL-EVENT-EAP-PROPOSED-METHOD vendor=3D0 method=3D4 -> NAK
> wlp1s0: CTRL-EVENT-EAP-PROPOSED-METHOD vendor=3D0 method=3D13
> INFO on line: "390" in file: "src/pkcs11.c": enter "C_GetFunctionList"
> INFO on line: "390" in file: "src/pkcs11.c": return "C_GetFunctionList"
> value: 0
> INFO on line: "378" in file: "src/pkcs11.c": enter "C_Initialize"
> INFO on line: "1737" in file: "src/lib/db.c": Using sqlite3 DB:
> "/root/.tpm2_pkcs11/tpm2_pkcs11.sqlite3"
> INFO on line: "337" in file: "src/lib/tpm.c": tcti=3D(null)
> INFO on line: "378" in file: "src/pkcs11.c": return "C_Initialize" value:=
 0
> INFO on line: "386" in file: "src/pkcs11.c": enter "C_GetInfo"
> WARNING on line: "56" in file: "src/lib/general.c": Could not
> strtoul(6c80e77): Success
> INFO on line: "386" in file: "src/pkcs11.c": return "C_GetInfo" value: 0
> INFO on line: "394" in file: "src/pkcs11.c": enter "C_GetSlotList"
> INFO on line: "394" in file: "src/pkcs11.c": return "C_GetSlotList" value:
> 0
> INFO on line: "394" in file: "src/pkcs11.c": enter "C_GetSlotList"
> INFO on line: "394" in file: "src/pkcs11.c": return "C_GetSlotList" value:
> 0
> INFO on line: "398" in file: "src/pkcs11.c": enter "C_GetSlotInfo"
> INFO on line: "398" in file: "src/pkcs11.c": return "C_GetSlotInfo" value:
> 0
> INFO on line: "402" in file: "src/pkcs11.c": enter "C_GetTokenInfo"
> INFO on line: "402" in file: "src/pkcs11.c": return "C_GetTokenInfo"
> value: 0
> INFO on line: "430" in file: "src/pkcs11.c": enter "C_OpenSession"
> INFO on line: "430" in file: "src/pkcs11.c": return "C_OpenSession" value:
> 0
> INFO on line: "486" in file: "src/pkcs11.c": enter "C_FindObjectsInit"
> INFO on line: "486" in file: "src/pkcs11.c": return "C_FindObjectsInit"
> value: 0
> INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
> INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects" value:
> 0
> INFO on line: "494" in file: "src/pkcs11.c": enter "C_FindObjectsFinal"
> INFO on line: "494" in file: "src/pkcs11.c": return "C_FindObjectsFinal"
> value: 0
> INFO on line: "486" in file: "src/pkcs11.c": enter "C_FindObjectsInit"
> INFO on line: "486" in file: "src/pkcs11.c": return "C_FindObjectsInit"
> value: 0
> INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
> INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects" value:
> 0
> INFO on line: "494" in file: "src/pkcs11.c": enter "C_FindObjectsFinal"
> INFO on line: "494" in file: "src/pkcs11.c": return "C_FindObjectsFinal"
> value: 0
> INFO on line: "486" in file: "src/pkcs11.c": enter "C_FindObjectsInit"
> INFO on line: "486" in file: "src/pkcs11.c": return "C_FindObjectsInit"
> value: 0
> INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
> INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects" value:
> 0
> INFO on line: "494" in file: "src/pkcs11.c": enter "C_FindObjectsFinal"
> INFO on line: "494" in file: "src/pkcs11.c": return "C_FindObjectsFinal"
> value: 0
> INFO on line: "442" in file: "src/pkcs11.c": enter "C_GetSessionInfo"
> INFO on line: "442" in file: "src/pkcs11.c": return "C_GetSessionInfo"
> value: 0
> INFO on line: "454" in file: "src/pkcs11.c": enter "C_Login"
> INFO on line: "454" in file: "src/pkcs11.c": return "C_Login" value: 0
> INFO on line: "486" in file: "src/pkcs11.c": enter "C_FindObjectsInit"
> INFO on line: "486" in file: "src/pkcs11.c": return "C_FindObjectsInit"
> value: 0
> INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
> INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects" value:
> 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
> INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects" value:
> 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
> INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects" value:
> 0
> INFO on line: "494" in file: "src/pkcs11.c": enter "C_FindObjectsFinal"
> INFO on line: "494" in file: "src/pkcs11.c": return "C_FindObjectsFinal"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
> value: 0
> wlp1s0: CTRL-EVENT-EAP-METHOD EAP vendor 0 method 13 (TLS) selected
> wlp1s0: CTRL-EVENT-EAP-PEER-CERT depth=3D1
> subject=3D'/C=3DFR/ST=3DRadius/L=3DSomewhere/O=3DExample Inc./emailAddres=
s=3D
> admin(a)example.org/CN=3DExample Certificate Authority'
> hash=3D4953d5815718f3e6c082969bd950d84c1b8dbba87cb45c4b15335387b34abdb8
> wlp1s0: CTRL-EVENT-EAP-PEER-CERT depth=3D0
> subject=3D'/C=3DFR/ST=3DRadius/O=3DExample Inc./CN=3DExample Server
> Certificate/emailAddress=3Dadmin(a)example.org'
> hash=3D677cee54ddad924c818909397a5b3d1a8ff64d45ab8796648d47aa5fdc2d3f8f
> INFO on line: "550" in file: "src/pkcs11.c": enter "C_SignInit"
> INFO on line: "550" in file: "src/pkcs11.c": return "C_SignInit" value: 1=
12
> SSL: SSL3 alert: write (local SSL3 detected an error):fatal:internal error
> OpenSSL: openssl_handshake - SSL_connect error:8207A070:PKCS#11
> module:pkcs11_private_encrypt:Mechanism invalid
> OpenSSL: pending error: error:141F0006:SSL
> routines:tls_construct_cert_verify:EVP lib
> ^Cnl80211: deinit ifname=3Dp2p-dev-wlp1s0 disabled_11b_rates=3D0
> p2p-dev-wlp1s0: CTRL-EVENT-TERMINATING
> wlp1s0: CTRL-EVENT-DISCONNECTED bssid=3D58:6d:8f:9d:2f:9e reason=3D3
> locally_generated=3D1
> nl80211: deinit ifname=3Dwlp1s0 disabled_11b_rates=3D0
> wlp1s0: CTRL-EVENT-TERMINATING
> INFO on line: "438" in file: "src/pkcs11.c": enter "C_CloseAllSessions"
> INFO on line: "438" in file: "src/pkcs11.c": return "C_CloseAllSessions"
> value: 0
> ```
>
> I've found some related issues, but I'm not sure it's the same problem:
>
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1685470
> https://forums.openvpn.net/viewtopic.php?f=3D6&t=3D28181
>
> http://openssl.6102.n7.nabble.com/Issue-with-smartcard-authentication-for=
-openvpn-tt76415.html
>
> They mention that OpenSSL is expecting a raw signature and pkcs11 is
> returning something else, but I'm not certain if this is actually the case
> and if so, how can I fix it.
>
> Can anyone give me pointer on what else to try? Is this an OpenSSL bug or
> can be solved from the tpm2-pkcs11 side?
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============8091520634383853404==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5Eb24mIzM5O3Qga25vdyBob3cgdG8gZml4IGl0IGJ1dCBhICZx
dW90O3JhdyBzaWduYXR1cmUmcXVvdDsgaXMgdGhlIHB1cmUgMjU2IGJ5dGVzIHRoYXQgbWFrZXMg
dXAgdGhlIHNpZ25hdHVyZS4gTm8gYm9pbGVycGxhdGUsIG5vIHBhZGRpbmcuPC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj4uLmFuZCB0aGFua3MgZm9yIHRoZSBwb3N0LiBJJiMzOTtsbCBhbHNvIGJl
IGxvb2tpbmcgaW50byB0aGUgc2FtZSBzdHVmZiBpbiBhIHZlcnkgc2hvcnQgdGVybS4gWW91ciB3
b3JrIGlzIHZlcnkgaGVscGZ1bC4gQ3VycmVudGx5IHdvcmtpbmcgd2l0aCBDU1ItY29uZm9ybWFu
Y2Ugd2l0aCBNaWNyb3NvZnQgQ0EgLSB3aGVyZSBJIHJ1biBpbnRvIHNvbWUgaXNzdWVzIHdoZXJl
IEkgdHJpZWQgdG8gdmVyaWZ5IHNpZ25hdHVyZSB3aXRoIHNoYTI1Niwgd2hpbHN0IE1pY3Jvc29m
dCB1c2VzIHNoYTEuIFRoZSBlcnJvciBtZXNzYWdlOiAmcXVvdDtTU0xfY29ubmVjdCBlcnJvcjo4
MjA3QTA3MDpQS0NTIzExIG1vZHVsZTpwa2NzMTFfcHJpdmF0ZV9lbmNyeXB0Ok1lY2hhbmlzbSBp
bnZhbGlkJnF1b3Q7IGxvb2tzIHN1c3BpY2lvdXMuIFdoYXQgaXMgdGhlICZxdW90O21lY2hhbmlz
bSZxdW90OyB0aGF0IHBrY3MxMSB0cmllZCB0byB1c2U/IE5vdCBzdXJlIGlmIHlvdSBjYW4gZ2V0
IGJldHRlciBkZWJ1Zy1kYXRhIGJ5IHJ1bm5pbmcgaW5zaWRlIGdkYiBwZXJoYXBzLCBvciB0dXJu
IHVwIGRlYnVnZ2luZyBsZXZlbCBpbiBwa2NzMTEuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4t
IE5pa2xhczxicj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYg
ZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5EZW4gb25zIDI3IG5vdi4gMjAxOSBrbCAxNTox
NyBza3JldiBJZ25hY2lvIEphdXJlZ3VpYmVycnkgJmx0OzxhIGhyZWY9Im1haWx0bzppZ25hY2lv
eC5qYXVyZWd1aWJlcnJ5QGludGVsLmNvbSI+aWduYWNpb3guamF1cmVndWliZXJyeUBpbnRlbC5j
b208L2E+Jmd0Ozo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0
LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkkmIzM5O20gdHJ5aW5nIHRvIHVzZSBwa2NzMTEg
dG8gYXV0aGVudGljYXRlIGEgV2lmaSBjbGllbnQgdXNpbmcgd3BhX3N1cHBsaWNhbnQgYWdhaW5z
dCBhIHJhZGl1cyBzZXJ2ZXIgKEVBUC1UTFMgYXV0aCB1c2luZyBzZXJ2ZXIgYW5kIGNsaWVudCBj
ZXJ0aWZpY2F0ZXMsIG5vIHBhc3N3b3JkKSB1c2luZyBhIHRwbTIgcHJpdmF0ZSBrZXkuPGJyPgpJ
JiMzOTt2ZSBpbnN0YWxsZWQgdHBtMi10c3MgMi4zLnggYnJhbmNoLCB0cG0yLXRvb2xzIG1hc3Rl
ciBhbmQgdHBtMi1wa2NzMTEgbWFzdGVyLiBTeXN0ZW0gaXMgdWJ1bnR1IHNlcnZlciAxOC4wNC4g
SSYjMzk7bSB1c2luZyBwMTF0b29scyBhbmQgb3BlbnNjIHRvIGFkZCBwa2NzMTEgc3VwcG9ydCB0
byB3cGEuIEFsbCBzb2Z0d2FyZSBleGNlcHQgdHBtMi0qIGFyZSBmcm9tIG9mZmljaWFsIHVidW50
dSByZXBvc2l0b3JpZXMuPGJyPgo8YnI+CkkgcmFuIHRoZSBwa2NzMTEgc3RvcmUgaW5pdGlhbGl6
YXRpb24gYXMgc3BlY2lmaWVkIGluIHRoZSBkb2NzOjxicj4KPGJyPgpgYGA8YnI+CnRwbTJfcHRv
b2wgaW5pdDxicj4KdHBtMl9wdG9vbCBhZGR0b2tlbiAtLXBpZD0xIC0tc29waW49bXlzb3BpbiAt
LXVzZXJwaW49bXl1c2VycGluIC0tbGFiZWw9bGFiZWw8YnI+CnRwbTJfcHRvb2wgYWRka2V5IC0t
YWxnb3JpdGhtIHJzYTIwNDggLS1sYWJlbCBsYWJlbCAtLXVzZXJwaW4gbXl1c2VycGluPGJyPgpg
YGA8YnI+Cjxicj4KSSYjMzk7dmUgY3JlYXRlZCBhIENTUiB1c2luZyB0aGUgdHBtMiBrZXk6PGJy
Pgo8YnI+CmBgYDxicj4Kb3BlbnNzbCByZXEgLW5ldyAtZW5naW5lIHBrY3MxMSAta2V5Zm9ybSBl
bmdpbmUgLWtleSAmcXVvdDtwa2NzMTE6bW9kZWw9SW50ZWw7bWFudWZhY3R1cmVyPUludGVsO3Nl
cmlhbD0wMDAwMDAwMDAwMDAwMDAwO3Rva2VuPWxhYmVsO2lkPSUzNyU2MSU2MSUzNyU2MiUzMyUz
MyUzMyUzNSU2MiUzNyU2NCU2MiUzNyUzNyUzMDtvYmplY3Q9Mzt0eXBlPXNlY3JldC1rZXk7cGlu
LXZhbHVlPW15dXNlcnBpbiZxdW90OyAtb3V0IGNsaWVudDUuY3NyPGJyPgpgYGA8YnI+Cjxicj4K
VGhlbiBtb3ZlZCB0aGUgQ1NSIHRvIHRoZSByYWRpdXMgc2VydmVyIHRvIGNyZWF0ZSB0aGUgY2Vy
dGlmaWNhdGUuIFRoZSByZXN1bHQgb2Ygc29tZSBzdGVwcyBpcyBhIGNsaWVudF90cG0ucGVtIGZp
bGUuPGJyPgo8YnI+CkZpbmFsbHkgSSYjMzk7bSBydW5uaW5nIHdwYV9zdXBwbGljYW50IHdpdGgg
dGhpcyB3cGEuY29uZiBjb25maWcgZmlsZTo8YnI+Cjxicj4KYGBgPGJyPgojIENvbmZpZ3VyZSBP
cGVuU1NMIHRvIGxvYWQgdGhlIFBLQ1MjMTEgZW5naW5lIGFuZCB0cG0yLXBrY3MxMSBtb2R1bGU8
YnI+CnBrY3MxMV9lbmdpbmVfcGF0aD0vdXNyL2xpYi94ODZfNjQtbGludXgtZ251L2VuZ2luZXMt
MS4xL3BrY3MxMS5zbzxicj4KcGtjczExX21vZHVsZV9wYXRoPS91c3IvbGliL3g4Nl82NC1saW51
eC1nbnUvcGtjczExL2xpYnRwbTJfcGtjczExLnNvPGJyPgo8YnI+Cm5ldHdvcms9ezxicj4KwqAg
wqAgwqAgwqAgc3NpZD0mcXVvdDtUUE1BUCZxdW90Ozxicj4KwqAgwqAgwqAgwqAga2V5X21nbXQ9
V1BBLUVBUDxicj4KwqAgwqAgwqAgwqAgZWFwPVRMUzxicj4KwqAgwqAgwqAgwqAgaWRlbnRpdHk9
JnF1b3Q7dGVzdGluZyZxdW90Ozxicj4KPGJyPgrCoCDCoCDCoCDCoCAjIHVzZSBPcGVuU1NMIFBL
Q1MjMTEgZW5naW5lIGZvciB0aGlzIG5ldHdvcms8YnI+CsKgIMKgIMKgIMKgIGVuZ2luZT0xPGJy
PgrCoCDCoCDCoCDCoCBlbmdpbmVfaWQ9JnF1b3Q7cGtjczExJnF1b3Q7PGJyPgo8YnI+CsKgIMKg
IMKgIMKgIHBpbj0mcXVvdDtteXVzZXJwaW4mcXVvdDs8YnI+Cjxicj4KwqAgwqAgwqAgwqAgIyBz
ZWxlY3QgdGhlIHByaXZhdGUga2V5IG9uIElEIChvdXRwdXQgZnJvbSBwMTF0b29sIGFib3ZlKTxi
cj4KwqAgwqAgwqAgwqAga2V5X2lkPSZxdW90OzYyMzU2NDYxMzMzODYzMzEzOTM1MzczMzYxMzEz
NzYzJnF1b3Q7PGJyPgo8YnI+CsKgIMKgIMKgIMKgICMgQ0EgY2VydGlmaWNhdGUgYW5kIGNsaWVu
dCBzaWduZWQgY2VydGlmaWNhdGUgcGF0aHM8YnI+CsKgIMKgIMKgIMKgIGNhX2NlcnQ9JnF1b3Q7
L3Jvb3Qvd3BhX3N1cHBsaWNhbnQvY2EucGVtJnF1b3Q7PGJyPgrCoCDCoCDCoCDCoCBjbGllbnRf
Y2VydD0mcXVvdDsvcm9vdC93cGFfc3VwcGxpY2FudC9jbGllbnRfdHBtLnBlbSZxdW90Ozxicj4K
fTxicj4KYGBgPGJyPgo8YnI+CmBgYDxicj4KVFBNMl9QS0NTMTFfTE9HX0xFVkVMPTIgd3BhX3N1
cHBsaWNhbnQgLWPCoCB3cGEuY29uZiAtaSB3bHAxczA8YnI+CmBgYDxicj4KPGJyPgpUaGlzIGRv
ZXNuJiMzOTt0IHdvcmssIG91dHB1dCAodHJ1bmNhdGVkIHRvIHJlbGV2YW50IHNlY3Rpb24gb25s
eSkgaXM6PGJyPgpgYGA8YnI+CndscDFzMDogQ1RSTC1FVkVOVC1TVUJORVQtU1RBVFVTLVVQREFU
RSBzdGF0dXM9MDxicj4Kd2xwMXMwOiBDVFJMLUVWRU5ULUVBUC1TVEFSVEVEIEVBUCBhdXRoZW50
aWNhdGlvbiBzdGFydGVkPGJyPgp3bHAxczA6IENUUkwtRVZFTlQtRUFQLVBST1BPU0VELU1FVEhP
RCB2ZW5kb3I9MCBtZXRob2Q9NCAtJmd0OyBOQUs8YnI+CndscDFzMDogQ1RSTC1FVkVOVC1FQVAt
UFJPUE9TRUQtTUVUSE9EIHZlbmRvcj0wIG1ldGhvZD0xMzxicj4KSU5GTyBvbiBsaW5lOiAmcXVv
dDszOTAmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVv
dDtDX0dldEZ1bmN0aW9uTGlzdCZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDszOTAmcXVv
dDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19HZXRG
dW5jdGlvbkxpc3QmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7Mzc4JnF1
b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19Jbml0
aWFsaXplJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzE3MzcmcXVvdDsgaW4gZmlsZTog
JnF1b3Q7c3JjL2xpYi9kYi5jJnF1b3Q7OiBVc2luZyBzcWxpdGUzIERCOiAmcXVvdDsvcm9vdC8u
dHBtMl9wa2NzMTEvdHBtMl9wa2NzMTEuc3FsaXRlMyZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAm
cXVvdDszMzcmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL2xpYi90cG0uYyZxdW90OzogdGN0aT0o
bnVsbCk8YnI+CklORk8gb24gbGluZTogJnF1b3Q7Mzc4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3Ny
Yy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfSW5pdGlhbGl6ZSZxdW90OyB2YWx1ZTog
MDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDszODYmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3Br
Y3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0dldEluZm8mcXVvdDs8YnI+CldBUk5JTkcgb24g
bGluZTogJnF1b3Q7NTYmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL2xpYi9nZW5lcmFsLmMmcXVv
dDs6IENvdWxkIG5vdCBzdHJ0b3VsKDZjODBlNzcpOiBTdWNjZXNzPGJyPgpJTkZPIG9uIGxpbmU6
ICZxdW90OzM4NiZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVy
biAmcXVvdDtDX0dldEluZm8mcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7
Mzk0JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7
Q19HZXRTbG90TGlzdCZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDszOTQmcXVvdDsgaW4g
ZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19HZXRTbG90TGlz
dCZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDszOTQmcXVvdDsgaW4gZmls
ZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0dldFNsb3RMaXN0JnF1
b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzM5NCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMv
cGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0dldFNsb3RMaXN0JnF1b3Q7IHZhbHVlOiAw
PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzM5OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtj
czExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfR2V0U2xvdEluZm8mcXVvdDs8YnI+CklORk8gb24g
bGluZTogJnF1b3Q7Mzk4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90Ozog
cmV0dXJuICZxdW90O0NfR2V0U2xvdEluZm8mcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGlu
ZTogJnF1b3Q7NDAyJnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50
ZXIgJnF1b3Q7Q19HZXRUb2tlbkluZm8mcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDAy
JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0Nf
R2V0VG9rZW5JbmZvJnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQzMCZx
dW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfT3Bl
blNlc3Npb24mcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDMwJnF1b3Q7IGluIGZpbGU6
ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfT3BlblNlc3Npb24mcXVv
dDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDg2JnF1b3Q7IGluIGZpbGU6ICZx
dW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19GaW5kT2JqZWN0c0luaXQmcXVv
dDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDg2JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9w
a2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfRmluZE9iamVjdHNJbml0JnF1b3Q7IHZhbHVl
OiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ5MCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMv
cGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfRmluZE9iamVjdHMmcXVvdDs8YnI+CklORk8g
b24gbGluZTogJnF1b3Q7NDkwJnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90
OzogcmV0dXJuICZxdW90O0NfRmluZE9iamVjdHMmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24g
bGluZTogJnF1b3Q7NDk0JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90Ozog
ZW50ZXIgJnF1b3Q7Q19GaW5kT2JqZWN0c0ZpbmFsJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZx
dW90OzQ5NCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAm
cXVvdDtDX0ZpbmRPYmplY3RzRmluYWwmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTog
JnF1b3Q7NDg2JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIg
JnF1b3Q7Q19GaW5kT2JqZWN0c0luaXQmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDg2
JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0Nf
RmluZE9iamVjdHNJbml0JnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ5
MCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0Nf
RmluZE9iamVjdHMmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDkwJnF1b3Q7IGluIGZp
bGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfRmluZE9iamVjdHMm
cXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDk0JnF1b3Q7IGluIGZpbGU6
ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19GaW5kT2JqZWN0c0ZpbmFs
JnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ5NCZxdW90OyBpbiBmaWxlOiAmcXVvdDtz
cmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0ZpbmRPYmplY3RzRmluYWwmcXVvdDsg
dmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDg2JnF1b3Q7IGluIGZpbGU6ICZxdW90
O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19GaW5kT2JqZWN0c0luaXQmcXVvdDs8
YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDg2JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2Nz
MTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfRmluZE9iamVjdHNJbml0JnF1b3Q7IHZhbHVlOiAw
PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ5MCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtj
czExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfRmluZE9iamVjdHMmcXVvdDs8YnI+CklORk8gb24g
bGluZTogJnF1b3Q7NDkwJnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90Ozog
cmV0dXJuICZxdW90O0NfRmluZE9iamVjdHMmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGlu
ZTogJnF1b3Q7NDk0JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50
ZXIgJnF1b3Q7Q19GaW5kT2JqZWN0c0ZpbmFsJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90
OzQ5NCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVv
dDtDX0ZpbmRPYmplY3RzRmluYWwmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1
b3Q7NDQyJnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1
b3Q7Q19HZXRTZXNzaW9uSW5mbyZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NDImcXVv
dDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19HZXRT
ZXNzaW9uSW5mbyZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NTQmcXVv
dDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0xvZ2lu
JnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ1NCZxdW90OyBpbiBmaWxlOiAmcXVvdDtz
cmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0xvZ2luJnF1b3Q7IHZhbHVlOiAwPGJy
PgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ4NiZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczEx
LmMmcXVvdDs6IGVudGVyICZxdW90O0NfRmluZE9iamVjdHNJbml0JnF1b3Q7PGJyPgpJTkZPIG9u
IGxpbmU6ICZxdW90OzQ4NiZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6
IHJldHVybiAmcXVvdDtDX0ZpbmRPYmplY3RzSW5pdCZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBv
biBsaW5lOiAmcXVvdDs0OTAmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7
OiBlbnRlciAmcXVvdDtDX0ZpbmRPYmplY3RzJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90
OzQ5MCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVv
dDtDX0ZpbmRPYmplY3RzJnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3
OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0Nf
R2V0QXR0cmlidXRlVmFsdWUmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7
IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfR2V0QXR0
cmlidXRlVmFsdWUmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4JnF1
b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19HZXRB
dHRyaWJ1dGVWYWx1ZSZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVvdDsgaW4g
ZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19HZXRBdHRyaWJ1
dGVWYWx1ZSZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVvdDsg
aW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0dldEF0dHJp
YnV0ZVZhbHVlJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90OyBpbiBmaWxl
OiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0dldEF0dHJpYnV0ZVZh
bHVlJnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90OyBpbiBm
aWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfR2V0QXR0cmlidXRl
VmFsdWUmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7IGluIGZpbGU6ICZx
dW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfR2V0QXR0cmlidXRlVmFsdWUm
cXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7IGluIGZpbGU6
ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1
ZSZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7
c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1ZSZxdW90
OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1
b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1
b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMv
cGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7IHZh
bHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ5MCZxdW90OyBpbiBmaWxlOiAmcXVvdDtz
cmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfRmluZE9iamVjdHMmcXVvdDs8YnI+CklO
Rk8gb24gbGluZTogJnF1b3Q7NDkwJnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZx
dW90OzogcmV0dXJuICZxdW90O0NfRmluZE9iamVjdHMmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8g
b24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90
OzogZW50ZXIgJnF1b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1ZSZxdW90Ozxicj4KSU5GTyBvbiBsaW5l
OiAmcXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1
cm4gJnF1b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1ZSZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBs
aW5lOiAmcXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBl
bnRlciAmcXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZx
dW90OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAm
cXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6
ICZxdW90OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVy
ICZxdW90O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7
NDc4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90
O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1
b3Q7NDc4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1
b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1ZSZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0Nzgm
cXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19H
ZXRBdHRyaWJ1dGVWYWx1ZSZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0
NzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtD
X0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90
OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0dldEF0
dHJpYnV0ZVZhbHVlJnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZx
dW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfR2V0
QXR0cmlidXRlVmFsdWUmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7IGlu
IGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfR2V0QXR0cmli
dXRlVmFsdWUmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDkwJnF1b3Q7
IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19GaW5kT2Jq
ZWN0cyZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0OTAmcXVvdDsgaW4gZmlsZTogJnF1
b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19GaW5kT2JqZWN0cyZxdW90OyB2
YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0OTQmcXVvdDsgaW4gZmlsZTogJnF1b3Q7
c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0ZpbmRPYmplY3RzRmluYWwmcXVvdDs8
YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDk0JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2Nz
MTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfRmluZE9iamVjdHNGaW5hbCZxdW90OyB2YWx1ZTog
MDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3Br
Y3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7PGJyPgpJ
TkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMm
cXVvdDs6IHJldHVybiAmcXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7IHZhbHVlOiAwPGJy
PgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczEx
LmMmcXVvdDs6IGVudGVyICZxdW90O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDs8YnI+CklORk8g
b24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90
OzogcmV0dXJuICZxdW90O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDsgdmFsdWU6IDA8YnI+CklO
Rk8gb24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZx
dW90OzogZW50ZXIgJnF1b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1ZSZxdW90Ozxicj4KSU5GTyBvbiBs
aW5lOiAmcXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBy
ZXR1cm4gJnF1b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1ZSZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBv
biBsaW5lOiAmcXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7
OiBlbnRlciAmcXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6
ICZxdW90OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVy
biAmcXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxp
bmU6ICZxdW90OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVu
dGVyICZxdW90O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1
b3Q7NDc4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZx
dW90O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDsgdmFsdWU6IDA8YnI+CndscDFzMDogQ1RSTC1F
VkVOVC1FQVAtTUVUSE9EIEVBUCB2ZW5kb3IgMCBtZXRob2QgMTMgKFRMUykgc2VsZWN0ZWQ8YnI+
CndscDFzMDogQ1RSTC1FVkVOVC1FQVAtUEVFUi1DRVJUIGRlcHRoPTEgc3ViamVjdD0mIzM5Oy9D
PUZSL1NUPVJhZGl1cy9MPVNvbWV3aGVyZS9PPUV4YW1wbGUgSW5jLi9lbWFpbEFkZHJlc3M9PGEg
aHJlZj0iaHR0cDovL2FkbWluQGV4YW1wbGUub3JnL0NOPUV4YW1wbGUiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmFkbWluQGV4YW1wbGUub3JnL0NOPUV4YW1wbGU8L2E+IENlcnRp
ZmljYXRlIEF1dGhvcml0eSYjMzk7IGhhc2g9NDk1M2Q1ODE1NzE4ZjNlNmMwODI5NjliZDk1MGQ4
NGMxYjhkYmJhODdjYjQ1YzRiMTUzMzUzODdiMzRhYmRiODxicj4Kd2xwMXMwOiBDVFJMLUVWRU5U
LUVBUC1QRUVSLUNFUlQgZGVwdGg9MCBzdWJqZWN0PSYjMzk7L0M9RlIvU1Q9UmFkaXVzL089RXhh
bXBsZSBJbmMuL0NOPUV4YW1wbGUgU2VydmVyIENlcnRpZmljYXRlL2VtYWlsQWRkcmVzcz08YSBo
cmVmPSJtYWlsdG86YWRtaW5AZXhhbXBsZS5vcmciIHRhcmdldD0iX2JsYW5rIj5hZG1pbkBleGFt
cGxlLm9yZzwvYT4mIzM5OyBoYXNoPTY3N2NlZTU0ZGRhZDkyNGM4MTg5MDkzOTdhNWIzZDFhOGZm
NjRkNDVhYjg3OTY2NDhkNDdhYTVmZGMyZDNmOGY8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NTUw
JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19T
aWduSW5pdCZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs1NTAmcXVvdDsgaW4gZmlsZTog
JnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19TaWduSW5pdCZxdW90OyB2
YWx1ZTogMTEyPGJyPgpTU0w6IFNTTDMgYWxlcnQ6IHdyaXRlIChsb2NhbCBTU0wzIGRldGVjdGVk
IGFuIGVycm9yKTpmYXRhbDppbnRlcm5hbCBlcnJvcjxicj4KT3BlblNTTDogb3BlbnNzbF9oYW5k
c2hha2UgLSBTU0xfY29ubmVjdCBlcnJvcjo4MjA3QTA3MDpQS0NTIzExIG1vZHVsZTpwa2NzMTFf
cHJpdmF0ZV9lbmNyeXB0Ok1lY2hhbmlzbSBpbnZhbGlkPGJyPgpPcGVuU1NMOiBwZW5kaW5nIGVy
cm9yOiBlcnJvcjoxNDFGMDAwNjpTU0wgcm91dGluZXM6dGxzX2NvbnN0cnVjdF9jZXJ0X3Zlcmlm
eTpFVlAgbGliPGJyPgpeQ25sODAyMTE6IGRlaW5pdCBpZm5hbWU9cDJwLWRldi13bHAxczAgZGlz
YWJsZWRfMTFiX3JhdGVzPTA8YnI+CnAycC1kZXYtd2xwMXMwOiBDVFJMLUVWRU5ULVRFUk1JTkFU
SU5HIDxicj4Kd2xwMXMwOiBDVFJMLUVWRU5ULURJU0NPTk5FQ1RFRCBic3NpZD01ODo2ZDo4Zjo5
ZDoyZjo5ZSByZWFzb249MyBsb2NhbGx5X2dlbmVyYXRlZD0xPGJyPgpubDgwMjExOiBkZWluaXQg
aWZuYW1lPXdscDFzMCBkaXNhYmxlZF8xMWJfcmF0ZXM9MDxicj4Kd2xwMXMwOiBDVFJMLUVWRU5U
LVRFUk1JTkFUSU5HIDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0MzgmcXVvdDsgaW4gZmlsZTog
JnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0Nsb3NlQWxsU2Vzc2lvbnMm
cXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDM4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3Ny
Yy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfQ2xvc2VBbGxTZXNzaW9ucyZxdW90OyB2
YWx1ZTogMDxicj4KYGBgPGJyPgo8YnI+CkkmIzM5O3ZlIGZvdW5kIHNvbWUgcmVsYXRlZCBpc3N1
ZXMsIGJ1dCBJJiMzOTttIG5vdCBzdXJlIGl0JiMzOTtzIHRoZSBzYW1lIHByb2JsZW06PGJyPgo8
YnI+CjxhIGhyZWY9Imh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9
MTY4NTQ3MCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9idWd6aWxs
YS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNjg1NDcwPC9hPjxicj4KPGEgaHJlZj0iaHR0
cHM6Ly9mb3J1bXMub3BlbnZwbi5uZXQvdmlld3RvcGljLnBocD9mPTYmYW1wO3Q9MjgxODEiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZm9ydW1zLm9wZW52cG4ubmV0
L3ZpZXd0b3BpYy5waHA/Zj02JmFtcDt0PTI4MTgxPC9hPjxicj4KPGEgaHJlZj0iaHR0cDovL29w
ZW5zc2wuNjEwMi5uNy5uYWJibGUuY29tL0lzc3VlLXdpdGgtc21hcnRjYXJkLWF1dGhlbnRpY2F0
aW9uLWZvci1vcGVudnBuLXR0NzY0MTUuaHRtbCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL29wZW5zc2wuNjEwMi5uNy5uYWJibGUuY29tL0lzc3VlLXdpdGgtc21hcnRj
YXJkLWF1dGhlbnRpY2F0aW9uLWZvci1vcGVudnBuLXR0NzY0MTUuaHRtbDwvYT48YnI+Cjxicj4K
VGhleSBtZW50aW9uIHRoYXQgT3BlblNTTCBpcyBleHBlY3RpbmcgYSByYXcgc2lnbmF0dXJlIGFu
ZCBwa2NzMTEgaXMgcmV0dXJuaW5nIHNvbWV0aGluZyBlbHNlLCBidXQgSSYjMzk7bSBub3QgY2Vy
dGFpbiBpZiB0aGlzIGlzIGFjdHVhbGx5IHRoZSBjYXNlIGFuZCBpZiBzbywgaG93IGNhbiBJIGZp
eCBpdC48YnI+Cjxicj4KQ2FuIGFueW9uZSBnaXZlIG1lIHBvaW50ZXIgb24gd2hhdCBlbHNlIHRv
IHRyeT8gSXMgdGhpcyBhbiBPcGVuU1NMIGJ1ZyBvciBjYW4gYmUgc29sdmVkIGZyb20gdGhlIHRw
bTItcGtjczExIHNpZGU/PGJyPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXzxicj4KdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJA
bGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgpU
byB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZl
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9h
Pjxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1l
KXM8YnI+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============8091520634383853404==--

