Content-Type: multipart/mixed; boundary="===============2255111171153458333=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] Error: "Could not initialize TCTI file" when calling
 tpm2_nvreadpublic
Date: Mon, 01 Jun 2020 07:19:35 +0000
Message-ID: <20200601071935.2851.76678@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2255111171153458333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, =


I am using the tpm2 tools combination below:
tpm2-tss-2.3.2-fb1.x86_64
tpm2-abrmd-2.3.1-fb1.x86_64
tpm2-tools-4.1.1-fb1.x86_64

After initial installation, I got an error when running tpm2_nvreadpublic. =
(installation sequence tss -> abrmd -> tools)
Could anyone please let me know how I can resolve this issue? thank you so =
much in advance.

~$ tpm2_nvreadpublic

** (process:3426476): CRITICAL **: 23:52:45.971: CreateConnection expected =
to return 1 handles, received 2
WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init for func=
tion 0x7f5a0003da10 failed with a0001
WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not initiali=
ze TCTI named: tcti-abrmd
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not initia=
lize TCTI file: libtss2-tcti-tabrmd.so.0
0x1c00002:
... ...

if I do a restart "service tpm2-abrmd restart", then this issue can be reso=
lved. I would like to resolve this without using the workaround.
--===============2255111171153458333==--

