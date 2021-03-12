Content-Type: multipart/mixed; boundary="===============5376971403187978752=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: abrmd crashing - how to debug? - dbus logs?
Date: Thu, 11 Mar 2021 20:40:32 -0800
Message-ID: <5da9f0ba-d3b6-621b-6d73-9b3fe43d79e8@intel.com>
In-Reply-To: OF94643738.6D6A8111-ON00258695.0060439A-85258695.00609167@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5376971403187978752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/11/21 9:34 AM, Kenneth Goldman wrote:
>> From: Tadeusz Struk <tstruk(a)gmail.com>
>> To: Kenneth Goldman <kgoldman(a)us.ibm.com>, tpm2(a)lists.01.org
>> Date: 03/09/2021 02:50 PM
>> Subject: [EXTERNAL] [tpm2] Re: abrmd crashing - how to debug?
>>
>> Hi Ken,
>> On 3/5/21 2:29 PM, Kenneth Goldman wrote:
>> > Ubuntu focal with WSL, abrmd compiled from source
>> >
>> > After about 5 minutes of sending commands, abrmd crashes. I
>> originally found it with keylime, but I can reproduce it with a
>> simple bash loop on pcrread.
>> >
>> > abrmd exits, the tool output is:
>> >
>> > ** (process:21067): CRITICAL **: 17:25:10.862: failed to allocate
>> dbus proxy object: Could not connect: Connection refused
>> > WARNING:tcti:src/tss2-tcti/tctildr.c:79:tcti_from_init() TCTI init
>> for function 0x7ff5f6dbbe10 failed with a0008
>> > WARNING:tcti:src/tss2-tcti/tctildr.c:109:tcti_from_info() Could
>> not initialize TCTI named: tcti-abrmd
>> > ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could
>> not initialize TCTI file: tabrmd
>> > ERROR:tcti:src/tss2-tcti/tctildr.c:416:Tss2_TctiLdr_Initialize_Ex
>> () Failed to instantiate TCTI
>> > ERROR: Could not load tcti, got: "tabrmd:bus_name=3Dcom.intel.tss2.Tab=
rmd"
>> >
>> > How would I debug?
>> >
>> > I would expect that nothing that a single application does should
>> crash abrmd.
>>
>> I think it's not the abrmd that's failing, but the application that
>> is trying to
>> use tcti-abrmd to communicate with abrmd running in the background.
>> It can not get the dbus handler so it just prints an error and fails.
>> Can you look for some system dbus logs to see if there are any errors
> there?
> =

> What I meant by abrmd crashing is that it runs for a while, and then
> exits back to a command prompt. =C2=A0There is no error message.
> =

> A few data points:
> =

> When I run with the debug flag on, it runs 5x longer.
> When I run with a 5 second sleep between commands, it runs 10x longer.
> =

> It seems to be related to how fast I send the pcr read commands,
> but I'm not sure.
> =

> ~~
> =

> I'm happy to post abrmd dbus logs, but I don't know where they are.

I think that we still need to find out what was wrong in the initial
problem in tcti_tabrmd_connect() that it returned 2 handles instead of 1
as expected:

CRITICAL **: 10:43:39.780: CreateConnection expected to return 1
handles, received 2

what might happen is that for whatever reason it leaks one of this dbus
proxy objects on every pcr_read and finally runs out of them.
It might be that it is very WSL specific. Did you try it on any other
environment like Linux in a VM maybe?

Thanks,
-- =

Tadeusz
--===============5376971403187978752==--

