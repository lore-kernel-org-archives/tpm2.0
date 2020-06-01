Content-Type: multipart/mixed; boundary="===============4094815594963793698=="
MIME-Version: 1.0
From: Tadeusz Struk <tstruk at gmail.com>
Subject: [tpm2] Re: Error: "Could not initialize TCTI file" when calling
 tpm2_nvreadpublic
Date: Mon, 01 Jun 2020 09:29:45 -0700
Message-ID: <6c4d9e03-a80e-532e-c12e-ddf7cbc56a54@gmail.com>
In-Reply-To: 20200601071935.2851.76678@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4094815594963793698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/1/20 12:19 AM, Chenxi Z wrote:
> ~$ tpm2_nvreadpublic
> =

> ** (process:3426476): CRITICAL **: 23:52:45.971: CreateConnection expecte=
d to return 1 handles, received 2
> WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init for fu=
nction 0x7f5a0003da10 failed with a0001
> WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not initia=
lize TCTI named: tcti-abrmd
> ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not init=
ialize TCTI file: libtss2-tcti-tabrmd.so.0
> 0x1c00002:
> ... ...
> =

> if I do a restart "service tpm2-abrmd restart", then this issue can be re=
solved. I would like to resolve this without using the workaround.

What do you get when you run "service tpm2-abrmd status" before calling tpm=
2_nvreadpublic?
--===============4094815594963793698==--

