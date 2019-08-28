Content-Type: multipart/mixed; boundary="===============9066789391230716012=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: Re: [tpm2] Creating a TPM EK Public object at the server
Date: Wed, 28 Aug 2019 11:33:15 -0700
Message-ID: <CAP3jAwRC=e1d8eevOG4OmgG3xpKK_61UMVmDP1PbNP1xVvOyiA@mail.gmail.com>
In-Reply-To: CANKkrzEHLn9a3wFUA-gGcOaB=QnMkCdw200VWS_dRYHiE919FA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9066789391230716012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Matthew for the suggestion. Let's see if it all works out, haven't
tested the make_external_credential yet!

On Tue, Aug 27, 2019 at 4:16 PM Matthew Dempsky <matthew(a)dempsky.org> wro=
te:

> On Tue, Aug 27, 2019 at 3:07 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
> wrote:
>
>> But would I still need to verify the public key in the object is same as
>> the public key in the certificate on the *server* side?
>>
>
> Yes, if the client sends to the server both the TPM2B_PUBLIC (for
> tpm2_makecredential) and the EK certificate (for X.509 validation), then
> the server needs to make sure they both refer to the same public key.
>
> Currently, I validate the ek certificate to the root CA and I use the
>> make_credential/activate_credential to prove genuine tpm,  and  also che=
ck
>> if the certificate's Key Usage is keyEncipherment (since i use RSA),
>> wondering if this is sufficient?
>>
>
> Assuming you're making sure Make Credential is using the same public key
> that was validated against the root CA (e.g., by checking that it matches
> the TPM2B_PUBLIC that you pass to tpm2_makecredential as suggested above),
> then yes, this sounds reasonable to me.
>
> Beyond checking keyEncipherment, you might check section 3 of
> https://trustedcomputinggroup.org/wp-content/uploads/TCG_IWG_Credential_P=
rofile_EK_V2.1_R13.pdf.
> There are a few other TCG-specified attributes that EK certificates "MUST"
> have, which you could try checking for.
>
>>

