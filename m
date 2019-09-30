Content-Type: multipart/mixed; boundary="===============0687331587187714425=="
MIME-Version: 1.0
From: Arun Sudhir <arunsudhir19 at gmail.com>
Subject: [tpm2] Error Running tpm2-tools in windows against MSSIM
Date: Mon, 30 Sep 2019 10:28:16 -0700
Message-ID: <CAJLNp_Wv6xuh-bQBa3REuzw9vD9PA_s2h+MFrk4+NWqWT6+W4g@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0687331587187714425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I have managed to compile and run the tpm simulator on Windows as well as
build tpm2-tss and build and run tpm2-tools  (after quite a bit if work) on
Windows 10.  I looked at the makefile and on windows, created a project for
every tool. IT worked well and built everything. I also got the server up
on port 2321 and set the environment variable TPM2TOOLS_TCTI to
"mssim:host=3Dlocalhost,port=3D2321"

I was following instructions listed in
https://github.com/tpm2-software/tpm2-tools/wiki/Getting-Started#introducti=
on
and
also did not build abrmd.

Since i cannot do tpm2_pcrlist (Unix system command), I decided to do a
tpm2_getrandom as listed here:
https://github.com/tpm2-software/tpm2-tools/wiki/How-to-use-tpm2-tools.

When i executed against the hardware tpm (by default it first executes
against the hardware tpm using tcti-tbs on windows), it worked well for:
*tpm2_getrandom -o random.out 20*

Next, i really wanted to try out a few things, so i set the env
variable TPM2TOOLS_TCTI to mssim:host=3D127.0.0.1,port=3D2321 ( i tried
localhost, that failed with a socket connect because it was not resolving
to 127.0.0.1). Now i get this error:

WARNING:esys:api\Esys_GetCapability.c:303:Esys_GetCapability_Finish()
Received TPM Error
ERROR:esys:api\Esys_GetCapability.c:107:Esys_GetCapability() Esys Finish
ErrorCode (0x00000100)
ERROR: Esys_GetCapability(0x100) - tpm:error(2.0): TPM not initialized by
TPM2_Startup or already initialized
ERROR: Unable to run
C:\Users\arunsu\source\repos\tpm2-tools-4.0\vstudio\x64\Debug\tpm2-getrando=
m.exe

This is only for MSSIM. Anyone knows why ??

