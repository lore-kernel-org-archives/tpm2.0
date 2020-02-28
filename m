Content-Type: multipart/mixed; boundary="===============6734281170236029923=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Question about RSA 2048 AK key size
Date: Fri, 28 Feb 2020 15:16:32 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E96F5D@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200222000550.2820.79421@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6734281170236029923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I ran commands like:
tpm2_create -C primary.ctx -G aes128 -u aes128.pub -r aes128.priv

For algorithms:
aes128
aes256
ecc256
ecc384
rsa1024
rsa2048

The resulting public and private files and sizes are as follows.
Output is from ls -lah

Public:
-rw-r--r-- 1 wcrobert wcrobert  52 Feb 28 09:07 aes128.pub
-rw-r--r-- 1 wcrobert wcrobert  52 Feb 28 09:07 aes256.pub
-rw-r--r-- 1 wcrobert wcrobert  88 Feb 28 09:08 ecc256.pub
-rw-r--r-- 1 wcrobert wcrobert 120 Feb 28 09:09 ecc384.pub
-rw-r--r-- 1 wcrobert wcrobert 152 Feb 28 09:07 rsa1024.pub
-rw-r--r-- 1 wcrobert wcrobert 280 Feb 28 09:07 rsa2048.pub

Private:
-rw-r--r-- 1 wcrobert wcrobert 144 Feb 28 09:07 aes128.priv
-rw-r--r-- 1 wcrobert wcrobert 160 Feb 28 09:07 aes256.priv
-rw-r--r-- 1 wcrobert wcrobert 128 Feb 28 09:08 ecc256.priv
-rw-r--r-- 1 wcrobert wcrobert 144 Feb 28 09:09 ecc384.priv
-rw-r--r-- 1 wcrobert wcrobert 160 Feb 28 09:07 rsa1024.priv
-rw-r--r-- 1 wcrobert wcrobert 224 Feb 28 09:07 rsa2048.priv

As you can see I get all different sizes, but they should be bounded by str=
uctures
TPM2B_PRIVATE and TPM2B_PUBLIC respectively.

The sizes in bytes are as follows:
TPM2B_PRIVATE: 1552
TPM2B_PUBLIC: 616

> -----Original Message-----
> From: Chenxi Z [mailto:cxzhang1981(a)hotmail.com]
> Sent: Friday, February 21, 2020 6:06 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Question about RSA 2048 AK key size
> =

> I created a 2048 RSA AK by using the command below :
> tpm2_createak -C 0x81010001 -c ak.ctx -u ak.pub -r ak.priv -n ak.name -P
> dummypwd -p dummypwd
> =

> ak.priv file size =3D 224 bytes
> #stat --printf=3D"%s" ak.priv
> 224
> =

> =

> ak.pub file size =3D 282 bytes.
> $stat --printf=3D"%s" ak.pub
> 282
> =

> Question: Do the AK private key and public key always have the same key s=
izes,
> ie, 224 and 282?
> Is there any possibility that the key size could be changed because of ra=
ndom
> number or big prime number changes during key generation?
> =

> TPM2 tools version:
> tpm2-tools-4.1.1
> tpm2-abrmd-2.3.1
> tpm2-tss-2.3.2
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============6734281170236029923==--

