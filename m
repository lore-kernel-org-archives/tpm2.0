Content-Type: multipart/mixed; boundary="===============8845578643452923875=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Dropping OSSL 1.0.2 support
Date: Wed, 02 Jun 2021 19:54:18 +0000
Message-ID: <SN6PR11MB343732ADB043E6266542EBB6B83D9@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8845578643452923875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

With OpenSSL 3.0 in alpha releases and soon to be beta releases, we have un=
dergone looking at the work it will take to port to openssl 3.0. 3.0 essent=
ially forces our hands away from the lower level APIs and into the EVP api'=
s, AFAIK. Because of this, supporting openssl 1.0.2 will be more difficult.=
 OSSL 1.0.2 is EOL, and most distros I am aware of that have 1.0.2 are EOL =
as well.

So the question is, if we kill OSSL < 1.1.0 support, how many folks will be=
 disrupted by that?

Thanks,
Bill
--===============8845578643452923875==--

