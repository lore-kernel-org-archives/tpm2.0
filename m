Content-Type: multipart/mixed; boundary="===============1533839493980765731=="
MIME-Version: 1.0
From: Scheie, Peter M <Petre.Scheie at gd-ms.com>
Subject: Re: [tpm2] tpm2-tools man pages not installing?
Date: Tue, 03 Jul 2018 17:41:01 +0000
Message-ID: <931b6f8251674627a9486c8b478a4f7a@AZDC-MMB02.GD-MS.US>
In-Reply-To: 20180703145323.GA16483@f195.suse.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1533839493980765731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Glad to hear it has been fixed.  Yeah, I had already copied them in by hand=
, but that's when it occurred to me that I shouldn't have to be doing that.=
  Thanks for taking care of it.

Peter

-----Original Message-----
From: Matthias Gerstner [mailto:mgerstner(a)suse.de] =

Sent: Tuesday, July 03, 2018 9:53 AM
To: Scheie, Peter M
Cc: tpm2(a)lists.01.org
Subject: Re: [tpm2] tpm2-tools man pages not installing?

Hello,

On Tue, Jul 03, 2018 at 01:46:14PM +0000, Scheie, Peter M wrote:
> When I build & install tpm2-tools, the man pages don't seem to get =

> installed.  I'm just using the default './configure; make; sudo make =

> install' routine, so everything is going into /usr/local/; therefore, =

> I'd expect the man pages to end up in /usr/local/share/man, but they =

> don't.  Do I need add an argument to configure to make that happen?

that is actually a bug and I addressed it via commit 72a28f36151db9bfa59a46=
0ae0114dcece218862, however that commit didn't make it into the current rel=
ease.

So you either have to install them manually or, as a workaround, if you hav=
e pandoc installed on the system, then the build system tries to generate t=
he man pages and alongside that also installs them.

Regards

Matthias

--
Matthias Gerstner <matthias.gerstner(a)suse.de> Dipl.-Wirtsch.-Inf. (FH), S=
ecurity Engineer https://www.suse.com/security
Telefon: +49 911 740 53 290
GPG Key ID: 0x14C405C971923553

SUSE Linux GmbH
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton HRB 21284 (AG Nuer=
nberg)

--===============1533839493980765731==--

