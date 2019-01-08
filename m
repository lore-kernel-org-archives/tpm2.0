Content-Type: multipart/mixed; boundary="===============8185094601976248950=="
MIME-Version: 1.0
From: Dhawale, Dinkar <dinkar.dhawale at intel.com>
Subject: Re: [tpm2] Need help in understanding tpm2_makecredential command
Date: Tue, 08 Jan 2019 09:56:03 +0000
Message-ID: <719ABFC3E12B42478A54CF74AFDB16B04C60A6@BGSMSX105.gar.corp.intel.com>
In-Reply-To: 719ABFC3E12B42478A54CF74AFDB16B04C3A5A@BGSMSX105.gar.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8185094601976248950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ Adding alias

_____________________________________________
From: Dhawale, Dinkar
Sent: Tuesday, January 8, 2019 12:13 AM
To: Roberts, William C <william.c.roberts(a)intel.com<mailto:william.c.robe=
rts(a)intel.com>>; Rawat, Arvind <arvind.rawat(a)intel.com<mailto:arvind.ra=
wat(a)intel.com>>
Cc: Ghosh, Arijit <arijit.ghosh(a)intel.com<mailto:arijit.ghosh(a)intel.com=
>>
Subject: RE: Need help in understanding tpm2_makecredential command


Hi William,

We fixed following after parsing last 256 bytes for Endorsement Key Modulus=
 from tpm2_readpublic. However, we have landed in strange issue. We have ja=
va implementation of tpm2_makecredentials in our code as it is done on Atte=
station Server (which can be installed on VM).

This implementation needed few output formatting changes as per new format =
of tpm2_activatecredentials. We did those changes and these were working fi=
ne on Purley server. However, same changes are not working on Simics server=
. Simics server crashes while activating credentials and we get following e=
xception on console,
      ASSERTION ERROR: Key is too large.
      D:\mp\builds\4653165\simics-base\src\extensions\crypto-engine\backend=
s/openssl-wrap.c:599:
      Simics core build 5189
      Module: Fri Nov 09 13:14:08 2018
      Please report this.
      #0 0x000000006a87fad0 (C:\PROGRA~1\Simics\SIMICS~1\SIMICS~1.165\win64=
\bin\libsimics-common.dll + 0x3fad0)
      The simulation state has been corrupted. Simulation cannot continue.
      Please restart Simics.

Surprisingly, we did not face this issue when we used tpm2_makecredentials =
commands itself. Could you please review our attached implementation (from =
line no 100)? and let us know if we need to make any changes with upgraded =
tpm2 tools.
 << File: Tpm2.java >>
Thanks,
-Dinkar

-----Original Message-----
From: Roberts, William C
Sent: Monday, December 31, 2018 9:01 PM
To: Rawat, Arvind <arvind.rawat(a)intel.com<mailto:arvind.rawat(a)intel.com=
>>
Cc: Dhawale, Dinkar <dinkar.dhawale(a)intel.com<mailto:dinkar.dhawale(a)int=
el.com>>; Ghosh, Arijit <arijit.ghosh(a)intel.com<mailto:arijit.ghosh(a)int=
el.com>>
Subject: RE: Need help in understanding tpm2_makecredential command

From what I understand, this TPM2_MakeCredential is a convenience function=
 that can be done externally from the TPM as described in section 24 of:
https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1-Arc=
hitecture-01.38.pdf

The only other thing I could think of making something end up at size 256 i=
s:
1. The key length of an RSA2048 key (as you pointed out, modulus size) 2. T=
he name-algorithm as part of the KDFa routine to generate the symmetric key.

