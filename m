Content-Type: multipart/mixed; boundary="===============6644894951413360578=="
MIME-Version: 1.0
From: Moneeb Azhar <moneeb777 at hotmail.com>
Subject: [tpm2] TCTI initialization fails with error 0xc000b
Date: Mon, 12 Feb 2018 13:43:13 +0000
Message-ID: <DBXPR03MB575910FD13B9EB07155C2BCF6F70@DBXPR03MB575.eurprd03.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6644894951413360578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to setup a TPM development environment on ubuntu16.04 by follow=
ing the installation wiki here: https://github.com/tpm2-software/tpm2-tools=
/wiki/Getting-Started#installing

Everything installs correctly but I get the following error:

$ sudo -u tss tpm2-abrmd --tcti=3Ddevice
** (tpm2-abrmd:104197): WARNING **: failed to dlopen file device: device: c=
annot open shared object file: No such file or directory
** (tpm2-abrmd:104197): CRITICAL **: TCTI initialization failed: 0xc000b

systemctl  show me the following:
$ sudo systemctl status tpm2-abrmd.service
=E2=97=8F tpm2-abrmd.service - TPM2 Access Broker and Resource Management D=
aemon
   Loaded: loaded (/lib/systemd/system/tpm2-abrmd.service; enabled; vendor =
preset: enabl
   Active: inactive (dead)

How would I go about figuring out what is wrong? I am new to this so any he=
lp would be highly appreciated.

Regards,
Moneeb

--===============6644894951413360578==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1nYjIzMTIiPgo8c3R5bGUgdHlwZT0idGV4dC9jc3MiIHN0eWxlPSJk
aXNwbGF5Om5vbmU7Ij48IS0tIFAge21hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7fSAtLT48
L3N0eWxlPgo8L2hlYWQ+Cjxib2R5IGRpcj0ibHRyIj4KPGRpdiBpZD0iZGl2dGFnZGVmYXVsdHdy
YXBwZXIiIHN0eWxlPSJmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQt
ZmFtaWx5OiBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWYsICZxdW90O0Vtb2ppRm9udCZx
dW90OywgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2pp
JnF1b3Q7LCBOb3RvQ29sb3JFbW9qaSwgJnF1b3Q7U2Vnb2UgVUkgU3ltYm9sJnF1b3Q7LCAmcXVv
dDtBbmRyb2lkIEVtb2ppJnF1b3Q7LCBFbW9qaVN5bWJvbHM7IiBkaXI9Imx0ciI+CjxwIHN0eWxl
PSJtYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowIj48c3BhbiBpZD0ibXMtcnRlcmFuZ2VwYXN0
ZS1zdGFydCI+PC9zcGFuPjxmb250IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTBw
dCI+SGksPGJyPgo8YnI+CkkgYW0gdHJ5aW5nIHRvIHNldHVwIGEgVFBNIGRldmVsb3BtZW50IGVu
dmlyb25tZW50IG9uIHVidW50dTE2LjA0IGJ5IGZvbGxvd2luZyB0aGUgaW5zdGFsbGF0aW9uIHdp
a2kgaGVyZToKPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10
b29scy93aWtpL0dldHRpbmctU3RhcnRlZCNpbnN0YWxsaW5nIiB0YXJnZXQ9Il9ibGFuayIgaWQ9
IkxQbG5rNTkxNDM5IiBwcmV2aWV3cmVtb3ZlZD0idHJ1ZSI+Cmh0dHBzOi8vZ2l0aHViLmNvbS90
cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvd2lraS9HZXR0aW5nLVN0YXJ0ZWQjaW5zdGFsbGluZzwv
YT48YnI+Cjxicj4KRXZlcnl0aGluZyBpbnN0YWxscyBjb3JyZWN0bHkgYnV0IEkgZ2V0IHRoZSBm
b2xsb3dpbmcgZXJyb3I6PGJyPgo8YnI+CiQgc3VkbyAtdSB0c3MgdHBtMi1hYnJtZCAtLXRjdGk9
ZGV2aWNlPGJyPgoqKiAodHBtMi1hYnJtZDoxMDQxOTcpOiBXQVJOSU5HICoqOiBmYWlsZWQgdG8g
ZGxvcGVuIGZpbGUgZGV2aWNlOiBkZXZpY2U6IGNhbm5vdCBvcGVuIHNoYXJlZCBvYmplY3QgZmls
ZTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTxicj4KKiogKHRwbTItYWJybWQ6MTA0MTk3KTog
Q1JJVElDQUwgKio6IFRDVEkgaW5pdGlhbGl6YXRpb24gZmFpbGVkOiAweGMwMDBiPGJyPgo8YnI+
CnN5c3RlbWN0bCZuYnNwOyBzaG93IG1lIHRoZSBmb2xsb3dpbmc6PGJyPgokIHN1ZG8gc3lzdGVt
Y3RsIHN0YXR1cyB0cG0yLWFicm1kLnNlcnZpY2U8YnI+CqHxIHRwbTItYWJybWQuc2VydmljZSAt
IFRQTTIgQWNjZXNzIEJyb2tlciBhbmQgUmVzb3VyY2UgTWFuYWdlbWVudCBEYWVtb248YnI+CiZu
YnNwOyZuYnNwOyBMb2FkZWQ6IGxvYWRlZCAoL2xpYi9zeXN0ZW1kL3N5c3RlbS90cG0yLWFicm1k
LnNlcnZpY2U7IGVuYWJsZWQ7IHZlbmRvciBwcmVzZXQ6IGVuYWJsPGJyPgombmJzcDsmbmJzcDsg
QWN0aXZlOiBpbmFjdGl2ZSAoZGVhZCk8YnI+Cjxicj4KSG93IHdvdWxkIEkgZ28gYWJvdXQgZmln
dXJpbmcgb3V0IHdoYXQgaXMgd3Jvbmc/IEkgYW0gbmV3IHRvIHRoaXMgc28gYW55IGhlbHAgd291
bGQgYmUgaGlnaGx5IGFwcHJlY2lhdGVkLgo8YnI+Cjxicj4KUmVnYXJkcyw8YnI+Ck1vbmVlYjwv
c3Bhbj48L2ZvbnQ+PHNwYW4gaWQ9Im1zLXJ0ZXJhbmdlcGFzdGUtZW5kIj48L3NwYW4+PGJyPgo8
L3A+CjwvZGl2Pgo8L2JvZHk+CjwvaHRtbD4K

--===============6644894951413360578==--

