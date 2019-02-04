Content-Type: multipart/mixed; boundary="===============0734093491775732696=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: Re: [tpm2] tpm2-abrmd in a container
Date: Mon, 04 Feb 2019 18:55:11 +0000
Message-ID: <CAKrSGQQB1+L9EUSYkV2oHa8q_U8AjsmWF4=2=-1nd0wL-K8MxQ@mail.gmail.com>
In-Reply-To: 20190204180809.GA17746@johnsa1-desk.jf.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0734093491775732696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 4, 2019 at 6:05 PM Andersen, John <john.s.andersen(a)intel.com>
wrote:

> On Mon, Feb 04, 2019 at 04:57:12PM +0000, Luke Hinds wrote:
> >    On Mon, Feb 4, 2019 at 4:12 PM Roberts, William C
> >    <[1]william.c.roberts(a)intel.com> wrote:
> >
> >      I run it in our CI system which is using a docker container, not
> >      sure if that helps
> >      But you can look at our scripts for it.
> >
> >    Do you mean the following travis-ci file:
> >    [2]
> https://github.com/tpm2-software/tpm2-abrmd/blob/master/.travis.yml#
> >    L2
> >    I noticed this, but I think its a VM (unless I am mistaken):
> >    [3]
> https://docs.travis-ci.com/user/reference/overview/#virtualization-e
> >    nvironments
> >    Any pointers to files that reference your container use, would be
> >    helpful.
> >    Cheers,
> >    Luke
> >
> >      > -----Original Message-----
> >      > From: tpm2 [mailto:[4]tpm2-bounces(a)lists.01.org] On Behalf Of
> Luke
> >      Hinds
> >      > Sent: Monday, February 4, 2019 7:47 AM
> >      > To: [5]tpm2(a)lists.01.org
> >      > Subject: [tpm2] tpm2-abrmd in a container
> >      >
> >      > Hello,
> >      >
> >      > I have been working on trying to get tpm2-abrmd running in a
> >      container, but its
> >      > proving problematic as there is a requirement on system-d and
> >      dbus. This in turn
> >      > requires running the container as privileged and mounting the
> >      hosts cgroup (and
> >      > adding cap sys-admin).
> >      >
> >      > My reason for using a container, is for CI / functional testing =
of
> >      a project that will
> >      > use abrmd and having a lightweight means to test against the
> >      resource manager
> >      > running in a container.
> >      >
> >      > I am still early in looking at ways to achieve this, so I wanted
> >      to ask if any others
> >      > have snippets of previous attempts (successful or not) they could
> >      share?
> >      >
> >      > Thanks,
> >      >
> >      > Luke
> >
> >    --
> >    Luke Hinds | NFV Partner Engineering | CTO Office | Red Hat
> >    e: [6]lhinds(a)redhat.com | irc: lhinds @freenode | t: +44 12 52 36
> 2483
> >
> > References
> >
> >    1. mailto:william.c.roberts(a)intel.com
> >    2.
> https://github.com/tpm2-software/tpm2-abrmd/blob/master/.travis.yml#L2
> >    3.
> https://docs.travis-ci.com/user/reference/overview/#virtualization-enviro=
nments
> >    4. mailto:tpm2-bounces(a)lists.01.org
> >    5. mailto:tpm2(a)lists.01.org
> >    6. mailto:lhinds(a)redhat.com
>
> Some dbus stuff happened in the tools repo recently. Not sure if this
> would be
> of help.
>
> https://github.com/tpm2-software/tpm2-tools/commit/9a6430ef293bc1a5062244=
31af9370c7748f39b4
>
>
That look's like just what I need, thanks!


