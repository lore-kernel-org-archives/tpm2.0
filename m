Content-Type: multipart/mixed; boundary="===============7072219166755633440=="
MIME-Version: 1.0
From: Tadeusz Struk <tstruk at gmail.com>
Subject: [tpm2] Re: Installing on FreeBSD?
Date: Mon, 04 Apr 2022 07:42:10 -0700
Message-ID: <813027f8-b232-62b0-a8fc-fa5618a832ba@gmail.com>
In-Reply-To: 00bf924f-2b55-ceba-36a5-e256364f23bc@skylon.me.uk
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7072219166755633440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 4/4/22 03:50, John Connett wrote:
> I have built a debug kernel and am attempting to debug the tpm module. Ho=
wever, =

> the tpm dtrace probes and symbols are not available until =

> "kldload=C2=A0tpm"=C2=A0has=C2=A0run=C2=A0by=C2=A0which=C2=A0time=C2=A0th=
e=C2=A0ENXIO=C2=A0error=C2=A0has=C2=A0occurred.
> =

> I could pepper the tpm driver code with kernel printf calls but was =

> wondering=C2=A0if=C2=A0there=C2=A0is=C2=A0an=C2=A0eaier=C2=A0way?

There are only two spots where I would suspect it to fail and return ENXIO
from attach. One is on tpmcrb_request_locality():
https://github.com/freebsd/freebsd-src/blob/main/sys/dev/tpm/tpm_crb.c#L171
and the other is AcpiWalkResources():
https://github.com/freebsd/freebsd-src/blob/main/sys/dev/tpm/tpm_crb.c#L203

I would just add some debug printfs there.
Thanks,
Tadeusz
--===============7072219166755633440==--

