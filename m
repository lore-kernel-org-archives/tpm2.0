Content-Type: multipart/mixed; boundary="===============2208749230586165859=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] Remote Attestation
Date: Thu, 29 Aug 2019 11:12:12 -0700
Message-ID: <CANKkrzFq5xQ7viWwbEb6PavMSVBnNBR_Y3FpdFuFctqVm-DAEA@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DEFABA@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2208749230586165859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 9:36 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> FYI bear in mind these are in host endianness, so if you switch
> architecture endianness
> You need to convert these. It would be wise to serialize these properly
> before sending
> off the host. Im just using libmu to serialize, which doesn't deal with
> endianness IRRC/IUUC.


Thanks for pointing out that concern. I think tpm2-tools *should* work
across hosts, but it seems like there might still be some issues with that
currently.

tss2-mu serializes integers to network order; and it has to, because the
TPM spec defines command/response protocol use network order (Part 1,
Section 7.1).

tpm2-tools also looks like it does appropriate endianness swapping in
lib/files.c's files_{read,write}_{16,32,64} functions.

So that much seems good.


However, I see that at least tools/tpm2_quote.c's write_pcr_values function
directly fwrites some data structures without marshaling.

There are also a handful of direct calls to fread, that might need review
for endianness issues.

--===============2208749230586165859==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgOToz
NiBBTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3Rl
Ojxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFw
eCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkZZSSBiZWFyIGluIG1p
bmQgdGhlc2UgYXJlIGluIGhvc3QgZW5kaWFubmVzcywgc28gaWYgeW91IHN3aXRjaCBhcmNoaXRl
Y3R1cmUgZW5kaWFubmVzczxicj4KWW91IG5lZWQgdG8gY29udmVydCB0aGVzZS4gSXQgd291bGQg
YmUgd2lzZSB0byBzZXJpYWxpemUgdGhlc2UgcHJvcGVybHkgYmVmb3JlIHNlbmRpbmc8YnI+Cm9m
ZiB0aGUgaG9zdC4gSW0ganVzdCB1c2luZyBsaWJtdSB0byBzZXJpYWxpemUsIHdoaWNoIGRvZXNu
JiMzOTt0IGRlYWwgd2l0aCBlbmRpYW5uZXNzIElSUkMvSVVVQy48L2Jsb2NrcXVvdGU+PGRpdj48
YnI+PC9kaXY+PGRpdj5UaGFua3MgZm9yIHBvaW50aW5nIG91dCB0aGF0IGNvbmNlcm4uIEkgdGhp
bmsgdHBtMi10b29scyA8aT5zaG91bGQ8L2k+wqB3b3JrIGFjcm9zcyBob3N0cywgYnV0IGl0IHNl
ZW1zIGxpa2UgdGhlcmUgbWlnaHQgc3RpbGwgYmUgc29tZSBpc3N1ZXMgd2l0aCB0aGF0IGN1cnJl
bnRseS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PnRzczItbXUgc2VyaWFsaXplcyBpbnRlZ2Vy
cyB0byBuZXR3b3JrIG9yZGVyOyBhbmQgaXQgaGFzIHRvLCBiZWNhdXNlIHRoZSBUUE0gc3BlYyBk
ZWZpbmVzIGNvbW1hbmQvcmVzcG9uc2UgcHJvdG9jb2wgdXNlIG5ldHdvcmsgb3JkZXIgKFBhcnQg
MSwgU2VjdGlvbiA3LjEpLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PnRwbTItdG9vbHMg
YWxzbyBsb29rcyBsaWtlIGl0IGRvZXMgYXBwcm9wcmlhdGUgZW5kaWFubmVzcyBzd2FwcGluZyBp
biBsaWIvZmlsZXMuYyYjMzk7cyBmaWxlc197cmVhZCx3cml0ZX1fezE2LDMyLDY0fSBmdW5jdGlv
bnMuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5TbyB0aGF0IG11Y2ggc2VlbXMgZ29vZC48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkhvd2V2ZXIsIEkgc2VlIHRoYXQg
YXQgbGVhc3QgdG9vbHMvdHBtMl9xdW90ZS5jJiMzOTtzIHdyaXRlX3Bjcl92YWx1ZXMgZnVuY3Rp
b24gZGlyZWN0bHkgZndyaXRlcyBzb21lIGRhdGEgc3RydWN0dXJlcyB3aXRob3V0IG1hcnNoYWxp
bmcuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGVyZSBhcmUgYWxzbyBhIGhhbmRmdWwgb2Yg
ZGlyZWN0IGNhbGxzIHRvIGZyZWFkLCB0aGF0IG1pZ2h0IG5lZWQgcmV2aWV3IGZvciBlbmRpYW5u
ZXNzIGlzc3Vlcy48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============2208749230586165859==--

