Content-Type: multipart/mixed; boundary="===============4704599017765051497=="
MIME-Version: 1.0
From: Niklas Andersson <niklas.andersson at fredenheim.se>
Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
Date: Wed, 27 Nov 2019 20:18:59 +0100
Message-ID: <CAJ8N_u9cq9iyCO5Y5Tr6ssJ2nturKH+4nfrQvPH5=h=nxxNLTw@mail.gmail.com>
In-Reply-To: CAJ8N_u_uhXpof_H+gGcJzQTxXVDnkZgSpiH-QorsS5JAwfeEvQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4704599017765051497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Don't know if this passage from the book "Towards a Secure and User
Friendly Authentication Method for Public Wireless Networks" [1] sheds some
light:

"Since the TPM has not been designed to meet the PKCS#11 interface, some
limitations exist when using the PKCS#11 TPM interface. PKCS#11 allows to
set RSA padding types at signing or encryption time, which means they can
change with every operation. However, TPM keys have a fixed RSA padding
scheme once they are created. Furthermore, PKCS#11 allows to create keys
for signing and encryption, which is not desired for TPM keys. The only key
type in TPMs that allows both are legacy keys. In order to cover most of
the PKCS#11 applications, TPM keys in openCryptoki are by default of the
type TSS_KEY_TYPE_LEGACY with the TSS_ES_RSAESPKCSV15 encryption scheme and
the TSS_SS_RSASSAPKCS1V15_DER signing scheme. As mentioned in Chapter 5,
the use of legacy keys is not recommended due to possible security
problems, but at the moment, there is no better solutoin for using TPM keys
in PKCS#11"

[1]
https://www.amazon.com/Towards-Friendly-Authentication-Wireless-Networks/dp=
/3832526943/

Den ons 27 nov. 2019 kl 16:27 skrev Niklas Andersson <
niklas.andersson(a)fredenheim.se>:

