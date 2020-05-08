Content-Type: multipart/mixed; boundary="===============3954421915631769588=="
MIME-Version: 1.0
From: =?utf-8?q?Eduardo_Falc=C3=A3o_=3Ceduardolfalcao_at_gmail=2Ecom=3E?=
Subject: [tpm2] Re: Use PCR10 of sha256 PCR bank
Date: Fri, 08 May 2020 01:53:49 +0000
Message-ID: <20200508015349.2843.24020@ml01.vlan13.01.org>
In-Reply-To: 20200507233035.2843.21576@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3954421915631769588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Inspecting the measurements collected by IMA I just saw that boot aggregate=
 is created with sha1, but then all measurements are extended with sha256.

10 e54afd0b8be44bda96d19b3ba154abf0122f80f0 ima-ng sha1:8bec961a62ee4589db6=
506002d974fee2d5cf2c6 boot_aggregate
10 71f5a9db669451d369635f6ff3a2aeb623ba5282 ima-ng sha256:4cadb747c2e6d8942=
28198fe9091d3f289c704edf82ddbd5945c54ec847d0bb6 /init
10 b2a44047548e6ec6791fc2455fdf70beebac20d0 ima-ng sha256:c3b773ac00b68d908=
431b73e68c1b5f4229748dd386f651b6503198d3bfc9780 /bin/sh
10 2e200610d43da1cbd2a41dc6fe0b48b43faa4fcc ima-ng sha256:0f754eab280e5ff0b=
65c46bdd1cc16e8aff944c834379df2632cd5f261afe3bb /lib/x86_64-linux-gnu/ld-2.=
23.so
10 c50746154c54730caaaae10fe2cf43e2d34c243f ima-ng sha256:6261d3a53a3ee7de7=
28effa63be8ddbc4daecfdf2e40951cd04b5e8d091b1a9b /etc/ld.so.cache
10 e16f2cc0281caf744454631d937bff59641c455d ima-ng sha256:74ca69ada4429ae5f=
ce87f7e3addb56f1b53964599e8526244fecd164b3c4b44 /lib/x86_64-linux-gnu/libc-=
2.23.so
10 0f8b2256c6159adfec34fc26b0f70f62b189e9a6 ima-ng sha256:91f2413151b7b0451=
ce0b6cedc7e5919931acf792d9a26645c0deb3bc230d9fe /conf/arch.conf
10 37b7648c357ee449e136fc15a7a0ffcc50ef46a9 ima-ng sha256:3ab885510eee04a49=
f638e98226f5bd96ed707da20d0e8a937c13ce33a889e1b /conf/initramfs.conf
10 6f56f95b5b78bc076ebdd77242a16203c44c5813 ima-ng sha256:ed5f0d4f1363d1a9f=
c7967b9dba2f0e0db75b88ad39fd1d0f5a6efd3f2d170dc /scripts/functions
--===============3954421915631769588==--

