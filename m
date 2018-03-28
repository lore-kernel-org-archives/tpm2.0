Content-Type: multipart/mixed; boundary="===============8477044259863305741=="
MIME-Version: 1.0
From: Moneeb Azhar <moneeb777 at hotmail.com>
Subject: [tpm2] Initialization fails with error 0xb000b
Date: Wed, 28 Mar 2018 17:15:10 +0000
Message-ID: <HE1PR03MB3164B429D84E85C20125579EF6A30@HE1PR03MB3164.eurprd03.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8477044259863305741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey,

I am getting the following error on execution:

ubuntu:~/Desktop$ sudo tpm2-abrmd --allow-root --tcti=3Dlibtcti-socket.so
** (tpm2-abrmd:36554): WARNING **: failed to dlopen library: libtcti-socket=
.so
** (tpm2-abrmd:36554): CRITICAL **: TCTI initialization failed: 0xb000b

Same error if i execute as tss:

$ sudo -u tss tpm2-abrmd --tcti=3Dlibtcti-socket.so
[sudo] password for wisn:
** (tpm2-abrmd:38290): WARNING **: failed to dlopen library: libtcti-socket=
.so
** (tpm2-abrmd:38290): CRITICAL **: TCTI initialization failed: 0xb000b


I did ldconfig after installation with no effect. I created a gist of the i=
nstallation steps I took, in case this helps: https://gist.github.com/monee=
b777/ceabfad71462d4ffc3e0c25a9da2b2ff

Can someone guide me with this?

Regards,
Moneeb

--===============8477044259863305741==
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
Z2luLXRvcDowO21hcmdpbi1ib3R0b206MCI+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMHB0OyI+SGV5LDxicj4KPGJyPgpJIGFtIGdldHRpbmcgdGhlIGZvbGxvd2luZyBl
cnJvciBvbiBleGVjdXRpb246PGJyPgo8YnI+CnVidW50dTp+L0Rlc2t0b3AkIHN1ZG8gdHBtMi1h
YnJtZCAtLWFsbG93LXJvb3QgLS10Y3RpPWxpYnRjdGktc29ja2V0LnNvPGJyPgoqKiAodHBtMi1h
YnJtZDozNjU1NCk6IFdBUk5JTkcgKio6IGZhaWxlZCB0byBkbG9wZW4gbGlicmFyeTogbGlidGN0
aS1zb2NrZXQuc288YnI+CioqICh0cG0yLWFicm1kOjM2NTU0KTogQ1JJVElDQUwgKio6IFRDVEkg
aW5pdGlhbGl6YXRpb24gZmFpbGVkOiAweGIwMDBiPGJyPgo8YnI+ClNhbWUgZXJyb3IgaWYgaSBl
eGVjdXRlIGFzIHRzczo8YnI+Cjxicj4KJCBzdWRvIC11IHRzcyB0cG0yLWFicm1kIC0tdGN0aT1s
aWJ0Y3RpLXNvY2tldC5zbzxicj4KW3N1ZG9dIHBhc3N3b3JkIGZvciB3aXNuOiA8YnI+CioqICh0
cG0yLWFicm1kOjM4MjkwKTogV0FSTklORyAqKjogZmFpbGVkIHRvIGRsb3BlbiBsaWJyYXJ5OiBs
aWJ0Y3RpLXNvY2tldC5zbzxicj4KKiogKHRwbTItYWJybWQ6MzgyOTApOiBDUklUSUNBTCAqKjog
VENUSSBpbml0aWFsaXphdGlvbiBmYWlsZWQ6IDB4YjAwMGI8YnI+Cjxicj4KPGJyPgpJIGRpZCBs
ZGNvbmZpZyBhZnRlciBpbnN0YWxsYXRpb24gd2l0aCBubyBlZmZlY3QuIEkgY3JlYXRlZCBhIGdp
c3Qgb2YgdGhlIGluc3RhbGxhdGlvbiBzdGVwcyBJIHRvb2ssIGluIGNhc2UgdGhpcyBoZWxwczoK
PGEgaHJlZj0iaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vbW9uZWViNzc3L2NlYWJmYWQ3MTQ2MmQ0
ZmZjM2UwYzI1YTlkYTJiMmZmIiB0YXJnZXQ9Il9ibGFuayIgaWQ9IkxQbG5rODQ1MDMxIiBwcmV2
aWV3cmVtb3ZlZD0idHJ1ZSI+Cmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL21vbmVlYjc3Ny9jZWFi
ZmFkNzE0NjJkNGZmYzNlMGMyNWE5ZGEyYjJmZjwvYT48YnI+Cjxicj4KQ2FuIHNvbWVvbmUgZ3Vp
ZGUgbWUgd2l0aCB0aGlzPzxicj4KPGJyPgpSZWdhcmRzLDxicj4KTW9uZWViPC9zcGFuPjwvZm9u
dD48YnI+CjwvcD4KPC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============8477044259863305741==--

