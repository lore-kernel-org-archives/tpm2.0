Content-Type: multipart/mixed; boundary="===============6813381525350337196=="
MIME-Version: 1.0
From: Peter Magnusson <blaufish.public.email at gmail.com>
Subject: [tpm2] AIK Enrollment Process implementations using tpm2-tools or
 similar
Date: Wed, 01 Aug 2018 12:55:18 +0200
Message-ID: <CANtcRX5ei6dWhgx=ETWy0TS013MN89v64ynhbLxn6PY3qg-cfw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6813381525350337196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

TL;DR:
Is there any AIK Enrollment / POP examples available using tpm2-tools
(or other open source tools, code bases)?

Long version:

I had some success with tpm2-tools based attestation, e.g. generating
AIK, extracting EKpub and EKCert from TPM, performing the tpm2
quotation, etc.

However, my understanding of the relevant spec's is that for TPM2 User
Devices (and many other devices), the EK is limited to performing the
Enrolment Processes (Proof of Possession). So to complete a meaningful
Remote Attestation flow, there is a need to get AIKCert externally
using AIK Enrollment Process[1] against an Attestation CA (formerly
known as Privacy CA).

I fail to find public examples (tools, example code, etc) of the
enrolment step. Most of what I find when googling, for example
strongswan's TPM pages, appears to skip the AIK Enrollment Process /
POP and just issue the the certificate without any proof of
possession.

Any links or insights would be appreciated =3D)


[1]. Section 2.3.
https://trustedcomputinggroup.org/wp-content/uploads/IWG_CMC_Profile_Cert_E=
nrollment_v1_r7.pdf

--===============6813381525350337196==--

