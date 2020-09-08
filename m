Content-Type: multipart/mixed; boundary="===============8653026013184647051=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Remote Attestation With Tpm2 Tools
Date: Tue, 08 Sep 2020 14:53:18 +0000
Message-ID: <SN6PR11MB34372574521A9368860DCB41B8290@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: CABWgujaDpGkTfwdv-Ln69-UeQ_ohe--=0u83ypkKSci3OdFjjQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8653026013184647051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Hanson Char <hanson.char(a)gmail.com>
> Sent: Sunday, September 6, 2020 12:55 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Remote Attestation With Tpm2 Tools
> =

> I just managed to get the 3 scripts provided at
> =

>   https://tpm2-software.github.io/2020/06/12/Remote-Attestation-With-tpm2-
> tools.html#scripts-for-implementation-of-the-simple-attestation-framework
> =

> to work with the latest tpm2-tss (built from the latest master branches) =
in
> Ubuntu 20.04 (x86-64 with Infineon TPM SLB9670) so I thought I would share
> some of what I've found.
> =

> 1. For the Infineon TPM device SLB9670, I realized the version of the TPM
> firmware needed to be upgraded (e.g. to the latest version 7.85.4555.0). =
 The
> tpm2_create command in the script would fail when executed against the TPM
> firmware version 7.63.3353.0.
> =

> 2. The three scripts need to be in their individual directories.  For exa=
mple:
> =

>     =E2=94=9C=E2=94=80=E2=94=80 DN
>     =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 device_node.sh
>     =E2=94=9C=E2=94=80=E2=94=80 PCA
>     =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 private_ca.sh
>     =E2=94=94=E2=94=80=E2=94=80 SP
>         =E2=94=94=E2=94=80=E2=94=80 service_provider.sh
> =

> =

> 3. I needed to modify the specific golden PCR value, and the location of =
pcr.bin in
> service_provider.sh.  In particular:
> =

> diff --git a/SP/service_provider.sh b/SP/service_provider.sh index
> a0b40ec..b6433d6 100755
> --- a/SP/service_provider.sh
> +++ b/SP/service_provider.sh
> @@ -13,7 +13,8 @@ device_service_request=3D0
> =

>  # Attestation Data
>  GOLDEN_PCR_SELECTION=3D"sha1:0,1,2+sha256:0,1,2"
> -
> GOLDEN_PCR=3D"59bf9091f4cbbd2a8796bfe086a501c57226c42739dcf8ad323e7493a
> d51e38f"
> +#
> GOLDEN_PCR=3D"59bf9091f4cbbd2a8796bfe086a501c57226c42739dcf8ad323e7493a
> d51e38f"
> +GOLDEN_PCR=3D"c7b544e0359614c896ed32b0fd7fad43c32ba7e19d4b613cdbda16
> 2f784b5781"
> =

>  # Service Data
>  SERVICE_CONTENT=3D"Hello world!"
> @@ -175,7 +176,7 @@ system_software_state_validation() {
>     software_status_string=3D"Attestation quote signature validation"
>     tpm2_checkquote --public d_s_service_aik.pub  --qualification "$NONCE=
" \
>     --message attestation_quote.dat --signature attestation_quote.signatu=
re \
> -   --pcr pcr.bin -Q
> +   --pcr ../DN/pcr.bin -Q
>     retval=3D$?
>     rm -f attestation_quote.signature
>     if [ $retval =3D=3D 1 ];then
> =

> =

> =

> Hope this helps anyone who may try to run the scripts.
> =

> Meanwhile, I wonder how the sequence diagram and the scripts may differ w=
hen
> privacy is not a concern; and would appreciate any pointers or hints.

Yeah you can skip the whole makecredential and activate credential parts, a=
nd you could just
sign the quote with a fixed AIK (Attestation Identity Key). That would remo=
ve annonimity, but
you would know that key is the TPM by:
1. Knowing on the server side receiving the quote that this public key is v=
alid known to a TPM.
2. Using TPM2_Cerfify to certify that the key with name X is loaded into th=
e TPM, and you trust
     Its parents and that name. The name of the signing key for the quote i=
s in the attestation data.
     So you could certify the key is in the TPM using the certify command a=
nd another known public key,
     Like the endorsement key, and then verify the public structure is cons=
istent with your expected
     template through the name.

    1 is the easier solution.

> =

> Regards,
> Hanson

--===============8653026013184647051==--

