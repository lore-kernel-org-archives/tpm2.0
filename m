Content-Type: multipart/mixed; boundary="===============4852759122225776706=="
MIME-Version: 1.0
From: =?utf-8?q?Gabriela_Limonta_M=C3=A1rquez_=3Cglimonta_at_gmail=2Ecom=3E?=
Subject: Re: [tpm2] Policy check fails writing to NVRAM > 512B
Date: Wed, 13 Jun 2018 21:06:30 +0300
Message-ID: <CA+HVzV0a6jrr=zD6QHT+aB1VDd7_FXZ8nzMJB1UXP06jhsvyyg@mail.gmail.com>
In-Reply-To: ae4b17df-1873-3729-a633-766bad737cce@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4852759122225776706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tadeusz,

I enabled TCTI debug info and there were no extra messages when executing
the write command:

$ export TSS2_LOG=3D"all+ERROR,tcti+TRACE"

$ tpm2_nvwrite -x 0x1800005 -a 0x1800005 -L sha256:0 -F pcr.value
ta_config.cfg
ERROR: Failed to write NV area at index 0x1800005 (25165829) offset 0x200.
Error:0x99d
ERROR: Unable to run tpm2_nvwrite

Am I doing something wrong? or are the TSS logs available somewhere else
after I execute the command and that is why I see nothing?

I also tried enabling logging as TSS2_LOG=3D"all+TRACE", but I only see deb=
ug
and trace logs from marshal and none of them say error or anything similar.

Thanks,
Gabriela


2018-06-13 20:47 GMT+03:00 Tadeusz Struk <tadeusz.struk(a)intel.com>:

> On 06/11/2018 11:20 PM, Gabriela Limonta M=C3=A1rquez wrote:
> > Hi,
> >
> > I have updated the tpm2 software stack to use
> >
> > tpm2-tss @ 2.0.0_rc3
> > tpm2-abrmd @ 2.0.0_rc0
> > tpm2-tools @ 3.1.0-rc0
> >
> > I am trying to write a file to NVRAM and seal it using a simple policy
> > =E2=80=8B (sha256:0)=E2=80=8B
> > .
> >
> > I can create the policy and define the NVRAM. However, when I try
> writing to it it fails with a policy check error:
> >
> > $ tpm2_nvrelease -x 0x1800005 -a 0x40000001
> >
> > $ tpm2_pcrlist -L sha256:0 -o pcr.value
> > sha256 :
> >   0  : d8a76f44656e5b7ed75ddc6c19071d8594e99edb67c54c0f5f562a8bdaa26bbf
> >
> > $ tpm2_createpolicy -P -L sha256:0 -F pcr.value -f policy
> >
> > $ tpm2_nvdefine -x 0x1800005 -a 0x40000001 -s 700 -L policy -t
> "policyread|policywrite"
> >
> > $ tpm2_nvwrite -x  0x1800005 -a 0x1800005 -L sha256:0 -F pcr.value
> ta_config.cfg -V
> > INFO on line: "125" in file: "tools/tpm2_nvwrite.c": The data(size=3D51=
2)
> to be written:
> > INFO on line: "141" in file: "tools/tpm2_nvwrite.c": Success to write NV
> area at index 0x1800005 (25165829) offset 0x0.
> > INFO on line: "125" in file: "tools/tpm2_nvwrite.c": The data(size=3D13=
1)
> to be written:
> > ERROR on line: "136" in file: "tools/tpm2_nvwrite.c": Failed to write NV
> area at index 0x1800005 (25165829) offset 0x200. Error:0x99d
> > ERROR on line: "168" in file: "tools/tpm2_tool.c": Unable to run
> tpm2_nvwrite
> >
> > $ tpm2_rc_decode 0x99d
> > error layer
> >   hex: 0x0
> >   identifier: TSS2_TPM_RC_LAYER
> >   description: Error produced by the TPM
> > format 1 error code
> >   hex: 0x1d
> >   identifier: TPM2_RC_POLICY_FAIL
> >   description: a policy check failed
> > session
> >   hex: 0x100
> >   identifier: TPM2_RC_1
> >   description:  (null)
> >
> > From the verbose output I can see that the first 512 bytes are
> successfully written, and it only fails the policy check for the remaining
> 131 bytes.
> > =E2=80=8BI don't think this is a policy =E2=80=8Bfailure, since the pol=
icy check
> succeeds for the first 512 bytes and the policy is defined with PCR0 of t=
he
> sha256 bank which is not changing.
> >
> >
> > =E2=80=8BMy guess is that it was related to the size of the file I was =
trying to
> write to NVRAM, so=E2=80=8B
> >  I tried writing a smaller file (< 512) and that succee
> > =E2=80=8Bds=E2=80=8B
> > .
> >
> > $ tpm2_nvwrite -x  0x1800005 -a 0x1800005 -L sha256:0 -F pcr.value
> ta2_config.cfg -V
> > INFO on line: "125" in file: "tools/tpm2_nvwrite.c": The data(size=3D27=
3)
> to be written:
> > INFO on line: "141" in file: "tools/tpm2_nvwrite.c": Success to write NV
> area at index 0x1800005 (25165829) offset 0x0.
> > 54504d5f454b5f4b45595f48414e444c45203d2022307838313031303030
> 32220a54504d5f414b5f4b45595f48414e444c45203d2022307838313031
> 30303033220a54504d5f484153485f414c474f524954484d203d20227368
> 61323536220a4d53475f46494c45203d20222f746d702f71756f74652e6d
> 7367220a5349474e41545552455f46494c45203d20222f746d702f71756f
> 74652e736967220a51554f54455f46494c45203d20222f746d702f71756f
> 74652e71756f74220a51554f54455f4a534f4e5f46494c45203d20222f74
> 6d702f71756f74652e6a736f6e220a454b5f46494c45203d20222f746d70
> 2f656b2e707562220a414b5f46494c45203d20222f746d702f616b2e707562220a%
> >
> > I only have this problem when using policies. If I define NVRAM without
> any policies I can write the file successfully even if the size is larger
> than 512.
> >
> > Does anyone have any idea what might be going on?
> >
> > Thanks in advance!
> >
> > Best regards,
> > Gabriela Limonta
>
> Hi Gabriela,
> My first guess is that the TCTI performs two partial writes internally and
> after the first partial write the policy digest
> gets updated. Could you please enable TCTI debug info and try to write the
> big buffer again.
> The debug info can be turned on by:
> export TSS2_LOG=3D"all+ERROR,tcti+TRACE"
>
> Thanks,
> --
> Tadeusz
>

