Content-Type: multipart/mixed; boundary="===============5157386470608602741=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] [RELEASE] tpm2-openssl 1.1.1
Date: Sun, 09 Oct 2022 20:39:49 +0200
Message-ID: <20221009203949.8916708A@centrum.cz>
In-Reply-To: 20220923151248.7F2585CC@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5157386470608602741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
 =C2=A0
 I made a tpm2-openssl 1.1.1: https://github.com/tpm2-software/tpm2-openssl=
/releases/tag/1.1.1 <https://github.com/tpm2-software/tpm2-openssl/releases=
/tag/1.1.1-rc0>
 =C2=A0
 This is bugfix release that provides:
 =

 - Support for older TPM chips that do not support the CreateLoaded operati=
on.
 - Loading of NV index objects larger than TPM2_PT_NV_BUFFER_MAX.
 - Loading of PEM certificates from the NV index.
 - Support for the 'openssl cms' command for RSA keys.
- Support for PKCS1 padding in some parameters (thanks to @wxleong).
 - Building of tpm2-openssl on Windows (thanks to @mhummels).
 - Ability to run autoreconf on the release tarball.
=C2=A0

 Kind Regards,
 Petr


--===============5157386470608602741==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5IZWxsbyw8YnIgLz4K
ICZuYnNwOzxiciAvPgogSSBtYWRlIGEgdHBtMi1vcGVuc3NsIDEuMS4xOiA8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLW9wZW5zc2wvcmVsZWFzZXMvdGFnLzEu
MS4xLXJjMCI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi1vcGVuc3NsL3Jl
bGVhc2VzL3RhZy8xLjEuMTwvYT48YnIgLz4KICZuYnNwOzxiciAvPgogVGhpcyBpcyBidWdmaXgg
cmVsZWFzZSB0aGF0IHByb3ZpZGVzOjxiciAvPgogPGJyIC8+CiAtIFN1cHBvcnQgZm9yIG9sZGVy
IFRQTSBjaGlwcyB0aGF0IGRvIG5vdCBzdXBwb3J0IHRoZSBDcmVhdGVMb2FkZWQgb3BlcmF0aW9u
LjxiciAvPgogLSBMb2FkaW5nIG9mIE5WIGluZGV4IG9iamVjdHMgbGFyZ2VyIHRoYW4gVFBNMl9Q
VF9OVl9CVUZGRVJfTUFYLjxiciAvPgogLSBMb2FkaW5nIG9mIFBFTSBjZXJ0aWZpY2F0ZXMgZnJv
bSB0aGUgTlYgaW5kZXguPGJyIC8+CiAtIFN1cHBvcnQgZm9yIHRoZSAnb3BlbnNzbCBjbXMnIGNv
bW1hbmQgZm9yIFJTQSBrZXlzLjwvcD4KCjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdp
bjowIDAgMCAwOyI+LSBTdXBwb3J0IGZvciBQS0NTMSBwYWRkaW5nIGluIHNvbWUgcGFyYW1ldGVy
cyAodGhhbmtzIHRvIEB3eGxlb25nKS48YnIgLz4KIC0gQnVpbGRpbmcgb2YgdHBtMi1vcGVuc3Ns
IG9uIFdpbmRvd3MgKHRoYW5rcyB0byBAbWh1bW1lbHMpLjxiciAvPgogLSBBYmlsaXR5IHRvIHJ1
biBhdXRvcmVjb25mIG9uIHRoZSByZWxlYXNlIHRhcmJhbGwuPC9wPgoKPHAgc3R5bGU9InBhZGRp
bmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij4mbmJzcDs8L3A+Cgo8cCBzdHlsZT0icGFkZGlu
ZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPjxiciAvPgogS2luZCBSZWdhcmRzLDxiciAvPgog
UGV0cjwvcD4KCg==

--===============5157386470608602741==--

