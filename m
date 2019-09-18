Content-Type: multipart/mixed; boundary="===============8351577044735059340=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] Incomplete TPM event log on Linux?
Date: Wed, 18 Sep 2019 13:41:36 -0700
Message-ID: <CANKkrzEGxRaNq2G9=rwemoFosucbMd5QxgC1=GQ6FXE9O02KoQ@mail.gmail.com>
In-Reply-To: e115c94b-69ac-0290-9082-a1e978755dbc@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8351577044735059340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 1:18 PM Tadeusz Struk <tadeusz.struk(a)intel.com>
wrote:

> Probably not relevant anymore since you have narrowed it down to the shim,
> but just to keep in mind that the IAM can also extend PCRs after boot if
> it is enabled:
>
> https://elixir.bootlin.com/linux/latest/source/security/integrity/ima/ima=
_queue.c#L194


Thanks, I was sort-of aware of that / suspecting that was the case. Good to
know that's the case for sure though.

For better or worse, Debian doesn't enable IMA in its kernels, so I haven't
looked into getting it to work yet. :/ (From
https://metadata.ftp-master.debian.org/changelogs//main/l/linux/linux_4.19.=
67-2_changelog,
"Disable IMA until it works properly with lockdown")

--===============8351577044735059340==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNs
YXNzPSJnbWFpbF9hdHRyIj5PbiBXZWQsIFNlcCAxOCwgMjAxOSBhdCAxOjE4IFBNIFRhZGV1c3og
U3RydWsgJmx0OzxhIGhyZWY9Im1haWx0bzp0YWRldXN6LnN0cnVrQGludGVsLmNvbSI+dGFkZXVz
ei5zdHJ1a0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xh
c3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4
ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+UHJvYmFibHkgbm90IHJlbGV2YW50IGFueW1v
cmUgc2luY2UgeW91IGhhdmUgbmFycm93ZWQgaXQgZG93biB0byB0aGUgc2hpbSw8YnI+CmJ1dCBq
dXN0IHRvIGtlZXAgaW4gbWluZCB0aGF0IHRoZSBJQU0gY2FuIGFsc28gZXh0ZW5kIFBDUnMgYWZ0
ZXIgYm9vdCBpZiBpdCBpcyBlbmFibGVkOjxicj4KPGEgaHJlZj0iaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9x
dWV1ZS5jI0wxOTQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2Uvc2VjdXJpdHkvaW50ZWdyaXR5L2lt
YS9pbWFfcXVldWUuYyNMMTk0PC9hPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PlRo
YW5rcywgSSB3YXMgc29ydC1vZiBhd2FyZSBvZiB0aGF0IC8gc3VzcGVjdGluZyB0aGF0IHdhcyB0
aGUgY2FzZS4gR29vZCB0byBrbm93IHRoYXQmIzM5O3MgdGhlIGNhc2UgZm9yIHN1cmUgdGhvdWdo
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Rm9yIGJldHRlciBvciB3b3JzZSwgRGViaWFuIGRv
ZXNuJiMzOTt0IGVuYWJsZSBJTUEgaW4gaXRzIGtlcm5lbHMsIHNvIEkgaGF2ZW4mIzM5O3QgbG9v
a2VkIGludG8gZ2V0dGluZyBpdCB0byB3b3JrIHlldC4gOi8gKEZyb23CoDxhIGhyZWY9Imh0dHBz
Oi8vbWV0YWRhdGEuZnRwLW1hc3Rlci5kZWJpYW4ub3JnL2NoYW5nZWxvZ3MvL21haW4vbC9saW51
eC9saW51eF80LjE5LjY3LTJfY2hhbmdlbG9nIj5odHRwczovL21ldGFkYXRhLmZ0cC1tYXN0ZXIu
ZGViaWFuLm9yZy9jaGFuZ2Vsb2dzLy9tYWluL2wvbGludXgvbGludXhfNC4xOS42Ny0yX2NoYW5n
ZWxvZzwvYT4sICZxdW90O0Rpc2FibGUgSU1BIHVudGlsIGl0IHdvcmtzIHByb3Blcmx5IHdpdGgg
bG9ja2Rvd24mcXVvdDspPC9kaXY+PC9kaXY+PC9kaXY+Cg==

--===============8351577044735059340==--