--===============4852759122225776706==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGkgVGFkZXVzeiw8YnI+PGJyPkkgZW5hYmxlZCBUQ1RJIGRlYnVnIGlu
Zm8gYW5kIHRoZXJlIHdlcmUgbm8gZXh0cmEgbWVzc2FnZXMgd2hlbiBleGVjdXRpbmcgdGhlIHdy
aXRlIGNvbW1hbmQ6PGJyPjxicj4kIGV4cG9ydCBUU1MyX0xPRz0mcXVvdDthbGwrRVJST1IsdGN0
aStUUkFDRSZxdW90Ozxicj48YnI+JCB0cG0yX252d3JpdGUgLXggMHgxODAwMDA1IC1hIDB4MTgw
MDAwNSAtTCBzaGEyNTY6MCAtRiBwY3IudmFsdWUgdGFfY29uZmlnLmNmZzxicj5FUlJPUjogRmFp
bGVkIHRvIHdyaXRlIE5WIGFyZWEgYXQgaW5kZXggMHgxODAwMDA1ICgyNTE2NTgyOSkgb2Zmc2V0
IDB4MjAwLiBFcnJvcjoweDk5ZDxicj5FUlJPUjogVW5hYmxlIHRvIHJ1biB0cG0yX252d3JpdGU8
YnI+PGJyPkFtIEkgZG9pbmcgc29tZXRoaW5nIHdyb25nPyBvciBhcmUgdGhlIFRTUyBsb2dzIGF2
YWlsYWJsZSBzb21ld2hlcmUgZWxzZSBhZnRlciBJIGV4ZWN1dGUgdGhlIGNvbW1hbmQgYW5kIHRo
YXQgaXMgd2h5IEkgc2VlIG5vdGhpbmc/PGJyPjxicj5JIGFsc28gdHJpZWQgZW5hYmxpbmcgbG9n
Z2luZyBhcyBUU1MyX0xPRz0mcXVvdDthbGwrVFJBQ0UmcXVvdDssIGJ1dCBJIG9ubHkgc2VlIGRl
YnVnIGFuZCB0cmFjZSBsb2dzIGZyb20gbWFyc2hhbCBhbmQgbm9uZSBvZiB0aGVtIHNheSBlcnJv
ciBvciBhbnl0aGluZyBzaW1pbGFyLjxicj48YnI+VGhhbmtzLDxicj5HYWJyaWVsYTxkaXYgY2xh
c3M9ImdtYWlsX2RlZmF1bHQiPjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O3RyZWJ1Y2hl
dCBtcyZxdW90OyxzYW5zLXNlcmlmIj48YnI+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0i
Z21haWxfZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+MjAxOC0wNi0xMyAyMDo0
NyBHTVQrMDM6MDAgVGFkZXVzeiBTdHJ1ayA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1h
aWx0bzp0YWRldXN6LnN0cnVrQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnRhZGV1c3ouc3Ry
dWtAaW50ZWwuY29tPC9hPiZndDs8L3NwYW4+Ojxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xp
ZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGNsYXNzPSJIT0VuWmIiPjxkaXYgY2xhc3M9Img1Ij5P
biAwNi8xMS8yMDE4IDExOjIwIFBNLCBHYWJyaWVsYSBMaW1vbnRhIE3DoXJxdWV6IHdyb3RlOjxi
cj4KJmd0OyBIaSw8YnI+CiZndDsgPGJyPgomZ3Q7IEkgaGF2ZSB1cGRhdGVkIHRoZSB0cG0yIHNv
ZnR3YXJlIHN0YWNrIHRvIHVzZTxicj4KJmd0OyA8YnI+CiZndDsgdHBtMi10c3MgQCAyLjAuMF9y
YzM8YnI+CiZndDsgdHBtMi1hYnJtZCBAIDIuMC4wX3JjMDxicj4KJmd0OyB0cG0yLXRvb2xzIEAg
My4xLjAtcmMwPGJyPgomZ3Q7IDxicj4KJmd0OyBJIGFtIHRyeWluZyB0byB3cml0ZSBhIGZpbGUg
dG8gTlZSQU0gYW5kIHNlYWwgaXQgdXNpbmcgYSBzaW1wbGUgcG9saWN5PGJyPgomZ3Q7IOKAiyAo
c2hhMjU2OjAp4oCLPGJyPgomZ3Q7IC48YnI+CiZndDsgPGJyPgomZ3Q7IEkgY2FuIGNyZWF0ZSB0
aGUgcG9saWN5IGFuZCBkZWZpbmUgdGhlIE5WUkFNLiBIb3dldmVyLCB3aGVuIEkgdHJ5IHdyaXRp
bmcgdG8gaXQgaXQgZmFpbHMgd2l0aCBhIHBvbGljeSBjaGVjayBlcnJvcjo8YnI+CiZndDsgPGJy
PgomZ3Q7ICQgdHBtMl9udnJlbGVhc2UgLXggMHgxODAwMDA1IC1hIDB4NDAwMDAwMDE8YnI+CiZn
dDsgPGJyPgomZ3Q7ICQgdHBtMl9wY3JsaXN0IC1MIHNoYTI1NjowIC1vIHBjci52YWx1ZTxicj4K
Jmd0OyBzaGEyNTYgOjxicj4KJmd0OyDCoCAwIMKgOiBkOGE3NmY0NDY1NmU1YjdlZDc1ZGRjNmMx
OTA3MWQ8d2JyPjg1OTRlOTllZGI2N2M1NGMwZjVmNTYyYThiZGFhMjx3YnI+NmJiZjxicj4KJmd0
OyA8YnI+CiZndDsgJCB0cG0yX2NyZWF0ZXBvbGljeSAtUCAtTCBzaGEyNTY6MCAtRiBwY3IudmFs
dWUgLWYgcG9saWN5PGJyPgomZ3Q7IDxicj4KJmd0OyAkIHRwbTJfbnZkZWZpbmUgLXggMHgxODAw
MDA1IC1hIDB4NDAwMDAwMDEgLXMgNzAwIC1MIHBvbGljeSAtdCAmcXVvdDtwb2xpY3lyZWFkfHBv
bGljeXdyaXRlJnF1b3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyAkIHRwbTJfbnZ3cml0ZSAteCDCoDB4
MTgwMDAwNSAtYSAweDE4MDAwMDUgLUwgc2hhMjU2OjAgLUYgcGNyLnZhbHVlIHRhX2NvbmZpZy5j
ZmcgLVY8YnI+CiZndDsgSU5GTyBvbiBsaW5lOiAmcXVvdDsxMjUmcXVvdDsgaW4gZmlsZTogJnF1
b3Q7dG9vbHMvdHBtMl9udndyaXRlLmMmcXVvdDs6IFRoZSBkYXRhKHNpemU9NTEyKSB0byBiZSB3
cml0dGVuOjxicj4KJmd0OyBJTkZPIG9uIGxpbmU6ICZxdW90OzE0MSZxdW90OyBpbiBmaWxlOiAm
cXVvdDt0b29scy90cG0yX252d3JpdGUuYyZxdW90OzogU3VjY2VzcyB0byB3cml0ZSBOViBhcmVh
IGF0IGluZGV4IDB4MTgwMDAwNSAoMjUxNjU4MjkpIG9mZnNldCAweDAuPGJyPgomZ3Q7IElORk8g
b24gbGluZTogJnF1b3Q7MTI1JnF1b3Q7IGluIGZpbGU6ICZxdW90O3Rvb2xzL3RwbTJfbnZ3cml0
ZS5jJnF1b3Q7OiBUaGUgZGF0YShzaXplPTEzMSkgdG8gYmUgd3JpdHRlbjo8YnI+CiZndDsgRVJS
T1Igb24gbGluZTogJnF1b3Q7MTM2JnF1b3Q7IGluIGZpbGU6ICZxdW90O3Rvb2xzL3RwbTJfbnZ3
cml0ZS5jJnF1b3Q7OiBGYWlsZWQgdG8gd3JpdGUgTlYgYXJlYSBhdCBpbmRleCAweDE4MDAwMDUg
KDI1MTY1ODI5KSBvZmZzZXQgMHgyMDAuIEVycm9yOjB4OTlkPGJyPgomZ3Q7IEVSUk9SIG9uIGxp
bmU6ICZxdW90OzE2OCZxdW90OyBpbiBmaWxlOiAmcXVvdDt0b29scy90cG0yX3Rvb2wuYyZxdW90
OzogVW5hYmxlIHRvIHJ1biB0cG0yX252d3JpdGU8YnI+CiZndDsgPGJyPgomZ3Q7ICQgdHBtMl9y
Y19kZWNvZGUgMHg5OWQ8YnI+CiZndDsgZXJyb3IgbGF5ZXI8YnI+CiZndDsgwqAgaGV4OiAweDA8
YnI+CiZndDsgwqAgaWRlbnRpZmllcjogVFNTMl9UUE1fUkNfTEFZRVI8YnI+CiZndDsgwqAgZGVz
Y3JpcHRpb246IEVycm9yIHByb2R1Y2VkIGJ5IHRoZSBUUE08YnI+CiZndDsgZm9ybWF0IDEgZXJy
b3IgY29kZTxicj4KJmd0OyDCoCBoZXg6IDB4MWQ8YnI+CiZndDsgwqAgaWRlbnRpZmllcjogVFBN
Ml9SQ19QT0xJQ1lfRkFJTDxicj4KJmd0OyDCoCBkZXNjcmlwdGlvbjogYSBwb2xpY3kgY2hlY2sg
ZmFpbGVkPGJyPgomZ3Q7IHNlc3Npb248YnI+CiZndDsgwqAgaGV4OiAweDEwMDxicj4KJmd0OyDC
oCBpZGVudGlmaWVyOiBUUE0yX1JDXzE8YnI+CiZndDsgwqAgZGVzY3JpcHRpb246IMKgKG51bGwp
PGJyPgomZ3Q7IDxicj4KJmd0OyBGcm9tIHRoZSB2ZXJib3NlIG91dHB1dCBJIGNhbiBzZWUgdGhh
dCB0aGUgZmlyc3QgNTEyIGJ5dGVzIGFyZSBzdWNjZXNzZnVsbHkgd3JpdHRlbiwgYW5kIGl0IG9u
bHkgZmFpbHMgdGhlIHBvbGljeSBjaGVjayBmb3IgdGhlIHJlbWFpbmluZyAxMzEgYnl0ZXMuPGJy
PgomZ3Q7IOKAi0kgZG9uJiMzOTt0IHRoaW5rIHRoaXMgaXMgYSBwb2xpY3kg4oCLZmFpbHVyZSwg
c2luY2UgdGhlIHBvbGljeSBjaGVjayBzdWNjZWVkcyBmb3IgdGhlIGZpcnN0IDUxMiBieXRlcyBh
bmQgdGhlIHBvbGljeSBpcyBkZWZpbmVkIHdpdGggUENSMCBvZiB0aGUgc2hhMjU2IGJhbmsgd2hp
Y2ggaXMgbm90IGNoYW5naW5nLjxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IOKAi015IGd1
ZXNzIGlzIHRoYXQgaXQgd2FzIHJlbGF0ZWQgdG8gdGhlIHNpemUgb2YgdGhlIGZpbGUgSSB3YXMg
dHJ5aW5nIHRvIHdyaXRlIHRvIE5WUkFNLCBzb+KAizxicj4KJmd0OyDCoEkgdHJpZWQgd3JpdGlu
ZyBhIHNtYWxsZXIgZmlsZSAoJmx0OyA1MTIpIGFuZCB0aGF0IHN1Y2NlZTxicj4KJmd0OyDigItk
c+KAizxicj4KJmd0OyAuPGJyPgomZ3Q7IDxicj4KJmd0OyAkIHRwbTJfbnZ3cml0ZSAteCDCoDB4
MTgwMDAwNSAtYSAweDE4MDAwMDUgLUwgc2hhMjU2OjAgLUYgcGNyLnZhbHVlIHRhMl9jb25maWcu
Y2ZnIC1WPGJyPgomZ3Q7IElORk8gb24gbGluZTogJnF1b3Q7MTI1JnF1b3Q7IGluIGZpbGU6ICZx
dW90O3Rvb2xzL3RwbTJfbnZ3cml0ZS5jJnF1b3Q7OiBUaGUgZGF0YShzaXplPTI3MykgdG8gYmUg
d3JpdHRlbjo8YnI+CiZndDsgSU5GTyBvbiBsaW5lOiAmcXVvdDsxNDEmcXVvdDsgaW4gZmlsZTog
JnF1b3Q7dG9vbHMvdHBtMl9udndyaXRlLmMmcXVvdDs6IFN1Y2Nlc3MgdG8gd3JpdGUgTlYgYXJl
YSBhdCBpbmRleCAweDE4MDAwMDUgKDI1MTY1ODI5KSBvZmZzZXQgMHgwLjxicj4KJmd0OyA1NDUw
NGQ1ZjQ1NGI1ZjRiNDU1OTVmNDg0MTRlNDQ8d2JyPjRjNDUyMDNkMjAyMjMwNzgzODMxMzAzMTMw
MzAzMDx3YnI+MzIyMjBhNTQ1MDRkNWY0MTRiNWY0YjQ1NTk1ZjQ4PHdicj40MTRlNDQ0YzQ1MjAz
ZDIwMjIzMDc4MzgzMTMwMzE8d2JyPjMwMzAzMDMzMjIwYTU0NTA0ZDVmNDg0MTUzNDg1Zjx3YnI+
NDE0YzQ3NGY1MjQ5NTQ0ODRkMjAzZDIwMjI3MzY4PHdicj42MTMyMzUzNjIyMGE0ZDUzNDc1ZjQ2
NDk0YzQ1MjA8d2JyPjNkMjAyMjJmNzQ2ZDcwMmY3MTc1NmY3NDY1MmU2ZDx3YnI+NzM2NzIyMGE1
MzQ5NDc0ZTQxNTQ1NTUyNDU1ZjQ2PHdicj40OTRjNDUyMDNkMjAyMjJmNzQ2ZDcwMmY3MTc1NmY8
d2JyPjc0NjUyZTczNjk2NzIyMGE1MTU1NGY1NDQ1NWY0Njx3YnI+NDk0YzQ1MjAzZDIwMjIyZjc0
NmQ3MDJmNzE3NTZmPHdicj43NDY1MmU3MTc1NmY3NDIyMGE1MTU1NGY1NDQ1NWY8d2JyPjRhNTM0
ZjRlNWY0NjQ5NGM0NTIwM2QyMDIyMmY3NDx3YnI+NmQ3MDJmNzE3NTZmNzQ2NTJlNmE3MzZmNmUy
MjBhPHdicj40NTRiNWY0NjQ5NGM0NTIwM2QyMDIyMmY3NDZkNzA8d2JyPjJmNjU2YjJlNzA3NTYy
MjIwYTQxNGI1ZjQ2NDk0Yzx3YnI+NDUyMDNkMjAyMjJmNzQ2ZDcwMmY2MTZiMmU3MDc1PHdicj42
MjIyMGElIMKgPGJyPgomZ3Q7IDxicj4KJmd0OyBJIG9ubHkgaGF2ZSB0aGlzIHByb2JsZW0gd2hl
biB1c2luZyBwb2xpY2llcy4gSWYgSSBkZWZpbmUgTlZSQU0gd2l0aG91dCBhbnkgcG9saWNpZXMg
SSBjYW4gd3JpdGUgdGhlIGZpbGUgc3VjY2Vzc2Z1bGx5IGV2ZW4gaWYgdGhlIHNpemUgaXMgbGFy
Z2VyIHRoYW4gNTEyLjxicj4KJmd0OyA8YnI+CiZndDsgRG9lcyBhbnlvbmUgaGF2ZSBhbnkgaWRl
YSB3aGF0IG1pZ2h0IGJlIGdvaW5nIG9uPzxicj4KJmd0OyA8YnI+CiZndDsgVGhhbmtzIGluIGFk
dmFuY2UhPGJyPgomZ3Q7IDxicj4KJmd0OyBCZXN0IHJlZ2FyZHMsPGJyPgomZ3Q7IEdhYnJpZWxh
IExpbW9udGE8YnI+Cjxicj4KPC9kaXY+PC9kaXY+SGkgR2FicmllbGEsPGJyPgpNeSBmaXJzdCBn
dWVzcyBpcyB0aGF0IHRoZSBUQ1RJIHBlcmZvcm1zIHR3byBwYXJ0aWFsIHdyaXRlcyBpbnRlcm5h
bGx5IGFuZCBhZnRlciB0aGUgZmlyc3QgcGFydGlhbCB3cml0ZSB0aGUgcG9saWN5IGRpZ2VzdDxi
cj4KZ2V0cyB1cGRhdGVkLiBDb3VsZCB5b3UgcGxlYXNlIGVuYWJsZSBUQ1RJIGRlYnVnIGluZm8g
YW5kIHRyeSB0byB3cml0ZSB0aGUgYmlnIGJ1ZmZlciBhZ2Fpbi48YnI+ClRoZSBkZWJ1ZyBpbmZv
IGNhbiBiZSB0dXJuZWQgb24gYnk6PGJyPgpleHBvcnQgVFNTMl9MT0c9JnF1b3Q7YWxsK0VSUk9S
LHRjdGkrPHdicj5UUkFDRSZxdW90Ozxicj4KPGJyPgpUaGFua3MsPGJyPgo8c3BhbiBjbGFzcz0i
SE9FblpiIj48Zm9udCBjb2xvcj0iIzg4ODg4OCI+LS0gPGJyPgpUYWRldXN6PGJyPgo8L2ZvbnQ+
PC9zcGFuPjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+Cg==

--===============4852759122225776706==--

