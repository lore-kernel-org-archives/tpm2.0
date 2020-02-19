Content-Type: multipart/mixed; boundary="===============9141816364304515914=="
MIME-Version: 1.0
From: chenxiz at fb.com
Subject: [tpm2] Need Help to parse AK public key
Date: Wed, 19 Feb 2020 22:32:42 +0000
Message-ID: <20200219223242.2820.81088@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9141816364304515914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I created a 2048 RSA AK by using the command below :
tpm2_createak -C 0x81010001 -c ak.ctx -u ak.pub -r ak.priv -n ak.name -P=C2=
=A0dummypwd -p dummypwd

ak.pub file size =3D 282 bytes.
$stat --printf=3D"%s" ak.pub
282

I would like to parse the RSA public key, i.e., e and n, Can anyone help me=
 elaborate the ak.pub format or is there any tool I can use to parse it?

TPM2 tools version (all are the latest):
tpm2-tools-4.1.1
tpm2-abrmd-2.3.1
tpm2-tss-2.3.2


Thanks,
Chenxi
--===============9141816364304515914==--

