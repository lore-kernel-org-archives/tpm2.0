Content-Type: multipart/mixed; boundary="===============0080246858663989806=="
MIME-Version: 1.0
From: joseph at zeronsoftn.com
Subject: [tpm2] Re: How can I prevent MITM attacks for unsealing?
Date: Mon, 03 Oct 2022 18:01:09 +0300
Message-ID: <1664809269.501465062@f33.my.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0080246858663989806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hello,
Does anyone know about this issue?
https://github.com/jc-lab/securekit/blob/466abe16bfe4f28ef86db6bc72649214ab=
2e4b51/pkg/securekit-disk/opt/securekit/sbin/disk-init#L82-L86
Here's one example of sealing and unsealing.
This method seems (probably?) to prevent the sniffing attack, which was a v=
ulnerability of Bitlocker in the past.
But isn't a MITM attack possible in the process of creating an encrypted se=
ssion?
I am not familiar with the process of establishing a session,
However, it seems that MITM can be prevented only by using a session key en=
crypted with the EK of the TPM, or by signing the asymmetric key with the E=
K to derive the key, when creating a session.
Is MITM not considered in TPM? Or is there another way?
Regards,

--===============0080246858663989806==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PC9oZWFkPjxib2R5PjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IiBkaXI9
Imx0ciI+SGVsbG8sPC9wPgo8cCBkaXI9Imx0ciI+RG9lcyBhbnlvbmUga25vdyBhYm91dCB0aGlz
IGlzc3VlPzwvcD4KPHAgZGlyPSJsdHIiPmh0dHBzOi8vZ2l0aHViLmNvbS9qYy1sYWIvc2VjdXJl
a2l0L2Jsb2IvNDY2YWJlMTZiZmU0ZjI4ZWY4NmRiNmJjNzI2NDkyMTRhYjJlNGI1MS9wa2cvc2Vj
dXJla2l0LWRpc2svb3B0L3NlY3VyZWtpdC9zYmluL2Rpc2staW5pdCNMODItTDg2PC9wPgo8cCBk
aXI9Imx0ciI+SGVyZSdzIG9uZSBleGFtcGxlIG9mIHNlYWxpbmcgYW5kIHVuc2VhbGluZy48YnI+
ClRoaXMgbWV0aG9kIHNlZW1zIChwcm9iYWJseT8pIHRvIHByZXZlbnQgdGhlIHNuaWZmaW5nIGF0
dGFjaywgd2hpY2ggd2FzIGEgdnVsbmVyYWJpbGl0eSBvZiBCaXRsb2NrZXIgaW4gdGhlIHBhc3Qu
PC9wPgo8cCBkaXI9Imx0ciI+QnV0IGlzbid0IGEgTUlUTSBhdHRhY2sgcG9zc2libGUgaW4gdGhl
IHByb2Nlc3Mgb2YgY3JlYXRpbmcgYW4gZW5jcnlwdGVkIHNlc3Npb24/PC9wPgo8cCBkaXI9Imx0
ciI+SSBhbSBub3QgZmFtaWxpYXIgd2l0aCB0aGUgcHJvY2VzcyBvZiBlc3RhYmxpc2hpbmcgYSBz
ZXNzaW9uLDxicj4KSG93ZXZlciwgaXQgc2VlbXMgdGhhdCBNSVRNIGNhbiBiZSBwcmV2ZW50ZWQg
b25seSBieSB1c2luZyBhIHNlc3Npb24ga2V5IGVuY3J5cHRlZCB3aXRoIHRoZSBFSyBvZiB0aGUg
VFBNLCBvciBieSBzaWduaW5nIHRoZSBhc3ltbWV0cmljIGtleSB3aXRoIHRoZSBFSyB0byBkZXJp
dmUgdGhlIGtleSwgd2hlbiBjcmVhdGluZyBhIHNlc3Npb24uPC9wPgo8cCBkaXI9Imx0ciI+SXMg
TUlUTSBub3QgY29uc2lkZXJlZCBpbiBUUE0/IE9yIGlzIHRoZXJlIGFub3RoZXIgd2F5Pzxicj48
L3A+CjxwIGRpcj0ibHRyIj5SZWdhcmRzLDwvcD4KCjxkaXY+PGJyPjxicj48YnI+PGltZyBzcmM9
Imh0dHBzOi8vbWFpbC56ZXJvbnNvZnRuLmNvbS9tdGh1bWJuYWlsL2ZjZDAxYjY0LWY5ZDMtNDVi
Zi05ZTQxLTM1ODIwNWM4NDA1NS5wbmciIHN0eWxlPSJtYXgtaGVpZ2h0OiAzMnB4Ij48L2Rpdj48
L2JvZHk+PC9odG1sPg==
--===============0080246858663989806==--

