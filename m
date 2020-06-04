Content-Type: multipart/mixed; boundary="===============7923566503734515982=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] how unique are primary keys ?
Date: Thu, 04 Jun 2020 16:46:33 -0700
Message-ID: <8b015c5e-624a-ed89-903d-0621df4f4b8d@oracle.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7923566503734515982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Folks,

How unique are primary keys ?

As an example:

$ tpm2_createprimary -Q -C o -c prim1.ctx
$ tpm2_createprimary -Q -C o -c prim2.ctx
$ tpm2_createprimary -Q -C o -u /dev/random -c prim3.ctx
$ tpm2_readpublic -c prim1.ctx > prim1.rp
$ tpm2_readpublic -c prim2.ctx > prim2.rp
$ tpm2_readpublic -c prim3.ctx > prim3.rp
$ diff prim1.rp prim2.rp
$ diff prim1.rp prim3.rp
$

Is it supposed to be like this?
Shouldn't they be different in some way?
For prim3, I thought putting some -u data would make a difference, but =

it seems not.

FWIW, I am using 4.1 branch of tpm2-tools with swtpm.

Thanks,
-ted

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============7923566503734515982==--

