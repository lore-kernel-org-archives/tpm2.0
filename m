Content-Type: multipart/mixed; boundary="===============8408788686515568828=="
MIME-Version: 1.0
From: Arun Sudhir <arunsudhir19 at gmail.com>
Subject: [tpm2] Re: Error Running tpm2-tools in windows against MSSIM
Date: Mon, 30 Sep 2019 11:05:30 -0700
Message-ID: <CAJLNp_UyY+-=CsgZL85Evp6wEUB95TAypCP7mszvm6fjzABhrg@mail.gmail.com>
In-Reply-To: 180f4a44-36de-13ad-ed00-0f17abd1c810@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8408788686515568828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I started the server with tpm_server &

How do I start it up and issue the command that you are mentioning?

On Mon, Sep 30, 2019, 11:01 AM Tadeusz Struk <tadeusz.struk(a)intel.com>
wrote:

> On 9/30/19 10:28 AM, Arun Sudhir wrote:
> > WARNING:esys:api\Esys_GetCapability.c:303:Esys_GetCapability_Finish()
> Received TPM Error
> > ERROR:esys:api\Esys_GetCapability.c:107:Esys_GetCapability() Esys Finish
> ErrorCode (0x00000100)
> > ERROR: Esys_GetCapability(0x100) - tpm:error(2.0): TPM not initialized
> by TPM2_Startup or already initialized
> > ERROR: Unable to run
> C:\Users\arunsu\source\repos\tpm2-tools-4.0\vstudio\x64\Debug\tpm2-getran=
dom.exe
>
> As the above error states the TPM simulator needs to be initialized first.
> Try "tpm2_startup -c" first, before sending other commands.
>
> --
> Tadeusz
>

--===============8408788686515568828==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPkkgc3RhcnRlZCB0aGUgc2VydmVyIHdpdGggdHBtX3NlcnZlciAmYW1w
OzxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPkhvdyBkbyBJIHN0YXJ0
IGl0IHVwIGFuZCBpc3N1ZSB0aGUgY29tbWFuZCB0aGF0IHlvdSBhcmUgbWVudGlvbmluZz88L2Rp
dj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNz
PSJnbWFpbF9hdHRyIj5PbiBNb24sIFNlcCAzMCwgMjAxOSwgMTE6MDEgQU0gVGFkZXVzeiBTdHJ1
ayAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRhZGV1c3ouc3RydWtAaW50ZWwuY29tIj50YWRldXN6LnN0
cnVrQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0i
Z21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2Nj
YyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij5PbiA5LzMwLzE5IDEwOjI4IEFNLCBBcnVuIFN1ZGhp
ciB3cm90ZTo8YnI+CiZndDsgV0FSTklORzplc3lzOmFwaVxFc3lzX0dldENhcGFiaWxpdHkuYzoz
MDM6RXN5c19HZXRDYXBhYmlsaXR5X0ZpbmlzaCgpIFJlY2VpdmVkIFRQTSBFcnJvcjxicj4KJmd0
OyBFUlJPUjplc3lzOmFwaVxFc3lzX0dldENhcGFiaWxpdHkuYzoxMDc6RXN5c19HZXRDYXBhYmls
aXR5KCkgRXN5cyBGaW5pc2ggRXJyb3JDb2RlICgweDAwMDAwMTAwKTxicj4KJmd0OyBFUlJPUjog
RXN5c19HZXRDYXBhYmlsaXR5KDB4MTAwKSAtIHRwbTplcnJvcigyLjApOiBUUE0gbm90IGluaXRp
YWxpemVkIGJ5IFRQTTJfU3RhcnR1cCBvciBhbHJlYWR5IGluaXRpYWxpemVkPGJyPgomZ3Q7IEVS
Uk9SOiBVbmFibGUgdG8gcnVuIEM6XFVzZXJzXGFydW5zdVxzb3VyY2VccmVwb3NcdHBtMi10b29s
cy00LjBcdnN0dWRpb1x4NjRcRGVidWdcdHBtMi1nZXRyYW5kb20uZXhlPGJyPgo8YnI+CkFzIHRo
ZSBhYm92ZSBlcnJvciBzdGF0ZXMgdGhlIFRQTSBzaW11bGF0b3IgbmVlZHMgdG8gYmUgaW5pdGlh
bGl6ZWQgZmlyc3QuPGJyPgpUcnkgJnF1b3Q7dHBtMl9zdGFydHVwIC1jJnF1b3Q7IGZpcnN0LCBi
ZWZvcmUgc2VuZGluZyBvdGhlciBjb21tYW5kcy48YnI+Cjxicj4KLS0gPGJyPgpUYWRldXN6PGJy
Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============8408788686515568828==--

