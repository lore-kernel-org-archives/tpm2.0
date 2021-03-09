Content-Type: multipart/mixed; boundary="===============5098980963121402376=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: abrmd crashing - how to debug?
Date: Tue, 09 Mar 2021 15:16:46 -0500
Message-ID: <OFAC01F3E6.388DCB4F-ON00258693.006F310A-85258693.006F663F@notes.na.collabserv.com>
In-Reply-To: a5967af7-8d95-1f14-f629-09083244e00d@gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5098980963121402376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> From: Tadeusz Struk <tstruk(a)gmail.com>
> To: Kenneth Goldman <kgoldman(a)us.ibm.com>, tpm2(a)lists.01.org
> Date: 03/09/2021 02:51 PM
> Subject: [EXTERNAL] Re: [tpm2] abrmd crashing - how to debug?
>
> Hi Ken,
> On 3/5/21 2:29 PM, Kenneth Goldman wrote:
> > Ubuntu focal with WSL, abrmd compiled from source
> >
> > After about 5 minutes of sending commands, abrmd crashes. I
> originally found it with keylime, but I can reproduce it with a
> simple bash loop on pcrread.
> >
> > abrmd exits, the tool output is:
> >
> > ** (process:21067): CRITICAL **: 17:25:10.862: failed to allocate
> dbus proxy object: Could not connect: Connection refused
> > WARNING:tcti:src/tss2-tcti/tctildr.c:79:tcti_from_init() TCTI init
> for function 0x7ff5f6dbbe10 failed with a0008
> > WARNING:tcti:src/tss2-tcti/tctildr.c:109:tcti_from_info() Could
> not initialize TCTI named: tcti-abrmd
> > ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could
> not initialize TCTI file: tabrmd
> > ERROR:tcti:src/tss2-tcti/tctildr.c:416:Tss2_TctiLdr_Initialize_Ex
> () Failed to instantiate TCTI
> > ERROR: Could not load tcti, got:
"tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd"
> >
> > How would I debug?
> >
> > I would expect that nothing that a single application does should
> crash abrmd.
>
> I think it's not the abrmd that's failing, but the application that
> is trying to
> use tcti-abrmd to communicate with abrmd running in the background.
> It can not get the dbus handler so it just prints an error and fails.
> Can you look for some system dbus logs to see if there are any errors
there?

Sorry, but abrmd exits - with no error message.  Its window just goes back
to
the command prompt.  I'd call that a crash, assuming it should never exit.

If you tell me where 'the system dbus logs' are, I'd be willing
to post them.




