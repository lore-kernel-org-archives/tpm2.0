Content-Type: multipart/mixed; boundary="===============6269209699220280284=="
MIME-Version: 1.0
From: Ian Oliver <ian.justin.oliver at gmail.com>
Subject: [tpm2] Re: unique identifier
Date: Tue, 29 Oct 2019 21:49:43 +0200
Message-ID: <CAAxBZJu5R5e+oR6iNqFKuSAqwULV26cMfqv9FHkUWjECxe-KpQ@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E2D330@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6269209699220280284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks - will take a look with the particular TPMs we're using

t.

Ian

On Tue, 29 Oct 2019 at 20:37, Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> Forgot "to be changed" in my sentence... one of those days.
>
> > -----Original Message-----
> > From: Roberts, William C [mailto:william.c.roberts(a)intel.com]
> > Sent: Tuesday, October 29, 2019 1:36 PM
> > To: Ian Oliver <ian.justin.oliver(a)gmail.com>
> > Cc: tpm2(a)lists.01.org
> > Subject: [tpm2] Re: unique identifier
> >
> The TPM allows the seed to be changed on the 3 non-volatile hierarchy
> seeds:
> >
> > TPM2_ChangeEPS - endorsement seed
> > TPM2_ChangePPS - platform seed
> > TPM2_Clear - Storage "Owner" seed
> >
> > Null changes on every tpm boot.
> >
> > > -----Original Message-----
> > > From: Ian Oliver [mailto:ian.justin.oliver(a)gmail.com]
> > > Sent: Tuesday, October 29, 2019 11:59 AM
> > > To: Roberts, William C <william.c.roberts(a)intel.com>
> > > Cc: Max Halld=C3=A9n <max.hallden(a)wisi.se>; tpm2(a)lists.01.org
> > > Subject: Re: [tpm2] Re: unique identifier
> > >
> > > IIRC the EK is generated from a seed unique to each TPM and typically
> > > implemented as a set of fuses blown at manufacturing time. So the EK
> > > can be generated in a predictable manner and therefore the EK_public
> > > can act as an identifier for that TPM.
> > >
> > >
> > > The privacy aspect applies to the AK as far as I recall reading, but
> > > the notion of privacy here is rather tenuous anyway.
> > >
> > > At least in our work, the EK and AK have proven robust enough to be
> > > used as permanent identifiers
> > >
> > >
> > > Ian
> > >
> > >
> > > On Tue, 29 Oct 2019 at 18:40, Roberts, William C
> > > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>=
 >
