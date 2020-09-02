Content-Type: multipart/mixed; boundary="===============7818276060869679968=="
MIME-Version: 1.0
From: =?utf-8?q?Eduardo_Falc=C3=A3o_=3Ceduardolfalcao_at_gmail=2Ecom=3E?=
Subject: [tpm2] Re: IMA determinism
Date: Wed, 02 Sep 2020 15:35:15 +0000
Message-ID: <20200902153515.2753.6393@ml01.vlan13.01.org>
In-Reply-To: SN6PR11MB3437F19461CDDFB0149F0554B87F0@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7818276060869679968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks, Roberts and Nicolas.

Other doubt that arose here is about privacy...

In the attestation process, the machine being attested sends the public por=
tion of its EK to the Attestor, and thus the Attestor could identify the ma=
chine by this key (if it requests attestation multiple times). =

Some considerations are pointed here (https://tpm2-software.github.io/2020/=
06/12/Remote-Attestation-With-tpm2-tools.html#privacy-considerations), wher=
e different AIK, for instance, could be generated for each user, but they a=
pply only for scenarios where the machine being attested has multiple users=
. If the machine itself doesn't have any user, then using multiple AIK will=
 not make any difference.

Do you have any alternative or thoughts for this situation?

Best regards
--===============7818276060869679968==--

