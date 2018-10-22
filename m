Content-Type: multipart/mixed; boundary="===============6132829228897619661=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: Re: [tpm2] There is no '-I' option for tpm2_rsaencrypt which I found
 it in the doc.
Date: Mon, 22 Oct 2018 10:38:17 +0800
Message-ID: <CA+tBKVhrdZp+oDYPtrbC-9cDczuaQjU1+1eQiykHuOhBS5Zw4Q@mail.gmail.com>
In-Reply-To: 82664f73d081578de7dc45fb804ab4527fede427.camel@linux.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6132829228897619661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks, I'll check it out.

On Fri, Oct 19, 2018 at 8:10 PM Joshua Lock <joshua.g.lock(a)linux.intel.co=
m>
wrote:

> On Fri, 2018-10-19 at 16:36 +0800, Terry An wrote:
> > [root(a)localhost Test]# tpm2_rsaencrypt -I data.in -c obj.ctx  -o
> > data.encrypted
> > tpm2_rsaencrypt: invalid option -- 'I'
> > [root(a)localhost Test]#
>
> I see the example was incorrect in both the 3.0.X and 3.X branches,
> I've sent pull requests to update.
>
> You want:
> # tpm2_rsaencrypt -c obj.ctx -o data.encrypted data.in
>
> Joshua
>
>

--===============6132829228897619661==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzLCBJJiMzOTtsbCBjaGVjayBpdCBvdXQuwqA8YnI+PC9kaXY+
PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIj5PbiBGcmksIE9jdCAx
OSwgMjAxOCBhdCA4OjEwIFBNIEpvc2h1YSBMb2NrICZsdDs8YSBocmVmPSJtYWlsdG86am9zaHVh
LmcubG9ja0BsaW51eC5pbnRlbC5jb20iPmpvc2h1YS5nLmxvY2tAbGludXguaW50ZWwuY29tPC9h
PiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5
bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmct
bGVmdDoxZXgiPk9uIEZyaSwgMjAxOC0xMC0xOSBhdCAxNjozNiArMDgwMCwgVGVycnkgQW4gd3Jv
dGU6PGJyPgomZ3Q7IFtyb290QGxvY2FsaG9zdCBUZXN0XSMgdHBtMl9yc2FlbmNyeXB0IC1JIDxh
IGhyZWY9Imh0dHA6Ly9kYXRhLmluIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5k
YXRhLmluPC9hPiAtYyBvYmouY3R4wqAgLW88YnI+CiZndDsgZGF0YS5lbmNyeXB0ZWQgPGJyPgom
Z3Q7IHRwbTJfcnNhZW5jcnlwdDogaW52YWxpZCBvcHRpb24gLS0gJiMzOTtJJiMzOTs8YnI+CiZn
dDsgW3Jvb3RAbG9jYWxob3N0IFRlc3RdIzxicj4KPGJyPgpJIHNlZSB0aGUgZXhhbXBsZSB3YXMg
aW5jb3JyZWN0IGluIGJvdGggdGhlIDMuMC5YIGFuZCAzLlggYnJhbmNoZXMsPGJyPgpJJiMzOTt2
ZSBzZW50IHB1bGwgcmVxdWVzdHMgdG8gdXBkYXRlLjxicj4KPGJyPgpZb3Ugd2FudDo8YnI+CiMg
dHBtMl9yc2FlbmNyeXB0IC1jIG9iai5jdHggLW8gZGF0YS5lbmNyeXB0ZWQgPGEgaHJlZj0iaHR0
cDovL2RhdGEuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmRhdGEuaW48L2E+
PGJyPgo8YnI+Ckpvc2h1YTxicj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============6132829228897619661==--

