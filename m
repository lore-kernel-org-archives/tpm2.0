Content-Type: multipart/mixed; boundary="===============1732957638629206302=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: Error on service tpm2-abrmd start
Date: Tue, 23 Feb 2021 17:13:39 -0500
Message-ID: <OF6AE6360B.876E854A-ON00258685.007702C1-85258685.007A19BF@notes.na.collabserv.com>
In-Reply-To: SN6PR11MB3437CC31669D04CF4AB1B8A3B8809@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1732957638629206302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable







From:	"Roberts, William C" <william.c.roberts(a)intel.com>
To:	Kenneth Goldman <kgoldman(a)us.ibm.com>, "tpm2(a)lists.01.org"
            <tpm2(a)lists.01.org>
Date:	02/23/2021 03:16 PM
Subject:	[EXTERNAL] [tpm2] Re: Error on service tpm2-abrmd start



ZjQcmQRYFpfptBannerEnd

   1.	Yes you can start tpme-abrmd like so:
      tpm2-abrmd --tcti=3Dmssim

      mssim will connect to the ibmtpm simulator, or you can use swtpm to
      connect to stefanberger's swtpm.

   When I try this, I get:

   # tpm2-abrmd --tcti=3Dmssim --allow-root

** (process:2552): WARNING **: 16:41:13.089: tcti_conf before: "(null)"

** (tpm2-abrmd:2552): WARNING **: 16:41:13.090: tcti_conf after: "mssim"

I don't know where tcti_conf is.  Perhaps I didn't install it.  Advice?

If you want to run as root, you can pass --allow-root, but usually you
don't need root to run the daemon. /dev/tpm0 should be labelled as user
tss2 and /dev/tpmrm0 should be user and group tss2.

   This would be step 2, but how would I do this with the 'mssim'?  FWIW,
      when I try to run as not root: I get

> tpm2-abrmd --tcti=3Dmssim

** (process:2666): WARNING **: 17:09:58.744: tcti_conf before: "(null)"

** (tpm2-abrmd:2666): WARNING **: 17:09:58.745: tcti_conf after: "mssim"

** (tpm2-abrmd:2666): CRITICAL **: 17:09:58.752: Failed to acquire DBus
name com.intel.tss2.Tabrmd. UID 1000 must be allowed to "own" this name.
Check DBus config and check that this is running as user tss or root.

I configure this so I can own the Dbus name for debugging by modyfing:
/etc/dbus-1/system.d/tpm2-abrmd.conf
to add my username to the list

   It's not obvious what 'the list' is.  Is there documentation.  I have
      xml-line text with several <policy> items.

   2.	Not sure about 2, how do you not have tpm2-abrmd and get the results
      from 1?
   3.	for tpm2-tools, you can pass the --tcti option, just like for
      tpm2-abrmd
      for tss2 libraries:
         SAPI: you need to pass a TCTI_CONTEXT *, which you can get via the
      TCTI_LDR API:

      https://github.com/tpm2-software/tpm2-tss/blob/master/include/tss2/ts=
s2_tctildr.h#L25

            That API takes those --tcti=3D<string> values.
         ESAPI: Just send NULL as the TCTI_CONTEXT, it will fall back using
      TCTI Ldr API which has a search routine built into it.
         FAPI: Its configured in the config file, but I think defaults to
      searching around.

   That would be step 3.  Do I have to be concerned with TCTI_LDR if I'm
      just using the command line tools?  I was hoping for just:

setenv TPM2TOOLS_TCTI "mssim:host=3Dlocalhost,port=3D2321"




