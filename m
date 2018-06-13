Content-Type: multipart/mixed; boundary="===============2212672074683646895=="
MIME-Version: 1.0
From: =?utf-8?q?Gabriela_Limonta_M=C3=A1rquez_=3Cglimonta_at_gmail=2Ecom=3E?=
Subject: Re: [tpm2] Policy check fails writing to NVRAM > 512B
Date: Wed, 13 Jun 2018 21:31:37 +0300
Message-ID: <CA+HVzV3uQGJV0X5SaHhfTZkaFOBHBzWf2p6AaPiyqWR7BqKrpA@mail.gmail.com>
In-Reply-To: 1ae2f36e-7bc1-6529-e532-c5b281f60da6@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2212672074683646895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yes, I noticed the same.
I tried recompiling it anyway with the command line options
"--with-maxloglevel=3Dtrace --enable-debug" but it made no difference.
The commands are being run without sudo, just a regular user.

Best,
Gabriela

2018-06-13 21:28 GMT+03:00 Tadeusz Struk <tadeusz.struk(a)intel.com>:

> On 06/13/2018 11:13 AM, Tadeusz Struk wrote:
> > On 06/13/2018 11:06 AM, Gabriela Limonta M=C3=A1rquez wrote:
> >> $ export TSS2_LOG=3D"all+ERROR,tcti+TRACE"
> >>
> >> $ tpm2_nvwrite -x 0x1800005 -a 0x1800005 -L sha256:0 -F pcr.value
> ta_config.cfg
> >> ERROR: Failed to write NV area at index 0x1800005 (25165829) offset
> 0x200. Error:0x99d
> >> ERROR: Unable to run tpm2_nvwrite
> >>
> >> Am I doing something wrong? or are the TSS logs available somewhere
> else after I execute the command and that is why I see nothing?
> >>
> >> I also tried enabling logging as TSS2_LOG=3D"all+TRACE", but I only see
> debug and trace logs from marshal and none of them say error or anything
> similar.
> >
> > That all looks good. The only thing that's probably missing is that the
> debug is not compiled into TSS.
> > It needs to be enabled at compile time by --with-maxloglevel=3Dtrace
> > Please see ./configure --help
> > Could you recompile TSS with that enabled and try again.
>
> Just looked at the config and see that the 'trace' is the default if you
> build it from the repo.
> Are you running your commands with sudo by any chance?
> Thanks,
> --
> Tadeusz
>

