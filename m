Content-Type: multipart/mixed; boundary="===============1233854302726300481=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: Error on TPM2 and Ubuntu 19.04
Date: Fri, 18 Oct 2019 11:25:46 -0700
Message-ID: <e423eaa2-cf2e-6b3f-dff6-61726cb5c0bf@intel.com>
In-Reply-To: e7667319-4b47-4e22-8efd-4280c1ff7725@www.fastmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1233854302726300481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/15/19 11:56 AM, Trey Weaver wrote:
> /*tpm2_createprimary -V -H o -g sha256 -G ecc -C primary2.ctx*//*
> */
> /*ObjectAttribute: 0x00030072*//*
> */
> /*ERROR on line: "182" in file: "tools/tpm2_createprimary.c":*//*
> */
> /*CreatePrimary Failed ! ErrorCode: 0x9a2*/

0x9a2 error means that the authorization failed. Seems like there is a
auth (password) setup for the owner hierarchy and by default clevis and
tpm2_createprimary use an empty auth. You can change the auth to an
empty one:

$ tpm2_changeauth -c o -p <OLD_PASS> ""

("") -means empty pass

and after that both the tpm2_createprimary and clevis encrypt tpm2
should work with the default.

> I am sure I have TPM2 setup correctly because things like tpm2_getrandom
> work fine.

tpm2_getrandom tool doesn't use the owner hierarchy thus it doesn't need
any authorization.

> =

> tpm2_createprimary is version 3.1.3
> =

> What can I do?=C2=A0
> Is there another tool beside clevis to auto unlock my drive that works
> better?
> Is there such a thing as a matched pair of tpm2-tool and clevis that I
> can get a package for? =


I would follow what the clevis says. It looks like it requires tools v3
--
Tadeusz
--===============1233854302726300481==--

