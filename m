Content-Type: multipart/mixed; boundary="===============8791413514898554478=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_import is modifying the keyid of my private key
Date: Fri, 20 May 2022 14:14:11 +0000
Message-ID: <SN6PR11MB3437148E2AF64352B333DA3EB8D39@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20220513125254.1878.24023@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8791413514898554478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm not sure if anyone here can help you, you should go talk to strongswan:
  -https://www.strongswan.org/support.html

________________________________
From: rodolphe.averty(a)free.fr <rodolphe.averty(a)free.fr>
Sent: Friday, May 13, 2022 7:52 AM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Re: tpm2_import is modifying the keyid of my private key

Hello,

i am trying to use TPM 2.0 device and StrongSwan 5.9.6. I had to recompil S=
trongSwan to have desired options.

>> systemctl restart strongswan
May 13 11:51:39 00[LIB] loaded plugins: charon-systemd tpm aes des rc2 sha2=
 sha1 md5 mgf1 random nonce x509 revocation constraints pubkey pkcs1 pkcs7 =
pkcs12 pgp dnskey sshkey pem pkcs8 fips-prf gmp curve25519 xcbc cmac hmac k=
df drbg attr kernel-netlink resolve socket-default stroke vici updown xauth=
-generic counters
May 13 11:51:39 00[JOB] spawning 16 worker threads
May 13 11:51:39 01[PTS] TPM 2.0 via TSS2 v2 available
May 13 11:51:39 01[PTS] encryption algorithm is AES-CFB with 128 bits
May 13 11:51:39 01[CFG] loaded RSA private key from token
May 13 11:51:39 11[PTS] TPM 2.0 via TSS2 v2 available
May 13 11:51:39 11[LIB] loaded certificate from TPM NV index 0x01800004
May 13 11:51:39 11[CFG]   id not specified, defaulting to cert subject 'C=
=3DFR, O=3DXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX, OU=3D0002 12000601000025, CN=
=3Dposte-YYYYY'

>> swanctl --initiate --child host
[IKE] initiating Main Mode IKE_SA connection1[1] to 192.168.42.254
[IKE] no private key found for 'C=3DFR, O=3DXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXX, OU=3D0002 12000601000025, CN=3Dposte-YYYYY'
[CFG] configuration uses unsupported authentication
initiate failed: establishing CHILD_SA 'host' failed

>> swanctl --list-certs
List of X.509 End Entity Certificates

  subject:  "C=3DFR, O=3DXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX, OU=3D0002 12000601=
000025, CN=3Ditineo-0334991"
  issuer:   "C=3DFAC_DEVNG_INFRASTRUCTURE/AC_DEVNG_INFRASTRUCTURER, O=3DXXX=
XXXXXXXXXXXXXXXXXXXXXXXXXXX, CN=3DAC DEV INFRA,"
  validity:  not before Mar 24 13:44:22 2022, ok
             not after  Mar 24 13:44:22 2023, ok (expires in 315 days)
  serial:    08:28
  flags:
  CRL URIs:  http://www.google.fr/my.crl
  certificatePolicies:
             1.2.250.1.214.69.3.1.1.21.1
  authkeyId: c4:52:c7:7c:40:41:b9:eb:ab:db:df:f4:b7:be:f7:b2:bf:61:57:a0
  subjkeyId: f8:4e:a2:ae:5c:3a:1b:40:7a:6a:19:04:38:32:05:62:db:f0:d5:9e
  pubkey:    RSA 2048 bits
  keyid:     42:e7:94:da:9b:07:40:01:8e:40:e5:51:35:fc:10:da:8f:2c:61:3b
  subjkey:   f8:4e:a2:ae:5c:3a:1b:40:7a:6a:19:04:38:32:05:62:db:f0:d5:9e


------------------------------------
The key id needed starts with 42:e7
------------------------------------

The private key was imported into the TPM 2.0  device :

>> tpm2_createprimary -Q -G rsa -g sha256 -C o -c parent.ctx
>> tpm2_import -G rsa -g sha256 -i ${PRIVATE_PEM} -C parent.ctx -u import_r=
sa_key.pub -r import_rsa_key.priv

