Content-Type: multipart/mixed; boundary="===============7325954844021703498=="
MIME-Version: 1.0
From: Ionut Mihalcea <Ionut.Mihalcea at arm.com>
Subject: [tpm2] Persistent key protection
Date: Mon, 27 Jul 2020 11:29:31 +0000
Message-ID: <
 <AM6PR08MB4264A44E71EB521BB5492BBB8A720@AM6PR08MB4264.eurprd08.prod.outlook.com>>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7325954844021703498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

I=E2=80=99ve been trying to identify any TPM authorization features that co=
uld be used in a user-space persistent key store with hardware backing, but=
 it appears that simply storing the key context, preferably on an encrypted=
 filesystem, is the best solution I could come up with. Keys could have an =
auth value of their own, but that value must then be stored as well, and an=
y other authorization mechanism ends up reducing to an (indirect) =E2=80=9C=
auth=E2=80=9D value that has to be persisted.

The threat I=E2=80=99m trying to work against is simply leaking the persist=
ed key material, allowing the attacker to load and use the keys (assuming t=
hey=E2=80=99re authorized to use the hierarchy that the keys belong to).

Am I missing something, or is this due to TPM authorization features being =
aimed more at lower levels of the stack?

Best regards,
Ionut

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--===============7325954844021703498==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4KPGhlYWQ+CjxtZXRhIGh0dHAtZXF1aXY9
IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PVdpbmRvd3MtMTI1MiI+
CjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRl
cmVkIG1lZGl1bSkiPgo8c3R5bGU+PCEtLQovKiBGb250IERlZmluaXRpb25zICovCkBmb250LWZh
Y2UKCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsKCXBhbm9zZS0xOjIgNCA1IDMgNSA0IDYg
MyAyIDQ7fQpAZm9udC1mYWNlCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsKCXBhbm9zZS0xOjIgMTUg
NSAyIDIgMiA0IDMgMiA0O30KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8KcC5Nc29Ob3JtYWwsIGxp
Lk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbAoJe21hcmdpbjowY207CgltYXJnaW4tYm90dG9tOi4w
MDAxcHQ7Cglmb250LXNpemU6MTEuMHB0OwoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2Vy
aWY7fQouTXNvQ2hwRGVmYXVsdAoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5O30KQHBhZ2Ug
V29yZFNlY3Rpb24xCgl7c2l6ZTo2MTIuMHB0IDc5Mi4wcHQ7CgltYXJnaW46NzIuMHB0IDcyLjBw
dCA3Mi4wcHQgNzIuMHB0O30KZGl2LldvcmRTZWN0aW9uMQoJe3BhZ2U6V29yZFNlY3Rpb24xO30K
LS0+PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBsYW5nPSJFTi1HQiI+CjxkaXYgY2xhc3M9IldvcmRT
ZWN0aW9uMSI+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhlbGxvIGFsbCw8L3A+CjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj5JknZl
IGJlZW4gdHJ5aW5nIHRvIGlkZW50aWZ5IGFueSBUUE0gYXV0aG9yaXphdGlvbiBmZWF0dXJlcyB0
aGF0IGNvdWxkIGJlIHVzZWQgaW4gYSB1c2VyLXNwYWNlIHBlcnNpc3RlbnQga2V5IHN0b3JlIHdp
dGggaGFyZHdhcmUgYmFja2luZywgYnV0IGl0IGFwcGVhcnMgdGhhdCBzaW1wbHkgc3RvcmluZyB0
aGUga2V5IGNvbnRleHQsIHByZWZlcmFibHkgb24gYW4gZW5jcnlwdGVkIGZpbGVzeXN0ZW0sIGlz
IHRoZQogYmVzdCBzb2x1dGlvbiBJIGNvdWxkIGNvbWUgdXAgd2l0aC4gS2V5cyBjb3VsZCBoYXZl
IGFuIGF1dGggdmFsdWUgb2YgdGhlaXIgb3duLCBidXQgdGhhdCB2YWx1ZSBtdXN0IHRoZW4gYmUg
c3RvcmVkIGFzIHdlbGwsIGFuZCBhbnkgb3RoZXIgYXV0aG9yaXphdGlvbiBtZWNoYW5pc20gZW5k
cyB1cCByZWR1Y2luZyB0byBhbiAoaW5kaXJlY3QpIJNhdXRolCB2YWx1ZSB0aGF0IGhhcyB0byBi
ZSBwZXJzaXN0ZWQuPC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwv
cD4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGhlIHRocmVhdCBJkm0gdHJ5aW5nIHRvIHdvcmsgYWdh
aW5zdCBpcyBzaW1wbHkgbGVha2luZyB0aGUgcGVyc2lzdGVkIGtleSBtYXRlcmlhbCwgYWxsb3dp
bmcgdGhlIGF0dGFja2VyIHRvIGxvYWQgYW5kIHVzZSB0aGUga2V5cyAoYXNzdW1pbmcgdGhleZJy
ZSBhdXRob3JpemVkIHRvIHVzZSB0aGUgaGllcmFyY2h5IHRoYXQgdGhlIGtleXMgYmVsb25nIHRv
KS4KPC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+QW0gSSBtaXNzaW5nIHNvbWV0aGluZywgb3IgaXMgdGhpcyBkdWUgdG8g
VFBNIGF1dGhvcml6YXRpb24gZmVhdHVyZXMgYmVpbmcgYWltZWQgbW9yZSBhdCBsb3dlciBsZXZl
bHMgb2YgdGhlIHN0YWNrPzwvcD4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286
cD48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPkJlc3QgcmVnYXJkcyw8L3A+CjxwIGNsYXNzPSJN
c29Ob3JtYWwiPklvbnV0PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpw
PjwvcD4KPC9kaXY+CklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWls
IGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJp
dmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRl
bnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsCiBvciBzdG9y
ZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuCjwvYm9k
eT4KPC9odG1sPgo=

--===============7325954844021703498==--

