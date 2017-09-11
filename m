Content-Type: multipart/mixed; boundary="===============4763239845349451819=="
MIME-Version: 1.0
From: Haydon Cardew <hvcardew at googlemail.com>
Subject: Re: [tpm2] Issue Solved/Trusted Boot
Date: Mon, 11 Sep 2017 17:08:20 +0100
Message-ID: <CAHM15e3QUxBzr8Gu5VNv7jnHD862uEAFARakHBT7nz0s-Vz7YQ@mail.gmail.com>
In-Reply-To: 15a53a7a-5d7e-1562-720d-580dade8cf9f@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4763239845349451819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Not having too much success with the suggested solutions, is it possible to
use Intel TXT to perform a measured boot?

On 6 September 2017 at 20:28, Javier Martinez Canillas <javierm(a)redhat.co=
m>
wrote:

> On 09/06/2017 06:16 PM, Philip Tricca wrote:
> > On Mon, 2017-09-04 at 12:04 +0200, Javier Martinez Canillas wrote:
> >> Following a discussion on 01org/tpm2-tools #444 [https://github.com
> >>> /01org/
> >>> tpm2-tools/issues/444] I wanted to post an update on what the issue
> >>> was.
> >>>
> >>
> >> I'm glad that your issue got solved.
> >>  >
> >>> If I could ask one further thing (I believe this is the correct
> >>> place to
> >>> post this?), I=E2=80=99m looking at setting up a trusted boot system =
on my
> >>> current
> >>> setup (Ubuntu 16.04, kernel 4.4) to be used with the now working
> >>> tpm2. I
> >>> have previously done this with tpm1.2 but the process seems rather
> >>> different this time, if anyone can point me to any good
> >>> resources/tutorials
> >>> that would be a massive help.
> >>>
> >>
> >> There isn't a single way to do this, so it depends on what kind of
> >> system you
> >> want to use and what is your threat model.
> >>
> >> For example, do you want to boot your system in EFI or BIOS mode? do
> >> you want
> >> to use Secure Boot or no?
> >
> > Minor clarification: TPM2 has no support for legacy BIOS boot. UEFI
> > only.
> >
>
> Right, and the TCG spec only describes an EFI interface for it in the "TCG
> EFI
> Protocol Specification". I always get confused by this because when
> booting a
> machine in BIOS (CSM) mode, I see a TPM2 chardev and the tpm2-tools work
> well.
>
> >> For me the best way to do this is to use UEFI + Secure Boot and to
> >> seal your
> >> secrets against PCR7 as described in this blog post [0] from Matthew
> >> Garret.
> >>
> >> But for that you need latest shim that measures certificates into
> >> PCR7 [1] and
> >> TPM2 measurement support in grub2 [2] that haven't landed yet.
> >>
> >> If you want to boot your system in BIOS mode, then you have other
> >> options like
> >> the TrustedGrub2 project [3].
> >
> > There is a set of patches to Grub2 that integrates TPM2 measurements
> > for loadable modules, kernel, initramfs & command line that was sent to
> > the grub2 devel list a while back. I've not seen the RSC TrustedGrub2
>
> Yes, that was my reference [2]. I tested the patches and works correctly
> for me.
>
> > work before (thanks for the link by the way) but IMHO forking Grub2 for
> > TPM2 work in the same way the original TrustedGrub did isn't the right
>
> Absolutely agree, I was just trying to list the available projects out
> there
> that have TPM support. Although I double checked and they still don't have
> TPM2 support. For some reasons I thought it did, sorry for the confusion.
>
> > way to do this. Better to get more people talking about this on the
> > grub devel mailing list to try to get the patches upstreamed.
> >
>
> Yeah, the problem is that the grub2 TPM2 measurements patches depends on
> other
> in-flight patch-set (the verifier framework) and AFAIU there are still so=
me
> discussion needed about those patches:
>
> http://lists.gnu.org/archive/html/grub-devel/2017-07/msg00040.html
>
> > Regards,
> > Philip
> >
> >> [0]: https://mjg59.dreamwidth.org/48897.html
> >> [1]: https://github.com/rhboot/shim/commit/8af7c4cacaf753f38f2564b26b
> >> 962a7a2942d664
> >> [2]: http://lists.gnu.org/archive/html/grub-devel/2017-07/msg00003.ht
> >> ml
> >> [3]: https://github.com/Rohde-Schwarz-Cybersecurity/TrustedGRUB2
>
> Best regards,
> --
> Javier Martinez Canillas
> Software Engineer - Desktop Hardware Enablement
> Red Hat
>

