Content-Type: multipart/mixed; boundary="===============0544091649684713806=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] a5f0d0: travis.yml: install
 liburiparser-dev package
Date: Tue, 09 Jan 2018 10:35:05 -0800
Message-ID: <5a550b59912b5_36292ab2da3b9c0c792d4@hookshot-fe-6b2eebc.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0544091649684713806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: a5f0d027b660034b73d41c142070b26af25e8077
      https://github.com/intel/tpm2-tools/commit/a5f0d027b660034b73d41c1420=
70b26af25e8077
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2018-01-09 (Tue, 09 Jan 2018)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  travis.yml: install liburiparser-dev package

The tpm2-tss simulator TCTI library uses symbols from Uriparser library,
so install its dev package in the Travis CI instance to build tpm2-tss.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============0544091649684713806==--

