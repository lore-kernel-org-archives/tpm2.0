Content-Type: multipart/mixed; boundary="===============5433708516437499235=="
MIME-Version: 1.0
From: Trevor Woerner <twoerner at gmail.com>
Subject: [tpm2] dlopen()'ing raw .so files considered bad
Date: Thu, 31 May 2018 16:46:33 -0400
Message-ID: <CAHUNapS5qnzisT4Li6=fS26w0=ydtBX48_16+6aRL20ASE95zQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5433708516437499235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey everyone,

I was playing around with the latest tpm2 tools (i.e. the git master) and I
noticed that this code is now dlopen()'ing the libraries at runtime.

That's a very nice feature, but the way it's been implemented is not
entirely correct.

The filename parameter to dlopen() should be a library's SONAME, not the
raw .so file. The raw .so file is considered a -dev or -devel package
component, not a component of the library package itself. The raw .so
exists as a develop crutch, but shouldn't be used in production.

The raw .so will always point to the latest shared library object. But in
an ideal world, the shared library's API should be denoted by the first
number after ".so.". It would be extremely unlikely that the programs
linking to today's TSS (with its current API) would continue to work should
an API-breaking change occur in the future (thus requiring the first number
after ".so." to be incremented).

In other words, programs should dlopen() a specific API (e.g. ".so.0") and
not just "the latest" (i.e. ".so").

Please see https://lists.debian.org/debian-policy/2002/12/msg00041.html,
for example.

As is, this is going to mess up people packaging this software for various
distros, and users trying to use this software (since they'll have to
install the -dev packages for it to work, which can get messy for
non-developer users).

Thanks and best regards,
    Trevor

--===============5433708516437499235==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IZXkgZXZlcnlvbmUsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5JIHdhcyBwbGF5aW5nIGFyb3VuZCB3aXRoIHRoZSBsYXRlc3QgdHBtMiB0b29scyAoaS5lLiB0
aGUgZ2l0IG1hc3RlcikgYW5kIEkgbm90aWNlZCB0aGF0IHRoaXMgY29kZSBpcyBub3cgZGxvcGVu
KCkmIzM5O2luZyB0aGUgbGlicmFyaWVzIGF0IHJ1bnRpbWUuPC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5UaGF0JiMzOTtzIGEgdmVyeSBuaWNlIGZlYXR1cmUsIGJ1dCB0aGUgd2F5IGl0JiMzOTtz
IGJlZW4gaW1wbGVtZW50ZWQgaXMgbm90IGVudGlyZWx5IGNvcnJlY3QuPC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5UaGUgZmlsZW5hbWUgcGFyYW1ldGVyIHRvIGRsb3BlbigpIHNob3VsZCBiZSBh
IGxpYnJhcnkmIzM5O3MgU09OQU1FLCBub3QgdGhlIHJhdyAuc28gZmlsZS4gVGhlIHJhdyAuc28g
ZmlsZSBpcyBjb25zaWRlcmVkIGEgLWRldiBvciAtZGV2ZWwgcGFja2FnZSBjb21wb25lbnQsIG5v
dCBhIGNvbXBvbmVudCBvZiB0aGUgbGlicmFyeSBwYWNrYWdlIGl0c2VsZi4gVGhlIHJhdyAuc28g
ZXhpc3RzIGFzIGEgZGV2ZWxvcCBjcnV0Y2gsIGJ1dCBzaG91bGRuJiMzOTt0IGJlIHVzZWQgaW4g
cHJvZHVjdGlvbi48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZSByYXcgLnNvIHdpbGwgYWx3
YXlzIHBvaW50IHRvIHRoZSBsYXRlc3Qgc2hhcmVkIGxpYnJhcnkgb2JqZWN0LiBCdXQgaW4gYW4g
aWRlYWwgd29ybGQsIHRoZSBzaGFyZWQgbGlicmFyeSYjMzk7cyBBUEkgc2hvdWxkIGJlIGRlbm90
ZWQgYnkgdGhlIGZpcnN0IG51bWJlciBhZnRlciAmcXVvdDsuc28uJnF1b3Q7LiBJdCB3b3VsZCBi
ZSBleHRyZW1lbHkgdW5saWtlbHkgdGhhdCB0aGUgcHJvZ3JhbXMgbGlua2luZyB0byB0b2RheSYj
Mzk7cyBUU1MgKHdpdGggaXRzIGN1cnJlbnQgQVBJKSB3b3VsZCBjb250aW51ZSB0byB3b3JrIHNo
b3VsZCBhbiBBUEktYnJlYWtpbmcgY2hhbmdlIG9jY3VyIGluIHRoZSBmdXR1cmUgKHRodXMgcmVx
dWlyaW5nIHRoZSBmaXJzdCBudW1iZXIgYWZ0ZXIgJnF1b3Q7LnNvLiZxdW90OyB0byBiZSBpbmNy
ZW1lbnRlZCkuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JbiBvdGhlciB3b3JkcywgcHJvZ3Jh
bXMgc2hvdWxkIGRsb3BlbigpIGEgc3BlY2lmaWMgQVBJIChlLmcuICZxdW90Oy5zby4wJnF1b3Q7
KSBhbmQgbm90IGp1c3QgJnF1b3Q7dGhlIGxhdGVzdCZxdW90OyAoaS5lLiAmcXVvdDsuc28mcXVv
dDspLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+UGxlYXNlIHNlZSA8YSBocmVmPSJodHRwczov
L2xpc3RzLmRlYmlhbi5vcmcvZGViaWFuLXBvbGljeS8yMDAyLzEyL21zZzAwMDQxLmh0bWwiPmh0
dHBzOi8vbGlzdHMuZGViaWFuLm9yZy9kZWJpYW4tcG9saWN5LzIwMDIvMTIvbXNnMDAwNDEuaHRt
bDwvYT4sIGZvciBleGFtcGxlLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QXMgaXMsIHRoaXMg
aXMgZ29pbmcgdG8gbWVzcyB1cCBwZW9wbGUgcGFja2FnaW5nIHRoaXMgc29mdHdhcmUgZm9yIHZh
cmlvdXMgZGlzdHJvcywgYW5kIHVzZXJzIHRyeWluZyB0byB1c2UgdGhpcyBzb2Z0d2FyZSAoc2lu
Y2UgdGhleSYjMzk7bGwgaGF2ZSB0byBpbnN0YWxsIHRoZSAtZGV2IHBhY2thZ2VzIGZvciBpdCB0
byB3b3JrLCB3aGljaCBjYW4gZ2V0IG1lc3N5IGZvciBub24tZGV2ZWxvcGVyIHVzZXJzKS48YnI+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MgYW5kIGJlc3QgcmVnYXJkcyw8L2Rpdj48
ZGl2PsKgwqDCoCBUcmV2b3I8YnI+PC9kaXY+PC9kaXY+Cg==

--===============5433708516437499235==--

