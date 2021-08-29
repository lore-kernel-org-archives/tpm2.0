Content-Type: multipart/mixed; boundary="===============4847852518702325193=="
MIME-Version: 1.0
From: huzaifa.hashim6 at gmail.com
Subject: [tpm2] Re: TctiLdr_Initialize
Date: Sun, 29 Aug 2021 13:18:48 +0000
Message-ID: <20210829131848.2787.97520@ml01.vlan13.01.org>
In-Reply-To: 20210829001442.2802.92671@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4847852518702325193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The solution is pretty simple! The documentation does not mention this but =
the flags needed for compiling any code that uses the header file needs the=
 following flag: =

-ltss2-tctildr

This flag will go with the linker in your makefile!
--===============4847852518702325193==--

