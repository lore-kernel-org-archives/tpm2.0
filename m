Content-Type: multipart/mixed; boundary="===============4413739638088477208=="
MIME-Version: 1.0
From: Ian Oliver <ian.justin.oliver at gmail.com>
Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
Date: Tue, 24 Apr 2018 17:47:47 +0300
Message-ID: <CAAxBZJsvSA_O5houSSfgj566KdeHOkuYzGxkRpYLOROrKwf8iA@mail.gmail.com>
In-Reply-To: 1524574309106.7317@data61.csiro.au
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4413739638088477208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks,

We are seeing the same issue on the TPMs in our Intel NUCs .. Infineon
9655s ?  Need to check tomorrow

t.

Ian

On 24 April 2018 at 15:51, <Duncan.Palmer(a)data61.csiro.au> wrote:

> Done. I hadn't submitted a pull request before as I was unsure whether
> this issue was related to the TPM I'm using (which doesn't seem commonly
> used), or more generally applicable.
>
> Duncan Palmer
> Senior Software Engineer | Autonomous Systems
> Data61 | CSIRO
> E duncan.palmer(a)csiro.au
> Queensland Centre for Advanced Technologies (QCAT),
> 1 Technology Court, Pullenvale QLD, 4069
> www.data61.csiro.au
>
> CSIRO=E2=80=99s Digital Productivity business unit and NICTA have joined =
forces to
> create digital powerhouse Data61
>
> ________________________________________
> From: Tadeusz Struk <tadeusz.struk(a)intel.com>
> Sent: 19 April 2018 04:17
> To: Palmer, Duncan (Data61, Pullenvale); ian.justin.oliver(a)gmail.com;
> tpm2(a)lists.01.org
> Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
>
> On 04/17/2018 03:24 PM, Duncan.Palmer(a)data61.csiro.au wrote:
> > We see the same behaviour on an Intel NUC5i7. I haven't looked at the
> capabilities reported by the TPM device on that platform. The attached
> patch (setting max_data_size =3D MAX_NV_BUFFER_SIZE when max_data_size is
> reported as 0), sorts the problem out.
> >
>
> Hi Duncan,
> Could you please send a Pull Request with your fix to the tools repo.
>
> Thanks,
> --
> Tadeusz
>
>


-- =

*Dr. Ian Oliver*
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:  via Amazon <http://www.amazon.co.uk/dp/1497569710>
*Twitter: @i_j_oliver*

