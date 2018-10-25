Content-Type: multipart/mixed; boundary="===============3354974279562942150=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] How do I input password via tmp2_import
Date: Thu, 25 Oct 2018 18:46:37 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C61C3C@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CA+tBKVjCFwbHvimhGSX_Dh+O7cESQnw-P9mu_fKByPU8MNaeMA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3354974279562942150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Terry An
> Sent: Thursday, October 25, 2018 2:02 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] How do I input password via tmp2_import
> =

> How do I input password via tpm2_import?
> =

> [root(a)bogon Test]# tpm2_import -C 0x81020009 -G rsa -k priv.pem -u pub.=
key -r
> priv.key Enter PEM pass phrase:
> ERROR: Tss2_Sys_Import(0x98E) - tpm:session(1):the authorization HMAC che=
ck
> failed and DA counter incremented
> ERROR: Unable to run tpm2_import

I initially thought something like 'echo mypass' | tpm2_import would work. =
I misunderstood
How OSSL was going to handle NULL as the callback and password options to t=
he PEM read file
Routines.

See bug: https://github.com/tpm2-software/tpm2-tools/issues/1217

Bill






--===============3354974279562942150==--