--===============9066789391230716012==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzIE1hdHRoZXcgZm9yIHRoZSBzdWdnZXN0aW9uLiBMZXQmIzM5
O3Mgc2VlIGlmIGl0IGFsbMKgd29ya3Mgb3V0LCBoYXZlbiYjMzk7dCB0ZXN0ZWQgdGhlIG1ha2Vf
ZXh0ZXJuYWxfY3JlZGVudGlhbCB5ZXQhPC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3Rl
Ij48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVHVlLCBBdWcgMjcsIDIwMTkg
YXQgNDoxNiBQTSBNYXR0aGV3IERlbXBza3kgJmx0OzxhIGhyZWY9Im1haWx0bzptYXR0aGV3QGRl
bXBza3kub3JnIj5tYXR0aGV3QGRlbXBza3kub3JnPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2Pjxi
bG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAw
LjhleDtib3JkZXItbGVmdC13aWR0aDoxcHg7Ym9yZGVyLWxlZnQtc3R5bGU6c29saWQ7Ym9yZGVy
LWxlZnQtY29sb3I6cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0i
bHRyIj48ZGl2IGRpcj0ibHRyIj5PbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCAzOjA3IFBNIFJhaHVs
IEhhcmRpa2FyICZsdDs8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRh
cmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48
L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFw
eDtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwy
MDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXY+QnV0IHdvdWxkIEkgc3Rp
bGwgbmVlZCB0byB2ZXJpZnkgdGhlIHB1YmxpYyBrZXkgaW4gdGhlIG9iamVjdCBpcyBzYW1lIGFz
IHRoZSBwdWJsaWMga2V5IGluIHRoZSBjZXJ0aWZpY2F0ZSBvbiB0aGUgPGI+PHU+c2VydmVyPC91
PjwvYj4gc2lkZT88L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5Z
ZXMsIGlmIHRoZSBjbGllbnQgc2VuZHMgdG8gdGhlIHNlcnZlciBib3RoIHRoZSBUUE0yQl9QVUJM
SUMgKGZvciB0cG0yX21ha2VjcmVkZW50aWFsKSBhbmQgdGhlIEVLIGNlcnRpZmljYXRlIChmb3Ig
WC41MDkgdmFsaWRhdGlvbiksIHRoZW4gdGhlIHNlcnZlciBuZWVkcyB0byBtYWtlIHN1cmUgdGhl
eSBib3RoIHJlZmVyIHRvIHRoZSBzYW1lIHB1YmxpYyBrZXkuPC9kaXY+PGRpdj48YnI+PC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtib3Jk
ZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGly
PSJsdHIiPjxkaXY+Q3VycmVudGx5LCBJIHZhbGlkYXRlIHRoZSBlayBjZXJ0aWZpY2F0ZSB0byB0
aGUgcm9vdCBDQSBhbmQgSSB1c2UgdGhlIG1ha2VfY3JlZGVudGlhbC9hY3RpdmF0ZV9jcmVkZW50
aWFsIHRvIHByb3ZlIGdlbnVpbmUgdHBtLCDCoGFuZCDCoGFsc28gY2hlY2sgaWYgdGhlIGNlcnRp
ZmljYXRlJiMzOTtzIEtleSBVc2FnZSBpcyBrZXlFbmNpcGhlcm1lbnQgKHNpbmNlIGkgdXNlIFJT
QSksIHdvbmRlcmluZyBpZiB0aGlzIGlzIHN1ZmZpY2llbnQ/PC9kaXY+PC9kaXY+PC9ibG9ja3F1
b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+QXNzdW1pbmcgeW91JiMzOTtyZSBtYWtpbmcgc3VyZSBN
YWtlIENyZWRlbnRpYWwgaXMgdXNpbmcgdGhlIHNhbWUgcHVibGljIGtleSB0aGF0IHdhcyB2YWxp
ZGF0ZWQgYWdhaW5zdCB0aGUgcm9vdCBDQSAoZS5nLiwgYnkgY2hlY2tpbmcgdGhhdCBpdCBtYXRj
aGVzIHRoZSBUUE0yQl9QVUJMSUMgdGhhdCB5b3UgcGFzcyB0byB0cG0yX21ha2VjcmVkZW50aWFs
IGFzIHN1Z2dlc3RlZCBhYm92ZSksIHRoZW4geWVzLCB0aGlzIHNvdW5kcyByZWFzb25hYmxlIHRv
IG1lLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QmV5b25kIGNoZWNraW5nIGtleUVuY2lwaGVy
bWVudCwgeW91IG1pZ2h0IGNoZWNrIHNlY3Rpb24gMyBvZsKgPGEgaHJlZj0iaHR0cHM6Ly90cnVz
dGVkY29tcHV0aW5nZ3JvdXAub3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy9UQ0dfSVdHX0NyZWRlbnRp
YWxfUHJvZmlsZV9FS19WMi4xX1IxMy5wZGYiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3RydXN0
ZWRjb21wdXRpbmdncm91cC5vcmcvd3AtY29udGVudC91cGxvYWRzL1RDR19JV0dfQ3JlZGVudGlh
bF9Qcm9maWxlX0VLX1YyLjFfUjEzLnBkZjwvYT4uIFRoZXJlIGFyZSBhIGZldyBvdGhlciBUQ0ct
c3BlY2lmaWVkIGF0dHJpYnV0ZXMgdGhhdCBFSyBjZXJ0aWZpY2F0ZXMgJnF1b3Q7TVVTVCZxdW90
OyBoYXZlLCB3aGljaCB5b3UgY291bGQgdHJ5IGNoZWNraW5nIGZvci48YnI+PC9kaXY+PGJsb2Nr
cXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4
O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtib3JkZXItbGVm
dC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgY2xhc3M9Imdt
YWlsX3F1b3RlIj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46
MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQtd2lkdGg6MXB4O2JvcmRlci1sZWZ0LXN0eWxl
OnNvbGlkO2JvcmRlci1sZWZ0LWNvbG9yOnJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFl
eCI+CjwvYmxvY2txdW90ZT48L2Rpdj4KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pgo8L2Jsb2Nr
cXVvdGU+PC9kaXY+Cg==

--===============9066789391230716012==--

