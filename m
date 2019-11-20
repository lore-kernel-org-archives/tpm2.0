Content-Type: multipart/mixed; boundary="===============7093597991033509371=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: [tpm2] Re: raspi tpm in lockdown
Date: Wed, 20 Nov 2019 07:38:18 +0000
Message-ID: <CAKrSGQQR=4K-QvPExTdoAFmX_M9qkMKO3fGjsDjA0htrZLPDxw@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E45687@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7093597991033509371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 2:40 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> I always recommend that you use tpm2-tools >=3D 4.0, versions < 4.0 are
> legacy at this point.
>

Sorry to hjiack this thread, is there someone where we list when versions
will become legacy / EOL etc?

I had a search in the repo, but did not manage to dig anything up.


> Eventually, depending on configuration, the lockout mode should expire.
> You should
> Be able to run tpm2_getcap -c properties-variable | grep LOCKOUT
> TPM2_PT_LOCKOUT_COUNTER: 0x0
> TPM2_PT_LOCKOUT_INTERVAL: 0x3E8
> TPM2_PT_LOCKOUT_RECOVERY: 0x3E8
>
> Should tell you how long you need to wait.
>
> I remember their being all sorts of issues with tpm2_takeownership,
> depending
> On version where it was running all the changeauth commands even when the
> other
> hierarchies were not specified.
>
> On PC's the bios usually has a reset option for the tpm. On raspberry pi,
> I am not sure
> how you would reset it. @idsea any idea?
>
> Bill
>
> > -----Original Message-----
> > From: Dennis Knorr [mailto:dennis.knorr(a)gmx.net]
> > Sent: Saturday, November 16, 2019 2:09 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] raspi tpm in lockdown
> >
> > Hi,
> > i tried to play with an tpm from letstrust.de. i played around a bit,
> but now it
> > seems to be in lockdown:
> > https://pastebin.com/S59y4tQk
> >
> > but i am SURE that i have the correct password. Any Idea what i did
> wrong?
> > anything i can do? i could remove the tpm chip from the raspberry? would
> that
> > help
> >
> > i hope you can help me.
> >
> > Dennis
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>

-- =

Luke Hinds  | CTO Office | Red Hat
e: lhinds(a)redhat.com | irc: lhinds @freenode | t: +44 12 52 36 2483

