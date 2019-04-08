Content-Type: multipart/mixed; boundary="===============1829983700815616430=="
MIME-Version: 1.0
From: Nick Meyer <nimeyer at verizonmedia.com>
Subject: [tpm2] Policy digest zeroed out after successful TPM2_Sign
Date: Mon, 08 Apr 2019 12:30:24 -0500
Message-ID: <CAO6U=ObLwki+YXSp+zaCtmEw_cXEVp6Kp8G-GAB68OMss--NTw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1829983700815616430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I'm working on implementing a TPM2_Sign operation protected by a PCR
policy. I have discovered that the policy digest appears to be zeroed out
as part of the sign operation.

The initial symptom of this was a 0x99d return code on a second sign
operation (in a test suite), TPM_RC_POLICY_FAIL. In order to debug, I
placed TPM2_PolicyGetDigest commands immediately before and after the first
sign. The preceding policy digest is as expected a random-looking hash; the
policy digest immediately following the sign command is all zeroes.

I realized at that point that I had forgotten to set the continueSession
bit in the session attribute flags of the auth structure I passed to
TPM2_Sign. I fixed this, but it had no impact on the outcome or my
observations.

The first sign operation returns RC_SUCCESS as expected, and after making I
see the continueSession bit set both in the command and response auth
structures; however the subsequent policy digest is still zeroed out.

I had considered that a PCR was possibly being changed somehow,
invalidating the PCR policy; however, I would expect TPM_RC_PCR_CHANGED to
be returned in this case, not TPM_RC_POLICY_FAIL.

Is there another reason that this *successful* sign operation would be
invalidating the session?

Thanks for your insight.


*Nick Meyer*
Verizon Media

--===============1829983700815616430==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IZWxsbyw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5
O20gd29ya2luZyBvbiBpbXBsZW1lbnRpbmcgYSBUUE0yX1NpZ24gb3BlcmF0aW9uIHByb3RlY3Rl
ZCBieSBhIFBDUiBwb2xpY3kuIEkgaGF2ZSBkaXNjb3ZlcmVkIHRoYXQgdGhlIHBvbGljeSBkaWdl
c3QgYXBwZWFycyB0byBiZSB6ZXJvZWQgb3V0IGFzIHBhcnQgb2YgdGhlIHNpZ24gb3BlcmF0aW9u
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhlIGluaXRpYWwgc3ltcHRvbSBvZiB0aGlzIHdh
cyBhIDB4OTlkIHJldHVybiBjb2RlIG9uIGEgc2Vjb25kIHNpZ24gb3BlcmF0aW9uIChpbiBhIHRl
c3Qgc3VpdGUpLCBUUE1fUkNfUE9MSUNZX0ZBSUwuIEluIG9yZGVyIHRvIGRlYnVnLCBJIHBsYWNl
ZCBUUE0yX1BvbGljeUdldERpZ2VzdCBjb21tYW5kcyBpbW1lZGlhdGVseSBiZWZvcmUgYW5kIGFm
dGVyIHRoZSBmaXJzdCBzaWduLiBUaGUgcHJlY2VkaW5nIHBvbGljeSBkaWdlc3QgaXMgYXMgZXhw
ZWN0ZWQgYSByYW5kb20tbG9va2luZyBoYXNoOyB0aGUgcG9saWN5IGRpZ2VzdCBpbW1lZGlhdGVs
eSBmb2xsb3dpbmcgdGhlIHNpZ24gY29tbWFuZCBpcyBhbGwgemVyb2VzLjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+SSByZWFsaXplZCBhdCB0aGF0IHBvaW50IHRoYXQgSSBoYWQgZm9yZ290dGVu
IHRvIHNldCB0aGUgY29udGludWVTZXNzaW9uIGJpdCBpbiB0aGUgc2Vzc2lvbiBhdHRyaWJ1dGUg
ZmxhZ3Mgb2YgdGhlIGF1dGggc3RydWN0dXJlIEkgcGFzc2VkIHRvIFRQTTJfU2lnbi4gSSBmaXhl
ZCB0aGlzLCBidXQgaXQgaGFkIG5vIGltcGFjdCBvbiB0aGUgb3V0Y29tZSBvciBteSBvYnNlcnZh
dGlvbnMuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGUgZmlyc3Qgc2lnbiBvcGVyYXRpb24g
cmV0dXJucyBSQ19TVUNDRVNTIGFzIGV4cGVjdGVkLCBhbmQgYWZ0ZXIgbWFraW5nIEkgc2VlIHRo
ZSBjb250aW51ZVNlc3Npb24gYml0IHNldCBib3RoIGluIHRoZSBjb21tYW5kIGFuZCByZXNwb25z
ZSBhdXRoIHN0cnVjdHVyZXM7IGhvd2V2ZXIgdGhlIHN1YnNlcXVlbnQgcG9saWN5IGRpZ2VzdCBp
cyBzdGlsbCB6ZXJvZWQgb3V0LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBoYWQgY29uc2lk
ZXJlZCB0aGF0IGEgUENSIHdhcyBwb3NzaWJseSBiZWluZyBjaGFuZ2VkIHNvbWVob3csIGludmFs
aWRhdGluZyB0aGUgUENSIHBvbGljeTsgaG93ZXZlciwgSSB3b3VsZCBleHBlY3QgVFBNX1JDX1BD
Ul9DSEFOR0VEIHRvIGJlIHJldHVybmVkIGluIHRoaXMgY2FzZSwgbm90IFRQTV9SQ19QT0xJQ1lf
RkFJTC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PklzIHRoZXJlIGFub3RoZXIgcmVhc29uIHRo
YXQgdGhpc8KgPGk+c3VjY2Vzc2Z1bDwvaT7CoHNpZ24gb3BlcmF0aW9uIHdvdWxkIGJlIGludmFs
aWRhdGluZyB0aGUgc2Vzc2lvbj88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyBmb3Ig
eW91ciBpbnNpZ2h0LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRpdiBkaXI9Imx0ciIgY2xh
c3M9ImdtYWlsX3NpZ25hdHVyZSIgZGF0YS1zbWFydG1haWw9ImdtYWlsX3NpZ25hdHVyZSI+PGRp
diBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGI+TmljayBNZXllcjxicj48L2I+PC9kaXY+PGRp
dj5WZXJpem9uIE1lZGlhPC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+Cg==

--===============1829983700815616430==--

