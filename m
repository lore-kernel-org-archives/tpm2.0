Content-Type: multipart/mixed; boundary="===============2694244360620556507=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] Incomplete TPM event log on Linux?
Date: Wed, 18 Sep 2019 11:33:29 -0700
Message-ID: <CANKkrzGobBSmCSeeDG4QmEWZLppq3rgA7QNu+D+n9myVMVMC-Q@mail.gmail.com>
In-Reply-To: 334055b1-da45-1b31-3aa5-69bec9c5dcf3@vmware.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2694244360620556507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 11:14 AM Petr Vandrovec <petr(a)vmware.com> wrote:

> Hi,
>    it was a bit of luck, but it seems that event at offset 17938 ('Shim'
> EFI variable authority) is being extended twice to the PCR7 - if I
> extend computed PCR7 with its hash once more, I get your hardware PCR7.
>

Huh, yes, this seems to be the case. Thanks for figuring that out!

(I thought I had tested that hypothesis and ruled it out already, but
evidently I must have botched my experiment.)

I'm not sure if it is another variable with same content measured but
> not extended, or bug in your BIOS's/EFI's code extending entry twice.


Yeah, Shim and the X1 Carbon's BIOS/EFI both seem like likely culprits
here. On the one hand, Shim is generating malformed event log entries
<https://github.com/rhboot/shim/issues/184>, but also the BIOS is
incorrectly logging the "Calling UEFI Application from Boot Option" event
to PCR[5] instead of PCR[4] (which was fixed upstream 2.5 years ago
<https://github.com/tianocore/edk2/commit/c1b0828b3ba8fa203033ede0c3329c0d5=
573719e>
).

--===============2694244360620556507==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMTE6
MTQgQU0gUGV0ciBWYW5kcm92ZWMgJmx0OzxhIGhyZWY9Im1haWx0bzpwZXRyQHZtd2FyZS5jb20i
PnBldHJAdm13YXJlLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFp
bF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3Bh
ZGRpbmctbGVmdDoxZXgiPkhpLDxicj4KwqAgwqBpdCB3YXMgYSBiaXQgb2YgbHVjaywgYnV0IGl0
IHNlZW1zIHRoYXQgZXZlbnQgYXQgb2Zmc2V0IDE3OTM4ICgmIzM5O1NoaW0mIzM5OyA8YnI+CkVG
SSB2YXJpYWJsZSBhdXRob3JpdHkpIGlzIGJlaW5nIGV4dGVuZGVkIHR3aWNlIHRvIHRoZSBQQ1I3
IC0gaWYgSSA8YnI+CmV4dGVuZCBjb21wdXRlZCBQQ1I3IHdpdGggaXRzIGhhc2ggb25jZSBtb3Jl
LCBJIGdldCB5b3VyIGhhcmR3YXJlIFBDUjcuPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rp
dj48ZGl2Pkh1aCwgeWVzLCB0aGlzIHNlZW1zIHRvIGJlIHRoZSBjYXNlLiBUaGFua3MgZm9yIGZp
Z3VyaW5nIHRoYXQgb3V0ITwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+KEkgdGhvdWdodCBJIGhh
ZCB0ZXN0ZWQgdGhhdCBoeXBvdGhlc2lzIGFuZCBydWxlZCBpdCBvdXQgYWxyZWFkeSwgYnV0IGV2
aWRlbnRseSBJIG11c3QgaGF2ZSBib3RjaGVkIG15IGV4cGVyaW1lbnQuKTwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHgg
MHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRk
aW5nLWxlZnQ6MWV4Ij5JJiMzOTttIG5vdCBzdXJlIGlmIGl0IGlzIGFub3RoZXIgdmFyaWFibGUg
d2l0aCBzYW1lIGNvbnRlbnQgbWVhc3VyZWQgYnV0IDxicj4Kbm90IGV4dGVuZGVkLCBvciBidWcg
aW4geW91ciBCSU9TJiMzOTtzL0VGSSYjMzk7cyBjb2RlIGV4dGVuZGluZyBlbnRyeSB0d2ljZS48
L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5ZZWFoLCBTaGltIGFuZCB0aGUgWDEgQ2Fy
Ym9uJiMzOTtzIEJJT1MvRUZJIGJvdGggc2VlbSBsaWtlIGxpa2VseSBjdWxwcml0cyBoZXJlLiBP
biB0aGUgb25lIGhhbmQsIFNoaW0gaXMgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3JoYm9v
dC9zaGltL2lzc3Vlcy8xODQiPmdlbmVyYXRpbmcgbWFsZm9ybWVkIGV2ZW50IGxvZyBlbnRyaWVz
PC9hPiwgYnV0IGFsc28gdGhlIEJJT1MgaXMgaW5jb3JyZWN0bHkgbG9nZ2luZyB0aGUgJnF1b3Q7
Q2FsbGluZyBVRUZJIEFwcGxpY2F0aW9uIGZyb20gQm9vdCBPcHRpb24mcXVvdDsgZXZlbnQgdG8g
UENSWzVdIGluc3RlYWQgb2YgUENSWzRdICh3aGljaCB3YXMgPGEgaHJlZj0iaHR0cHM6Ly9naXRo
dWIuY29tL3RpYW5vY29yZS9lZGsyL2NvbW1pdC9jMWIwODI4YjNiYThmYTIwMzAzM2VkZTBjMzMy
OWMwZDU1NzM3MTllIj5maXhlZCB1cHN0cmVhbSAyLjUgeWVhcnMgYWdvPC9hPikuPC9kaXY+PC9k
aXY+PC9kaXY+Cg==

--===============2694244360620556507==--

