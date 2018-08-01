Content-Type: multipart/mixed; boundary="===============1728981642957912766=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: Re: [tpm2] tpm2-tools 3.1.2 release candidate
Date: Wed, 01 Aug 2018 11:09:30 +0100
Message-ID: <fb797dbc-15cb-34d0-e812-e69440319656@linux.intel.com>
In-Reply-To: 848870f6-a846-4de4-5c27-3c206f134f56@linux.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1728981642957912766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 16/07/2018 21:22, Joshua Lock wrote:
> Hello all,
> =

> I've just tagged and signed rc0 for tpm2-tools 3.1.2:
> https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.2-rc0
> =

> =

> Javier noticed that we had a behavioural change in 3.1 (compared to 3.0) =

> that was inappropriate for a minor version bump, that is we were using =

> user supplied object attributes exclusively (instead of ORing them with =

> the defaults). 3.1.2 reverts the change:
> =

> https://github.com/tpm2-software/tpm2-tools/commit/352908f7470338aba858a9=
ac20c1c5ec608b661c =


I just tagged 3.1.2-rc1 to include an additional fix from Javier to use =

better object attribute defaults in tpm2_create:

https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.2-rc1

Thanks,
Joshua

--===============1728981642957912766==--