--===============5098980963121402376==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PHR0Pjxmb250IHNpemU9IjIiPiZndDsgRnJvbTogVGFkZXVzeiBTdHJ1
ayAmbHQ7dHN0cnVrQGdtYWlsLmNvbSZndDs8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9
IjIiPiZndDsgVG86IEtlbm5ldGggR29sZG1hbiAmbHQ7a2dvbGRtYW5AdXMuaWJtLmNvbSZndDss
IHRwbTJAbGlzdHMuMDEub3JnPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4mZ3Q7
IERhdGU6IDAzLzA5LzIwMjEgMDI6NTEgUE08L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9
IjIiPiZndDsgU3ViamVjdDogW0VYVEVSTkFMXSBSZTogW3RwbTJdIGFicm1kIGNyYXNoaW5nIC0g
aG93IHRvIGRlYnVnPzwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+Jmd0OyA8YnI+
Jmd0OyBIaSBLZW4sPGJyPiZndDsgT24gMy81LzIxIDI6MjkgUE0sIEtlbm5ldGggR29sZG1hbiB3
cm90ZTo8YnI+Jmd0OyAmZ3Q7IFVidW50dSBmb2NhbCB3aXRoIFdTTCwgYWJybWQgY29tcGlsZWQg
ZnJvbSBzb3VyY2U8YnI+Jmd0OyAmZ3Q7IDxicj4mZ3Q7ICZndDsgQWZ0ZXIgYWJvdXQgNSBtaW51
dGVzIG9mIHNlbmRpbmcgY29tbWFuZHMsIGFicm1kIGNyYXNoZXMuIEkgPGJyPiZndDsgb3JpZ2lu
YWxseSBmb3VuZCBpdCB3aXRoIGtleWxpbWUsIGJ1dCBJIGNhbiByZXByb2R1Y2UgaXQgd2l0aCBh
IDxicj4mZ3Q7IHNpbXBsZSBiYXNoIGxvb3Agb24gcGNycmVhZC48YnI+Jmd0OyAmZ3Q7IDxicj4m
Z3Q7ICZndDsgYWJybWQgZXhpdHMsIHRoZSB0b29sIG91dHB1dCBpczo8YnI+Jmd0OyAmZ3Q7IDxi
cj4mZ3Q7ICZndDsgKiogKHByb2Nlc3M6MjEwNjcpOiBDUklUSUNBTCAqKjogMTc6MjU6MTAuODYy
OiBmYWlsZWQgdG8gYWxsb2NhdGUgPGJyPiZndDsgZGJ1cyBwcm94eSBvYmplY3Q6IENvdWxkIG5v
dCBjb25uZWN0OiBDb25uZWN0aW9uIHJlZnVzZWQ8YnI+Jmd0OyAmZ3Q7IFdBUk5JTkc6dGN0aTpz
cmMvdHNzMi10Y3RpL3RjdGlsZHIuYzo3OTp0Y3RpX2Zyb21faW5pdCgpIFRDVEkgaW5pdDxicj4m
Z3Q7IGZvciBmdW5jdGlvbiAweDdmZjVmNmRiYmUxMCBmYWlsZWQgd2l0aCBhMDAwODxicj4mZ3Q7
ICZndDsgV0FSTklORzp0Y3RpOnNyYy90c3MyLXRjdGkvdGN0aWxkci5jOjEwOTp0Y3RpX2Zyb21f
aW5mbygpIENvdWxkIDxicj4mZ3Q7IG5vdCBpbml0aWFsaXplIFRDVEkgbmFtZWQ6IHRjdGktYWJy
bWQ8YnI+Jmd0OyAmZ3Q7IEVSUk9SOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpbGRyLWRsLmM6MTU0
OnRjdGlfZnJvbV9maWxlKCkgQ291bGQgPGJyPiZndDsgbm90IGluaXRpYWxpemUgVENUSSBmaWxl
OiB0YWJybWQ8YnI+Jmd0OyAmZ3Q7IEVSUk9SOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpbGRyLmM6
NDE2OlRzczJfVGN0aUxkcl9Jbml0aWFsaXplX0V4PGJyPiZndDsgKCkgRmFpbGVkIHRvIGluc3Rh
bnRpYXRlIFRDVEk8YnI+Jmd0OyAmZ3Q7IEVSUk9SOiBDb3VsZCBub3QgbG9hZCB0Y3RpLCBnb3Q6
ICZxdW90O3RhYnJtZDpidXNfbmFtZT1jb20uaW50ZWwudHNzMi5UYWJybWQmcXVvdDs8YnI+Jmd0
OyAmZ3Q7IDxicj4mZ3Q7ICZndDsgSG93IHdvdWxkIEkgZGVidWc/PGJyPiZndDsgJmd0OyA8YnI+
Jmd0OyAmZ3Q7IEkgd291bGQgZXhwZWN0IHRoYXQgbm90aGluZyB0aGF0IGEgc2luZ2xlIGFwcGxp
Y2F0aW9uIGRvZXMgc2hvdWxkIDxicj4mZ3Q7IGNyYXNoIGFicm1kLjxicj4mZ3Q7IDxicj4mZ3Q7
IEkgdGhpbmsgaXQncyBub3QgdGhlIGFicm1kIHRoYXQncyBmYWlsaW5nLCBidXQgdGhlIGFwcGxp
Y2F0aW9uIHRoYXQgPGJyPiZndDsgaXMgdHJ5aW5nIHRvPGJyPiZndDsgdXNlIHRjdGktYWJybWQg
dG8gY29tbXVuaWNhdGUgd2l0aCBhYnJtZCBydW5uaW5nIGluIHRoZSBiYWNrZ3JvdW5kLjxicj4m
Z3Q7IEl0IGNhbiBub3QgZ2V0IHRoZSBkYnVzIGhhbmRsZXIgc28gaXQganVzdCBwcmludHMgYW4g
ZXJyb3IgYW5kIGZhaWxzLjxicj4mZ3Q7IENhbiB5b3UgbG9vayBmb3Igc29tZSBzeXN0ZW0gZGJ1
cyBsb2dzIHRvIHNlZSBpZiB0aGVyZSBhcmUgYW55IGVycm9ycyB0aGVyZT88YnI+PC9mb250Pjwv
dHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5Tb3JyeSwgYnV0IGFicm1kIGV4aXRzIC0gd2l0aCBu
byBlcnJvciBtZXNzYWdlLiAmbmJzcDtJdHMgd2luZG93IGp1c3QgZ29lcyBiYWNrIHRvPC9mb250
PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj50aGUgY29tbWFuZCBwcm9tcHQuICZuYnNwO0kn
ZCBjYWxsIHRoYXQgYSBjcmFzaCwgYXNzdW1pbmcgaXQgc2hvdWxkIG5ldmVyIGV4aXQuPC9mb250
PjwvdHQ+PGJyPjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+SWYgeW91IHRlbGwgbWUgd2hlcmUgJ3Ro
ZSBzeXN0ZW0gZGJ1cyBsb2dzJyBhcmUsIEknZCBiZSB3aWxsaW5nPC9mb250PjwvdHQ+PGJyPjx0
dD48Zm9udCBzaXplPSIyIj50byBwb3N0IHRoZW0uPC9mb250PjwvdHQ+PGJyPjxicj48YnI+PHR0
Pjxmb250IHNpemU9IjIiPjxicj48L2ZvbnQ+PC90dD48QlI+CjwvYm9keT48L2h0bWw+Cg==

--===============5098980963121402376==--

