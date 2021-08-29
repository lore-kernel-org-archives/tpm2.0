Content-Type: multipart/mixed; boundary="===============5607416802596370188=="
MIME-Version: 1.0
From: huzaifa.hashim6 at gmail.com
Subject: [tpm2] TctiLdr_Initialize
Date: Sun, 29 Aug 2021 00:14:42 +0000
Message-ID: <20210829001442.2802.92671@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5607416802596370188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have been trying to use the TCTI for my programs and have even tried comp=
iling the example code given in documentation but cannot seem to get it to =
compile.

https://www.mankier.com/3/Tss2_TctiLdr_Initialize

This page has example code for the library but it does not compile and warn=
 against an undefined reference to the library.

Currently trying to compile a standalone file with this:
gcc testcheck.c -L=3D/usr/local/lib/ -ltss2-esys -ltss2-tcti-device -o test=
check
--===============5607416802596370188==--

