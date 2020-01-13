Content-Type: multipart/mixed; boundary="===============8242937898266175519=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Some Errors
Date: Mon, 13 Jan 2020 15:37:30 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E65AE1@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20A6FE0AC912764FB8B5BC5A1A7CB92B47336E16@fmsmsx101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8242937898266175519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Oliver, Dario N [mailto:dario.n.oliver(a)intel.com]
> Sent: Friday, January 10, 2020 10:36 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Some Errors
> =

> The man page of tpm2_createak is wrong.
> =

> It should be:
> =

> =

> =

> tpm2_createek -c ek.handle -G rsa -u ek.pub
> =

> tpm2_createak -C ek.handle -c ak.ctx -u ak.pub -n ak.name
> =

> tpm2_evictcontrol -C o -c ak.ctx 0x81010002
> =

> =

> =

> I was having the same problem, and that worked for me!

FYI this is fixed and will be on the 4.1.1 RC1 tag. The commit can be found=
 here:
https://github.com/tpm2-software/tpm2-tools/commit/a83e8fd70b02c36b2a470124=
23991a70df62d4f7

Thanks,
Bill
--===============8242937898266175519==--