--===============2212672074683646895==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFt
aWx5OnRyZWJ1Y2hldCBtcyxzYW5zLXNlcmlmIj5ZZXMsIEkgbm90aWNlZCB0aGUgc2FtZS48L2Rp
dj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1mYW1pbHk6dHJlYnVjaGV0
IG1zLHNhbnMtc2VyaWYiPkkgdHJpZWQgcmVjb21waWxpbmcgaXQgYW55d2F5IHdpdGggdGhlIGNv
bW1hbmQgbGluZSBvcHRpb25zICZxdW90Oy0td2l0aC1tYXhsb2dsZXZlbD10cmFjZSAtLWVuYWJs
ZS1kZWJ1ZyZxdW90OyBidXQgaXQgbWFkZSBubyBkaWZmZXJlbmNlLjwvZGl2PjxkaXYgY2xhc3M9
ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTp0cmVidWNoZXQgbXMsc2Fucy1zZXJp
ZiI+VGhlIGNvbW1hbmRzIGFyZSBiZWluZyBydW4gd2l0aG91dCBzdWRvLCBqdXN0IGEgcmVndWxh
ciB1c2VyLjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LWZhbWls
eTp0cmVidWNoZXQgbXMsc2Fucy1zZXJpZiI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2Rl
ZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTp0cmVidWNoZXQgbXMsc2Fucy1zZXJpZiI+QmVzdCw8
L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1mYW1pbHk6dHJlYnVj
aGV0IG1zLHNhbnMtc2VyaWYiPkdhYnJpZWxhPC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxf
ZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+MjAxOC0wNi0xMyAyMToyOCBHTVQr
MDM6MDAgVGFkZXVzeiBTdHJ1ayA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzp0
YWRldXN6LnN0cnVrQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnRhZGV1c3ouc3RydWtAaW50
ZWwuY29tPC9hPiZndDs8L3NwYW4+Ojxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRk
aW5nLWxlZnQ6MWV4Ij48c3BhbiBjbGFzcz0iIj5PbiAwNi8xMy8yMDE4IDExOjEzIEFNLCBUYWRl
dXN6IFN0cnVrIHdyb3RlOjxicj4KJmd0OyBPbiAwNi8xMy8yMDE4IDExOjA2IEFNLCBHYWJyaWVs
YSBMaW1vbnRhIE3DoXJxdWV6IHdyb3RlOjxicj4KJmd0OyZndDsgJCBleHBvcnQgVFNTMl9MT0c9
JnF1b3Q7YWxsK0VSUk9SLHRjdGkrPHdicj5UUkFDRSZxdW90Ozxicj4KJmd0OyZndDs8YnI+CiZn
dDsmZ3Q7ICQgdHBtMl9udndyaXRlIC14IDB4MTgwMDAwNSAtYSAweDE4MDAwMDUgLUwgc2hhMjU2
OjAgLUYgcGNyLnZhbHVlIHRhX2NvbmZpZy5jZmc8YnI+CiZndDsmZ3Q7IEVSUk9SOiBGYWlsZWQg
dG8gd3JpdGUgTlYgYXJlYSBhdCBpbmRleCAweDE4MDAwMDUgKDI1MTY1ODI5KSBvZmZzZXQgMHgy
MDAuIEVycm9yOjB4OTlkPGJyPgomZ3Q7Jmd0OyBFUlJPUjogVW5hYmxlIHRvIHJ1biB0cG0yX252
d3JpdGU8YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyBBbSBJIGRvaW5nIHNvbWV0aGluZyB3cm9u
Zz8gb3IgYXJlIHRoZSBUU1MgbG9ncyBhdmFpbGFibGUgc29tZXdoZXJlIGVsc2UgYWZ0ZXIgSSBl
eGVjdXRlIHRoZSBjb21tYW5kIGFuZCB0aGF0IGlzIHdoeSBJIHNlZSBub3RoaW5nPzxicj4KJmd0
OyZndDs8YnI+CiZndDsmZ3Q7IEkgYWxzbyB0cmllZCBlbmFibGluZyBsb2dnaW5nIGFzIFRTUzJf
TE9HPSZxdW90O2FsbCtUUkFDRSZxdW90OywgYnV0IEkgb25seSBzZWUgZGVidWcgYW5kIHRyYWNl
IGxvZ3MgZnJvbSBtYXJzaGFsIGFuZCBub25lIG9mIHRoZW0gc2F5IGVycm9yIG9yIGFueXRoaW5n
IHNpbWlsYXIuPGJyPgomZ3Q7IDxicj4KJmd0OyBUaGF0IGFsbCBsb29rcyBnb29kLiBUaGUgb25s
eSB0aGluZyB0aGF0JiMzOTtzIHByb2JhYmx5IG1pc3NpbmcgaXMgdGhhdCB0aGUgZGVidWcgaXMg
bm90IGNvbXBpbGVkIGludG8gVFNTLjxicj4KJmd0OyBJdCBuZWVkcyB0byBiZSBlbmFibGVkIGF0
IGNvbXBpbGUgdGltZSBieSAtLXdpdGgtbWF4bG9nbGV2ZWw9dHJhY2U8YnI+CiZndDsgUGxlYXNl
IHNlZSAuL2NvbmZpZ3VyZSAtLWhlbHA8YnI+CiZndDsgQ291bGQgeW91IHJlY29tcGlsZSBUU1Mg
d2l0aCB0aGF0IGVuYWJsZWQgYW5kIHRyeSBhZ2Fpbi48YnI+Cjxicj4KPC9zcGFuPkp1c3QgbG9v
a2VkIGF0IHRoZSBjb25maWcgYW5kIHNlZSB0aGF0IHRoZSAmIzM5O3RyYWNlJiMzOTsgaXMgdGhl
IGRlZmF1bHQgaWYgeW91IGJ1aWxkIGl0IGZyb20gdGhlIHJlcG8uPGJyPgpBcmUgeW91IHJ1bm5p
bmcgeW91ciBjb21tYW5kcyB3aXRoIHN1ZG8gYnkgYW55IGNoYW5jZT88YnI+ClRoYW5rcyw8YnI+
CjxzcGFuIGNsYXNzPSJIT0VuWmIiPjxmb250IGNvbG9yPSIjODg4ODg4Ij4tLSA8YnI+ClRhZGV1
c3o8YnI+CjwvZm9udD48L3NwYW4+PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48L2Rpdj4K

--===============2212672074683646895==--

