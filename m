Content-Type: multipart/mixed; boundary="===============7058518569794582308=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: TPM2 provider stuck during handshake
Date: Wed, 08 Jun 2022 16:47:06 +0200
Message-ID: <20220608164706.6DFEEE19@centrum.cz>
In-Reply-To: a2a22769-f6cb-7e5a-8db1-db1dd9f6e6e9@haproxy.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7058518569794582308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi R=C3=A9mi,
I can't think of any simple reason why you getting that error.
=C2=A0
Do you use a TPM simulator (which?) or a real TPM chip? And do you use it w=
ith the abrmd manager, or not?
(In general, the abrmd is recommended for complex operations like PKI.)
=C2=A0
=C2=A0
Petr
=C2=A0
______________________________________________________________
> Od: "Remi Tricot-Le Breton" <rlebreton(a)haproxy.com>
> Komu: tpm2(a)lists.01.org
> Datum: 08.06.2022 16:16
> P=C5=99edm=C4=9Bt: [tpm2] TPM2 provider stuck during handshake
>
Hello,
 =

 I've been trying to make the TPM2 provider work in my environment =

 (Ubuntu 20.04) for quite some time and I did not succeed yet.
 =

 I tried using the commands suggested in docs/certificates.md to create a =

 self signed certificate which I then used in an "openssl s_server" =

 instance but when I try to connect to this SSL server, the handshake =

 fails to complete.
 The three commands I used are the following:
 =C2=A0=C2=A0=C2=A0 openssl req -provider tpm2 -x509 -subj "/C=3DGB/CN=3Dfo=
o" -keyout =

 testkey.pem -out testcert.pem
 =C2=A0=C2=A0=C2=A0 openssl s_server -provider tpm2 -provider default -prop=
query =

 ?provider=3Dtpm2 -accept 4443 -www -key testkey.pem -cert testcert.pem
 =C2=A0=C2=A0=C2=A0 curl --cacert testcert.pem https://localhost:4443/ <htt=
