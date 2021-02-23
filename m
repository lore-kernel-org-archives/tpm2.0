Content-Type: multipart/mixed; boundary="===============3623076156254561383=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Error on service tpm2-abrmd start
Date: Tue, 23 Feb 2021 20:16:27 +0000
Message-ID: <SN6PR11MB3437CC31669D04CF4AB1B8A3B8809@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: OFFF041332.ABD619F9-ON0025867D.007F45E6-8525867D.00801DF2@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3623076156254561383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


  1.  Yes you can start tpme-abrmd like so:
tpm2-abrmd --tcti=3Dmssim

mssim will connect to the ibmtpm simulator, or you can use swtpm to connect=
 to stefanberger's swtpm.

If you want to run as root, you can pass --allow-root, but usually you don'=
t need root to run the daemon. /dev/tpm0 should be labelled as user tss2 an=
d /dev/tpmrm0 should be user and group tss2.

I configure this so I can own the Dbus name for debugging by modyfing:
/etc/dbus-1/system.d/tpm2-abrmd.conf
to add my username to the list

  2.  Not sure about 2, how do you not have tpm2-abrmd and get the results =
from 1?
  3.  for tpm2-tools, you can pass the --tcti option, just like for tpm2-ab=
rmd
for tss2 libraries:
   SAPI: you need to pass a TCTI_CONTEXT *, which you can get via the TCTI_=
LDR API:
      https://github.com/tpm2-software/tpm2-tss/blob/master/include/tss2/ts=
s2_tctildr.h#L25
      That API takes those --tcti=3D<string> values.
   ESAPI: Just send NULL as the TCTI_CONTEXT, it will fall back using TCTI =
Ldr API which has a search routine built into it.
   FAPI: Its configured in the config file, but I think defaults to searchi=
ng around.

________________________________
From: Kenneth Goldman <kgoldman(a)us.ibm.com>
Sent: Monday, February 15, 2021 5:19 PM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Error on service tpm2-abrmd start


Two questions actually, trying to run the Intel TSS with a SW TPM

1

Instructions for a project say to run
service tpm2-abrmd start
When I do that, I get

* Starting TPM2 Access Broker and Resource Management Daemon tpm2-abrmd
** (process:19039): WARNING **: 18:06:45.480: tcti_conf before: "device:/de=
v/tpm0"

** (tpm2-abrmd:19039): WARNING **: 18:06:45.488: tcti_conf after: "device:/=
dev/tpm0"
Refusing to run as root. Pass --allow-root if you know what you are doing.

This probably fails because I don't have /dev/tpm0,ight?

2

Later instructions says to

sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti=3Dmssim &

which fails because I don't have tpm2-abrmd. I did install the packages - U=
buntu 20.

3

Finally, if I'm using the SW TPM, can I simply skip the abrmd complexity an=
d somehow point the Intel TSS to the SW TPM socket.






--
Ken Goldman kgoldman(a)us.ibm.com
914-945-2415 (862-2415)


