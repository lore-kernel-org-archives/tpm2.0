Content-Type: multipart/mixed; boundary="===============8370079138329068907=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: Ecrypting and decrypting a file using a TPM2
Date: Thu, 16 Jun 2022 17:42:07 +0200
Message-ID: <20220616174207.FD2F4246@centrum.cz>
In-Reply-To: 20220615192928.1682.44443@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8370079138329068907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dawn,
there are code samples in the OpenSSL documentation.
=C2=A0
First, you need OSSL_PROVIDER_load as shown here
https://github.com/tpm2-software/tpm2-openssl/blob/master/test/selftest.c
=C2=A0
=C2=A0
Then, to load EVP_PKEY from the TPM you need the OSSL_STORE* functions and =
the shipplet from here
https://github.com/tpm2-software/tpm2-openssl/issues/26#issuecomment-105792=
9799
=C2=A0
=C2=A0
Finally, I believe the OpenSSL routines to use for file encrypting are EVP_=
Seal* and EVP_Open*
https://wiki.openssl.org/index.php/EVP_Asymmetric_Encryption_and_Decryption=
_of_an_Envelope
these work exactly like Steven suggested.
=C2=A0
I you face any troubles, just let me know.
=C2=A0
=C2=A0
Petr
=C2=A0
______________________________________________________________
> Od: dawn.howe(a)alten.com
> Komu: tpm2(a)lists.01.org
> Datum: 15.06.2022 21:29
> P=C5=99edm=C4=9Bt: [tpm2] Re: Ecrypting and decrypting a file using a TPM2
>
Petr:
 Thanks so much for the suggestion. =C2=A0I was able to encrypt and decrypt=
 my files based on the pattern in https://github.com/tpm2-software/tpm2-ope=
nssl/blob/master/test/cipher_aes128_cbc.sh <https://github.com/tpm2-softwar=
e/tpm2-openssl/blob/master/test/cipher_aes128_cbc.sh>. =C2=A0I think I can =
accomplish what I want with some system calls to openssl.
 =

 The code I'm writing is in C++. Is there a way to replace the system call =
to openssl with a c++ library call (perhaps that takes a provider parameter=
)?
 =

 i.e. Replace the following with a C++ library call =

 openssl enc -provider tpm2 -aes128 -e -K $KEY -iv $IV -in testdata -out te=
stdata.enc
 =

 I'd love to see a code sample if you have one.
 =

 thanks,
 Dawn
 _______________________________________________
 tpm2 mailing list -- tpm2(a)lists.01.org
 To unsubscribe send an email to tpm2-leave(a)lists.01.org
 %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s


