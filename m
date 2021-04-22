Content-Type: multipart/mixed; boundary="===============9089935788450196465=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] Re: How to use tpm2 tool to unload an external key
Date: Thu, 22 Apr 2021 18:13:09 +0000
Message-ID: <20210422181309.2814.98834@ml01.vlan13.01.org>
In-Reply-To: AM8P194MB1675FC4A2BC6BB2699D1BE73A6469@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9089935788450196465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you, Andreas,

Would you know what command is used to list all objects currently loaded in=
to the TPM?
"tpm2_getcap handles-transient" doesn't work.

Steps:
openssl ecparam -genkey -name prime256v1 -noout -out ec256-key-pair.pem
tpm2_loadexternal -C n -G ecc -r ec256-key-pair.pem -c eckey.ctx
tpm2_getcap handles-transient ----> return nonthing.
--===============9089935788450196465==--

