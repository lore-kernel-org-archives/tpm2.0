Content-Type: multipart/mixed; boundary="===============7468272777512728451=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: tpm2-pkcs11 and certificates, also Linux Networking
Date: Thu, 16 Jan 2020 18:49:20 +0000
Message-ID: <20200116184920.2574.70025@ml01.vlan13.01.org>
In-Reply-To: 20200116115139.2574.47204@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7468272777512728451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Steffen,

In our side, we were able to get wpa_supplicant, tpm2_pkcs11, and EAP-TLS t=
o authenticate a device in a corporate network.
It requires a wireless AP or router that supports EAP-TLS, and a Radius ser=
ver for auth. =


There is a thread in this mailing list about that here https://lists.01.org=
/hyperkitty/list/tpm2(a)lists.01.org/thread/AYUBCAFCCXITEVSWA4IFC466LYS6ZIY=
X/
There are also commits in tpm2-pkcs11 to enable support for wpa_supplicant =
https://github.com/tpm2-software/tpm2-pkcs11/pull/366
--===============7468272777512728451==--

