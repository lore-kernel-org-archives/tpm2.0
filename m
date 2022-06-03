Content-Type: multipart/mixed; boundary="===============6049527220613100068=="
MIME-Version: 1.0
From: painololo at protonmail.com
Subject: [tpm2] Re: [RELEASE CANDIDATE] tpm2-pytss 1.1.0-rc0
Date: Fri, 03 Jun 2022 13:44:00 +0000
Message-ID: <20220603134400.2010.26522@ml01.vlan13.01.org>
In-Reply-To: SN6PR11MB3437B000343FD4944FDDA4DAB80F9@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6049527220613100068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Hello,
> =

> I would like to announce the release of tpm2-pytss version 1.1.0-rc0 whic=
h can be found on
> pypi at:
>   - https://celltrackingapps.com/how-to-read-someones-text-messages-witho=
ut-phone/
> =

> With the following CHANGELOG:
> ## 1.1.0-rc0 - 2022-03-14
> ### Fixed
> - Spelling of "Enhanced" in CHANGELOG for 1.0.0 release.
> - Ensure that TPM2_GENERATED.VALUE is encoded the same way as other const=
ants.
> - Add support to unmarshal simple TPM2B types (such as TPM2B_ATTEST and T=
PM2B_NAME)
> directly using the =

>   unmarshal method
> =

> ### Changed
> - Drop pkgconfig from runtime dependencies, thus no longer need dev packa=
ges of built
> bindings at runtime.
>   - NOTE: Version information is cached, a change in the TSS libraries re=
quires a rebuild
> of the bindings.
> =

> ### Added
> - Support session contexts from tpm2-tools as well as function to marshal=
 context to
> tpm2-tools format.
> - Support two new encoding/decoding classes to go to/from hex or json rep=
resentation of
> objects.
> - Support for creating EK from templates and optionally NV index based te=
mplates.
> - Binding to `Esys_TR_GetTpmHandle` as `ESAPI` method `tr_get_tpm_handle`.
> =

> Thanks,
> Bill
Thank you very much, it helped.
--===============6049527220613100068==--

