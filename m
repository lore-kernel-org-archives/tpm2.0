Content-Type: multipart/mixed; boundary="===============5307392580034849027=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] Question about RSA 2048 AK key size
Date: Sat, 22 Feb 2020 00:05:50 +0000
Message-ID: <20200222000550.2820.79421@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5307392580034849027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I created a 2048 RSA AK by using the command below :
tpm2_createak -C 0x81010001 -c ak.ctx -u ak.pub -r ak.priv -n ak.name -P du=
mmypwd -p dummypwd

ak.priv file size =3D 224 bytes
#stat --printf=3D"%s" ak.priv
224


ak.pub file size =3D 282 bytes.
$stat --printf=3D"%s" ak.pub
282

Question: Do the AK private key and public key always have the same key siz=
es, ie, 224 and 282?
Is there any possibility that the key size could be changed because of rand=
om number or big prime number changes during key generation?

TPM2 tools version:
tpm2-tools-4.1.1
tpm2-abrmd-2.3.1
tpm2-tss-2.3.2
--===============5307392580034849027==--

