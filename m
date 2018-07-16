Content-Type: multipart/mixed; boundary="===============7357670637054866133=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: [tpm2] tpm2-tools 3.1.2 release candidate
Date: Mon, 16 Jul 2018 21:22:42 +0100
Message-ID: <848870f6-a846-4de4-5c27-3c206f134f56@linux.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7357670637054866133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

I've just tagged and signed rc0 for tpm2-tools 3.1.2:
https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.2-rc0


Javier noticed that we had a behavioural change in 3.1 (compared to 3.0) =

that was inappropriate for a minor version bump, that is we were using =

user supplied object attributes exclusively (instead of ORing them with =

the defaults). 3.1.2 reverts the change:

https://github.com/tpm2-software/tpm2-tools/commit/352908f7470338aba858a9ac=
20c1c5ec608b661c

Feedback on this release candidate would be very welcome.

Regards,
Joshua

--===============7357670637054866133==--

