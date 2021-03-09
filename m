Content-Type: multipart/mixed; boundary="===============8362936265309358492=="
MIME-Version: 1.0
From: Tadeusz Struk <tstruk at gmail.com>
Subject: [tpm2] Re: abrmd crashing - how to debug?
Date: Tue, 09 Mar 2021 11:50:44 -0800
Message-ID: <a5967af7-8d95-1f14-f629-09083244e00d@gmail.com>
In-Reply-To: OF20698D64.A63FD5D5-ON0025868F.007A7AC8-8525868F.007B8904@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8362936265309358492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ken,
On 3/5/21 2:29 PM, Kenneth Goldman wrote:
> Ubuntu focal with WSL, abrmd compiled from source
> =

> After about 5 minutes of sending commands, abrmd crashes. I originally fo=
und it with keylime, but I can reproduce it with a simple bash loop on pcrr=
ead.
> =

> abrmd exits, the tool output is:
> =

> ** (process:21067): CRITICAL **: 17:25:10.862: failed to allocate dbus pr=
oxy object: Could not connect: Connection refused
> WARNING:tcti:src/tss2-tcti/tctildr.c:79:tcti_from_init() TCTI init for fu=
nction 0x7ff5f6dbbe10 failed with a0008
> WARNING:tcti:src/tss2-tcti/tctildr.c:109:tcti_from_info() Could not initi=
alize TCTI named: tcti-abrmd
> ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could not init=
ialize TCTI file: tabrmd
> ERROR:tcti:src/tss2-tcti/tctildr.c:416:Tss2_TctiLdr_Initialize_Ex() Faile=
d to instantiate TCTI
> ERROR: Could not load tcti, got: "tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd"
> =

> How would I debug?
> =

> I would expect that nothing that a single application does should crash a=
brmd.

I think it's not the abrmd that's failing, but the application that is tryi=
ng to
use tcti-abrmd to communicate with abrmd running in the background.
It can not get the dbus handler so it just prints an error and fails.
Can you look for some system dbus logs to see if there are any errors there?

Thanks,
Tadeusz
--===============8362936265309358492==--

