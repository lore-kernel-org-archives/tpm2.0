Content-Type: multipart/mixed; boundary="===============2162995203622733850=="
MIME-Version: 1.0
From: Ian Oliver <ian.justin.oliver at gmail.com>
Subject: Re: [tpm2] tpm support on Intel NUCs
Date: Fri, 27 Apr 2018 07:59:49 +0300
Message-ID: <CAAxBZJs5gnVuqwqndRAuOveRvy0anazDcuqDE0d-M4TvC4_X7g@mail.gmail.com>
In-Reply-To: 1524781236924.22447@data61.csiro.au
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2162995203622733850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Duncan,

we've three NUC7i5DNKE
<https://ark.intel.com/products/122486/Intel-NUC-Kit-NUC7i5DNKE> - two
running Fedora (latest) and one with Ubuntu 17.04.  Worked for us out of
the box: had to enable TXT in the BIOS but that set everything else
necessary automatically.  SRTM measures work, DRTM with tboot does not -
tboot just hangs - still debugging this one - the ACM module seems to be
correct.

Fedora requires a kernel recompile to get SELinux and IMA/EMA running;
Ubuntu does not support IMA policies an AppArmor kernel panics.

tss/abrmd/tpm2-tools all compile with the latest releases, "master" does
not without some hacking - old libraries etc (CentOS was nigh on impossible
in this respect)

I'll check the kernel versions and tpm drivers when I get into the office,
but 4.13 (at least) for the kernal has worked for us on more or less
everything (NUC, Nokia AirFrame, Lenovo laptops).

t.

Ian

On 27 April 2018 at 01:20, <Duncan.Palmer(a)data61.csiro.au> wrote:

> Apologies if this is slightly OT for this list...
>
>
> We're running the tpm2 tools in Intel NUCs (a NUC5i7RYH to be exact),
> using Linux kernel 4.4.59 (shipped by Ubuntu as 4.4.0-77). The tpm drivers
> on this kernel don't work out of the box, and I had to put in a fairly
> nasty hack to make them work. The same driver now does not work on a newer
> NUC7i7 model. Are other people using NUCs, and if so, are you having
> similar issues?
>
>
> Cheers,
>
> Dunk
>
>
> *Duncan Palmer*
> Senior Software Engineer | Autonomous Systems
> *Data61 | CSIRO*
>
> *E* duncan.palmer(a)csiro.au
>
> Queensland Centre for Advanced Technologies (QCAT),
>
> 1 Technology Court, Pullenvale QLD, 4069
> <https://maps.google.com/?q=3D1+Technology+Court,+Pullenvale+QLD,+4069&en=
try=3Dgmail&source=3Dg>
> www.data61.csiro.au
> <http://my.csiro.au/Business-Units/Operations/Communication/CSIRO-Brandin=
g/Data61-Branding/www.data61.csiro.au>
>
>
> *CSIRO=E2=80=99s Digital Productivity business unit and NICTA have joined=
 forces
> to create digital powerhouse Data61*
>



-- =

*Dr. Ian Oliver*
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:  via Amazon <http://www.amazon.co.uk/dp/1497569710>
*Twitter: @i_j_oliver*

