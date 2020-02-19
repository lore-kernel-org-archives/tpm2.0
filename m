Content-Type: multipart/mixed; boundary="===============5181419825345069636=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: Need Help to parse AK public key
Date: Wed, 19 Feb 2020 23:24:21 +0000
Message-ID: <20200219232421.2820.78220@ml01.vlan13.01.org>
In-Reply-To: 20200219230512.2820.70066@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5181419825345069636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You can also use tpm2_readpublic for an already created one!

tpm2_readpublic -c ak.ctx -f PEM -o ak.pem

tpm2_readpublic -c 0x81010001 -f PEM -o ak.pem
--===============5181419825345069636==--

