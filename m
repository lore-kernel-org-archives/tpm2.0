Content-Type: multipart/mixed; boundary="===============2187014131967848950=="
MIME-Version: 1.0
From: Moneeb Azhar <moneeb777 at hotmail.com>
Subject: Re: [tpm2] Initialization fails with error 0xb000b
Date: Wed, 28 Mar 2018 18:26:01 +0000
Message-ID: <HE1PR03MB31640CE9093A1D2A20EC560FF6A30@HE1PR03MB3164.eurprd03.prod.outlook.com>
In-Reply-To: 20180328174915.GB25666@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2187014131967848950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks a lot.


________________________________
From: Philip Tricca <philip.b.tricca(a)intel.com>
Sent: Wednesday, March 28, 2018 10:49 PM
To: Moneeb Azhar
Cc: tpm2(a)lists.01.org
Subject: Re: [tpm2] Initialization fails with error 0xb000b

Hi Moneeb,

On Wed, Mar 28, 2018 at 05:15:10PM +0000, Moneeb Azhar wrote:
> Hey,
>
> I am getting the following error on execution:
>
> ubuntu:~/Desktop$ sudo tpm2-abrmd --allow-root --tcti=3Dlibtcti-socket.so
> ** (tpm2-abrmd:36554): WARNING **: failed to dlopen library: libtcti-sock=
et.so
> ** (tpm2-abrmd:36554): CRITICAL **: TCTI initialization failed: 0xb000b
>
> Same error if i execute as tss:
>
> $ sudo -u tss tpm2-abrmd --tcti=3Dlibtcti-socket.so
> [sudo] password for wisn:
> ** (tpm2-abrmd:38290): WARNING **: failed to dlopen library: libtcti-sock=
et.so
> ** (tpm2-abrmd:38290): CRITICAL **: TCTI initialization failed: 0xb000b
>
>
> I did ldconfig after installation with no effect. I created a gist of the=
 installation steps I took, in case this helps: https://gist.github.com/mon=
eeb777/ceabfad71462d4ffc3e0c25a9da2b2ff
>
> Can someone guide me with this?

Gladly. Running as root vs running as tss user in this case shouldn't
have an impact. The daemon isn't able to open the shared object based on
the name you've provided. This library has been renamed in the tpm2-tss
repo in anticipation of our next major release. It is now called
"libtss2-tcti-mssim.so".

Dan just updated the man page for the daemon so that we're using the
right names in the examples:
https://github.com/tpm2-software/tpm2-abrmd/commit/98dd707fe58d839e2e642e2c=
9108c77e277b94f2

This of course assumes you're working off of the 'master' branch of the
repos of course.

Hope this helps,
Philip

