Content-Type: multipart/mixed; boundary="===============6618393505302982726=="
MIME-Version: 1.0
From: =?utf-8?q?Gabriela_Limonta_M=C3=A1rquez_=3Cglimonta_at_gmail=2Ecom=3E?=
Subject: [tpm2] Policy check fails writing to NVRAM > 512B
Date: Tue, 12 Jun 2018 09:20:45 +0300
Message-ID: <CA+HVzV2uSCXgS2sTBEV+r+z2YGTSV3QF85afgA=X1uc=v8i7Yw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6618393505302982726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I have updated the tpm2 software stack to use

tpm2-tss @ 2.0.0_rc3
tpm2-abrmd @ 2.0.0_rc0
tpm2-tools @ 3.1.0-rc0

I am trying to write a file to NVRAM and seal it using a simple policy
=E2=80=8B (sha256:0)=E2=80=8B
.

I can create the policy and define the NVRAM. However, when I try writing
to it it fails with a policy check error:

$ tpm2_nvrelease -x 0x1800005 -a 0x40000001

$ tpm2_pcrlist -L sha256:0 -o pcr.value
sha256 :
  0  : d8a76f44656e5b7ed75ddc6c19071d8594e99edb67c54c0f5f562a8bdaa26bbf

$ tpm2_createpolicy -P -L sha256:0 -F pcr.value -f policy

$ tpm2_nvdefine -x 0x1800005 -a 0x40000001 -s 700 -L policy -t
"policyread|policywrite"

$ tpm2_nvwrite -x  0x1800005 -a 0x1800005 -L sha256:0 -F pcr.value
ta_config.cfg -V
INFO on line: "125" in file: "tools/tpm2_nvwrite.c": The data(size=3D512) to
be written:
INFO on line: "141" in file: "tools/tpm2_nvwrite.c": Success to write NV
area at index 0x1800005 (25165829) offset 0x0.
INFO on line: "125" in file: "tools/tpm2_nvwrite.c": The data(size=3D131) to
be written:
ERROR on line: "136" in file: "tools/tpm2_nvwrite.c": Failed to write NV
area at index 0x1800005 (25165829) offset 0x200. Error:0x99d
ERROR on line: "168" in file: "tools/tpm2_tool.c": Unable to run
tpm2_nvwrite

$ tpm2_rc_decode 0x99d
error layer
  hex: 0x0
  identifier: TSS2_TPM_RC_LAYER
  description: Error produced by the TPM
format 1 error code
  hex: 0x1d
  identifier: TPM2_RC_POLICY_FAIL
  description: a policy check failed
session
  hex: 0x100
  identifier: TPM2_RC_1
  description:  (null)

From the verbose output I can see that the first 512 bytes are successfully
written, and it only fails the policy check for the remaining 131 bytes.
=E2=80=8BI don't think this is a policy =E2=80=8Bfailure, since the policy =
check succeeds
for the first 512 bytes and the policy is defined with PCR0 of the sha256
bank which is not changing.


=E2=80=8BMy guess is that it was related to the size of the file I was tryi=
ng to
write to NVRAM, so=E2=80=8B
 I tried writing a smaller file (< 512) and that succee
=E2=80=8Bds=E2=80=8B
.

$ tpm2_nvwrite -x  0x1800005 -a 0x1800005 -L sha256:0 -F pcr.value
ta2_config.cfg -V
INFO on line: "125" in file: "tools/tpm2_nvwrite.c": The data(size=3D273) to
be written:
INFO on line: "141" in file: "tools/tpm2_nvwrite.c": Success to write NV
area at index 0x1800005 (25165829) offset 0x0.
54504d5f454b5f4b45595f48414e444c45203d202230783831303130303032220a54504d5f4=
14b5f4b45595f48414e444c45203d202230783831303130303033220a54504d5f484153485f=
414c474f524954484d203d2022736861323536220a4d53475f46494c45203d20222f746d702=
f71756f74652e6d7367220a5349474e41545552455f46494c45203d20222f746d702f71756f=
74652e736967220a51554f54455f46494c45203d20222f746d702f71756f74652e71756f742=
20a51554f54455f4a534f4e5f46494c45203d20222f746d702f71756f74652e6a736f6e220a=
454b5f46494c45203d20222f746d702f656b2e707562220a414b5f46494c45203d20222f746=
d702f616b2e707562220a%


