Content-Type: multipart/mixed; boundary="===============8991219644464635755=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Pipe the TMP2 directly into /dev/random
Date: Fri, 13 Dec 2019 09:47:58 -0800
Message-ID: <CAOCvsS=2WrOWSuaXzabZizDo7znxALy+v2YX_CAcQ4MjqS5=Sw@mail.gmail.com>
In-Reply-To: CALtZhhNyKQcuYi4XfxDJM9gic9W1Wfs7WFYkqL-Oiz3+_RfUGQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8991219644464635755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is probably a much worse idea than you think it is.  Historically TPM
2.0 communication has been kinda slow and only improved in some relatively
recent kernels.  The general theory that seems to apply to the kind of
entropy mixing the kernel does is that entropy is conserved and that faulty
sources just don't add entropy. And thanks to the mixing they can't
manipulate the pool enough for an attack. Given there are stirring
commands, even the TPM RNG is probably not collecting real entropy all that
fast, so it would probably become a PRNG in slow hardware on a slow bus if
used as the only RNG.

--===============8991219644464635755==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPlRoaXMgaXMgcHJvYmFibHkgYSBtdWNoIHdvcnNlIGlkZWEgdGhhbiB5
b3UgdGhpbmsgaXQgaXMuwqAgSGlzdG9yaWNhbGx5IFRQTSAyLjAgY29tbXVuaWNhdGlvbiBoYXMg
YmVlbiBraW5kYSBzbG93IGFuZCBvbmx5IGltcHJvdmVkIGluIHNvbWUgcmVsYXRpdmVseSByZWNl
bnQga2VybmVscy7CoCBUaGUgZ2VuZXJhbCB0aGVvcnkgdGhhdCBzZWVtcyB0byBhcHBseSB0byB0
aGUga2luZCBvZiBlbnRyb3B5IG1peGluZyB0aGUga2VybmVsIGRvZXMgaXMgdGhhdCBlbnRyb3B5
IGlzIGNvbnNlcnZlZCBhbmQgdGhhdCBmYXVsdHkgc291cmNlcyBqdXN0IGRvbiYjMzk7dCBhZGQg
ZW50cm9weS4gQW5kIHRoYW5rcyB0byB0aGUgbWl4aW5nIHRoZXkgY2FuJiMzOTt0IG1hbmlwdWxh
dGUgdGhlIHBvb2wgZW5vdWdoIGZvciBhbiBhdHRhY2suIEdpdmVuIHRoZXJlIGFyZSBzdGlycmlu
ZyBjb21tYW5kcywgZXZlbiB0aGUgVFBNIFJORyBpcyBwcm9iYWJseSBub3QgY29sbGVjdGluZyBy
ZWFsIGVudHJvcHkgYWxsIHRoYXQgZmFzdCwgc28gaXQgd291bGQgcHJvYmFibHkgYmVjb21lIGEg
UFJORyBpbiBzbG93IGhhcmR3YXJlIG9uIGEgc2xvdyBidXMgaWYgdXNlZCBhcyB0aGUgb25seSBS
TkcuPC9kaXY+Cg==

--===============8991219644464635755==--

