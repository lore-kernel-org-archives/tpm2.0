Content-Type: multipart/mixed; boundary="===============0845191421288870303=="
MIME-Version: 1.0
From: Anderson, Daniel <daniel.anderson at intel.com>
Subject: Re: [tpm2] tpm2-abrmd can't connect to IBM's tpm_server
Date: Thu, 01 Mar 2018 20:54:29 +0000
Message-ID: <207C810BE4BA2440832668E0F208BFD3AF75F6@ORSMSX108.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0845191421288870303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For me at, I found this did not work when connecting to tpm2-abrmd:
	$ sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti socket
I used this (I added a "=3D" after "--tcti"):
	$ sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti=3Dsocket

Dan


--===============0845191421288870303==--