--===============8370079138329068907==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5IaSBEYXduLDwvcD4K
CjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+dGhlcmUgYXJlIGNv
ZGUgc2FtcGxlcyBpbiB0aGUgT3BlblNTTCBkb2N1bWVudGF0aW9uLjwvcD4KCjxwIHN0eWxlPSJw
YWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+Jm5ic3A7PC9wPgoKPHAgc3R5bGU9InBh
ZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5GaXJzdCwgeW91IG5lZWQgT1NTTF9QUk9W
SURFUl9sb2FkIGFzIHNob3duIGhlcmU8L3A+Cgo8cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBt
YXJnaW46MCAwIDAgMDsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItb3Bl
bnNzbC9ibG9iL21hc3Rlci90ZXN0L3NlbGZ0ZXN0LmM8L3A+Cgo8cCBzdHlsZT0icGFkZGluZzow
IDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNwOzwvcD4KCjxwIHN0eWxlPSJwYWRkaW5nOjAg
MCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+Jm5ic3A7PC9wPgoKPHAgc3R5bGU9InBhZGRpbmc6MCAw
IDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5UaGVuLCB0byBsb2FkIEVWUF9QS0VZIGZyb20gdGhlIFRQ
TSB5b3UgbmVlZCB0aGUgT1NTTF9TVE9SRSogZnVuY3Rpb25zIGFuZCB0aGUgc2hpcHBsZXQgZnJv
bSBoZXJlPC9wPgoKPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5o
dHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLW9wZW5zc2wvaXNzdWVzLzI2I2lz
c3VlY29tbWVudC0xMDU3OTI5Nzk5PC9wPgoKPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFy
Z2luOjAgMCAwIDA7Ij4mbmJzcDs8L3A+Cgo8cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJn
aW46MCAwIDAgMDsiPiZuYnNwOzwvcD4KCjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdp
bjowIDAgMCAwOyI+RmluYWxseSwgSSBiZWxpZXZlIHRoZSBPcGVuU1NMIHJvdXRpbmVzIHRvIHVz
ZSBmb3IgZmlsZSBlbmNyeXB0aW5nIGFyZSBFVlBfU2VhbCogYW5kIEVWUF9PcGVuKjwvcD4KCjxw
IHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+aHR0cHM6Ly93aWtpLm9w
ZW5zc2wub3JnL2luZGV4LnBocC9FVlBfQXN5bW1ldHJpY19FbmNyeXB0aW9uX2FuZF9EZWNyeXB0
aW9uX29mX2FuX0VudmVsb3BlPC9wPgoKPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2lu
OjAgMCAwIDA7Ij50aGVzZSB3b3JrIGV4YWN0bHkgbGlrZSBTdGV2ZW4gc3VnZ2VzdGVkLjwvcD4K
CjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+Jm5ic3A7PC9wPgoK
PHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5JIHlvdSBmYWNlIGFu
eSB0cm91YmxlcywganVzdCBsZXQgbWUga25vdy48L3A+Cgo8cCBzdHlsZT0icGFkZGluZzowIDAg
MCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNwOzwvcD4KCjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAw
IDA7IG1hcmdpbjowIDAgMCAwOyI+Jm5ic3A7PC9wPgoKPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAg
MDsgbWFyZ2luOjAgMCAwIDA7Ij5QZXRyPC9wPgoKPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsg
bWFyZ2luOjAgMCAwIDA7Ij4mbmJzcDs8L3A+Cgo8cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBt
YXJnaW46MCAwIDAgMDsiPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fPGJyIC8+CiZndDsgT2Q6IGRhd24uaG93ZUBhbHRlbi5jb208
YnIgLz4KJmd0OyBLb211OiB0cG0yQGxpc3RzLjAxLm9yZzxiciAvPgomZ3Q7IERhdHVtOiAxNS4w
Ni4yMDIyIDIxOjI5PGJyIC8+CiZndDsgUMWZZWRtxJt0OiBbdHBtMl0gUmU6IEVjcnlwdGluZyBh
bmQgZGVjcnlwdGluZyBhIGZpbGUgdXNpbmcgYSBUUE0yPGJyIC8+CiZndDs8L3A+CgpQZXRyOjxi
ciAvPgogVGhhbmtzIHNvIG11Y2ggZm9yIHRoZSBzdWdnZXN0aW9uLiAmbmJzcDtJIHdhcyBhYmxl
IHRvIGVuY3J5cHQgYW5kIGRlY3J5cHQgbXkgZmlsZXMgYmFzZWQgb24gdGhlIHBhdHRlcm4gaW4g
PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi1vcGVuc3NsL2Js
b2IvbWFzdGVyL3Rlc3QvY2lwaGVyX2FlczEyOF9jYmMuc2giPmh0dHBzOi8vZ2l0aHViLmNvbS90
cG0yLXNvZnR3YXJlL3RwbTItb3BlbnNzbC9ibG9iL21hc3Rlci90ZXN0L2NpcGhlcl9hZXMxMjhf
Y2JjLnNoPC9hPi4gJm5ic3A7SSB0aGluayBJIGNhbiBhY2NvbXBsaXNoIHdoYXQgSSB3YW50IHdp
dGggc29tZSBzeXN0ZW0gY2FsbHMgdG8gb3BlbnNzbC48YnIgLz4KIDxiciAvPgogVGhlIGNvZGUg
SSdtIHdyaXRpbmcgaXMgaW4gQysrLiBJcyB0aGVyZSBhIHdheSB0byByZXBsYWNlIHRoZSBzeXN0
ZW0gY2FsbCB0byBvcGVuc3NsIHdpdGggYSBjKysgbGlicmFyeSBjYWxsIChwZXJoYXBzIHRoYXQg
dGFrZXMgYSBwcm92aWRlciBwYXJhbWV0ZXIpPzxiciAvPgogPGJyIC8+CiBpLmUuIFJlcGxhY2Ug
dGhlIGZvbGxvd2luZyB3aXRoIGEgQysrIGxpYnJhcnkgY2FsbCA8YnIgLz4KIG9wZW5zc2wgZW5j
IC1wcm92aWRlciB0cG0yIC1hZXMxMjggLWUgLUsgJEtFWSAtaXYgJElWIC1pbiB0ZXN0ZGF0YSAt
b3V0IHRlc3RkYXRhLmVuYzxiciAvPgogPGJyIC8+CiBJJ2QgbG92ZSB0byBzZWUgYSBjb2RlIHNh
bXBsZSBpZiB5b3UgaGF2ZSBvbmUuPGJyIC8+CiA8YnIgLz4KIHRoYW5rcyw8YnIgLz4KIERhd248
YnIgLz4KIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJy
IC8+CiB0cG0yIG1haWxpbmcgbGlzdCAtLSB0cG0yQGxpc3RzLjAxLm9yZzxiciAvPgogVG8gdW5z
dWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byB0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzxiciAvPgog
JSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnIg
Lz4KCg==

--===============8370079138329068907==--

