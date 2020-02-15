Content-Type: multipart/mixed; boundary="===============5567021931463973386=="
MIME-Version: 1.0
From: Chris Richardson <chris.richardson77 at gmail.com>
Subject: [tpm2] Resource Mgr, resMgr, failed initialization: 0x1
Date: Sat, 15 Feb 2020 11:02:23 +0000
Message-ID: <CAJ0SV8M6Q2UFw8XYHeNyTD-uqoEr7CZ-9JQQ+pin+DVbpdtEmw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5567021931463973386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to use tpm2-tools on Ubuntu 18.04.4 LTS. When I try to use eg:
tpm2.takeownership -c
I get an error message saying
Resource Mgr, resMgr, failed initialization: 0x1.  Exiting...

A packet trace shows a connection attempt to port 2324, but there's nothing
listening on that port even though my tpm2-tabrmd service reports that it's
running OK, which I assume means it's successfully connected to /dev/tpm0
(owned by tss) and the dbus daemon.

I did have versions of tools installed from apt and snap but I've removed
them (I think) and am now using
tpm2-abrmd-2.3.1
tpm2-tools-4.1.1
tpm2-tss-2.3.2
all built from source, using entirely default settings.

Am I missing something? I seem to be lacking a resource manager of some
sort...

Thanks in advance

Chris

--===============5567021931463973386==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5O20g
dHJ5aW5nIHRvIHVzZSB0cG0yLXRvb2xzIG9uIFVidW50dSAxOC4wNC40IExUUy4gV2hlbiBJIHRy
eSB0byB1c2UgZWc6PC9kaXY+PGRpdj50cG0yLnRha2Vvd25lcnNoaXAgLWM8L2Rpdj48ZGl2Pkkg
Z2V0IGFuIGVycm9yIG1lc3NhZ2Ugc2F5aW5nIDxicj48L2Rpdj48ZGl2PlJlc291cmNlIE1nciwg
cmVzTWdyLCBmYWlsZWQgaW5pdGlhbGl6YXRpb246IDB4MS7CoCBFeGl0aW5nLi4uPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5BIHBhY2tldCB0cmFjZSBzaG93cyBhIGNvbm5lY3Rpb24gYXR0ZW1w
dCB0byBwb3J0IDIzMjQsIGJ1dCB0aGVyZSYjMzk7cyBub3RoaW5nIGxpc3RlbmluZyBvbiB0aGF0
IHBvcnQgZXZlbiB0aG91Z2ggbXkgdHBtMi10YWJybWQgc2VydmljZSByZXBvcnRzIHRoYXQgaXQm
IzM5O3MgcnVubmluZyBPSywgd2hpY2ggSSBhc3N1bWUgbWVhbnMgaXQmIzM5O3Mgc3VjY2Vzc2Z1
bGx5IGNvbm5lY3RlZCB0byAvZGV2L3RwbTAgKG93bmVkIGJ5IHRzcykgYW5kIHRoZSBkYnVzIGRh
ZW1vbi48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGRpZCBoYXZlIHZlcnNpb25zIG9m
IHRvb2xzIGluc3RhbGxlZCBmcm9tIGFwdCBhbmQgc25hcCBidXQgSSYjMzk7dmUgcmVtb3ZlZCB0
aGVtIChJIHRoaW5rKSBhbmQgYW0gbm93IHVzaW5nIDxicj48L2Rpdj48ZGl2PnRwbTItYWJybWQt
Mi4zLjE8L2Rpdj48ZGl2PnRwbTItdG9vbHMtNC4xLjE8L2Rpdj48ZGl2PnRwbTItdHNzLTIuMy4y
PC9kaXY+PGRpdj5hbGwgYnVpbHQgZnJvbSBzb3VyY2UsIHVzaW5nIGVudGlyZWx5IGRlZmF1bHQg
c2V0dGluZ3MuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QW0gSSBtaXNzaW5nIHNvbWV0
aGluZz8gSSBzZWVtIHRvIGJlIGxhY2tpbmcgYSByZXNvdXJjZSBtYW5hZ2VyIG9mIHNvbWUgc29y
dC4uLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmtzIGluIGFkdmFuY2U8L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PkNocmlzPGJyPjwvZGl2PjwvZGl2Pgo=

--===============5567021931463973386==--