--===============0687331587187714425==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9ImF1dG8iPkhpLDxkaXYgZGlyPSJhdXRvIj48YnI+PC9k
aXY+PGRpdiBkaXI9ImF1dG8iPkkgaGF2ZSBtYW5hZ2VkIHRvIGNvbXBpbGUgYW5kIHJ1biB0aGUg
dHBtIHNpbXVsYXRvciBvbiBXaW5kb3dzIGFzIHdlbGwgYXMgYnVpbGQgdHBtMi10c3MgYW5kICBi
dWlsZCBhbmQgcnVuIHRwbTItdG9vbHPCoAoKKGFmdGVyIHF1aXRlIGEgYml0IGlmIHdvcmspCgog
b24gV2luZG93cyAxMC7CoCBJIGxvb2tlZCBhdCB0aGUgbWFrZWZpbGUgYW5kIG9uIHdpbmRvd3Ms
IGNyZWF0ZWQgYSBwcm9qZWN0IGZvciBldmVyeSB0b29sLiBJVCB3b3JrZWQgd2VsbCBhbmQgYnVp
bHQgZXZlcnl0aGluZy4gSSBhbHNvIGdvdCB0aGUgc2VydmVyIHVwIG9uIHBvcnQgMjMyMSBhbmQg
c2V0IHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZSBUUE0yVE9PTFNfVENUSSB0byAmcXVvdDttc3Np
bTpob3N0PWxvY2FsaG9zdCxwb3J0PTIzMjEmcXVvdDs8L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJy
PjwvZGl2PjxkaXY+SSB3YXMgZm9sbG93aW5nIGluc3RydWN0aW9ucyBsaXN0ZWQgaW7CoDxhIGhy
ZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvd2lraS9HZXR0
aW5nLVN0YXJ0ZWQjaW50cm9kdWN0aW9uIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIu
Y29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy93aWtpL0dldHRpbmctU3RhcnRlZCNpbnRyb2R1
Y3Rpb248L2E+wqBhbmQgYWxzbyBkaWQgbm90IGJ1aWxkIGFicm1kLsKgPC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5TaW5jZSBpIGNhbm5vdCBkb8KgPHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29s
b3I6cmdiYSgyNywzMSwzNSwwLjA1KTtjb2xvcjpyZ2IoMzYsNDEsNDYpO2ZvbnQtZmFtaWx5OlNG
TW9uby1SZWd1bGFyLENvbnNvbGFzLCZxdW90O0xpYmVyYXRpb24gTW9ubyZxdW90OyxNZW5sbyxt
b25vc3BhY2U7Zm9udC1zaXplOjEzLjZweCI+dHBtMl9wY3JsaXN0IChVbml4IHN5c3RlbSBjb21t
YW5kKSwgSSBkZWNpZGVkIHRvIGRvIGEgdHBtMl9nZXRyYW5kb20gYXMgbGlzdGVkIGhlcmU6wqA8
L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29s
cy93aWtpL0hvdy10by11c2UtdHBtMi10b29scyIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0
aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvd2lraS9Ib3ctdG8tdXNlLXRwbTItdG9v
bHM8L2E+LsKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5XaGVuIGkgZXhlY3V0ZWQgYWdhaW5z
dCB0aGUgaGFyZHdhcmUgdHBtIChieSBkZWZhdWx0IGl0IGZpcnN0IGV4ZWN1dGVzIGFnYWluc3Qg
dGhlIGhhcmR3YXJlIHRwbSB1c2luZyB0Y3RpLXRicyBvbiB3aW5kb3dzKSwgaXQgd29ya2VkIHdl
bGwgZm9yOjwvZGl2PjxkaXY+PGk+dHBtMl9nZXRyYW5kb20gLW8gcmFuZG9tLm91dCAyMDwvaT48
YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5OZXh0LCBpIHJlYWxseSB3YW50ZWQgdG8gdHJ5
IG91dCBhIGZldyB0aGluZ3MsIHNvIGkgc2V0IHRoZSBlbnYgdmFyaWFibGXCoFRQTTJUT09MU19U
Q1RJIHRvwqBtc3NpbTpob3N0PTEyNy4wLjAuMSxwb3J0PTIzMjEgKCBpIHRyaWVkIGxvY2FsaG9z
dCwgdGhhdCBmYWlsZWQgd2l0aCBhIHNvY2tldCBjb25uZWN0IGJlY2F1c2UgaXQgd2FzIG5vdCBy
ZXNvbHZpbmcgdG8gMTI3LjAuMC4xKS4gTm93IGkgZ2V0IHRoaXMgZXJyb3I6PC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj5XQVJOSU5HOmVzeXM6YXBpXEVzeXNfR2V0Q2FwYWJpbGl0eS5jOjMwMzpF
c3lzX0dldENhcGFiaWxpdHlfRmluaXNoKCkgUmVjZWl2ZWQgVFBNIEVycm9yPGJyPkVSUk9SOmVz
eXM6YXBpXEVzeXNfR2V0Q2FwYWJpbGl0eS5jOjEwNzpFc3lzX0dldENhcGFiaWxpdHkoKSBFc3lz
IEZpbmlzaCBFcnJvckNvZGUgKDB4MDAwMDAxMDApPGJyPkVSUk9SOiBFc3lzX0dldENhcGFiaWxp
dHkoMHgxMDApIC0gdHBtOmVycm9yKDIuMCk6IFRQTSBub3QgaW5pdGlhbGl6ZWQgYnkgVFBNMl9T
dGFydHVwIG9yIGFscmVhZHkgaW5pdGlhbGl6ZWQ8YnI+RVJST1I6IFVuYWJsZSB0byBydW4gQzpc
VXNlcnNcYXJ1bnN1XHNvdXJjZVxyZXBvc1x0cG0yLXRvb2xzLTQuMFx2c3R1ZGlvXHg2NFxEZWJ1
Z1x0cG0yLWdldHJhbmRvbS5leGU8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGlzIGlz
IG9ubHkgZm9yIE1TU0lNLiBBbnlvbmUga25vd3Mgd2h5ID8/PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj48YnI+PC9kaXY+PC9kaXY+CjwvZGl2Pgo=

--===============0687331587187714425==--

