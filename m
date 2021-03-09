Content-Type: multipart/mixed; boundary="===============0658206616738321250=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: abrmd crashing - how to debug?
Date: Tue, 09 Mar 2021 22:45:10 +0000
Message-ID: <SN6PR11MB34370249B77688306C648A67B8929@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: OFAC01F3E6.388DCB4F-ON00258693.006F310A-85258693.006F663F@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0658206616738321250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Kenneth Goldman <kgoldman(a)us.ibm.com>
> Sent: Tuesday, March 9, 2021 2:17 PM
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: abrmd crashing - how to debug?
> =

> > From: Tadeusz Struk <tstruk(a)gmail.com>
> > To: Kenneth Goldman <kgoldman(a)us.ibm.com>, tpm2(a)lists.01.org
> > Date: 03/09/2021 02:51 PM
> > Subject: [EXTERNAL] Re: [tpm2] abrmd crashing - how to debug?
> >
> > Hi Ken,
> > On 3/5/21 2:29 PM, Kenneth Goldman wrote:
> > > Ubuntu focal with WSL, abrmd compiled from source
> > >
> > > After about 5 minutes of sending commands, abrmd crashes. I
> > originally found it with keylime, but I can reproduce it with a simple
> > bash loop on pcrread.
> > >
> > > abrmd exits, the tool output is:
> > >
> > > ** (process:21067): CRITICAL **: 17:25:10.862: failed to allocate
> > dbus proxy object: Could not connect: Connection refused
> > > WARNING:tcti:src/tss2-tcti/tctildr.c:79:tcti_from_init() TCTI init
> > for function 0x7ff5f6dbbe10 failed with a0008
> > > WARNING:tcti:src/tss2-tcti/tctildr.c:109:tcti_from_info() Could
> > not initialize TCTI named: tcti-abrmd
> > > ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could
> > not initialize TCTI file: tabrmd
> > > ERROR:tcti:src/tss2-tcti/tctildr.c:416:Tss2_TctiLdr_Initialize_Ex
> > () Failed to instantiate TCTI
> > > ERROR: Could not load tcti, got: "tabrmd:bus_name=3Dcom.intel.tss2.Ta=
brmd"
> > >
> > > How would I debug?
> > >
> > > I would expect that nothing that a single application does should
> > crash abrmd.
> >
> > I think it's not the abrmd that's failing, but the application that is
> > trying to use tcti-abrmd to communicate with abrmd running in the
> > background.
> > It can not get the dbus handler so it just prints an error and fails.
> > Can you look for some system dbus logs to see if there are any errors t=
here?
> =

> Sorry, but abrmd exits - with no error message.  Its window just goes bac=
k to the
> command prompt.  I'd call that a crash, assuming it should never exit.

It shouldn't under almost all situations. However, some asserts exist on cl=
ient state, like this bug:
https://github.com/tpm2-software/tpm2-abrmd/issues/723

But the fact that there's no message seems odd. What's the exit code? I wou=
ld imagine we would see
Something like a segfault message or something else if it truly crashed.

> =

> If you tell me where 'the system dbus logs' are, I'd be willing to post t=
hem.

Since you're just running it as a process from a shell and not a system ser=
vice, all the logs will be to stderr/stdout.
Can you enable env variable G_MESSAGES_DEBUG=3Dall when you run tpm2-abrmd =
and send us the output?


> =

> =

> =

>=20

--===============0658206616738321250==--

