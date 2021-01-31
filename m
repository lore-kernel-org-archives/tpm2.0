Content-Type: multipart/mixed; boundary="===============5746626815292888390=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-abrmd: 2.4.0-rc0
Date: Sun, 31 Jan 2021 16:18:43 +0000
Message-ID: <SN6PR11MB34379CC4304090ACB5988241B8B79@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5746626815292888390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce release candidate 2.4.0-rc0 for tpm2-abrmd located=
 here:
https://github.com/tpm2-software/tpm2-abrmd/releases/tag/2.4.0-rc0

The changelog is as follows:
### 2.4.0-rc0 - 2021-01-31
### Added
  - configure option --enable-asan which will cause the build to produce
    ASAN enabled binaries.
  - CI runs with clang enable asan for tests.
  - Service start depends on systemd device unit: dev-tpm0.device.
  - Testing support with swtpm.

### Fixed
  - Numerous memory leaks.
  - udev settle service deprecation warnings.
  - StandardOutput=3Dsyslog deprecation warnings.

### Changed
  - StandardOutput=3Dsyslog removed from systemd service file as syslog is
    deprecated since systemd version 246.
  - Requires tpm2-tss version 2.4.0 or greater for udev TAG=3Dsystemd rules.

As always please report bugs via the github project, thank you.

Bill
--===============5746626815292888390==--

