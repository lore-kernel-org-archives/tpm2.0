Content-Type: multipart/mixed; boundary="===============6157654411514922226=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2-pkcs11 and certificates, also Linux Networking
Date: Thu, 16 Jan 2020 22:45:00 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E67070@ORSMSX101.amr.corp.intel.com>
In-Reply-To: e8e5b6b3-e876-9a66-e499-cc3bcb98988c@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6157654411514922226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Steffen Schwebel [mailto:s.schwebel(a)uvensys.de]
> Sent: Thursday, January 16, 2020 1:02 PM
> To: tpm2(a)lists.01.org >> tpm2 <tpm2(a)lists.01.org>
> Subject: [tpm2] Re: tpm2-pkcs11 and certificates, also Linux Networking
> =

> Hi,
> =

> I managed to get that working as well.
> =

> I also asked at NetworkManager and wpa_supplicant mailing list.
> =

> Seems that NM has support for tpm2-tss at versions > 1.20 Not sure yet ab=
out
> wpa_supplicant.
> =

> Since I couldnt store the client cert via PKCS11, I point wpa_supplicant =
to a file on
> disk

You should be able to now via tpm2_ptool addcert on the master branch. I ha=
ve that
Feature heading for v1.1.

> =

> client_cert=3D"/home/steffenschwebel/Projects/PKI_network/hardware.crt"
> private_key=3D"pkcs11:model=3D;manufacturer=3DSTMicro;serial=3D0000000000=
000000;t
> oken=3Dsoveryimportant;id=3D%F2%BE%D0%AB%C3%81%72%8A%B5%40%69%31%D
> 1%38%28%8C%9D%BB%EE%9E;object=3Dklarna;type=3Dprivate"
> pin=3D"456456"
> =

> regards,
> Steffen
> =

> =

> On 1/16/20 7:49 PM, nicolasoliver03(a)gmail.com wrote:
> > Hi Steffen,
> >
> > In our side, we were able to get wpa_supplicant, tpm2_pkcs11, and EAP-T=
LS to
> authenticate a device in a corporate network.
> > It requires a wireless AP or router that supports EAP-TLS, and a Radius=
 server
> for auth.
> >
> > There is a thread in this mailing list about that here
> > https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/thread/AYUBCAFC
> > CXITEVSWA4IFC466LYS6ZIYX/ There are also commits in tpm2-pkcs11 to
> > enable support for wpa_supplicant
> > https://github.com/tpm2-software/tpm2-pkcs11/pull/366
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email to
> > tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =

> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============6157654411514922226==--

