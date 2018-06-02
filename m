Content-Type: multipart/mixed; boundary="===============5355862722080421985=="
MIME-Version: 1.0
From: Trevor Woerner <twoerner at gmail.com>
Subject: Re: [tpm2] meta-measured updates
Date: Fri, 01 Jun 2018 22:35:43 -0400
Message-ID: <CAHUNapQP+j6KE_ZLsqhtkDbD46_=vV=eYWiQ-rfxrSHJU9if3A@mail.gmail.com>
In-Reply-To: 20180601230124.GA732@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5355862722080421985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 1, 2018 at 7:01 PM, Philip Tricca <philip.b.tricca(a)intel.com>
wrote:

> On Wed, May 30, 2018 at 05:13:04PM -0400, Trevor Woerner wrote:
> > Hi Philip,
> >
> > My hope is that one day the OE community will have one security layer to
> > choose, rather than the three that we have currently.
>
> In my experience things that live in a separate "security" area rarely
> get tested well. Ideally they would live as close to the upstream "core"
> as possible.
>
>
If enough people can be convinced that this needs to be in core that it
ends up there one day, that would be awesome! But my gut feeling is that
there isn't quite enough interest just yet for all this security stuff to
not be in its own layer.


> > I've looked at the three different layers and feel that meta-secure-core
> might
> > be a better one to target. With respect to its TPM2 recipes, however,
> > meta-secure-core (and the other, meta-security) lag behind
> meta-measured. As
> > such I've been working on some updates for meta-secure-core.
> >
> > Are you still keen to fold meta-measured into something else? If not I
> could
> > prepare a set of patches for meta-measured as well.
>
> Given the above my first priority is figuring out how far upstream the
> various pieces can go. I've been chatting with a few folks and have been
> working up patches to yocto-kernel-cache and openembedded-core to
> cleanup the kernel config fragments and integrate the resulting
> kernel-module packages into packagegroup-base. With the swtpm stuff
> being integrated into qemu it's now possible to test at least the
> tpm-tis driver by:
> 1) creating a qemu machine with 'tpm-tis' added to the MACHINE_FEATURES
> 2) setup the swtpm daemon
> 3) runqemu booting core-image-base to verity the /dev/tpm* is created
>
>
I wasn't aware that the latest qemu had support for TPM; this is great
news! I've heard that the latest qemu also has raspberrypi emulation
support, that's something else I should investigate as well :-)


> After this gets reviewed and if usptream is willing I'm then hoping to
> propose moving the recipes for user space bits as close to
> openembedded-core as possible. I think the ideal end state would be
> enabling something via COMBINED_FEATURES so that we can have
> MACHINE_FEATURES and DISTRO_FEATURES working together to seamlessly pull
> in the right kernel driver and TSS(2)? recipes.
>
> Something you're willing to help test and maybe contribute a 'tested-by'
> tag on patches when they get sent upstream?
>
>
Absolutely! (although I might need an individual, side-channel ping to
alert me to their addition since I can't follow the various OE patch lists
in detail every day)

Currently meta-measured has one kernel option that isn't RPi-friendly. I
never said anything about it since it was easy enough to remove through
local configurations. Therefore I'm looking forward to these new fragments
to see how they'll do on non-Intel hardware.

In any case, I could imaging the kernel fragments *might* make it into
oe-core, but I doubt something like the TPM2 recipes would. Those will
probably need to find a home outside oe-core.


> > Looking at the master commit of tpm2-tss, specifically, I've noticed a
> number
> > of changes and was hoping for your feedback.
> >
> > With the tss 1.x stuff we had:
> >       - libtcti-device
> >       - libtcti-socket
> >       - libsapi
> >
> > The new tss 2.x stuff has:
> >       - libtss2-esys
> >       - libtss2-mu
> >       - libtss2-sys
> >       - libtss2-tcti-device
> >       - libtss2-tcti-mssim
> >
> > I'm guessing libtss2-tcti-device is the new name for the old
> libtcti-device.
> > But are there any mappings from the new stuff to the older
> libtcti-socket and
> > libsapi?
> >
> > It looks like things are going to get messy. It looks like, going
> forward,
> > we're going to need to keep tpm2-tss_1.x.bb around as well as create
> > tpm2-tss_2.x.bb recipes with differently named PACKAGES so existing
> recipes
> > that use tss (and expect the old 1.x behaviour/API) can continue to work
> while
> > allowing new code (or updates to the old) to use the new API (?).
>
> I think Bill got all of this covered in his reply.
>
>
Yes, and he did an excellent job; thank you!

