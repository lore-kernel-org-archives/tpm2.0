Content-Type: multipart/mixed; boundary="===============5620799127214622255=="
MIME-Version: 1.0
From: Ralf Schlatterbeck <rsc at runtux.com>
Subject: [tpm2] ROCA and firmware version
Date: Thu, 11 Apr 2019 18:01:49 +0200
Message-ID: <20190411160149.7n2gail6v7dfrh42@runtux.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5620799127214622255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have an Infineon TPM2 (and TPM 1.2) module for the raspi
https://www.infineon.com/cms/en/product/evaluation-boards/iridium9670-tpm2.=
0-linux/
It is available both, as tpm 2.0 and as tpm 1.2.

It has the SLB 9670VQ2.0 or SLB 9670VQ1.2 chips with SPI supported by
the tpm_tis_spi kernel module.

These modules have/had the ROCA vulnerability
https://en.wikipedia.org/wiki/ROCA_vulnerability

I'd like to check if mine are affected. Is there
- a way to find out the firmware version of the module (preferrably
  using tpm2_tools)
- a possibility to upgrade the firmware (provided I can extract one from
  the various upgrades for windows) using tpm2_tools? Or any other way?

Thanks
Ralf Schlatterbeck
-- =

Dr. Ralf Schlatterbeck                  Tel:   +43/2243/26465-16
Open Source Consulting                  www:   http://www.runtux.com
Reichergasse 131, A-3411 Weidling       email: office(a)runtux.com

--===============5620799127214622255==--

