Content-Type: multipart/mixed; boundary="===============6542712426033405297=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] Incomplete TPM event log on Linux?
Date: Wed, 18 Sep 2019 12:01:35 -0700
Message-ID: <CANKkrzGHbn3pF-K__ebsNBg2h4T--iMNrw+SAMPsE6-_TgV0iA@mail.gmail.com>
In-Reply-To: CANKkrzGobBSmCSeeDG4QmEWZLppq3rgA7QNu+D+n9myVMVMC-Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6542712426033405297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 11:33 AM Matthew Dempsky <matthew(a)dempsky.org>
wrote:

> Yeah, Shim and the X1 Carbon's BIOS/EFI both seem like likely culprits
> here. On the one hand, Shim is generating malformed event log entries
> <https://github.com/rhboot/shim/issues/184>, but also the BIOS is
> incorrectly logging the "Calling UEFI Application from Boot Option" event
> to PCR[5] instead of PCR[4] (which was fixed upstream 2.5 years ago
> <https://github.com/tianocore/edk2/commit/c1b0828b3ba8fa203033ede0c3329c0=
d5573719e>
> ).
>

Seems like probably a Shim issue: https://github.com/rhboot/shim/issues/185

--===============6542712426033405297==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMTE6
MzMgQU0gTWF0dGhldyBEZW1wc2t5ICZsdDs8YSBocmVmPSJtYWlsdG86bWF0dGhld0BkZW1wc2t5
Lm9yZyI+bWF0dGhld0BkZW1wc2t5Lm9yZzwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48ZGl2IGNs
YXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0i
bWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIw
NCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXYgZGlyPSJsdHIiPlll
YWgsIFNoaW0gYW5kIHRoZSBYMSBDYXJib24mIzM5O3MgQklPUy9FRkkgYm90aCBzZWVtIGxpa2Ug
bGlrZWx5IGN1bHByaXRzIGhlcmUuIE9uIHRoZSBvbmUgaGFuZCwgU2hpbSBpcyA8YSBocmVmPSJo
dHRwczovL2dpdGh1Yi5jb20vcmhib290L3NoaW0vaXNzdWVzLzE4NCIgdGFyZ2V0PSJfYmxhbmsi
PmdlbmVyYXRpbmcgbWFsZm9ybWVkIGV2ZW50IGxvZyBlbnRyaWVzPC9hPiwgYnV0IGFsc28gdGhl
IEJJT1MgaXMgaW5jb3JyZWN0bHkgbG9nZ2luZyB0aGUgJnF1b3Q7Q2FsbGluZyBVRUZJIEFwcGxp
Y2F0aW9uIGZyb20gQm9vdCBPcHRpb24mcXVvdDsgZXZlbnQgdG8gUENSWzVdIGluc3RlYWQgb2Yg
UENSWzRdICh3aGljaCB3YXMgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9l
ZGsyL2NvbW1pdC9jMWIwODI4YjNiYThmYTIwMzAzM2VkZTBjMzMyOWMwZDU1NzM3MTllIiB0YXJn
ZXQ9Il9ibGFuayI+Zml4ZWQgdXBzdHJlYW0gMi41IHllYXJzIGFnbzwvYT4pLjxicj48L2Rpdj48
L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5TZWVtcyBsaWtlIHByb2JhYmx5
IGEgU2hpbSBpc3N1ZTrCoDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9yaGJvb3Qvc2hpbS9p
c3N1ZXMvMTg1Ij5odHRwczovL2dpdGh1Yi5jb20vcmhib290L3NoaW0vaXNzdWVzLzE4NTwvYT7C
oDwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============6542712426033405297==--