> Don't know how to fix it but a "raw signature" is the pure 256 bytes that
> makes up the signature. No boilerplate, no padding.
>
> ..and thanks for the post. I'll also be looking into the same stuff in a
> very short term. Your work is very helpful. Currently working with
> CSR-conformance with Microsoft CA - where I run into some issues where I
> tried to verify signature with sha256, whilst Microsoft uses sha1. The
> error message: "SSL_connect error:8207A070:PKCS#11
> module:pkcs11_private_encrypt:Mechanism invalid" looks suspicious. What is
> the "mechanism" that pkcs11 tried to use? Not sure if you can get better
> debug-data by running inside gdb perhaps, or turn up debugging level in
> pkcs11.
>
> - Niklas
>
> Den ons 27 nov. 2019 kl 15:17 skrev Ignacio Jaureguiberry <
> ignaciox.jaureguiberry(a)intel.com>:
>
>> I'm trying to use pkcs11 to authenticate a Wifi client using
>> wpa_supplicant against a radius server (EAP-TLS auth using server and
>> client certificates, no password) using a tpm2 private key.
>> I've installed tpm2-tss 2.3.x branch, tpm2-tools master and tpm2-pkcs11
>> master. System is ubuntu server 18.04. I'm using p11tools and opensc to =
add
>> pkcs11 support to wpa. All software except tpm2-* are from official ubun=
tu
>> repositories.
>>
>> I ran the pkcs11 store initialization as specified in the docs:
>>
>> ```
>> tpm2_ptool init
>> tpm2_ptool addtoken --pid=3D1 --sopin=3Dmysopin --userpin=3Dmyuserpin
>> --label=3Dlabel
>> tpm2_ptool addkey --algorithm rsa2048 --label label --userpin myuserpin
>> ```
>>
>> I've created a CSR using the tpm2 key:
>>
>> ```
>> openssl req -new -engine pkcs11 -keyform engine -key
>> "pkcs11:model=3DIntel;manufacturer=3DIntel;serial=3D0000000000000000;tok=
en=3Dlabel;id=3D%37%61%61%37%62%33%33%33%35%62%37%64%62%37%37%30;object=3D3=
;type=3Dsecret-key;pin-value=3Dmyuserpin"
>> -out client5.csr
>> ```
>>
>> Then moved the CSR to the radius server to create the certificate. The
>> result of some steps is a client_tpm.pem file.
>>
>> Finally I'm running wpa_supplicant with this wpa.conf config file:
>>
>> ```
>> # Configure OpenSSL to load the PKCS#11 engine and tpm2-pkcs11 module
>> pkcs11_engine_path=3D/usr/lib/x86_64-linux-gnu/engines-1.1/pkcs11.so
>> pkcs11_module_path=3D/usr/lib/x86_64-linux-gnu/pkcs11/libtpm2_pkcs11.so
>>
>> network=3D{
>>         ssid=3D"TPMAP"
>>         key_mgmt=3DWPA-EAP
>>         eap=3DTLS
>>         identity=3D"testing"
>>
>>         # use OpenSSL PKCS#11 engine for this network
>>         engine=3D1
>>         engine_id=3D"pkcs11"
>>
>>         pin=3D"myuserpin"
>>
>>         # select the private key on ID (output from p11tool above)
>>         key_id=3D"62356461333863313935373361313763"
>>
>>         # CA certificate and client signed certificate paths
>>         ca_cert=3D"/root/wpa_supplicant/ca.pem"
>>         client_cert=3D"/root/wpa_supplicant/client_tpm.pem"
>> }
>> ```
>>
>> ```
>> TPM2_PKCS11_LOG_LEVEL=3D2 wpa_supplicant -c  wpa.conf -i wlp1s0
>> ```
>>
>> This doesn't work, output (truncated to relevant section only) is:
>> ```
>> wlp1s0: CTRL-EVENT-SUBNET-STATUS-UPDATE status=3D0
>> wlp1s0: CTRL-EVENT-EAP-STARTED EAP authentication started
>> wlp1s0: CTRL-EVENT-EAP-PROPOSED-METHOD vendor=3D0 method=3D4 -> NAK
>> wlp1s0: CTRL-EVENT-EAP-PROPOSED-METHOD vendor=3D0 method=3D13
>> INFO on line: "390" in file: "src/pkcs11.c": enter "C_GetFunctionList"
>> INFO on line: "390" in file: "src/pkcs11.c": return "C_GetFunctionList"
>> value: 0
>> INFO on line: "378" in file: "src/pkcs11.c": enter "C_Initialize"
>> INFO on line: "1737" in file: "src/lib/db.c": Using sqlite3 DB:
>> "/root/.tpm2_pkcs11/tpm2_pkcs11.sqlite3"
>> INFO on line: "337" in file: "src/lib/tpm.c": tcti=3D(null)
>> INFO on line: "378" in file: "src/pkcs11.c": return "C_Initialize" value:
>> 0
>> INFO on line: "386" in file: "src/pkcs11.c": enter "C_GetInfo"
>> WARNING on line: "56" in file: "src/lib/general.c": Could not
>> strtoul(6c80e77): Success
>> INFO on line: "386" in file: "src/pkcs11.c": return "C_GetInfo" value: 0
>> INFO on line: "394" in file: "src/pkcs11.c": enter "C_GetSlotList"
>> INFO on line: "394" in file: "src/pkcs11.c": return "C_GetSlotList"
>> value: 0
>> INFO on line: "394" in file: "src/pkcs11.c": enter "C_GetSlotList"
>> INFO on line: "394" in file: "src/pkcs11.c": return "C_GetSlotList"
>> value: 0
>> INFO on line: "398" in file: "src/pkcs11.c": enter "C_GetSlotInfo"
>> INFO on line: "398" in file: "src/pkcs11.c": return "C_GetSlotInfo"
>> value: 0
>> INFO on line: "402" in file: "src/pkcs11.c": enter "C_GetTokenInfo"
>> INFO on line: "402" in file: "src/pkcs11.c": return "C_GetTokenInfo"
>> value: 0
>> INFO on line: "430" in file: "src/pkcs11.c": enter "C_OpenSession"
>> INFO on line: "430" in file: "src/pkcs11.c": return "C_OpenSession"
>> value: 0
>> INFO on line: "486" in file: "src/pkcs11.c": enter "C_FindObjectsInit"
>> INFO on line: "486" in file: "src/pkcs11.c": return "C_FindObjectsInit"
>> value: 0
>> INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
>> INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects"
>> value: 0
>> INFO on line: "494" in file: "src/pkcs11.c": enter "C_FindObjectsFinal"
>> INFO on line: "494" in file: "src/pkcs11.c": return "C_FindObjectsFinal"
>> value: 0
>> INFO on line: "486" in file: "src/pkcs11.c": enter "C_FindObjectsInit"
>> INFO on line: "486" in file: "src/pkcs11.c": return "C_FindObjectsInit"
>> value: 0
>> INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
>> INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects"
>> value: 0
>> INFO on line: "494" in file: "src/pkcs11.c": enter "C_FindObjectsFinal"
>> INFO on line: "494" in file: "src/pkcs11.c": return "C_FindObjectsFinal"
>> value: 0
>> INFO on line: "486" in file: "src/pkcs11.c": enter "C_FindObjectsInit"
>> INFO on line: "486" in file: "src/pkcs11.c": return "C_FindObjectsInit"
>> value: 0
>> INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
>> INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects"
>> value: 0
>> INFO on line: "494" in file: "src/pkcs11.c": enter "C_FindObjectsFinal"
>> INFO on line: "494" in file: "src/pkcs11.c": return "C_FindObjectsFinal"
>> value: 0
>> INFO on line: "442" in file: "src/pkcs11.c": enter "C_GetSessionInfo"
>> INFO on line: "442" in file: "src/pkcs11.c": return "C_GetSessionInfo"
>> value: 0
>> INFO on line: "454" in file: "src/pkcs11.c": enter "C_Login"
>> INFO on line: "454" in file: "src/pkcs11.c": return "C_Login" value: 0
>> INFO on line: "486" in file: "src/pkcs11.c": enter "C_FindObjectsInit"
>> INFO on line: "486" in file: "src/pkcs11.c": return "C_FindObjectsInit"
>> value: 0
>> INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
>> INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
>> INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "490" in file: "src/pkcs11.c": enter "C_FindObjects"
>> INFO on line: "490" in file: "src/pkcs11.c": return "C_FindObjects"
>> value: 0
>> INFO on line: "494" in file: "src/pkcs11.c": enter "C_FindObjectsFinal"
>> INFO on line: "494" in file: "src/pkcs11.c": return "C_FindObjectsFinal"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> INFO on line: "478" in file: "src/pkcs11.c": enter "C_GetAttributeValue"
>> INFO on line: "478" in file: "src/pkcs11.c": return "C_GetAttributeValue"
>> value: 0
>> wlp1s0: CTRL-EVENT-EAP-METHOD EAP vendor 0 method 13 (TLS) selected
>> wlp1s0: CTRL-EVENT-EAP-PEER-CERT depth=3D1
>> subject=3D'/C=3DFR/ST=3DRadius/L=3DSomewhere/O=3DExample Inc./emailAddre=
ss=3D
>> admin(a)example.org/CN=3DExample Certificate Authority'
>> hash=3D4953d5815718f3e6c082969bd950d84c1b8dbba87cb45c4b15335387b34abdb8
>> wlp1s0: CTRL-EVENT-EAP-PEER-CERT depth=3D0
>> subject=3D'/C=3DFR/ST=3DRadius/O=3DExample Inc./CN=3DExample Server
>> Certificate/emailAddress=3Dadmin(a)example.org'
>> hash=3D677cee54ddad924c818909397a5b3d1a8ff64d45ab8796648d47aa5fdc2d3f8f
>> INFO on line: "550" in file: "src/pkcs11.c": enter "C_SignInit"
>> INFO on line: "550" in file: "src/pkcs11.c": return "C_SignInit" value:
>> 112
>> SSL: SSL3 alert: write (local SSL3 detected an error):fatal:internal err=
or
>> OpenSSL: openssl_handshake - SSL_connect error:8207A070:PKCS#11
>> module:pkcs11_private_encrypt:Mechanism invalid
>> OpenSSL: pending error: error:141F0006:SSL
>> routines:tls_construct_cert_verify:EVP lib
>> ^Cnl80211: deinit ifname=3Dp2p-dev-wlp1s0 disabled_11b_rates=3D0
>> p2p-dev-wlp1s0: CTRL-EVENT-TERMINATING
>> wlp1s0: CTRL-EVENT-DISCONNECTED bssid=3D58:6d:8f:9d:2f:9e reason=3D3
>> locally_generated=3D1
>> nl80211: deinit ifname=3Dwlp1s0 disabled_11b_rates=3D0
>> wlp1s0: CTRL-EVENT-TERMINATING
>> INFO on line: "438" in file: "src/pkcs11.c": enter "C_CloseAllSessions"
>> INFO on line: "438" in file: "src/pkcs11.c": return "C_CloseAllSessions"
>> value: 0
>> ```
>>
>> I've found some related issues, but I'm not sure it's the same problem:
>>
>> https://bugzilla.redhat.com/show_bug.cgi?id=3D1685470
>> https://forums.openvpn.net/viewtopic.php?f=3D6&t=3D28181
>>
>> http://openssl.6102.n7.nabble.com/Issue-with-smartcard-authentication-fo=
r-openvpn-tt76415.html
>>
>> They mention that OpenSSL is expecting a raw signature and pkcs11 is
>> returning something else, but I'm not certain if this is actually the ca=
se
>> and if so, how can I fix it.
>>
>> Can anyone give me pointer on what else to try? Is this an OpenSSL bug or
>> can be solved from the tpm2-pkcs11 side?
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>>
>

