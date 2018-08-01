Content-Type: multipart/mixed; boundary="===============6288974885779814245=="
MIME-Version: 1.0
From: Agerstam, Mats G <mats.g.agerstam at intel.com>
Subject: Re: [tpm2] AIK Enrollment Process implementations using tpm2-tools or
 similar
Date: Wed, 01 Aug 2018 16:38:33 +0000
Message-ID: <15CA292A0CD93849BA2105D0F0B2D8A1EB980A80@ORSMSX105.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649C0AAED@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6288974885779814245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think Open CIT (Cloud Integrity Technology) supersedes OpenAttestation. M=
ore details on that can be found here: =

https://github.com/opencit/opencit/wiki/Open-CIT-3.2-Product-Guide

-----Original Message-----
From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Roberts, Willi=
am C
Sent: Wednesday, August 1, 2018 9:29 AM
To: Peter Magnusson <blaufish.public.email(a)gmail.com>; tpm2(a)lists.01.org
Subject: Re: [tpm2] AIK Enrollment Process implementations using tpm2-tools=
 or similar

I dug around and someone pointed me to this:
https://github.com/OpenAttestation/OpenAttestation

Unfortunately, I know nothing beyond that (typical problem for me).

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Peter Magnus=
son
> Sent: Wednesday, August 1, 2018 3:55 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] AIK Enrollment Process implementations using tpm2-tools or
> similar
> =

> Hello,
> =

> TL;DR:
> Is there any AIK Enrollment / POP examples available using tpm2-tools (or=
 other
> open source tools, code bases)?
> =

> Long version:
> =

> I had some success with tpm2-tools based attestation, e.g. generating AIK,
> extracting EKpub and EKCert from TPM, performing the tpm2 quotation, etc.
> =

> However, my understanding of the relevant spec's is that for TPM2 User De=
vices
> (and many other devices), the EK is limited to performing the Enrolment
> Processes (Proof of Possession). So to complete a meaningful Remote
> Attestation flow, there is a need to get AIKCert externally using AIK Enr=
ollment
> Process[1] against an Attestation CA (formerly known as Privacy CA).
> =

> I fail to find public examples (tools, example code, etc) of the enrolmen=
t step.
> Most of what I find when googling, for example strongswan's TPM pages,
> appears to skip the AIK Enrollment Process / POP and just issue the the c=
ertificate
> without any proof of possession.
> =

> Any links or insights would be appreciated =3D)
> =

> =

> [1]. Section 2.3.
> https://trustedcomputinggroup.org/wp-
> content/uploads/IWG_CMC_Profile_Cert_Enrollment_v1_r7.pdf
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://lists.01.org/mailman/listinfo/tpm2

--===============6288974885779814245==--

