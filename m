Content-Type: multipart/mixed; boundary="===============9049497395009450065=="
MIME-Version: 1.0
From: Matthew Giassa <matthew at giassa.net>
Subject: [tpm2] Re: Question: standardized development environment for TPM2
 testing, regressions, etc.
Date: Mon, 19 Oct 2020 16:20:23 +0000
Message-ID: <20201019162023.2812.6730@ml01.vlan13.01.org>
In-Reply-To: SN6PR11MB3437885D999C060D9D5E665AB81E0@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9049497395009450065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

One particular test I was thinking of was injecting bogus messages into the=
 TPM2 event log, and then using tpm2-tools to parse it (i.e. binary =3D=3D>=
 ASCII) and then validate (i.e. TPM_GENERATED) against each entry. Also, th=
rowing in an OSCP responder container into the mix and doing some remote at=
testation tests (including failing cases where we deliberate revoke certs i=
n the responder).
--===============9049497395009450065==--