> wrote:
> > >
> > >
> > >     I think that's intentional by design due to privacy concerns.
> > >
> > >     > -----Original Message-----
> > >     > From: Max Halld=C3=A9n [mailto:max.hallden(a)wisi.se
> > > <mailto:max.hallden(a)wisi.se> ]
> > >     > Sent: Tuesday, October 29, 2019 9:58 AM
> > >     > To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > >     > Subject: [tpm2] unique identifier
> > >     >
> > >     > Hi all,
> > >     >
> > >     > I'm looking for some kind of unique identifier for the tpm that
> > > can't be cleared.
> > >     > AFAICT the TPM2 standard doesn't contain anything like this? The
> > > closest thing is
> > >     > the EK I guess, but even that can be cleared.
> > >     >
> > >     > Regards,
> > >     > Max
> > >     >
> > >     > _______________________________________________
> > >     > tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.0=
1.org
> >
> > >     > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > > <mailto:tpm2- leave(a)lists.01.org>
> > >     > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> > >     _______________________________________________
> > >     tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.=
org>
> > >     To unsubscribe send an email to tpm2-leave(a)lists.01.org <mailto:
> tpm2-
> > > leave(a)lists.01.org>
> > >     %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> > >
> >
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============6269209699220280284==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5UaGFua3MgLSB3aWxsIHRha2UgYSBsb29rIHdpdGggdGhlIHBh
cnRpY3VsYXIgVFBNcyB3ZSYjMzk7cmUgdXNpbmc8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PnQu
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JYW48YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xh
c3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVHVl
LCAyOSBPY3QgMjAxOSBhdCAyMDozNywgUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJt
YWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xp
ZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkZvcmdvdCAmcXVvdDt0byBiZSBj
aGFuZ2VkJnF1b3Q7IGluIG15IHNlbnRlbmNlLi4uIG9uZSBvZiB0aG9zZSBkYXlzLjxicj4KPGJy
PgomZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7IEZyb206IFJvYmVydHMs
IFdpbGxpYW0gQyBbbWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+XTxi
cj4KJmd0OyBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDI5LCAyMDE5IDE6MzYgUE08YnI+CiZndDsg
VG86IElhbiBPbGl2ZXIgJmx0OzxhIGhyZWY9Im1haWx0bzppYW4uanVzdGluLm9saXZlckBnbWFp
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5pYW4uanVzdGluLm9saXZlckBnbWFpbC5jb208L2E+Jmd0
Ozxicj4KJmd0OyBDYzogPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9
Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFN1YmplY3Q6IFt0cG0yXSBS
ZTogdW5pcXVlIGlkZW50aWZpZXI8YnI+CiZndDsgPGJyPgpUaGUgVFBNIGFsbG93cyB0aGUgc2Vl
ZCB0byBiZSBjaGFuZ2VkIG9uIHRoZSAzIG5vbi12b2xhdGlsZSBoaWVyYXJjaHkgc2VlZHM6PGJy
PgomZ3Q7IDxicj4KJmd0OyBUUE0yX0NoYW5nZUVQUyAtIGVuZG9yc2VtZW50IHNlZWQ8YnI+CiZn
dDsgVFBNMl9DaGFuZ2VQUFMgLSBwbGF0Zm9ybSBzZWVkPGJyPgomZ3Q7IFRQTTJfQ2xlYXIgLSBT
dG9yYWdlICZxdW90O093bmVyJnF1b3Q7IHNlZWQ8YnI+CiZndDsgPGJyPgomZ3Q7IE51bGwgY2hh
bmdlcyBvbiBldmVyeSB0cG0gYm9vdC48YnI+CiZndDsgPGJyPgomZ3Q7ICZndDsgLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS08YnI+CiZndDsgJmd0OyBGcm9tOiBJYW4gT2xpdmVyIFttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOmlhbi5qdXN0aW4ub2xpdmVyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmlhbi5qdXN0aW4ub2xpdmVyQGdtYWlsLmNvbTwvYT5dPGJyPgomZ3Q7ICZndDsgU2VudDog
VHVlc2RheSwgT2N0b2JlciAyOSwgMjAxOSAxMTo1OSBBTTxicj4KJmd0OyAmZ3Q7IFRvOiBSb2Jl
cnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0
Ozxicj4KJmd0OyAmZ3Q7IENjOiBNYXggSGFsbGTDqW4gJmx0OzxhIGhyZWY9Im1haWx0bzptYXgu
aGFsbGRlbkB3aXNpLnNlIiB0YXJnZXQ9Il9ibGFuayI+bWF4LmhhbGxkZW5Ad2lzaS5zZTwvYT4m
Z3Q7OyA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50
cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgJmd0OyBTdWJqZWN0OiBSZTogW3RwbTJdIFJl
OiB1bmlxdWUgaWRlbnRpZmllcjxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgSUlSQyB0aGUg
RUsgaXMgZ2VuZXJhdGVkIGZyb20gYSBzZWVkIHVuaXF1ZSB0byBlYWNoIFRQTSBhbmQgdHlwaWNh
bGx5PGJyPgomZ3Q7ICZndDsgaW1wbGVtZW50ZWQgYXMgYSBzZXQgb2YgZnVzZXMgYmxvd24gYXQg
bWFudWZhY3R1cmluZyB0aW1lLiBTbyB0aGUgRUs8YnI+CiZndDsgJmd0OyBjYW4gYmUgZ2VuZXJh
dGVkIGluIGEgcHJlZGljdGFibGUgbWFubmVyIGFuZCB0aGVyZWZvcmUgdGhlIEVLX3B1YmxpYzxi
cj4KJmd0OyAmZ3Q7IGNhbiBhY3QgYXMgYW4gaWRlbnRpZmllciBmb3IgdGhhdCBUUE0uPGJyPgom
Z3Q7ICZndDs8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IFRoZSBwcml2YWN5IGFzcGVjdCBh
cHBsaWVzIHRvIHRoZSBBSyBhcyBmYXIgYXMgSSByZWNhbGwgcmVhZGluZywgYnV0PGJyPgomZ3Q7
ICZndDsgdGhlIG5vdGlvbiBvZiBwcml2YWN5IGhlcmUgaXMgcmF0aGVyIHRlbnVvdXMgYW55d2F5
Ljxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgQXQgbGVhc3QgaW4gb3VyIHdvcmssIHRoZSBF
SyBhbmQgQUsgaGF2ZSBwcm92ZW4gcm9idXN0IGVub3VnaCB0byBiZTxicj4KJmd0OyAmZ3Q7IHVz
ZWQgYXMgcGVybWFuZW50IGlkZW50aWZpZXJzPGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0Ozxi
cj4KJmd0OyAmZ3Q7IElhbjxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0
OyBPbiBUdWUsIDI5IE9jdCAyMDE5IGF0IDE4OjQwLCBSb2JlcnRzLCBXaWxsaWFtIEM8YnI+CiZn
dDsgJmd0OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4gJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0OyB3cm90ZTo8YnI+
CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDvCoCDCoCDCoEkgdGhpbmsgdGhh
dCYjMzk7cyBpbnRlbnRpb25hbCBieSBkZXNpZ24gZHVlIHRvIHByaXZhY3kgY29uY2VybnMuPGJy
PgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0O8KgIMKgIMKgJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLTxicj4KJmd0OyAmZ3Q7wqAgwqAgwqAmZ3Q7IEZyb206IE1heCBIYWxsZMOpbiBbbWFp
bHRvOjxhIGhyZWY9Im1haWx0bzptYXguaGFsbGRlbkB3aXNpLnNlIiB0YXJnZXQ9Il9ibGFuayI+
bWF4LmhhbGxkZW5Ad2lzaS5zZTwvYT48YnI+CiZndDsgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzptYXguaGFsbGRlbkB3aXNpLnNlIiB0YXJnZXQ9Il9ibGFuayI+bWF4LmhhbGxkZW5A
d2lzaS5zZTwvYT4mZ3Q7IF08YnI+CiZndDsgJmd0O8KgIMKgIMKgJmd0OyBTZW50OiBUdWVzZGF5
LCBPY3RvYmVyIDI5LCAyMDE5IDk6NTggQU08YnI+CiZndDsgJmd0O8KgIMKgIMKgJmd0OyBUbzog
PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBs
aXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAm
Z3Q7wqAgwqAgwqAmZ3Q7IFN1YmplY3Q6IFt0cG0yXSB1bmlxdWUgaWRlbnRpZmllcjxicj4KJmd0
OyAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7ICZndDvCoCDCoCDCoCZndDsgSGkgYWxsLDxicj4K
Jmd0OyAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7ICZndDvCoCDCoCDCoCZndDsgSSYjMzk7bSBs
b29raW5nIGZvciBzb21lIGtpbmQgb2YgdW5pcXVlIGlkZW50aWZpZXIgZm9yIHRoZSB0cG0gdGhh
dDxicj4KJmd0OyAmZ3Q7IGNhbiYjMzk7dCBiZSBjbGVhcmVkLjxicj4KJmd0OyAmZ3Q7wqAgwqAg
wqAmZ3Q7IEFGQUlDVCB0aGUgVFBNMiBzdGFuZGFyZCBkb2VzbiYjMzk7dCBjb250YWluIGFueXRo
aW5nIGxpa2UgdGhpcz8gVGhlPGJyPgomZ3Q7ICZndDsgY2xvc2VzdCB0aGluZyBpczxicj4KJmd0
OyAmZ3Q7wqAgwqAgwqAmZ3Q7IHRoZSBFSyBJIGd1ZXNzLCBidXQgZXZlbiB0aGF0IGNhbiBiZSBj
bGVhcmVkLjxicj4KJmd0OyAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7ICZndDvCoCDCoCDCoCZn
dDsgUmVnYXJkcyw8YnI+CiZndDsgJmd0O8KgIMKgIMKgJmd0OyBNYXg8YnI+CiZndDsgJmd0O8Kg
IMKgIMKgJmd0Ozxicj4KJmd0OyAmZ3Q7wqAgwqAgwqAmZ3Q7IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgomZ3Q7ICZndDvCoCDCoCDCoCZndDsgdHBt
MiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJn
ZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8
L2E+Jmd0Ozxicj4KJmd0OyAmZ3Q7wqAgwqAgwqAmZ3Q7IFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4g
ZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9
Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7ICZndDsgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi0iIHRhcmdldD0iX2JsYW5rIj50cG0yLTwvYT4gPGEg
aHJlZj0ibWFpbHRvOmxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmxlYXZlQGxp
c3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7ICZndDvCoCDCoCDCoCZndDsgJSh3ZWJfcGFnZV91
cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+CiZndDsgJmd0O8Kg
IMKgIMKgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+
CiZndDsgJmd0O8KgIMKgIMKgdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRw
bTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmZ3Q7wqAgwqAgwqBUbyB1bnN1
YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLSIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItPC9hPjxi
cj4KJmd0OyAmZ3Q7IDxhIGhyZWY9Im1haWx0bzpsZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0i
X2JsYW5rIj5sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmZ3Q7wqAgwqAgwqAl
KHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4K
Jmd0OyAmZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXzxicj4KJmd0OyB0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVm
PSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAx
Lm9yZzwvYT48YnI+CiZndDsgVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVm
PSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxl
YXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShj
Z2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============6269209699220280284==--

