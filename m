Content-Type: multipart/mixed; boundary="===============4870254123911896533=="
MIME-Version: 1.0
From: Emmanuel Deloget <logout at free.fr>
Subject: [tpm2] Re: Infineon SLB 9670 lifetime
Date: Fri, 21 Feb 2020 13:18:51 +0100
Message-ID: <CAKh=nwEiifiWKyKon_7bOX_EP8K+y3iOvucr=Hn3chLLbjo45Q@mail.gmail.com>
In-Reply-To: CAKrSGQRK+Hi8yyvaaKH52dTCkP=HVq6FVLCAeaT8CwS0mCwctg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4870254123911896533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Luke,

On Fri, Feb 21, 2020 at 8:34 AM Luke Hinds <lhinds(a)redhat.com> wrote:
>
> Not an expert legal, but I believe "useful lifetime" is for accounting pu=
rposes, its not a statement on how long a device is expected to remain in w=
orking order, its used to define when its value depreciates as an asset.

It seems that in this particular datasheet [1] the "useful lifetime"
is indeed the time during which you can use the device - which seems
weird. In this particular version of the DS, it's listed in (5.2 -
Functional Operating Range) as having a max of 10 years and the same
value is given for the operational lifetime.

I have yet to find another TPM2 that list such a value in its DS.

BR,

-- Emmanuel Deloget

[1] https://www.infineon.com/dgdl/Infineon-SLB%209670VQ2.0-DataSheet-v01_00=
-EN.pdf?fileId=3D5546d4626fc1ce0b016fc78270350cd6
--===============4870254123911896533==--

