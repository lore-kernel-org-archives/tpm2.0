Content-Type: multipart/mixed; boundary="===============3797995099401759393=="
MIME-Version: 1.0
From: Duc Duong <duc.duong at non.keysight.com>
Subject: [tpm2] Re: Need some suggestions about tpm2-tss in Windows
Date: Fri, 14 Aug 2020 14:29:52 +0000
Message-ID: <
 <SN6PR17MB2367DB41C71AB2D4DB33305CC9400@SN6PR17MB2367.namprd17.prod.outlook.com>>
In-Reply-To: 2e786a10-2e78-519a-c339-06b1777734a4@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3797995099401759393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Steffen,

Thanks for your replay!

We have already tried with certreq tools, but I'd like higher level of auto=
mation. That's why we are seeking some program based approach.

Thanks,

Paul
________________________________
From: Steffen Schwebel <s.schwebel(a)uvensys.de>
Sent: Friday, August 14, 2020 3:02 AM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Re: Need some suggestions about tpm2-tss in Windows

[EXTERNAL]

Hello,

thats is not gonna work, I think.


With a standalone Windows you can use the certreq tool to generate a TPM
backed CSR.

Here is a short guide, using a virtual Smartcard. You should be able to
use TPM directly as well, but I havent used that yet.



1) Generate virtual Smartcard

tpmvscmgr.exe create /name TestVSC /pin default /adminkey random /generat

2) Create templare for certreq, save as cert-template.inf

[NewRequest]
Subject =3D "CN=3D[hostname],O=3D[Organisation],L=3D[Location],ST=3D[State]=
,C=3D[Country]"
Keylength =3D 2048
Exportable =3D FALSE
UserProtected =3D TRUE
MachineKeySet =3D FALSE
ProviderName =3D "Microsoft Base Smart Card Crypto Provider"
ProviderType =3D 1
RequestType =3D PKCS10
KeyUsage =3D 0x80

3) Create a CSR using the above template

certreq.exe -new -f .\tpm_cert.inf cert.csr

Hope that helps..


Regards,
Steffen


On 8/13/20 9:57 PM, Duc Duong wrote:
> Hi,
>
> I just start doing research in tpm-software, I had a running instance
> in Ubuntu, build and install four projects: tpm2-tss, tpm2-tss-engine,
> tpm2-tools and tpm2-abrmd
>
> For professional purposes, I'd like to use this TPM TSS to generate
> key and CSR with OpenSSL and I've already proof the concept in Ubuntu,
> but actually trying to do the same thing in Windows is the final goal.
>
> The first challenge I met is how to build tpm2-tss in Windows, other
> projects are even not VS project.
>
> I'm trying to build tpm2-tss with the environment they have tested,
> like VS 2017 + v141 clang/c2 + UCRT 10.0.16299.0.
>
> But after that, how can I install it and test it? Cause without
> tpm2-tss-engine I can not test it through command right?
>
> If it's not too tedious, please give me some suggestion, the more the
> better.
>
> Like, it there a better way to build tpm2-tss and other project in
> Windows.
>
> Thanks!
>
> Paul
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--
Steffen Schwebel
Mail: s.schwebel(a)uvensys.de
uvensys GmbH

Firmensitz und Sitz der Gesellschaft:
uvensys GmbH
Schorbachstra=C3=9Fe 11
35510 Butzbach

HRB: AG Friedberg, 7780
USt-Id: DE282879294

Gesch=C3=A4ftsf=C3=BChrer:
Dr. Thomas Licht, t.licht(a)uvensys.de
Volker Lieder, v.lieder(a)uvensys.de

Mail: info(a)uvensys.de
Internet: www.uvensys.de<http://www.uvensys.de>

Durchwahl: 06033 - 18 19 225
Hotline: 06033 - 18 19 288
Zentrale: 06033 - 18 19 20
Fax: 06033 - 18 19 299
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

Jegliche Stellungnahmen und Meinungen dieser E-Mail sind
alleine die des Autors und nicht notwendigerweise die der
Firma. Falls erforderlich, k=C3=B6nnen Sie eine gesonderte
schriftliche Best=C3=A4tigung anfordern.

Any views or opinions presented in this email are solely
those of the author and do not necessarily represent those
of the company. If verification is required please request
a hard-copy version.



