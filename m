Content-Type: multipart/mixed; boundary="===============0845336901924056947=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] Creating a TPM EK Public object at the server
Date: Tue, 27 Aug 2019 16:16:36 -0700
Message-ID: <CANKkrzEHLn9a3wFUA-gGcOaB=QnMkCdw200VWS_dRYHiE919FA@mail.gmail.com>
In-Reply-To: CAP3jAwRBnDaH3gD+G=1uXMC-jDuWGwyUZKvXAGuGA8V9bO8wRw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0845336901924056947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2019 at 3:07 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
wrote:

> But would I still need to verify the public key in the object is same as
> the public key in the certificate on the *server* side?
>

Yes, if the client sends to the server both the TPM2B_PUBLIC (for
tpm2_makecredential) and the EK certificate (for X.509 validation), then
the server needs to make sure they both refer to the same public key.

Currently, I validate the ek certificate to the root CA and I use the
> make_credential/activate_credential to prove genuine tpm,  and  also check
> if the certificate's Key Usage is keyEncipherment (since i use RSA),
> wondering if this is sufficient?
>

Assuming you're making sure Make Credential is using the same public key
that was validated against the root CA (e.g., by checking that it matches
the TPM2B_PUBLIC that you pass to tpm2_makecredential as suggested above),
then yes, this sounds reasonable to me.

Beyond checking keyEncipherment, you might check section 3 of
https://trustedcomputinggroup.org/wp-content/uploads/TCG_IWG_Credential_Pro=
file_EK_V2.1_R13.pdf.
There are a few other TCG-specified attributes that EK certificates "MUST"
have, which you could try checking for.

>

--===============0845336901924056947==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMzow
NyBQTSBSYWh1bCBIYXJkaWthciAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21h
aWwuY29tIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48
ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXY+QnV0IHdv
dWxkIEkgc3RpbGwgbmVlZCB0byB2ZXJpZnkgdGhlIHB1YmxpYyBrZXkgaW4gdGhlIG9iamVjdCBp
cyBzYW1lIGFzIHRoZSBwdWJsaWMga2V5IGluIHRoZSBjZXJ0aWZpY2F0ZSBvbiB0aGUgPGI+PHU+
c2VydmVyPC91PjwvYj4gc2lkZT88L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9k
aXY+PGRpdj5ZZXMsIGlmIHRoZSBjbGllbnQgc2VuZHMgdG8gdGhlIHNlcnZlciBib3RoIHRoZSBU
UE0yQl9QVUJMSUMgKGZvciB0cG0yX21ha2VjcmVkZW50aWFsKSBhbmQgdGhlIEVLIGNlcnRpZmlj
YXRlIChmb3IgWC41MDkgdmFsaWRhdGlvbiksIHRoZW4gdGhlIHNlcnZlciBuZWVkcyB0byBtYWtl
IHN1cmUgdGhleSBib3RoIHJlZmVyIHRvIHRoZSBzYW1lIHB1YmxpYyBrZXkuPC9kaXY+PGRpdj48
YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3Bh
ZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXY+Q3VycmVudGx5LCBJIHZhbGlkYXRl
IHRoZSBlayBjZXJ0aWZpY2F0ZSB0byB0aGUgcm9vdCBDQSBhbmQgSSB1c2UgdGhlIG1ha2VfY3Jl
ZGVudGlhbC9hY3RpdmF0ZV9jcmVkZW50aWFsIHRvIHByb3ZlIGdlbnVpbmUgdHBtLCDCoGFuZCDC
oGFsc28gY2hlY2sgaWYgdGhlIGNlcnRpZmljYXRlJiMzOTtzIEtleSBVc2FnZSBpcyBrZXlFbmNp
cGhlcm1lbnQgKHNpbmNlIGkgdXNlIFJTQSksIHdvbmRlcmluZyBpZiB0aGlzIGlzIHN1ZmZpY2ll
bnQ/PC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+QXNzdW1pbmcg
eW91JiMzOTtyZSBtYWtpbmcgc3VyZSBNYWtlIENyZWRlbnRpYWwgaXMgdXNpbmcgdGhlIHNhbWUg
cHVibGljIGtleSB0aGF0IHdhcyB2YWxpZGF0ZWQgYWdhaW5zdCB0aGUgcm9vdCBDQSAoZS5nLiwg
YnkgY2hlY2tpbmcgdGhhdCBpdCBtYXRjaGVzIHRoZSBUUE0yQl9QVUJMSUMgdGhhdCB5b3UgcGFz
cyB0byB0cG0yX21ha2VjcmVkZW50aWFsIGFzIHN1Z2dlc3RlZCBhYm92ZSksIHRoZW4geWVzLCB0
aGlzIHNvdW5kcyByZWFzb25hYmxlIHRvIG1lLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QmV5
b25kIGNoZWNraW5nIGtleUVuY2lwaGVybWVudCwgeW91IG1pZ2h0IGNoZWNrIHNlY3Rpb24gMyBv
ZsKgPGEgaHJlZj0iaHR0cHM6Ly90cnVzdGVkY29tcHV0aW5nZ3JvdXAub3JnL3dwLWNvbnRlbnQv
dXBsb2Fkcy9UQ0dfSVdHX0NyZWRlbnRpYWxfUHJvZmlsZV9FS19WMi4xX1IxMy5wZGYiPmh0dHBz
Oi8vdHJ1c3RlZGNvbXB1dGluZ2dyb3VwLm9yZy93cC1jb250ZW50L3VwbG9hZHMvVENHX0lXR19D
cmVkZW50aWFsX1Byb2ZpbGVfRUtfVjIuMV9SMTMucGRmPC9hPi4gVGhlcmUgYXJlIGEgZmV3IG90
aGVyIFRDRy1zcGVjaWZpZWQgYXR0cmlidXRlcyB0aGF0IEVLIGNlcnRpZmljYXRlcyAmcXVvdDtN
VVNUJnF1b3Q7IGhhdmUsIHdoaWNoIHlvdSBjb3VsZCB0cnkgY2hlY2tpbmcgZm9yLjxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHgg
c29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KPC9ibG9ja3F1b3RlPjwv
ZGl2Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+Cg==

--===============0845336901924056947==--

