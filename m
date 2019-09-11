Content-Type: multipart/mixed; boundary="===============5396585883270495577=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: Re: [tpm2] Creating a TPM EK Public object at the server
Date: Tue, 10 Sep 2019 21:32:38 -0700
Message-ID: <CAP3jAwQQcSiebPVrtVtatdhp-DfxUv4DRCi0LPyb+OG9AMGzCA@mail.gmail.com>
In-Reply-To: CAP3jAwRC=e1d8eevOG4OmgG3xpKK_61UMVmDP1PbNP1xVvOyiA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5396585883270495577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

HI All,
So I got the Make Credential to compile and work, I have some questions
about the remote attestation with privacy CA

In TPM1.2, the privacy CA would send back the  AIK public object (as blob
2) along with the AIK Certificate (as a blob1 )that it signed and the TPM
would compare if AIK is same before giving the session key to get the AIk
Cert.
In TPM2.0, do we have to do the same, i.e.
- send AK public object along with the AK Cert signed  or
- would sending the AK name suffice since it is cryptographically linked to
EK or
- do we just send back the credential blob and secret that Make_credential
created and since we already have the EK and AK keys loaded in the TPM, we
don't have to do anything else other than pass the 2 outputs of
MakeCredential?

Thanks,
Rahul

Thanks,
Rahul

On Wed, Aug 28, 2019 at 11:33 AM Rahul Hardikar <rahulhardikar(a)gmail.com>
wrote:

> Thanks Matthew for the suggestion. Let's see if it all works out, haven't
> tested the make_external_credential yet!
>
> On Tue, Aug 27, 2019 at 4:16 PM Matthew Dempsky <matthew(a)dempsky.org>
> wrote:
>
>> On Tue, Aug 27, 2019 at 3:07 PM Rahul Hardikar <rahulhardikar(a)gmail.co=
m>
>> wrote:
>>
>>> But would I still need to verify the public key in the object is same as
>>> the public key in the certificate on the *server* side?
>>>
>>
>> Yes, if the client sends to the server both the TPM2B_PUBLIC (for
>> tpm2_makecredential) and the EK certificate (for X.509 validation), then
>> the server needs to make sure they both refer to the same public key.
>>
>> Currently, I validate the ek certificate to the root CA and I use the
>>> make_credential/activate_credential to prove genuine tpm,  and  also ch=
eck
>>> if the certificate's Key Usage is keyEncipherment (since i use RSA),
>>> wondering if this is sufficient?
>>>
>>
>> Assuming you're making sure Make Credential is using the same public key
>> that was validated against the root CA (e.g., by checking that it matches
>> the TPM2B_PUBLIC that you pass to tpm2_makecredential as suggested above=
),
>> then yes, this sounds reasonable to me.
>>
>> Beyond checking keyEncipherment, you might check section 3 of
>> https://trustedcomputinggroup.org/wp-content/uploads/TCG_IWG_Credential_=
Profile_EK_V2.1_R13.pdf.
>> There are a few other TCG-specified attributes that EK certificates "MUS=
T"
>> have, which you could try checking for.
>>
>>>

