Content-Type: multipart/mixed; boundary="===============4787840773681930448=="
MIME-Version: 1.0
From: Duncan.Palmer at data61.csiro.au
Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
Date: Thu, 26 Apr 2018 22:15:42 +0000
Message-ID: <1524780942850.60358@data61.csiro.au>
In-Reply-To: CAAxBZJs+WEO7ssHQ8dgGye6boftZrqGAP+n1LDEEaZqY3tTdGg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4787840773681930448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for updating the patch with a default size William. Sorry, I hadn't =
the time to do it yet...


Duncan Palmer
Senior Software Engineer | Autonomous Systems
Data61 | CSIRO

E duncan.palmer(a)csiro.au

Queensland Centre for Advanced Technologies (QCAT),

1 Technology Court, Pullenvale QLD, 4069

www.data61.csiro.au<http://my.csiro.au/Business-Units/Operations/Communicat=
ion/CSIRO-Branding/Data61-Branding/www.data61.csiro.au>


CSIRO's Digital Productivity business unit and NICTA have joined forces to =
create digital powerhouse Data61

________________________________
From: Ian Oliver <ian.justin.oliver(a)gmail.com>
Sent: 26 April 2018 03:02
To: Roberts, William C
Cc: Palmer, Duncan (Data61, Pullenvale); tpm2(a)lists.01.org
Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0

Actually some TPMs aren't reporting this value as part of the properties (t=
pm2_getcap -c properties-fixed IIRC) so it gets interpreted as 0.

Can you also confirm the maximum size of an NV_RAM area, or is it always bo=
unded by MAX_NV_BUFFER_SIZE  ?

t.

Ian

On 25 April 2018 at 19:29, Roberts, William C <william.c.roberts(a)intel.co=
m<mailto:william.c.roberts(a)intel.com>> wrote:
I have heard of this bug before but never encountered it. I looked at the P=
R:
https://github.com/tpm2-software/tpm2-tools/pull/1002

I heard as well that setting the buffer to something smaller than MAX size =
and that 512 bytes is recommended.
Someone actually polled the vendors to find out what buffer size is always =
a safe bet, and 512 was it.

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org<mailto:tpm2-bounces(a)list=
s.01.org>] On Behalf Of Ian Oliver
> Sent: Tuesday, April 24, 2018 7:48 AM
> To: Duncan.Palmer(a)data61.csiro.au<mailto:Duncan.Palmer(a)data61.csiro.a=
u>
> Cc: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
> Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
>
> Thanks,
>
>
> We are seeing the same issue on the TPMs in our Intel NUCs .. Infineon 96=
55s ?
> Need to check tomorrow
>
>
> t.
>
>
> Ian
>
>
> On 24 April 2018 at 15:51, <Duncan.Palmer(a)data61.csiro.au<mailto:Duncan=
.Palmer(a)data61.csiro.au>
> <mailto:Duncan.Palmer(a)data61.csiro.au<mailto:Duncan.Palmer(a)data61.csi=
ro.au>> > wrote:
>
>
>       Done. I hadn't submitted a pull request before as I was unsure whet=
her
> this issue was related to the TPM I'm using (which doesn't seem commonly
> used), or more generally applicable.
>
>       Duncan Palmer
>       Senior Software Engineer | Autonomous Systems
>       Data61 | CSIRO
>       E duncan.palmer(a)csiro.au
>       Queensland Centre for Advanced Technologies (QCAT),
>       1 Technology Court, Pullenvale QLD, 4069
>       www.data61.csiro.au<http://www.data61.csiro.au> <http://www.data61.=
csiro.au>
>
>       CSIRO's Digital Productivity business unit and NICTA have joined fo=
rces to
> create digital powerhouse Data61
>
>       ________________________________________
>       From: Tadeusz Struk <tadeusz.struk(a)intel.com<mailto:tadeusz.struk=
(a)intel.com>
> <mailto:tadeusz.struk(a)intel.com<mailto:tadeusz.struk(a)intel.com>> >
>       Sent: 19 April 2018 04:17
>       To: Palmer, Duncan (Data61, Pullenvale); ian.justin.oliver(a)gmail.=
com<mailto:ian.justin.oliver(a)gmail.com>
> <mailto:ian.justin.oliver(a)gmail.com<mailto:ian.justin.oliver(a)gmail.co=
m>> ; tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>>
>       Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
>
>
>       On 04/17/2018 03:24 PM, Duncan.Palmer(a)data61.csiro.au<mailto:Dunc=
an.Palmer(a)data61.csiro.au>
> <mailto:Duncan.Palmer(a)data61.csiro.au<mailto:Duncan.Palmer(a)data61.csi=
ro.au>>  wrote:
>       > We see the same behaviour on an Intel NUC5i7. I haven't looked at=
 the