--===============2187014131967848950==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1pc28tODg1OS0xIj4KPHN0eWxlIHR5cGU9InRleHQvY3NzIiBzdHls
ZT0iZGlzcGxheTpub25lOyI+PCEtLSBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30g
LS0+PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgaWQ9ImRpdnRhZ2RlZmF1
bHR3cmFwcGVyIiBzdHlsZT0iZm9udC1zaXplOjEycHQ7Y29sb3I6IzAwMDAwMDtmb250LWZhbWls
eTpDYWxpYnJpLEhlbHZldGljYSxzYW5zLXNlcmlmOyIgZGlyPSJsdHIiPgo8cCBzdHlsZT0ibWFy
Z2luLXRvcDowO21hcmdpbi1ib3R0b206MCI+VGhhbmtzIGEgbG90Ljxicj4KPC9wPgo8YnI+Cjxi
cj4KPGRpdiBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsiPgo8aHIgc3R5bGU9ImRpc3BsYXk6
aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4KPGRpdiBpZD0iZGl2UnBseUZ3
ZE1zZyIgZGlyPSJsdHIiPjxmb250IHN0eWxlPSJmb250LXNpemU6MTFwdCIgY29sb3I9IiMwMDAw
MDAiIGZhY2U9IkNhbGlicmksIHNhbnMtc2VyaWYiPjxiPkZyb206PC9iPiBQaGlsaXAgVHJpY2Nh
ICZsdDtwaGlsaXAuYi50cmljY2FAaW50ZWwuY29tJmd0Ozxicj4KPGI+U2VudDo8L2I+IFdlZG5l
c2RheSwgTWFyY2ggMjgsIDIwMTggMTA6NDkgUE08YnI+CjxiPlRvOjwvYj4gTW9uZWViIEF6aGFy
PGJyPgo8Yj5DYzo8L2I+IHRwbTJAbGlzdHMuMDEub3JnPGJyPgo8Yj5TdWJqZWN0OjwvYj4gUmU6
IFt0cG0yXSBJbml0aWFsaXphdGlvbiBmYWlscyB3aXRoIGVycm9yIDB4YjAwMGI8L2ZvbnQ+Cjxk
aXY+Jm5ic3A7PC9kaXY+CjwvZGl2Pgo8ZGl2IGNsYXNzPSJCb2R5RnJhZ21lbnQiPjxmb250IHNp
emU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPgo8ZGl2IGNsYXNzPSJQbGFpblRl
eHQiPkhpIE1vbmVlYiw8YnI+Cjxicj4KT24gV2VkLCBNYXIgMjgsIDIwMTggYXQgMDU6MTU6MTBQ
TSAmIzQzOzAwMDAsIE1vbmVlYiBBemhhciB3cm90ZTo8YnI+CiZndDsgSGV5LDxicj4KJmd0OyA8
YnI+CiZndDsgSSBhbSBnZXR0aW5nIHRoZSBmb2xsb3dpbmcgZXJyb3Igb24gZXhlY3V0aW9uOjxi
cj4KJmd0OyA8YnI+CiZndDsgdWJ1bnR1On4vRGVza3RvcCQgc3VkbyB0cG0yLWFicm1kIC0tYWxs
b3ctcm9vdCAtLXRjdGk9bGlidGN0aS1zb2NrZXQuc288YnI+CiZndDsgKiogKHRwbTItYWJybWQ6
MzY1NTQpOiBXQVJOSU5HICoqOiBmYWlsZWQgdG8gZGxvcGVuIGxpYnJhcnk6IGxpYnRjdGktc29j
a2V0LnNvPGJyPgomZ3Q7ICoqICh0cG0yLWFicm1kOjM2NTU0KTogQ1JJVElDQUwgKio6IFRDVEkg
aW5pdGlhbGl6YXRpb24gZmFpbGVkOiAweGIwMDBiPGJyPgomZ3Q7IDxicj4KJmd0OyBTYW1lIGVy
cm9yIGlmIGkgZXhlY3V0ZSBhcyB0c3M6PGJyPgomZ3Q7IDxicj4KJmd0OyAkIHN1ZG8gLXUgdHNz
IHRwbTItYWJybWQgLS10Y3RpPWxpYnRjdGktc29ja2V0LnNvPGJyPgomZ3Q7IFtzdWRvXSBwYXNz
d29yZCBmb3Igd2lzbjo8YnI+CiZndDsgKiogKHRwbTItYWJybWQ6MzgyOTApOiBXQVJOSU5HICoq
OiBmYWlsZWQgdG8gZGxvcGVuIGxpYnJhcnk6IGxpYnRjdGktc29ja2V0LnNvPGJyPgomZ3Q7ICoq
ICh0cG0yLWFicm1kOjM4MjkwKTogQ1JJVElDQUwgKio6IFRDVEkgaW5pdGlhbGl6YXRpb24gZmFp
bGVkOiAweGIwMDBiPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgSSBkaWQgbGRjb25maWcg
YWZ0ZXIgaW5zdGFsbGF0aW9uIHdpdGggbm8gZWZmZWN0LiBJIGNyZWF0ZWQgYSBnaXN0IG9mIHRo
ZSBpbnN0YWxsYXRpb24gc3RlcHMgSSB0b29rLCBpbiBjYXNlIHRoaXMgaGVscHM6CjxhIGhyZWY9
Imh0dHBzOi8vZ2lzdC5naXRodWIuY29tL21vbmVlYjc3Ny9jZWFiZmFkNzE0NjJkNGZmYzNlMGMy
NWE5ZGEyYjJmZiIgaWQ9IkxQbG5rNDg4NTIzIiBwcmV2aWV3cmVtb3ZlZD0idHJ1ZSI+Cmh0dHBz
Oi8vZ2lzdC5naXRodWIuY29tL21vbmVlYjc3Ny9jZWFiZmFkNzE0NjJkNGZmYzNlMGMyNWE5ZGEy
YjJmZjwvYT48YnI+CiZndDsgPGJyPgomZ3Q7IENhbiBzb21lb25lIGd1aWRlIG1lIHdpdGggdGhp
cz88YnI+Cjxicj4KR2xhZGx5LiBSdW5uaW5nIGFzIHJvb3QgdnMgcnVubmluZyBhcyB0c3MgdXNl
ciBpbiB0aGlzIGNhc2Ugc2hvdWxkbid0PGJyPgpoYXZlIGFuIGltcGFjdC4gVGhlIGRhZW1vbiBp
c24ndCBhYmxlIHRvIG9wZW4gdGhlIHNoYXJlZCBvYmplY3QgYmFzZWQgb248YnI+CnRoZSBuYW1l
IHlvdSd2ZSBwcm92aWRlZC4gVGhpcyBsaWJyYXJ5IGhhcyBiZWVuIHJlbmFtZWQgaW4gdGhlIHRw
bTItdHNzPGJyPgpyZXBvIGluIGFudGljaXBhdGlvbiBvZiBvdXIgbmV4dCBtYWpvciByZWxlYXNl
LiBJdCBpcyBub3cgY2FsbGVkPGJyPgomcXVvdDtsaWJ0c3MyLXRjdGktbXNzaW0uc28mcXVvdDsu
PGJyPgo8YnI+CkRhbiBqdXN0IHVwZGF0ZWQgdGhlIG1hbiBwYWdlIGZvciB0aGUgZGFlbW9uIHNv
IHRoYXQgd2UncmUgdXNpbmcgdGhlPGJyPgpyaWdodCBuYW1lcyBpbiB0aGUgZXhhbXBsZXM6PGJy
Pgo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLWFicm1kL2Nv
bW1pdC85OGRkNzA3ZmU1OGQ4MzllMmU2NDJlMmM5MTA4Yzc3ZTI3N2I5NGYyIiBpZD0iTFBsbms5
NTYyNjUiIHByZXZpZXdyZW1vdmVkPSJ0cnVlIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0
d2FyZS90cG0yLWFicm1kL2NvbW1pdC85OGRkNzA3ZmU1OGQ4MzllMmU2NDJlMmM5MTA4Yzc3ZTI3
N2I5NGYyPC9hPjxicj4KPGJyPgpUaGlzIG9mIGNvdXJzZSBhc3N1bWVzIHlvdSdyZSB3b3JraW5n
IG9mZiBvZiB0aGUgJ21hc3RlcicgYnJhbmNoIG9mIHRoZTxicj4KcmVwb3Mgb2YgY291cnNlLjxi
cj4KPGJyPgpIb3BlIHRoaXMgaGVscHMsPGJyPgpQaGlsaXA8YnI+CjwvZGl2Pgo8L3NwYW4+PC9m
b250PjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============2187014131967848950==--