--===============4763239845349451819==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+Tm90IGhhdmluZyB0b28gbXVjaCBzdWNjZXNzIHdpdGggdGhlIHN1Z2dl
c3RlZCBzb2x1dGlvbnMsIGlzIGl0IHBvc3NpYmxlIHRvIHVzZSBJbnRlbCBUWFQgdG8gcGVyZm9y
bSBhIG1lYXN1cmVkIGJvb3Q/PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48ZGl2
IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24gNiBTZXB0ZW1iZXIgMjAxNyBhdCAyMDoyOCwgSmF2aWVy
IE1hcnRpbmV6IENhbmlsbGFzIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOmph
dmllcm1AcmVkaGF0LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphdmllcm1AcmVkaGF0LmNvbTwvYT4m
Z3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1s
ZWZ0OjFleCI+PGRpdiBjbGFzcz0iSE9FblpiIj48ZGl2IGNsYXNzPSJoNSI+T24gMDkvMDYvMjAx
NyAwNjoxNiBQTSwgUGhpbGlwIFRyaWNjYSB3cm90ZTo8YnI+CiZndDsgT24gTW9uLCAyMDE3LTA5
LTA0IGF0IDEyOjA0ICswMjAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgd3JvdGU6PGJyPgom
Z3Q7Jmd0OyBGb2xsb3dpbmcgYSBkaXNjdXNzaW9uIG9uIDAxb3JnL3RwbTItdG9vbHMgIzQ0NCBb
PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwczovL2dpdGh1Yi5jb208L2E+PGJyPgomZ3Q7Jmd0OyZndDsgLzAxb3JnLzxicj4K
Jmd0OyZndDsmZ3Q7IHRwbTItdG9vbHMvaXNzdWVzLzQ0NF0gSSB3YW50ZWQgdG8gcG9zdCBhbiB1
cGRhdGUgb24gd2hhdCB0aGUgaXNzdWU8YnI+CiZndDsmZ3Q7Jmd0OyB3YXMuPGJyPgomZ3Q7Jmd0
OyZndDs8YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyBJJiMzOTttIGdsYWQgdGhhdCB5b3VyIGlz
c3VlIGdvdCBzb2x2ZWQuPGJyPgomZ3Q7Jmd0O8KgICZndDs8YnI+CiZndDsmZ3Q7Jmd0OyBJZiBJ
IGNvdWxkIGFzayBvbmUgZnVydGhlciB0aGluZyAoSSBiZWxpZXZlIHRoaXMgaXMgdGhlIGNvcnJl
Y3Q8YnI+CiZndDsmZ3Q7Jmd0OyBwbGFjZSB0bzxicj4KJmd0OyZndDsmZ3Q7IHBvc3QgdGhpcz8p
LCBJ4oCZbSBsb29raW5nIGF0IHNldHRpbmcgdXAgYSB0cnVzdGVkIGJvb3Qgc3lzdGVtIG9uIG15
PGJyPgomZ3Q7Jmd0OyZndDsgY3VycmVudDxicj4KJmd0OyZndDsmZ3Q7IHNldHVwIChVYnVudHUg
MTYuMDQsIGtlcm5lbCA0LjQpIHRvIGJlIHVzZWQgd2l0aCB0aGUgbm93IHdvcmtpbmc8YnI+CiZn
dDsmZ3Q7Jmd0OyB0cG0yLiBJPGJyPgomZ3Q7Jmd0OyZndDsgaGF2ZSBwcmV2aW91c2x5IGRvbmUg
dGhpcyB3aXRoIHRwbTEuMiBidXQgdGhlIHByb2Nlc3Mgc2VlbXMgcmF0aGVyPGJyPgomZ3Q7Jmd0
OyZndDsgZGlmZmVyZW50IHRoaXMgdGltZSwgaWYgYW55b25lIGNhbiBwb2ludCBtZSB0byBhbnkg
Z29vZDxicj4KJmd0OyZndDsmZ3Q7IHJlc291cmNlcy90dXRvcmlhbHM8YnI+CiZndDsmZ3Q7Jmd0
OyB0aGF0IHdvdWxkIGJlIGEgbWFzc2l2ZSBoZWxwLjxicj4KJmd0OyZndDsmZ3Q7PGJyPgomZ3Q7
Jmd0Ozxicj4KJmd0OyZndDsgVGhlcmUgaXNuJiMzOTt0IGEgc2luZ2xlIHdheSB0byBkbyB0aGlz
LCBzbyBpdCBkZXBlbmRzIG9uIHdoYXQga2luZCBvZjxicj4KJmd0OyZndDsgc3lzdGVtIHlvdTxi
cj4KJmd0OyZndDsgd2FudCB0byB1c2UgYW5kIHdoYXQgaXMgeW91ciB0aHJlYXQgbW9kZWwuPGJy
PgomZ3Q7Jmd0Ozxicj4KJmd0OyZndDsgRm9yIGV4YW1wbGUsIGRvIHlvdSB3YW50IHRvIGJvb3Qg
eW91ciBzeXN0ZW0gaW4gRUZJIG9yIEJJT1MgbW9kZT8gZG88YnI+CiZndDsmZ3Q7IHlvdSB3YW50
PGJyPgomZ3Q7Jmd0OyB0byB1c2UgU2VjdXJlIEJvb3Qgb3Igbm8/PGJyPgomZ3Q7PGJyPgomZ3Q7
IE1pbm9yIGNsYXJpZmljYXRpb246IFRQTTIgaGFzIG5vIHN1cHBvcnQgZm9yIGxlZ2FjeSBCSU9T
IGJvb3QuIFVFRkk8YnI+CiZndDsgb25seS48YnI+CiZndDs8YnI+Cjxicj4KPC9kaXY+PC9kaXY+
UmlnaHQsIGFuZCB0aGUgVENHIHNwZWMgb25seSBkZXNjcmliZXMgYW4gRUZJIGludGVyZmFjZSBm
b3IgaXQgaW4gdGhlICZxdW90O1RDRyBFRkk8YnI+ClByb3RvY29sIFNwZWNpZmljYXRpb24mcXVv
dDsuIEkgYWx3YXlzIGdldCBjb25mdXNlZCBieSB0aGlzIGJlY2F1c2Ugd2hlbiBib290aW5nIGE8
YnI+Cm1hY2hpbmUgaW4gQklPUyAoQ1NNKSBtb2RlLCBJIHNlZSBhIFRQTTIgY2hhcmRldiBhbmQg
dGhlIHRwbTItdG9vbHMgd29yayB3ZWxsLjxicj4KPHNwYW4gY2xhc3M9IiI+PGJyPgomZ3Q7Jmd0
OyBGb3IgbWUgdGhlIGJlc3Qgd2F5IHRvIGRvIHRoaXMgaXMgdG8gdXNlIFVFRkkgKyBTZWN1cmUg
Qm9vdCBhbmQgdG88YnI+CiZndDsmZ3Q7IHNlYWwgeW91cjxicj4KJmd0OyZndDsgc2VjcmV0cyBh
Z2FpbnN0IFBDUjcgYXMgZGVzY3JpYmVkIGluIHRoaXMgYmxvZyBwb3N0IFswXSBmcm9tIE1hdHRo
ZXc8YnI+CiZndDsmZ3Q7IEdhcnJldC48YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyBCdXQgZm9y
IHRoYXQgeW91IG5lZWQgbGF0ZXN0IHNoaW0gdGhhdCBtZWFzdXJlcyBjZXJ0aWZpY2F0ZXMgaW50
bzxicj4KJmd0OyZndDsgUENSNyBbMV0gYW5kPGJyPgomZ3Q7Jmd0OyBUUE0yIG1lYXN1cmVtZW50
IHN1cHBvcnQgaW4gZ3J1YjIgWzJdIHRoYXQgaGF2ZW4mIzM5O3QgbGFuZGVkIHlldC48YnI+CiZn
dDsmZ3Q7PGJyPgomZ3Q7Jmd0OyBJZiB5b3Ugd2FudCB0byBib290IHlvdXIgc3lzdGVtIGluIEJJ
T1MgbW9kZSwgdGhlbiB5b3UgaGF2ZSBvdGhlcjxicj4KJmd0OyZndDsgb3B0aW9ucyBsaWtlPGJy
PgomZ3Q7Jmd0OyB0aGUgVHJ1c3RlZEdydWIyIHByb2plY3QgWzNdLjxicj4KJmd0Ozxicj4KJmd0
OyBUaGVyZSBpcyBhIHNldCBvZiBwYXRjaGVzIHRvIEdydWIyIHRoYXQgaW50ZWdyYXRlcyBUUE0y
IG1lYXN1cmVtZW50czxicj4KJmd0OyBmb3IgbG9hZGFibGUgbW9kdWxlcywga2VybmVsLCBpbml0
cmFtZnMgJmFtcDsgY29tbWFuZCBsaW5lIHRoYXQgd2FzIHNlbnQgdG88YnI+CiZndDsgdGhlIGdy
dWIyIGRldmVsIGxpc3QgYSB3aGlsZSBiYWNrLiBJJiMzOTt2ZSBub3Qgc2VlbiB0aGUgUlNDIFRy
dXN0ZWRHcnViMjxicj4KPGJyPgo8L3NwYW4+WWVzLCB0aGF0IHdhcyBteSByZWZlcmVuY2UgWzJd
LiBJIHRlc3RlZCB0aGUgcGF0Y2hlcyBhbmQgd29ya3MgY29ycmVjdGx5IGZvciBtZS48YnI+Cjxz
cGFuIGNsYXNzPSIiPjxicj4KJmd0OyB3b3JrIGJlZm9yZSAodGhhbmtzIGZvciB0aGUgbGluayBi
eSB0aGUgd2F5KSBidXQgSU1ITyBmb3JraW5nIEdydWIyIGZvcjxicj4KJmd0OyBUUE0yIHdvcmsg
aW4gdGhlIHNhbWUgd2F5IHRoZSBvcmlnaW5hbCBUcnVzdGVkR3J1YiBkaWQgaXNuJiMzOTt0IHRo
ZSByaWdodDxicj4KPGJyPgo8L3NwYW4+QWJzb2x1dGVseSBhZ3JlZSwgSSB3YXMganVzdCB0cnlp
bmcgdG8gbGlzdCB0aGUgYXZhaWxhYmxlIHByb2plY3RzIG91dCB0aGVyZTxicj4KdGhhdCBoYXZl
IFRQTSBzdXBwb3J0LiBBbHRob3VnaCBJIGRvdWJsZSBjaGVja2VkIGFuZCB0aGV5IHN0aWxsIGRv
biYjMzk7dCBoYXZlPGJyPgpUUE0yIHN1cHBvcnQuIEZvciBzb21lIHJlYXNvbnMgSSB0aG91Z2h0
IGl0IGRpZCwgc29ycnkgZm9yIHRoZSBjb25mdXNpb24uPGJyPgo8c3BhbiBjbGFzcz0iIj48YnI+
CiZndDsgd2F5IHRvIGRvIHRoaXMuIEJldHRlciB0byBnZXQgbW9yZSBwZW9wbGUgdGFsa2luZyBh
Ym91dCB0aGlzIG9uIHRoZTxicj4KJmd0OyBncnViIGRldmVsIG1haWxpbmcgbGlzdCB0byB0cnkg
dG8gZ2V0IHRoZSBwYXRjaGVzIHVwc3RyZWFtZWQuPGJyPgomZ3Q7PGJyPgo8YnI+Cjwvc3Bhbj5Z
ZWFoLCB0aGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBncnViMiBUUE0yIG1lYXN1cmVtZW50cyBwYXRj
aGVzIGRlcGVuZHMgb24gb3RoZXI8YnI+CmluLWZsaWdodCBwYXRjaC1zZXQgKHRoZSB2ZXJpZmll
ciBmcmFtZXdvcmspIGFuZCBBRkFJVSB0aGVyZSBhcmUgc3RpbGwgc29tZTxicj4KZGlzY3Vzc2lv
biBuZWVkZWQgYWJvdXQgdGhvc2UgcGF0Y2hlczo8YnI+Cjxicj4KPGEgaHJlZj0iaHR0cDovL2xp
c3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL2dydWItZGV2ZWwvMjAxNy0wNy9tc2cwMDA0MC5odG1s
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlzdHMuZ251Lm9yZy9h
cmNoaXZlLzx3YnI+aHRtbC9ncnViLWRldmVsLzIwMTctMDcvPHdicj5tc2cwMDA0MC5odG1sPC9h
Pjxicj4KPHNwYW4gY2xhc3M9ImltIEhPRW5aYiI+PGJyPgomZ3Q7IFJlZ2FyZHMsPGJyPgomZ3Q7
IFBoaWxpcDxicj4KJmd0Ozxicj4KJmd0OyZndDsgWzBdOiA8YSBocmVmPSJodHRwczovL21qZzU5
LmRyZWFtd2lkdGgub3JnLzQ4ODk3Lmh0bWwiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vbWpnNTkuZHJlYW13aWR0aC5vcmcvPHdicj40ODg5Ny5odG1sPC9hPjxicj4K
Jmd0OyZndDsgWzFdOiA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vcmhib290L3NoaW0vY29t
bWl0LzhhZjdjNGNhY2FmNzUzZjM4ZjI1NjRiMjZiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vcmhib290Lzx3YnI+c2hpbS9jb21taXQvPHdicj44
YWY3YzRjYWNhZjc1M2YzOGYyNTY0YjI2YjwvYT48YnI+CiZndDsmZ3Q7IDk2MmE3YTI5NDJkNjY0
PGJyPgomZ3Q7Jmd0OyBbMl06IDxhIGhyZWY9Imh0dHA6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUv
aHRtbC9ncnViLWRldmVsLzIwMTctMDcvbXNnMDAwMDMuaHQiIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvPHdicj5odG1sL2dydWIt
ZGV2ZWwvMjAxNy0wNy88d2JyPm1zZzAwMDAzLmh0PC9hPjxicj4KJmd0OyZndDsgbWw8YnI+CiZn
dDsmZ3Q7IFszXTogPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL1JvaGRlLVNjaHdhcnotQ3li
ZXJzZWN1cml0eS9UcnVzdGVkR1JVQjIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHBzOi8vZ2l0aHViLmNvbS9Sb2hkZS08d2JyPlNjaHdhcnotQ3liZXJzZWN1cml0eS88d2Jy
PlRydXN0ZWRHUlVCMjwvYT48YnI+Cjxicj4KPC9zcGFuPjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRp
diBjbGFzcz0iaDUiPkJlc3QgcmVnYXJkcyw8YnI+Ci0tPGJyPgpKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM8YnI+ClNvZnR3YXJlIEVuZ2luZWVyIC0gRGVza3RvcCBIYXJkd2FyZSBFbmFibGVtZW50
PGJyPgpSZWQgSGF0PGJyPgo8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2
Pgo=

--===============4763239845349451819==--

