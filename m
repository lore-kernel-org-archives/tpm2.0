Content-Type: multipart/mixed; boundary="===============8526561695489994258=="
MIME-Version: 1.0
From: Steffen Schwebel <s.schwebel at uvensys.de>
Subject: [tpm2] Re: tpm2-pkcs11 and certificates, also Linux Networking
Date: Thu, 16 Jan 2020 20:01:34 +0100
Message-ID: <e8e5b6b3-e876-9a66-e499-cc3bcb98988c@uvensys.de>
In-Reply-To: 20200116184920.2574.70025@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8526561695489994258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I managed to get that working as well.

I also asked at NetworkManager and wpa_supplicant mailing list.

Seems that NM has support for tpm2-tss at versions > 1.20
Not sure yet about wpa_supplicant.

Since I couldnt store the client cert via PKCS11, I point wpa_supplicant
to a file on disk

client_cert=3D"/home/steffenschwebel/Projects/PKI_network/hardware.crt"
private_key=3D"pkcs11:model=3D;manufacturer=3DSTMicro;serial=3D000000000000=
0000;token=3Dsoveryimportant;id=3D%F2%BE%D0%AB%C3%81%72%8A%B5%40%69%31%D1%3=
8%28%8C%9D%BB%EE%9E;object=3Dklarna;type=3Dprivate"
pin=3D"456456"
				=

regards,
Steffen	=

				=


On 1/16/20 7:49 PM, nicolasoliver03(a)gmail.com wrote:
> Hi Steffen,
>
> In our side, we were able to get wpa_supplicant, tpm2_pkcs11, and EAP-TLS=
 to authenticate a device in a corporate network.
> It requires a wireless AP or router that supports EAP-TLS, and a Radius s=
erver for auth. =

>
> There is a thread in this mailing list about that here https://lists.01.o=
rg/hyperkitty/list/tpm2(a)lists.01.org/thread/AYUBCAFCCXITEVSWA4IFC466LYS6Z=
IYX/
> There are also commits in tpm2-pkcs11 to enable support for wpa_supplican=
t https://github.com/tpm2-software/tpm2-pkcs11/pull/366
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s



--===============8526561695489994258==--

