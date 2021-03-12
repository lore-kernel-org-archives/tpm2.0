Content-Type: multipart/mixed; boundary="===============6365760037704818640=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: abrmd crashing - how to debug? - dbus logs?
Date: Fri, 12 Mar 2021 09:25:24 -0500
Message-ID: <OFACEAAC77.2AC958C7-ON00258696.004DC513-85258696.004F3B10@notes.na.collabserv.com>
In-Reply-To: 5da9f0ba-d3b6-621b-6d73-9b3fe43d79e8@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6365760037704818640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> From: Tadeusz Struk <tadeusz.struk(a)intel.com>

> >> > After about 5 minutes of sending commands, abrmd crashes. I
> >> originally found it with keylime, but I can reproduce it with a
> >> simple bash loop on pcrread.
> >
> > A few data points:
> >
> > When I run with the debug flag on, it runs 5x longer.
> > When I run with a 5 second sleep between commands, it runs 10x longer.
> >
> > It seems to be related to how fast I send the pcr read commands,
> > but I'm not sure.
> >
> > ~~
> >
> > I'm happy to post abrmd dbus logs, but I don't know where they are.
>
> I think that we still need to find out what was wrong in the initial
> problem in tcti_tabrmd_connect() that it returned 2 handles instead of 1
> as expected:
>
> CRITICAL **: 10:43:39.780: CreateConnection expected to return 1
> handles, received 2
>
> what might happen is that for whatever reason it leaks one of this dbus
> proxy objects on every pcr_read and finally runs out of them.
> It might be that it is very WSL specific.

I don't think it's a hard limit.  As I said, it runs longer after
debug is turned on and longer with a sleep.  The actual failure
count varies a lot from run to run.

> Did you try it on any other
> environment like Linux in a VM maybe?

Can you recommend any distro and release?

--===============6365760037704818640==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PHR0Pjxmb250IHNpemU9IjIiPiZndDsgRnJvbTogVGFkZXVzeiBTdHJ1
ayAmbHQ7dGFkZXVzei5zdHJ1a0BpbnRlbC5jb20mZ3Q7PC9mb250PjwvdHQ+PGJyPjx0dD48Zm9u
dCBzaXplPSIyIj48YnI+Jmd0OyAmZ3Q7Jmd0OyAmZ3Q7IEFmdGVyIGFib3V0IDUgbWludXRlcyBv
ZiBzZW5kaW5nIGNvbW1hbmRzLCBhYnJtZCBjcmFzaGVzLiBJPGJyPiZndDsgJmd0OyZndDsgb3Jp
Z2luYWxseSBmb3VuZCBpdCB3aXRoIGtleWxpbWUsIGJ1dCBJIGNhbiByZXByb2R1Y2UgaXQgd2l0
aCBhPGJyPiZndDsgJmd0OyZndDsgc2ltcGxlIGJhc2ggbG9vcCBvbiBwY3JyZWFkLjxicj4mZ3Q7
ICZndDsgPGJyPiZndDsgJmd0OyBBIGZldyBkYXRhIHBvaW50czo8YnI+Jmd0OyAmZ3Q7IDxicj4m
Z3Q7ICZndDsgV2hlbiBJIHJ1biB3aXRoIHRoZSBkZWJ1ZyBmbGFnIG9uLCBpdCBydW5zIDV4IGxv
bmdlci48YnI+Jmd0OyAmZ3Q7IFdoZW4gSSBydW4gd2l0aCBhIDUgc2Vjb25kIHNsZWVwIGJldHdl
ZW4gY29tbWFuZHMsIGl0IHJ1bnMgMTB4IGxvbmdlci48YnI+Jmd0OyAmZ3Q7IDxicj4mZ3Q7ICZn
dDsgSXQgc2VlbXMgdG8gYmUgcmVsYXRlZCB0byBob3cgZmFzdCBJIHNlbmQgdGhlIHBjciByZWFk
IGNvbW1hbmRzLDxicj4mZ3Q7ICZndDsgYnV0IEknbSBub3Qgc3VyZS48YnI+Jmd0OyAmZ3Q7IDxi
cj4mZ3Q7ICZndDsgfn48YnI+Jmd0OyAmZ3Q7IDxicj4mZ3Q7ICZndDsgSSdtIGhhcHB5IHRvIHBv
c3QgYWJybWQgZGJ1cyBsb2dzLCBidXQgSSBkb24ndCBrbm93IHdoZXJlIHRoZXkgYXJlLjxicj4m
Z3Q7IDxicj4mZ3Q7IEkgdGhpbmsgdGhhdCB3ZSBzdGlsbCBuZWVkIHRvIGZpbmQgb3V0IHdoYXQg
d2FzIHdyb25nIGluIHRoZSBpbml0aWFsPGJyPiZndDsgcHJvYmxlbSBpbiB0Y3RpX3RhYnJtZF9j
b25uZWN0KCkgdGhhdCBpdCByZXR1cm5lZCAyIGhhbmRsZXMgaW5zdGVhZCBvZiAxPGJyPiZndDsg
YXMgZXhwZWN0ZWQ6PGJyPiZndDsgPGJyPiZndDsgQ1JJVElDQUwgKio6IDEwOjQzOjM5Ljc4MDog
Q3JlYXRlQ29ubmVjdGlvbiBleHBlY3RlZCB0byByZXR1cm4gMTxicj4mZ3Q7IGhhbmRsZXMsIHJl
Y2VpdmVkIDI8YnI+Jmd0OyA8YnI+Jmd0OyB3aGF0IG1pZ2h0IGhhcHBlbiBpcyB0aGF0IGZvciB3
aGF0ZXZlciByZWFzb24gaXQgbGVha3Mgb25lIG9mIHRoaXMgZGJ1czxicj4mZ3Q7IHByb3h5IG9i
amVjdHMgb24gZXZlcnkgcGNyX3JlYWQgYW5kIGZpbmFsbHkgcnVucyBvdXQgb2YgdGhlbS48YnI+
Jmd0OyBJdCBtaWdodCBiZSB0aGF0IGl0IGlzIHZlcnkgV1NMIHNwZWNpZmljLiA8YnI+PC9mb250
PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5JIGRvbid0IHRoaW5rIGl0J3MgYSBoYXJkIGxp
bWl0LiAmbmJzcDtBcyBJIHNhaWQsIGl0IHJ1bnMgbG9uZ2VyIGFmdGVyPC9mb250PjwvdHQ+PGJy
Pjx0dD48Zm9udCBzaXplPSIyIj5kZWJ1ZyBpcyB0dXJuZWQgb24gYW5kIGxvbmdlciB3aXRoIGEg
c2xlZXAuICZuYnNwO1RoZSBhY3R1YWwgZmFpbHVyZTwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQg
c2l6ZT0iMiI+Y291bnQgdmFyaWVzIGEgbG90IGZyb20gcnVuIHRvIHJ1bi48L2ZvbnQ+PC90dD48
YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4mZ3Q7IERpZCB5b3UgdHJ5IGl0IG9uIGFueSBvdGhl
cjxicj4mZ3Q7IGVudmlyb25tZW50IGxpa2UgTGludXggaW4gYSBWTSBtYXliZT88L2ZvbnQ+PC90
dD48YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5DYW4geW91IHJlY29tbWVuZCBhbnkgZGlzdHJv
IGFuZCByZWxlYXNlPyAgICAgICAgPC9mb250PjwvdHQ+PEJSPgo8L2JvZHk+PC9odG1sPgo=

--===============6365760037704818640==--