--===============5396585883270495577==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SEkgQWxsLDxkaXY+U28gSSBnb3QgdGhlIE1ha2UgQ3JlZGVudGlhbCB0
byBjb21waWxlIGFuZCB3b3JrLCBJIGhhdmUgc29tZSBxdWVzdGlvbnMgYWJvdXQgdGhlIHJlbW90
ZSBhdHRlc3RhdGlvbsKgd2l0aCBwcml2YWN5IENBPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5J
biBUUE0xLjIsIHRoZSBwcml2YWN5IENBIHdvdWxkIHNlbmQgYmFjayB0aGUgwqBBSUsgcHVibGlj
IG9iamVjdCAoYXMgYmxvYiAyKSBhbG9uZyB3aXRoIHRoZSBBSUsgQ2VydGlmaWNhdGUgKGFzIGEg
YmxvYjEgKXRoYXQgaXQgc2lnbmVkIGFuZCB0aGUgVFBNIHdvdWxkIGNvbXBhcmUgaWYgQUlLIGlz
IHNhbWUgYmVmb3JlIGdpdmluZyB0aGUgc2Vzc2lvbiBrZXkgdG8gZ2V0IHRoZSBBSWsgQ2VydC48
L2Rpdj48ZGl2PkluIFRQTTIuMCwgZG8gd2UgaGF2ZSB0byBkbyB0aGUgc2FtZSwgaS5lLjwvZGl2
PjxkaXY+LSBzZW5kIEFLIHB1YmxpYyBvYmplY3QgYWxvbmcgd2l0aCB0aGUgQUsgQ2VydCBzaWdu
ZWQgwqBvcsKgPC9kaXY+PGRpdj4tIHdvdWxkIHNlbmRpbmcgdGhlIEFLIG5hbWUgc3VmZmljZSBz
aW5jZSBpdCBpcyBjcnlwdG9ncmFwaGljYWxseSBsaW5rZWQgdG8gRUsgb3LCoDwvZGl2PjxkaXY+
LSBkbyB3ZSBqdXN0IHNlbmQgYmFjayB0aGUgY3JlZGVudGlhbCBibG9iIGFuZCBzZWNyZXQgdGhh
dCBNYWtlX2NyZWRlbnRpYWwgY3JlYXRlZCBhbmQgc2luY2Ugd2UgYWxyZWFkeSBoYXZlIHRoZSBF
SyBhbmQgQUsga2V5cyBsb2FkZWQgaW4gdGhlIFRQTSwgd2UgZG9uJiMzOTt0IGhhdmUgdG8gZG8g
YW55dGhpbmcgZWxzZSBvdGhlciB0aGFuIHBhc3MgdGhlIDIgb3V0cHV0cyBvZiBNYWtlQ3JlZGVu
dGlhbD88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyw8L2Rpdj48ZGl2PlJhaHVsPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5SYWh1bDwvZGl2PjwvZGl2
Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWls
X2F0dHIiPk9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDExOjMzIEFNIFJhaHVsIEhhcmRpa2FyICZs
dDs8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iPnJhaHVsaGFyZGlrYXJA
Z21haWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdC13aWR0
aDoxcHg7Ym9yZGVyLWxlZnQtc3R5bGU6c29saWQ7Ym9yZGVyLWxlZnQtY29sb3I6cmdiKDIwNCwy
MDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj5UaGFua3MgTWF0dGhldyBm
b3IgdGhlIHN1Z2dlc3Rpb24uIExldCYjMzk7cyBzZWUgaWYgaXQgYWxswqB3b3JrcyBvdXQsIGhh
dmVuJiMzOTt0IHRlc3RlZCB0aGUgbWFrZV9leHRlcm5hbF9jcmVkZW50aWFsIHlldCE8L2Rpdj48
YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9h
dHRyIj5PbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCA0OjE2IFBNIE1hdHRoZXcgRGVtcHNreSAmbHQ7
PGEgaHJlZj0ibWFpbHRvOm1hdHRoZXdAZGVtcHNreS5vcmciIHRhcmdldD0iX2JsYW5rIj5tYXR0
aGV3QGRlbXBza3kub3JnPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNz
PSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVm
dC13aWR0aDoxcHg7Ym9yZGVyLWxlZnQtc3R5bGU6c29saWQ7Ym9yZGVyLWxlZnQtY29sb3I6cmdi
KDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0i
bHRyIj5PbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCAzOjA3IFBNIFJhaHVsIEhhcmRpa2FyICZsdDs8
YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5y
YWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1z
dHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXY+QnV0IHdvdWxkIEkgc3RpbGwgbmVlZCB0byB2ZXJp
ZnkgdGhlIHB1YmxpYyBrZXkgaW4gdGhlIG9iamVjdCBpcyBzYW1lIGFzIHRoZSBwdWJsaWMga2V5
IGluIHRoZSBjZXJ0aWZpY2F0ZSBvbiB0aGUgPGI+PHU+c2VydmVyPC91PjwvYj4gc2lkZT88L2Rp
dj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5ZZXMsIGlmIHRoZSBjbGll
bnQgc2VuZHMgdG8gdGhlIHNlcnZlciBib3RoIHRoZSBUUE0yQl9QVUJMSUMgKGZvciB0cG0yX21h
a2VjcmVkZW50aWFsKSBhbmQgdGhlIEVLIGNlcnRpZmljYXRlIChmb3IgWC41MDkgdmFsaWRhdGlv
biksIHRoZW4gdGhlIHNlcnZlciBuZWVkcyB0byBtYWtlIHN1cmUgdGhleSBib3RoIHJlZmVyIHRv
IHRoZSBzYW1lIHB1YmxpYyBrZXkuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xh
c3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1s
ZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpy
Z2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXY+Q3Vy
cmVudGx5LCBJIHZhbGlkYXRlIHRoZSBlayBjZXJ0aWZpY2F0ZSB0byB0aGUgcm9vdCBDQSBhbmQg
SSB1c2UgdGhlIG1ha2VfY3JlZGVudGlhbC9hY3RpdmF0ZV9jcmVkZW50aWFsIHRvIHByb3ZlIGdl
bnVpbmUgdHBtLCDCoGFuZCDCoGFsc28gY2hlY2sgaWYgdGhlIGNlcnRpZmljYXRlJiMzOTtzIEtl
eSBVc2FnZSBpcyBrZXlFbmNpcGhlcm1lbnQgKHNpbmNlIGkgdXNlIFJTQSksIHdvbmRlcmluZyBp
ZiB0aGlzIGlzIHN1ZmZpY2llbnQ/PC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwv
ZGl2PjxkaXY+QXNzdW1pbmcgeW91JiMzOTtyZSBtYWtpbmcgc3VyZSBNYWtlIENyZWRlbnRpYWwg
aXMgdXNpbmcgdGhlIHNhbWUgcHVibGljIGtleSB0aGF0IHdhcyB2YWxpZGF0ZWQgYWdhaW5zdCB0
aGUgcm9vdCBDQSAoZS5nLiwgYnkgY2hlY2tpbmcgdGhhdCBpdCBtYXRjaGVzIHRoZSBUUE0yQl9Q
VUJMSUMgdGhhdCB5b3UgcGFzcyB0byB0cG0yX21ha2VjcmVkZW50aWFsIGFzIHN1Z2dlc3RlZCBh
Ym92ZSksIHRoZW4geWVzLCB0aGlzIHNvdW5kcyByZWFzb25hYmxlIHRvIG1lLjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+QmV5b25kIGNoZWNraW5nIGtleUVuY2lwaGVybWVudCwgeW91IG1pZ2h0
IGNoZWNrIHNlY3Rpb24gMyBvZsKgPGEgaHJlZj0iaHR0cHM6Ly90cnVzdGVkY29tcHV0aW5nZ3Jv
dXAub3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy9UQ0dfSVdHX0NyZWRlbnRpYWxfUHJvZmlsZV9FS19W
Mi4xX1IxMy5wZGYiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91
cC5vcmcvd3AtY29udGVudC91cGxvYWRzL1RDR19JV0dfQ3JlZGVudGlhbF9Qcm9maWxlX0VLX1Yy
LjFfUjEzLnBkZjwvYT4uIFRoZXJlIGFyZSBhIGZldyBvdGhlciBUQ0ctc3BlY2lmaWVkIGF0dHJp
YnV0ZXMgdGhhdCBFSyBjZXJ0aWZpY2F0ZXMgJnF1b3Q7TVVTVCZxdW90OyBoYXZlLCB3aGljaCB5
b3UgY291bGQgdHJ5IGNoZWNraW5nIGZvci48YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdp
ZHRoOjFweDtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0
LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48Ymxv
Y2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44
ZXg7Ym9yZGVyLWxlZnQtd2lkdGg6MXB4O2JvcmRlci1sZWZ0LXN0eWxlOnNvbGlkO2JvcmRlci1s
ZWZ0LWNvbG9yOnJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+CjwvYmxvY2txdW90
ZT48L2Rpdj4KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cjwv
YmxvY2txdW90ZT48L2Rpdj4K

--===============5396585883270495577==--