--===============4413739638088477208==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+VGhhbmtzLDxicj48YnI+PC9kaXY+V2UgYXJl
IHNlZWluZyB0aGUgc2FtZSBpc3N1ZSBvbiB0aGUgVFBNcyBpbiBvdXIgSW50ZWwgTlVDcyAuLiBJ
bmZpbmVvbiA5NjU1cyA/wqAgTmVlZCB0byBjaGVjayB0b21vcnJvdzxicj48YnI+PC9kaXY+dC48
YnI+PGJyPjwvZGl2Pklhbjxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxk
aXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiAyNCBBcHJpbCAyMDE4IGF0IDE1OjUxLCAgPHNwYW4g
ZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86RHVuY2FuLlBhbG1lckBkYXRhNjEuY3Npcm8u
YXUiIHRhcmdldD0iX2JsYW5rIj5EdW5jYW4uUGFsbWVyQGRhdGE2MS5jc2lyby5hdTwvYT4mZ3Q7
PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0i
bWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0
OjFleCI+RG9uZS4gSSBoYWRuJiMzOTt0IHN1Ym1pdHRlZCBhIHB1bGwgcmVxdWVzdCBiZWZvcmUg
YXMgSSB3YXMgdW5zdXJlIHdoZXRoZXIgdGhpcyBpc3N1ZSB3YXMgcmVsYXRlZCB0byB0aGUgVFBN
IEkmIzM5O20gdXNpbmcgKHdoaWNoIGRvZXNuJiMzOTt0IHNlZW0gY29tbW9ubHkgdXNlZCksIG9y
IG1vcmUgZ2VuZXJhbGx5IGFwcGxpY2FibGUuPGJyPgo8c3BhbiBjbGFzcz0iIj48YnI+CkR1bmNh
biBQYWxtZXI8YnI+ClNlbmlvciBTb2Z0d2FyZSBFbmdpbmVlciB8IEF1dG9ub21vdXMgU3lzdGVt
czxicj4KRGF0YTYxIHwgQ1NJUk88YnI+CkUgZHVuY2FuLnBhbG1lckBjc2lyby5hdTxicj4KUXVl
ZW5zbGFuZCBDZW50cmUgZm9yIEFkdmFuY2VkIFRlY2hub2xvZ2llcyAoUUNBVCksPGJyPgoxIFRl
Y2hub2xvZ3kgQ291cnQsIFB1bGxlbnZhbGUgUUxELCA0MDY5PGJyPgo8YSBocmVmPSJodHRwOi8v
d3d3LmRhdGE2MS5jc2lyby5hdSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+d3d3
LmRhdGE2MS5jc2lyby5hdTwvYT48YnI+Cjxicj4KQ1NJUk/igJlzIERpZ2l0YWwgUHJvZHVjdGl2
aXR5IGJ1c2luZXNzIHVuaXQgYW5kIE5JQ1RBIGhhdmUgam9pbmVkIGZvcmNlcyB0byBjcmVhdGUg
ZGlnaXRhbCBwb3dlcmhvdXNlIERhdGE2MTxicj4KPGJyPgo8L3NwYW4+X19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fPHdicj5fX19fX19fX19fPGJyPgpGcm9tOiBUYWRldXN6IFN0cnVrICZs
dDs8YSBocmVmPSJtYWlsdG86dGFkZXVzei5zdHJ1a0BpbnRlbC5jb20iPnRhZGV1c3ouc3RydWtA
aW50ZWwuY29tPC9hPiZndDs8YnI+ClNlbnQ6IDE5IEFwcmlsIDIwMTggMDQ6MTc8YnI+ClRvOiBQ
YWxtZXIsIER1bmNhbiAoRGF0YTYxLCBQdWxsZW52YWxlKTsgPGEgaHJlZj0ibWFpbHRvOmlhbi5q
dXN0aW4ub2xpdmVyQGdtYWlsLmNvbSI+aWFuLmp1c3Rpbi5vbGl2ZXJAZ21haWwuY29tPC9hPjsg
PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48
YnI+ClN1YmplY3Q6IFJlOiBbdHBtMl0gTlZSQU1fd3JpdGUsIEJVRkZFUl9TSVpFIGlzIDA8YnI+
CjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPjxicj4KT24gMDQvMTcvMjAxOCAw
MzoyNCBQTSwgPGEgaHJlZj0ibWFpbHRvOkR1bmNhbi5QYWxtZXJAZGF0YTYxLmNzaXJvLmF1Ij5E
dW5jYW4uUGFsbWVyQGRhdGE2MS5jc2lyby5hdTwvYT4gd3JvdGU6PGJyPgomZ3Q7IFdlIHNlZSB0
aGUgc2FtZSBiZWhhdmlvdXIgb24gYW4gSW50ZWwgTlVDNWk3LiBJIGhhdmVuJiMzOTt0IGxvb2tl
ZCBhdCB0aGUgY2FwYWJpbGl0aWVzIHJlcG9ydGVkIGJ5IHRoZSBUUE0gZGV2aWNlIG9uIHRoYXQg
cGxhdGZvcm0uIFRoZSBhdHRhY2hlZCBwYXRjaCAoc2V0dGluZyBtYXhfZGF0YV9zaXplID0gTUFY
X05WX0JVRkZFUl9TSVpFIHdoZW4gbWF4X2RhdGFfc2l6ZSBpcyByZXBvcnRlZCBhcyAwKSwgc29y
dHMgdGhlIHByb2JsZW0gb3V0Ljxicj4KJmd0Ozxicj4KPGJyPgpIaSBEdW5jYW4sPGJyPgpDb3Vs
ZCB5b3UgcGxlYXNlIHNlbmQgYSBQdWxsIFJlcXVlc3Qgd2l0aCB5b3VyIGZpeCB0byB0aGUgdG9v
bHMgcmVwby48YnI+Cjxicj4KVGhhbmtzLDxicj4KLS08YnI+ClRhZGV1c3o8YnI+Cjxicj4KPC9k
aXY+PC9kaXY+PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48YnIgY2xlYXI9ImFsbCI+PGJyPi0tIDxi
cj48ZGl2IGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiIGRhdGEtc21hcnRtYWlsPSJnbWFpbF9zaWdu
YXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0i
bHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsO2Zv
bnQtc2l6ZTpzbWFsbCI+PGI+RHIuIElhbiBPbGl2ZXI8L2I+PGJyPj09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT08YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWw7Zm9u
dC1zaXplOnNtYWxsIj5Qcml2YWN5IEVuZ2luZWVyaW5nOsKgIDxiPjwvYj48c3BhbiBzdHlsZT0i
Y29sb3I6cmdiKDE3LDE3LDE3KTtmb250LWZhbWlseTpBcmlhbCxzYW5zLXNlcmlmO2ZvbnQtc2l6
ZToxM3B4O2xpbmUtaGVpZ2h0OjE5cHgiPjxhIGhyZWY9Imh0dHA6Ly93d3cuYW1hem9uLmNvLnVr
L2RwLzE0OTc1Njk3MTAiIHRhcmdldD0iX2JsYW5rIj52aWEgQW1hem9uPC9hPjwvc3Bhbj48Yj48
YnI+VHdpdHRlcjogQGlfal9vbGl2ZXI8L2I+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+
PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+CjwvZGl2Pgo=

--===============4413739638088477208==--

