Content-Type: multipart/mixed; boundary="===============2760958224746916153=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: [tpm2] tpm2-abrmd in a container
Date: Mon, 04 Feb 2019 15:46:31 +0000
Message-ID: <CAKrSGQQj4SSifdM78ELkw0LtoZbE1MEJ888EC0Ld_xK7D9gdjw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2760958224746916153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I have been working on trying to get tpm2-abrmd running in a container, but
its proving problematic as there is a requirement on system-d and dbus.
This in turn requires running the container as privileged and mounting the
hosts cgroup (and adding cap sys-admin).

My reason for using a container, is for CI / functional testing of a
project that will use abrmd and having a lightweight means to test against
the resource manager running in a container.

I am still early in looking at ways to achieve this, so I wanted to ask if
any others have snippets of previous attempts (successful or not) they
could share?

Thanks,

Luke

--===============2760958224746916153==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGVsbG8sPGRpdj48
YnI+PC9kaXY+PGRpdj5JIGhhdmUgYmVlbiB3b3JraW5nIG9uIHRyeWluZyB0byBnZXQgdHBtMi1h
YnJtZCBydW5uaW5nIGluIGEgY29udGFpbmVyLCBidXQgaXRzIHByb3ZpbmcgcHJvYmxlbWF0aWMg
YXMgdGhlcmUgaXMgYSByZXF1aXJlbWVudCBvbiBzeXN0ZW0tZCBhbmQgZGJ1cy4gVGhpcyBpbiB0
dXJuIHJlcXVpcmVzIHJ1bm5pbmcgdGhlIGNvbnRhaW5lciBhcyBwcml2aWxlZ2VkIGFuZCBtb3Vu
dGluZyB0aGUgaG9zdHMgY2dyb3VwIChhbmQgYWRkaW5nIGNhcCBzeXMtYWRtaW4pLjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+TXkgcmVhc29uIGZvciB1c2luZyBhIGNvbnRhaW5lciwgaXMgZm9y
IENJIC8gZnVuY3Rpb25hbCB0ZXN0aW5nIG9mIGEgcHJvamVjdCB0aGF0IHdpbGwgdXNlIGFicm1k
wqBhbmQgaGF2aW5nIGEgbGlnaHR3ZWlnaHQgbWVhbnMgdG8gdGVzdCBhZ2FpbnN0IHRoZSByZXNv
dXJjZSBtYW5hZ2VyIHJ1bm5pbmcgaW4gYSBjb250YWluZXIuwqA8L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PkkgYW0gc3RpbGwgZWFybHkgaW4gbG9va2luZyBhdCB3YXlzIHRvIGFjaGlldmUgdGhp
cywgc28gSSB3YW50ZWQgdG8gYXNrIGlmIGFueSBvdGhlcnMgaGF2ZSBzbmlwcGV0cyBvZiBwcmV2
aW91cyBhdHRlbXB0cyAoc3VjY2Vzc2Z1bCBvciBub3QpIHRoZXkgY291bGQgc2hhcmU/PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5MdWtl
PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+Cg==

--===============2760958224746916153==--