--===============4704599017765051497==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5Eb24mIzM5O3Qga25vdyBpZiB0aGlzIHBhc3NhZ2UgZnJvbSB0
aGUgYm9vayAmcXVvdDtUb3dhcmRzIGEgU2VjdXJlIGFuZCBVc2VyIEZyaWVuZGx5IEF1dGhlbnRp
Y2F0aW9uIE1ldGhvZCBmb3IgUHVibGljIFdpcmVsZXNzIE5ldHdvcmtzJnF1b3Q7IFsxXSBzaGVk
cyBzb21lIGxpZ2h0OjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+JnF1b3Q7U2luY2UgdGhlIFRQ
TSBoYXMgbm90IGJlZW4gZGVzaWduZWQgdG8gbWVldCB0aGUgUEtDUyMxMSBpbnRlcmZhY2UsIHNv
bWUgbGltaXRhdGlvbnMgZXhpc3Qgd2hlbiB1c2luZyB0aGUgUEtDUyMxMSBUUE0gaW50ZXJmYWNl
LiBQS0NTIzExIGFsbG93cyB0byBzZXQgUlNBIHBhZGRpbmcgdHlwZXMgYXQgc2lnbmluZyBvciBl
bmNyeXB0aW9uIHRpbWUsIHdoaWNoIG1lYW5zIHRoZXkgY2FuIGNoYW5nZSB3aXRoIGV2ZXJ5IG9w
ZXJhdGlvbi4gSG93ZXZlciwgVFBNIGtleXMgaGF2ZSBhIGZpeGVkIFJTQSBwYWRkaW5nIHNjaGVt
ZSBvbmNlIHRoZXkgYXJlIGNyZWF0ZWQuIEZ1cnRoZXJtb3JlLCBQS0NTIzExIGFsbG93cyB0byBj
cmVhdGUga2V5cyBmb3Igc2lnbmluZyBhbmQgZW5jcnlwdGlvbiwgd2hpY2ggaXMgbm90IGRlc2ly
ZWQgZm9yIFRQTSBrZXlzLiBUaGUgb25seSBrZXkgdHlwZSBpbiBUUE1zIHRoYXQgYWxsb3dzIGJv
dGggYXJlIGxlZ2FjeSBrZXlzLiBJbiBvcmRlciB0byBjb3ZlciBtb3N0IG9mIHRoZSBQS0NTIzEx
IGFwcGxpY2F0aW9ucywgVFBNIGtleXMgaW4gb3BlbkNyeXB0b2tpIGFyZSBieSBkZWZhdWx0IG9m
IHRoZSB0eXBlIFRTU19LRVlfVFlQRV9MRUdBQ1kgd2l0aCB0aGUgVFNTX0VTX1JTQUVTUEtDU1Yx
NSBlbmNyeXB0aW9uIHNjaGVtZSBhbmQgdGhlIFRTU19TU19SU0FTU0FQS0NTMVYxNV9ERVIgc2ln
bmluZyBzY2hlbWUuIEFzIG1lbnRpb25lZCBpbiBDaGFwdGVyIDUsIHRoZSB1c2Ugb2YgbGVnYWN5
IGtleXMgaXMgbm90IHJlY29tbWVuZGVkIGR1ZSB0byBwb3NzaWJsZSBzZWN1cml0eSBwcm9ibGVt
cywgYnV0IGF0IHRoZSBtb21lbnQsIHRoZXJlIGlzIG5vIGJldHRlciBzb2x1dG9pbiBmb3IgdXNp
bmcgVFBNIGtleXMgaW4gUEtDUyMxMSZxdW90Ozxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PlsxXSA8YSBocmVmPSJodHRwczovL3d3dy5hbWF6b24uY29tL1Rvd2FyZHMtRnJpZW5kbHktQXV0
aGVudGljYXRpb24tV2lyZWxlc3MtTmV0d29ya3MvZHAvMzgzMjUyNjk0My8iPmh0dHBzOi8vd3d3
LmFtYXpvbi5jb20vVG93YXJkcy1GcmllbmRseS1BdXRoZW50aWNhdGlvbi1XaXJlbGVzcy1OZXR3
b3Jrcy9kcC8zODMyNTI2OTQzLzwvYT48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxf
cXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5EZW4gb25zIDI3IG5vdi4g
MjAxOSBrbCAxNjoyNyBza3JldiBOaWtsYXMgQW5kZXJzc29uICZsdDs8YSBocmVmPSJtYWlsdG86
bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIj5uaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhl
aW0uc2U8L2E+Jmd0Ozo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXY+RG9uJiMz
OTt0IGtub3cgaG93IHRvIGZpeCBpdCBidXQgYSAmcXVvdDtyYXcgc2lnbmF0dXJlJnF1b3Q7IGlz
IHRoZSBwdXJlIDI1NiBieXRlcyB0aGF0IG1ha2VzIHVwIHRoZSBzaWduYXR1cmUuIE5vIGJvaWxl
cnBsYXRlLCBubyBwYWRkaW5nLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Li5hbmQgdGhhbmtz
IGZvciB0aGUgcG9zdC4gSSYjMzk7bGwgYWxzbyBiZSBsb29raW5nIGludG8gdGhlIHNhbWUgc3R1
ZmYgaW4gYSB2ZXJ5IHNob3J0IHRlcm0uIFlvdXIgd29yayBpcyB2ZXJ5IGhlbHBmdWwuIEN1cnJl
bnRseSB3b3JraW5nIHdpdGggQ1NSLWNvbmZvcm1hbmNlIHdpdGggTWljcm9zb2Z0IENBIC0gd2hl
cmUgSSBydW4gaW50byBzb21lIGlzc3VlcyB3aGVyZSBJIHRyaWVkIHRvIHZlcmlmeSBzaWduYXR1
cmUgd2l0aCBzaGEyNTYsIHdoaWxzdCBNaWNyb3NvZnQgdXNlcyBzaGExLiBUaGUgZXJyb3IgbWVz
c2FnZTogJnF1b3Q7U1NMX2Nvbm5lY3QgZXJyb3I6ODIwN0EwNzA6UEtDUyMxMSBtb2R1bGU6cGtj
czExX3ByaXZhdGVfZW5jcnlwdDpNZWNoYW5pc20gaW52YWxpZCZxdW90OyBsb29rcyBzdXNwaWNp
b3VzLiBXaGF0IGlzIHRoZSAmcXVvdDttZWNoYW5pc20mcXVvdDsgdGhhdCBwa2NzMTEgdHJpZWQg
dG8gdXNlPyBOb3Qgc3VyZSBpZiB5b3UgY2FuIGdldCBiZXR0ZXIgZGVidWctZGF0YSBieSBydW5u
aW5nIGluc2lkZSBnZGIgcGVyaGFwcywgb3IgdHVybiB1cCBkZWJ1Z2dpbmcgbGV2ZWwgaW4gcGtj
czExLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+LSBOaWtsYXM8YnI+PC9kaXY+PC9kaXY+PGJy
PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0
ciI+RGVuIG9ucyAyNyBub3YuIDIwMTkga2wgMTU6MTcgc2tyZXYgSWduYWNpbyBKYXVyZWd1aWJl
cnJ5ICZsdDs8YSBocmVmPSJtYWlsdG86aWduYWNpb3guamF1cmVndWliZXJyeUBpbnRlbC5jb20i
IHRhcmdldD0iX2JsYW5rIj5pZ25hY2lveC5qYXVyZWd1aWJlcnJ5QGludGVsLmNvbTwvYT4mZ3Q7
Ojxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46
MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7
cGFkZGluZy1sZWZ0OjFleCI+SSYjMzk7bSB0cnlpbmcgdG8gdXNlIHBrY3MxMSB0byBhdXRoZW50
aWNhdGUgYSBXaWZpIGNsaWVudCB1c2luZyB3cGFfc3VwcGxpY2FudCBhZ2FpbnN0IGEgcmFkaXVz
IHNlcnZlciAoRUFQLVRMUyBhdXRoIHVzaW5nIHNlcnZlciBhbmQgY2xpZW50IGNlcnRpZmljYXRl
cywgbm8gcGFzc3dvcmQpIHVzaW5nIGEgdHBtMiBwcml2YXRlIGtleS48YnI+CkkmIzM5O3ZlIGlu
c3RhbGxlZCB0cG0yLXRzcyAyLjMueCBicmFuY2gsIHRwbTItdG9vbHMgbWFzdGVyIGFuZCB0cG0y
LXBrY3MxMSBtYXN0ZXIuIFN5c3RlbSBpcyB1YnVudHUgc2VydmVyIDE4LjA0LiBJJiMzOTttIHVz
aW5nIHAxMXRvb2xzIGFuZCBvcGVuc2MgdG8gYWRkIHBrY3MxMSBzdXBwb3J0IHRvIHdwYS4gQWxs
IHNvZnR3YXJlIGV4Y2VwdCB0cG0yLSogYXJlIGZyb20gb2ZmaWNpYWwgdWJ1bnR1IHJlcG9zaXRv
cmllcy48YnI+Cjxicj4KSSByYW4gdGhlIHBrY3MxMSBzdG9yZSBpbml0aWFsaXphdGlvbiBhcyBz
cGVjaWZpZWQgaW4gdGhlIGRvY3M6PGJyPgo8YnI+CmBgYDxicj4KdHBtMl9wdG9vbCBpbml0PGJy
Pgp0cG0yX3B0b29sIGFkZHRva2VuIC0tcGlkPTEgLS1zb3Bpbj1teXNvcGluIC0tdXNlcnBpbj1t
eXVzZXJwaW4gLS1sYWJlbD1sYWJlbDxicj4KdHBtMl9wdG9vbCBhZGRrZXkgLS1hbGdvcml0aG0g
cnNhMjA0OCAtLWxhYmVsIGxhYmVsIC0tdXNlcnBpbiBteXVzZXJwaW48YnI+CmBgYDxicj4KPGJy
PgpJJiMzOTt2ZSBjcmVhdGVkIGEgQ1NSIHVzaW5nIHRoZSB0cG0yIGtleTo8YnI+Cjxicj4KYGBg
PGJyPgpvcGVuc3NsIHJlcSAtbmV3IC1lbmdpbmUgcGtjczExIC1rZXlmb3JtIGVuZ2luZSAta2V5
ICZxdW90O3BrY3MxMTptb2RlbD1JbnRlbDttYW51ZmFjdHVyZXI9SW50ZWw7c2VyaWFsPTAwMDAw
MDAwMDAwMDAwMDA7dG9rZW49bGFiZWw7aWQ9JTM3JTYxJTYxJTM3JTYyJTMzJTMzJTMzJTM1JTYy
JTM3JTY0JTYyJTM3JTM3JTMwO29iamVjdD0zO3R5cGU9c2VjcmV0LWtleTtwaW4tdmFsdWU9bXl1
c2VycGluJnF1b3Q7IC1vdXQgY2xpZW50NS5jc3I8YnI+CmBgYDxicj4KPGJyPgpUaGVuIG1vdmVk
IHRoZSBDU1IgdG8gdGhlIHJhZGl1cyBzZXJ2ZXIgdG8gY3JlYXRlIHRoZSBjZXJ0aWZpY2F0ZS4g
VGhlIHJlc3VsdCBvZiBzb21lIHN0ZXBzIGlzIGEgY2xpZW50X3RwbS5wZW0gZmlsZS48YnI+Cjxi
cj4KRmluYWxseSBJJiMzOTttIHJ1bm5pbmcgd3BhX3N1cHBsaWNhbnQgd2l0aCB0aGlzIHdwYS5j
b25mIGNvbmZpZyBmaWxlOjxicj4KPGJyPgpgYGA8YnI+CiMgQ29uZmlndXJlIE9wZW5TU0wgdG8g
bG9hZCB0aGUgUEtDUyMxMSBlbmdpbmUgYW5kIHRwbTItcGtjczExIG1vZHVsZTxicj4KcGtjczEx
X2VuZ2luZV9wYXRoPS91c3IvbGliL3g4Nl82NC1saW51eC1nbnUvZW5naW5lcy0xLjEvcGtjczEx
LnNvPGJyPgpwa2NzMTFfbW9kdWxlX3BhdGg9L3Vzci9saWIveDg2XzY0LWxpbnV4LWdudS9wa2Nz
MTEvbGlidHBtMl9wa2NzMTEuc288YnI+Cjxicj4KbmV0d29yaz17PGJyPgrCoCDCoCDCoCDCoCBz
c2lkPSZxdW90O1RQTUFQJnF1b3Q7PGJyPgrCoCDCoCDCoCDCoCBrZXlfbWdtdD1XUEEtRUFQPGJy
PgrCoCDCoCDCoCDCoCBlYXA9VExTPGJyPgrCoCDCoCDCoCDCoCBpZGVudGl0eT0mcXVvdDt0ZXN0
aW5nJnF1b3Q7PGJyPgo8YnI+CsKgIMKgIMKgIMKgICMgdXNlIE9wZW5TU0wgUEtDUyMxMSBlbmdp
bmUgZm9yIHRoaXMgbmV0d29yazxicj4KwqAgwqAgwqAgwqAgZW5naW5lPTE8YnI+CsKgIMKgIMKg
IMKgIGVuZ2luZV9pZD0mcXVvdDtwa2NzMTEmcXVvdDs8YnI+Cjxicj4KwqAgwqAgwqAgwqAgcGlu
PSZxdW90O215dXNlcnBpbiZxdW90Ozxicj4KPGJyPgrCoCDCoCDCoCDCoCAjIHNlbGVjdCB0aGUg
cHJpdmF0ZSBrZXkgb24gSUQgKG91dHB1dCBmcm9tIHAxMXRvb2wgYWJvdmUpPGJyPgrCoCDCoCDC
oCDCoCBrZXlfaWQ9JnF1b3Q7NjIzNTY0NjEzMzM4NjMzMTM5MzUzNzMzNjEzMTM3NjMmcXVvdDs8
YnI+Cjxicj4KwqAgwqAgwqAgwqAgIyBDQSBjZXJ0aWZpY2F0ZSBhbmQgY2xpZW50IHNpZ25lZCBj
ZXJ0aWZpY2F0ZSBwYXRoczxicj4KwqAgwqAgwqAgwqAgY2FfY2VydD0mcXVvdDsvcm9vdC93cGFf
c3VwcGxpY2FudC9jYS5wZW0mcXVvdDs8YnI+CsKgIMKgIMKgIMKgIGNsaWVudF9jZXJ0PSZxdW90
Oy9yb290L3dwYV9zdXBwbGljYW50L2NsaWVudF90cG0ucGVtJnF1b3Q7PGJyPgp9PGJyPgpgYGA8
YnI+Cjxicj4KYGBgPGJyPgpUUE0yX1BLQ1MxMV9MT0dfTEVWRUw9MiB3cGFfc3VwcGxpY2FudCAt
Y8KgIHdwYS5jb25mIC1pIHdscDFzMDxicj4KYGBgPGJyPgo8YnI+ClRoaXMgZG9lc24mIzM5O3Qg
d29yaywgb3V0cHV0ICh0cnVuY2F0ZWQgdG8gcmVsZXZhbnQgc2VjdGlvbiBvbmx5KSBpczo8YnI+
CmBgYDxicj4Kd2xwMXMwOiBDVFJMLUVWRU5ULVNVQk5FVC1TVEFUVVMtVVBEQVRFIHN0YXR1cz0w
PGJyPgp3bHAxczA6IENUUkwtRVZFTlQtRUFQLVNUQVJURUQgRUFQIGF1dGhlbnRpY2F0aW9uIHN0
YXJ0ZWQ8YnI+CndscDFzMDogQ1RSTC1FVkVOVC1FQVAtUFJPUE9TRUQtTUVUSE9EIHZlbmRvcj0w
IG1ldGhvZD00IC0mZ3Q7IE5BSzxicj4Kd2xwMXMwOiBDVFJMLUVWRU5ULUVBUC1QUk9QT1NFRC1N
RVRIT0QgdmVuZG9yPTAgbWV0aG9kPTEzPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzM5MCZxdW90
OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfR2V0RnVu
Y3Rpb25MaXN0JnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzM5MCZxdW90OyBpbiBmaWxl
OiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0dldEZ1bmN0aW9uTGlz
dCZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDszNzgmcXVvdDsgaW4gZmls
ZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0luaXRpYWxpemUmcXVv
dDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7MTczNyZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMv
bGliL2RiLmMmcXVvdDs6IFVzaW5nIHNxbGl0ZTMgREI6ICZxdW90Oy9yb290Ly50cG0yX3BrY3Mx
MS90cG0yX3BrY3MxMS5zcWxpdGUzJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzMzNyZx
dW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvbGliL3RwbS5jJnF1b3Q7OiB0Y3RpPShudWxsKTxicj4K
SU5GTyBvbiBsaW5lOiAmcXVvdDszNzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5j
JnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19Jbml0aWFsaXplJnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZP
IG9uIGxpbmU6ICZxdW90OzM4NiZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVv
dDs6IGVudGVyICZxdW90O0NfR2V0SW5mbyZxdW90Ozxicj4KV0FSTklORyBvbiBsaW5lOiAmcXVv
dDs1NiZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvbGliL2dlbmVyYWwuYyZxdW90OzogQ291bGQg
bm90IHN0cnRvdWwoNmM4MGU3Nyk6IFN1Y2Nlc3M8YnI+CklORk8gb24gbGluZTogJnF1b3Q7Mzg2
JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0Nf
R2V0SW5mbyZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDszOTQmcXVvdDsg
aW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0dldFNsb3RM
aXN0JnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzM5NCZxdW90OyBpbiBmaWxlOiAmcXVv
dDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0dldFNsb3RMaXN0JnF1b3Q7IHZh
bHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzM5NCZxdW90OyBpbiBmaWxlOiAmcXVvdDtz
cmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfR2V0U2xvdExpc3QmcXVvdDs8YnI+CklO
Rk8gb24gbGluZTogJnF1b3Q7Mzk0JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZx
dW90OzogcmV0dXJuICZxdW90O0NfR2V0U2xvdExpc3QmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8g
b24gbGluZTogJnF1b3Q7Mzk4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90
OzogZW50ZXIgJnF1b3Q7Q19HZXRTbG90SW5mbyZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVv
dDszOTgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1
b3Q7Q19HZXRTbG90SW5mbyZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0
MDImcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtD
X0dldFRva2VuSW5mbyZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0MDImcXVvdDsgaW4g
ZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19HZXRUb2tlbklu
Zm8mcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDMwJnF1b3Q7IGluIGZp
bGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19PcGVuU2Vzc2lvbiZx
dW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0MzAmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3Jj
L3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19PcGVuU2Vzc2lvbiZxdW90OyB2YWx1ZTog
MDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0ODYmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3Br
Y3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0ZpbmRPYmplY3RzSW5pdCZxdW90Ozxicj4KSU5G
TyBvbiBsaW5lOiAmcXVvdDs0ODYmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1
b3Q7OiByZXR1cm4gJnF1b3Q7Q19GaW5kT2JqZWN0c0luaXQmcXVvdDsgdmFsdWU6IDA8YnI+CklO
Rk8gb24gbGluZTogJnF1b3Q7NDkwJnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZx
dW90OzogZW50ZXIgJnF1b3Q7Q19GaW5kT2JqZWN0cyZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAm
cXVvdDs0OTAmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4g
JnF1b3Q7Q19GaW5kT2JqZWN0cyZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVv
dDs0OTQmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVv
dDtDX0ZpbmRPYmplY3RzRmluYWwmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDk0JnF1
b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfRmlu
ZE9iamVjdHNGaW5hbCZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0ODYm
cXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0Zp
bmRPYmplY3RzSW5pdCZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0ODYmcXVvdDsgaW4g
ZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19GaW5kT2JqZWN0
c0luaXQmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDkwJnF1b3Q7IGlu
IGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19GaW5kT2JqZWN0
cyZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0OTAmcXVvdDsgaW4gZmlsZTogJnF1b3Q7
c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19GaW5kT2JqZWN0cyZxdW90OyB2YWx1
ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0OTQmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3Jj
L3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0ZpbmRPYmplY3RzRmluYWwmcXVvdDs8YnI+
CklORk8gb24gbGluZTogJnF1b3Q7NDk0JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEu
YyZxdW90OzogcmV0dXJuICZxdW90O0NfRmluZE9iamVjdHNGaW5hbCZxdW90OyB2YWx1ZTogMDxi
cj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0ODYmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3Mx
MS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0ZpbmRPYmplY3RzSW5pdCZxdW90Ozxicj4KSU5GTyBv
biBsaW5lOiAmcXVvdDs0ODYmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7
OiByZXR1cm4gJnF1b3Q7Q19GaW5kT2JqZWN0c0luaXQmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8g
b24gbGluZTogJnF1b3Q7NDkwJnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90
OzogZW50ZXIgJnF1b3Q7Q19GaW5kT2JqZWN0cyZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVv
dDs0OTAmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1
b3Q7Q19GaW5kT2JqZWN0cyZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0
OTQmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtD
X0ZpbmRPYmplY3RzRmluYWwmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDk0JnF1b3Q7
IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfRmluZE9i
amVjdHNGaW5hbCZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NDImcXVv
dDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0dldFNl
c3Npb25JbmZvJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ0MiZxdW90OyBpbiBmaWxl
OiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0dldFNlc3Npb25JbmZv
JnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ1NCZxdW90OyBpbiBmaWxl
OiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfTG9naW4mcXVvdDs8YnI+
CklORk8gb24gbGluZTogJnF1b3Q7NDU0JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEu
YyZxdW90OzogcmV0dXJuICZxdW90O0NfTG9naW4mcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24g
bGluZTogJnF1b3Q7NDg2JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90Ozog
ZW50ZXIgJnF1b3Q7Q19GaW5kT2JqZWN0c0luaXQmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1
b3Q7NDg2JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZx
dW90O0NfRmluZE9iamVjdHNJbml0JnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZx
dW90OzQ5MCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZx
dW90O0NfRmluZE9iamVjdHMmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDkwJnF1b3Q7
IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfRmluZE9i
amVjdHMmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7IGlu
IGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19HZXRBdHRyaWJ1
dGVWYWx1ZSZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVvdDsgaW4gZmlsZTog
JnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1
ZSZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVvdDsgaW4gZmls
ZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0dldEF0dHJpYnV0ZVZh
bHVlJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVv
dDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1
b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90OyBpbiBmaWxlOiAm
cXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfR2V0QXR0cmlidXRlVmFsdWUm
cXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3Ny
Yy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDsg
dmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7IGluIGZpbGU6ICZxdW90
O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1ZSZxdW90
Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3Br
Y3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1ZSZxdW90OyB2YWx1
ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3Jj
L3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7PGJy
PgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczEx
LmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7IHZhbHVlOiAw
PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtj
czExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDs8YnI+CklO
Rk8gb24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZx
dW90OzogcmV0dXJuICZxdW90O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDsgdmFsdWU6IDA8YnI+
CklORk8gb24gbGluZTogJnF1b3Q7NDkwJnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEu
YyZxdW90OzogZW50ZXIgJnF1b3Q7Q19GaW5kT2JqZWN0cyZxdW90Ozxicj4KSU5GTyBvbiBsaW5l
OiAmcXVvdDs0OTAmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1
cm4gJnF1b3Q7Q19GaW5kT2JqZWN0cyZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAm
cXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAm
cXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3
OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtD
X0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90
OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90
O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4JnF1
b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfR2V0
QXR0cmlidXRlVmFsdWUmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4
JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19H
ZXRBdHRyaWJ1dGVWYWx1ZSZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVvdDsg
aW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19HZXRBdHRy
aWJ1dGVWYWx1ZSZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVv
dDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0dldEF0
dHJpYnV0ZVZhbHVlJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90OyBpbiBm
aWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0dldEF0dHJpYnV0
ZVZhbHVlJnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90OyBp
biBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfR2V0QXR0cmli
dXRlVmFsdWUmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7IGluIGZpbGU6
ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0NfR2V0QXR0cmlidXRlVmFs
dWUmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4JnF1b3Q7IGluIGZp
bGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7Q19HZXRBdHRyaWJ1dGVW
YWx1ZSZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1
b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1ZSZx
dW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0OTAmcXVvdDsgaW4gZmlsZTog
JnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX0ZpbmRPYmplY3RzJnF1b3Q7
PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ5MCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtj
czExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX0ZpbmRPYmplY3RzJnF1b3Q7IHZhbHVlOiAwPGJy
PgpJTkZPIG9uIGxpbmU6ICZxdW90OzQ5NCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczEx
LmMmcXVvdDs6IGVudGVyICZxdW90O0NfRmluZE9iamVjdHNGaW5hbCZxdW90Ozxicj4KSU5GTyBv
biBsaW5lOiAmcXVvdDs0OTQmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7
OiByZXR1cm4gJnF1b3Q7Q19GaW5kT2JqZWN0c0ZpbmFsJnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZP
IG9uIGxpbmU6ICZxdW90OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVv
dDs6IGVudGVyICZxdW90O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDs8YnI+CklORk8gb24gbGlu
ZTogJnF1b3Q7NDc4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0
dXJuICZxdW90O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24g
bGluZTogJnF1b3Q7NDc4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90Ozog
ZW50ZXIgJnF1b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1ZSZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAm
cXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4g
JnF1b3Q7Q19HZXRBdHRyaWJ1dGVWYWx1ZSZxdW90OyB2YWx1ZTogMDxicj4KSU5GTyBvbiBsaW5l
OiAmcXVvdDs0NzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRl
ciAmcXVvdDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90
OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVv
dDtDX0dldEF0dHJpYnV0ZVZhbHVlJnF1b3Q7IHZhbHVlOiAwPGJyPgpJTkZPIG9uIGxpbmU6ICZx
dW90OzQ3OCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMvcGtjczExLmMmcXVvdDs6IGVudGVyICZx
dW90O0NfR2V0QXR0cmlidXRlVmFsdWUmcXVvdDs8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDc4
JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogcmV0dXJuICZxdW90O0Nf
R2V0QXR0cmlidXRlVmFsdWUmcXVvdDsgdmFsdWU6IDA8YnI+CklORk8gb24gbGluZTogJnF1b3Q7
NDc4JnF1b3Q7IGluIGZpbGU6ICZxdW90O3NyYy9wa2NzMTEuYyZxdW90OzogZW50ZXIgJnF1b3Q7
Q19HZXRBdHRyaWJ1dGVWYWx1ZSZxdW90Ozxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0NzgmcXVv
dDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19HZXRB
dHRyaWJ1dGVWYWx1ZSZxdW90OyB2YWx1ZTogMDxicj4Kd2xwMXMwOiBDVFJMLUVWRU5ULUVBUC1N
RVRIT0QgRUFQIHZlbmRvciAwIG1ldGhvZCAxMyAoVExTKSBzZWxlY3RlZDxicj4Kd2xwMXMwOiBD
VFJMLUVWRU5ULUVBUC1QRUVSLUNFUlQgZGVwdGg9MSBzdWJqZWN0PSYjMzk7L0M9RlIvU1Q9UmFk
aXVzL0w9U29tZXdoZXJlL089RXhhbXBsZSBJbmMuL2VtYWlsQWRkcmVzcz08YSBocmVmPSJodHRw
Oi8vYWRtaW5AZXhhbXBsZS5vcmcvQ049RXhhbXBsZSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+YWRtaW5AZXhhbXBsZS5vcmcvQ049RXhhbXBsZTwvYT4gQ2VydGlmaWNhdGUgQXV0
aG9yaXR5JiMzOTsgaGFzaD00OTUzZDU4MTU3MThmM2U2YzA4Mjk2OWJkOTUwZDg0YzFiOGRiYmE4
N2NiNDVjNGIxNTMzNTM4N2IzNGFiZGI4PGJyPgp3bHAxczA6IENUUkwtRVZFTlQtRUFQLVBFRVIt
Q0VSVCBkZXB0aD0wIHN1YmplY3Q9JiMzOTsvQz1GUi9TVD1SYWRpdXMvTz1FeGFtcGxlIEluYy4v
Q049RXhhbXBsZSBTZXJ2ZXIgQ2VydGlmaWNhdGUvZW1haWxBZGRyZXNzPTxhIGhyZWY9Im1haWx0
bzphZG1pbkBleGFtcGxlLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmFkbWluQGV4YW1wbGUub3JnPC9h
PiYjMzk7IGhhc2g9Njc3Y2VlNTRkZGFkOTI0YzgxODkwOTM5N2E1YjNkMWE4ZmY2NGQ0NWFiODc5
NjY0OGQ0N2FhNWZkYzJkM2Y4Zjxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs1NTAmcXVvdDsgaW4g
ZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5jJnF1b3Q7OiBlbnRlciAmcXVvdDtDX1NpZ25Jbml0JnF1
b3Q7PGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzU1MCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMv
cGtjczExLmMmcXVvdDs6IHJldHVybiAmcXVvdDtDX1NpZ25Jbml0JnF1b3Q7IHZhbHVlOiAxMTI8
YnI+ClNTTDogU1NMMyBhbGVydDogd3JpdGUgKGxvY2FsIFNTTDMgZGV0ZWN0ZWQgYW4gZXJyb3Ip
OmZhdGFsOmludGVybmFsIGVycm9yPGJyPgpPcGVuU1NMOiBvcGVuc3NsX2hhbmRzaGFrZSAtIFNT
TF9jb25uZWN0IGVycm9yOjgyMDdBMDcwOlBLQ1MjMTEgbW9kdWxlOnBrY3MxMV9wcml2YXRlX2Vu
Y3J5cHQ6TWVjaGFuaXNtIGludmFsaWQ8YnI+Ck9wZW5TU0w6IHBlbmRpbmcgZXJyb3I6IGVycm9y
OjE0MUYwMDA2OlNTTCByb3V0aW5lczp0bHNfY29uc3RydWN0X2NlcnRfdmVyaWZ5OkVWUCBsaWI8
YnI+Cl5Dbmw4MDIxMTogZGVpbml0IGlmbmFtZT1wMnAtZGV2LXdscDFzMCBkaXNhYmxlZF8xMWJf
cmF0ZXM9MDxicj4KcDJwLWRldi13bHAxczA6IENUUkwtRVZFTlQtVEVSTUlOQVRJTkcgPGJyPgp3
bHAxczA6IENUUkwtRVZFTlQtRElTQ09OTkVDVEVEIGJzc2lkPTU4OjZkOjhmOjlkOjJmOjllIHJl
YXNvbj0zIGxvY2FsbHlfZ2VuZXJhdGVkPTE8YnI+Cm5sODAyMTE6IGRlaW5pdCBpZm5hbWU9d2xw
MXMwIGRpc2FibGVkXzExYl9yYXRlcz0wPGJyPgp3bHAxczA6IENUUkwtRVZFTlQtVEVSTUlOQVRJ
TkcgPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQzOCZxdW90OyBpbiBmaWxlOiAmcXVvdDtzcmMv
cGtjczExLmMmcXVvdDs6IGVudGVyICZxdW90O0NfQ2xvc2VBbGxTZXNzaW9ucyZxdW90Ozxicj4K
SU5GTyBvbiBsaW5lOiAmcXVvdDs0MzgmcXVvdDsgaW4gZmlsZTogJnF1b3Q7c3JjL3BrY3MxMS5j
JnF1b3Q7OiByZXR1cm4gJnF1b3Q7Q19DbG9zZUFsbFNlc3Npb25zJnF1b3Q7IHZhbHVlOiAwPGJy
PgpgYGA8YnI+Cjxicj4KSSYjMzk7dmUgZm91bmQgc29tZSByZWxhdGVkIGlzc3VlcywgYnV0IEkm
IzM5O20gbm90IHN1cmUgaXQmIzM5O3MgdGhlIHNhbWUgcHJvYmxlbTo8YnI+Cjxicj4KPGEgaHJl
Zj0iaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNjg1NDcwIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2J1Z3ppbGxhLnJlZGhhdC5j
b20vc2hvd19idWcuY2dpP2lkPTE2ODU0NzA8L2E+PGJyPgo8YSBocmVmPSJodHRwczovL2ZvcnVt
cy5vcGVudnBuLm5ldC92aWV3dG9waWMucGhwP2Y9NiZhbXA7dD0yODE4MSIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9mb3J1bXMub3BlbnZwbi5uZXQvdmlld3RvcGlj
LnBocD9mPTYmYW1wO3Q9MjgxODE8L2E+PGJyPgo8YSBocmVmPSJodHRwOi8vb3BlbnNzbC42MTAy
Lm43Lm5hYmJsZS5jb20vSXNzdWUtd2l0aC1zbWFydGNhcmQtYXV0aGVudGljYXRpb24tZm9yLW9w
ZW52cG4tdHQ3NjQxNS5odG1sIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vb3BlbnNzbC42MTAyLm43Lm5hYmJsZS5jb20vSXNzdWUtd2l0aC1zbWFydGNhcmQtYXV0aGVu
dGljYXRpb24tZm9yLW9wZW52cG4tdHQ3NjQxNS5odG1sPC9hPjxicj4KPGJyPgpUaGV5IG1lbnRp
b24gdGhhdCBPcGVuU1NMIGlzIGV4cGVjdGluZyBhIHJhdyBzaWduYXR1cmUgYW5kIHBrY3MxMSBp
cyByZXR1cm5pbmcgc29tZXRoaW5nIGVsc2UsIGJ1dCBJJiMzOTttIG5vdCBjZXJ0YWluIGlmIHRo
aXMgaXMgYWN0dWFsbHkgdGhlIGNhc2UgYW5kIGlmIHNvLCBob3cgY2FuIEkgZml4IGl0Ljxicj4K
PGJyPgpDYW4gYW55b25lIGdpdmUgbWUgcG9pbnRlciBvbiB3aGF0IGVsc2UgdG8gdHJ5PyBJcyB0
aGlzIGFuIE9wZW5TU0wgYnVnIG9yIGNhbiBiZSBzb2x2ZWQgZnJvbSB0aGUgdHBtMi1wa2NzMTEg
c2lkZT88YnI+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
PGJyPgp0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5v
cmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+ClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgolKHdl
Yl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KPC9i
bG9ja3F1b3RlPjwvZGl2Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============4704599017765051497==--

