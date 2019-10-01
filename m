Content-Type: multipart/mixed; boundary="===============2562773830172265069=="
MIME-Version: 1.0
From: Jonas Witschel <diabonas at gmx.de>
Subject: [tpm2] Re: Cannot build tpm2-tss@2.2.3 and tpm2-abrmd@2.0.3 with
 Automake 1.6
Date: Tue, 01 Oct 2019 19:29:14 +0200
Message-ID: <65510ab5-fa9c-9ae5-7d2b-e13de955d035@gmx.de>
In-Reply-To: 20A6FE0AC912764FB8B5BC5A1A7CB92B4255A062@FMSMSX103.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2562773830172265069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 2019-10-01 19:10, Oliver, Dario N wrote:
> I just noticed that I am no longer able to build tpm2-tss and tpm-abrmd (=
the specified versions) with the latest automake 1.6.
> [...]
> This is caused by automake 1.6, there are several other persons having th=
e same problem because of broken compatibility, i.e. https://gitlab.gnome.o=
rg/GNOME/libgdata/issues/24
> The latest versions of tss, abrmd and tools works fine. Maybe there is a =
fix in those version that you could consider porting to the older versions?
> [...]
> Versions that do not work with automake 1.6:
> =

> 	- TPM2_TSS_VERSION=3D2.2.3
> 	- TPM2_ABRMD_VERSION=3D2.0.3
> 	- TPM2_TOOLS_VERSION=3D3.2.0 ?

these build failures are most probably caused by a breaking change in
Autoconf Archive 2019.01.06, see the following pull requests for the
fixes incorporated in the most recent versions:

- tpm2-tss: https://github.com/tpm2-software/tpm2-tss/pull/1238, fixed
by https://github.com/tpm2-software/tpm2-tss/pull/1256
- tpm2-abrmd: https://github.com/tpm2-software/tpm2-abrmd/pull/574
- tpm2-tools: https://github.com/tpm2-software/tpm2-tools/pull/1292

Best,
Jonas


--===============2562773830172265069==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ2dBZEZpRUUwWkduanhpQjg0
UjFQSlorYUdzR09zUzhEc2tGQWwyVGpQTUFDZ2tRYUdzR09zUzgKRHNrZW1CQUFwdUJmZ3REZVda
elU1WE14NHpNeS9hazV4UHorQUZWd05DZUZVRitIRElTK1Y3UWpNV3lvYkg0WAppS0xQbWdHeXNT
WmFYemRlK3VUcmtRQk5mOVQ5UzdXdWgxeFNsbkE1dGtJcjBmdks0TktxaEZWZ3ZuWnU4K2VpCmRF
M2hMWDRBS3ZrTUpiRTlCcGQvV1puRmFNdVJGN3JTR2tscmljUjFndVFZUFBkQkMydERiTU96T2RT
MjlWU3AKVmlaSEpndkorcXF4MVJTNzlPQ2hYTW5LVlhUTmxlWFlybDdNSVJqb1lwZ1paMUs2d3hR
Smc1VUI3bmQ3SkRoOQpKZGJTNEtNSDFWSWRRenI1MmlrcXU4SzhSYzE1dTRpbmtNUC83ellhRG9Q
RWFvVEplMUFibEZEQUJhS3VheGd2CkxsaHJOYXBkVFk5TUQ5UmtKbXFRdUVnWjdGNi9WTzNxdEFt
YjYxSWNGbnZ3Y0tFWm5BSm82RkdLSFloaVhoYTcKM1oxNXBLZTNBZytYeUhZcWZneWpIeDZlYUE3
cDJuR2U0OHAxUWV0dnJpazZoVzN4WW50VDRQYmJVNmRwL0dMTwpudmcvNWwyK1lldFYxYnNiQkhQ
Q2hDSG8wSUlrQ3lHRG9TdlBydlVYbTE4MzNsSlBQN2s3MWxrTHBSbFp0bUlSCnM5RmFnbE4vUFVq
aHQ1eDUxWUIwc2Fkb2dnRE5ENFZ0aGloY2NSRHJjMEQrQUQwbzR3akNianNzT0dNNHZrcmQKb0lF
QU5KRkNmWWgwME00M0Y5QmFQcGtJODVJSitUVDlEMzBSZUZZS1FHdXlFRkhyYnVqT3NRWi9TR2E3
Nk1SSQo3MVhxRHhHc1RkcjFsSHV3cG9yeUQvN2FkZU9hTFdFU2pmSWlXUkNGNXVYdERyb3lqMFk9
Cj1LemRjCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============2562773830172265069==--

