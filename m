Content-Type: multipart/mixed; boundary="===============2869703797331924689=="
MIME-Version: 1.0
From: Remi Tricot-Le Breton <rlebreton at haproxy.com>
Subject: [tpm2] Re: [SPAM] Re: TPM2 provider stuck during handshake
Date: Thu, 09 Jun 2022 11:43:59 +0200
Message-ID: <05b6db11-ca24-278a-ac1c-c2830a5f4b9b@haproxy.com>
In-Reply-To: 20220608164706.6DFEEE19@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2869703797331924689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On 08/06/2022 16:47, Petr Gotthard wrote:
>
> Hi R=C3=A9mi,
>
> I can't think of any simple reason why you getting that error.
>
> Do you use a TPM simulator (which?) or a real TPM chip?
>

I'm using a real chip.

> And do you use it with the abrmd manager, or not?
>
> (In general, the abrmd is recommended for complex operations like PKI.)
>

I actually don't know. I had to install the abrmd when I first tried =

using a simulator (before realizing that I actually had an integrated =

TPM chip) but I don't know if it is still used or not.
I'm not that familiar with the TPM ecosystem. I mainly tried this =

provider because it's one of the few already available "external" =

providers (as in not made by openssl).

> Petr
>
> ______________________________________________________________
> > Od: "Remi Tricot-Le Breton" <rlebreton(a)haproxy.com>
> > Komu: tpm2(a)lists.01.org
> > Datum: 08.06.2022 16:16
> > P=C5=99edm=C4=9Bt: [tpm2] TPM2 provider stuck during handshake
> >
>
> Hello,
>
> I've been trying to make the TPM2 provider work in my environment
> (Ubuntu 20.04) for quite some time and I did not succeed yet.
>
> I tried using the commands suggested in docs/certificates.md to create a
> self signed certificate which I then used in an "openssl s_server"
> instance but when I try to connect to this SSL server, the handshake
> fails to complete.
> The three commands I used are the following:
> =C2=A0=C2=A0=C2=A0 openssl req -provider tpm2 -x509 -subj "/C=3DGB/CN=3Df=
oo" -keyout
> testkey.pem -out testcert.pem
> =C2=A0=C2=A0=C2=A0 openssl s_server -provider tpm2 -provider default -pro=
pquery
> ?provider=3Dtpm2 -accept 4443 -www -key testkey.pem -cert testcert.pem
> =C2=A0=C2=A0=C2=A0 curl --cacert testcert.pem https://localhost:4443/
>
> The curl command ends in a timeout and the server remains stuck (without
> raising errors).
>
> I rebuilt the tpm2 provider with the enable-debug=3Dyes option added in
> order to understand what was happening and I noticed that the server was
> stuck when trying to duplicate a context ("DIGEST DUP" was dumped on the
> server's standard output), and more specifically in the
> Tss2_Sys_ExecuteFinish function which in turn calls tctildr_receive with
> a -1 timeout (out of which we apparently never get out).
>
> Do any of you know if I missed something or if it is a bug ?
> I could provide the full standard output log or a complete backtrace of
> the stuck server if needed but they might end up being unnecessary noise
> if the bug comes from my wrong use of the provider.
>
> Thanks
>
> R=C3=A9mi LB
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
> _______________________________________________
> tpm2 mailing list --tpm2(a)lists.01.org
> To unsubscribe send an email totpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

@Petr sorry for the duplicated mail, I forgot to add the ML when =

answering and I figured it would be better to have the full history there.

R=C3=A9mi LB


--===============2869703797331924689==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5PgogICAgSGkg
UGV0ciw8YnI+CiAgICA8YnI+CiAgICA8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9uIDA4
LzA2LzIwMjIgMTY6NDcsIFBldHIgR290dGhhcmQKICAgICAgd3JvdGU6PGJyPgogICAgPC9kaXY+
CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6MjAyMjA2MDgxNjQ3
MDYuNkRGRUVFMTlAY2VudHJ1bS5jeiI+CiAgICAgIDxtZXRhIGh0dHAtZXF1aXY9ImNvbnRlbnQt
dHlwZSIgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PVVURi04Ij4KICAgICAgPHAgc3R5bGU9
InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5IaSBSw6ltaSw8L3A+CiAgICAgIDxw
IHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+SSBjYW4ndCB0aGluayBv
ZiBhbnkKICAgICAgICBzaW1wbGUgcmVhc29uIHdoeSB5b3UgZ2V0dGluZyB0aGF0IGVycm9yLjwv
cD4KICAgICAgPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij7CoDwv
cD4KICAgICAgPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5EbyB5
b3UgdXNlIGEgVFBNCiAgICAgICAgc2ltdWxhdG9yICh3aGljaD8pIG9yIGEgcmVhbCBUUE0gY2hp
cD8gPC9wPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgogICAgSSdtIHVzaW5nIGEgcmVhbCBj
aGlwLjxicj4KICAgIDxicj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCiAgICAgIGNpdGU9
Im1pZDoyMDIyMDYwODE2NDcwNi42REZFRUUxOUBjZW50cnVtLmN6Ij4KICAgICAgPHAgc3R5bGU9
InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5BbmQgZG8geW91IHVzZSBpdCB3aXRo
CiAgICAgICAgdGhlIGFicm1kIG1hbmFnZXIsIG9yIG5vdD88L3A+CiAgICAgIDxwIHN0eWxlPSJw
YWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+KEluIGdlbmVyYWwsIHRoZSBhYnJtZAog
ICAgICAgIGlzIHJlY29tbWVuZGVkIGZvciBjb21wbGV4IG9wZXJhdGlvbnMgbGlrZSBQS0kuKTwv
cD4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4KICAgIEkgYWN0dWFsbHkgZG9uJ3Qga25vdy4g
SSBoYWQgdG8gaW5zdGFsbCB0aGUgYWJybWQgd2hlbiBJIGZpcnN0IHRyaWVkCiAgICB1c2luZyBh
IHNpbXVsYXRvciAoYmVmb3JlIHJlYWxpemluZyB0aGF0IEkgYWN0dWFsbHkgaGFkIGFuCiAgICBp
bnRlZ3JhdGVkIFRQTSBjaGlwKSBidXQgSSBkb24ndCBrbm93IGlmIGl0IGlzIHN0aWxsIHVzZWQg
b3Igbm90Ljxicj4KICAgIEknbSBub3QgdGhhdCBmYW1pbGlhciB3aXRoIHRoZSBUUE0gZWNvc3lz
dGVtLiBJIG1haW5seSB0cmllZCB0aGlzCiAgICBwcm92aWRlciBiZWNhdXNlIGl0J3Mgb25lIG9m
IHRoZSBmZXcgYWxyZWFkeSBhdmFpbGFibGUgImV4dGVybmFsIgogICAgcHJvdmlkZXJzIChhcyBp
biBub3QgbWFkZSBieSBvcGVuc3NsKS48YnI+CiAgICA8YnI+CiAgICA8YmxvY2txdW90ZSB0eXBl
PSJjaXRlIgogICAgICBjaXRlPSJtaWQ6MjAyMjA2MDgxNjQ3MDYuNkRGRUVFMTlAY2VudHJ1bS5j
eiI+CiAgICAgIDxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+wqA8
L3A+CiAgICAgIDxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+wqA8
L3A+CiAgICAgIDxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+UGV0
cjwvcD4KICAgICAgPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij7C
oDwvcD4KICAgICAgPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXzxicj4KICAgICAgICAmZ3Q7IE9kOiAiUmVtaSBUcmljb3QtTGUgQnJldG9uIiA8YSBjbGFz
cz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmxlYnJldG9uQGhhcHJveHku
Y29tIj4mbHQ7cmxlYnJldG9uQGhhcHJveHkuY29tJmd0OzwvYT48YnI+CiAgICAgICAgJmd0OyBL
b211OiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86dHBt
MkBsaXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KICAgICAgICAmZ3Q7IERh
dHVtOiAwOC4wNi4yMDIyIDE2OjE2PGJyPgogICAgICAgICZndDsgUMWZZWRtxJt0OiBbdHBtMl0g
VFBNMiBwcm92aWRlciBzdHVjayBkdXJpbmcgaGFuZHNoYWtlPGJyPgogICAgICAgICZndDs8L3A+
CiAgICAgIEhlbGxvLDxicj4KICAgICAgPGJyPgogICAgICBJJ3ZlIGJlZW4gdHJ5aW5nIHRvIG1h
a2UgdGhlIFRQTTIgcHJvdmlkZXIgd29yayBpbiBteSBlbnZpcm9ubWVudAogICAgICA8YnI+CiAg
ICAgIChVYnVudHUgMjAuMDQpIGZvciBxdWl0ZSBzb21lIHRpbWUgYW5kIEkgZGlkIG5vdCBzdWNj
ZWVkIHlldC48YnI+CiAgICAgIDxicj4KICAgICAgSSB0cmllZCB1c2luZyB0aGUgY29tbWFuZHMg
c3VnZ2VzdGVkIGluIGRvY3MvY2VydGlmaWNhdGVzLm1kIHRvCiAgICAgIGNyZWF0ZSBhIDxicj4K
ICAgICAgc2VsZiBzaWduZWQgY2VydGlmaWNhdGUgd2hpY2ggSSB0aGVuIHVzZWQgaW4gYW4gIm9w
ZW5zc2wgc19zZXJ2ZXIiCiAgICAgIDxicj4KICAgICAgaW5zdGFuY2UgYnV0IHdoZW4gSSB0cnkg
dG8gY29ubmVjdCB0byB0aGlzIFNTTCBzZXJ2ZXIsIHRoZQogICAgICBoYW5kc2hha2UgPGJyPgog
ICAgICBmYWlscyB0byBjb21wbGV0ZS48YnI+CiAgICAgIFRoZSB0aHJlZSBjb21tYW5kcyBJIHVz
ZWQgYXJlIHRoZSBmb2xsb3dpbmc6PGJyPgogICAgICDCoMKgwqAgb3BlbnNzbCByZXEgLXByb3Zp
ZGVyIHRwbTIgLXg1MDkgLXN1YmogIi9DPUdCL0NOPWZvbyIgLWtleW91dAogICAgICA8YnI+CiAg
ICAgIHRlc3RrZXkucGVtIC1vdXQgdGVzdGNlcnQucGVtPGJyPgogICAgICDCoMKgwqAgb3BlbnNz
bCBzX3NlcnZlciAtcHJvdmlkZXIgdHBtMiAtcHJvdmlkZXIgZGVmYXVsdCAtcHJvcHF1ZXJ5IDxi
cj4KICAgICAgP3Byb3ZpZGVyPXRwbTIgLWFjY2VwdCA0NDQzIC13d3cgLWtleSB0ZXN0a2V5LnBl
bSAtY2VydAogICAgICB0ZXN0Y2VydC5wZW08YnI+CiAgICAgIMKgwqDCoCBjdXJsIC0tY2FjZXJ0
IHRlc3RjZXJ0LnBlbSA8YSBocmVmPSJodHRwczovL2xvY2FsaG9zdDo0NDQzLyIKICAgICAgICBt
b3otZG8tbm90LXNlbmQ9InRydWUiIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiPmh0dHBz
Oi8vbG9jYWxob3N0OjQ0NDMvPC9hPjxicj4KICAgICAgPGJyPgogICAgICBUaGUgY3VybCBjb21t
YW5kIGVuZHMgaW4gYSB0aW1lb3V0IGFuZCB0aGUgc2VydmVyIHJlbWFpbnMgc3R1Y2sKICAgICAg
KHdpdGhvdXQgPGJyPgogICAgICByYWlzaW5nIGVycm9ycykuPGJyPgogICAgICA8YnI+CiAgICAg
IEkgcmVidWlsdCB0aGUgdHBtMiBwcm92aWRlciB3aXRoIHRoZSBlbmFibGUtZGVidWc9eWVzIG9w
dGlvbiBhZGRlZAogICAgICBpbiA8YnI+CiAgICAgIG9yZGVyIHRvIHVuZGVyc3RhbmQgd2hhdCB3
YXMgaGFwcGVuaW5nIGFuZCBJIG5vdGljZWQgdGhhdCB0aGUKICAgICAgc2VydmVyIHdhcyA8YnI+
CiAgICAgIHN0dWNrIHdoZW4gdHJ5aW5nIHRvIGR1cGxpY2F0ZSBhIGNvbnRleHQgKCJESUdFU1Qg
RFVQIiB3YXMgZHVtcGVkCiAgICAgIG9uIHRoZSA8YnI+CiAgICAgIHNlcnZlcidzIHN0YW5kYXJk
IG91dHB1dCksIGFuZCBtb3JlIHNwZWNpZmljYWxseSBpbiB0aGUgPGJyPgogICAgICBUc3MyX1N5
c19FeGVjdXRlRmluaXNoIGZ1bmN0aW9uIHdoaWNoIGluIHR1cm4gY2FsbHMKICAgICAgdGN0aWxk
cl9yZWNlaXZlIHdpdGggPGJyPgogICAgICBhIC0xIHRpbWVvdXQgKG91dCBvZiB3aGljaCB3ZSBh
cHBhcmVudGx5IG5ldmVyIGdldCBvdXQpLjxicj4KICAgICAgPGJyPgogICAgICBEbyBhbnkgb2Yg
eW91IGtub3cgaWYgSSBtaXNzZWQgc29tZXRoaW5nIG9yIGlmIGl0IGlzIGEgYnVnID88YnI+CiAg
ICAgIEkgY291bGQgcHJvdmlkZSB0aGUgZnVsbCBzdGFuZGFyZCBvdXRwdXQgbG9nIG9yIGEgY29t
cGxldGUKICAgICAgYmFja3RyYWNlIG9mIDxicj4KICAgICAgdGhlIHN0dWNrIHNlcnZlciBpZiBu
ZWVkZWQgYnV0IHRoZXkgbWlnaHQgZW5kIHVwIGJlaW5nIHVubmVjZXNzYXJ5CiAgICAgIG5vaXNl
IDxicj4KICAgICAgaWYgdGhlIGJ1ZyBjb21lcyBmcm9tIG15IHdyb25nIHVzZSBvZiB0aGUgcHJv
dmlkZXIuPGJyPgogICAgICA8YnI+CiAgICAgIFRoYW5rczxicj4KICAgICAgPGJyPgogICAgICBS
w6ltaSBMQjxicj4KICAgICAgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX188YnI+CiAgICAgIHRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGNsYXNzPSJtb3otdHh0
LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBs
aXN0cy4wMS5vcmc8L2E+PGJyPgogICAgICBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRv
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzp0cG0yLWxl
YXZlQGxpc3RzLjAxLm9yZyI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgogICAgICAl
KHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcwogICAg
ICA8YnI+CiAgICAgIDxmaWVsZHNldCBjbGFzcz0ibW96LW1pbWUtYXR0YWNobWVudC1oZWFkZXIi
PjwvZmllbGRzZXQ+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+X19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KdHBtMiBtYWlsaW5n
IGxpc3QgLS0gPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRv
OnRwbTJAbGlzdHMuMDEub3JnIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4KVG8gdW5zdWJzY3JpYmUg
c2VuZCBhbiBlbWFpbCB0byA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVm
PSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciPnRwbTItbGVhdmVAbGlzdHMuMDEub3Jn
PC9hPgolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUp
czwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgogICAgQFBldHIgc29ycnkgZm9yIHRo
ZSBkdXBsaWNhdGVkIG1haWwsIEkgZm9yZ290IHRvIGFkZCB0aGUgTUwgd2hlbgogICAgYW5zd2Vy
aW5nIGFuZCBJIGZpZ3VyZWQgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUgdGhlIGZ1bGwgaGlz
dG9yeQogICAgdGhlcmUuPGJyPgogICAgPGJyPgogICAgUsOpbWkgTEI8YnI+CiAgICA8YnI+CiAg
ICA8YnI+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==

--===============2869703797331924689==--

