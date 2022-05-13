Content-Type: multipart/mixed; boundary="===============4770791513178334074=="
MIME-Version: 1.0
From: - - <rodolphe.averty at free.fr>
Subject: [tpm2] Re: tpm2_import is modifying the keyid of my private key
Date: Fri, 13 May 2022 12:52:54 +0000
Message-ID: <20220513125254.1878.24023@ml01.vlan13.01.org>
In-Reply-To: 42256C7C-DBBF-EA4C-84CF-86E0B5F43FB3@hxcore.ol
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4770791513178334074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
  flags:     =

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

>> pki --print --type priv --in ${PRIVATE_PEM} =

privkey:   RSA 2048 bits
keyid:     42:e7:94:da:9b:07:40:01:8e:40:e5:51:35:fc:10:da:8f:2c:61:3b
subjkey:   f8:4e:a2:ae:5c:3a:1b:40:7a:6a:19:04:38:32:05:62:db:f0:d5:9e

In the first case we saw a key with bad keyid. When key is taken from file =
the keyid is good and is equal to the certificate key id


I am surely doing something wrong. Any help will be appreciated.


Thx
--===============4770791513178334074==--

