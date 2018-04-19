Content-Type: multipart/mixed; boundary="===============4989623182910812652=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Question on TPM 2.0 in Embedded Devices
Date: Thu, 19 Apr 2018 18:21:57 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D010EB1A3EF@exch2010c.sit.fraunhofer.de>
In-Reply-To: trinity-d4d635ba-1ad3-4bb6-a9c8-55bf04043251-1524150581714@3c-app-gmx-bs54
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4989623182910812652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Madprops,

The TSS can also run on RTOSes. We've used SAPI on uCs before.

What you need to do is implement a TCTI-driver for your RTOS and Wiring and=
 then the SAPI or even ESAPI work out of the box.

Cheers,
Andreas
________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of madprops(a)gmx.net [m=
adprops(a)gmx.net]
Sent: Thursday, April 19, 2018 17:09
To: tpm2(a)lists.01.org
Subject: [tpm2] Question on TPM 2.0 in Embedded Devices

Hello all -

I'm not sure if this is the right forum to ask this question, but maybe som=
e of you have an idea:

Is there any TPM 2.0 library, driver or similar available for Real Time Ope=
rating Systems such as ThreadX? I'm thinking or embedded devices where the =
TPM connects to a SoC via SPI, and where the application on the SoC wants t=
o interact with the TPM.

Thanks.

--===============4989623182910812652==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+UCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9
PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBmcHN0eWxlPSIxIiBvY3NpPSIwIj4KPGRpdiBzdHlsZT0i
ZGlyZWN0aW9uOiBsdHI7Zm9udC1mYW1pbHk6IFRhaG9tYTtjb2xvcjogIzAwMDAwMDtmb250LXNp
emU6IDEwcHQ7Ij5IaSBNYWRwcm9wcyw8YnI+Cjxicj4KVGhlIFRTUyBjYW4gYWxzbyBydW4gb24g
UlRPU2VzLiBXZSd2ZSB1c2VkIFNBUEkgb24gdUNzIGJlZm9yZS48YnI+Cjxicj4KV2hhdCB5b3Ug
bmVlZCB0byBkbyBpcyBpbXBsZW1lbnQgYSBUQ1RJLWRyaXZlciBmb3IgeW91ciBSVE9TIGFuZCBX
aXJpbmcgYW5kIHRoZW4gdGhlIFNBUEkgb3IgZXZlbiBFU0FQSSB3b3JrIG91dCBvZiB0aGUgYm94
Ljxicj4KPGJyPgpDaGVlcnMsPGJyPgpBbmRyZWFzPGJyPgo8ZGl2IHN0eWxlPSJmb250LWZhbWls
eTogVGltZXMgTmV3IFJvbWFuOyBjb2xvcjogIzAwMDAwMDsgZm9udC1zaXplOiAxNnB4Ij4KPGhy
IHRhYmluZGV4PSItMSI+CjxkaXYgaWQ9ImRpdlJwRjk2MTciIHN0eWxlPSJkaXJlY3Rpb246IGx0
cjsiPjxmb250IHNpemU9IjIiIGZhY2U9IlRhaG9tYSIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206
PC9iPiB0cG0yIFt0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnXSBvbiBiZWhhbGYgb2YgbWFkcHJv
cHNAZ214Lm5ldCBbbWFkcHJvcHNAZ214Lm5ldF08YnI+CjxiPlNlbnQ6PC9iPiBUaHVyc2RheSwg
QXByaWwgMTksIDIwMTggMTc6MDk8YnI+CjxiPlRvOjwvYj4gdHBtMkBsaXN0cy4wMS5vcmc8YnI+
CjxiPlN1YmplY3Q6PC9iPiBbdHBtMl0gUXVlc3Rpb24gb24gVFBNIDIuMCBpbiBFbWJlZGRlZCBE
ZXZpY2VzPGJyPgo8L2ZvbnQ+PGJyPgo8L2Rpdj4KPGRpdj48L2Rpdj4KPGRpdj4KPGRpdiBzdHls
ZT0iZm9udC1mYW1pbHk6VmVyZGFuYTsgZm9udC1zaXplOjEyLjBweCI+CjxkaXYgY2xhc3M9InNp
Z25hdHVyZSI+CjxkaXY+SGVsbG8gYWxsIC08L2Rpdj4KPGRpdj4mbmJzcDs8L2Rpdj4KPGRpdj5J
J20gbm90IHN1cmUgaWYgdGhpcyBpcyB0aGUgcmlnaHQgZm9ydW0gdG8gYXNrIHRoaXMgcXVlc3Rp
b24sIGJ1dCBtYXliZSBzb21lIG9mIHlvdSBoYXZlIGFuIGlkZWE6PC9kaXY+CjxkaXY+Jm5ic3A7
PC9kaXY+CjxkaXY+SXMgdGhlcmUgYW55IFRQTSAyLjAgbGlicmFyeSwgZHJpdmVyIG9yIHNpbWls
YXIgYXZhaWxhYmxlIGZvciBSZWFsIFRpbWUgT3BlcmF0aW5nIFN5c3RlbXMgc3VjaCBhcyBUaHJl
YWRYPyBJJ20gdGhpbmtpbmcgb3IgZW1iZWRkZWQgZGV2aWNlcyB3aGVyZSB0aGUgVFBNIGNvbm5l
Y3RzIHRvIGEgU29DIHZpYSBTUEksIGFuZCB3aGVyZSB0aGUgYXBwbGljYXRpb24gb24gdGhlIFNv
QyB3YW50cyB0byBpbnRlcmFjdCB3aXRoIHRoZSBUUE0uPC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+
CjxkaXY+VGhhbmtzLjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+Cjwv
Ym9keT4KPC9odG1sPgo=

--===============4989623182910812652==--