I only have this problem when using policies. If I define NVRAM without any
policies I can write the file successfully even if the size is larger than
512.

Does anyone have any idea what might be going on?

Thanks in advance!

Best regards,
Gabriela Limonta
=E2=80=8B=E2=80=8B

--===============6618393505302982726==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGksPGJyPjxicj5JIGhhdmUgdXBkYXRlZCB0aGUgdHBtMiBzb2Z0d2Fy
ZSBzdGFjayB0byB1c2UgPGJyPjxicj50cG0yLXRzcyBAIDIuMC4wX3JjMzxicj50cG0yLWFicm1k
IEAgMi4wLjBfcmMwPGJyPnRwbTItdG9vbHMgQCAzLjEuMC1yYzA8YnI+PGJyPkkgYW0gdHJ5aW5n
IHRvIHdyaXRlIGEgZmlsZSB0byBOVlJBTSBhbmQgc2VhbCBpdCB1c2luZyBhIHNpbXBsZSBwb2xp
Y3k8ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7dHJl
YnVjaGV0IG1zJnF1b3Q7LHNhbnMtc2VyaWY7ZGlzcGxheTppbmxpbmUiPuKAiyAoc2hhMjU2OjAp
4oCLPC9kaXY+Ljxicj48YnI+SSBjYW4gY3JlYXRlIHRoZSBwb2xpY3kgYW5kIGRlZmluZSB0aGUg
TlZSQU0uIEhvd2V2ZXIsIHdoZW4gSSB0cnkgd3JpdGluZyB0byBpdCBpdCBmYWlscyB3aXRoIGEg
cG9saWN5IGNoZWNrIGVycm9yOjxicj48YnI+JCB0cG0yX252cmVsZWFzZSAteCAweDE4MDAwMDUg
LWEgMHg0MDAwMDAwMTxicj48YnI+JCB0cG0yX3Bjcmxpc3QgLUwgc2hhMjU2OjAgLW8gcGNyLnZh
bHVlPGJyPnNoYTI1NiA6PGJyPsKgIDAgwqA6IGQ4YTc2ZjQ0NjU2ZTViN2VkNzVkZGM2YzE5MDcx
ZDg1OTRlOTllZGI2N2M1NGMwZjVmNTYyYThiZGFhMjZiYmY8YnI+PGJyPiQgdHBtMl9jcmVhdGVw
b2xpY3kgLVAgLUwgc2hhMjU2OjAgLUYgcGNyLnZhbHVlIC1mIHBvbGljeTxicj48YnI+JCB0cG0y
X252ZGVmaW5lIC14IDB4MTgwMDAwNSAtYSAweDQwMDAwMDAxIC1zIDcwMCAtTCBwb2xpY3kgLXQg
JnF1b3Q7cG9saWN5cmVhZHxwb2xpY3l3cml0ZSZxdW90Ozxicj48YnI+JCB0cG0yX252d3JpdGUg
LXggwqAweDE4MDAwMDUgLWEgMHgxODAwMDA1IC1MIHNoYTI1NjowIC1GIHBjci52YWx1ZSB0YV9j
b25maWcuY2ZnIC1WPGJyPklORk8gb24gbGluZTogJnF1b3Q7MTI1JnF1b3Q7IGluIGZpbGU6ICZx
dW90O3Rvb2xzL3RwbTJfbnZ3cml0ZS5jJnF1b3Q7OiBUaGUgZGF0YShzaXplPTUxMikgdG8gYmUg
d3JpdHRlbjo8YnI+SU5GTyBvbiBsaW5lOiAmcXVvdDsxNDEmcXVvdDsgaW4gZmlsZTogJnF1b3Q7
dG9vbHMvdHBtMl9udndyaXRlLmMmcXVvdDs6IFN1Y2Nlc3MgdG8gd3JpdGUgTlYgYXJlYSBhdCBp
bmRleCAweDE4MDAwMDUgKDI1MTY1ODI5KSBvZmZzZXQgMHgwLjxicj5JTkZPIG9uIGxpbmU6ICZx
dW90OzEyNSZxdW90OyBpbiBmaWxlOiAmcXVvdDt0b29scy90cG0yX252d3JpdGUuYyZxdW90Ozog
VGhlIGRhdGEoc2l6ZT0xMzEpIHRvIGJlIHdyaXR0ZW46PGJyPkVSUk9SIG9uIGxpbmU6ICZxdW90
OzEzNiZxdW90OyBpbiBmaWxlOiAmcXVvdDt0b29scy90cG0yX252d3JpdGUuYyZxdW90OzogRmFp
bGVkIHRvIHdyaXRlIE5WIGFyZWEgYXQgaW5kZXggMHgxODAwMDA1ICgyNTE2NTgyOSkgb2Zmc2V0
IDB4MjAwLiBFcnJvcjoweDk5ZDxicj5FUlJPUiBvbiBsaW5lOiAmcXVvdDsxNjgmcXVvdDsgaW4g
ZmlsZTogJnF1b3Q7dG9vbHMvdHBtMl90b29sLmMmcXVvdDs6IFVuYWJsZSB0byBydW4gdHBtMl9u
dndyaXRlPGJyPjxicj4kIHRwbTJfcmNfZGVjb2RlIDB4OTlkPGJyPmVycm9yIGxheWVyPGJyPsKg
IGhleDogMHgwPGJyPsKgIGlkZW50aWZpZXI6IFRTUzJfVFBNX1JDX0xBWUVSPGJyPsKgIGRlc2Ny
aXB0aW9uOiBFcnJvciBwcm9kdWNlZCBieSB0aGUgVFBNPGJyPmZvcm1hdCAxIGVycm9yIGNvZGU8
YnI+wqAgaGV4OiAweDFkPGJyPsKgIGlkZW50aWZpZXI6IFRQTTJfUkNfUE9MSUNZX0ZBSUw8YnI+
wqAgZGVzY3JpcHRpb246IGEgcG9saWN5IGNoZWNrIGZhaWxlZDxicj5zZXNzaW9uPGJyPsKgIGhl
eDogMHgxMDA8YnI+wqAgaWRlbnRpZmllcjogVFBNMl9SQ18xPGJyPsKgIGRlc2NyaXB0aW9uOiDC
oChudWxsKTxicj48YnI+RnJvbSB0aGUgdmVyYm9zZSBvdXRwdXQgSSBjYW4gc2VlIHRoYXQgdGhl
IGZpcnN0IDUxMiBieXRlcyBhcmUgc3VjY2Vzc2Z1bGx5IHdyaXR0ZW4sIGFuZCBpdCBvbmx5IGZh
aWxzIHRoZSBwb2xpY3kgY2hlY2sgZm9yIHRoZSByZW1haW5pbmcgMTMxIGJ5dGVzLjxkaXY+PGRp
diBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O3RyZWJ1Y2hl
dCBtcyZxdW90OyxzYW5zLXNlcmlmIj7igItJIGRvbiYjMzk7dCB0aGluayB0aGlzIGlzIGEgcG9s
aWN5IOKAi2ZhaWx1cmUsIHNpbmNlIHRoZSBwb2xpY3kgY2hlY2sgc3VjY2VlZHMgZm9yIHRoZSBm
aXJzdCA1MTIgYnl0ZXMgYW5kIHRoZSBwb2xpY3kgaXMgZGVmaW5lZCB3aXRoIFBDUjAgb2YgdGhl
IHNoYTI1NiBiYW5rIHdoaWNoIGlzIG5vdCBjaGFuZ2luZy48L2Rpdj48YnI+PGJyPjxkaXYgY2xh
c3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDt0cmVidWNoZXQgbXMm
cXVvdDssc2Fucy1zZXJpZjtkaXNwbGF5OmlubGluZSI+4oCLTXkgZ3Vlc3MgaXMgdGhhdCBpdCB3
YXMgcmVsYXRlZCB0byB0aGUgc2l6ZSBvZiB0aGUgZmlsZSBJIHdhcyB0cnlpbmcgdG8gd3JpdGUg
dG8gTlZSQU0sIHNv4oCLPC9kaXY+wqBJIHRyaWVkIHdyaXRpbmcgYSBzbWFsbGVyIGZpbGUgKCZs
dDsgNTEyKSBhbmQgdGhhdCBzdWNjZWU8ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0i
Zm9udC1mYW1pbHk6JnF1b3Q7dHJlYnVjaGV0IG1zJnF1b3Q7LHNhbnMtc2VyaWY7ZGlzcGxheTpp
bmxpbmUiPuKAi2Rz4oCLPC9kaXY+Ljxicj48YnI+JCB0cG0yX252d3JpdGUgLXggwqAweDE4MDAw
MDUgLWEgMHgxODAwMDA1IC1MIHNoYTI1NjowIC1GIHBjci52YWx1ZSB0YTJfY29uZmlnLmNmZyAt
Vjxicj5JTkZPIG9uIGxpbmU6ICZxdW90OzEyNSZxdW90OyBpbiBmaWxlOiAmcXVvdDt0b29scy90
cG0yX252d3JpdGUuYyZxdW90OzogVGhlIGRhdGEoc2l6ZT0yNzMpIHRvIGJlIHdyaXR0ZW46PGJy
PklORk8gb24gbGluZTogJnF1b3Q7MTQxJnF1b3Q7IGluIGZpbGU6ICZxdW90O3Rvb2xzL3RwbTJf
bnZ3cml0ZS5jJnF1b3Q7OiBTdWNjZXNzIHRvIHdyaXRlIE5WIGFyZWEgYXQgaW5kZXggMHgxODAw
MDA1ICgyNTE2NTgyOSkgb2Zmc2V0IDB4MC48YnI+NTQ1MDRkNWY0NTRiNWY0YjQ1NTk1ZjQ4NDE0
ZTQ0NGM0NTIwM2QyMDIyMzA3ODM4MzEzMDMxMzAzMDMwMzIyMjBhNTQ1MDRkNWY0MTRiNWY0YjQ1
NTk1ZjQ4NDE0ZTQ0NGM0NTIwM2QyMDIyMzA3ODM4MzEzMDMxMzAzMDMwMzMyMjBhNTQ1MDRkNWY0
ODQxNTM0ODVmNDE0YzQ3NGY1MjQ5NTQ0ODRkMjAzZDIwMjI3MzY4NjEzMjM1MzYyMjBhNGQ1MzQ3
NWY0NjQ5NGM0NTIwM2QyMDIyMmY3NDZkNzAyZjcxNzU2Zjc0NjUyZTZkNzM2NzIyMGE1MzQ5NDc0
ZTQxNTQ1NTUyNDU1ZjQ2NDk0YzQ1MjAzZDIwMjIyZjc0NmQ3MDJmNzE3NTZmNzQ2NTJlNzM2OTY3
MjIwYTUxNTU0ZjU0NDU1ZjQ2NDk0YzQ1MjAzZDIwMjIyZjc0NmQ3MDJmNzE3NTZmNzQ2NTJlNzE3
NTZmNzQyMjBhNTE1NTRmNTQ0NTVmNGE1MzRmNGU1ZjQ2NDk0YzQ1MjAzZDIwMjIyZjc0NmQ3MDJm
NzE3NTZmNzQ2NTJlNmE3MzZmNmUyMjBhNDU0YjVmNDY0OTRjNDUyMDNkMjAyMjJmNzQ2ZDcwMmY2
NTZiMmU3MDc1NjIyMjBhNDE0YjVmNDY0OTRjNDUyMDNkMjAyMjJmNzQ2ZDcwMmY2MTZiMmU3MDc1
NjIyMjBhJSDCoDxicj48YnI+SSBvbmx5IGhhdmUgdGhpcyBwcm9ibGVtIHdoZW4gdXNpbmcgcG9s
aWNpZXMuIElmIEkgZGVmaW5lIE5WUkFNIHdpdGhvdXQgYW55IHBvbGljaWVzIEkgY2FuIHdyaXRl
IHRoZSBmaWxlIHN1Y2Nlc3NmdWxseSBldmVuIGlmIHRoZSBzaXplIGlzIGxhcmdlciB0aGFuIDUx
Mi48YnI+PGJyPkRvZXMgYW55b25lIGhhdmUgYW55IGlkZWEgd2hhdCBtaWdodCBiZSBnb2luZyBv
bj88YnI+PGJyPlRoYW5rcyBpbiBhZHZhbmNlITxicj48YnI+QmVzdCByZWdhcmRzLDxicj5HYWJy
aWVsYSBMaW1vbnRhPGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFtaWx5
OiZxdW90O3RyZWJ1Y2hldCBtcyZxdW90OyxzYW5zLXNlcmlmO2Rpc3BsYXk6aW5saW5lIj7igIvi
gIs8L2Rpdj48L2Rpdj48L2Rpdj4K

--===============6618393505302982726==--

