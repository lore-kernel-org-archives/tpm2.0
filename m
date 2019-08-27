Content-Type: multipart/mixed; boundary="===============8442406278202540628=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: Re: [tpm2] Creating a TPM EK Public object at the server
Date: Tue, 27 Aug 2019 15:07:22 -0700
Message-ID: <CAP3jAwRBnDaH3gD+G=1uXMC-jDuWGwyUZKvXAGuGA8V9bO8wRw@mail.gmail.com>
In-Reply-To: CANKkrzHnoNtYQaDDqnB69ip+NmrXStg+bJuDLNetV3yRijZCEw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8442406278202540628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thats awesome! Don't know why i was breaking my head in creating a TPM
object on the server using all those crazy OpenSSL commands to extract the
public key.
But would I still need to verify the public key in the object is same as
the public key in the certificate on the *server* side? I do have a DTLS
connection between the client and server established but that could also be
with a rogue client. Trying to understand what steps I need to take in
order to prevent man-in-the-middle attacks.
Currently, I validate the ek certificate to the root CA and I use the
make_credential/activate_credential to prove genuine tpm,  and  also check
if the certificate's Key Usage is keyEncipherment (since i use RSA),
wondering if this is sufficient?
Thanks,
Rahul

On Tue, Aug 27, 2019 at 2:49 PM Matthew Dempsky <matthew(a)dempsky.org> wro=
te:

> On Tue, Aug 27, 2019 at 2:38 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
> wrote:
>
>> So, is it okay to send the Public Object over Internet? I thought we
>> should only send the EK Certificate!  So there is no harm in sending
>> TPM2B_PUBLIC generated from createEk??
>>
>
> Yes, it's fine for you to share tpm2_createek's TPM2B_PUBLIC output with
> the server.
>

--===============8442406278202540628==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VGhhdHMgYXdlc29tZSEgRG9uJiMzOTt0IGtub3cgd2h5IGkgd2FzIGJy
ZWFraW5nIG15IGhlYWQgaW4gY3JlYXRpbmcgYSBUUE0gb2JqZWN0IG9uIHRoZSBzZXJ2ZXIgdXNp
bmcgYWxsIHRob3NlIGNyYXp5IE9wZW5TU0wgY29tbWFuZHMgdG8gZXh0cmFjdCB0aGUgcHVibGlj
IGtleS7CoDxkaXY+QnV0IHdvdWxkIEkgc3RpbGwgbmVlZCB0byB2ZXJpZnkgdGhlIHB1YmxpYyBr
ZXkgaW4gdGhlIG9iamVjdCBpcyBzYW1lIGFzIHRoZSBwdWJsaWMga2V5IGluIHRoZSBjZXJ0aWZp
Y2F0ZSBvbiB0aGUgPGI+PHU+c2VydmVyPC91PjwvYj4gc2lkZT8gSSBkbyBoYXZlIGEgRFRMUyBj
b25uZWN0aW9uIGJldHdlZW4gdGhlIGNsaWVudCBhbmQgc2VydmVyIGVzdGFibGlzaGVkIGJ1dCB0
aGF0IGNvdWxkIGFsc28gYmUgd2l0aCBhIHJvZ3VlIGNsaWVudC4gVHJ5aW5nIHRvIHVuZGVyc3Rh
bmQgd2hhdCBzdGVwcyBJIG5lZWQgdG8gdGFrZSBpbiBvcmRlciB0byBwcmV2ZW50IG1hbi1pbi10
aGUtbWlkZGxlIGF0dGFja3MuPC9kaXY+PGRpdj5DdXJyZW50bHksIEkgdmFsaWRhdGUgdGhlIGVr
IGNlcnRpZmljYXRlIHRvIHRoZSByb290IENBIGFuZCBJIHVzZSB0aGUgbWFrZV9jcmVkZW50aWFs
L2FjdGl2YXRlX2NyZWRlbnRpYWwgdG8gcHJvdmUgZ2VudWluZSB0cG0sIMKgYW5kIMKgYWxzbyBj
aGVjayBpZiB0aGUgY2VydGlmaWNhdGUmIzM5O3MgS2V5IFVzYWdlIGlzIGtleUVuY2lwaGVybWVu
dCAoc2luY2UgaSB1c2UgUlNBKSwgd29uZGVyaW5nIGlmIHRoaXMgaXMgc3VmZmljaWVudD88L2Rp
dj48ZGl2PlRoYW5rcyw8L2Rpdj48ZGl2PlJhaHVsPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9
ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVHVlLCBB
dWcgMjcsIDIwMTkgYXQgMjo0OSBQTSBNYXR0aGV3IERlbXBza3kgJmx0OzxhIGhyZWY9Im1haWx0
bzptYXR0aGV3QGRlbXBza3kub3JnIj5tYXR0aGV3QGRlbXBza3kub3JnPC9hPiZndDsgd3JvdGU6
PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjow
cHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdC13aWR0aDoxcHg7Ym9yZGVyLWxlZnQtc3R5bGU6
c29saWQ7Ym9yZGVyLWxlZnQtY29sb3I6cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4
Ij48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj5PbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCAy
OjM4IFBNIFJhaHVsIEhhcmRpa2FyICZsdDs8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBn
bWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7
IHdyb3RlOjxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xh
c3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1s
ZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpy
Z2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXYgZGly
PSJsdHIiPjxkaXY+U28sIGlzIGl0IG9rYXkgdG8gc2VuZCB0aGUgUHVibGljIE9iamVjdCBvdmVy
IEludGVybmV0PyBJIHRob3VnaHQgd2Ugc2hvdWxkIG9ubHkgc2VuZCB0aGUgRUsgQ2VydGlmaWNh
dGUhwqAgU28gdGhlcmUgaXMgbm8gaGFybSBpbiBzZW5kaW5nIFRQTTJCX1BVQkxJQyBnZW5lcmF0
ZWQgZnJvbSBjcmVhdGVFaz8/wqA8L2Rpdj48L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48
YnI+PC9kaXY+PGRpdj5ZZXMsIGl0JiMzOTtzIGZpbmUgZm9yIHlvdSB0byBzaGFyZSB0cG0yX2Ny
ZWF0ZWVrJiMzOTtzIFRQTTJCX1BVQkxJQyBvdXRwdXQgd2l0aCB0aGUgc2VydmVyLjwvZGl2Pjwv
ZGl2PjwvZGl2Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============8442406278202540628==--

