Content-Type: multipart/mixed; boundary="===============0927400441211532192=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] Creating a TPM EK Public object at the server
Date: Tue, 27 Aug 2019 14:48:58 -0700
Message-ID: <CANKkrzHnoNtYQaDDqnB69ip+NmrXStg+bJuDLNetV3yRijZCEw@mail.gmail.com>
In-Reply-To: CAP3jAwSG=FDH-PM5RNx4mEeiWyrbkUrm7x2oDv21mEVGF7MhnQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0927400441211532192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2019 at 2:38 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
wrote:

> So, is it okay to send the Public Object over Internet? I thought we
> should only send the EK Certificate!  So there is no harm in sending
> TPM2B_PUBLIC generated from createEk??
>

Yes, it's fine for you to share tpm2_createek's TPM2B_PUBLIC output with
the server.

--===============0927400441211532192==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMjoz
OCBQTSBSYWh1bCBIYXJkaWthciAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21h
aWwuY29tIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48
ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXYgZGlyPSJs
dHIiPjxkaXY+U28sIGlzIGl0IG9rYXkgdG8gc2VuZCB0aGUgUHVibGljIE9iamVjdCBvdmVyIElu
dGVybmV0PyBJIHRob3VnaHQgd2Ugc2hvdWxkIG9ubHkgc2VuZCB0aGUgRUsgQ2VydGlmaWNhdGUh
wqAgU28gdGhlcmUgaXMgbm8gaGFybSBpbiBzZW5kaW5nIFRQTTJCX1BVQkxJQyBnZW5lcmF0ZWQg
ZnJvbSBjcmVhdGVFaz8/wqA8L2Rpdj48L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+
PC9kaXY+PGRpdj5ZZXMsIGl0JiMzOTtzIGZpbmUgZm9yIHlvdSB0byBzaGFyZSB0cG0yX2NyZWF0
ZWVrJiMzOTtzIFRQTTJCX1BVQkxJQyBvdXRwdXQgd2l0aCB0aGUgc2VydmVyLjwvZGl2PjwvZGl2
PjwvZGl2Pgo=

--===============0927400441211532192==--