> capabilities reported by the TPM device on that platform. The attached pa=
tch
> (setting max_data_size =3D MAX_NV_BUFFER_SIZE when max_data_size is
> reported as 0), sorts the problem out.
>       >
>
>       Hi Duncan,
>       Could you please send a Pull Request with your fix to the tools rep=
o.
>
>       Thanks,
>       --
>       Tadeusz
>
>
>
>
>
>
> --
>
> Dr. Ian Oliver
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>
> Privacy Engineering:  via Amazon <http://www.amazon.co.uk/dp/1497569710>
> Twitter: @i_j_oliver



--
Dr. Ian Oliver
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:  via Amazon<http://www.amazon.co.uk/dp/1497569710>
Twitter: @i_j_oliver

--===============4787840773681930448==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1pc28tODg1OS0xIj4KPHN0eWxlIHR5cGU9InRleHQvY3NzIiBzdHls
ZT0iZGlzcGxheTpub25lIj48IS0tUHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gLS0+
PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciIgc3R5bGU9ImZvbnQtc2l6ZToxMnB0O2Nv
bG9yOiMwMDAwMDA7YmFja2dyb3VuZC1jb2xvcjojRkZGRkZGO2ZvbnQtZmFtaWx5OkNhbGlicmks
QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Ij4KPHA+VGhhbmtzIGZvciB1cGRhdGluZyB0aGUg
cGF0Y2ggd2l0aCBhIGRlZmF1bHQgc2l6ZSBXaWxsaWFtLiBTb3JyeSwgSSBoYWRuJ3QgdGhlIHRp
bWUgdG8gZG8gaXQgeWV0Li4uPC9wPgo8cD48YnI+CjwvcD4KPGRpdiBpZD0iU2lnbmF0dXJlIj4K
PGRpdiBuYW1lPSJkaXZ0YWdkZWZhdWx0d3JhcHBlciIgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGli
cmksQXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTo7IG1hcmdpbjowIj4KPHA+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyBmb250LWZhbWlseTpjYWxpYnJpOyBjb2xvcjoj
MmZiNzg3Ij48c3Ryb25nPkR1bmNhbiBQYWxtZXI8L3N0cm9uZz48L3NwYW4+PGJyPgo8c3BhbiBz
dHlsZT0iZm9udC1zaXplOjlwdDsgZm9udC1mYW1pbHk6Y2FsaWJyaSI+U2VuaW9yIFNvZnR3YXJl
IEVuZ2luZWVyIHwgQXV0b25vbW91cyBTeXN0ZW1zPGJyPgo8c3Ryb25nPkRhdGE2MSB8IENTSVJP
PC9zdHJvbmc+PGJyPgo8L3NwYW4+PC9wPgo8cCBzdHlsZT0iZm9udC1zaXplOjlwdDsgZm9udC1m
YW1pbHk6Y2FsaWJyaSI+PHN0cm9uZz48c3BhbiBzdHlsZT0iZm9udC1zaXplOjlwdDsgZm9udC1m
YW1pbHk6Y2FsaWJyaTsgY29sb3I6IzJmYjc4NyI+RTwvc3Bhbj48L3N0cm9uZz4gZHVuY2FuLnBh
bG1lcjxzcGFuIHN0eWxlPSJmb250LXNpemU6OXB0OyBmb250LWZhbWlseTpjYWxpYnJpIj5AY3Np
cm8uYXU8L3NwYW4+PC9wPgo8cCBzdHlsZT0iZm9udC1zaXplOjlwdDsgZm9udC1mYW1pbHk6Y2Fs
aWJyaSI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6d2hpdGUiIGxhbmc9ImVuLVVTIj48
Zm9udCBzaXplPSIyIiBmYWNlPSJDYWxpYnJpIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQi
Pjxmb250IHNpemU9IjIiIGNvbG9yPSJibGFjayI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo5cHQi
PlF1ZWVuc2xhbmQgQ2VudHJlIGZvciBBZHZhbmNlZCBUZWNobm9sb2dpZXMgKFFDQVQpLDwvc3Bh
bj48L2ZvbnQ+PC9zcGFuPjwvZm9udD48L3NwYW4+PC9wPgo8cCBzdHlsZT0iZm9udC1zaXplOjlw
dDsgZm9udC1mYW1pbHk6Y2FsaWJyaSI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo5cHQ7IGZvbnQt
ZmFtaWx5OmNhbGlicmkiPjEgVGVjaG5vbG9neSBDb3VydCwgUHVsbGVudmFsZSBRTEQsIDQwNjk8
YnI+Cjwvc3Bhbj48L3A+CjxzcGFuIHN0eWxlPSJmb250LXNpemU6OXB0OyBmb250LWZhbWlseTpj
YWxpYnJpIj48L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo5cHQ7IGZvbnQtZmFtaWx5OmNh
bGlicmkiPjxhIGhyZWY9Imh0dHA6Ly9teS5jc2lyby5hdS9CdXNpbmVzcy1Vbml0cy9PcGVyYXRp
b25zL0NvbW11bmljYXRpb24vQ1NJUk8tQnJhbmRpbmcvRGF0YTYxLUJyYW5kaW5nL3d3dy5kYXRh
NjEuY3Npcm8uYXUiIHN0eWxlPSJjb2xvcjojMmZiNzg3IiBpZD0iTm9MUCI+d3d3LmRhdGE2MS5j
c2lyby5hdTwvYT48L3NwYW4+PGJyPgo8cCBzdHlsZT0iZm9udC1zaXplOjlwdDsgZm9udC1mYW1p
bHk6Y2FsaWJyaSI+PGJyPgo8L3A+CjxwIHN0eWxlPSJmb250LXNpemU6OXB0OyBmb250LWZhbWls
eTpjYWxpYnJpIj48Yj5DU0lSTyYjODIxNztzIERpZ2l0YWwgUHJvZHVjdGl2aXR5IGJ1c2luZXNz
IHVuaXQgYW5kIE5JQ1RBIGhhdmUgam9pbmVkIGZvcmNlcyB0byBjcmVhdGUgZGlnaXRhbCBwb3dl
cmhvdXNlIERhdGE2MTwvYj48L3A+CjxiPjwvYj48L2Rpdj4KPC9kaXY+CjxkaXYgc3R5bGU9ImNv
bG9yOiByZ2IoMzMsIDMzLCAzMyk7Ij4KPGhyIHRhYmluZGV4PSItMSIgc3R5bGU9ImRpc3BsYXk6
aW5saW5lLWJsb2NrOyB3aWR0aDo5OCUiPgo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0
ciI+PGZvbnQgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAwMDAwMCIgZmFjZT0iQ2Fs
aWJyaSwgc2Fucy1zZXJpZiI+PGI+RnJvbTo8L2I+IElhbiBPbGl2ZXIgJmx0O2lhbi5qdXN0aW4u
b2xpdmVyQGdtYWlsLmNvbSZndDs8YnI+CjxiPlNlbnQ6PC9iPiAyNiBBcHJpbCAyMDE4IDAzOjAy
PGJyPgo8Yj5Ubzo8L2I+IFJvYmVydHMsIFdpbGxpYW0gQzxicj4KPGI+Q2M6PC9iPiBQYWxtZXIs
IER1bmNhbiAoRGF0YTYxLCBQdWxsZW52YWxlKTsgdHBtMkBsaXN0cy4wMS5vcmc8YnI+CjxiPlN1
YmplY3Q6PC9iPiBSZTogW3RwbTJdIE5WUkFNX3dyaXRlLCBCVUZGRVJfU0laRSBpcyAwPC9mb250
Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8L2Rpdj4KPGRpdj4KPGRpdiBkaXI9Imx0ciI+CjxkaXY+Cjxk
aXY+QWN0dWFsbHkgc29tZSBUUE1zIGFyZW4ndCByZXBvcnRpbmcgdGhpcyB2YWx1ZSBhcyBwYXJ0
IG9mIHRoZSBwcm9wZXJ0aWVzICh0cG0yX2dldGNhcCAtYyBwcm9wZXJ0aWVzLWZpeGVkIElJUkMp
IHNvIGl0IGdldHMgaW50ZXJwcmV0ZWQgYXMgMC48YnI+Cjxicj4KPC9kaXY+CjxkaXY+Q2FuIHlv
dSBhbHNvIGNvbmZpcm0gdGhlIG1heGltdW0gc2l6ZSBvZiBhbiBOVl9SQU0gYXJlYSwgb3IgaXMg
aXQgYWx3YXlzIGJvdW5kZWQgYnkKPHNwYW4gY2xhc3M9ImdtYWlsLWltIj5NQVhfTlZfQlVGRkVS
X1NJWkU8L3NwYW4+Jm5ic3A7ID88YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CnQuPGJyPgo8
YnI+CjwvZGl2PgpJYW48YnI+CjwvZGl2Pgo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPgo8
ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24gMjUgQXByaWwgMjAxOCBhdCAxOToyOSwgUm9iZXJ0
cywgV2lsbGlhbSBDIDxzcGFuIGRpcj0ibHRyIj4KJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFt
LmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0Bp
bnRlbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPgo8YmxvY2txdW90ZSBjbGFzcz0iZ21h
aWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDsgYm9yZGVyLWxlZnQ6MXB4ICNjY2Mg
c29saWQ7IHBhZGRpbmctbGVmdDoxZXgiPgpJIGhhdmUgaGVhcmQgb2YgdGhpcyBidWcgYmVmb3Jl
IGJ1dCBuZXZlciBlbmNvdW50ZXJlZCBpdC4gSSBsb29rZWQgYXQgdGhlIFBSOjxicj4KPGEgaHJl
Zj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9wdWxsLzEwMDIi
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0y
LTx3YnI+c29mdHdhcmUvdHBtMi10b29scy9wdWxsLzEwMDI8L2E+PGJyPgo8YnI+CkkgaGVhcmQg
YXMgd2VsbCB0aGF0IHNldHRpbmcgdGhlIGJ1ZmZlciB0byBzb21ldGhpbmcgc21hbGxlciB0aGFu
IE1BWCBzaXplIGFuZCB0aGF0IDUxMiBieXRlcyBpcyByZWNvbW1lbmRlZC48YnI+ClNvbWVvbmUg
YWN0dWFsbHkgcG9sbGVkIHRoZSB2ZW5kb3JzIHRvIGZpbmQgb3V0IHdoYXQgYnVmZmVyIHNpemUg
aXMgYWx3YXlzIGEgc2FmZSBiZXQsIGFuZCA1MTIgd2FzIGl0Ljxicj4KPHNwYW4gY2xhc3M9IiI+
PGJyPgomZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7IEZyb206IHRwbTIg
W21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZyI+dHBtMi1i
b3VuY2VzQGxpc3RzLjAxLjx3YnI+b3JnPC9hPl0gT24gQmVoYWxmIE9mIElhbiBPbGl2ZXI8YnI+
CiZndDsgU2VudDogVHVlc2RheSwgQXByaWwgMjQsIDIwMTggNzo0OCBBTTxicj4KJmd0OyBUbzog
PGEgaHJlZj0ibWFpbHRvOkR1bmNhbi5QYWxtZXJAZGF0YTYxLmNzaXJvLmF1Ij5EdW5jYW4uUGFs
bWVyQGRhdGE2MS5jc2lyby5hdTwvYT48YnI+CiZndDsgQ2M6IDxhIGhyZWY9Im1haWx0bzp0cG0y
QGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFN1YmplY3Q6IFJl
OiBbdHBtMl0gTlZSQU1fd3JpdGUsIEJVRkZFUl9TSVpFIGlzIDA8YnI+CiZndDsgPGJyPgo8L3Nw
YW4+PHNwYW4gY2xhc3M9IiI+Jmd0OyBUaGFua3MsPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZn
dDsgV2UgYXJlIHNlZWluZyB0aGUgc2FtZSBpc3N1ZSBvbiB0aGUgVFBNcyBpbiBvdXIgSW50ZWwg
TlVDcyAuLiBJbmZpbmVvbiA5NjU1cyA/PGJyPgomZ3Q7IE5lZWQgdG8gY2hlY2sgdG9tb3Jyb3c8
YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyB0Ljxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgom
Z3Q7IElhbjxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IE9uIDI0IEFwcmlsIDIwMTggYXQg
MTU6NTEsICZsdDs8YSBocmVmPSJtYWlsdG86RHVuY2FuLlBhbG1lckBkYXRhNjEuY3Npcm8uYXUi
PkR1bmNhbi5QYWxtZXJAZGF0YTYxLmNzaXJvLmF1PC9hPjxicj4KPC9zcGFuPjxzcGFuIGNsYXNz
PSIiPiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86RHVuY2FuLlBhbG1lckBkYXRhNjEu
Y3Npcm8uYXUiPkR1bmNhbi5QYWxtZXJAZGF0YTYxLjx3YnI+Y3Npcm8uYXU8L2E+Jmd0OyAmZ3Q7
IHdyb3RlOjxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7RG9uZS4gSSBoYWRuJ3Qgc3VibWl0dGVkIGEgcHVsbCByZXF1ZXN0IGJlZm9yZSBhcyBJ
IHdhcyB1bnN1cmUgd2hldGhlcjxicj4KJmd0OyB0aGlzIGlzc3VlIHdhcyByZWxhdGVkIHRvIHRo
ZSBUUE0gSSdtIHVzaW5nICh3aGljaCBkb2Vzbid0IHNlZW0gY29tbW9ubHk8YnI+CiZndDsgdXNl
ZCksIG9yIG1vcmUgZ2VuZXJhbGx5IGFwcGxpY2FibGUuPGJyPgomZ3Q7IDxicj4KJmd0OyZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwO0R1bmNhbiBQYWxtZXI8YnI+CiZndDsmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDtTZW5pb3IgU29mdHdhcmUgRW5naW5lZXIgfCBBdXRvbm9tb3VzIFN5c3Rl
bXM8YnI+CiZndDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtEYXRhNjEgfCBDU0lSTzxicj4K
Jmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO0UgZHVuY2FuLnBhbG1lckBjc2lyby5hdTxi
cj4KJmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO1F1ZWVuc2xhbmQgQ2VudHJlIGZvciBB
ZHZhbmNlZCBUZWNobm9sb2dpZXMgKFFDQVQpLDxicj4KJmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOzEgVGVjaG5vbG9neSBDb3VydCwgUHVsbGVudmFsZSBRTEQsIDQwNjk8YnI+Cjwvc3Bh
bj4mZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7PGEgaHJlZj0iaHR0cDovL3d3dy5kYXRh
NjEuY3Npcm8uYXUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnd3dy5kYXRhNjEu
Y3Npcm8uYXU8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vd3d3LmRhdGE2MS5jc2lyby5hdSIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3d3dy5kYXRhNjEuY3Npcm8uYXU8
L2E+Jmd0Ozxicj4KPHNwYW4gY2xhc3M9IiI+Jmd0OyA8YnI+CiZndDsmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDtDU0lSTyYjODIxNztzIERpZ2l0YWwgUHJvZHVjdGl2aXR5IGJ1c2luZXNzIHVu
aXQgYW5kIE5JQ1RBIGhhdmUgam9pbmVkIGZvcmNlcyB0bzxicj4KJmd0OyBjcmVhdGUgZGlnaXRh
bCBwb3dlcmhvdXNlIERhdGE2MTxicj4KJmd0OyA8YnI+CiZndDsmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDtfX19fX19fX19fX19fX19fX19fX19fX19fX19fX188d2JyPl9fX19fX19fX188YnI+
CiZndDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtGcm9tOiBUYWRldXN6IFN0cnVrICZsdDs8
YSBocmVmPSJtYWlsdG86dGFkZXVzei5zdHJ1a0BpbnRlbC5jb20iPnRhZGV1c3ouc3RydWtAaW50
ZWwuY29tPC9hPjxicj4KPC9zcGFuPiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dGFk
ZXVzei5zdHJ1a0BpbnRlbC5jb20iPnRhZGV1c3ouc3RydWtAaW50ZWwuPHdicj5jb208L2E+Jmd0
OyAmZ3Q7PGJyPgo8c3BhbiBjbGFzcz0iIj4mZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
U2VudDogMTkgQXByaWwgMjAxOCAwNDoxNzxicj4KJmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwO1RvOiBQYWxtZXIsIER1bmNhbiAoRGF0YTYxLCBQdWxsZW52YWxlKTsgPGEgaHJlZj0ibWFp
bHRvOmlhbi5qdXN0aW4ub2xpdmVyQGdtYWlsLmNvbSI+Cmlhbi5qdXN0aW4ub2xpdmVyQGdtYWls
LmNvbTwvYT48YnI+Cjwvc3Bhbj4mZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmlhbi5q
dXN0aW4ub2xpdmVyQGdtYWlsLmNvbSI+aWFuLmp1c3Rpbi5vbGl2ZXJAPHdicj5nbWFpbC5jb208
L2E+Jmd0OyA7CjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMu
MDEub3JnIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgo8c3BhbiBjbGFzcz0iIj4mZ3Q7
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7U3ViamVjdDogUmU6IFt0cG0yXSBOVlJBTV93cml0
ZSwgQlVGRkVSX1NJWkUgaXMgMDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7Jm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7T24gMDQvMTcvMjAxOCAwMzoyNCBQTSwgPGEgaHJlZj0ibWFpbHRv
OkR1bmNhbi5QYWxtZXJAZGF0YTYxLmNzaXJvLmF1Ij5EdW5jYW4uUGFsbWVyQGRhdGE2MS5jc2ly
by5hdTwvYT48YnI+Cjwvc3Bhbj48c3BhbiBjbGFzcz0iIj4mZ3Q7ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOkR1bmNhbi5QYWxtZXJAZGF0YTYxLmNzaXJvLmF1Ij5EdW5jYW4uUGFsbWVyQGRh
dGE2MS48d2JyPmNzaXJvLmF1PC9hPiZndDsmbmJzcDsgd3JvdGU6PGJyPgomZ3Q7Jm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7Jmd0OyBXZSBzZWUgdGhlIHNhbWUgYmVoYXZpb3VyIG9uIGFuIElu
dGVsIE5VQzVpNy4gSSBoYXZlbid0IGxvb2tlZCBhdCB0aGU8YnI+CiZndDsgY2FwYWJpbGl0aWVz
IHJlcG9ydGVkIGJ5IHRoZSBUUE0gZGV2aWNlIG9uIHRoYXQgcGxhdGZvcm0uIFRoZSBhdHRhY2hl
ZCBwYXRjaDxicj4KJmd0OyAoc2V0dGluZyBtYXhfZGF0YV9zaXplID0gTUFYX05WX0JVRkZFUl9T
SVpFIHdoZW4gbWF4X2RhdGFfc2l6ZSBpczxicj4KJmd0OyByZXBvcnRlZCBhcyAwKSwgc29ydHMg
dGhlIHByb2JsZW0gb3V0Ljxicj4KJmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyZndDs8
YnI+CiZndDsgPGJyPgomZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7SGkgRHVuY2FuLDxi
cj4KJmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO0NvdWxkIHlvdSBwbGVhc2Ugc2VuZCBh
IFB1bGwgUmVxdWVzdCB3aXRoIHlvdXIgZml4IHRvIHRoZSB0b29scyByZXBvLjxicj4KJmd0OyA8
YnI+CiZndDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtUaGFua3MsPGJyPgomZ3Q7Jm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7LS08YnI+CiZndDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDtUYWRldXN6PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0
OyA8YnI+CiZndDsgPGJyPgomZ3Q7IC0tPGJyPgomZ3Q7IDxicj4KJmd0OyBEci4gSWFuIE9saXZl
cjxicj4KJmd0OyA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08d2JyPj08YnI+CiZndDsg
PGJyPgo8L3NwYW4+Jmd0OyBQcml2YWN5IEVuZ2luZWVyaW5nOiZuYnNwOyB2aWEgQW1hem9uICZs
dDs8YSBocmVmPSJodHRwOi8vd3d3LmFtYXpvbi5jby51ay9kcC8xNDk3NTY5NzEwIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vd3d3LmFtYXpvbi5jby51ay9kcC88d2Jy
PjE0OTc1Njk3MTA8L2E+Jmd0Ozxicj4KJmd0OyBUd2l0dGVyOiBAaV9qX29saXZlcjxicj4KPC9i
bG9ja3F1b3RlPgo8L2Rpdj4KPGJyPgo8YnIgY2xlYXI9ImFsbCI+Cjxicj4KLS0gPGJyPgo8ZGl2
IGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiPgo8ZGl2IGRpcj0ibHRyIj4KPGRpdj4KPGRpdiBkaXI9
Imx0ciI+CjxkaXY+CjxkaXYgZGlyPSJsdHIiPgo8ZGl2Pgo8ZGl2IGRpcj0ibHRyIj4KPGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6YXJpYWw7IGZvbnQtc2l6ZTpzbWFsbCI+PGI+RHIuIElhbiBPbGl2
ZXI8L2I+PGJyPgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PGJyPgo8L2Rpdj4KPGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWw7IGZvbnQtc2l6ZTpzbWFsbCI+UHJpdmFjeSBFbmdp
bmVlcmluZzombmJzcDsgPGI+PC9iPjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMTcsMTcsMTcpOyBm
b250LWZhbWlseTpBcmlhbCxzYW5zLXNlcmlmOyBmb250LXNpemU6MTNweDsgbGluZS1oZWlnaHQ6
MTlweCI+PGEgaHJlZj0iaHR0cDovL3d3dy5hbWF6b24uY28udWsvZHAvMTQ5NzU2OTcxMCIgdGFy
Z2V0PSJfYmxhbmsiPnZpYSBBbWF6b248L2E+PC9zcGFuPjxiPjxicj4KVHdpdHRlcjogQGlfal9v
bGl2ZXI8L2I+PC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+
CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============4787840773681930448==--

