Content-Type: multipart/mixed; boundary="===============6126347081253221258=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] ROCA and firmware version
Date: Thu, 11 Apr 2019 18:03:44 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D2B22A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20190411160149.7n2gail6v7dfrh42@runtux.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6126347081253221258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Ralf Schlatt=
erbeck
> Sent: Thursday, April 11, 2019 9:02 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] ROCA and firmware version
> =

> I have an Infineon TPM2 (and TPM 1.2) module for the raspi
> https://www.infineon.com/cms/en/product/evaluation-boards/iridium9670-
> tpm2.0-linux/
> It is available both, as tpm 2.0 and as tpm 1.2.
> =

> It has the SLB 9670VQ2.0 or SLB 9670VQ1.2 chips with SPI supported by the
> tpm_tis_spi kernel module.
> =

> These modules have/had the ROCA vulnerability
> https://en.wikipedia.org/wiki/ROCA_vulnerability
> =

> I'd like to check if mine are affected. Is there
> - a way to find out the firmware version of the module (preferrably
>   using tpm2_tools)

tools/tpm2_getcap -c properties-fixed
TPM2_PT_FAMILY_INDICATOR:
  raw: 0x08322e3000
  value: "2.0"
TPM2_PT_LEVEL:
  value: 0
TPM2_PT_REVISION:
  value: 1.42
TPM2_PT_DAY_OF_YEAR:
  value: 0x23
TPM2_PT_YEAR:
  value: 0x7E1
TPM2_PT_MANUFACTURER:
 value        0x49424D20
TPM2_PT_VENDOR_STRING_1:
  raw: 0x53572020
  value: "SW"
TPM2_PT_VENDOR_STRING_2:
  raw: 0x2054504D
  value: "TPM"
TPM2_PT_VENDOR_STRING_3:
  raw: 0x0
  value: ""
TPM2_PT_VENDOR_STRING_4:
  raw: 0x0
  value: ""
TPM2_PT_VENDOR_TPM_TYPE:
  value: 0x1
TPM2_PT_FIRMWARE_VERSION_1:
  value: 0x20160511
TPM2_PT_FIRMWARE_VERSION_2:
  value: 0x162800

> - a possibility to upgrade the firmware (provided I can extract one from
>   the various upgrades for windows) using tpm2_tools? Or any other way?

I have no idea on this part. I don't think the spec covers this and upgrade=
 is
Manufacture dependent, but don't take my word for it.

> =

> Thanks
> Ralf Schlatterbeck
> --
> Dr. Ralf Schlatterbeck                  Tel:   +43/2243/26465-16
> Open Source Consulting                  www:   http://www.runtux.com
> Reichergasse 131, A-3411 Weidling       email: office(a)runtux.com
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============6126347081253221258==--

