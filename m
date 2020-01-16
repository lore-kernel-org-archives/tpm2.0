Content-Type: multipart/mixed; boundary="===============1294432645166776237=="
MIME-Version: 1.0
From: s.schwebel at uvensys.de
Subject: [tpm2] Re: some questions about Identity
Date: Thu, 16 Jan 2020 11:34:21 +0000
Message-ID: <20200116113421.2574.87385@ml01.vlan13.01.org>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E66B9F@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1294432645166776237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Alrite, thanks again.

Thats a lot of information. =

I thought I could use the EK to identify the device, but if I understand co=
rrectly thats a SHOULD NOT in the spec you provided, for user owned systems.
Also it can be turned off, I guess.

Reading out the NV gives me the expected certificate, so thats nice

$ tpm2_nvread 0x1C00002 | openssl x509 -inform der -in - -noout -text | gre=
p Issuer
        Issuer: C =3D CH, O =3D STMicroelectronics NV, CN =3D STM TPM EK In=
termediate CA 05
                CA Issuers - URI:http://secure.globalsign.com/stmtpmekint05=
.crt

Is there a list of commonly used NV Indexes?

Thanks again for the help
--===============1294432645166776237==--

