Content-Type: multipart/mixed; boundary="===============9175052166310369546=="
MIME-Version: 1.0
From: Han <keepsimple at gmail.com>
Subject: [tpm2] Re: tpm2_flushcontext stuck
Date: Mon, 20 Dec 2021 11:13:25 -0800
Message-ID: <CAEjGaqecH0q-wFbQbNNPAS_R-bh0BqXFFWhweT4VA-gESe5qVw@mail.gmail.com>
In-Reply-To: 964b6c7d-f045-c93a-d260-363c79eee8fb@gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9175052166310369546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for your responses. They are really helpful to me. Such a fix will
also help me understand how TPM works.

And as a newbie, I felt that the fact TPM exposes two devices (/dev/tpm0
and /dev/tpmrm0) under Linux is confusing and is making
things more complicated.  The architecture diagram (
https://github.com/tpm2-software/tpm2-tss) shows all calls go through the
Resource Manager but that is not the case in reality.  I was wondering what
is the benefit to have 2 devices instead of just one device in linux?

Thanks.


On Mon, Dec 20, 2021 at 10:57 AM Tadeusz Struk <tstruk(a)gmail.com> wrote:

> On 12/19/21 04:17, Juergen Repp wrote:
> > Am 18.12.21 um 20:34 schrieb Han:
> >> I probably missed it,  how can I specify to make sure /dev/tpm0 is
> used, and not /dev/tpmrm0 ?  Is it in some configurations?
> >>
> > You can use the TPM without resource manager with:
> >
> > tpm2_createprimary  -Tdevice:/dev/tpm0 -C o -g sha256 -G ecc -c
> primary.ctx
> > tpm2_getcap handles-transient -Tdevice:/dev/tpm0
> > tpm2_flushcontext -Tdevice:/dev/tpm0 0x80000000
>
> The problem is that when /dev/tpm0 is used it just sends a request
> straight to
> the tpm and the tpm responds with a valid error message, which it then
> passed
> back to tcti. In case of /dev/tpmrm0 the RM tries to first load the none
> existing object 0x80000000 from its cash, but since it cannot find it just
> returns an error code -22 (EINVAL) and nothing gets send to the tpm.
> The tpm_dev_async_work() handler needs to be modified to handle such error
> cases
> as well. I will send a fix for this.
>
> Thanks,
> --
> Tadeusz
>

--===============9175052166310369546==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzIGZvciB5b3VyIHJlc3BvbnNlcy4gVGhleSBhcmUgcmVhbGx5
wqBoZWxwZnVsIHRvIG1lLiBTdWNoIGEgZml4IHdpbGwgYWxzbyBoZWxwIG1lIHVuZGVyc3RhbmQg
aG93IFRQTSB3b3Jrcy7CoDxkaXY+PGJyPjwvZGl2PjxkaXY+QW5kIGFzIGEgbmV3YmllLCBJIGZl
bHQgdGhhdCB0aGUgZmFjdCBUUE0gZXhwb3NlcyB0d28gZGV2aWNlcyAoL2Rldi90cG0wIGFuZCAv
ZGV2L3RwbXJtMCkgdW5kZXIgTGludXggaXMgY29uZnVzaW5nIGFuZCBpcyBtYWtpbmcgdGhpbmdz
wqBtb3JlwqBjb21wbGljYXRlZC7CoCBUaGUgYXJjaGl0ZWN0dXJlIGRpYWdyYW0gKDxhIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzIj5odHRwczovL2dpdGh1
Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzczwvYT4pIHNob3dzIGFsbCBjYWxscyBnbyB0aHJv
dWdoIHRoZSBSZXNvdXJjZSBNYW5hZ2VyIGJ1dCB0aGF0IGlzIG5vdCB0aGUgY2FzZSBpbiByZWFs
aXR5LsKgIEkgd2FzIHdvbmRlcmluZyB3aGF0IGlzIHRoZSBiZW5lZml0IHRvIGhhdmUgMiBkZXZp
Y2VzIGluc3RlYWQgb2YganVzdCBvbmUgZGV2aWNlIGluIGxpbnV4P8KgPC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5UaGFua3MuPC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xh
c3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gTW9u
LCBEZWMgMjAsIDIwMjEgYXQgMTA6NTcgQU0gVGFkZXVzeiBTdHJ1ayAmbHQ7PGEgaHJlZj0ibWFp
bHRvOnRzdHJ1a0BnbWFpbC5jb20iPnRzdHJ1a0BnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+
PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAw
cHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRp
bmctbGVmdDoxZXgiPk9uIDEyLzE5LzIxIDA0OjE3LCBKdWVyZ2VuIFJlcHAgd3JvdGU6PGJyPgom
Z3Q7IEFtIDE4LjEyLjIxIHVtIDIwOjM0IHNjaHJpZWIgSGFuOjxicj4KJmd0OyZndDsgSSBwcm9i
YWJseSBtaXNzZWQgaXQswqAgaG93IGNhbiBJIHNwZWNpZnkgdG8gbWFrZSBzdXJlIC9kZXYvdHBt
MCBpcyB1c2VkLCBhbmQgbm90IC9kZXYvdHBtcm0wwqA/wqAgSXMgaXQgaW4gc29tZSBjb25maWd1
cmF0aW9ucz88YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7IFlvdSBjYW4gdXNlIHRoZSBUUE0gd2l0aG91
dCByZXNvdXJjZSBtYW5hZ2VyIHdpdGg6PGJyPgomZ3Q7IDxicj4KJmd0OyB0cG0yX2NyZWF0ZXBy
aW1hcnnCoCAtVGRldmljZTovZGV2L3RwbTAgLUMgbyAtZyBzaGEyNTYgLUcgZWNjIC1jIHByaW1h
cnkuY3R4PGJyPgomZ3Q7IHRwbTJfZ2V0Y2FwIGhhbmRsZXMtdHJhbnNpZW50IC1UZGV2aWNlOi9k
ZXYvdHBtMDxicj4KJmd0OyB0cG0yX2ZsdXNoY29udGV4dCAtVGRldmljZTovZGV2L3RwbTAgMHg4
MDAwMDAwMDxicj4KPGJyPgpUaGUgcHJvYmxlbSBpcyB0aGF0IHdoZW4gL2Rldi90cG0wIGlzIHVz
ZWQgaXQganVzdCBzZW5kcyBhIHJlcXVlc3Qgc3RyYWlnaHQgdG88YnI+CnRoZSB0cG0gYW5kIHRo
ZSB0cG0gcmVzcG9uZHMgd2l0aCBhIHZhbGlkIGVycm9yIG1lc3NhZ2UsIHdoaWNoIGl0IHRoZW4g
cGFzc2VkIDxicj4KYmFjayB0byB0Y3RpLiBJbiBjYXNlIG9mIC9kZXYvdHBtcm0wIHRoZSBSTSB0
cmllcyB0byBmaXJzdCBsb2FkIHRoZSBub25lIDxicj4KZXhpc3Rpbmcgb2JqZWN0IDB4ODAwMDAw
MDAgZnJvbSBpdHMgY2FzaCwgYnV0IHNpbmNlIGl0IGNhbm5vdCBmaW5kIGl0IGp1c3Q8YnI+CnJl
dHVybnMgYW4gZXJyb3IgY29kZSAtMjIgKEVJTlZBTCkgYW5kIG5vdGhpbmcgZ2V0cyBzZW5kIHRv
IHRoZSB0cG0uPGJyPgpUaGUgdHBtX2Rldl9hc3luY193b3JrKCkgaGFuZGxlciBuZWVkcyB0byBi
ZSBtb2RpZmllZCB0byBoYW5kbGUgc3VjaCBlcnJvciBjYXNlczxicj4KYXMgd2VsbC4gSSB3aWxs
IHNlbmQgYSBmaXggZm9yIHRoaXMuPGJyPgo8YnI+ClRoYW5rcyw8YnI+Ci0tPGJyPgpUYWRldXN6
PGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============9175052166310369546==--