--===============3623076156254561383==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1pc28tODg1OS0xIj4KPHN0eWxlIHR5cGU9InRleHQvY3NzIiBzdHls
ZT0iZGlzcGxheTpub25lOyI+IFAge21hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7fSA8L3N0
eWxlPgo8L2hlYWQ+Cjxib2R5IGRpcj0ibHRyIj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENh
bGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPgo8YnI+CjwvZGl2Pgo8ZGl2IGlkPSJhcHBlbmRvbnNlbmQiPjwv
ZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZldGljYSxzYW5z
LXNlcmlmOyBmb250LXNpemU6MTJwdDsgY29sb3I6cmdiKDAsMCwwKSI+CjxvbD4KPGxpPjxzcGFu
PlllcyB5b3UgY2FuIHN0YXJ0IHRwbWUtYWJybWQgbGlrZSBzbzo8YnI+CnRwbTItYWJybWQgLS10
Y3RpPW1zc2ltPGJyPgo8YnI+Cm1zc2ltIHdpbGwgY29ubmVjdCB0byB0aGUgaWJtdHBtIHNpbXVs
YXRvciwgb3IgeW91IGNhbiB1c2Ugc3d0cG0gdG8gY29ubmVjdCB0byBzdGVmYW5iZXJnZXIncyBz
d3RwbS48YnI+Cjxicj4KSWYgeW91IHdhbnQgdG8gcnVuIGFzIHJvb3QsIHlvdSBjYW4gcGFzcyAt
LWFsbG93LXJvb3QsIGJ1dCB1c3VhbGx5IHlvdSBkb24ndCBuZWVkIHJvb3QgdG8gcnVuIHRoZSBk
YWVtb24uIC9kZXYvdHBtMCBzaG91bGQgYmUgbGFiZWxsZWQgYXMgdXNlciB0c3MyIGFuZCAvZGV2
L3RwbXJtMCBzaG91bGQgYmUgdXNlciBhbmQgZ3JvdXAgdHNzMi48YnI+Cjxicj4KSSBjb25maWd1
cmUgdGhpcyBzbyBJIGNhbiBvd24gdGhlIERidXMgbmFtZSBmb3IgZGVidWdnaW5nIGJ5IG1vZHlm
aW5nOjxicj4KL2V0Yy9kYnVzLTEvc3lzdGVtLmQvdHBtMi1hYnJtZC5jb25mPGJyPgp0byBhZGQg
bXkgdXNlcm5hbWUgdG8gdGhlIGxpc3Q8YnI+Cjxicj4KPC9zcGFuPjwvbGk+PGxpPjxzcGFuPk5v
dCBzdXJlIGFib3V0IDIsIGhvdyBkbyB5b3Ugbm90IGhhdmUgdHBtMi1hYnJtZCBhbmQgZ2V0IHRo
ZSByZXN1bHRzIGZyb20gMT88L3NwYW4+PC9saT48bGk+PHNwYW4+Zm9yIHRwbTItdG9vbHMsIHlv
dSBjYW4gcGFzcyB0aGUgLS10Y3RpIG9wdGlvbiwganVzdCBsaWtlIGZvciB0cG0yLWFicm1kPGJy
Pgpmb3IgdHNzMiBsaWJyYXJpZXM6PGJyPgombmJzcDsgJm5ic3A7U0FQSTogeW91IG5lZWQgdG8g
cGFzcyBhIFRDVElfQ09OVEVYVCAqLCB3aGljaCB5b3UgY2FuIGdldCB2aWEgdGhlIFRDVElfTERS
IEFQSTo8YnI+CiZuYnNwOyAmbmJzcDsgJm5ic3A7Jm5ic3A7PGEgaHJlZj0iaHR0cHM6Ly9naXRo
dWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3MvYmxvYi9tYXN0ZXIvaW5jbHVkZS90c3MyL3Rz
czJfdGN0aWxkci5oI0wyNSIgaWQ9IkxQbG5rMzg4NDcwIj5odHRwczovL2dpdGh1Yi5jb20vdHBt
Mi1zb2Z0d2FyZS90cG0yLXRzcy9ibG9iL21hc3Rlci9pbmNsdWRlL3RzczIvdHNzMl90Y3RpbGRy
LmgjTDI1PC9hPjxicj4KJm5ic3A7ICZuYnNwOyAmbmJzcDsgVGhhdCBBUEkgdGFrZXMgdGhvc2Ug
LS10Y3RpPSZsdDtzdHJpbmcmZ3Q7IHZhbHVlcy48YnI+CiZuYnNwOyAmbmJzcDtFU0FQSTogSnVz
dCBzZW5kIE5VTEwgYXMgdGhlIFRDVElfQ09OVEVYVCwgaXQgd2lsbCBmYWxsIGJhY2sgdXNpbmcg
VENUSSBMZHIgQVBJIHdoaWNoIGhhcyBhIHNlYXJjaCByb3V0aW5lIGJ1aWx0IGludG8gaXQuPGJy
PgombmJzcDsgJm5ic3A7RkFQSTogSXRzIGNvbmZpZ3VyZWQgaW4gdGhlIGNvbmZpZyBmaWxlLCBi
dXQgSSB0aGluayBkZWZhdWx0cyB0byBzZWFyY2hpbmcgYXJvdW5kLjwvc3Bhbj48L2xpPjwvb2w+
CjxkaXY+PHNwYW4+PGJyPgo8L3NwYW4+PC9kaXY+CjwvZGl2Pgo8aHIgdGFiaW5kZXg9Ii0xIiBz
dHlsZT0iZGlzcGxheTppbmxpbmUtYmxvY2s7IHdpZHRoOjk4JSI+CjxkaXYgaWQ9ImRpdlJwbHlG
d2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBjb2xvcj0i
IzAwMDAwMCIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij48Yj5Gcm9tOjwvYj4gS2VubmV0aCBHb2xk
bWFuICZsdDtrZ29sZG1hbkB1cy5pYm0uY29tJmd0Ozxicj4KPGI+U2VudDo8L2I+IE1vbmRheSwg
RmVicnVhcnkgMTUsIDIwMjEgNToxOSBQTTxicj4KPGI+VG86PC9iPiB0cG0yQGxpc3RzLjAxLm9y
ZyAmbHQ7dHBtMkBsaXN0cy4wMS5vcmcmZ3Q7PGJyPgo8Yj5TdWJqZWN0OjwvYj4gW3RwbTJdIEVy
cm9yIG9uIHNlcnZpY2UgdHBtMi1hYnJtZCBzdGFydDwvZm9udD4KPGRpdj4mbmJzcDs8L2Rpdj4K
PC9kaXY+CjxkaXY+CjxwPjxmb250IGZhY2U9IkFyaWFsIj5Ud28gcXVlc3Rpb25zIGFjdHVhbGx5
LCB0cnlpbmcgdG8gcnVuIHRoZSBJbnRlbCBUU1Mgd2l0aCBhIFNXIFRQTTwvZm9udD48YnI+Cjxi
cj4KPGZvbnQgZmFjZT0iQXJpYWwiPjE8L2ZvbnQ+PGJyPgo8YnI+Cjxmb250IGZhY2U9IkFyaWFs
Ij5JbnN0cnVjdGlvbnMgZm9yIGEgcHJvamVjdCBzYXkgdG8gcnVuIDwvZm9udD48YnI+Cjxmb250
IGZhY2U9IkFyaWFsIj5zZXJ2aWNlIHRwbTItYWJybWQgc3RhcnQ8L2ZvbnQ+PGJyPgo8Zm9udCBm
YWNlPSJBcmlhbCI+V2hlbiBJIGRvIHRoYXQsIEkgZ2V0PC9mb250Pjxicj4KPGJyPgoqIFN0YXJ0
aW5nIFRQTTIgQWNjZXNzIEJyb2tlciBhbmQgUmVzb3VyY2UgTWFuYWdlbWVudCBEYWVtb24gdHBt
Mi1hYnJtZCA8YnI+CioqIChwcm9jZXNzOjE5MDM5KTogV0FSTklORyAqKjogMTg6MDY6NDUuNDgw
OiB0Y3RpX2NvbmYgYmVmb3JlOiAmcXVvdDtkZXZpY2U6L2Rldi90cG0wJnF1b3Q7PGJyPgo8YnI+
CioqICh0cG0yLWFicm1kOjE5MDM5KTogV0FSTklORyAqKjogMTg6MDY6NDUuNDg4OiB0Y3RpX2Nv
bmYgYWZ0ZXI6ICZxdW90O2RldmljZTovZGV2L3RwbTAmcXVvdDs8YnI+ClJlZnVzaW5nIHRvIHJ1
biBhcyByb290LiBQYXNzIC0tYWxsb3ctcm9vdCBpZiB5b3Uga25vdyB3aGF0IHlvdSBhcmUgZG9p
bmcuPGJyPgo8YnI+ClRoaXMgcHJvYmFibHkgZmFpbHMgYmVjYXVzZSBJIGRvbid0IGhhdmUgL2Rl
di90cG0wLGlnaHQ/PGJyPgo8YnI+CjI8YnI+Cjxicj4KTGF0ZXIgaW5zdHJ1Y3Rpb25zIHNheXMg
dG8gPGJyPgo8YnI+CnN1ZG8gLXUgdHNzIC91c3IvbG9jYWwvc2Jpbi90cG0yLWFicm1kIC0tdGN0
aT1tc3NpbSAmYW1wOzxicj4KPGJyPgp3aGljaCBmYWlscyBiZWNhdXNlIEkgZG9uJ3QgaGF2ZSB0
cG0yLWFicm1kLiBJIGRpZCBpbnN0YWxsIHRoZSBwYWNrYWdlcyAtIFVidW50dSAyMC48YnI+Cjxi
cj4KMzxicj4KPGJyPgpGaW5hbGx5LCBpZiBJJ20gdXNpbmcgdGhlIFNXIFRQTSwgY2FuIEkgc2lt
cGx5IHNraXAgdGhlIGFicm1kIGNvbXBsZXhpdHkgYW5kIHNvbWVob3cgcG9pbnQgdGhlIEludGVs
IFRTUyB0byB0aGUgU1cgVFBNIHNvY2tldC48YnI+Cjxicj4KPGJyPgo8YnI+Cjxicj4KPGJyPgo8
YnI+Ci0tPGZvbnQgc2l6ZT0iMiI+PGJyPgpLZW4gR29sZG1hbiBrZ29sZG1hbkB1cy5pYm0uY29t
IDxicj4KOTE0LTk0NS0yNDE1ICg4NjItMjQxNSk8YnI+CjwvZm9udD48YnI+CjwvcD4KPC9kaXY+
CjwvYm9keT4KPC9odG1sPgo=

--===============3623076156254561383==--

