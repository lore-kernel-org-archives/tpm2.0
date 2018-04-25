Content-Type: multipart/mixed; boundary="===============0666384434791317128=="
MIME-Version: 1.0
From: Ian Oliver <ian.justin.oliver at gmail.com>
Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
Date: Wed, 25 Apr 2018 20:02:30 +0300
Message-ID: <CAAxBZJs+WEO7ssHQ8dgGye6boftZrqGAP+n1LDEEaZqY3tTdGg@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563FF3F11C@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0666384434791317128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Actually some TPMs aren't reporting this value as part of the properties
(tpm2_getcap -c properties-fixed IIRC) so it gets interpreted as 0.

Can you also confirm the maximum size of an NV_RAM area, or is it always
bounded by MAX_NV_BUFFER_SIZE  ?

t.

Ian

On 25 April 2018 at 19:29, Roberts, William C <william.c.roberts(a)intel.co=
m>
wrote:

> I have heard of this bug before but never encountered it. I looked at the
> PR:
> https://github.com/tpm2-software/tpm2-tools/pull/1002
>
> I heard as well that setting the buffer to something smaller than MAX size
> and that 512 bytes is recommended.
> Someone actually polled the vendors to find out what buffer size is always
> a safe bet, and 512 was it.
>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Ian Oliver
> > Sent: Tuesday, April 24, 2018 7:48 AM
> > To: Duncan.Palmer(a)data61.csiro.au
> > Cc: tpm2(a)lists.01.org
> > Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
> >
> > Thanks,
> >
> >
> > We are seeing the same issue on the TPMs in our Intel NUCs .. Infineon
> 9655s ?
> > Need to check tomorrow
> >
> >
> > t.
> >
> >
> > Ian
> >
> >
> > On 24 April 2018 at 15:51, <Duncan.Palmer(a)data61.csiro.au
> > <mailto:Duncan.Palmer(a)data61.csiro.au> > wrote:
> >
> >
> >       Done. I hadn't submitted a pull request before as I was unsure
> whether
> > this issue was related to the TPM I'm using (which doesn't seem commonly
> > used), or more generally applicable.
> >
> >       Duncan Palmer
> >       Senior Software Engineer | Autonomous Systems
> >       Data61 | CSIRO
> >       E duncan.palmer(a)csiro.au
> >       Queensland Centre for Advanced Technologies (QCAT),
> >       1 Technology Court, Pullenvale QLD, 4069
> >       www.data61.csiro.au <http://www.data61.csiro.au>
> >
> >       CSIRO=E2=80=99s Digital Productivity business unit and NICTA have=
 joined
> forces to
> > create digital powerhouse Data61
> >
> >       ________________________________________
> >       From: Tadeusz Struk <tadeusz.struk(a)intel.com
> > <mailto:tadeusz.struk(a)intel.com> >
> >       Sent: 19 April 2018 04:17
> >       To: Palmer, Duncan (Data61, Pullenvale);
> ian.justin.oliver(a)gmail.com
> > <mailto:ian.justin.oliver(a)gmail.com> ; tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>
> >       Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
> >
> >
> >       On 04/17/2018 03:24 PM, Duncan.Palmer(a)data61.csiro.au
> > <mailto:Duncan.Palmer(a)data61.csiro.au>  wrote:
> >       > We see the same behaviour on an Intel NUC5i7. I haven't looked
> at the
> > capabilities reported by the TPM device on that platform. The attached
> patch
> > (setting max_data_size =3D MAX_NV_BUFFER_SIZE when max_data_size is
> > reported as 0), sorts the problem out.
> >       >
> >
> >       Hi Duncan,
> >       Could you please send a Pull Request with your fix to the tools
> repo.
> >
> >       Thanks,
> >       --
> >       Tadeusz
> >
> >
> >
> >
> >
> >
> > --
> >
> > Dr. Ian Oliver
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Privacy Engineering:  via Amazon <http://www.amazon.co.uk/dp/1497569710>
> > Twitter: @i_j_oliver
>



-- =

*Dr. Ian Oliver*
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:  via Amazon <http://www.amazon.co.uk/dp/1497569710>
*Twitter: @i_j_oliver*

