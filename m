Content-Type: multipart/mixed; boundary="===============7781266164778867293=="
MIME-Version: 1.0
From: Rodolphe AVERTY <rodolphe.averty at free.fr>
Subject: [tpm2] Re: Can't se't signature algorithm when using tpm2_import
Date: Tue, 24 May 2022 07:18:11 +0000
Message-ID: <20220524071811.2134.8706@ml01.vlan13.01.org>
In-Reply-To: SN6PR11MB34378B71B2EB8F1032918F33B8D39@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7781266164778867293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

i checkout the branch and compil tpm2-tools.

So know when i do =


>> ......
>>tpm2_import -G rsa2048:rsassa-sha256 -g sha256 -i ${PRIVATE_PEM} -C paren=
t.ctx -u import_rsa_key.pub -r import_rsa_key.priv
>> .....
>> pki --print --type priv --keyid 0x81000002
TPM 2.0 via TSS2 v2 available
signature algorithm is RSASSA with SHA256 hash
  privkey:   RSA 2048 bits
  keyid:     42:e7:94:da:9b:07:40:01:8e:40:e5:51:35:fc:10:da:8f:2c:61:3b
  subjkey:   f8:4e:a2:ae:5c:3a:1b:40:7a:6a:19:04:38:32:05:62:db:f0:d5:9e

and the result is the one expected.

But the key doesn't work with StrongSwan i have :
<....>
May 23 15:57:05 01[PTS] TPM 2.0 via TSS2 v2 available
May 23 15:57:05 01[PTS] signature algorithm is RSASSA with SHA256 hash
May 23 15:57:05 01[CFG] loaded RSA private key from token
May 23 15:57:05 09[PTS] TPM 2.0 via TSS2 v2 available
May 23 15:57:05 09[LIB] loaded certificate from TPM NV index 0x01800004
<.....>
TPM 2.0 - unknown hash algorithm not supported by TPM
<.....>

And i think it's a StrongSwan problem!!!

Thanks
--===============7781266164778867293==--

