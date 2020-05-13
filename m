Content-Type: multipart/mixed; boundary="===============0485307662186834005=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] tpm2-tss v2.4.1
Date: Tue, 12 May 2020 18:34:32 -0700
Message-ID: <23b78810-7e06-d109-f36d-d91ce54d94c8@intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0485307662186834005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
I'm happy to announce a new tpm2-tss 2.4.1 bugfix release.

https://github.com/tpm2-software/tpm2-tss/releases/tag/2.4.1

The release includes number of fixes as follows:
- Fixed systemd-sysusers/-tmpfiles creation without systemd
- Removed expired coverity token from travis.yaml
- Fixed uninitialized context of FAPI command Fapi_ChangeAuth issue
- Fixed handling of tcti pointer in Esys_Initialize
- Fixed usages of EC routines deprecated in OSSL 1.2 and greater
- Fixed FAPI handling of TPMs without stored certificates

Thanks,
--
Tadeusz
--===============0485307662186834005==--