--===============2162995203622733850==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+SGVsbG8gRHVuY2FuLDxicj48YnI+PC9kaXY+
d2UmIzM5O3ZlIHRocmVlIAo8YSBocmVmPSJodHRwczovL2Fyay5pbnRlbC5jb20vcHJvZHVjdHMv
MTIyNDg2L0ludGVsLU5VQy1LaXQtTlVDN2k1RE5LRSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9v
cGVuZXIgbm9yZWZlcnJlciI+PHNwYW4gY2xhc3M9ImdtYWlsLWhpZ2hsaWdodCIgaWQ9ImdtYWls
LTAuMTE1NjgxMDk5MzQxMTM0NDYiIG5hbWU9InNlYXJjaEhpdEluUmVhZGluZ1BhbmUiPk5VQzwv
c3Bhbj43aTVETktFPC9hPiAtIHR3byBydW5uaW5nIEZlZG9yYSAobGF0ZXN0KSBhbmQgb25lIHdp
dGggVWJ1bnR1IDE3LjA0LsKgIFdvcmtlZCBmb3IgdXMgb3V0IG9mIHRoZSBib3g6IGhhZCB0byBl
bmFibGUgVFhUIGluIHRoZSBCSU9TIGJ1dCB0aGF0IHNldCBldmVyeXRoaW5nIGVsc2UgbmVjZXNz
YXJ5IGF1dG9tYXRpY2FsbHkuwqAgU1JUTSBtZWFzdXJlcyB3b3JrLCBEUlRNIHdpdGggdGJvb3Qg
ZG9lcyBub3QgLSB0Ym9vdCBqdXN0IGhhbmdzIC0gc3RpbGwgZGVidWdnaW5nIHRoaXMgb25lIC0g
dGhlIEFDTSBtb2R1bGUgc2VlbXMgdG8gYmUgY29ycmVjdC48YnI+PGJyPkZlZG9yYSByZXF1aXJl
cyBhIGtlcm5lbCByZWNvbXBpbGUgdG8gZ2V0IFNFTGludXggYW5kIElNQS9FTUEgcnVubmluZzvC
oCBVYnVudHUgZG9lcyBub3Qgc3VwcG9ydCBJTUEgcG9saWNpZXMgYW4gQXBwQXJtb3Iga2VybmVs
IHBhbmljcy48YnI+PGJyPgp0c3MvYWJybWQvdHBtMi10b29scyBhbGwgY29tcGlsZSB3aXRoIHRo
ZSBsYXRlc3QgcmVsZWFzZXMsICZxdW90O21hc3RlciZxdW90OyBkb2VzCiBub3Qgd2l0aG91dCBz
b21lIGhhY2tpbmcgLSBvbGQgbGlicmFyaWVzIGV0YyAoQ2VudE9TIHdhcyBuaWdoIG9uIAppbXBv
c3NpYmxlIGluIHRoaXMgcmVzcGVjdCkKCjxicj48YnI+PC9kaXY+SSYjMzk7bGwgY2hlY2sgdGhl
IGtlcm5lbCB2ZXJzaW9ucyBhbmQgdHBtIGRyaXZlcnMgd2hlbiBJIGdldCBpbnRvIHRoZSBvZmZp
Y2UsIGJ1dCA0LjEzIChhdCBsZWFzdCkgZm9yIHRoZSBrZXJuYWwgaGFzIHdvcmtlZCBmb3IgdXMg
b24gbW9yZSBvciBsZXNzIGV2ZXJ5dGhpbmcgKE5VQywgTm9raWEgQWlyRnJhbWUsIExlbm92byBs
YXB0b3BzKS48YnI+PGJyPjwvZGl2PjxkaXY+dC48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+SWFu
PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFzcz0iZ21haWxf
cXVvdGUiPk9uIDI3IEFwcmlsIDIwMTggYXQgMDE6MjAsICA8c3BhbiBkaXI9Imx0ciI+Jmx0Ozxh
IGhyZWY9Im1haWx0bzpEdW5jYW4uUGFsbWVyQGRhdGE2MS5jc2lyby5hdSIgdGFyZ2V0PSJfYmxh
bmsiPkR1bmNhbi5QYWxtZXJAZGF0YTYxLmNzaXJvLmF1PC9hPiZndDs8L3NwYW4+IHdyb3RlOjxi
cj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhl
eDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KCgoKCjxkaXYg
ZGlyPSJsdHIiIHN0eWxlPSJmb250LXNpemU6MTJwdDtjb2xvcjojMDAwMDAwO2JhY2tncm91bmQt
Y29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZldGljYSxzYW5zLXNl
cmlmIj4KPHA+QXBvbG9naWVzIGlmIHRoaXMgaXMgc2xpZ2h0bHkgT1QgZm9yIHRoaXMgbGlzdC4u
LjwvcD4KPHA+PGJyPgo8L3A+CjxwPldlJiMzOTtyZSBydW5uaW5nIHRoZSB0cG0yIHRvb2xzIGlu
IEludGVsIE5VQ3MgKGEgTlVDNWk3UllIIHRvIGJlIGV4YWN0KSwgdXNpbmcgTGludXgga2VybmVs
IDQuNC41OSAoc2hpcHBlZCBieSBVYnVudHUgYXMgNC40LjAtNzcpLiBUaGUgdHBtIGRyaXZlcnMg
b24gdGhpcyBrZXJuZWwgZG9uJiMzOTt0IHdvcmsgb3V0IG9mIHRoZSBib3gsIGFuZCBJIGhhZCB0
byBwdXQgaW4gYSBmYWlybHkgbmFzdHkgaGFjayB0byBtYWtlIHRoZW0gd29yay4gVGhlIHNhbWUK
IGRyaXZlciBub3cgZG9lcyBub3Qgd29yayBvbiBhIG5ld2VyIE5VQzdpNyBtb2RlbC4gQXJlIG90
aGVyIHBlb3BsZSB1c2luZyBOVUNzLCBhbmQgaWYgc28sIGFyZSB5b3UgaGF2aW5nIHNpbWlsYXIg
aXNzdWVzPzwvcD4KPHA+PGJyPgo8L3A+CjxwPkNoZWVycyw8L3A+CjxwPkR1bms8YnI+CjwvcD4K
PHA+PGJyPgo8L3A+CjxkaXYgaWQ9Im1fLTI5ODc0NzY3MzQ4NDYyODUzNjVTaWduYXR1cmUiPgo8
ZGl2IG5hbWU9ImRpdnRhZ2RlZmF1bHR3cmFwcGVyIj4KPHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMXB0O2ZvbnQtZmFtaWx5OmNhbGlicmk7Y29sb3I6IzJmYjc4NyI+PHN0cm9uZz5EdW5jYW4g
UGFsbWVyPC9zdHJvbmc+PC9zcGFuPjxicj4KPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo5cHQ7Zm9u
dC1mYW1pbHk6Y2FsaWJyaSI+U2VuaW9yIFNvZnR3YXJlIEVuZ2luZWVyIHwgQXV0b25vbW91cyBT
eXN0ZW1zPGJyPgo8c3Ryb25nPkRhdGE2MSB8IENTSVJPPC9zdHJvbmc+PGJyPgo8L3NwYW4+PC9w
Pgo8cCBzdHlsZT0iZm9udC1zaXplOjlwdDtmb250LWZhbWlseTpjYWxpYnJpIj48c3Ryb25nPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6OXB0O2ZvbnQtZmFtaWx5OmNhbGlicmk7Y29sb3I6IzJmYjc4
NyI+RTwvc3Bhbj48L3N0cm9uZz4gZHVuY2FuLnBhbG1lcjxzcGFuIHN0eWxlPSJmb250LXNpemU6
OXB0O2ZvbnQtZmFtaWx5OmNhbGlicmkiPkBjc2lyby5hdTwvc3Bhbj48L3A+CjxwIHN0eWxlPSJm
b250LXNpemU6OXB0O2ZvbnQtZmFtaWx5OmNhbGlicmkiPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5k
LWNvbG9yOndoaXRlIiBsYW5nPSJlbi1VUyI+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij48Zm9udCBzaXplPSIyIiBjb2xvcj0iYmxhY2si
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6OXB0Ij5RdWVlbnNsYW5kIENlbnRyZSBmb3IgQWR2YW5j
ZWQgVGVjaG5vbG9naWVzIChRQ0FUKSw8L3NwYW4+PC9mb250Pjwvc3Bhbj48L2ZvbnQ+PC9zcGFu
PjwvcD4KPHAgc3R5bGU9ImZvbnQtc2l6ZTo5cHQ7Zm9udC1mYW1pbHk6Y2FsaWJyaSI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZTo5cHQ7Zm9udC1mYW1pbHk6Y2FsaWJyaSI+PGEgaHJlZj0iaHR0cHM6
Ly9tYXBzLmdvb2dsZS5jb20vP3E9MStUZWNobm9sb2d5K0NvdXJ0LCtQdWxsZW52YWxlK1FMRCwr
NDA2OSZhbXA7ZW50cnk9Z21haWwmYW1wO3NvdXJjZT1nIj4xIFRlY2hub2xvZ3kgQ291cnQsIFB1
bGxlbnZhbGUgUUxELCA0MDY5PC9hPjxicj4KPC9zcGFuPjwvcD4KPHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZTo5cHQ7Zm9udC1mYW1pbHk6Y2FsaWJyaSI+PC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6OXB0O2ZvbnQtZmFtaWx5OmNhbGlicmkiPjxhIGhyZWY9Imh0dHA6Ly9teS5jc2lyby5hdS9C
dXNpbmVzcy1Vbml0cy9PcGVyYXRpb25zL0NvbW11bmljYXRpb24vQ1NJUk8tQnJhbmRpbmcvRGF0
YTYxLUJyYW5kaW5nL3d3dy5kYXRhNjEuY3Npcm8uYXUiIHN0eWxlPSJjb2xvcjojMmZiNzg3IiBp
ZD0ibV8tMjk4NzQ3NjczNDg0NjI4NTM2NU5vTFAiIHRhcmdldD0iX2JsYW5rIj53d3cuZGF0YTYx
LmNzaXJvLmF1PC9hPjwvc3Bhbj48YnI+CjxwIHN0eWxlPSJmb250LXNpemU6OXB0O2ZvbnQtZmFt
aWx5OmNhbGlicmkiPjxicj4KPC9wPgo8cCBzdHlsZT0iZm9udC1zaXplOjlwdDtmb250LWZhbWls
eTpjYWxpYnJpIj48Yj5DU0lST+KAmXMgRGlnaXRhbCBQcm9kdWN0aXZpdHkgYnVzaW5lc3MgdW5p
dCBhbmQgTklDVEEgaGF2ZSBqb2luZWQgZm9yY2VzIHRvIGNyZWF0ZSBkaWdpdGFsIHBvd2VyaG91
c2UgRGF0YTYxPC9iPjwvcD4KPGI+PC9iPjwvZGl2Pgo8L2Rpdj4KPC9kaXY+Cgo8L2Jsb2NrcXVv
dGU+PC9kaXY+PGJyPjxiciBjbGVhcj0iYWxsIj48YnI+LS0gPGJyPjxkaXYgY2xhc3M9ImdtYWls
X3NpZ25hdHVyZSIgZGF0YS1zbWFydG1haWw9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0
ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9
Imx0ciI+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWw7Zm9udC1zaXplOnNtYWxsIj48Yj5E
ci4gSWFuIE9saXZlcjwvYj48YnI+PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PTxicj48
L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTphcmlhbDtmb250LXNpemU6c21hbGwiPlByaXZh
Y3kgRW5naW5lZXJpbmc6wqAgPGI+PC9iPjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMTcsMTcsMTcp
O2ZvbnQtZmFtaWx5OkFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEzcHg7bGluZS1oZWlnaHQ6
MTlweCI+PGEgaHJlZj0iaHR0cDovL3d3dy5hbWF6b24uY28udWsvZHAvMTQ5NzU2OTcxMCIgdGFy
Z2V0PSJfYmxhbmsiPnZpYSBBbWF6b248L2E+PC9zcGFuPjxiPjxicj5Ud2l0dGVyOiBAaV9qX29s
aXZlcjwvYj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48
L2Rpdj4KPC9kaXY+Cg==

--===============2162995203622733850==--

