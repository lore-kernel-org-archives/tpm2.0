Content-Type: multipart/mixed; boundary="===============8135600933598753329=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] Initialization fails with error 0xb000b
Date: Wed, 28 Mar 2018 10:49:15 -0700
Message-ID: <20180328174915.GB25666@intel.com>
In-Reply-To: HE1PR03MB3164B429D84E85C20125579EF6A30@HE1PR03MB3164.eurprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8135600933598753329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Moneeb,

On Wed, Mar 28, 2018 at 05:15:10PM +0000, Moneeb Azhar wrote:
> Hey,
> =

> I am getting the following error on execution:
> =

> ubuntu:~/Desktop$ sudo tpm2-abrmd --allow-root --tcti=3Dlibtcti-socket.so
> ** (tpm2-abrmd:36554): WARNING **: failed to dlopen library: libtcti-sock=
et.so
> ** (tpm2-abrmd:36554): CRITICAL **: TCTI initialization failed: 0xb000b
> =

> Same error if i execute as tss:
> =

> $ sudo -u tss tpm2-abrmd --tcti=3Dlibtcti-socket.so
> [sudo] password for wisn:
> ** (tpm2-abrmd:38290): WARNING **: failed to dlopen library: libtcti-sock=
et.so
> ** (tpm2-abrmd:38290): CRITICAL **: TCTI initialization failed: 0xb000b
> =

> =

> I did ldconfig after installation with no effect. I created a gist of the=
 installation steps I took, in case this helps: https://gist.github.com/mon=
eeb777/ceabfad71462d4ffc3e0c25a9da2b2ff
> =

> Can someone guide me with this?

Gladly. Running as root vs running as tss user in this case shouldn't
have an impact. The daemon isn't able to open the shared object based on
the name you've provided. This library has been renamed in the tpm2-tss
repo in anticipation of our next major release. It is now called
"libtss2-tcti-mssim.so".

Dan just updated the man page for the daemon so that we're using the
right names in the examples:
https://github.com/tpm2-software/tpm2-abrmd/commit/98dd707fe58d839e2e642e2c=
9108c77e277b94f2

This of course assumes you're working off of the 'master' branch of the
repos of course.

Hope this helps,
Philip

--===============8135600933598753329==--