ps://localhost:4443/>
 =

 The curl command ends in a timeout and the server remains stuck (without =

 raising errors).
 =

 I rebuilt the tpm2 provider with the enable-debug=3Dyes option added in =

 order to understand what was happening and I noticed that the server was =

 stuck when trying to duplicate a context ("DIGEST DUP" was dumped on the =

 server's standard output), and more specifically in the =

 Tss2_Sys_ExecuteFinish function which in turn calls tctildr_receive with =

 a -1 timeout (out of which we apparently never get out).
 =

 Do any of you know if I missed something or if it is a bug ?
 I could provide the full standard output log or a complete backtrace of =

 the stuck server if needed but they might end up being unnecessary noise =

 if the bug comes from my wrong use of the provider.
 =

 Thanks
 =

 R=C3=A9mi LB
 _______________________________________________
 tpm2 mailing list -- tpm2(a)lists.01.org
 To unsubscribe send an email to tpm2-leave(a)lists.01.org
 %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============7058518569794582308==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5IaSBSJmVhY3V0ZTtt
aSw8L3A+Cgo8cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPkkgY2Fu
J3QgdGhpbmsgb2YgYW55IHNpbXBsZSByZWFzb24gd2h5IHlvdSBnZXR0aW5nIHRoYXQgZXJyb3Iu
PC9wPgoKPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij4mbmJzcDs8
L3A+Cgo8cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPkRvIHlvdSB1
c2UgYSBUUE0gc2ltdWxhdG9yICh3aGljaD8pIG9yIGEgcmVhbCBUUE0gY2hpcD8gQW5kIGRvIHlv
dSB1c2UgaXQgd2l0aCB0aGUgYWJybWQgbWFuYWdlciwgb3Igbm90PzwvcD4KCjxwIHN0eWxlPSJw
YWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+KEluIGdlbmVyYWwsIHRoZSBhYnJtZCBp
cyByZWNvbW1lbmRlZCBmb3IgY29tcGxleCBvcGVyYXRpb25zIGxpa2UgUEtJLik8L3A+Cgo8cCBz
dHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNwOzwvcD4KCjxwIHN0
eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+Jm5ic3A7PC9wPgoKPHAgc3R5
bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5QZXRyPC9wPgoKPHAgc3R5bGU9
InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij4mbmJzcDs8L3A+Cgo8cCBzdHlsZT0i
cGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyIC8+CiZndDsgT2Q6ICJS
ZW1pIFRyaWNvdC1MZSBCcmV0b24iICZsdDtybGVicmV0b25AaGFwcm94eS5jb20mZ3Q7PGJyIC8+
CiZndDsgS29tdTogdHBtMkBsaXN0cy4wMS5vcmc8YnIgLz4KJmd0OyBEYXR1bTogMDguMDYuMjAy
MiAxNjoxNjxiciAvPgomZ3Q7IFDFmWVkbcSbdDogW3RwbTJdIFRQTTIgcHJvdmlkZXIgc3R1Y2sg
ZHVyaW5nIGhhbmRzaGFrZTxiciAvPgomZ3Q7PC9wPgoKSGVsbG8sPGJyIC8+CiA8YnIgLz4KIEkn
dmUgYmVlbiB0cnlpbmcgdG8gbWFrZSB0aGUgVFBNMiBwcm92aWRlciB3b3JrIGluIG15IGVudmly
b25tZW50IDxiciAvPgogKFVidW50dSAyMC4wNCkgZm9yIHF1aXRlIHNvbWUgdGltZSBhbmQgSSBk
aWQgbm90IHN1Y2NlZWQgeWV0LjxiciAvPgogPGJyIC8+CiBJIHRyaWVkIHVzaW5nIHRoZSBjb21t
YW5kcyBzdWdnZXN0ZWQgaW4gZG9jcy9jZXJ0aWZpY2F0ZXMubWQgdG8gY3JlYXRlIGEgPGJyIC8+
CiBzZWxmIHNpZ25lZCBjZXJ0aWZpY2F0ZSB3aGljaCBJIHRoZW4gdXNlZCBpbiBhbiAib3BlbnNz
bCBzX3NlcnZlciIgPGJyIC8+CiBpbnN0YW5jZSBidXQgd2hlbiBJIHRyeSB0byBjb25uZWN0IHRv
IHRoaXMgU1NMIHNlcnZlciwgdGhlIGhhbmRzaGFrZSA8YnIgLz4KIGZhaWxzIHRvIGNvbXBsZXRl
LjxiciAvPgogVGhlIHRocmVlIGNvbW1hbmRzIEkgdXNlZCBhcmUgdGhlIGZvbGxvd2luZzo8YnIg
Lz4KICZuYnNwOyZuYnNwOyZuYnNwOyBvcGVuc3NsIHJlcSAtcHJvdmlkZXIgdHBtMiAteDUwOSAt
c3ViaiAiL0M9R0IvQ049Zm9vIiAta2V5b3V0IDxiciAvPgogdGVzdGtleS5wZW0gLW91dCB0ZXN0
Y2VydC5wZW08YnIgLz4KICZuYnNwOyZuYnNwOyZuYnNwOyBvcGVuc3NsIHNfc2VydmVyIC1wcm92
aWRlciB0cG0yIC1wcm92aWRlciBkZWZhdWx0IC1wcm9wcXVlcnkgPGJyIC8+CiA/cHJvdmlkZXI9
dHBtMiAtYWNjZXB0IDQ0NDMgLXd3dyAta2V5IHRlc3RrZXkucGVtIC1jZXJ0IHRlc3RjZXJ0LnBl
bTxiciAvPgogJm5ic3A7Jm5ic3A7Jm5ic3A7IGN1cmwgLS1jYWNlcnQgdGVzdGNlcnQucGVtIDxh
IGhyZWY9Imh0dHBzOi8vbG9jYWxob3N0OjQ0NDMvIj5odHRwczovL2xvY2FsaG9zdDo0NDQzLzwv
YT48YnIgLz4KIDxiciAvPgogVGhlIGN1cmwgY29tbWFuZCBlbmRzIGluIGEgdGltZW91dCBhbmQg
dGhlIHNlcnZlciByZW1haW5zIHN0dWNrICh3aXRob3V0IDxiciAvPgogcmFpc2luZyBlcnJvcnMp
LjxiciAvPgogPGJyIC8+CiBJIHJlYnVpbHQgdGhlIHRwbTIgcHJvdmlkZXIgd2l0aCB0aGUgZW5h
YmxlLWRlYnVnPXllcyBvcHRpb24gYWRkZWQgaW4gPGJyIC8+CiBvcmRlciB0byB1bmRlcnN0YW5k
IHdoYXQgd2FzIGhhcHBlbmluZyBhbmQgSSBub3RpY2VkIHRoYXQgdGhlIHNlcnZlciB3YXMgPGJy
IC8+CiBzdHVjayB3aGVuIHRyeWluZyB0byBkdXBsaWNhdGUgYSBjb250ZXh0ICgiRElHRVNUIERV
UCIgd2FzIGR1bXBlZCBvbiB0aGUgPGJyIC8+CiBzZXJ2ZXIncyBzdGFuZGFyZCBvdXRwdXQpLCBh
bmQgbW9yZSBzcGVjaWZpY2FsbHkgaW4gdGhlIDxiciAvPgogVHNzMl9TeXNfRXhlY3V0ZUZpbmlz
aCBmdW5jdGlvbiB3aGljaCBpbiB0dXJuIGNhbGxzIHRjdGlsZHJfcmVjZWl2ZSB3aXRoIDxiciAv
PgogYSAtMSB0aW1lb3V0IChvdXQgb2Ygd2hpY2ggd2UgYXBwYXJlbnRseSBuZXZlciBnZXQgb3V0
KS48YnIgLz4KIDxiciAvPgogRG8gYW55IG9mIHlvdSBrbm93IGlmIEkgbWlzc2VkIHNvbWV0aGlu
ZyBvciBpZiBpdCBpcyBhIGJ1ZyA/PGJyIC8+CiBJIGNvdWxkIHByb3ZpZGUgdGhlIGZ1bGwgc3Rh
bmRhcmQgb3V0cHV0IGxvZyBvciBhIGNvbXBsZXRlIGJhY2t0cmFjZSBvZiA8YnIgLz4KIHRoZSBz
dHVjayBzZXJ2ZXIgaWYgbmVlZGVkIGJ1dCB0aGV5IG1pZ2h0IGVuZCB1cCBiZWluZyB1bm5lY2Vz
c2FyeSBub2lzZSA8YnIgLz4KIGlmIHRoZSBidWcgY29tZXMgZnJvbSBteSB3cm9uZyB1c2Ugb2Yg
dGhlIHByb3ZpZGVyLjxiciAvPgogPGJyIC8+CiBUaGFua3M8YnIgLz4KIDxiciAvPgogUiZlYWN1
dGU7bWkgTEI8YnIgLz4KIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fPGJyIC8+CiB0cG0yIG1haWxpbmcgbGlzdCAtLSB0cG0yQGxpc3RzLjAxLm9yZzxiciAv
PgogVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byB0cG0yLWxlYXZlQGxpc3RzLjAxLm9y
ZzxiciAvPgogJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9u
YW1lKXMK

--===============7058518569794582308==--