We use sha256 as the default name algorithm in all places (if we don't that=
's a bug).

Bill

> -----Original Message-----
> From: Rawat, Arvind
> Sent: Friday, December 28, 2018 8:21 AM
> To: Roberts, William C <william.c.roberts(a)intel.com<mailto:william.c.ro=
berts(a)intel.com>>
> Cc: Dhawale, Dinkar <dinkar.dhawale(a)intel.com<mailto:dinkar.dhawale(a)i=
ntel.com>>; Ghosh, Arijit
> <arijit.ghosh(a)intel.com<mailto:arijit.ghosh(a)intel.com>>
> Subject: Need help in understanding tpm2_makecredential command
>
> Hi William,
>
>
>
> I was trying to code a software implementation of tpm2_makecredential
> command. From what I understood by looking at the tpm2_makecredential
> code under tpm2-tools, I think that the command is performing RSA
> encryption on random data and generating an encrypted secret along
> with a credential blob with a 8 byte header appended at the beginning.
> I tried to do the same in my software implementation as well. I am
> using the same set of input in my implementation as used by tpm2_makecred=
entail command from tpm2-tools.
>
>
>
> However, I found that the output generated from my implementation and
> tpm2- tools implementation are different. I tried comparing the hex
> bytes of the two output blobs and I found that the encrypted secret
> part is different in the two blobs. With tpm2-tools implementation, I
> am getting encrypted secret of size 256 bytes, whereas with my
> implementation, the encrypted secret size is coming as
> 316 bytes. I did some research on the RSA encryption and found that
> the encrypted secret size depends on the modulus size. If a key
> modulus is 256 bytes in size, then it will generate 256 bytes
> encrypted secret no matter what the input data size is.
>
>
>
> Based on the above research, I tried to found the modulus size of EK
> public key which is passed as an input to tpm2_makecredential command,
> and found that the modulus size is 316 bytes. Hence, I am getting
> encrypted secret of size 316 bytes with my implementation. But my
> question is, since I am passing same EK public key to tpm2-tools
> implementation as well, then how come there the encrypted secret is
> getting generated of size 256 bytes. Ideally it should also be of
> 316 bytes. Can you tell me what additional thing the tpm2-tools
> implementation of tpm2_makecredential command is doing other than RSA
> encryption that is causing the encrypted secret size to be of 256 bytes i=
nstead of 316 bytes.
>
>
>
> I am using tpm2-tools version 3.0.4 with tpm2-abrmd service.
>
>
>
> Thanks,
>
> Arvind



--===============8185094601976248950==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVu
dD0iTWljcm9zb2Z0IEV4Y2hhbmdlIFNlcnZlciI+CjwhLS0gY29udmVydGVkIGZyb20gcnRmIC0t
Pgo8c3R5bGU+PCEtLSAuRW1haWxRdW90ZSB7IG1hcmdpbi1sZWZ0OiAxcHQ7IHBhZGRpbmctbGVm
dDogNHB0OyBib3JkZXItbGVmdDogIzgwMDAwMCAycHggc29saWQ7IH0gLS0+PC9zdHlsZT4KPC9o
ZWFkPgo8Ym9keT4KPGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMXB0OyI+CjxkaXY+PGZvbnQgY29sb3I9IiMxRjQ5N0QiPiYjNDM7IEFkZGluZyBh
bGlhczwvZm9udD48L2Rpdj4KPGRpdj48Zm9udCBjb2xvcj0iIzFGNDk3RCI+Jm5ic3A7PC9mb250
PjwvZGl2Pgo8ZGl2Pl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xzxicj4KCjxiPkZyb206PC9iPiBEaGF3YWxlLCBEaW5rYXIgPGJyPgoKPGI+U2VudDo8L2I+IFR1
ZXNkYXksIEphbnVhcnkgOCwgMjAxOSAxMjoxMyBBTTxicj4KCjxiPlRvOjwvYj4gUm9iZXJ0cywg
V2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
Ij48Zm9udCBjb2xvcj0iIzA1NjNDMSI+PHU+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC91
PjwvZm9udD48L2E+Jmd0OzsgUmF3YXQsIEFydmluZCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFydmlu
ZC5yYXdhdEBpbnRlbC5jb20iPjxmb250IGNvbG9yPSIjMDU2M0MxIj48dT5hcnZpbmQucmF3YXRA
aW50ZWwuY29tPC91PjwvZm9udD48L2E+Jmd0Ozxicj4KCjxiPkNjOjwvYj4gR2hvc2gsIEFyaWpp
dCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFyaWppdC5naG9zaEBpbnRlbC5jb20iPjxmb250IGNvbG9y
PSIjMDU2M0MxIj48dT5hcmlqaXQuZ2hvc2hAaW50ZWwuY29tPC91PjwvZm9udD48L2E+Jmd0Ozxi
cj4KCjxiPlN1YmplY3Q6PC9iPiBSRTogTmVlZCBoZWxwIGluIHVuZGVyc3RhbmRpbmcgdHBtMl9t
YWtlY3JlZGVudGlhbCBjb21tYW5kPC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+CjxkaXY+Jm5ic3A7
PC9kaXY+CjxkaXY+SGkgV2lsbGlhbSw8L2Rpdj4KPGRpdj4mbmJzcDs8L2Rpdj4KPGRpdj5XZSBm
aXhlZCBmb2xsb3dpbmcgYWZ0ZXIgcGFyc2luZyBsYXN0IDI1NiBieXRlcyBmb3IgRW5kb3JzZW1l
bnQgS2V5IE1vZHVsdXMgZnJvbSB0cG0yX3JlYWRwdWJsaWMuIEhvd2V2ZXIsIHdlIGhhdmUgbGFu
ZGVkIGluIHN0cmFuZ2UgaXNzdWUuIFdlIGhhdmUgamF2YSBpbXBsZW1lbnRhdGlvbiBvZiB0cG0y
X21ha2VjcmVkZW50aWFscyBpbiBvdXIgY29kZSBhcyBpdCBpcyBkb25lIG9uIEF0dGVzdGF0aW9u
IFNlcnZlciAod2hpY2ggY2FuIGJlCmluc3RhbGxlZCBvbiBWTSkuPC9kaXY+CjxkaXY+Jm5ic3A7
PC9kaXY+CjxkaXY+VGhpcyBpbXBsZW1lbnRhdGlvbiBuZWVkZWQgZmV3IG91dHB1dCBmb3JtYXR0
aW5nIGNoYW5nZXMgYXMgcGVyIG5ldyBmb3JtYXQgb2YgdHBtMl9hY3RpdmF0ZWNyZWRlbnRpYWxz
LiBXZSBkaWQgdGhvc2UgY2hhbmdlcyBhbmQgdGhlc2Ugd2VyZSB3b3JraW5nIGZpbmUgb24gUHVy
bGV5IHNlcnZlci4gSG93ZXZlciwgc2FtZSBjaGFuZ2VzIGFyZSBub3Qgd29ya2luZyBvbiBTaW1p
Y3Mgc2VydmVyLiBTaW1pY3Mgc2VydmVyIGNyYXNoZXMgd2hpbGUKYWN0aXZhdGluZyBjcmVkZW50
aWFscyBhbmQgd2UgZ2V0IGZvbGxvd2luZyBleGNlcHRpb24gb24gY29uc29sZSw8L2Rpdj4KPGRp
diBzdHlsZT0icGFkZGluZy1sZWZ0OjM2cHQ7Ij48Zm9udCBmYWNlPSJUaW1lcyBOZXcgUm9tYW4i
PjxpPkFTU0VSVElPTiBFUlJPUjogS2V5IGlzIHRvbyBsYXJnZS48L2k+PC9mb250PjwvZGl2Pgo8
ZGl2IHN0eWxlPSJwYWRkaW5nLWxlZnQ6MzZwdDsiPjxmb250IGZhY2U9IlRpbWVzIE5ldyBSb21h
biI+PGk+RDpcbXBcYnVpbGRzXDQ2NTMxNjVcc2ltaWNzLWJhc2Vcc3JjXGV4dGVuc2lvbnNcY3J5
cHRvLWVuZ2luZVxiYWNrZW5kcy9vcGVuc3NsLXdyYXAuYzo1OTk6PC9pPjwvZm9udD48L2Rpdj4K
PGRpdiBzdHlsZT0icGFkZGluZy1sZWZ0OjM2cHQ7Ij48Zm9udCBmYWNlPSJUaW1lcyBOZXcgUm9t
YW4iPjxpPlNpbWljcyBjb3JlIGJ1aWxkIDUxODk8L2k+PC9mb250PjwvZGl2Pgo8ZGl2IHN0eWxl
PSJwYWRkaW5nLWxlZnQ6MzZwdDsiPjxmb250IGZhY2U9IlRpbWVzIE5ldyBSb21hbiI+PGk+TW9k
dWxlOiBGcmkgTm92IDA5IDEzOjE0OjA4IDIwMTg8L2k+PC9mb250PjwvZGl2Pgo8ZGl2IHN0eWxl
PSJwYWRkaW5nLWxlZnQ6MzZwdDsiPjxmb250IGZhY2U9IlRpbWVzIE5ldyBSb21hbiI+PGk+UGxl
YXNlIHJlcG9ydCB0aGlzLjwvaT48L2ZvbnQ+PC9kaXY+CjxkaXYgc3R5bGU9InBhZGRpbmctbGVm
dDozNnB0OyI+PGZvbnQgZmFjZT0iVGltZXMgTmV3IFJvbWFuIj48aT4jMCAweDAwMDAwMDAwNmE4
N2ZhZDAgKEM6XFBST0dSQX4xXFNpbWljc1xTSU1JQ1N+MVxTSU1JQ1N+MS4xNjVcd2luNjRcYmlu
XGxpYnNpbWljcy1jb21tb24uZGxsICYjNDM7IDB4M2ZhZDApPC9pPjwvZm9udD48L2Rpdj4KPGRp
diBzdHlsZT0icGFkZGluZy1sZWZ0OjM2cHQ7Ij48Zm9udCBmYWNlPSJUaW1lcyBOZXcgUm9tYW4i
PjxpPlRoZSBzaW11bGF0aW9uIHN0YXRlIGhhcyBiZWVuIGNvcnJ1cHRlZC4gU2ltdWxhdGlvbiBj
YW5ub3QgY29udGludWUuPC9pPjwvZm9udD48L2Rpdj4KPGRpdiBzdHlsZT0icGFkZGluZy1sZWZ0
OjM2cHQ7Ij48Zm9udCBmYWNlPSJUaW1lcyBOZXcgUm9tYW4iPjxpPlBsZWFzZSByZXN0YXJ0IFNp
bWljcy48L2k+PC9mb250PjwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2PlN1cnByaXNpbmds
eSwgd2UgZGlkIG5vdCBmYWNlIHRoaXMgaXNzdWUgd2hlbiB3ZSB1c2VkIHRwbTJfbWFrZWNyZWRl
bnRpYWxzIGNvbW1hbmRzIGl0c2VsZi4gQ291bGQgeW91IHBsZWFzZSByZXZpZXcgb3VyIGF0dGFj
aGVkIGltcGxlbWVudGF0aW9uIChmcm9tIGxpbmUgbm8gMTAwKT8gYW5kIGxldCB1cyBrbm93IGlm
IHdlIG5lZWQgdG8gbWFrZSBhbnkgY2hhbmdlcyB3aXRoIHVwZ3JhZGVkIHRwbTIgdG9vbHMuPC9k
aXY+CjxkaXY+ICZsdDsmbHQ7IEZpbGU6IFRwbTIuamF2YSAmZ3Q7Jmd0OyA8L2Rpdj4KPGRpdj5U
aGFua3MsPC9kaXY+CjxkaXY+LURpbmthcjwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2Pi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgoKRnJvbTogUm9iZXJ0cywgV2lsbGlhbSBDIDxi
cj4KClNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMzEsIDIwMTggOTowMSBQTTxicj4KClRvOiBSYXdh
dCwgQXJ2aW5kICZsdDs8YSBocmVmPSJtYWlsdG86YXJ2aW5kLnJhd2F0QGludGVsLmNvbSI+PGZv
bnQgY29sb3I9IiMwNTYzQzEiPjx1PmFydmluZC5yYXdhdEBpbnRlbC5jb208L3U+PC9mb250Pjwv
YT4mZ3Q7PGJyPgoKQ2M6IERoYXdhbGUsIERpbmthciAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRpbmth
ci5kaGF3YWxlQGludGVsLmNvbSI+PGZvbnQgY29sb3I9IiMwNTYzQzEiPjx1PmRpbmthci5kaGF3
YWxlQGludGVsLmNvbTwvdT48L2ZvbnQ+PC9hPiZndDs7IEdob3NoLCBBcmlqaXQgJmx0OzxhIGhy
ZWY9Im1haWx0bzphcmlqaXQuZ2hvc2hAaW50ZWwuY29tIj48Zm9udCBjb2xvcj0iIzA1NjNDMSI+
PHU+YXJpaml0Lmdob3NoQGludGVsLmNvbTwvdT48L2ZvbnQ+PC9hPiZndDs8YnI+CgpTdWJqZWN0
OiBSRTogTmVlZCBoZWxwIGluIHVuZGVyc3RhbmRpbmcgdHBtMl9tYWtlY3JlZGVudGlhbCBjb21t
YW5kPC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+CjxkaXY+RnJvbSB3aGF0IEkgdW5kZXJzdGFuZCwg
dGhpcyBUUE0yX01ha2VDcmVkZW50aWFsIGlzIGEgY29udmVuaWVuY2UgZnVuY3Rpb24gdGhhdCBj
YW4gYmUgZG9uZSBleHRlcm5hbGx5IGZyb20gdGhlIFRQTSBhcyBkZXNjcmliZWQgaW4gc2VjdGlv
biAyNCBvZjo8L2Rpdj4KPGRpdj48YSBocmVmPSJodHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91
cC5vcmcvd3AtY29udGVudC91cGxvYWRzL1RQTS1SZXYtMi4wLVBhcnQtMS1BcmNoaXRlY3R1cmUt
MDEuMzgucGRmIj5odHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91cC5vcmcvd3AtY29udGVudC91
cGxvYWRzL1RQTS1SZXYtMi4wLVBhcnQtMS1BcmNoaXRlY3R1cmUtMDEuMzgucGRmPC9hPjwvZGl2
Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2PlRoZSBvbmx5IG90aGVyIHRoaW5nIEkgY291bGQgdGhp
bmsgb2YgbWFraW5nIHNvbWV0aGluZyBlbmQgdXAgYXQgc2l6ZSAyNTYgaXM6PC9kaXY+CjxkaXY+
MS4gVGhlIGtleSBsZW5ndGggb2YgYW4gUlNBMjA0OCBrZXkgKGFzIHlvdSBwb2ludGVkIG91dCwg
bW9kdWx1cyBzaXplKSAyLiBUaGUgbmFtZS1hbGdvcml0aG0gYXMgcGFydCBvZiB0aGUgS0RGYSBy
b3V0aW5lIHRvIGdlbmVyYXRlIHRoZSBzeW1tZXRyaWMga2V5LjwvZGl2Pgo8ZGl2PiZuYnNwOzwv
ZGl2Pgo8ZGl2PldlIHVzZSBzaGEyNTYgYXMgdGhlIGRlZmF1bHQgbmFtZSBhbGdvcml0aG0gaW4g
YWxsIHBsYWNlcyAoaWYgd2UgZG9uJ3QgdGhhdCYjODIxNztzIGEgYnVnKS48L2Rpdj4KPGRpdj4m
bmJzcDs8L2Rpdj4KPGRpdj5CaWxsPC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+CjxkaXY+Jmd0OyAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTwvZGl2Pgo8ZGl2PiZndDsgRnJvbTogUmF3YXQsIEFy
dmluZDwvZGl2Pgo8ZGl2PiZndDsgU2VudDogRnJpZGF5LCBEZWNlbWJlciAyOCwgMjAxOCA4OjIx
IEFNPC9kaXY+CjxkaXY+Jmd0OyBUbzogUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJt
YWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb208L2E+Jmd0OzwvZGl2Pgo8ZGl2PiZndDsgQ2M6IERoYXdhbGUsIERpbmthciAmbHQ7PGEg
aHJlZj0ibWFpbHRvOmRpbmthci5kaGF3YWxlQGludGVsLmNvbSI+ZGlua2FyLmRoYXdhbGVAaW50
ZWwuY29tPC9hPiZndDs7IEdob3NoLCBBcmlqaXQgPC9kaXY+CjxkaXY+Jmd0OyAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOmFyaWppdC5naG9zaEBpbnRlbC5jb20iPmFyaWppdC5naG9zaEBpbnRlbC5jb208
L2E+Jmd0OzwvZGl2Pgo8ZGl2PiZndDsgU3ViamVjdDogTmVlZCBoZWxwIGluIHVuZGVyc3RhbmRp
bmcgdHBtMl9tYWtlY3JlZGVudGlhbCBjb21tYW5kPC9kaXY+CjxkaXY+Jmd0OyA8L2Rpdj4KPGRp
dj4mZ3Q7IEhpIFdpbGxpYW0sPC9kaXY+CjxkaXY+Jmd0OyA8L2Rpdj4KPGRpdj4mZ3Q7IDwvZGl2
Pgo8ZGl2PiZndDsgPC9kaXY+CjxkaXY+Jmd0OyBJIHdhcyB0cnlpbmcgdG8gY29kZSBhIHNvZnR3
YXJlIGltcGxlbWVudGF0aW9uIG9mIHRwbTJfbWFrZWNyZWRlbnRpYWwgPC9kaXY+CjxkaXY+Jmd0
OyBjb21tYW5kLiBGcm9tIHdoYXQgSSB1bmRlcnN0b29kIGJ5IGxvb2tpbmcgYXQgdGhlIHRwbTJf
bWFrZWNyZWRlbnRpYWwgPC9kaXY+CjxkaXY+Jmd0OyBjb2RlIHVuZGVyIHRwbTItdG9vbHMsIEkg
dGhpbmsgdGhhdCB0aGUgY29tbWFuZCBpcyBwZXJmb3JtaW5nIFJTQSA8L2Rpdj4KPGRpdj4mZ3Q7
IGVuY3J5cHRpb24gb24gcmFuZG9tIGRhdGEgYW5kIGdlbmVyYXRpbmcgYW4gZW5jcnlwdGVkIHNl
Y3JldCBhbG9uZyA8L2Rpdj4KPGRpdj4mZ3Q7IHdpdGggYSBjcmVkZW50aWFsIGJsb2Igd2l0aCBh
IDggYnl0ZSBoZWFkZXIgYXBwZW5kZWQgYXQgdGhlIGJlZ2lubmluZy4gPC9kaXY+CjxkaXY+Jmd0
OyBJIHRyaWVkIHRvIGRvIHRoZSBzYW1lIGluIG15IHNvZnR3YXJlIGltcGxlbWVudGF0aW9uIGFz
IHdlbGwuIEkgYW0gPC9kaXY+CjxkaXY+Jmd0OyB1c2luZyB0aGUgc2FtZSBzZXQgb2YgaW5wdXQg
aW4gbXkgaW1wbGVtZW50YXRpb24gYXMgdXNlZCBieSB0cG0yX21ha2VjcmVkZW50YWlsIGNvbW1h
bmQgZnJvbSB0cG0yLXRvb2xzLjwvZGl2Pgo8ZGl2PiZndDsgPC9kaXY+CjxkaXY+Jmd0OyA8L2Rp
dj4KPGRpdj4mZ3Q7IDwvZGl2Pgo8ZGl2PiZndDsgSG93ZXZlciwgSSBmb3VuZCB0aGF0IHRoZSBv
dXRwdXQgZ2VuZXJhdGVkIGZyb20gbXkgaW1wbGVtZW50YXRpb24gYW5kIDwvZGl2Pgo8ZGl2PiZn
dDsgdHBtMi0gdG9vbHMgaW1wbGVtZW50YXRpb24gYXJlIGRpZmZlcmVudC4gSSB0cmllZCBjb21w
YXJpbmcgdGhlIGhleCA8L2Rpdj4KPGRpdj4mZ3Q7IGJ5dGVzIG9mIHRoZSB0d28gb3V0cHV0IGJs
b2JzIGFuZCBJIGZvdW5kIHRoYXQgdGhlIGVuY3J5cHRlZCBzZWNyZXQgPC9kaXY+CjxkaXY+Jmd0
OyBwYXJ0IGlzIGRpZmZlcmVudCBpbiB0aGUgdHdvIGJsb2JzLiBXaXRoIHRwbTItdG9vbHMgaW1w
bGVtZW50YXRpb24sIEkgPC9kaXY+CjxkaXY+Jmd0OyBhbSBnZXR0aW5nIGVuY3J5cHRlZCBzZWNy
ZXQgb2Ygc2l6ZSAyNTYgYnl0ZXMsIHdoZXJlYXMgd2l0aCBteSA8L2Rpdj4KPGRpdj4mZ3Q7IGlt
cGxlbWVudGF0aW9uLCB0aGUgZW5jcnlwdGVkIHNlY3JldCBzaXplIGlzIGNvbWluZyBhczwvZGl2
Pgo8ZGl2PiZndDsgMzE2IGJ5dGVzLiBJIGRpZCBzb21lIHJlc2VhcmNoIG9uIHRoZSBSU0EgZW5j
cnlwdGlvbiBhbmQgZm91bmQgdGhhdCA8L2Rpdj4KPGRpdj4mZ3Q7IHRoZSBlbmNyeXB0ZWQgc2Vj
cmV0IHNpemUgZGVwZW5kcyBvbiB0aGUgbW9kdWx1cyBzaXplLiBJZiBhIGtleSA8L2Rpdj4KPGRp
dj4mZ3Q7IG1vZHVsdXMgaXMgMjU2IGJ5dGVzIGluIHNpemUsIHRoZW4gaXQgd2lsbCBnZW5lcmF0
ZSAyNTYgYnl0ZXMgPC9kaXY+CjxkaXY+Jmd0OyBlbmNyeXB0ZWQgc2VjcmV0IG5vIG1hdHRlciB3
aGF0IHRoZSBpbnB1dCBkYXRhIHNpemUgaXMuPC9kaXY+CjxkaXY+Jmd0OyA8L2Rpdj4KPGRpdj4m
Z3Q7IDwvZGl2Pgo8ZGl2PiZndDsgPC9kaXY+CjxkaXY+Jmd0OyBCYXNlZCBvbiB0aGUgYWJvdmUg
cmVzZWFyY2gsIEkgdHJpZWQgdG8gZm91bmQgdGhlIG1vZHVsdXMgc2l6ZSBvZiBFSyA8L2Rpdj4K
PGRpdj4mZ3Q7IHB1YmxpYyBrZXkgd2hpY2ggaXMgcGFzc2VkIGFzIGFuIGlucHV0IHRvIHRwbTJf
bWFrZWNyZWRlbnRpYWwgY29tbWFuZCwgPC9kaXY+CjxkaXY+Jmd0OyBhbmQgZm91bmQgdGhhdCB0
aGUgbW9kdWx1cyBzaXplIGlzIDMxNiBieXRlcy4gSGVuY2UsIEkgYW0gZ2V0dGluZyA8L2Rpdj4K
PGRpdj4mZ3Q7IGVuY3J5cHRlZCBzZWNyZXQgb2Ygc2l6ZSAzMTYgYnl0ZXMgd2l0aCBteSBpbXBs
ZW1lbnRhdGlvbi4gQnV0IG15IDwvZGl2Pgo8ZGl2PiZndDsgcXVlc3Rpb24gaXMsIHNpbmNlIEkg
YW0gcGFzc2luZyBzYW1lIEVLIHB1YmxpYyBrZXkgdG8gdHBtMi10b29scyA8L2Rpdj4KPGRpdj4m
Z3Q7IGltcGxlbWVudGF0aW9uIGFzIHdlbGwsIHRoZW4gaG93IGNvbWUgdGhlcmUgdGhlIGVuY3J5
cHRlZCBzZWNyZXQgaXMgPC9kaXY+CjxkaXY+Jmd0OyBnZXR0aW5nIGdlbmVyYXRlZCBvZiBzaXpl
IDI1NiBieXRlcy4gSWRlYWxseSBpdCBzaG91bGQgYWxzbyBiZSBvZjwvZGl2Pgo8ZGl2PiZndDsg
MzE2IGJ5dGVzLiBDYW4geW91IHRlbGwgbWUgd2hhdCBhZGRpdGlvbmFsIHRoaW5nIHRoZSB0cG0y
LXRvb2xzIDwvZGl2Pgo8ZGl2PiZndDsgaW1wbGVtZW50YXRpb24gb2YgdHBtMl9tYWtlY3JlZGVu
dGlhbCBjb21tYW5kIGlzIGRvaW5nIG90aGVyIHRoYW4gUlNBIDwvZGl2Pgo8ZGl2PiZndDsgZW5j
cnlwdGlvbiB0aGF0IGlzIGNhdXNpbmcgdGhlIGVuY3J5cHRlZCBzZWNyZXQgc2l6ZSB0byBiZSBv
ZiAyNTYgYnl0ZXMgaW5zdGVhZCBvZiAzMTYgYnl0ZXMuPC9kaXY+CjxkaXY+Jmd0OyA8L2Rpdj4K
PGRpdj4mZ3Q7IDwvZGl2Pgo8ZGl2PiZndDsgPC9kaXY+CjxkaXY+Jmd0OyBJIGFtIHVzaW5nIHRw
bTItdG9vbHMgdmVyc2lvbiAzLjAuNCB3aXRoIHRwbTItYWJybWQgc2VydmljZS48L2Rpdj4KPGRp
dj4mZ3Q7IDwvZGl2Pgo8ZGl2PiZndDsgPC9kaXY+CjxkaXY+Jmd0OyA8L2Rpdj4KPGRpdj4mZ3Q7
IFRoYW5rcyw8L2Rpdj4KPGRpdj4mZ3Q7IDwvZGl2Pgo8ZGl2PiZndDsgQXJ2aW5kPC9kaXY+Cjxk
aXY+Jm5ic3A7PC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+Cjwvc3Bhbj48L2ZvbnQ+CjwvYm9keT4K
PC9odG1sPgo=

--===============8185094601976248950==--

