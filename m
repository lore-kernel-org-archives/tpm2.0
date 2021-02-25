Content-Type: multipart/mixed; boundary="===============7224478616347058474=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: tpm2_abrmd: Intel tools with abrmd?
Date: Thu, 25 Feb 2021 10:49:44 -0500
Message-ID: <OFDFF483A7.B84D0416-ON00258687.0056D749-85258687.0056F3BD@notes.na.collabserv.com>
In-Reply-To: CAKrSGQRKOSgUXS=m=rvrgmA==1fx0dEZaSdjoF9SJybd3UWMNg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7224478616347058474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


No success.  I get: this.  Does anyone have any suggestions?

** (process:14075): CRITICAL **: 10:43:39.780: CreateConnection expected to
return 1 handles, received 2
WARNING:tcti:src/tss2-tcti/tctildr.c:79:tcti_from_init() TCTI init for
function 0x7f43c5d9be30 failed with a0001
WARNING:tcti:src/tss2-tcti/tctildr.c:109:tcti_from_info() Could not
initialize TCTI named: tcti-abrmd
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could not
initialize TCTI file: tabrmd
ERROR:tcti:src/tss2-tcti/tctildr.c:416:Tss2_TctiLdr_Initialize_Ex() Failed
to instantiate TCTI
ERROR: Could not load tcti, got: "tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd"



--
Ken Goldman   kgoldman(a)us.ibm.com
914-945-2415 (862-2415)




From:	Luke Hinds <lhinds(a)redhat.com>
To:	Kenneth Goldman <kgoldman(a)us.ibm.com>
Cc:	"tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
Date:	02/25/2021 01:53 AM
Subject:	[EXTERNAL] [tpm2] Re: tpm2_abrmd: Intel tools with abrmd?



On Wed, Feb 24, 2021 at 10:07 PM Kenneth Goldman <kgoldman(a)us.ibm.com>
wrote:
>
> I have the Intel tools working with no abrmd and setenv TPM2TOOLS_TCTI
"mssim:host=3Dlocalhost,port=3D2321"
>
> What would I set the env variable to for abrmd?
>
> The docs at
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.mankier.com_1_tp=
m2-5Fgetrandom&d=3DDwICAg&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3DDZCVG43VcL8GTneMZb=
8k8lEwb-O1GZktFfre1-mlmiA&m=3DNJBUN9owfy_XsKpu4QO9jmJkCDlBA8yCwq5uoPTphaA&s=
=3DAYIzTE52mbWesDI3lOHSDnHxjvgnXfMWRpkk7JthgjQ&e=3D

>
> discuss command line argument but not the env variable.
>
> 1 - Should I use bus_name or bus_type?
>
> "abrmd:bus_type=3Dsession" gives me this.
>
> ERROR: Could not load tcti, got: "abrmd:bus_type=3Dsession"
>
> 2 - bus_name requires a name. The example uses
bus_name=3Dcom.example.FooBar:
> but I doubt foobar is correct.
>
> --
> Ken Goldman kgoldman(a)us.ibm.com
> 914-945-2415 (862-2415)
>

This works for me Ken:

export TPM2TOOLS_TCTI=3D"tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd"

>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s




