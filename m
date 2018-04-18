Content-Type: multipart/mixed; boundary="===============8134511389067201517=="
MIME-Version: 1.0
From: =?utf-8?q?St=C3=AAnio_Ara=C3=BAjo_=3Cstenioaraujo_at_lsd=2Eufcg=2Eedu=2Eb?=
 =?utf-8?q?r=3E?=
Subject: [tpm2] tpm2-tools not working on SWTPM + QEMU + OVMF
Date: Wed, 18 Apr 2018 18:04:26 -0300
Message-ID: <1557838011.105208.1524085466476.JavaMail.zimbra@lsd.ufcg.edu.br>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8134511389067201517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, =


I have setup an environment with SWTPM, QEMU and OVMF to have TPM capabilit=
ies on my Guest VMs. =


I have swtpm with tpm2 enabled, as I have OVMF. =


My Guest VM is running Ubuntu 16.04. I installed the libraries and tools wi=
thin https://github.com/tpm2-software . =

I was able to start tpm2-abrmd successfully, but when I run tpm2_pcrlist (o=
r any other tpm2_* command) I get the following error: =


** (process:2430): WARNING **: Failed to create connection with service: GD=
Bus.Error:org.freedesktop.DBus.Error.AccessDenied: Rejected send message, 1=
 matched rules; type=3D"method_call", sender=3D":1.17" (uid=3D0 pid=3D2430 =
comm=3D"tpm2_pcrlist ") interface=3D"com.intel.tss2.TctiTabrmd" member=3D"C=
reateConnection" error name=3D"(unset)" requested_reply=3D"0" destination=
=3D":1.18" (uid=3D999 pid=3D2433 comm=3D"/usr/local/sbin/tpm2-abrmd ") =

ERROR: tcti init allocation routine failed for library: "tabrmd" options: "=
(null)" =

ERROR: Could not load tcti, got: "tabrmd" =


Would that probably be an issue with the tpm2 tools I am installing on the =
Guest? Or would it be something else? =


Thank you,=20

--===============8134511389067201517==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+PGJvZHk+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IGFyaWFsLCBoZWx2ZXRpY2EsIHNh
bnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6ICMwMDAwMDAiPjxkaXY+SGksPGJyPjxi
cj5JIGhhdmUgc2V0dXAgYW4gZW52aXJvbm1lbnQgd2l0aCBTV1RQTSwgUUVNVSBhbmQgT1ZNRiB0
byBoYXZlIFRQTSBjYXBhYmlsaXRpZXMgb24gbXkgR3Vlc3QgVk1zLjwvZGl2PjxkaXY+PGJyIGRh
dGEtbWNlLWJvZ3VzPSIxIj48L2Rpdj48ZGl2PkkgaGF2ZSBzd3RwbSB3aXRoIHRwbTIgZW5hYmxl
ZCwgYXMgSSBoYXZlIE9WTUYuPC9kaXY+PGRpdj48YnIgZGF0YS1tY2UtYm9ndXM9IjEiPjwvZGl2
PjxkaXY+TXkgR3Vlc3QgVk0gaXMgcnVubmluZyBVYnVudHUgMTYuMDQuIEkgaW5zdGFsbGVkIHRo
ZSBsaWJyYXJpZXMgYW5kIHRvb2xzIHdpdGhpbiZuYnNwOzxhIGhyZWY9Imh0dHBzOi8vZ2l0aHVi
LmNvbS90cG0yLXNvZnR3YXJlIiBkYXRhLW1jZS1ocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBt
Mi1zb2Z0d2FyZSI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmU8L2E+LjwvZGl2Pjxk
aXY+SSB3YXMgYWJsZSB0byBzdGFydCB0cG0yLWFicm1kIHN1Y2Nlc3NmdWxseSwgYnV0IHdoZW4g
SSBydW4gdHBtMl9wY3JsaXN0IChvciBhbnkgb3RoZXIgdHBtMl8qIGNvbW1hbmQpIEkgZ2V0IHRo
ZSBmb2xsb3dpbmcgZXJyb3I6PC9kaXY+PGRpdj48YnIgZGF0YS1tY2UtYm9ndXM9IjEiPjwvZGl2
PjxkaXYgc3R5bGU9InBhZGRpbmctbGVmdDogMzBweDsiIGRhdGEtbWNlLXN0eWxlPSJwYWRkaW5n
LWxlZnQ6IDMwcHg7Ij4qKiAocHJvY2VzczoyNDMwKTogV0FSTklORyAqKjogRmFpbGVkIHRvIGNy
ZWF0ZSBjb25uZWN0aW9uIHdpdGggc2VydmljZTogR0RCdXMuRXJyb3I6b3JnLmZyZWVkZXNrdG9w
LkRCdXMuRXJyb3IuQWNjZXNzRGVuaWVkOiBSZWplY3RlZCBzZW5kIG1lc3NhZ2UsIDEgbWF0Y2hl
ZCBydWxlczsgdHlwZT0ibWV0aG9kX2NhbGwiLCBzZW5kZXI9IjoxLjE3IiAodWlkPTAgcGlkPTI0
MzAgY29tbT0idHBtMl9wY3JsaXN0ICIpIGludGVyZmFjZT0iY29tLmludGVsLnRzczIuVGN0aVRh
YnJtZCIgbWVtYmVyPSJDcmVhdGVDb25uZWN0aW9uIiBlcnJvciBuYW1lPSIodW5zZXQpIiByZXF1
ZXN0ZWRfcmVwbHk9IjAiIGRlc3RpbmF0aW9uPSI6MS4xOCIgKHVpZD05OTkgcGlkPTI0MzMgY29t
bT0iL3Vzci9sb2NhbC9zYmluL3RwbTItYWJybWQgIik8YnI+RVJST1I6IHRjdGkgaW5pdCBhbGxv
Y2F0aW9uIHJvdXRpbmUgZmFpbGVkIGZvciBsaWJyYXJ5OiAidGFicm1kIiBvcHRpb25zOiAiKG51
bGwpIjxicj5FUlJPUjogQ291bGQgbm90IGxvYWQgdGN0aSwgZ290OiAidGFicm1kIjwvZGl2Pjxk
aXYgc3R5bGU9InBhZGRpbmctbGVmdDogMzBweDsiIGRhdGEtbWNlLXN0eWxlPSJwYWRkaW5nLWxl
ZnQ6IDMwcHg7Ij48YnI+PC9kaXY+PGRpdj5Xb3VsZCB0aGF0IHByb2JhYmx5IGJlIGFuIGlzc3Vl
IHdpdGggdGhlIHRwbTIgdG9vbHMgSSBhbSBpbnN0YWxsaW5nIG9uIHRoZSBHdWVzdD8gT3Igd291
bGQgaXQgYmUgc29tZXRoaW5nIGVsc2U/PGJyPjxicj5UaGFuayB5b3UsPC9kaXY+PC9kaXY+PC9i
b2R5PjwvaHRtbD4=
--===============8134511389067201517==--

