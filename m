Content-Type: multipart/mixed; boundary="===============6105479045923083312=="
MIME-Version: 1.0
From: muthu.smk at gmail.com
Subject: [tpm2] Re: Usage of openssl command line API as library function
 along with tpm-tss engine
Date: Tue, 28 Apr 2020 12:33:06 +0000
Message-ID: <20200428123306.2763.94944@ml01.vlan13.01.org>
In-Reply-To: 20200428113332.2763.33954@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6105479045923083312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

seems this iesys_crypto_sym_aes_encrypt() API and iesys_crypto_pk_encrypt()=
 API uses TPM for encryption and decryption .  What i want is to use pure o=
penssl API (s/w based encryption) with the input of tpm generated hardware =
priv key and random key and do encrypt & decrypt it as explained in the fir=
st thread .
--===============6105479045923083312==--

