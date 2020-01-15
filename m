Content-Type: multipart/mixed; boundary="===============0869884730659211348=="
MIME-Version: 1.0
From: Steffen <s.schwebel at uvensys.de>
Subject: [tpm2] Re: some questions about Identity
Date: Wed, 15 Jan 2020 09:36:35 +0100
Message-ID: <fec9ef06-827c-8451-cfb3-4bd79a04e682@uvensys.de>
In-Reply-To: CAJ8N_u-f9F50HpHJzGZVTgdqV5PRobOs6CA5W04M0FOqB71yFA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0869884730659211348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Actually, I have a follow up question.

If I understand the documentation correctly, I should always be able to =

generate the EK via tpm2_createek. That should (can?) never change.

So, upon initial deployment, first check and store EK.

tpm2_createek -G rsa -u ek.pub -c key.ctx

tpm2_getekcertificate -X -o ECcert.bin -u ek.pub \
https://tpm.manufacturer.com/ekcertserver/


Right?


Best regards,
Steffen

On 09.01.20 19:43, Niklas Andersson wrote:
> Dell should keep tab on all Endorsement Certificates that their =

> computers comes with and give you that list.
>
> You then check for a valid Endorsement cert as part of enrollment.
>
> - Niklas
>

--===============0869884730659211348==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CiAgPGhlYWQ+CgogICAgPG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250
ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgogIDwvaGVhZD4KICA8Ym9keT4KICAgIDxw
PkFjdHVhbGx5LCBJIGhhdmUgYSBmb2xsb3cgdXAgcXVlc3Rpb24uPC9wPgogICAgPHA+SWYgSSB1
bmRlcnN0YW5kIHRoZSBkb2N1bWVudGF0aW9uIGNvcnJlY3RseSwgSSBzaG91bGQgYWx3YXlzIGJl
CiAgICAgIGFibGUgdG8gZ2VuZXJhdGUgdGhlIEVLIHZpYSB0cG0yX2NyZWF0ZWVrLiBUaGF0IHNo
b3VsZCAoY2FuPykKICAgICAgbmV2ZXIgY2hhbmdlLjwvcD4KICAgIDxwPlNvLCB1cG9uIGluaXRp
YWwgZGVwbG95bWVudCwgZmlyc3QgY2hlY2sgYW5kIHN0b3JlIEVLLjwvcD4KICAgIDxwcmU+dHBt
Ml9jcmVhdGVlayAtRyByc2EgLXUgZWsucHViIC1jIGtleS5jdHgKCnRwbTJfZ2V0ZWtjZXJ0aWZp
Y2F0ZSAtWCAtbyBFQ2NlcnQuYmluIC11IGVrLnB1YiBcCjxhIGNsYXNzPSJtb3otdHh0LWxpbmst
ZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vdHBtLm1hbnVmYWN0dXJlci5jb20vZWtjZXJ0c2VydmVy
LyI+aHR0cHM6Ly90cG0ubWFudWZhY3R1cmVyLmNvbS9la2NlcnRzZXJ2ZXIvPC9hPgoKCjwvcHJl
PgogICAgUmlnaHQ/PGJyPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPHA+QmVzdCByZWdhcmRz
LDxicj4KICAgICAgU3RlZmZlbjxicj4KICAgIDwvcD4KICAgIDxwcmU+CjwvcHJlPgogICAgPGRp
diBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAwOS4wMS4yMCAxOTo0MywgTmlrbGFzIEFuZGVy
c3NvbgogICAgICB3cm90ZTo8YnI+CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNp
dGUiCmNpdGU9Im1pZDpDQUo4Tl91LWY5RjUwSHBISnpHWlZUZ2RxVjVQUm9iT3M2Q0E1VzA0TTBG
T3FCNzF5RkFAbWFpbC5nbWFpbC5jb20iPgogICAgICA8ZGl2IGRpcj0iYXV0byI+RGVsbCBzaG91
bGQga2VlcCB0YWIgb24gYWxsIEVuZG9yc2VtZW50CiAgICAgICAgQ2VydGlmaWNhdGVzIHRoYXQg
dGhlaXIgY29tcHV0ZXJzIGNvbWVzIHdpdGggYW5kIGdpdmUgeW91IHRoYXQKICAgICAgICBsaXN0
LsKgCiAgICAgICAgPGRpdiBkaXI9ImF1dG8iPjxicj4KICAgICAgICA8L2Rpdj4KICAgICAgICA8
ZGl2IGRpcj0iYXV0byI+WW91IHRoZW4gY2hlY2sgZm9yIGEgdmFsaWQgRW5kb3JzZW1lbnQgY2Vy
dCBhcwogICAgICAgICAgcGFydCBvZiBlbnJvbGxtZW50LsKgPC9kaXY+CiAgICAgICAgPGRpdiBk
aXI9ImF1dG8iPjxicj4KICAgICAgICA8L2Rpdj4KICAgICAgICA8ZGl2IGRpcj0iYXV0byI+LSBO
aWtsYXM8L2Rpdj4KICAgICAgPC9kaXY+CiAgICAgIDxicj4KICAgIDwvYmxvY2txdW90ZT4KICA8
L2JvZHk+CjwvaHRtbD4K

--===============0869884730659211348==--

