Content-Type: multipart/mixed; boundary="===============5827281243399298599=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Pipe the TMP2 directly into /dev/random
Date: Fri, 13 Dec 2019 12:10:28 -0800
Message-ID: <CAOCvsSn=nJ9rhN1SH93fJ6WCnO4QVVEP4CCG7qV6Ft8KNBQEDg@mail.gmail.com>
In-Reply-To: CALtZhhP=CZ6g3hGXYLFWe2-ux05EQd7J3GWgkTGDyyBOQ3cz8Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5827281243399298599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If you want it you will probably have to code it yourself.  A start would
be to disable the kernel's existing entropy gathering.  Then turn off
entropy gathering and crediting for other alternate sources such as rdrand.
Then turn rng_core.default_quality permanently to 1000 to accept TPM RNG
entropy as real entropy.

Or tear out the entire kernel random infrastructure and rebuild it from
scratch. It is not just a simple character device module and hasn't been
for who knows how long.

The easy answer is to just use the rng_core.default_quality=3D1000 boot
option and accept that your TPM output is getting mixed with other stuff to
make it even more random.

--===============5827281243399298599==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPklmIHlvdSB3YW50IGl0IHlvdSB3aWxsIHByb2JhYmx5IGhhdmUgdG8g
Y29kZSBpdCB5b3Vyc2VsZi7CoCBBIHN0YXJ0IHdvdWxkIGJlIHRvIGRpc2FibGUgdGhlIGtlcm5l
bCYjMzk7cyBleGlzdGluZyBlbnRyb3B5IGdhdGhlcmluZy7CoCBUaGVuIHR1cm4gb2ZmIGVudHJv
cHkgZ2F0aGVyaW5nIGFuZCBjcmVkaXRpbmcgZm9yIG90aGVyIGFsdGVybmF0ZSBzb3VyY2VzIHN1
Y2ggYXMgcmRyYW5kLiBUaGVuIHR1cm4gcm5nX2NvcmUuZGVmYXVsdF9xdWFsaXR5IHBlcm1hbmVu
dGx5IHRvIDEwMDAgdG8gYWNjZXB0IFRQTSBSTkcgZW50cm9weSBhcyByZWFsIGVudHJvcHkuPGRp
diBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+T3IgdGVhciBvdXQgdGhlIGVu
dGlyZSBrZXJuZWwgcmFuZG9tIGluZnJhc3RydWN0dXJlIGFuZCByZWJ1aWxkIGl0IGZyb20gc2Ny
YXRjaC4gSXQgaXMgbm90IGp1c3QgYSBzaW1wbGUgY2hhcmFjdGVyIGRldmljZSBtb2R1bGUgYW5k
IGhhc24mIzM5O3QgYmVlbiBmb3Igd2hvIGtub3dzIGhvdyBsb25nLjwvZGl2PjxkaXYgZGlyPSJh
dXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPlRoZSBlYXN5IGFuc3dlciBpcyB0byBqdXN0
IHVzZSB0aGUgcm5nX2NvcmUuZGVmYXVsdF9xdWFsaXR5PTEwMDAgYm9vdCBvcHRpb24gYW5kIGFj
Y2VwdCB0aGF0IHlvdXIgVFBNIG91dHB1dCBpcyBnZXR0aW5nIG1peGVkIHdpdGggb3RoZXIgc3R1
ZmYgdG8gbWFrZSBpdCBldmVuIG1vcmUgcmFuZG9tLjwvZGl2PjwvZGl2Pgo=

--===============5827281243399298599==--

