Content-Type: multipart/mixed; boundary="===============2888082391931519494=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: [tpm2] Re: tpm2 Digest, Vol 37, Issue 10
Date: Wed, 15 Jul 2020 12:33:00 +0000
Message-ID: <1E21A212-F9C5-4F84-BF25-2F9819CF21DE@intel.com>
In-Reply-To: 159479640380.31907.2129815688894834688@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2888082391931519494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

@Eduardo, here is a small tutorial to explain the concepts with tools =E2=
=80=94 https://tpm2-software.github.io/2020/06/12/Remote-Attestation-With-t=
pm2-tools.html

Some of the EK AK concepts are also detailed here =E2=80=94 https://tpm2-so=
ftware.github.io/tpm2-tss/getting-started/2019/12/18/Remote-Attestation.html

Imran Desai


On Jul 15, 2020, at 12:01 AM, "tpm2-request(a)lists.01.org" <tpm2-request(a=
)lists.01.org> wrote:

=EF=BB=BFSend tpm2 mailing list submissions to
   tpm2(a)lists.01.org

To subscribe or unsubscribe via email, send a message with subject or
body 'help' to
   tpm2-request(a)lists.01.org

You can reach the person managing the list at
   tpm2-owner(a)lists.01.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of tpm2 digest..."

Today's Topics:

  1. Re: IMA determinism (Eduardo Falc=C3=A3o)


----------------------------------------------------------------------

Date: Tue, 14 Jul 2020 15:22:53 -0000
From: Eduardo Falc=C3=A3o <eduardolfalcao(a)gmail.com>
Subject: [tpm2] Re: IMA determinism
To: tpm2(a)lists.01.org
Message-ID: <20200714152253.31655.48457(a)ml01.vlan13.01.org>
Content-Type: text/plain; charset=3D"utf-8"

Hi Nicolas.

Has been a while since I followed the steps you mentioned, and everything w=
orked perfectly.
Thanks for your hints.

There is just one point I'm still missing the comprehension.
How is the binding between AK and EK performed?
How can this attestation process avert an attacker with an authentic TPM fr=
om creating a credential for an AK that is not TPM authentic?

It seems that the AK name has something to do with this, but I can't figure=
 it out how...

Best regards

------------------------------

Subject: Digest Footer

_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

------------------------------

End of tpm2 Digest, Vol 37, Issue 10
************************************