--===============1732957638629206302==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PGZvbnQgc2l6ZT0iMiI+PGJyPjwvZm9udD48YnI+PGJyPjxpbWcgd2lk
dGg9IjE2IiBoZWlnaHQ9IjE2IiBzcmM9ImNpZDoxX189OEZCQjBDMTZERkU0ODQ1MThmOWU4YTkz
ZGY5Mzg2OTA5MThjOEZCQCIgYm9yZGVyPSIwIiBhbHQ9IkluYWN0aXZlIGhpZGUgZGV0YWlscyBm
b3IgJnF1b3Q7Um9iZXJ0cywgV2lsbGlhbSBDJnF1b3Q7IC0tLTAyLzIzLzIwMjEgMDM6MTY6Mzkg
UE0tLS0gIDEuICBZZXMgeW91IGNhbiBzdGFydCB0cG1lLWFicm1kIGxpa2Ugc286IHRwbTItYWJy
Ij48Zm9udCBzaXplPSIyIiBjb2xvcj0iIzQyNDI4MiI+JnF1b3Q7Um9iZXJ0cywgV2lsbGlhbSBD
JnF1b3Q7IC0tLTAyLzIzLzIwMjEgMDM6MTY6MzkgUE0tLS0gIDEuICBZZXMgeW91IGNhbiBzdGFy
dCB0cG1lLWFicm1kIGxpa2Ugc286IHRwbTItYWJybWQgLS10Y3RpPW1zc2ltPC9mb250Pjxicj48
YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPkZyb206ICAgICAgICA8L2ZvbnQ+PGZv
bnQgc2l6ZT0iMiI+JnF1b3Q7Um9iZXJ0cywgV2lsbGlhbSBDJnF1b3Q7ICZsdDt3aWxsaWFtLmMu
cm9iZXJ0c0BpbnRlbC5jb20mZ3Q7PC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBjb2xvcj0iIzVG
NUY1RiI+VG86ICAgICAgICA8L2ZvbnQ+PGZvbnQgc2l6ZT0iMiI+S2VubmV0aCBHb2xkbWFuICZs
dDtrZ29sZG1hbkB1cy5pYm0uY29tJmd0OywgJnF1b3Q7dHBtMkBsaXN0cy4wMS5vcmcmcXVvdDsg
Jmx0O3RwbTJAbGlzdHMuMDEub3JnJmd0OzwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9
IiM1RjVGNUYiPkRhdGU6ICAgICAgICA8L2ZvbnQ+PGZvbnQgc2l6ZT0iMiI+MDIvMjMvMjAyMSAw
MzoxNiBQTTwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPlN1YmplY3Q6
ICAgICAgICA8L2ZvbnQ+PGZvbnQgc2l6ZT0iMiI+W0VYVEVSTkFMXSBbdHBtMl0gUmU6IEVycm9y
IG9uIHNlcnZpY2UgdHBtMi1hYnJtZCBzdGFydDwvZm9udD48YnI+PGhyIHdpZHRoPSIxMDAlIiBz
aXplPSIyIiBhbGlnbj0ibGVmdCIgbm9zaGFkZSBzdHlsZT0iY29sb3I6IzgwOTFBNTsgIj48YnI+
PGJyPjxicj48Zm9udCBzaXplPSIxIiBjb2xvcj0iI0ZGRkZGRiI+WmpRY21RUllGcGZwdEJhbm5l
ckVuZDwvZm9udD48YnI+Cjx1bD48Zm9udCBzaXplPSIyIj4xLiAgICAgICAgPC9mb250Pjxmb250
IGZhY2U9IkNhbGlicmkiPlllcyB5b3UgY2FuIHN0YXJ0IHRwbWUtYWJybWQgbGlrZSBzbzo8YnI+
dHBtMi1hYnJtZCAtLXRjdGk9bXNzaW08YnI+PGJyPm1zc2ltIHdpbGwgY29ubmVjdCB0byB0aGUg
aWJtdHBtIHNpbXVsYXRvciwgb3IgeW91IGNhbiB1c2Ugc3d0cG0gdG8gY29ubmVjdCB0byBzdGVm
YW5iZXJnZXIncyBzd3RwbS48L2ZvbnQ+PGJyPjxicj48Yj48Zm9udCBjb2xvcj0iIzAwOUY4MiI+
V2hlbiBJIHRyeSB0aGlzLCBJIGdldDo8L2ZvbnQ+PC9iPjxicj48YnI+PGI+PGZvbnQgY29sb3I9
IiMwMDlGODIiPiM8L2ZvbnQ+PC9iPjxiPjxmb250IGNvbG9yPSIjM0Y4MDNGIiBmYWNlPSJDYWxp
YnJpIj4gdHBtMi1hYnJtZCAtLXRjdGk9bXNzaW0gLS1hbGxvdy1yb290PC9mb250PjwvYj48L3Vs
Pjxicj48Yj48Zm9udCBjb2xvcj0iIzNGODAzRiIgZmFjZT0iQ2FsaWJyaSI+KiogKHByb2Nlc3M6
MjU1Mik6IFdBUk5JTkcgKio6IDE2OjQxOjEzLjA4OTogdGN0aV9jb25mIGJlZm9yZTogJnF1b3Q7
KG51bGwpJnF1b3Q7PC9mb250PjwvYj48YnI+PGJyPjxiPjxmb250IGNvbG9yPSIjM0Y4MDNGIiBm
YWNlPSJDYWxpYnJpIj4qKiAodHBtMi1hYnJtZDoyNTUyKTogV0FSTklORyAqKjogMTY6NDE6MTMu
MDkwOiB0Y3RpX2NvbmYgYWZ0ZXI6ICZxdW90O21zc2ltJnF1b3Q7PC9mb250PjwvYj48YnI+PGJy
PjxiPjxmb250IGNvbG9yPSIjMDA5RjgyIj5JIGRvbid0IGtub3cgd2hlcmUgdGN0aV9jb25mIGlz
LiAgUGVyaGFwcyBJIGRpZG4ndCBpbnN0YWxsIGl0LjwvZm9udD48L2I+PGI+PGZvbnQgY29sb3I9
IiMwMDlGODIiPiAgQWR2aWNlPzwvZm9udD48L2I+PGZvbnQgZmFjZT0iQ2FsaWJyaSI+PGJyPjxi
cj5JZiB5b3Ugd2FudCB0byBydW4gYXMgcm9vdCwgeW91IGNhbiBwYXNzIC0tYWxsb3ctcm9vdCwg
YnV0IHVzdWFsbHkgeW91IGRvbid0IG5lZWQgcm9vdCB0byBydW4gdGhlIGRhZW1vbi4gL2Rldi90
cG0wIHNob3VsZCBiZSBsYWJlbGxlZCBhcyB1c2VyIHRzczIgYW5kIC9kZXYvdHBtcm0wIHNob3Vs
ZCBiZSB1c2VyIGFuZCBncm91cCB0c3MyLjwvZm9udD48dWw+PGJyPjxiPjxmb250IGNvbG9yPSIj
MDA5RjgyIj5UaGlzIHdvdWxkIGJlIHN0ZXAgMiwgYnV0IGhvdyB3b3VsZCBJIGRvIHRoaXMgd2l0
aCB0aGUgJ21zc2ltJz88L2ZvbnQ+PC9iPjxiPjxmb250IGNvbG9yPSIjMDA5RjgyIj4gIEZXSVcs
IHdoZW4gSSB0cnkgdG8gcnVuIGFzIG5vdCByb290OiBJIGdldDwvZm9udD48L2I+PGJyPjwvdWw+
PGI+PGZvbnQgY29sb3I9IiMwMDlGODIiPiZndDsgdHBtMi1hYnJtZCAtLXRjdGk9bXNzaW08L2Zv
bnQ+PC9iPjxicj48YnI+PGI+PGZvbnQgY29sb3I9IiMwMDlGODIiPioqIChwcm9jZXNzOjI2NjYp
OiBXQVJOSU5HICoqOiAxNzowOTo1OC43NDQ6IHRjdGlfY29uZiBiZWZvcmU6ICZxdW90OyhudWxs
KSZxdW90OzwvZm9udD48L2I+PGJyPjxicj48Yj48Zm9udCBjb2xvcj0iIzAwOUY4MiI+KiogKHRw
bTItYWJybWQ6MjY2Nik6IFdBUk5JTkcgKio6IDE3OjA5OjU4Ljc0NTogdGN0aV9jb25mIGFmdGVy
OiAmcXVvdDttc3NpbSZxdW90OzwvZm9udD48L2I+PGJyPjxicj48Yj48Zm9udCBjb2xvcj0iIzAw
OUY4MiI+KiogKHRwbTItYWJybWQ6MjY2Nik6IENSSVRJQ0FMICoqOiAxNzowOTo1OC43NTI6IEZh
aWxlZCB0byBhY3F1aXJlIERCdXMgbmFtZSBjb20uaW50ZWwudHNzMi5UYWJybWQuIFVJRCAxMDAw
IG11c3QgYmUgYWxsb3dlZCB0byAmcXVvdDtvd24mcXVvdDsgdGhpcyBuYW1lLiBDaGVjayBEQnVz
IGNvbmZpZyBhbmQgY2hlY2sgdGhhdCB0aGlzIGlzIHJ1bm5pbmcgYXMgdXNlciB0c3Mgb3Igcm9v
dC48L2ZvbnQ+PC9iPjxmb250IGZhY2U9IkNhbGlicmkiPjxicj48YnI+SSBjb25maWd1cmUgdGhp
cyBzbyBJIGNhbiBvd24gdGhlIERidXMgbmFtZSBmb3IgZGVidWdnaW5nIGJ5IG1vZHlmaW5nOjxi
cj4vZXRjL2RidXMtMS9zeXN0ZW0uZC90cG0yLWFicm1kLmNvbmY8YnI+dG8gYWRkIG15IHVzZXJu
YW1lIHRvIHRoZSBsaXN0PC9mb250Pjx1bD48YnI+PGI+PGZvbnQgY29sb3I9IiMwMDlGODIiPkl0
J3Mgbm90IG9idmlvdXMgd2hhdCAndGhlIGxpc3QnIGlzLiAgSXMgdGhlcmUgZG9jdW1lbnRhdGlv
bi4gIEkgaGF2ZSB4bWwtbGluZSB0ZXh0IHdpdGggc2V2ZXJhbCAmbHQ7cG9saWN5Jmd0OyBpdGVt
cy48L2ZvbnQ+PC9iPjxmb250IGZhY2U9IkNhbGlicmkiPjxicj48L2ZvbnQ+PGJyPjxmb250IHNp
emU9IjIiPjIuICAgICAgICA8L2ZvbnQ+PGZvbnQgZmFjZT0iQ2FsaWJyaSI+Tm90IHN1cmUgYWJv
dXQgMiwgaG93IGRvIHlvdSBub3QgaGF2ZSB0cG0yLWFicm1kIGFuZCBnZXQgdGhlIHJlc3VsdHMg
ZnJvbSAxPzwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+My4gICAgICAgIDwvZm9udD48Zm9udCBm
YWNlPSJDYWxpYnJpIj5mb3IgdHBtMi10b29scywgeW91IGNhbiBwYXNzIHRoZSAtLXRjdGkgb3B0
aW9uLCBqdXN0IGxpa2UgZm9yIHRwbTItYWJybWQ8YnI+Zm9yIHRzczIgbGlicmFyaWVzOjxicj4g
ICBTQVBJOiB5b3UgbmVlZCB0byBwYXNzIGEgVENUSV9DT05URVhUICosIHdoaWNoIHlvdSBjYW4g
Z2V0IHZpYSB0aGUgVENUSV9MRFIgQVBJOjxicj4gICAgICA8L2ZvbnQ+PGEgaHJlZj0iaHR0cHM6
Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19naXRodWIuY29t
X3RwbTItMkRzb2Z0d2FyZV90cG0yLTJEdHNzX2Jsb2JfbWFzdGVyX2luY2x1ZGVfdHNzMl90c3My
LTVGdGN0aWxkci5oLTIzTDI1JmQ9RHdNRkF3JmM9amZfaWFTSHZKT2JUYngtc2lBMVpPZyZyPURa
Q1ZHNDNWY0w4R1RuZU1aYjhrOGxFd2ItTzFHWmt0RmZyZTEtbWxtaUEmbT05NW1yMmxvUHNBbHB3
bkJNRnk3OWVEckt2TWx5TWVRU0pibHNRTVI1dHNFJnM9aHRsQjlIRHM5anBLR3JKX1RGTjhCYjlP
allGT0hvcUFFREJyalMzbThVUSZlPSI+PHU+PGZvbnQgY29sb3I9IiMwMDAwRkYiIGZhY2U9IkNh
bGlicmkiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzL2Jsb2IvbWFz
dGVyL2luY2x1ZGUvdHNzMi90c3MyX3RjdGlsZHIuaCNMMjU8L2ZvbnQ+PC91PjwvYT48Zm9udCBm
YWNlPSJDYWxpYnJpIj48YnI+ICAgICAgVGhhdCBBUEkgdGFrZXMgdGhvc2UgLS10Y3RpPSZsdDtz
dHJpbmcmZ3Q7IHZhbHVlcy48YnI+ICAgRVNBUEk6IEp1c3Qgc2VuZCBOVUxMIGFzIHRoZSBUQ1RJ
X0NPTlRFWFQsIGl0IHdpbGwgZmFsbCBiYWNrIHVzaW5nIFRDVEkgTGRyIEFQSSB3aGljaCBoYXMg
YSBzZWFyY2ggcm91dGluZSBidWlsdCBpbnRvIGl0Ljxicj4gICBGQVBJOiBJdHMgY29uZmlndXJl
ZCBpbiB0aGUgY29uZmlnIGZpbGUsIGJ1dCBJIHRoaW5rIGRlZmF1bHRzIHRvIHNlYXJjaGluZyBh
cm91bmQuPC9mb250Pjxicj48YnI+PGI+PGZvbnQgY29sb3I9IiMwMDlGODIiPlRoYXQgd291bGQg
YmUgc3RlcCAzLiAgRG8gSSBoYXZlIHRvIGJlIGNvbmNlcm5lZCB3aXRoIFRDVElfTERSIGlmIEkn
bSBqdXN0IHVzaW5nIHRoZSBjb21tYW5kIGxpbmUgdG9vbHM/ICBJIHdhcyBob3BpbmcgZm9yIGp1
c3Q6PC9mb250PjwvYj48YnI+PC91bD48Yj48Zm9udCBjb2xvcj0iIzAwOUY4MiI+c2V0ZW52IFRQ
TTJUT09MU19UQ1RJICZxdW90O21zc2ltOmhvc3Q9bG9jYWxob3N0LHBvcnQ9MjMyMSZxdW90Ozwv
Zm9udD48L2I+PGJyPjxicj48Yj48Zm9udCBmYWNlPSJDYWxpYnJpIj48YnI+PC9mb250PjwvYj48
YnI+PEJSPgo8L2JvZHk+PC9odG1sPgo=

--===============1732957638629206302==
Content-Type: image/gif
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="graycol.gif"

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7
--===============1732957638629206302==--