When i look at the key stored :

>> pki --print --keyid 0x81000001 --type priv
TPM 2.0 via TSS2 v2 available
encryption algorithm is AES-CFB with 128 bits
  privkey:   RSA 2048 bits
  keyid:     b3:ca:e7:cf:c4:c3:f9:37:0f:d5:85:b1:44:8e:68:fb:6d:eb:bc:a3
  subjkey:   c1:d1:31:8c:fc:69:31:26:a2:73:21:d2:d0:d9:a1:f1:b5:e5:55:9d

key id starts with b3:ca ??

>> pki --print --type priv --in ${PRIVATE_PEM}
privkey:   RSA 2048 bits
keyid:     42:e7:94:da:9b:07:40:01:8e:40:e5:51:35:fc:10:da:8f:2c:61:3b
subjkey:   f8:4e:a2:ae:5c:3a:1b:40:7a:6a:19:04:38:32:05:62:db:f0:d5:9e

In the first case we saw a key with bad keyid. When key is taken from file =
the keyid is good and is equal to the certificate key id


I am surely doing something wrong. Any help will be appreciated.


Thx
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============8791413514898554478==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KSSdtIG5vdCBzdXJlIGlmIGFueW9uZSBoZXJlIGNhbiBoZWxwIHlv
dSwgeW91IHNob3VsZCBnbyB0YWxrIHRvIHN0cm9uZ3N3YW46PC9kaXY+CjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KJm5ic3A7IC08YSBocmVmPSJodHRwczov
L3d3dy5zdHJvbmdzd2FuLm9yZy9zdXBwb3J0Lmh0bWwiIGlkPSJMUE5vTFBPV0FMaW5rUHJldmll
dyI+aHR0cHM6Ly93d3cuc3Ryb25nc3dhbi5vcmcvc3VwcG9ydC5odG1sPC9hPjwvZGl2Pgo8ZGl2
IGNsYXNzPSJfRW50aXR5IF9FVHlwZV9PV0FMaW5rUHJldmlldyBfRUlkX09XQUxpbmtQcmV2aWV3
IF9FUmVhZG9ubHlfMSI+PC9kaXY+Cjxicj4KPGRpdiBpZD0iYXBwZW5kb25zZW5kIj48L2Rpdj4K
PGhyIHN0eWxlPSJkaXNwbGF5OmlubGluZS1ibG9jazt3aWR0aDo5OCUiIHRhYmluZGV4PSItMSI+
CjxkaXYgaWQ9ImRpdlJwbHlGd2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBz
YW5zLXNlcmlmIiBzdHlsZT0iZm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9t
OjwvYj4gcm9kb2xwaGUuYXZlcnR5QGZyZWUuZnIgJmx0O3JvZG9scGhlLmF2ZXJ0eUBmcmVlLmZy
Jmd0Ozxicj4KPGI+U2VudDo8L2I+IEZyaWRheSwgTWF5IDEzLCAyMDIyIDc6NTIgQU08YnI+Cjxi
PlRvOjwvYj4gdHBtMkBsaXN0cy4wMS5vcmcgJmx0O3RwbTJAbGlzdHMuMDEub3JnJmd0Ozxicj4K
PGI+U3ViamVjdDo8L2I+IFt0cG0yXSBSZTogdHBtMl9pbXBvcnQgaXMgbW9kaWZ5aW5nIHRoZSBr
ZXlpZCBvZiBteSBwcml2YXRlIGtleTwvZm9udD4KPGRpdj4mbmJzcDs8L2Rpdj4KPC9kaXY+Cjxk
aXYgY2xhc3M9IkJvZHlGcmFnbWVudCI+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMXB0OyI+CjxkaXYgY2xhc3M9IlBsYWluVGV4dCI+SGVsbG8sPGJyPgo8YnI+CmkgYW0g
dHJ5aW5nIHRvIHVzZSBUUE0gMi4wIGRldmljZSBhbmQgU3Ryb25nU3dhbiA1LjkuNi4gSSBoYWQg
dG8gcmVjb21waWwgU3Ryb25nU3dhbiB0byBoYXZlIGRlc2lyZWQgb3B0aW9ucy48YnI+Cjxicj4K
Jmd0OyZndDsgc3lzdGVtY3RsIHJlc3RhcnQgc3Ryb25nc3dhbjxicj4KTWF5IDEzIDExOjUxOjM5
IDAwW0xJQl0gbG9hZGVkIHBsdWdpbnM6IGNoYXJvbi1zeXN0ZW1kIHRwbSBhZXMgZGVzIHJjMiBz
aGEyIHNoYTEgbWQ1IG1nZjEgcmFuZG9tIG5vbmNlIHg1MDkgcmV2b2NhdGlvbiBjb25zdHJhaW50
cyBwdWJrZXkgcGtjczEgcGtjczcgcGtjczEyIHBncCBkbnNrZXkgc3Noa2V5IHBlbSBwa2NzOCBm
aXBzLXByZiBnbXAgY3VydmUyNTUxOSB4Y2JjIGNtYWMgaG1hYyBrZGYgZHJiZyBhdHRyIGtlcm5l
bC1uZXRsaW5rIHJlc29sdmUKIHNvY2tldC1kZWZhdWx0IHN0cm9rZSB2aWNpIHVwZG93biB4YXV0
aC1nZW5lcmljIGNvdW50ZXJzPGJyPgpNYXkgMTMgMTE6NTE6MzkgMDBbSk9CXSBzcGF3bmluZyAx
NiB3b3JrZXIgdGhyZWFkczxicj4KTWF5IDEzIDExOjUxOjM5IDAxW1BUU10gVFBNIDIuMCB2aWEg
VFNTMiB2MiBhdmFpbGFibGU8YnI+Ck1heSAxMyAxMTo1MTozOSAwMVtQVFNdIGVuY3J5cHRpb24g
YWxnb3JpdGhtIGlzIEFFUy1DRkIgd2l0aCAxMjggYml0czxicj4KTWF5IDEzIDExOjUxOjM5IDAx
W0NGR10gbG9hZGVkIFJTQSBwcml2YXRlIGtleSBmcm9tIHRva2VuPGJyPgpNYXkgMTMgMTE6NTE6
MzkgMTFbUFRTXSBUUE0gMi4wIHZpYSBUU1MyIHYyIGF2YWlsYWJsZTxicj4KTWF5IDEzIDExOjUx
OjM5IDExW0xJQl0gbG9hZGVkIGNlcnRpZmljYXRlIGZyb20gVFBNIE5WIGluZGV4IDB4MDE4MDAw
MDQ8YnI+Ck1heSAxMyAxMTo1MTozOSAxMVtDRkddJm5ic3A7Jm5ic3A7IGlkIG5vdCBzcGVjaWZp
ZWQsIGRlZmF1bHRpbmcgdG8gY2VydCBzdWJqZWN0ICdDPUZSLCBPPVhYWFhYWFhYWFhYWFhYWFhY
WFhYWFhYWFhYWFhYWFhYWCwgT1U9MDAwMiAxMjAwMDYwMTAwMDAyNSwgQ049cG9zdGUtWVlZWVkn
PGJyPgo8YnI+CiZndDsmZ3Q7IHN3YW5jdGwgLS1pbml0aWF0ZSAtLWNoaWxkIGhvc3Q8YnI+CltJ
S0VdIGluaXRpYXRpbmcgTWFpbiBNb2RlIElLRV9TQSBjb25uZWN0aW9uMVsxXSB0byAxOTIuMTY4
LjQyLjI1NDxicj4KW0lLRV0gbm8gcHJpdmF0ZSBrZXkgZm91bmQgZm9yICdDPUZSLCBPPVhYWFhY
WFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFgsIE9VPTAwMDIgMTIwMDA2MDEwMDAwMjUsIENO
PXBvc3RlLVlZWVlZJzxicj4KW0NGR10gY29uZmlndXJhdGlvbiB1c2VzIHVuc3VwcG9ydGVkIGF1
dGhlbnRpY2F0aW9uPGJyPgppbml0aWF0ZSBmYWlsZWQ6IGVzdGFibGlzaGluZyBDSElMRF9TQSAn
aG9zdCcgZmFpbGVkPGJyPgo8YnI+CiZndDsmZ3Q7IHN3YW5jdGwgLS1saXN0LWNlcnRzPGJyPgpM
aXN0IG9mIFguNTA5IEVuZCBFbnRpdHkgQ2VydGlmaWNhdGVzPGJyPgo8YnI+CiZuYnNwOyBzdWJq
ZWN0OiZuYnNwOyAmcXVvdDtDPUZSLCBPPVhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWCwg
T1U9MDAwMiAxMjAwMDYwMTAwMDAyNSwgQ049aXRpbmVvLTAzMzQ5OTEmcXVvdDs8YnI+CiZuYnNw
OyBpc3N1ZXI6Jm5ic3A7Jm5ic3A7ICZxdW90O0M9RkFDX0RFVk5HX0lORlJBU1RSVUNUVVJFL0FD
X0RFVk5HX0lORlJBU1RSVUNUVVJFUiwgTz1YWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFgs
IENOPUFDIERFViBJTkZSQSwmcXVvdDs8YnI+CiZuYnNwOyB2YWxpZGl0eTombmJzcDsgbm90IGJl
Zm9yZSBNYXIgMjQgMTM6NDQ6MjIgMjAyMiwgb2s8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBub3QgYWZ0
ZXImbmJzcDsgTWFyIDI0IDEzOjQ0OjIyIDIwMjMsIG9rIChleHBpcmVzIGluIDMxNSBkYXlzKTxi
cj4KJm5ic3A7IHNlcmlhbDombmJzcDsmbmJzcDsmbmJzcDsgMDg6Mjg8YnI+CiZuYnNwOyBmbGFn
czombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPGJyPgombmJzcDsgQ1JMIFVSSXM6Jm5ic3A7IDxh
IGhyZWY9Imh0dHA6Ly93d3cuZ29vZ2xlLmZyL215LmNybCI+aHR0cDovL3d3dy5nb29nbGUuZnIv
bXkuY3JsPC9hPjxicj4KJm5ic3A7IGNlcnRpZmljYXRlUG9saWNpZXM6PGJyPgombmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgMS4yLjI1MC4xLjIxNC42OS4zLjEuMS4yMS4xPGJyPgombmJzcDsgYXV0aGtleUlkOiBj
NDo1MjpjNzo3Yzo0MDo0MTpiOTplYjphYjpkYjpkZjpmNDpiNzpiZTpmNzpiMjpiZjo2MTo1Nzph
MDxicj4KJm5ic3A7IHN1YmprZXlJZDogZjg6NGU6YTI6YWU6NWM6M2E6MWI6NDA6N2E6NmE6MTk6
MDQ6Mzg6MzI6MDU6NjI6ZGI6ZjA6ZDU6OWU8YnI+CiZuYnNwOyBwdWJrZXk6Jm5ic3A7Jm5ic3A7
Jm5ic3A7IFJTQSAyMDQ4IGJpdHM8YnI+CiZuYnNwOyBrZXlpZDombmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgNDI6ZTc6OTQ6ZGE6OWI6MDc6NDA6MDE6OGU6NDA6ZTU6NTE6MzU6ZmM6MTA6ZGE6OGY6
MmM6NjE6M2I8YnI+CiZuYnNwOyBzdWJqa2V5OiZuYnNwOyZuYnNwOyBmODo0ZTphMjphZTo1Yzoz
YToxYjo0MDo3YTo2YToxOTowNDozODozMjowNTo2MjpkYjpmMDpkNTo5ZTxicj4KPGJyPgo8YnI+
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4KVGhlIGtleSBpZCBuZWVk
ZWQgc3RhcnRzIHdpdGggNDI6ZTc8YnI+Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLTxicj4KPGJyPgpUaGUgcHJpdmF0ZSBrZXkgd2FzIGltcG9ydGVkIGludG8gdGhlIFRQTSAy
LjAmbmJzcDsgZGV2aWNlIDo8YnI+Cjxicj4KJmd0OyZndDsgdHBtMl9jcmVhdGVwcmltYXJ5IC1R
IC1HIHJzYSAtZyBzaGEyNTYgLUMgbyAtYyBwYXJlbnQuY3R4PGJyPgomZ3Q7Jmd0OyB0cG0yX2lt
cG9ydCAtRyByc2EgLWcgc2hhMjU2IC1pICR7UFJJVkFURV9QRU19IC1DIHBhcmVudC5jdHggLXUg
aW1wb3J0X3JzYV9rZXkucHViIC1yIGltcG9ydF9yc2Ffa2V5LnByaXY8YnI+Cjxicj4KV2hlbiBp
IGxvb2sgYXQgdGhlIGtleSBzdG9yZWQgOjxicj4KPGJyPgomZ3Q7Jmd0OyBwa2kgLS1wcmludCAt
LWtleWlkIDB4ODEwMDAwMDEgLS10eXBlIHByaXY8YnI+ClRQTSAyLjAgdmlhIFRTUzIgdjIgYXZh
aWxhYmxlPGJyPgplbmNyeXB0aW9uIGFsZ29yaXRobSBpcyBBRVMtQ0ZCIHdpdGggMTI4IGJpdHM8
YnI+CiZuYnNwOyBwcml2a2V5OiZuYnNwOyZuYnNwOyBSU0EgMjA0OCBiaXRzPGJyPgombmJzcDsg
a2V5aWQ6Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGIzOmNhOmU3OmNmOmM0OmMzOmY5OjM3OjBm
OmQ1Ojg1OmIxOjQ0OjhlOjY4OmZiOjZkOmViOmJjOmEzPGJyPgombmJzcDsgc3ViamtleTombmJz
cDsmbmJzcDsgYzE6ZDE6MzE6OGM6ZmM6Njk6MzE6MjY6YTI6NzM6MjE6ZDI6ZDA6ZDk6YTE6ZjE6
YjU6ZTU6NTU6OWQ8YnI+Cjxicj4Ka2V5IGlkIHN0YXJ0cyB3aXRoIGIzOmNhID8/PGJyPgo8YnI+
CiZndDsmZ3Q7IHBraSAtLXByaW50IC0tdHlwZSBwcml2IC0taW4gJHtQUklWQVRFX1BFTX0gPGJy
Pgpwcml2a2V5OiZuYnNwOyZuYnNwOyBSU0EgMjA0OCBiaXRzPGJyPgprZXlpZDombmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgNDI6ZTc6OTQ6ZGE6OWI6MDc6NDA6MDE6OGU6NDA6ZTU6NTE6MzU6ZmM6
MTA6ZGE6OGY6MmM6NjE6M2I8YnI+CnN1YmprZXk6Jm5ic3A7Jm5ic3A7IGY4OjRlOmEyOmFlOjVj
OjNhOjFiOjQwOjdhOjZhOjE5OjA0OjM4OjMyOjA1OjYyOmRiOmYwOmQ1OjllPGJyPgo8YnI+Cklu
IHRoZSBmaXJzdCBjYXNlIHdlIHNhdyBhIGtleSB3aXRoIGJhZCBrZXlpZC4gV2hlbiBrZXkgaXMg
dGFrZW4gZnJvbSBmaWxlIHRoZSBrZXlpZCBpcyBnb29kIGFuZCBpcyBlcXVhbCB0byB0aGUgY2Vy
dGlmaWNhdGUga2V5IGlkPGJyPgo8YnI+Cjxicj4KSSBhbSBzdXJlbHkgZG9pbmcgc29tZXRoaW5n
IHdyb25nLiBBbnkgaGVscCB3aWxsIGJlIGFwcHJlY2lhdGVkLjxicj4KPGJyPgo8YnI+ClRoeDxi
cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CnRw
bTIgbWFpbGluZyBsaXN0IC0tIHRwbTJAbGlzdHMuMDEub3JnPGJyPgpUbyB1bnN1YnNjcmliZSBz
ZW5kIGFuIGVtYWlsIHRvIHRwbTItbGVhdmVAbGlzdHMuMDEub3JnPGJyPgolKHdlYl9wYWdlX3Vy
bClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KPC9kaXY+Cjwvc3Bh
bj48L2ZvbnQ+PC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============8791413514898554478==--

