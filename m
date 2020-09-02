Content-Type: multipart/mixed; boundary="===============0415978516835896660=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: IMA determinism
Date: Wed, 02 Sep 2020 20:31:33 +0000
Message-ID: <SN6PR11MB3437752697818609D040F9CAB82F0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20200902153515.2753.6393@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0415978516835896660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Section three is the relevant bit:

"Every user generates and uses a new key (ephemeral key) every time an atte=
station blob has to be signed. There are some unique challenges with this. =
If every attestation blob is signed with a brand-new key, how to infer the =
anonymous identity at the minimum to determine the genuineness of the platf=
orm and hence the attestation. It then follows that we need an anonymous id=
entity that is cryptographically bound to a unique trusted identity and tha=
t the unique identity is never revealed to any entity other than the Privac=
y-CA."

You generate a new AIK every-time.

You would follow the flow as illustrated by:
"Service request Part 1 (Platform Anonymous Identity Validation)"

The takeaway here, is that the privacy-ca always knows who it is, but the s=
ervice provider does not. So you trust the privacy CA with your privacy in =
that model.
 =

Bill


> -----Original Message-----
> From: Eduardo Falc=C3=A3o <eduardolfalcao(a)gmail.com>
> Sent: Wednesday, September 2, 2020 10:35 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: IMA determinism
> =

> Thanks, Roberts and Nicolas.
> =

> Other doubt that arose here is about privacy...
> =

> In the attestation process, the machine being attested sends the public p=
ortion
> of its EK to the Attestor, and thus the Attestor could identify the machi=
ne by this
> key (if it requests attestation multiple times).
> Some considerations are pointed here (https://tpm2-
> software.github.io/2020/06/12/Remote-Attestation-With-tpm2-
> tools.html#privacy-considerations), where different AIK, for instance, co=
uld be
> generated for each user, but they apply only for scenarios where the mach=
ine
> being attested has multiple users. If the machine itself doesn't have any=
 user,
> then using multiple AIK will not make any difference.
> =

> Do you have any alternative or thoughts for this situation?
> =

> Best regards
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============0415978516835896660==--

