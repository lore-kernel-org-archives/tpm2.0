Content-Type: multipart/mixed; boundary="===============4701771870391414815=="
MIME-Version: 1.0
From: Steffen Schwebel <s.schwebel at uvensys.de>
Subject: [tpm2] Re: Remote Attestation With Tpm2 Tools
Date: Mon, 07 Sep 2020 10:36:56 +0200
Message-ID: <0f2b5375-a8ad-9ad6-5aa0-101c71b128f9@uvensys.de>
In-Reply-To: CABWgujaDpGkTfwdv-Ln69-UeQ_ohe--=0u83ypkKSci3OdFjjQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4701771870391414815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

not something I can help you with I'm afraid.
Just wondering if you know about keylime project https://keylime.dev/

They seem to be the guys to ask in regards to remote attestation.

regards,
Steffen

On 9/6/20 7:54 AM, Hanson Char wrote:
> I just managed to get the 3 scripts provided at
>
> =C2=A0=C2=A0https://tpm2-software.github.io/2020/06/12/Remote-Attestation=
-With-tpm2-tools.html#scripts-for-implementation-of-the-simple-attestation-=
framework
>
> to work with the latest tpm2-tss (built from the latest master
> branches) in Ubuntu 20.04 (x86-64 with Infineon TPM SLB9670) so I
> thought I would share some of what I've found.
>
> 1. For the Infineon TPM device SLB9670, I realized the version of the
> TPM firmware needed to be upgraded (e.g. to the latest version
> 7.85.4555.0).=C2=A0 The tpm2_create command in the script would fail when
> executed=C2=A0against=C2=A0the TPM firmware version=C2=A07.63.3353.0.
>
> 2. The three scripts need to be in their individual directories.=C2=A0 For
> example:
>
> =C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 DN
> =C2=A0 =C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 device_no=
de.sh
> =C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 PCA
> =C2=A0 =C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 private_c=
a.sh
> =C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 SP
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 service_provider.=
sh
>
> 3. I needed to modify the specific golden PCR value, and the location
> of pcr.bin in service_provider.sh.=C2=A0 In particular:
>
> diff --git a/SP/service_provider.sh b/SP/service_provider.sh
> index a0b40ec..b6433d6 100755
> --- a/SP/service_provider.sh
> +++ b/SP/service_provider.sh
> @@ -13,7 +13,8 @@ device_service_request=3D0
>
> =C2=A0# Attestation Data
> =C2=A0GOLDEN_PCR_SELECTION=3D"sha1:0,1,2+sha256:0,1,2"
> -GOLDEN_PCR=3D"59bf9091f4cbbd2a8796bfe086a501c57226c42739dcf8ad323e7493ad=
51e38f"
> +#
> GOLDEN_PCR=3D"59bf9091f4cbbd2a8796bfe086a501c57226c42739dcf8ad323e7493ad5=
1e38f"
> +GOLDEN_PCR=3D"c7b544e0359614c896ed32b0fd7fad43c32ba7e19d4b613cdbda162f78=
4b5781"
>
> =C2=A0# Service Data
> =C2=A0SERVICE_CONTENT=3D"Hello world!"
> @@ -175,7 +176,7 @@ system_software_state_validation() {
> =C2=A0 =C2=A0 software_status_string=3D"Attestation quote signature valid=
ation"
> =C2=A0 =C2=A0 tpm2_checkquote --public d_s_service_aik.pub =C2=A0--qualif=
ication
> "$NONCE" \
> =C2=A0 =C2=A0 --message attestation_quote.dat --signature
> attestation_quote.signature \
> - =C2=A0 --pcr pcr.bin -Q
> + =C2=A0 --pcr ../DN/pcr.bin -Q
> =C2=A0 =C2=A0 retval=3D$?
> =C2=A0 =C2=A0 rm -f attestation_quote.signature
> =C2=A0 =C2=A0 if [ $retval =3D=3D 1 ];then
>
> Hope this helps anyone who may try to run the scripts.
>
> Meanwhile, I wonder how the sequence diagram and the scripts may
> differ when privacy is not a concern; and would appreciate=C2=A0any
> pointers or hints.
>
> Regards,
> Hanson
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

-- =

Steffen Schwebel
Mail: s.schwebel(a)uvensys.de
uvensys GmbH

Firmensitz und Sitz der Gesellschaft:
uvensys GmbH
Schorbachstra=C3=9Fe 11
35510 Butzbach

HRB: AG Friedberg, 7780
USt-Id: DE282879294

Gesch=C3=A4ftsf=C3=BChrer:
Dr. Thomas Licht, t.licht(a)uvensys.de
Volker Lieder, v.lieder(a)uvensys.de

Mail: info(a)uvensys.de
Internet: www.uvensys.de

Durchwahl: 06403 789 36 22 =

Hotline: 06403 789 36 88
Zentrale: 06403 789 36 00
Fax: 06403 789 36 99
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

Jegliche Stellungnahmen und Meinungen dieser E-Mail sind
alleine die des Autors und nicht notwendigerweise die der
Firma. Falls erforderlich, k=C3=B6nnen Sie eine gesonderte
schriftliche Best=C3=A4tigung anfordern.

Any views or opinions presented in this email are solely
those of the author and do not necessarily represent those
of the company. If verification is required please request
a hard-copy version.



--===============4701771870391414815==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
Q0FBR0JRSmZWZkVvQUFvSkVCTDQ0MTF0UWp6MVBqRVAvMHZKMjkwOUdyTllTc2NqZ0F1a09vZnkK
cTJvWFMrTnR6VFQ5RnVsVVJlc0lkN1VXbE1hY1I1blNkbWtZUW1QM3UrRHMvRVdvQnRLQzAzWW9O
b2J0LzN1cgpCSU9IN0FkM0IwdmdnVWVNKy9sOXl4U0pIM0RTYmtobDFmeVJqWUF0aUl2aFg4clFi
NlM1NU11TXBLQ3FFc2djCjNORlBOamQ2WUk2WHczenp0MVd4MUtTTkUvVUNOWWExWW43ZDc4d2pZ
WjQ5SU5VSENiOHBoTjVTeGIzWk9CbnoKbTJUWG5yeUVONy9XbEhvWHMwOVY0b21LbU8yNTkrNjdJ
MXFENE8rVXorbHpGMU9PMmN3czhlTk9kajFpYzQ0UAprV1ZVeFFxNDFtUFVTbDNDdzdiVnJjMGhM
WlNMNU1Dc0NycDB2SFZGU3cxc2JYaFdSSm1sZnR5eTcvdGg5T3J4Ck00MXlKNGsyd2FaZEVWUm9k
NlVPY3hvR254d2xyVFJxVENieTJzY2IrUGpsRGd3dEJ1SjlGaWJLVGkyUWl6MmgKd0wzL1FpZWNM
cjErL3AzZjBvUkdPV1ZtT1VmZCtDaCtPUDRZWlkxTWVjRmk0ek53eWNjVUl5TXpkTW9aSXNKcgpy
cGxxUFFpY3k1RC9rSUdXY3NRbndHaUJuRmV3N1o4aFA2TmFYamdnaGY0OGg5cWpQQmNlZ0FPQ3lO
bldqUFlUCjM0VDJuTHpHQ0c3ekYwRHNJSzRZQUkxM0pZNGxTYUlORlZ2UjdHcitvUHJITDdsbFVI
cGlReXplRkNVNHVMWTQKby9kem5xbWFQd0drRWJUUzlsQ2dURHg0ck9PWEZhVFU3TXBpNDc1OXhu
bzBDd3BrbWNSUDVRZVB4eVpVZGV2NwpmMEdtSnJBK3VDR05FOGwrTzk4Ugo9RFdTSAotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============4701771870391414815==--