--===============3797995099401759393==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1pc28tODg1OS0xIj4KPHN0eWxlIHR5cGU9InRleHQvY3NzIiBzdHls
ZT0iZGlzcGxheTpub25lOyI+IFAge21hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7fSA8L3N0
eWxlPgo8L2hlYWQ+Cjxib2R5IGRpcj0ibHRyIj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENh
bGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPgpIaSBTdGVmZmVuLDwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZh
bWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+Cjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQt
ZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6
IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KVGhhbmtzIGZvciB5b3VyIHJlcGxheSE8L2Rp
dj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNh
bnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgo8YnI+Cjwv
ZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwg
c2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+CldlIGhh
dmUgYWxyZWFkeSB0cmllZCB3aXRoIGNlcnRyZXEgdG9vbHMsIGJ1dCBJJ2QgbGlrZSBoaWdoZXIg
bGV2ZWwgb2YgYXV0b21hdGlvbi4gVGhhdCdzIHdoeSB3ZSBhcmUgc2Vla2luZyBzb21lIHByb2dy
YW0gYmFzZWQgYXBwcm9hY2guPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJp
LCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij4KPGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGli
cmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6
IHJnYigwLCAwLCAwKTsiPgpUaGFua3MsPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBD
YWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij4KPGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPgpQYXVsPC9kaXY+CjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+
PC9kaXY+CjxociBzdHlsZT0iZGlzcGxheTppbmxpbmUtYmxvY2s7d2lkdGg6OTglIiB0YWJpbmRl
eD0iLTEiPgo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0iQ2Fs
aWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAwMDAwMCI+
PGI+RnJvbTo8L2I+IFN0ZWZmZW4gU2Nod2ViZWwgJmx0O3Muc2Nod2ViZWxAdXZlbnN5cy5kZSZn
dDs8YnI+CjxiPlNlbnQ6PC9iPiBGcmlkYXksIEF1Z3VzdCAxNCwgMjAyMCAzOjAyIEFNPGJyPgo8
Yj5Ubzo8L2I+IHRwbTJAbGlzdHMuMDEub3JnICZsdDt0cG0yQGxpc3RzLjAxLm9yZyZndDs8YnI+
CjxiPlN1YmplY3Q6PC9iPiBbdHBtMl0gUmU6IE5lZWQgc29tZSBzdWdnZXN0aW9ucyBhYm91dCB0
cG0yLXRzcyBpbiBXaW5kb3dzPC9mb250Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8L2Rpdj4KPGRpdiBj
bGFzcz0iQm9keUZyYWdtZW50Ij48Zm9udCBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExcHQ7Ij4KPGRpdiBjbGFzcz0iUGxhaW5UZXh0Ij5bRVhURVJOQUxdPGJyPgo8YnI+CkhlbGxv
LDxicj4KPGJyPgp0aGF0cyBpcyBub3QgZ29ubmEgd29yaywgSSB0aGluay48YnI+Cjxicj4KPGJy
PgpXaXRoIGEgc3RhbmRhbG9uZSBXaW5kb3dzIHlvdSBjYW4gdXNlIHRoZSBjZXJ0cmVxIHRvb2wg
dG8gZ2VuZXJhdGUgYSBUUE08YnI+CmJhY2tlZCBDU1IuPGJyPgo8YnI+CkhlcmUgaXMgYSBzaG9y
dCBndWlkZSwgdXNpbmcgYSB2aXJ0dWFsIFNtYXJ0Y2FyZC4gWW91IHNob3VsZCBiZSBhYmxlIHRv
PGJyPgp1c2UgVFBNIGRpcmVjdGx5IGFzIHdlbGwsIGJ1dCBJIGhhdmVudCB1c2VkIHRoYXQgeWV0
Ljxicj4KPGJyPgo8YnI+Cjxicj4KMSkgR2VuZXJhdGUgdmlydHVhbCBTbWFydGNhcmQ8YnI+Cjxi
cj4KdHBtdnNjbWdyLmV4ZSBjcmVhdGUgL25hbWUgVGVzdFZTQyAvcGluIGRlZmF1bHQgL2FkbWlu
a2V5IHJhbmRvbSAvZ2VuZXJhdDxicj4KPGJyPgoyKSBDcmVhdGUgdGVtcGxhcmUgZm9yIGNlcnRy
ZXEsIHNhdmUgYXMgY2VydC10ZW1wbGF0ZS5pbmY8YnI+Cjxicj4KW05ld1JlcXVlc3RdPGJyPgpT
dWJqZWN0ID0gJnF1b3Q7Q049W2hvc3RuYW1lXSxPPVtPcmdhbmlzYXRpb25dLEw9W0xvY2F0aW9u
XSxTVD1bU3RhdGVdLEM9W0NvdW50cnldJnF1b3Q7PGJyPgpLZXlsZW5ndGggPSAyMDQ4PGJyPgpF
eHBvcnRhYmxlID0gRkFMU0U8YnI+ClVzZXJQcm90ZWN0ZWQgPSBUUlVFPGJyPgpNYWNoaW5lS2V5
U2V0ID0gRkFMU0U8YnI+ClByb3ZpZGVyTmFtZSA9ICZxdW90O01pY3Jvc29mdCBCYXNlIFNtYXJ0
IENhcmQgQ3J5cHRvIFByb3ZpZGVyJnF1b3Q7PGJyPgpQcm92aWRlclR5cGUgPSAxPGJyPgpSZXF1
ZXN0VHlwZSA9IFBLQ1MxMDxicj4KS2V5VXNhZ2UgPSAweDgwPGJyPgo8YnI+CjMpIENyZWF0ZSBh
IENTUiB1c2luZyB0aGUgYWJvdmUgdGVtcGxhdGU8YnI+Cjxicj4KY2VydHJlcS5leGUgLW5ldyAt
ZiAuXHRwbV9jZXJ0LmluZiBjZXJ0LmNzcjxicj4KPGJyPgpIb3BlIHRoYXQgaGVscHMuLjxicj4K
PGJyPgo8YnI+ClJlZ2FyZHMsPGJyPgpTdGVmZmVuPGJyPgo8YnI+Cjxicj4KT24gOC8xMy8yMCA5
OjU3IFBNLCBEdWMgRHVvbmcgd3JvdGU6PGJyPgomZ3Q7IEhpLDxicj4KJmd0Ozxicj4KJmd0OyBJ
IGp1c3Qgc3RhcnQgZG9pbmcgcmVzZWFyY2ggaW4gdHBtLXNvZnR3YXJlLCBJIGhhZCBhIHJ1bm5p
bmcgaW5zdGFuY2U8YnI+CiZndDsgaW4gVWJ1bnR1LCBidWlsZCBhbmQgaW5zdGFsbCBmb3VyIHBy
b2plY3RzOiB0cG0yLXRzcywgdHBtMi10c3MtZW5naW5lLDxicj4KJmd0OyB0cG0yLXRvb2xzIGFu
ZCB0cG0yLWFicm1kPGJyPgomZ3Q7PGJyPgomZ3Q7IEZvciBwcm9mZXNzaW9uYWwgcHVycG9zZXMs
IEknZCBsaWtlIHRvIHVzZSB0aGlzIFRQTSBUU1MgdG8gZ2VuZXJhdGU8YnI+CiZndDsga2V5IGFu
ZCBDU1Igd2l0aCBPcGVuU1NMIGFuZCBJJ3ZlIGFscmVhZHkgcHJvb2YgdGhlIGNvbmNlcHQgaW4g
VWJ1bnR1LDxicj4KJmd0OyBidXQgYWN0dWFsbHkgdHJ5aW5nIHRvIGRvIHRoZSBzYW1lIHRoaW5n
IGluIFdpbmRvd3MgaXMgdGhlIGZpbmFsIGdvYWwuPGJyPgomZ3Q7PGJyPgomZ3Q7IFRoZSBmaXJz
dCBjaGFsbGVuZ2UgSSBtZXQgaXMgaG93IHRvIGJ1aWxkIHRwbTItdHNzIGluIFdpbmRvd3MsIG90
aGVyPGJyPgomZ3Q7IHByb2plY3RzIGFyZSBldmVuIG5vdCBWUyBwcm9qZWN0Ljxicj4KJmd0Ozxi
cj4KJmd0OyBJJ20gdHJ5aW5nIHRvIGJ1aWxkIHRwbTItdHNzIHdpdGggdGhlIGVudmlyb25tZW50
IHRoZXkgaGF2ZSB0ZXN0ZWQsPGJyPgomZ3Q7IGxpa2UgVlMgMjAxNyArIHYxNDEgY2xhbmcvYzIg
KyBVQ1JUIDEwLjAuMTYyOTkuMC48YnI+CiZndDs8YnI+CiZndDsgQnV0IGFmdGVyIHRoYXQsIGhv
dyBjYW4gSSBpbnN0YWxsIGl0IGFuZCB0ZXN0IGl0PyBDYXVzZSB3aXRob3V0PGJyPgomZ3Q7IHRw
bTItdHNzLWVuZ2luZSBJIGNhbiBub3QgdGVzdCBpdCB0aHJvdWdoIGNvbW1hbmQgcmlnaHQ/PGJy
PgomZ3Q7PGJyPgomZ3Q7IElmIGl0J3Mgbm90IHRvbyB0ZWRpb3VzLCBwbGVhc2UgZ2l2ZSBtZSBz
b21lIHN1Z2dlc3Rpb24sIHRoZSBtb3JlIHRoZTxicj4KJmd0OyBiZXR0ZXIuPGJyPgomZ3Q7PGJy
PgomZ3Q7IExpa2UsIGl0IHRoZXJlIGEgYmV0dGVyIHdheSB0byBidWlsZCB0cG0yLXRzcyBhbmQg
b3RoZXIgcHJvamVjdCBpbjxicj4KJmd0OyBXaW5kb3dzLjxicj4KJmd0Ozxicj4KJmd0OyBUaGFu
a3MhPGJyPgomZ3Q7PGJyPgomZ3Q7IFBhdWw8YnI+CiZndDs8YnI+CiZndDsgX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZndDsgdHBtMiBtYWlsaW5n
IGxpc3QgLS0gdHBtMkBsaXN0cy4wMS5vcmc8YnI+CiZndDsgVG8gdW5zdWJzY3JpYmUgc2VuZCBh
biBlbWFpbCB0byB0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzxicj4KJmd0OyAlKHdlYl9wYWdlX3Vy
bClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KPGJyPgotLTxicj4K
U3RlZmZlbiBTY2h3ZWJlbDxicj4KTWFpbDogcy5zY2h3ZWJlbEB1dmVuc3lzLmRlPGJyPgp1dmVu
c3lzIEdtYkg8YnI+Cjxicj4KRmlybWVuc2l0eiB1bmQgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0Ojxi
cj4KdXZlbnN5cyBHbWJIPGJyPgpTY2hvcmJhY2hzdHJh32UgMTE8YnI+CjM1NTEwIEJ1dHpiYWNo
PGJyPgo8YnI+CkhSQjogQUcgRnJpZWRiZXJnLCA3NzgwPGJyPgpVU3QtSWQ6IERFMjgyODc5Mjk0
PGJyPgo8YnI+Ckdlc2No5GZ0c2b8aHJlcjo8YnI+CkRyLiBUaG9tYXMgTGljaHQsIHQubGljaHRA
dXZlbnN5cy5kZTxicj4KVm9sa2VyIExpZWRlciwgdi5saWVkZXJAdXZlbnN5cy5kZTxicj4KPGJy
PgpNYWlsOiBpbmZvQHV2ZW5zeXMuZGU8YnI+CkludGVybmV0OiA8YSBocmVmPSJodHRwOi8vd3d3
LnV2ZW5zeXMuZGUiPnd3dy51dmVuc3lzLmRlPC9hPjxicj4KPGJyPgpEdXJjaHdhaGw6IDA2MDMz
IC0gMTggMTkgMjI1PGJyPgpIb3RsaW5lOiAwNjAzMyAtIDE4IDE5IDI4ODxicj4KWmVudHJhbGU6
IDA2MDMzIC0gMTggMTkgMjA8YnI+CkZheDogMDYwMzMgLSAxOCAxOSAyOTk8YnI+Cj09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+Cjxi
cj4KSmVnbGljaGUgU3RlbGx1bmduYWhtZW4gdW5kIE1laW51bmdlbiBkaWVzZXIgRS1NYWlsIHNp
bmQ8YnI+CmFsbGVpbmUgZGllIGRlcyBBdXRvcnMgdW5kIG5pY2h0IG5vdHdlbmRpZ2Vyd2Vpc2Ug
ZGllIGRlcjxicj4KRmlybWEuIEZhbGxzIGVyZm9yZGVybGljaCwga/ZubmVuIFNpZSBlaW5lIGdl
c29uZGVydGU8YnI+CnNjaHJpZnRsaWNoZSBCZXN05HRpZ3VuZyBhbmZvcmRlcm4uPGJyPgo8YnI+
CkFueSB2aWV3cyBvciBvcGluaW9ucyBwcmVzZW50ZWQgaW4gdGhpcyBlbWFpbCBhcmUgc29sZWx5
PGJyPgp0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBkbyBub3QgbmVjZXNzYXJpbHkgcmVwcmVzZW50
IHRob3NlPGJyPgpvZiB0aGUgY29tcGFueS4gSWYgdmVyaWZpY2F0aW9uIGlzIHJlcXVpcmVkIHBs
ZWFzZSByZXF1ZXN0PGJyPgphIGhhcmQtY29weSB2ZXJzaW9uLjxicj4KPGJyPgo8YnI+CjwvZGl2
Pgo8L3NwYW4+PC9mb250PjwvZGl2Pgo8L2JvZHk+CjwvaHRtbD4K

--===============3797995099401759393==--