--===============7093597991033509371==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48YnI+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3Rl
Ij48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVHVlLCBOb3YgMTksIDIwMTkg
YXQgMjo0MCBQTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFt
LmMucm9iZXJ0c0BpbnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7
IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJt
YXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0
LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+SSBhbHdheXMgcmVjb21tZW5kIHRoYXQgeW91IHVzZSB0
cG0yLXRvb2xzICZndDs9IDQuMCwgdmVyc2lvbnMgJmx0OyA0LjAgYXJlIGxlZ2FjeSBhdCB0aGlz
IHBvaW50Ljxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5Tb3JyeSB0byBoamlh
Y2sgdGhpcyB0aHJlYWQsIGlzIHRoZXJlIHNvbWVvbmUgd2hlcmUgd2UgbGlzdCB3aGVuIHZlcnNp
b25zIHdpbGwgYmVjb21lIGxlZ2FjeSAvIEVPTCBldGM/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5JIGhhZCBhIHNlYXJjaCBpbiB0aGUgcmVwbywgYnV0IGRpZCBub3QgbWFuYWdlIHRvIGRpZyBh
bnl0aGluZyB1cC48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFw
eCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPgo8YnI+CkV2ZW50dWFs
bHksIGRlcGVuZGluZyBvbiBjb25maWd1cmF0aW9uLCB0aGUgbG9ja291dCBtb2RlIHNob3VsZCBl
eHBpcmUuIFlvdSBzaG91bGQ8YnI+CkJlIGFibGUgdG8gcnVuIHRwbTJfZ2V0Y2FwIC1jIHByb3Bl
cnRpZXMtdmFyaWFibGUgfCBncmVwIExPQ0tPVVQ8YnI+ClRQTTJfUFRfTE9DS09VVF9DT1VOVEVS
OiAweDA8YnI+ClRQTTJfUFRfTE9DS09VVF9JTlRFUlZBTDogMHgzRTg8YnI+ClRQTTJfUFRfTE9D
S09VVF9SRUNPVkVSWTogMHgzRTg8YnI+Cjxicj4KU2hvdWxkIHRlbGwgeW91IGhvdyBsb25nIHlv
dSBuZWVkIHRvIHdhaXQuPGJyPgo8YnI+CkkgcmVtZW1iZXIgdGhlaXIgYmVpbmcgYWxsIHNvcnRz
IG9mIGlzc3VlcyB3aXRoIHRwbTJfdGFrZW93bmVyc2hpcCwgZGVwZW5kaW5nPGJyPgpPbiB2ZXJz
aW9uIHdoZXJlIGl0IHdhcyBydW5uaW5nIGFsbCB0aGUgY2hhbmdlYXV0aCBjb21tYW5kcyBldmVu
IHdoZW4gdGhlIG90aGVyPGJyPgpoaWVyYXJjaGllcyB3ZXJlIG5vdCBzcGVjaWZpZWQuPGJyPgo8
YnI+Ck9uIFBDJiMzOTtzIHRoZSBiaW9zIHVzdWFsbHkgaGFzIGEgcmVzZXQgb3B0aW9uIGZvciB0
aGUgdHBtLiBPbiByYXNwYmVycnkgcGksIEkgYW0gbm90IHN1cmU8YnI+CmhvdyB5b3Ugd291bGQg
cmVzZXQgaXQuIEBpZHNlYSBhbnkgaWRlYT88YnI+Cjxicj4KQmlsbDxicj4KPGJyPgomZ3Q7IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7IEZyb206IERlbm5pcyBLbm9yciBbbWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpkZW5uaXMua25vcnJAZ214Lm5ldCIgdGFyZ2V0PSJfYmxhbmsi
PmRlbm5pcy5rbm9yckBnbXgubmV0PC9hPl08YnI+CiZndDsgU2VudDogU2F0dXJkYXksIE5vdmVt
YmVyIDE2LCAyMDE5IDI6MDkgUE08YnI+CiZndDsgVG86IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxp
c3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0
OyBTdWJqZWN0OiBbdHBtMl0gcmFzcGkgdHBtIGluIGxvY2tkb3duPGJyPgomZ3Q7IDxicj4KJmd0
OyBIaSw8YnI+CiZndDsgaSB0cmllZCB0byBwbGF5IHdpdGggYW4gdHBtIGZyb20gPGEgaHJlZj0i
aHR0cDovL2xldHN0cnVzdC5kZSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGV0
c3RydXN0LmRlPC9hPi4gaSBwbGF5ZWQgYXJvdW5kIGEgYml0LCBidXQgbm93IGl0PGJyPgomZ3Q7
IHNlZW1zIHRvIGJlIGluIGxvY2tkb3duOjxicj4KJmd0OyA8YSBocmVmPSJodHRwczovL3Bhc3Rl
YmluLmNvbS9TNTl5NHRRayIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6
Ly9wYXN0ZWJpbi5jb20vUzU5eTR0UWs8L2E+PGJyPgomZ3Q7IDxicj4KJmd0OyBidXQgaSBhbSBT
VVJFIHRoYXQgaSBoYXZlIHRoZSBjb3JyZWN0IHBhc3N3b3JkLiBBbnkgSWRlYSB3aGF0IGkgZGlk
IHdyb25nPzxicj4KJmd0OyBhbnl0aGluZyBpIGNhbiBkbz8gaSBjb3VsZCByZW1vdmUgdGhlIHRw
bSBjaGlwIGZyb20gdGhlIHJhc3BiZXJyeT8gd291bGQgdGhhdDxicj4KJmd0OyBoZWxwPGJyPgom
Z3Q7IDxicj4KJmd0OyBpIGhvcGUgeW91IGNhbiBoZWxwIG1lLjxicj4KJmd0OyA8YnI+CiZndDsg
RGVubmlzPGJyPgomZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fPGJyPgomZ3Q7IHRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0y
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4K
Jmd0OyBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0y
LWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEu
b3JnPC9hPjxicj4KJmd0OyAlKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2lu
dGVybmFsX25hbWUpczxicj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0yQGxp
c3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KVG8g
dW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48
YnI+CiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
PGJyPgo8YnI+CjwvYmxvY2txdW90ZT48L2Rpdj48YnIgY2xlYXI9ImFsbCI+PGJyPi0tIDxicj48
ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfc2lnbmF0dXJlIj48ZGl2IGRpcj0ibHRyIj48ZGl2
PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+THVrZSBIaW5kc8KgIHwgQ1RPIE9mZmljZSB8
IFJlZCBIYXQ8L3NwYW4+PGJyIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjEyLjhweCI+ZTrCoDwvc3Bhbj48YSBocmVmPSJtYWlsdG86bGhpbmRzQHJlZGhh
dC5jb20iIHN0eWxlPSJjb2xvcjpyZ2IoMTcsODUsMjA0KTtmb250LXNpemU6MTIuOHB4IiB0YXJn
ZXQ9Il9ibGFuayI+bGhpbmRzQHJlZGhhdC5jb208L2E+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
Mi44cHgiPsKgfCBpcmM6IGxoaW5kcyBAZnJlZW5vZGUgfDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjEyLjhweCI+IHQ6wqA8L3NwYW4+KzQ0IDEyIDUyIDM2IDI0ODM8YnIgc3R5bGU9ImZv
bnQtc2l6ZToxMi44cHgiPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2
PjwvZGl2PjwvZGl2Pgo=

--===============7093597991033509371==--