--===============0666384434791317128==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PkFjdHVhbGx5IHNvbWUgVFBNcyBhcmVuJiMzOTt0IHJl
cG9ydGluZyB0aGlzIHZhbHVlIGFzIHBhcnQgb2YgdGhlIHByb3BlcnRpZXMgKHRwbTJfZ2V0Y2Fw
IC1jIHByb3BlcnRpZXMtZml4ZWQgSUlSQykgc28gaXQgZ2V0cyBpbnRlcnByZXRlZCBhcyAwLjxi
cj48YnI+PC9kaXY+PGRpdj5DYW4geW91IGFsc28gY29uZmlybSB0aGUgbWF4aW11bSBzaXplIG9m
IGFuIE5WX1JBTSBhcmVhLCBvciBpcyBpdCBhbHdheXMgYm91bmRlZCBieSAKPHNwYW4gY2xhc3M9
ImdtYWlsLWltIj5NQVhfTlZfQlVGRkVSX1NJWkU8L3NwYW4+wqAKCj88YnI+PC9kaXY+PGRpdj48
YnI+PC9kaXY+dC48YnI+PGJyPjwvZGl2Pklhbjxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9l
eHRyYSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiAyNSBBcHJpbCAyMDE4IGF0IDE5
OjI5LCBSb2JlcnRzLCBXaWxsaWFtIEMgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWls
dG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5j
LnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8L3NwYW4+IHdyb3RlOjxicj48YmxvY2txdW90ZSBj
bGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDox
cHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij5JIGhhdmUgaGVhcmQgb2YgdGhpcyBidWcg
YmVmb3JlIGJ1dCBuZXZlciBlbmNvdW50ZXJlZCBpdC4gSSBsb29rZWQgYXQgdGhlIFBSOjxicj4K
PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9wdWxs
LzEwMDIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNv
bS90cG0yLTx3YnI+c29mdHdhcmUvdHBtMi10b29scy9wdWxsLzEwMDI8L2E+PGJyPgo8YnI+Ckkg
aGVhcmQgYXMgd2VsbCB0aGF0IHNldHRpbmcgdGhlIGJ1ZmZlciB0byBzb21ldGhpbmcgc21hbGxl
ciB0aGFuIE1BWCBzaXplIGFuZCB0aGF0IDUxMiBieXRlcyBpcyByZWNvbW1lbmRlZC48YnI+ClNv
bWVvbmUgYWN0dWFsbHkgcG9sbGVkIHRoZSB2ZW5kb3JzIHRvIGZpbmQgb3V0IHdoYXQgYnVmZmVy
IHNpemUgaXMgYWx3YXlzIGEgc2FmZSBiZXQsIGFuZCA1MTIgd2FzIGl0Ljxicj4KPHNwYW4gY2xh
c3M9IiI+PGJyPgomZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7IEZyb206
IHRwbTIgW21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZyI+
dHBtMi1ib3VuY2VzQGxpc3RzLjAxLjx3YnI+b3JnPC9hPl0gT24gQmVoYWxmIE9mIElhbiBPbGl2
ZXI8YnI+CiZndDsgU2VudDogVHVlc2RheSwgQXByaWwgMjQsIDIwMTggNzo0OCBBTTxicj4KJmd0
OyBUbzogPGEgaHJlZj0ibWFpbHRvOkR1bmNhbi5QYWxtZXJAZGF0YTYxLmNzaXJvLmF1Ij5EdW5j
YW4uUGFsbWVyQGRhdGE2MS5jc2lyby5hdTwvYT48YnI+CiZndDsgQ2M6IDxhIGhyZWY9Im1haWx0
bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFN1Ympl
Y3Q6IFJlOiBbdHBtMl0gTlZSQU1fd3JpdGUsIEJVRkZFUl9TSVpFIGlzIDA8YnI+CiZndDsgPGJy
Pgo8L3NwYW4+PHNwYW4gY2xhc3M9IiI+Jmd0OyBUaGFua3MsPGJyPgomZ3Q7IDxicj4KJmd0OyA8
YnI+CiZndDsgV2UgYXJlIHNlZWluZyB0aGUgc2FtZSBpc3N1ZSBvbiB0aGUgVFBNcyBpbiBvdXIg
SW50ZWwgTlVDcyAuLiBJbmZpbmVvbiA5NjU1cyA/PGJyPgomZ3Q7IE5lZWQgdG8gY2hlY2sgdG9t
b3Jyb3c8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyB0Ljxicj4KJmd0OyA8YnI+CiZndDsg
PGJyPgomZ3Q7IElhbjxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IE9uIDI0IEFwcmlsIDIw
MTggYXQgMTU6NTEsICZsdDs8YSBocmVmPSJtYWlsdG86RHVuY2FuLlBhbG1lckBkYXRhNjEuY3Np
cm8uYXUiPkR1bmNhbi5QYWxtZXJAZGF0YTYxLmNzaXJvLmF1PC9hPjxicj4KPC9zcGFuPjxzcGFu
IGNsYXNzPSIiPiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86RHVuY2FuLlBhbG1lckBk
YXRhNjEuY3Npcm8uYXUiPkR1bmNhbi5QYWxtZXJAZGF0YTYxLjx3YnI+Y3Npcm8uYXU8L2E+Jmd0
OyAmZ3Q7IHdyb3RlOjxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBEb25l
LiBJIGhhZG4mIzM5O3Qgc3VibWl0dGVkIGEgcHVsbCByZXF1ZXN0IGJlZm9yZSBhcyBJIHdhcyB1
bnN1cmUgd2hldGhlcjxicj4KJmd0OyB0aGlzIGlzc3VlIHdhcyByZWxhdGVkIHRvIHRoZSBUUE0g
SSYjMzk7bSB1c2luZyAod2hpY2ggZG9lc24mIzM5O3Qgc2VlbSBjb21tb25seTxicj4KJmd0OyB1
c2VkKSwgb3IgbW9yZSBnZW5lcmFsbHkgYXBwbGljYWJsZS48YnI+CiZndDsgPGJyPgomZ3Q7wqAg
wqAgwqAgwqBEdW5jYW4gUGFsbWVyPGJyPgomZ3Q7wqAgwqAgwqAgwqBTZW5pb3IgU29mdHdhcmUg
RW5naW5lZXIgfCBBdXRvbm9tb3VzIFN5c3RlbXM8YnI+CiZndDvCoCDCoCDCoCDCoERhdGE2MSB8
IENTSVJPPGJyPgomZ3Q7wqAgwqAgwqAgwqBFIGR1bmNhbi5wYWxtZXJAY3Npcm8uYXU8YnI+CiZn
dDvCoCDCoCDCoCDCoFF1ZWVuc2xhbmQgQ2VudHJlIGZvciBBZHZhbmNlZCBUZWNobm9sb2dpZXMg
KFFDQVQpLDxicj4KJmd0O8KgIMKgIMKgIMKgMSBUZWNobm9sb2d5IENvdXJ0LCBQdWxsZW52YWxl
IFFMRCwgNDA2OTxicj4KPC9zcGFuPiZndDvCoCDCoCDCoCDCoDxhIGhyZWY9Imh0dHA6Ly93d3cu
ZGF0YTYxLmNzaXJvLmF1IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj53d3cuZGF0
YTYxLmNzaXJvLmF1PC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL3d3dy5kYXRhNjEuY3Npcm8uYXUi
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly93d3cuZGF0YTYxLmNzaXJv
LmF1PC9hPiZndDs8YnI+CjxzcGFuIGNsYXNzPSIiPiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBD
U0lST+KAmXMgRGlnaXRhbCBQcm9kdWN0aXZpdHkgYnVzaW5lc3MgdW5pdCBhbmQgTklDVEEgaGF2
ZSBqb2luZWQgZm9yY2VzIHRvPGJyPgomZ3Q7IGNyZWF0ZSBkaWdpdGFsIHBvd2VyaG91c2UgRGF0
YTYxPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fPHdicj5fX19fX19fX19fPGJyPgomZ3Q7wqAgwqAgwqAgwqBGcm9tOiBUYWRldXN6IFN0
cnVrICZsdDs8YSBocmVmPSJtYWlsdG86dGFkZXVzei5zdHJ1a0BpbnRlbC5jb20iPnRhZGV1c3ou
c3RydWtAaW50ZWwuY29tPC9hPjxicj4KPC9zcGFuPiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86dGFkZXVzei5zdHJ1a0BpbnRlbC5jb20iPnRhZGV1c3ouc3RydWtAaW50ZWwuPHdicj5j
b208L2E+Jmd0OyAmZ3Q7PGJyPgo8c3BhbiBjbGFzcz0iIj4mZ3Q7wqAgwqAgwqAgwqBTZW50OiAx
OSBBcHJpbCAyMDE4IDA0OjE3PGJyPgomZ3Q7wqAgwqAgwqAgwqBUbzogUGFsbWVyLCBEdW5jYW4g
KERhdGE2MSwgUHVsbGVudmFsZSk7IDxhIGhyZWY9Im1haWx0bzppYW4uanVzdGluLm9saXZlckBn
bWFpbC5jb20iPmlhbi5qdXN0aW4ub2xpdmVyQGdtYWlsLmNvbTwvYT48YnI+Cjwvc3Bhbj4mZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmlhbi5qdXN0aW4ub2xpdmVyQGdtYWlsLmNvbSI+
aWFuLmp1c3Rpbi5vbGl2ZXJAPHdicj5nbWFpbC5jb208L2E+Jmd0OyA7IDxhIGhyZWY9Im1haWx0
bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0yQGxpc3RzLjAxLm9y
ZzwvYT4mZ3Q7PGJyPgo8c3BhbiBjbGFzcz0iIj4mZ3Q7wqAgwqAgwqAgwqBTdWJqZWN0OiBSZTog
W3RwbTJdIE5WUkFNX3dyaXRlLCBCVUZGRVJfU0laRSBpcyAwPGJyPgomZ3Q7IDxicj4KJmd0OyA8
YnI+CiZndDvCoCDCoCDCoCDCoE9uIDA0LzE3LzIwMTggMDM6MjQgUE0sIDxhIGhyZWY9Im1haWx0
bzpEdW5jYW4uUGFsbWVyQGRhdGE2MS5jc2lyby5hdSI+RHVuY2FuLlBhbG1lckBkYXRhNjEuY3Np
cm8uYXU8L2E+PGJyPgo8L3NwYW4+PHNwYW4gY2xhc3M9IiI+Jmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpEdW5jYW4uUGFsbWVyQGRhdGE2MS5jc2lyby5hdSI+RHVuY2FuLlBhbG1lckBk
YXRhNjEuPHdicj5jc2lyby5hdTwvYT4mZ3Q7wqAgd3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IFdlIHNlZSB0aGUgc2FtZSBiZWhhdmlvdXIgb24gYW4gSW50ZWwgTlVDNWk3LiBJIGhhdmVu
JiMzOTt0IGxvb2tlZCBhdCB0aGU8YnI+CiZndDsgY2FwYWJpbGl0aWVzIHJlcG9ydGVkIGJ5IHRo
ZSBUUE0gZGV2aWNlIG9uIHRoYXQgcGxhdGZvcm0uIFRoZSBhdHRhY2hlZCBwYXRjaDxicj4KJmd0
OyAoc2V0dGluZyBtYXhfZGF0YV9zaXplID0gTUFYX05WX0JVRkZFUl9TSVpFIHdoZW4gbWF4X2Rh
dGFfc2l6ZSBpczxicj4KJmd0OyByZXBvcnRlZCBhcyAwKSwgc29ydHMgdGhlIHByb2JsZW0gb3V0
Ljxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoEhp
IER1bmNhbiw8YnI+CiZndDvCoCDCoCDCoCDCoENvdWxkIHlvdSBwbGVhc2Ugc2VuZCBhIFB1bGwg
UmVxdWVzdCB3aXRoIHlvdXIgZml4IHRvIHRoZSB0b29scyByZXBvLjxicj4KJmd0OyA8YnI+CiZn
dDvCoCDCoCDCoCDCoFRoYW5rcyw8YnI+CiZndDvCoCDCoCDCoCDCoC0tPGJyPgomZ3Q7wqAgwqAg
wqAgwqBUYWRldXN6PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4K
Jmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IC0tPGJyPgomZ3Q7IDxicj4KJmd0OyBEci4gSWFuIE9s
aXZlcjxicj4KJmd0OyA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08d2JyPj08YnI+CiZn
dDsgPGJyPgo8L3NwYW4+Jmd0OyBQcml2YWN5IEVuZ2luZWVyaW5nOsKgIHZpYSBBbWF6b24gJmx0
OzxhIGhyZWY9Imh0dHA6Ly93d3cuYW1hem9uLmNvLnVrL2RwLzE0OTc1Njk3MTAiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly93d3cuYW1hem9uLmNvLnVrL2RwLzx3YnI+
MTQ5NzU2OTcxMDwvYT4mZ3Q7PGJyPgomZ3Q7IFR3aXR0ZXI6IEBpX2pfb2xpdmVyPGJyPgo8L2Js
b2NrcXVvdGU+PC9kaXY+PGJyPjxiciBjbGVhcj0iYWxsIj48YnI+LS0gPGJyPjxkaXYgY2xhc3M9
ImdtYWlsX3NpZ25hdHVyZSIgZGF0YS1zbWFydG1haWw9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBk
aXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRp
diBkaXI9Imx0ciI+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWw7Zm9udC1zaXplOnNtYWxs
Ij48Yj5Eci4gSWFuIE9saXZlcjwvYj48YnI+PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PTxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTphcmlhbDtmb250LXNpemU6c21hbGwi
PlByaXZhY3kgRW5naW5lZXJpbmc6wqAgPGI+PC9iPjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMTcs
MTcsMTcpO2ZvbnQtZmFtaWx5OkFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEzcHg7bGluZS1o
ZWlnaHQ6MTlweCI+PGEgaHJlZj0iaHR0cDovL3d3dy5hbWF6b24uY28udWsvZHAvMTQ5NzU2OTcx
MCIgdGFyZ2V0PSJfYmxhbmsiPnZpYSBBbWF6b248L2E+PC9zcGFuPjxiPjxicj5Ud2l0dGVyOiBA
aV9qX29saXZlcjwvYj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48
L2Rpdj48L2Rpdj4KPC9kaXY+Cg==

--===============0666384434791317128==--