--===============7224478616347058474==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PGZvbnQgc2l6ZT0iMiI+Tm8gc3VjY2Vzcy4gIEkgZ2V0OiB0aGlzLiAg
RG9lcyBhbnlvbmUgaGF2ZSBhbnkgc3VnZ2VzdGlvbnM/PC9mb250Pjxicj48YnI+PGZvbnQgc2l6
ZT0iMiI+KiogKHByb2Nlc3M6MTQwNzUpOiBDUklUSUNBTCAqKjogMTA6NDM6MzkuNzgwOiBDcmVh
dGVDb25uZWN0aW9uIGV4cGVjdGVkIHRvIHJldHVybiAxIGhhbmRsZXMsIHJlY2VpdmVkIDI8L2Zv
bnQ+PGJyPjxmb250IHNpemU9IjIiPldBUk5JTkc6dGN0aTpzcmMvdHNzMi10Y3RpL3RjdGlsZHIu
Yzo3OTp0Y3RpX2Zyb21faW5pdCgpIFRDVEkgaW5pdCBmb3IgZnVuY3Rpb24gMHg3ZjQzYzVkOWJl
MzAgZmFpbGVkIHdpdGggYTAwMDEgPC9mb250Pjxicj48Zm9udCBzaXplPSIyIj5XQVJOSU5HOnRj
dGk6c3JjL3RzczItdGN0aS90Y3RpbGRyLmM6MTA5OnRjdGlfZnJvbV9pbmZvKCkgQ291bGQgbm90
IGluaXRpYWxpemUgVENUSSBuYW1lZDogdGN0aS1hYnJtZCA8L2ZvbnQ+PGJyPjxmb250IHNpemU9
IjIiPkVSUk9SOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpbGRyLWRsLmM6MTU0OnRjdGlfZnJvbV9m
aWxlKCkgQ291bGQgbm90IGluaXRpYWxpemUgVENUSSBmaWxlOiB0YWJybWQgPC9mb250Pjxicj48
Zm9udCBzaXplPSIyIj5FUlJPUjp0Y3RpOnNyYy90c3MyLXRjdGkvdGN0aWxkci5jOjQxNjpUc3My
X1RjdGlMZHJfSW5pdGlhbGl6ZV9FeCgpIEZhaWxlZCB0byBpbnN0YW50aWF0ZSBUQ1RJIDwvZm9u
dD48YnI+PGZvbnQgc2l6ZT0iMiI+RVJST1I6IENvdWxkIG5vdCBsb2FkIHRjdGksIGdvdDogJnF1
b3Q7dGFicm1kOmJ1c19uYW1lPWNvbS5pbnRlbC50c3MyLlRhYnJtZCZxdW90OzwvZm9udD48YnI+
PGJyPjxmb250IHNpemU9IjIiPjxicj48YnI+LS08YnI+S2VuIEdvbGRtYW4gICBrZ29sZG1hbkB1
cy5pYm0uY29tICAgPGJyPjkxNC05NDUtMjQxNSAoODYyLTI0MTUpPGJyPjwvZm9udD48YnI+PGJy
PjxpbWcgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2IiBzcmM9ImNpZDoxX189OEZCQjBDMTRERkM1NTFE
OThmOWU4YTkzZGY5Mzg2OTA5MThjOEZCQCIgYm9yZGVyPSIwIiBhbHQ9IkluYWN0aXZlIGhpZGUg
ZGV0YWlscyBmb3IgTHVrZSBIaW5kcyAtLS0wMi8yNS8yMDIxIDAxOjUzOjA0IEFNLS0tT24gV2Vk
LCBGZWIgMjQsIDIwMjEgYXQgMTA6MDcgUE0gS2VubmV0aCBHb2xkbWFuICZsdDtrZ29sZG1hbkB1
cy4iPjxmb250IHNpemU9IjIiIGNvbG9yPSIjNDI0MjgyIj5MdWtlIEhpbmRzIC0tLTAyLzI1LzIw
MjEgMDE6NTM6MDQgQU0tLS1PbiBXZWQsIEZlYiAyNCwgMjAyMSBhdCAxMDowNyBQTSBLZW5uZXRo
IEdvbGRtYW4gJmx0O2tnb2xkbWFuQHVzLmlibS5jb20mZ3Q7IHdyb3RlOiAmZ3Q7PC9mb250Pjxi
cj48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPkZyb206ICAgICAgICA8L2ZvbnQ+
PGZvbnQgc2l6ZT0iMiI+THVrZSBIaW5kcyAmbHQ7bGhpbmRzQHJlZGhhdC5jb20mZ3Q7PC9mb250
Pjxicj48Zm9udCBzaXplPSIyIiBjb2xvcj0iIzVGNUY1RiI+VG86ICAgICAgICA8L2ZvbnQ+PGZv
bnQgc2l6ZT0iMiI+S2VubmV0aCBHb2xkbWFuICZsdDtrZ29sZG1hbkB1cy5pYm0uY29tJmd0Ozwv
Zm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPkNjOiAgICAgICAgPC9mb250
Pjxmb250IHNpemU9IjIiPiZxdW90O3RwbTJAbGlzdHMuMDEub3JnJnF1b3Q7ICZsdDt0cG0yQGxp
c3RzLjAxLm9yZyZndDs8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGNvbG9yPSIjNUY1RjVGIj5E
YXRlOiAgICAgICAgPC9mb250Pjxmb250IHNpemU9IjIiPjAyLzI1LzIwMjEgMDE6NTMgQU08L2Zv
bnQ+PGJyPjxmb250IHNpemU9IjIiIGNvbG9yPSIjNUY1RjVGIj5TdWJqZWN0OiAgICAgICAgPC9m
b250Pjxmb250IHNpemU9IjIiPltFWFRFUk5BTF0gW3RwbTJdIFJlOiB0cG0yX2Ficm1kOiBJbnRl
bCB0b29scyB3aXRoIGFicm1kPzwvZm9udD48YnI+PGhyIHdpZHRoPSIxMDAlIiBzaXplPSIyIiBh
bGlnbj0ibGVmdCIgbm9zaGFkZSBzdHlsZT0iY29sb3I6IzgwOTFBNTsgIj48YnI+PGJyPjxicj48
dHQ+PGZvbnQgc2l6ZT0iMiI+T24gV2VkLCBGZWIgMjQsIDIwMjEgYXQgMTA6MDcgUE0gS2VubmV0
aCBHb2xkbWFuICZsdDtrZ29sZG1hbkB1cy5pYm0uY29tJmd0OyB3cm90ZTo8YnI+Jmd0Ozxicj4m
Z3Q7IEkgaGF2ZSB0aGUgSW50ZWwgdG9vbHMgd29ya2luZyB3aXRoIG5vIGFicm1kIGFuZCBzZXRl
bnYgVFBNMlRPT0xTX1RDVEkgJnF1b3Q7bXNzaW06aG9zdD1sb2NhbGhvc3QscG9ydD0yMzIxJnF1
b3Q7PGJyPiZndDs8YnI+Jmd0OyBXaGF0IHdvdWxkIEkgc2V0IHRoZSBlbnYgdmFyaWFibGUgdG8g
Zm9yIGFicm1kPzxicj4mZ3Q7PGJyPiZndDsgVGhlIGRvY3MgYXQgPC9mb250PjwvdHQ+PHR0Pjxm
b250IHNpemU9IjIiPjxhIGhyZWY9Imh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92
Mi91cmw/dT1odHRwcy0zQV9fd3d3Lm1hbmtpZXIuY29tXzFfdHBtMi01RmdldHJhbmRvbSZkPUR3
SUNBZyZjPWpmX2lhU0h2Sk9iVGJ4LXNpQTFaT2cmcj1EWkNWRzQzVmNMOEdUbmVNWmI4azhsRXdi
LU8xR1prdEZmcmUxLW1sbWlBJm09TkpCVU45b3dmeV9Yc0twdTRRTzlqbUprQ0RsQkE4eUN3cTV1
b1BUcGhhQSZzPUFZSXpURTUybWJXZXNESTNsT0hTRG5IeGp2Z25YZk1XUnBrazdKdGhnalEmZT0i
Pmh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fd3d3
Lm1hbmtpZXIuY29tXzFfdHBtMi01RmdldHJhbmRvbSZhbXA7ZD1Ed0lDQWcmYW1wO2M9amZfaWFT
SHZKT2JUYngtc2lBMVpPZyZhbXA7cj1EWkNWRzQzVmNMOEdUbmVNWmI4azhsRXdiLU8xR1prdEZm
cmUxLW1sbWlBJmFtcDttPU5KQlVOOW93ZnlfWHNLcHU0UU85am1Ka0NEbEJBOHlDd3E1dW9QVHBo
YUEmYW1wO3M9QVlJelRFNTJtYldlc0RJM2xPSFNEbkh4anZnblhmTVdScGtrN0p0aGdqUSZhbXA7
ZT08L2E+PC9mb250PjwvdHQ+PHR0Pjxmb250IHNpemU9IjIiPiZuYnNwOzxicj4mZ3Q7PGJyPiZn
dDsgZGlzY3VzcyBjb21tYW5kIGxpbmUgYXJndW1lbnQgYnV0IG5vdCB0aGUgZW52IHZhcmlhYmxl
Ljxicj4mZ3Q7PGJyPiZndDsgMSAtIFNob3VsZCBJIHVzZSBidXNfbmFtZSBvciBidXNfdHlwZT88
YnI+Jmd0Ozxicj4mZ3Q7ICZxdW90O2Ficm1kOmJ1c190eXBlPXNlc3Npb24mcXVvdDsgZ2l2ZXMg
bWUgdGhpcy48YnI+Jmd0Ozxicj4mZ3Q7IEVSUk9SOiBDb3VsZCBub3QgbG9hZCB0Y3RpLCBnb3Q6
ICZxdW90O2Ficm1kOmJ1c190eXBlPXNlc3Npb24mcXVvdDs8YnI+Jmd0Ozxicj4mZ3Q7IDIgLSBi
dXNfbmFtZSByZXF1aXJlcyBhIG5hbWUuIFRoZSBleGFtcGxlIHVzZXMgYnVzX25hbWU9Y29tLmV4
YW1wbGUuRm9vQmFyOjxicj4mZ3Q7IGJ1dCBJIGRvdWJ0IGZvb2JhciBpcyBjb3JyZWN0Ljxicj4m
Z3Q7PGJyPiZndDsgLS08YnI+Jmd0OyBLZW4gR29sZG1hbiBrZ29sZG1hbkB1cy5pYm0uY29tPGJy
PiZndDsgOTE0LTk0NS0yNDE1ICg4NjItMjQxNSk8YnI+Jmd0Ozxicj48YnI+VGhpcyB3b3JrcyBm
b3IgbWUgS2VuOjxicj48YnI+ZXhwb3J0IFRQTTJUT09MU19UQ1RJPSZxdW90O3RhYnJtZDpidXNf
bmFtZT1jb20uaW50ZWwudHNzMi5UYWJybWQmcXVvdDs8YnI+PGJyPiZndDs8YnI+Jmd0OyBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4mZ3Q7IHRwbTIg
bWFpbGluZyBsaXN0IC0tIHRwbTJAbGlzdHMuMDEub3JnPGJyPiZndDsgVG8gdW5zdWJzY3JpYmUg
c2VuZCBhbiBlbWFpbCB0byB0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzxicj4mZ3Q7ICUod2ViX3Bh
Z2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPGJyPl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPnRwbTIgbWFpbGluZyBs
aXN0IC0tIHRwbTJAbGlzdHMuMDEub3JnPGJyPlRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwg
dG8gdHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8YnI+JSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShj
Z2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+PGJyPjwvZm9udD48L3R0Pjxicj48YnI+PEJS
Pgo8L2JvZHk+PC9odG1sPgo=

--===============7224478616347058474==
Content-Type: image/gif
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="graycol.gif"

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7
--===============7224478616347058474==--