PS: how was the security summit?

--===============5355862722080421985==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj5PbiBGcmksIEp1biAxLCAyMDE4IGF0IDc6MDEgUE0sIFBoaWxpcCBUcmljY2EgPHNw
YW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86cGhpbGlwLmIudHJpY2NhQGludGVsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPnBoaWxpcC5iLnRyaWNjYUBpbnRlbC5jb208L2E+Jmd0Ozwvc3Bh
bj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdp
bjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgi
PjxzcGFuIGNsYXNzPSIiPk9uIFdlZCwgTWF5IDMwLCAyMDE4IGF0IDA1OjEzOjA0UE0gLTA0MDAs
IFRyZXZvciBXb2VybmVyIHdyb3RlOjxicj4KJmd0OyBIaSBQaGlsaXAsPGJyPgomZ3Q7IDxicj4K
Jmd0OyBNeSBob3BlIGlzIHRoYXQgb25lIGRheSB0aGUgT0UgY29tbXVuaXR5IHdpbGwgaGF2ZSBv
bmUgc2VjdXJpdHkgbGF5ZXIgdG88YnI+CiZndDsgY2hvb3NlLCByYXRoZXIgdGhhbiB0aGUgdGhy
ZWUgdGhhdCB3ZSBoYXZlIGN1cnJlbnRseS48YnI+Cjxicj4KPC9zcGFuPkluIG15IGV4cGVyaWVu
Y2UgdGhpbmdzIHRoYXQgbGl2ZSBpbiBhIHNlcGFyYXRlICZxdW90O3NlY3VyaXR5JnF1b3Q7IGFy
ZWEgcmFyZWx5PGJyPgpnZXQgdGVzdGVkIHdlbGwuIElkZWFsbHkgdGhleSB3b3VsZCBsaXZlIGFz
IGNsb3NlIHRvIHRoZSB1cHN0cmVhbSAmcXVvdDtjb3JlJnF1b3Q7PGJyPgphcyBwb3NzaWJsZS48
YnI+CjxzcGFuIGNsYXNzPSIiPjxicj48L3NwYW4+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2
PjxkaXY+SWYgZW5vdWdoIHBlb3BsZSBjYW4gYmUgY29udmluY2VkIHRoYXQgdGhpcyBuZWVkcyB0
byBiZSBpbiBjb3JlIHRoYXQgaXQgZW5kcyB1cCB0aGVyZSBvbmUgZGF5LCB0aGF0IHdvdWxkIGJl
IGF3ZXNvbWUhIEJ1dCBteSBndXQgZmVlbGluZyBpcyB0aGF0IHRoZXJlIGlzbiYjMzk7dCBxdWl0
ZSBlbm91Z2ggaW50ZXJlc3QganVzdCB5ZXQgZm9yIGFsbCB0aGlzIHNlY3VyaXR5IHN0dWZmIHRv
IG5vdCBiZSBpbiBpdHMgb3duIGxheWVyLjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBj
bGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDox
cHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48c3BhbiBjbGFzcz0iIj4KJmd0OyBJJiMz
OTt2ZSBsb29rZWQgYXQgdGhlIHRocmVlIGRpZmZlcmVudCBsYXllcnMgYW5kIGZlZWwgdGhhdCBt
ZXRhLXNlY3VyZS1jb3JlIG1pZ2h0PGJyPgomZ3Q7IGJlIGEgYmV0dGVyIG9uZSB0byB0YXJnZXQu
IFdpdGggcmVzcGVjdCB0byBpdHMgVFBNMiByZWNpcGVzLCBob3dldmVyLDxicj4KJmd0OyBtZXRh
LXNlY3VyZS1jb3JlIChhbmQgdGhlIG90aGVyLCBtZXRhLXNlY3VyaXR5KSBsYWcgYmVoaW5kIG1l
dGEtbWVhc3VyZWQuIEFzPGJyPgomZ3Q7IHN1Y2ggSSYjMzk7dmUgYmVlbiB3b3JraW5nIG9uIHNv
bWUgdXBkYXRlcyBmb3IgbWV0YS1zZWN1cmUtY29yZS48YnI+CiZndDsgPGJyPgomZ3Q7IEFyZSB5
b3Ugc3RpbGwga2VlbiB0byBmb2xkIG1ldGEtbWVhc3VyZWQgaW50byBzb21ldGhpbmcgZWxzZT8g
SWYgbm90IEkgY291bGQ8YnI+CiZndDsgcHJlcGFyZSBhIHNldCBvZiBwYXRjaGVzIGZvciBtZXRh
LW1lYXN1cmVkIGFzIHdlbGwuPGJyPgo8YnI+Cjwvc3Bhbj5HaXZlbiB0aGUgYWJvdmUgbXkgZmly
c3QgcHJpb3JpdHkgaXMgZmlndXJpbmcgb3V0IGhvdyBmYXIgdXBzdHJlYW0gdGhlPGJyPgp2YXJp
b3VzIHBpZWNlcyBjYW4gZ28uIEkmIzM5O3ZlIGJlZW4gY2hhdHRpbmcgd2l0aCBhIGZldyBmb2xr
cyBhbmQgaGF2ZSBiZWVuPGJyPgp3b3JraW5nIHVwIHBhdGNoZXMgdG8geW9jdG8ta2VybmVsLWNh
Y2hlIGFuZCBvcGVuZW1iZWRkZWQtY29yZSB0bzxicj4KY2xlYW51cCB0aGUga2VybmVsIGNvbmZp
ZyBmcmFnbWVudHMgYW5kIGludGVncmF0ZSB0aGUgcmVzdWx0aW5nPGJyPgprZXJuZWwtbW9kdWxl
IHBhY2thZ2VzIGludG8gcGFja2FnZWdyb3VwLWJhc2UuIFdpdGggdGhlIHN3dHBtIHN0dWZmPGJy
PgpiZWluZyBpbnRlZ3JhdGVkIGludG8gcWVtdSBpdCYjMzk7cyBub3cgcG9zc2libGUgdG8gdGVz
dCBhdCBsZWFzdCB0aGU8YnI+CnRwbS10aXMgZHJpdmVyIGJ5Ojxicj4KMSkgY3JlYXRpbmcgYSBx
ZW11IG1hY2hpbmUgd2l0aCAmIzM5O3RwbS10aXMmIzM5OyBhZGRlZCB0byB0aGUgTUFDSElORV9G
RUFUVVJFUzxicj4KMikgc2V0dXAgdGhlIHN3dHBtIGRhZW1vbjxicj4KMykgcnVucWVtdSBib290
aW5nIGNvcmUtaW1hZ2UtYmFzZSB0byB2ZXJpdHkgdGhlIC9kZXYvdHBtKiBpcyBjcmVhdGVkPGJy
Pgo8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+SSB3YXNuJiMzOTt0IGF3YXJl
IHRoYXQgdGhlIGxhdGVzdCBxZW11IGhhZCBzdXBwb3J0IGZvciBUUE07IHRoaXMgaXMgZ3JlYXQg
bmV3cyEgSSYjMzk7dmUgaGVhcmQgdGhhdCB0aGUgbGF0ZXN0IHFlbXUgYWxzbyBoYXMgcmFzcGJl
cnJ5cGkgZW11bGF0aW9uIHN1cHBvcnQsIHRoYXQmIzM5O3Mgc29tZXRoaW5nIGVsc2UgSSBzaG91
bGQgaW52ZXN0aWdhdGUgYXMgd2VsbCA6LSk8L2Rpdj48ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGUg
Y2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6
MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+CkFmdGVyIHRoaXMgZ2V0cyByZXZpZXdl
ZCBhbmQgaWYgdXNwdHJlYW0gaXMgd2lsbGluZyBJJiMzOTttIHRoZW4gaG9waW5nIHRvPGJyPgpw
cm9wb3NlIG1vdmluZyB0aGUgcmVjaXBlcyBmb3IgdXNlciBzcGFjZSBiaXRzIGFzIGNsb3NlIHRv
PGJyPgpvcGVuZW1iZWRkZWQtY29yZSBhcyBwb3NzaWJsZS4gSSB0aGluayB0aGUgaWRlYWwgZW5k
IHN0YXRlIHdvdWxkIGJlPGJyPgplbmFibGluZyBzb21ldGhpbmcgdmlhIENPTUJJTkVEX0ZFQVRV
UkVTIHNvIHRoYXQgd2UgY2FuIGhhdmU8YnI+Ck1BQ0hJTkVfRkVBVFVSRVMgYW5kIERJU1RST19G
RUFUVVJFUyB3b3JraW5nIHRvZ2V0aGVyIHRvIHNlYW1sZXNzbHkgcHVsbDxicj4KaW4gdGhlIHJp
Z2h0IGtlcm5lbCBkcml2ZXIgYW5kIFRTUygyKT8gcmVjaXBlcy48YnI+Cjxicj4KU29tZXRoaW5n
IHlvdSYjMzk7cmUgd2lsbGluZyB0byBoZWxwIHRlc3QgYW5kIG1heWJlIGNvbnRyaWJ1dGUgYSAm
IzM5O3Rlc3RlZC1ieSYjMzk7PGJyPgp0YWcgb24gcGF0Y2hlcyB3aGVuIHRoZXkgZ2V0IHNlbnQg
dXBzdHJlYW0/PGJyPgo8c3BhbiBjbGFzcz0iIj48YnI+PC9zcGFuPjwvYmxvY2txdW90ZT48ZGl2
Pjxicj48L2Rpdj48ZGl2PkFic29sdXRlbHkhIChhbHRob3VnaCBJIG1pZ2h0IG5lZWQgYW4gaW5k
aXZpZHVhbCwgc2lkZS1jaGFubmVsIHBpbmcgdG8gYWxlcnQgbWUgdG8gdGhlaXIgYWRkaXRpb24g
c2luY2UgSSBjYW4mIzM5O3QgZm9sbG93IHRoZSB2YXJpb3VzIE9FIHBhdGNoIGxpc3RzIGluIGRl
dGFpbCBldmVyeSBkYXkpPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5DdXJyZW50bHkgbWV0YS1t
ZWFzdXJlZCBoYXMgb25lIGtlcm5lbCBvcHRpb24gdGhhdCBpc24mIzM5O3QgUlBpLWZyaWVuZGx5
LiBJIG5ldmVyIHNhaWQgYW55dGhpbmcgYWJvdXQgaXQgc2luY2UgaXQgd2FzIGVhc3kgZW5vdWdo
IHRvIHJlbW92ZSB0aHJvdWdoIGxvY2FsIGNvbmZpZ3VyYXRpb25zLiBUaGVyZWZvcmUgSSYjMzk7
bSBsb29raW5nIGZvcndhcmQgdG8gdGhlc2UgbmV3IGZyYWdtZW50cyB0byBzZWUgaG93IHRoZXkm
IzM5O2xsIGRvIG9uIG5vbi1JbnRlbCBoYXJkd2FyZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PkluIGFueSBjYXNlLCBJIGNvdWxkIGltYWdpbmcgdGhlIGtlcm5lbCBmcmFnbWVudHMgKm1pZ2h0
KiBtYWtlIGl0IGludG8gb2UtY29yZSwgYnV0IEkgZG91YnQgc29tZXRoaW5nIGxpa2UgdGhlIFRQ
TTIgcmVjaXBlcyB3b3VsZC4gVGhvc2Ugd2lsbCBwcm9iYWJseSBuZWVkIHRvIGZpbmQgYSBob21l
IG91dHNpZGUgb2UtY29yZS48L2Rpdj48ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mg
c29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PHNwYW4gY2xhc3M9IiI+CiZndDsgTG9va2luZyBhdCB0
aGUgbWFzdGVyIGNvbW1pdCBvZiB0cG0yLXRzcywgc3BlY2lmaWNhbGx5LCBJJiMzOTt2ZSBub3Rp
Y2VkIGEgbnVtYmVyPGJyPgomZ3Q7IG9mIGNoYW5nZXMgYW5kIHdhcyBob3BpbmcgZm9yIHlvdXIg
ZmVlZGJhY2suPGJyPgomZ3Q7IDxicj4KJmd0OyBXaXRoIHRoZSB0c3MgMS54IHN0dWZmIHdlIGhh
ZDo8YnI+CiZndDvCoCDCoCDCoCDCoC0gbGlidGN0aS1kZXZpY2U8YnI+CiZndDvCoCDCoCDCoCDC
oC0gbGlidGN0aS1zb2NrZXQ8YnI+CiZndDvCoCDCoCDCoCDCoC0gbGlic2FwaTxicj4KJmd0OyA8
YnI+CiZndDsgVGhlIG5ldyB0c3MgMi54IHN0dWZmIGhhczo8YnI+CiZndDvCoCDCoCDCoCDCoC0g
bGlidHNzMi1lc3lzPGJyPgomZ3Q7wqAgwqAgwqAgwqAtIGxpYnRzczItbXU8YnI+CiZndDvCoCDC
oCDCoCDCoC0gbGlidHNzMi1zeXM8YnI+CiZndDvCoCDCoCDCoCDCoC0gbGlidHNzMi10Y3RpLWRl
dmljZTxicj4KJmd0O8KgIMKgIMKgIMKgLSBsaWJ0c3MyLXRjdGktbXNzaW08YnI+CiZndDsgPGJy
PgomZ3Q7IEkmIzM5O20gZ3Vlc3NpbmcgbGlidHNzMi10Y3RpLWRldmljZSBpcyB0aGUgbmV3IG5h
bWUgZm9yIHRoZSBvbGQgbGlidGN0aS1kZXZpY2UuPGJyPgomZ3Q7IEJ1dCBhcmUgdGhlcmUgYW55
IG1hcHBpbmdzIGZyb20gdGhlIG5ldyBzdHVmZiB0byB0aGUgb2xkZXIgbGlidGN0aS1zb2NrZXQg
YW5kPGJyPgomZ3Q7IGxpYnNhcGk/PGJyPgomZ3Q7IDxicj4KJmd0OyBJdCBsb29rcyBsaWtlIHRo
aW5ncyBhcmUgZ29pbmcgdG8gZ2V0IG1lc3N5LiBJdCBsb29rcyBsaWtlLCBnb2luZyBmb3J3YXJk
LDxicj4KJmd0OyB3ZSYjMzk7cmUgZ29pbmcgdG8gbmVlZCB0byBrZWVwIDxhIGhyZWY9Imh0dHA6
Ly90cG0yLXRzc18xLnguYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnRwbTIt
dHNzXzEueC5iYjwvYT4gYXJvdW5kIGFzIHdlbGwgYXMgY3JlYXRlPGJyPgomZ3Q7IDxhIGhyZWY9
Imh0dHA6Ly90cG0yLXRzc18yLnguYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
PnRwbTItdHNzXzIueC5iYjwvYT4gcmVjaXBlcyB3aXRoIGRpZmZlcmVudGx5IG5hbWVkIFBBQ0tB
R0VTIHNvIGV4aXN0aW5nIHJlY2lwZXM8YnI+CiZndDsgdGhhdCB1c2UgdHNzIChhbmQgZXhwZWN0
IHRoZSBvbGQgMS54IGJlaGF2aW91ci9BUEkpIGNhbiBjb250aW51ZSB0byB3b3JrIHdoaWxlPGJy
PgomZ3Q7IGFsbG93aW5nIG5ldyBjb2RlIChvciB1cGRhdGVzIHRvIHRoZSBvbGQpIHRvIHVzZSB0
aGUgbmV3IEFQSSAoPykuPGJyPgo8YnI+Cjwvc3Bhbj5JIHRoaW5rIEJpbGwgZ290IGFsbCBvZiB0
aGlzIGNvdmVyZWQgaW4gaGlzIHJlcGx5Ljxicj48YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwv
ZGl2PjxkaXY+WWVzLCBhbmQgaGUgZGlkIGFuIGV4Y2VsbGVudCBqb2I7IHRoYW5rIHlvdSE8L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PlBTOiBob3cgd2FzIHRoZSBzZWN1cml0eSBzdW1taXQ/wqA8
L2Rpdj48L2Rpdj48YnI+PC9kaXY+PC9kaXY+Cg==

--===============5355862722080421985==--

