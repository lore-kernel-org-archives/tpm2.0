Content-Type: multipart/mixed; boundary="===============7217702964099207483=="
MIME-Version: 1.0
From: Trey Weaver <treyweaver at fastmail.net>
Subject: [tpm2] tpm2_rsadecrypt to stdout
Date: Fri, 18 Oct 2019 14:58:03 -0400
Message-ID: <00d567dc-40c6-47da-be4c-702751e3c122@www.fastmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7217702964099207483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I know there has to be an easy answer for this.

You use to be able to call tpm2_rsadecrypt and not give an output file and =
the result would go to stdout.

But on version 3.1.3 it gives an error if you do not use the -o filename pa=
rameter.

And if you do something like **-o /dev/stdout** or **-o >(/dev/stdout)** it=
 give you an error that the file already exist.

I do not want to put the encrypted data into a file and then read it becaus=
e even if it is erased it still can be recovered and it has the decrypted m=
aterial in it.

So what is the solution to get the result of tpm2_rsadecrypt to the stdout?


--===============7217702964099207483==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PCFET0NUWVBFIGh0bWw+PGh0bWw+PGhlYWQ+PHRpdGxlPjwvdGl0bGU+PHN0eWxlIHR5cGU9InRl
eHQvY3NzIj5wLk1zb05vcm1hbCxwLk1zb05vU3BhY2luZ3ttYXJnaW46MH08L3N0eWxlPjwvaGVh
ZD48Ym9keT48ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPkkga25vdyB0aGVyZSBoYXMg
dG8gYmUgYW4gZWFzeSBhbnN3ZXIgZm9yIHRoaXMuPGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQt
ZmFtaWx5OkFyaWFsOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsOyI+
WW91IHVzZSB0byBiZSBhYmxlIHRvIGNhbGwgdHBtMl9yc2FkZWNyeXB0IGFuZCBub3QgZ2l2ZSBh
biBvdXRwdXQgZmlsZSBhbmQgdGhlIHJlc3VsdCB3b3VsZCBnbyB0byBzdGRvdXQuPGJyPjwvZGl2
PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OkFyaWFsOyI+QnV0IG9uIHZlcnNpb24gMy4xLjMgaXQgZ2l2ZXMgYW4gZXJyb3Ig
aWYgeW91IGRvIG5vdCB1c2UgdGhlIC1vIGZpbGVuYW1lIHBhcmFtZXRlci48YnI+PC9kaXY+PGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1m
YW1pbHk6QXJpYWw7Ij5BbmQgaWYgeW91IGRvIHNvbWV0aGluZyBsaWtlIDxpPjxiPi1vIC9kZXYv
c3Rkb3V0PC9iPjwvaT4gb3ImbmJzcDs8aT48Yj4tbyAmZ3Q7KC9kZXYvc3Rkb3V0KTwvYj48L2k+
IGl0IGdpdmUgeW91IGFuIGVycm9yIHRoYXQgdGhlIGZpbGUgYWxyZWFkeSBleGlzdC48YnI+PC9k
aXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0i
Zm9udC1mYW1pbHk6QXJpYWw7Ij5JIGRvIG5vdCB3YW50IHRvIHB1dCB0aGUgZW5jcnlwdGVkIGRh
dGEgaW50byBhIGZpbGUgYW5kIHRoZW4gcmVhZCBpdCBiZWNhdXNlIGV2ZW4gaWYgaXQgaXMgZXJh
c2VkIGl0IHN0aWxsIGNhbiBiZSByZWNvdmVyZWQgYW5kIGl0IGhhcyB0aGUgZGVjcnlwdGVkIG1h
dGVyaWFsIGluIGl0Ljxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPjxi
cj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPlNvIHdoYXQgaXMgdGhlIHNv
bHV0aW9uIHRvIGdldCB0aGUgcmVzdWx0IG9mIHRwbTJfcnNhZGVjcnlwdCB0byB0aGUgc3Rkb3V0
Pzxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPjxicj48L2Rpdj48ZGl2
IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPjxicj48L2Rpdj48L2JvZHk+PC9odG1sPg==
--===============7217702964099207483==--

