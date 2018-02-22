Content-Type: multipart/mixed; boundary="===============6729608383931160355=="
MIME-Version: 1.0
From: Matthias Gerstner <mgerstner at suse.de>
Subject: [tpm2] Some issues with tpm2-tss, tpm2-tools regarding packaging
Date: Thu, 22 Feb 2018 13:34:36 +0100
Message-ID: <20180222123436.34cuhliqfxnpstp4@f195.suse.de>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6729608383931160355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I want to share some issues I have experienced while updating the tpm2
packages in SUSE distributions:

- The distribution tarballs of tpm2-tss and tpm2-tools try to determine
  the package version via `git describe [...]` in configure.ac. This
  doesn't work, because there is no git repository any more. This caused
  e.g. the pkgconfig files like sapi.pc to contain an empty version
  number, which in turn caused tpm2-tools to fail to build, because the
  version check failed.

  Philip fixed the same issue in tpm2-abrmd a while ago via these
  commits:

  https://github.com/tpm2-software/tpm2-abrmd/commit/7f0d83903b842fc806e007=
d0c31c2f97cb2d7bd7
  https://github.com/tpm2-software/tpm2-abrmd/commit/5fe185714abe269a9ccd37=
ed5d33b61f923e6d65

- The current tpm2-tss-1.3.0 distribution tarball is missing files like
  README.md, CHANGELOG.md and LICENSE. But this has already been fixed
  via commit c0841fc6, so the next version should be fine.

- I wanted to verify the GPG signature of the tpm2-tools distribution
  tarball tpm2-tools-3.0.3.tar.gz, but cannot seem to find the matching
  public key 0x6DE2E9078E1F50C1 on the public key servers.

I can open GitHub issues for some of the issues if you deem it helpful.

Regards

Matthias

-- =

Matthias Gerstner <matthias.gerstner(a)suse.de>
Dipl.-Wirtsch.-Inf. (FH), Security Engineer
https://www.suse.com/security
Telefon: +49 911 740 53 290
GPG Key ID: 0x14C405C971923553

SUSE Linux GmbH
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nuernberg)

--===============6729608383931160355==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
QWdBR0JRSmFqcmpjQUFvSkVCVEVCY2x4a2pWVDN6a1AvUjR0WURSdGtMTmJYNjBEYnVEaXNVbHoK
MVhUaUlMUXJ4TWNVWVFSUnU1aldkMEczWHIyOFhjbUlXOUM0eGFTTmk4MjZOWlZnemkweVhiaU1O
dlJtTjFWMAplRWNsbmhwNkNNejhtUndpUldZU0NPQWdoNDhJS2pwYk1OcEhpZ1haWElNSEkyWjlK
RlFTMW93ZnM1KzhhK000CktERU9qblNvNnlJeDQrdkZ6WS9DWkNaSisxTGVmVElvV1MraDRXYWpr
QWx4a1ZuUkpHL3h3VTdYT2Flb1F3eTkKR3NVYS82akhlZFNhWmZkMHR6Yk9GQmIwMzVyVTJoWlhX
bmJkSjVQaUhqUWRKUjlhb2ZnaDkzSDJYL2JjWC8vcwpGY1NUN2V4WUkwUUNxZUFIOTNMVVB0aU1H
akdXaEoxUytxcWlIQTJzVml1TXBzVjd3RGNKRzV1eFJTcG1MRmZpCktSMSsvZ3FUUDIxNTZxbTdo
NFE2Y3NFMDVqanVjeXN2amVUU1FEWnVoWmVpalRvVEF2UVVPeGs4czM2UjdrTTEKVkQ1WkhKeHpa
dVZNRFhNU2hHNjhsb0lQaFlFMWk2ZEt6eFlCL1FpbkJUU0s2R0pCNmkwc0E2TWlkRHE1OU0vSQpH
b1pMaXFqYzFTMEk3YStFN29Na2k4bWJnc0Vrd0hIY0IzaG1lblRmSHBaaTFGYWJZRkQrUHpNd25J
TGk5bEJSClZRQUxHTVJlcTFYVy9zN2RQU2cyazdORldia3Q0ZzVHN0pKMnBpeFlFTHVUN3k0QWZW
blYySlRJd2xvOURsWUkKYXBCQUM5S3BIV0FvWEUyQXg1UXVLc2lVSVk5QkVEQS9xY2Z1WlhLeXJh
cEh2cnhCOXd1VGEvTnM3cEhSZitxZApvNkl4cGxjTk1Ed2xzQTl6ZWVRZQo9ODVZYwotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============6729608383931160355==--