--===============2888082391931519494==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IGRpcj0iYXV0byI+DQpA
RWR1YXJkbywgaGVyZSBpcyBhIHNtYWxsIHR1dG9yaWFsIHRvIGV4cGxhaW4gdGhlIGNvbmNlcHRz
IHdpdGggdG9vbHMg4oCUJm5ic3A7PGEgaHJlZj0iaHR0cHM6Ly90cG0yLXNvZnR3YXJlLmdpdGh1
Yi5pby8yMDIwLzA2LzEyL1JlbW90ZS1BdHRlc3RhdGlvbi1XaXRoLXRwbTItdG9vbHMuaHRtbCI+
aHR0cHM6Ly90cG0yLXNvZnR3YXJlLmdpdGh1Yi5pby8yMDIwLzA2LzEyL1JlbW90ZS1BdHRlc3Rh
dGlvbi1XaXRoLXRwbTItdG9vbHMuaHRtbDwvYT4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlNv
bWUgb2YgdGhlIEVLIEFLIGNvbmNlcHRzIGFyZSBhbHNvIGRldGFpbGVkIGhlcmUg4oCUJm5ic3A7
PGEgaHJlZj0iaHR0cHM6Ly90cG0yLXNvZnR3YXJlLmdpdGh1Yi5pby90cG0yLXRzcy9nZXR0aW5n
LXN0YXJ0ZWQvMjAxOS8xMi8xOC9SZW1vdGUtQXR0ZXN0YXRpb24uaHRtbCI+aHR0cHM6Ly90cG0y
LXNvZnR3YXJlLmdpdGh1Yi5pby90cG0yLXRzcy9nZXR0aW5nLXN0YXJ0ZWQvMjAxOS8xMi8xOC9S
ZW1vdGUtQXR0ZXN0YXRpb24uaHRtbDwvYT48YnI+DQo8YnI+DQo8ZGl2IGRpcj0ibHRyIj5JbXJh
biBEZXNhaQ0KPGRpdj48YnI+DQo8L2Rpdj4NCjwvZGl2Pg0KPGRpdiBkaXI9Imx0ciI+PGJyPg0K
PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+T24gSnVsIDE1LCAyMDIwLCBhdCAxMjowMSBBTSwgJnF1
b3Q7dHBtMi1yZXF1ZXN0QGxpc3RzLjAxLm9yZyZxdW90OyAmbHQ7dHBtMi1yZXF1ZXN0QGxpc3Rz
LjAxLm9yZyZndDsgd3JvdGU6PGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8Ymxv
Y2txdW90ZSB0eXBlPSJjaXRlIj4NCjxkaXYgZGlyPSJsdHIiPu+7vzxzcGFuPlNlbmQgdHBtMiBt
YWlsaW5nIGxpc3Qgc3VibWlzc2lvbnMgdG88L3NwYW4+PGJyPg0KPHNwYW4+Jm5ic3A7ICZuYnNw
O3RwbTJAbGlzdHMuMDEub3JnPC9zcGFuPjxicj4NCjxzcGFuPjwvc3Bhbj48YnI+DQo8c3Bhbj5U
byBzdWJzY3JpYmUgb3IgdW5zdWJzY3JpYmUgdmlhIGVtYWlsLCBzZW5kIGEgbWVzc2FnZSB3aXRo
IHN1YmplY3Qgb3I8L3NwYW4+PGJyPg0KPHNwYW4+Ym9keSAnaGVscCcgdG88L3NwYW4+PGJyPg0K
PHNwYW4+Jm5ic3A7ICZuYnNwO3RwbTItcmVxdWVzdEBsaXN0cy4wMS5vcmc8L3NwYW4+PGJyPg0K
PHNwYW4+PC9zcGFuPjxicj4NCjxzcGFuPllvdSBjYW4gcmVhY2ggdGhlIHBlcnNvbiBtYW5hZ2lu
ZyB0aGUgbGlzdCBhdDwvc3Bhbj48YnI+DQo8c3Bhbj4mbmJzcDsgJm5ic3A7dHBtMi1vd25lckBs
aXN0cy4wMS5vcmc8L3NwYW4+PGJyPg0KPHNwYW4+PC9zcGFuPjxicj4NCjxzcGFuPldoZW4gcmVw
bHlpbmcsIHBsZWFzZSBlZGl0IHlvdXIgU3ViamVjdCBsaW5lIHNvIGl0IGlzIG1vcmUgc3BlY2lm
aWM8L3NwYW4+PGJyPg0KPHNwYW4+dGhhbiAmcXVvdDtSZTogQ29udGVudHMgb2YgdHBtMiBkaWdl
c3QuLi4mcXVvdDs8L3NwYW4+PGJyPg0KPHNwYW4+PC9zcGFuPjxicj4NCjxzcGFuPlRvZGF5J3Mg
VG9waWNzOjwvc3Bhbj48YnI+DQo8c3Bhbj48L3NwYW4+PGJyPg0KPHNwYW4+Jm5ic3A7Jm5ic3A7
MS4gUmU6IElNQSBkZXRlcm1pbmlzbSAoRWR1YXJkbyBGYWxjw6NvKTwvc3Bhbj48YnI+DQo8c3Bh
bj48L3NwYW4+PGJyPg0KPHNwYW4+PC9zcGFuPjxicj4NCjxzcGFuPi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08L3Nw
YW4+PGJyPg0KPHNwYW4+PC9zcGFuPjxicj4NCjxzcGFuPkRhdGU6IFR1ZSwgMTQgSnVsIDIwMjAg
MTU6MjI6NTMgLTAwMDA8L3NwYW4+PGJyPg0KPHNwYW4+RnJvbTogRWR1YXJkbyBGYWxjw6NvICZs
dDtlZHVhcmRvbGZhbGNhb0BnbWFpbC5jb20mZ3Q7PC9zcGFuPjxicj4NCjxzcGFuPlN1YmplY3Q6
IFt0cG0yXSBSZTogSU1BIGRldGVybWluaXNtPC9zcGFuPjxicj4NCjxzcGFuPlRvOiB0cG0yQGxp
c3RzLjAxLm9yZzwvc3Bhbj48YnI+DQo8c3Bhbj5NZXNzYWdlLUlEOiAmbHQ7MjAyMDA3MTQxNTIy
NTMuMzE2NTUuNDg0NTdAbWwwMS52bGFuMTMuMDEub3JnJmd0Ozwvc3Bhbj48YnI+DQo8c3Bhbj5D
b250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9JnF1b3Q7dXRmLTgmcXVvdDs8L3NwYW4+
PGJyPg0KPHNwYW4+PC9zcGFuPjxicj4NCjxzcGFuPkhpIE5pY29sYXMuPC9zcGFuPjxicj4NCjxz
cGFuPjwvc3Bhbj48YnI+DQo8c3Bhbj5IYXMgYmVlbiBhIHdoaWxlIHNpbmNlIEkgZm9sbG93ZWQg
dGhlIHN0ZXBzIHlvdSBtZW50aW9uZWQsIGFuZCBldmVyeXRoaW5nIHdvcmtlZCBwZXJmZWN0bHku
PC9zcGFuPjxicj4NCjxzcGFuPlRoYW5rcyBmb3IgeW91ciBoaW50cy48L3NwYW4+PGJyPg0KPHNw
YW4+PC9zcGFuPjxicj4NCjxzcGFuPlRoZXJlIGlzIGp1c3Qgb25lIHBvaW50IEknbSBzdGlsbCBt
aXNzaW5nIHRoZSBjb21wcmVoZW5zaW9uLjwvc3Bhbj48YnI+DQo8c3Bhbj5Ib3cgaXMgdGhlIGJp
bmRpbmcgYmV0d2VlbiBBSyBhbmQgRUsgcGVyZm9ybWVkPzwvc3Bhbj48YnI+DQo8c3Bhbj5Ib3cg
Y2FuIHRoaXMgYXR0ZXN0YXRpb24gcHJvY2VzcyBhdmVydCBhbiBhdHRhY2tlciB3aXRoIGFuIGF1
dGhlbnRpYyBUUE0gZnJvbSBjcmVhdGluZyBhIGNyZWRlbnRpYWwgZm9yIGFuIEFLIHRoYXQgaXMg
bm90IFRQTSBhdXRoZW50aWM/PC9zcGFuPjxicj4NCjxzcGFuPjwvc3Bhbj48YnI+DQo8c3Bhbj5J
dCBzZWVtcyB0aGF0IHRoZSBBSyBuYW1lIGhhcyBzb21ldGhpbmcgdG8gZG8gd2l0aCB0aGlzLCBi
dXQgSSBjYW4ndCBmaWd1cmUgaXQgb3V0IGhvdy4uLjwvc3Bhbj48YnI+DQo8c3Bhbj48L3NwYW4+
PGJyPg0KPHNwYW4+QmVzdCByZWdhcmRzPC9zcGFuPjxicj4NCjxzcGFuPjwvc3Bhbj48YnI+DQo8
c3Bhbj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08L3NwYW4+PGJyPg0KPHNwYW4+PC9z
cGFuPjxicj4NCjxzcGFuPlN1YmplY3Q6IERpZ2VzdCBGb290ZXI8L3NwYW4+PGJyPg0KPHNwYW4+
PC9zcGFuPjxicj4NCjxzcGFuPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fPC9zcGFuPjxicj4NCjxzcGFuPnRwbTIgbWFpbGluZyBsaXN0IC0tIHRwbTJAbGlz
dHMuMDEub3JnPC9zcGFuPjxicj4NCjxzcGFuPlRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwg
dG8gdHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L3NwYW4+PGJyPg0KPHNwYW4+JSh3ZWJfcGFnZV91
cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8L3NwYW4+PGJyPg0KPHNw
YW4+PC9zcGFuPjxicj4NCjxzcGFuPi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTwvc3Bh
bj48YnI+DQo8c3Bhbj48L3NwYW4+PGJyPg0KPHNwYW4+RW5kIG9mIHRwbTIgRGlnZXN0LCBWb2wg
MzcsIElzc3VlIDEwPC9zcGFuPjxicj4NCjxzcGFuPioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKjwvc3Bhbj48YnI+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPC9i
b2R5Pg0KPC9odG1sPg0K

--===============2888082391931519494==--