> > _______________________________________________
> > tpm2 mailing list
> > tpm2(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/tpm2
>
>

-- =

Luke Hinds | NFV Partner Engineering | CTO Office | Red Hat
e: lhinds(a)redhat.com | irc: lhinds @freenode | t: +44 12 52 36 2483

--===============0734093491775732696==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1vbiwgRmVi
IDQsIDIwMTkgYXQgNjowNSBQTSBBbmRlcnNlbiwgSm9obiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmpv
aG4ucy5hbmRlcnNlbkBpbnRlbC5jb20iPmpvaG4ucy5hbmRlcnNlbkBpbnRlbC5jb208L2E+Jmd0
OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0i
bWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIw
NCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPk9uIE1vbiwgRmViIDA0LCAyMDE5IGF0IDA0OjU3OjEy
UE0gKzAwMDAsIEx1a2UgSGluZHMgd3JvdGU6PGJyPgomZ3Q7wqAgwqAgT24gTW9uLCBGZWIgNCwg
MjAxOSBhdCA0OjEyIFBNIFJvYmVydHMsIFdpbGxpYW0gQzxicj4KJmd0O8KgIMKgICZsdDtbMV08
YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPgomZ3Q7IDxi
cj4KJmd0O8KgIMKgIMKgIEkgcnVuIGl0IGluIG91ciBDSSBzeXN0ZW0gd2hpY2ggaXMgdXNpbmcg
YSBkb2NrZXIgY29udGFpbmVyLCBub3Q8YnI+CiZndDvCoCDCoCDCoCBzdXJlIGlmIHRoYXQgaGVs
cHM8YnI+CiZndDvCoCDCoCDCoCBCdXQgeW91IGNhbiBsb29rIGF0IG91ciBzY3JpcHRzIGZvciBp
dC48YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgRG8geW91IG1lYW4gdGhlIGZvbGxvd2luZyB0cmF2
aXMtY2kgZmlsZTo8YnI+CiZndDvCoCDCoCBbMl08YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
dHBtMi1zb2Z0d2FyZS90cG0yLWFicm1kL2Jsb2IvbWFzdGVyLy50cmF2aXMueW1sIyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdh
cmUvdHBtMi1hYnJtZC9ibG9iL21hc3Rlci8udHJhdmlzLnltbCM8L2E+PGJyPgomZ3Q7wqAgwqAg
TDI8YnI+CiZndDvCoCDCoCBJIG5vdGljZWQgdGhpcywgYnV0IEkgdGhpbmsgaXRzIGEgVk0gKHVu
bGVzcyBJIGFtIG1pc3Rha2VuKTo8YnI+CiZndDvCoCDCoCBbM108YSBocmVmPSJodHRwczovL2Rv
Y3MudHJhdmlzLWNpLmNvbS91c2VyL3JlZmVyZW5jZS9vdmVydmlldy8jdmlydHVhbGl6YXRpb24t
ZSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9kb2NzLnRyYXZpcy1j
aS5jb20vdXNlci9yZWZlcmVuY2Uvb3ZlcnZpZXcvI3ZpcnR1YWxpemF0aW9uLWU8L2E+PGJyPgom
Z3Q7wqAgwqAgbnZpcm9ubWVudHM8YnI+CiZndDvCoCDCoCBBbnkgcG9pbnRlcnMgdG8gZmlsZXMg
dGhhdCByZWZlcmVuY2UgeW91ciBjb250YWluZXIgdXNlLCB3b3VsZCBiZTxicj4KJmd0O8KgIMKg
IGhlbHBmdWwuPGJyPgomZ3Q7wqAgwqAgQ2hlZXJzLDxicj4KJmd0O8KgIMKgIEx1a2U8YnI+CiZn
dDsgPGJyPgomZ3Q7wqAgwqAgwqAgJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4K
Jmd0O8KgIMKgIMKgICZndDsgRnJvbTogdHBtMiBbbWFpbHRvOls0XTxhIGhyZWY9Im1haWx0bzp0
cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1ib3VuY2VzQGxp
c3RzLjAxLm9yZzwvYT5dIE9uIEJlaGFsZiBPZiBMdWtlPGJyPgomZ3Q7wqAgwqAgwqAgSGluZHM8
YnI+CiZndDvCoCDCoCDCoCAmZ3Q7IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgNCwgMjAxOSA3OjQ3
IEFNPGJyPgomZ3Q7wqAgwqAgwqAgJmd0OyBUbzogWzVdPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7
wqAgwqAgwqAgJmd0OyBTdWJqZWN0OiBbdHBtMl0gdHBtMi1hYnJtZCBpbiBhIGNvbnRhaW5lcjxi
cj4KJmd0O8KgIMKgIMKgICZndDs8YnI+CiZndDvCoCDCoCDCoCAmZ3Q7IEhlbGxvLDxicj4KJmd0
O8KgIMKgIMKgICZndDs8YnI+CiZndDvCoCDCoCDCoCAmZ3Q7IEkgaGF2ZSBiZWVuIHdvcmtpbmcg
b24gdHJ5aW5nIHRvIGdldCB0cG0yLWFicm1kIHJ1bm5pbmcgaW4gYTxicj4KJmd0O8KgIMKgIMKg
IGNvbnRhaW5lciwgYnV0IGl0czxicj4KJmd0O8KgIMKgIMKgICZndDsgcHJvdmluZyBwcm9ibGVt
YXRpYyBhcyB0aGVyZSBpcyBhIHJlcXVpcmVtZW50IG9uIHN5c3RlbS1kIGFuZDxicj4KJmd0O8Kg
IMKgIMKgIGRidXMuIFRoaXMgaW4gdHVybjxicj4KJmd0O8KgIMKgIMKgICZndDsgcmVxdWlyZXMg
cnVubmluZyB0aGUgY29udGFpbmVyIGFzIHByaXZpbGVnZWQgYW5kIG1vdW50aW5nIHRoZTxicj4K
Jmd0O8KgIMKgIMKgIGhvc3RzIGNncm91cCAoYW5kPGJyPgomZ3Q7wqAgwqAgwqAgJmd0OyBhZGRp
bmcgY2FwIHN5cy1hZG1pbikuPGJyPgomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4KJmd0O8KgIMKgIMKg
ICZndDsgTXkgcmVhc29uIGZvciB1c2luZyBhIGNvbnRhaW5lciwgaXMgZm9yIENJIC8gZnVuY3Rp
b25hbCB0ZXN0aW5nIG9mPGJyPgomZ3Q7wqAgwqAgwqAgYSBwcm9qZWN0IHRoYXQgd2lsbDxicj4K
Jmd0O8KgIMKgIMKgICZndDsgdXNlIGFicm1kIGFuZCBoYXZpbmcgYSBsaWdodHdlaWdodCBtZWFu
cyB0byB0ZXN0IGFnYWluc3QgdGhlPGJyPgomZ3Q7wqAgwqAgwqAgcmVzb3VyY2UgbWFuYWdlcjxi
cj4KJmd0O8KgIMKgIMKgICZndDsgcnVubmluZyBpbiBhIGNvbnRhaW5lci48YnI+CiZndDvCoCDC
oCDCoCAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgJmd0OyBJIGFtIHN0aWxsIGVhcmx5IGluIGxvb2tp
bmcgYXQgd2F5cyB0byBhY2hpZXZlIHRoaXMsIHNvIEkgd2FudGVkPGJyPgomZ3Q7wqAgwqAgwqAg
dG8gYXNrIGlmIGFueSBvdGhlcnM8YnI+CiZndDvCoCDCoCDCoCAmZ3Q7IGhhdmUgc25pcHBldHMg
b2YgcHJldmlvdXMgYXR0ZW1wdHMgKHN1Y2Nlc3NmdWwgb3Igbm90KSB0aGV5IGNvdWxkPGJyPgom
Z3Q7wqAgwqAgwqAgc2hhcmU/PGJyPgomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4KJmd0O8KgIMKgIMKg
ICZndDsgVGhhbmtzLDxicj4KJmd0O8KgIMKgIMKgICZndDs8YnI+CiZndDvCoCDCoCDCoCAmZ3Q7
IEx1a2U8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgLS08YnI+CiZndDvCoCDCoCBMdWtlIEhpbmRz
IHwgTkZWIFBhcnRuZXIgRW5naW5lZXJpbmcgfCBDVE8gT2ZmaWNlIHwgUmVkIEhhdDxicj4KJmd0
O8KgIMKgIGU6IFs2XTxhIGhyZWY9Im1haWx0bzpsaGluZHNAcmVkaGF0LmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPmxoaW5kc0ByZWRoYXQuY29tPC9hPiB8IGlyYzogbGhpbmRzIEBmcmVlbm9kZSB8IHQ6
ICs0NCAxMiA1MiAzNiAyNDgzPGJyPgomZ3Q7IDxicj4KJmd0OyBSZWZlcmVuY2VzPGJyPgomZ3Q7
IDxicj4KJmd0O8KgIMKgIDEuIG1haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVy
dHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
PC9hPjxicj4KJmd0O8KgIMKgIDIuIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNv
ZnR3YXJlL3RwbTItYWJybWQvYmxvYi9tYXN0ZXIvLnRyYXZpcy55bWwjTDIiIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3Rw
bTItYWJybWQvYmxvYi9tYXN0ZXIvLnRyYXZpcy55bWwjTDI8L2E+PGJyPgomZ3Q7wqAgwqAgMy4g
PGEgaHJlZj0iaHR0cHM6Ly9kb2NzLnRyYXZpcy1jaS5jb20vdXNlci9yZWZlcmVuY2Uvb3ZlcnZp
ZXcvI3ZpcnR1YWxpemF0aW9uLWVudmlyb25tZW50cyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cHM6Ly9kb2NzLnRyYXZpcy1jaS5jb20vdXNlci9yZWZlcmVuY2Uvb3ZlcnZp
ZXcvI3ZpcnR1YWxpemF0aW9uLWVudmlyb25tZW50czwvYT48YnI+CiZndDvCoCDCoCA0LiBtYWls
dG86PGEgaHJlZj0ibWFpbHRvOnRwbTItYm91bmNlc0BsaXN0cy4wMS5vcmciIHRhcmdldD0iX2Js
YW5rIj50cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0O8KgIMKgIDUuIG1haWx0
bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0y
QGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDvCoCDCoCA2LiBtYWlsdG86PGEgaHJlZj0ibWFpbHRv
OmxoaW5kc0ByZWRoYXQuY29tIiB0YXJnZXQ9Il9ibGFuayI+bGhpbmRzQHJlZGhhdC5jb208L2E+
PGJyPgo8YnI+ClNvbWUgZGJ1cyBzdHVmZiBoYXBwZW5lZCBpbiB0aGUgdG9vbHMgcmVwbyByZWNl
bnRseS4gTm90IHN1cmUgaWYgdGhpcyB3b3VsZCBiZTxicj4Kb2YgaGVscC48YnI+CjxhIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvY29tbWl0LzlhNjQz
MGVmMjkzYmMxYTUwNjIyNDQzMWFmOTM3MGM3NzQ4ZjM5YjQiIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMv
Y29tbWl0LzlhNjQzMGVmMjkzYmMxYTUwNjIyNDQzMWFmOTM3MGM3NzQ4ZjM5YjQ8L2E+PGJyPgo8
YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhdCBsb29rJiMzOTtzIGxpa2Ug
anVzdCB3aGF0IEkgbmVlZCwgdGhhbmtzITwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBj
bGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+CiZndDsg
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZndDsg
dHBtMiBtYWlsaW5nIGxpc3Q8YnI+CiZndDsgPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IDxhIGhy
ZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMiIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0
aW5mby90cG0yPC9hPjxicj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyIGNsZWFyPSJhbGwi
PjxkaXY+PGJyPjwvZGl2Pi0tIDxicj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfc2lnbmF0
dXJlIj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0
ciI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPkx1a2UgSGluZHMgfCBORlYgUGFydG5l
ciBFbmdpbmVlcmluZyB8IENUTyBPZmZpY2UgfCBSZWQgSGF0PC9zcGFuPjxiciBzdHlsZT0iZm9u
dC1zaXplOjEyLjhweCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPmU6wqA8L3NwYW4+
PGEgaHJlZj0ibWFpbHRvOmxoaW5kc0ByZWRoYXQuY29tIiBzdHlsZT0iY29sb3I6cmdiKDE3LDg1
LDIwNCk7Zm9udC1zaXplOjEyLjhweCIgdGFyZ2V0PSJfYmxhbmsiPmxoaW5kc0ByZWRoYXQuY29t
PC9hPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij7CoHwgaXJjOiBsaGluZHMgQGZyZWVu
b2RlIHw8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPiB0OsKgPC9zcGFuPis0
NCAxMiA1MiAzNiAyNDgzPGJyIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij48L2Rpdj48L2Rpdj48
L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============0734093491775732696==--

