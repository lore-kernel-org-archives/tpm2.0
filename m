Content-Type: multipart/mixed; boundary="===============3238263019605105846=="
MIME-Version: 1.0
From: khongyew.ste at gmail.com
Subject: [tpm2] Signing and verifying signature
Date: Tue, 29 Oct 2019 02:08:11 +0000
Message-ID: <20191029020811.2734.31876@new-ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3238263019605105846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

My test setup is as follow:
- Ubuntu 19.04 (x86_64)
- TPM Simulator (ibmtpm1332)
- tpm2-abrmd (version 2.1.0)
- tpm2 tools (version 3.1.3)

I'm trying to perform signing and verifying the signature

My steps are as follow:
- Create an example message using random
  - tpm2_getrandom -o sample.msg 32
- Create Primary Object
  - tpm2_createprimary -H o -g sha256 -G rsa -C primary.ctx
- Generate RSA keypair
  - tpm2_create -c primary.ctx -g sha256 -G rsa -u key.pub -r key.priv
- Load RSA keypair into TPM
  - tpm2_load -c primary.ctx -u key.pub -r key.priv -C subkey.ctx
- Sign the message with public key
  - tpm2_sign -c subkey.ctx -f plain -g sha256 -m sample.msg -s encrypted_h=
ash.msg
- Verify the signature
  - tpm2_verifysignature -c subkey.ctx -g sha256 -m sample.msg -s encrypted=
_hash.msg -t ticket

I am getting the following error:
ERROR: Tss2_Sys_VerifySignature failed, error code: 0x2d2
ERROR: Verify signature failed!
ERROR: Unable to run tpm2_verifysignature
--===============3238263019605105846==--

