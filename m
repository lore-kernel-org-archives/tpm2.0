Content-Type: multipart/mixed; boundary="===============3659327271979644173=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 23, Issue 13
Date: Fri, 24 May 2019 11:50:19 +0000
Message-ID: <67578036-1A3A-441C-9E8F-60FF2184513B@intel.com>
In-Reply-To: mailman.481.1558685875.2255.tpm2@lists.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3659327271979644173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

An example of how policyauthorize or wildcard policy is setup - https://git=
hub.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_policyauthorize.1.md

Imran Desai


On May 24, 2019, at 1:18 AM, "tpm2-request(a)lists.01.org<mailto:tpm2-reque=
st(a)lists.01.org>" <tpm2-request(a)lists.01.org<mailto:tpm2-request(a)list=
s.01.org>> wrote:

Send tpm2 mailing list submissions to
   tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>

To subscribe or unsubscribe via the World Wide Web, visit
   https://lists.01.org/mailman/listinfo/tpm2
or, via email, send a message with subject or body 'help' to
   tpm2-request(a)lists.01.org<mailto:tpm2-request(a)lists.01.org>

You can reach the person managing the list at
   tpm2-owner(a)lists.01.org<mailto:tpm2-owner(a)lists.01.org>

When replying, please edit your Subject line so it is more specific
than "Re: Contents of tpm2 digest..."


Today's Topics:

  1. Wildcard policies for NVindexes (Tommaso Corda)
  2. Re: Wildcard policies for NVindexes (Fuchs, Andreas)
  3. R: Wildcard policies for NVindexes (Tommaso Corda)
  4. Re: Wildcard policies for NVindexes (Fuchs, Andreas)


----------------------------------------------------------------------

Message: 1
Date: Fri, 24 May 2019 08:03:30 +0000
From: Tommaso Corda <tommasocorda(a)hotmail.it<mailto:tommasocorda(a)hotmai=
l.it>>
To: "tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>" <tpm2(a)lists.01.org<=
mailto:tpm2(a)lists.01.org>>
Subject: [tpm2] Wildcard policies for NVindexes
Message-ID:
   <AM6PR10MB2134C5728B318FEE1B27A147AE020(a)AM6PR10MB2134.EURPRD10.PROD.OU=
TLOOK.COM<mailto:AM6PR10MB2134C5728B318FEE1B27A147AE020(a)AM6PR10MB2134.EUR=
PRD10.PROD.OUTLOOK.COM>>

Content-Type: text/plain; charset=3D"us-ascii"

Hello everyone.
Can anybody explain me how to use wildcard policies to create a NVindex and=
 how to use a wildcard policy to access that NVindex?
Thanks.


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.01.org/pipermail/tpm2/attachments/20190524/d00eba41/atta=
chment-0001.html>

------------------------------

Message: 2
Date: Fri, 24 May 2019 08:05:00 +0000
From: "Fuchs, Andreas" <andreas.fuchs(a)sit.fraunhofer.de<mailto:andreas.fu=
chs(a)sit.fraunhofer.de>>
To: Tommaso Corda <tommasocorda(a)hotmail.it<mailto:tommasocorda(a)hotmail.=
it>>, "tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>"
   <tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>>
Subject: Re: [tpm2] Wildcard policies for NVindexes
Message-ID:
   <9F48E1A823B03B4790B7E6E69430724D0163A458F6(a)exch2010c.sit.fraunhofer.d=
e<mailto:9F48E1A823B03B4790B7E6E69430724D0163A458F6(a)exch2010c.sit.fraunho=
fer.de>>

Content-Type: text/plain; charset=3D"iso-8859-1"

Could you explain to me, what a Wildcard policy supposingly is ?
I've never heard of this.
________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org<mailto:tpm2-bounces(a)lists.01.org>=
] on behalf of Tommaso Corda [tommasocorda(a)hotmail.it<mailto:tommasocorda=
(a)hotmail.it>]
Sent: Friday, May 24, 2019 10:03
To: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
Subject: [tpm2] Wildcard policies for NVindexes

Hello everyone.
Can anybody explain me how to use wildcard policies to create a NVindex and=
 how to use a wildcard policy to access that NVindex?
Thanks.


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.01.org/pipermail/tpm2/attachments/20190524/4e7d5118/atta=
chment-0001.html>

------------------------------

Message: 3
Date: Fri, 24 May 2019 08:07:56 +0000
From: Tommaso Corda <tommasocorda(a)hotmail.it<mailto:tommasocorda(a)hotmai=
l.it>>
To: "Fuchs, Andreas" <andreas.fuchs(a)sit.fraunhofer.de<mailto:andreas.fuch=
s(a)sit.fraunhofer.de>>,
   "tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>" <tpm2(a)lists.01.org<m=
ailto:tpm2(a)lists.01.org>>
Subject: [tpm2] R: Wildcard policies for NVindexes
Message-ID:
   <AM6PR10MB2134B29444A9E702DE553757AE020(a)AM6PR10MB2134.EURPRD10.PROD.OU=
TLOOK.COM<mailto:AM6PR10MB2134B29444A9E702DE553757AE020(a)AM6PR10MB2134.EUR=
PRD10.PROD.OUTLOOK.COM>>

Content-Type: text/plain; charset=3D"iso-8859-1"

https://ebrary.net/24814/computer_science/flexible_wild_card_policy
Flexible (Wild Card) Policy - A Practical Guide to TPM 2.0<https://ebrary.n=
et/24814/computer_science/flexible_wild_card_policy>
One major problem with the TPM 1.2 design was the brittleness of PCRs. When=
 an entity was locked to a PCR, it was not possible to change the required =
values of the PCR after it was so locked.
ebrary.net<http://ebrary.net>

________________________________
Da: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de<mailto:andreas.fuchs(=
a)sit.fraunhofer.de>>
Inviato: venerd? 24 maggio 2019 10:05
A: Tommaso Corda; tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
Oggetto: RE: Wildcard policies for NVindexes

Could you explain to me, what a Wildcard policy supposingly is ?
I've never heard of this.
________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org<mailto:tpm2-bounces(a)lists.01.org>=
] on behalf of Tommaso Corda [tommasocorda(a)hotmail.it<mailto:tommasocorda=
(a)hotmail.it>]
Sent: Friday, May 24, 2019 10:03
To: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
Subject: [tpm2] Wildcard policies for NVindexes


Hello everyone.

Can anybody explain me how to use wildcard policies to create a NVindex and=
 how to use a wildcard policy to access that NVindex?
Thanks.




-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.01.org/pipermail/tpm2/attachments/20190524/7342c438/atta=
chment-0001.html>

------------------------------

Message: 4
Date: Fri, 24 May 2019 08:17:44 +0000
From: "Fuchs, Andreas" <andreas.fuchs(a)sit.fraunhofer.de<mailto:andreas.fu=
chs(a)sit.fraunhofer.de>>
To: Tommaso Corda <tommasocorda(a)hotmail.it<mailto:tommasocorda(a)hotmail.=
it>>, "tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>"
   <tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>>
Subject: Re: [tpm2] Wildcard policies for NVindexes
Message-ID:
   <9F48E1A823B03B4790B7E6E69430724D0163A45911(a)exch2010c.sit.fraunhofer.d=
e<mailto:9F48E1A823B03B4790B7E6E69430724D0163A45911(a)exch2010c.sit.fraunho=
fer.de>>

Content-Type: text/plain; charset=3D"iso-8859-1"

Just a recommendation for wording:
WildCard Policy is not official, only because someone used it in some book.
Just call it "PolicyAuthorize" as that's the commands name.

For PolicyAuthorize you will find some examples in the man-pages of the too=
ls:
https://github.com/tpm2-software/tpm2-tools/blob/61bbbb6444ea379f94bec46a36=
eb6512cd717632/man/tpm2_policyauthorize.1.md

If you need more, search TPM-Specification Part 1 or the Internets for "Pol=
icyAuthorize".

________________________________
From: Tommaso Corda [tommasocorda(a)hotmail.it<mailto:tommasocorda(a)hotmai=
l.it>]
Sent: Friday, May 24, 2019 10:07
To: Fuchs, Andreas; tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
Subject: R: Wildcard policies for NVindexes

https://ebrary.net/24814/computer_science/flexible_wild_card_policy
Flexible (Wild Card) Policy - A Practical Guide to TPM 2.0<https://ebrary.n=
et/24814/computer_science/flexible_wild_card_policy>
One major problem with the TPM 1.2 design was the brittleness of PCRs. When=
 an entity was locked to a PCR, it was not possible to change the required =
values of the PCR after it was so locked.
ebrary.net<http://ebrary.net>


________________________________
Da: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de<mailto:andreas.fuchs(=
a)sit.fraunhofer.de>>
Inviato: venerd? 24 maggio 2019 10:05
A: Tommaso Corda; tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
Oggetto: RE: Wildcard policies for NVindexes

Could you explain to me, what a Wildcard policy supposingly is ?
I've never heard of this.
________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org<mailto:tpm2-bounces(a)lists.01.org>=
] on behalf of Tommaso Corda [tommasocorda(a)hotmail.it<mailto:tommasocorda=
(a)hotmail.it>]
Sent: Friday, May 24, 2019 10:03
To: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
Subject: [tpm2] Wildcard policies for NVindexes


Hello everyone.

Can anybody explain me how to use wildcard policies to create a NVindex and=
 how to use a wildcard policy to access that NVindex?
Thanks.




-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.01.org/pipermail/tpm2/attachments/20190524/d414d497/atta=
chment.html>

------------------------------

Subject: Digest Footer

_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
https://lists.01.org/mailman/listinfo/tpm2


------------------------------

End of tpm2 Digest, Vol 23, Issue 13
************************************

--===============3659327271979644173==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjwvaGVhZD4KPGJvZHkgZGlyPSJhdXRvIj4KQW4g
ZXhhbXBsZSBvZiBob3cgcG9saWN5YXV0aG9yaXplIG9yIHdpbGRjYXJkIHBvbGljeSBpcyBzZXR1
cCAtJm5ic3A7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10
b29scy9ibG9iL21hc3Rlci9tYW4vdHBtMl9wb2xpY3lhdXRob3JpemUuMS5tZCI+aHR0cHM6Ly9n
aXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9ibG9iL21hc3Rlci9tYW4vdHBtMl9w
b2xpY3lhdXRob3JpemUuMS5tZDwvYT4KPGRpdj48YnI+CjxkaXYgZGlyPSJsdHIiIGlkPSJBcHBs
ZU1haWxTaWduYXR1cmUiPkltcmFuIERlc2FpCjxkaXY+PGJyPgo8L2Rpdj4KPC9kaXY+CjxkaXYg
ZGlyPSJsdHIiPjxicj4KT24gTWF5IDI0LCAyMDE5LCBhdCAxOjE4IEFNLCAmcXVvdDs8YSBocmVm
PSJtYWlsdG86dHBtMi1yZXF1ZXN0QGxpc3RzLjAxLm9yZyI+dHBtMi1yZXF1ZXN0QGxpc3RzLjAx
Lm9yZzwvYT4mcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzp0cG0yLXJlcXVlc3RAbGlzdHMuMDEu
b3JnIj50cG0yLXJlcXVlc3RAbGlzdHMuMDEub3JnPC9hPiZndDsgd3JvdGU6PGJyPgo8YnI+Cjwv
ZGl2Pgo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KPGRpdiBkaXI9Imx0ciI+PHNwYW4+U2VuZCB0
cG0yIG1haWxpbmcgbGlzdCBzdWJtaXNzaW9ucyB0bzwvc3Bhbj48YnI+CjxzcGFuPiZuYnNwOyAm
bmJzcDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEub3Jn
PC9hPjwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPlRvIHN1YnNjcmliZSBvciB1
bnN1YnNjcmliZSB2aWEgdGhlIFdvcmxkIFdpZGUgV2ViLCB2aXNpdDwvc3Bhbj48YnI+CjxzcGFu
PiZuYnNwOyAmbmJzcDs8YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3RwbTIiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMjwvYT48
L3NwYW4+PGJyPgo8c3Bhbj5vciwgdmlhIGVtYWlsLCBzZW5kIGEgbWVzc2FnZSB3aXRoIHN1Ympl
Y3Qgb3IgYm9keSAnaGVscCcgdG88L3NwYW4+PGJyPgo8c3Bhbj4mbmJzcDsgJm5ic3A7PGEgaHJl
Zj0ibWFpbHRvOnRwbTItcmVxdWVzdEBsaXN0cy4wMS5vcmciPnRwbTItcmVxdWVzdEBsaXN0cy4w
MS5vcmc8L2E+PC9zcGFuPjxicj4KPHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+WW91IGNhbiByZWFj
aCB0aGUgcGVyc29uIG1hbmFnaW5nIHRoZSBsaXN0IGF0PC9zcGFuPjxicj4KPHNwYW4+Jm5ic3A7
ICZuYnNwOzxhIGhyZWY9Im1haWx0bzp0cG0yLW93bmVyQGxpc3RzLjAxLm9yZyI+dHBtMi1vd25l
ckBsaXN0cy4wMS5vcmc8L2E+PC9zcGFuPjxicj4KPHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+V2hl
biByZXBseWluZywgcGxlYXNlIGVkaXQgeW91ciBTdWJqZWN0IGxpbmUgc28gaXQgaXMgbW9yZSBz
cGVjaWZpYzwvc3Bhbj48YnI+CjxzcGFuPnRoYW4gJnF1b3Q7UmU6IENvbnRlbnRzIG9mIHRwbTIg
ZGlnZXN0Li4uJnF1b3Q7PC9zcGFuPjxicj4KPHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+PC9zcGFu
Pjxicj4KPHNwYW4+VG9kYXkncyBUb3BpY3M6PC9zcGFuPjxicj4KPHNwYW4+PC9zcGFuPjxicj4K
PHNwYW4+Jm5ic3A7Jm5ic3A7MS4gV2lsZGNhcmQgcG9saWNpZXMgZm9yIE5WaW5kZXhlcyAoVG9t
bWFzbyBDb3JkYSk8L3NwYW4+PGJyPgo8c3Bhbj4mbmJzcDsmbmJzcDsyLiBSZTogV2lsZGNhcmQg
cG9saWNpZXMgZm9yIE5WaW5kZXhlcyAoRnVjaHMsIEFuZHJlYXMpPC9zcGFuPjxicj4KPHNwYW4+
Jm5ic3A7Jm5ic3A7My4gUjogV2lsZGNhcmQgcG9saWNpZXMgZm9yIE5WaW5kZXhlcyAoVG9tbWFz
byBDb3JkYSk8L3NwYW4+PGJyPgo8c3Bhbj4mbmJzcDsmbmJzcDs0LiBSZTogV2lsZGNhcmQgcG9s
aWNpZXMgZm9yIE5WaW5kZXhlcyAoRnVjaHMsIEFuZHJlYXMpPC9zcGFuPjxicj4KPHNwYW4+PC9z
cGFuPjxicj4KPHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTwvc3Bhbj48YnI+
CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPk1lc3NhZ2U6IDE8L3NwYW4+PGJyPgo8c3Bhbj5EYXRl
OiBGcmksIDI0IE1heSAyMDE5IDA4OjAzOjMwICYjNDM7MDAwMDwvc3Bhbj48YnI+CjxzcGFuPkZy
b206IFRvbW1hc28gQ29yZGEgJmx0OzxhIGhyZWY9Im1haWx0bzp0b21tYXNvY29yZGFAaG90bWFp
bC5pdCI+dG9tbWFzb2NvcmRhQGhvdG1haWwuaXQ8L2E+Jmd0Ozwvc3Bhbj48YnI+CjxzcGFuPlRv
OiAmcXVvdDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEu
b3JnPC9hPiZxdW90OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0y
QGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PC9zcGFuPjxicj4KPHNwYW4+U3ViamVjdDogW3RwbTJdIFdp
bGRjYXJkIHBvbGljaWVzIGZvciBOVmluZGV4ZXM8L3NwYW4+PGJyPgo8c3Bhbj5NZXNzYWdlLUlE
Ojwvc3Bhbj48YnI+CjxzcGFuPiZuYnNwOyAmbmJzcDsmbHQ7PGEgaHJlZj0ibWFpbHRvOkFNNlBS
MTBNQjIxMzRDNTcyOEIzMThGRUUxQjI3QTE0N0FFMDIwQEFNNlBSMTBNQjIxMzQuRVVSUFJEMTAu
UFJPRC5PVVRMT09LLkNPTSI+QU02UFIxME1CMjEzNEM1NzI4QjMxOEZFRTFCMjdBMTQ3QUUwMjBA
QU02UFIxME1CMjEzNC5FVVJQUkQxMC5QUk9ELk9VVExPT0suQ09NPC9hPiZndDs8L3NwYW4+PGJy
Pgo8c3Bhbj4mbmJzcDsgJm5ic3A7PC9zcGFuPjxicj4KPHNwYW4+Q29udGVudC1UeXBlOiB0ZXh0
L3BsYWluOyBjaGFyc2V0PSZxdW90O3VzLWFzY2lpJnF1b3Q7PC9zcGFuPjxicj4KPHNwYW4+PC9z
cGFuPjxicj4KPHNwYW4+SGVsbG8gZXZlcnlvbmUuPC9zcGFuPjxicj4KPHNwYW4+Q2FuIGFueWJv
ZHkgZXhwbGFpbiBtZSBob3cgdG8gdXNlIHdpbGRjYXJkIHBvbGljaWVzIHRvIGNyZWF0ZSBhIE5W
aW5kZXggYW5kIGhvdyB0byB1c2UgYSB3aWxkY2FyZCBwb2xpY3kgdG8gYWNjZXNzIHRoYXQgTlZp
bmRleD88L3NwYW4+PGJyPgo8c3Bhbj5UaGFua3MuPC9zcGFuPjxicj4KPHNwYW4+PC9zcGFuPjxi
cj4KPHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+LS0tLS0tLS0tLS0tLS0gbmV4dCBwYXJ0IC0tLS0t
LS0tLS0tLS0tPC9zcGFuPjxicj4KPHNwYW4+QW4gSFRNTCBhdHRhY2htZW50IHdhcyBzY3J1YmJl
ZC4uLjwvc3Bhbj48YnI+CjxzcGFuPlVSTDogJmx0OzxhIGhyZWY9Imh0dHA6Ly9saXN0cy4wMS5v
cmcvcGlwZXJtYWlsL3RwbTIvYXR0YWNobWVudHMvMjAxOTA1MjQvZDAwZWJhNDEvYXR0YWNobWVu
dC0wMDAxLmh0bWwiPmh0dHA6Ly9saXN0cy4wMS5vcmcvcGlwZXJtYWlsL3RwbTIvYXR0YWNobWVu
dHMvMjAxOTA1MjQvZDAwZWJhNDEvYXR0YWNobWVudC0wMDAxLmh0bWw8L2E+Jmd0Ozwvc3Bhbj48
YnI+CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LTwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPk1lc3NhZ2U6IDI8L3NwYW4+PGJy
Pgo8c3Bhbj5EYXRlOiBGcmksIDI0IE1heSAyMDE5IDA4OjA1OjAwICYjNDM7MDAwMDwvc3Bhbj48
YnI+CjxzcGFuPkZyb206ICZxdW90O0Z1Y2hzLCBBbmRyZWFzJnF1b3Q7ICZsdDs8YSBocmVmPSJt
YWlsdG86YW5kcmVhcy5mdWNoc0BzaXQuZnJhdW5ob2Zlci5kZSI+YW5kcmVhcy5mdWNoc0BzaXQu
ZnJhdW5ob2Zlci5kZTwvYT4mZ3Q7PC9zcGFuPjxicj4KPHNwYW4+VG86IFRvbW1hc28gQ29yZGEg
Jmx0OzxhIGhyZWY9Im1haWx0bzp0b21tYXNvY29yZGFAaG90bWFpbC5pdCI+dG9tbWFzb2NvcmRh
QGhvdG1haWwuaXQ8L2E+Jmd0OywgJnF1b3Q7PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mcXVvdDs8L3NwYW4+PGJyPgo8c3Bhbj4mbmJzcDsg
Jm5ic3A7Jmx0OzxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+Jmd0Ozwvc3Bhbj48YnI+CjxzcGFuPlN1YmplY3Q6IFJlOiBbdHBtMl0gV2lsZGNh
cmQgcG9saWNpZXMgZm9yIE5WaW5kZXhlczwvc3Bhbj48YnI+CjxzcGFuPk1lc3NhZ2UtSUQ6PC9z
cGFuPjxicj4KPHNwYW4+Jm5ic3A7ICZuYnNwOyZsdDs8YSBocmVmPSJtYWlsdG86OUY0OEUxQTgy
M0IwM0I0NzkwQjdFNkU2OTQzMDcyNEQwMTYzQTQ1OEY2QGV4Y2gyMDEwYy5zaXQuZnJhdW5ob2Zl
ci5kZSI+OUY0OEUxQTgyM0IwM0I0NzkwQjdFNkU2OTQzMDcyNEQwMTYzQTQ1OEY2QGV4Y2gyMDEw
Yy5zaXQuZnJhdW5ob2Zlci5kZTwvYT4mZ3Q7PC9zcGFuPjxicj4KPHNwYW4+Jm5ic3A7ICZuYnNw
Ozwvc3Bhbj48YnI+CjxzcGFuPkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD0mcXVv
dDtpc28tODg1OS0xJnF1b3Q7PC9zcGFuPjxicj4KPHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+Q291
bGQgeW91IGV4cGxhaW4gdG8gbWUsIHdoYXQgYSBXaWxkY2FyZCBwb2xpY3kgc3VwcG9zaW5nbHkg
aXMgPzwvc3Bhbj48YnI+CjxzcGFuPkkndmUgbmV2ZXIgaGVhcmQgb2YgdGhpcy48L3NwYW4+PGJy
Pgo8c3Bhbj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzwvc3Bhbj48YnI+CjxzcGFu
PkZyb206IHRwbTIgWzxhIGhyZWY9Im1haWx0bzp0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnIj50
cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnPC9hPl0gb24gYmVoYWxmIG9mIFRvbW1hc28gQ29yZGEg
WzxhIGhyZWY9Im1haWx0bzp0b21tYXNvY29yZGFAaG90bWFpbC5pdCI+dG9tbWFzb2NvcmRhQGhv
dG1haWwuaXQ8L2E+XTwvc3Bhbj48YnI+CjxzcGFuPlNlbnQ6IEZyaWRheSwgTWF5IDI0LCAyMDE5
IDEwOjAzPC9zcGFuPjxicj4KPHNwYW4+VG86IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAx
Lm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PC9zcGFuPjxicj4KPHNwYW4+U3ViamVjdDogW3Rw
bTJdIFdpbGRjYXJkIHBvbGljaWVzIGZvciBOVmluZGV4ZXM8L3NwYW4+PGJyPgo8c3Bhbj48L3Nw
YW4+PGJyPgo8c3Bhbj5IZWxsbyBldmVyeW9uZS48L3NwYW4+PGJyPgo8c3Bhbj5DYW4gYW55Ym9k
eSBleHBsYWluIG1lIGhvdyB0byB1c2Ugd2lsZGNhcmQgcG9saWNpZXMgdG8gY3JlYXRlIGEgTlZp
bmRleCBhbmQgaG93IHRvIHVzZSBhIHdpbGRjYXJkIHBvbGljeSB0byBhY2Nlc3MgdGhhdCBOVmlu
ZGV4Pzwvc3Bhbj48YnI+CjxzcGFuPlRoYW5rcy48L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+PGJy
Pgo8c3Bhbj48L3NwYW4+PGJyPgo8c3Bhbj4tLS0tLS0tLS0tLS0tLSBuZXh0IHBhcnQgLS0tLS0t
LS0tLS0tLS08L3NwYW4+PGJyPgo8c3Bhbj5BbiBIVE1MIGF0dGFjaG1lbnQgd2FzIHNjcnViYmVk
Li4uPC9zcGFuPjxicj4KPHNwYW4+VVJMOiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpc3RzLjAxLm9y
Zy9waXBlcm1haWwvdHBtMi9hdHRhY2htZW50cy8yMDE5MDUyNC80ZTdkNTExOC9hdHRhY2htZW50
LTAwMDEuaHRtbCI+aHR0cDovL2xpc3RzLjAxLm9yZy9waXBlcm1haWwvdHBtMi9hdHRhY2htZW50
cy8yMDE5MDUyNC80ZTdkNTExOC9hdHRhY2htZW50LTAwMDEuaHRtbDwvYT4mZ3Q7PC9zcGFuPjxi
cj4KPHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
PC9zcGFuPjxicj4KPHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+TWVzc2FnZTogMzwvc3Bhbj48YnI+
CjxzcGFuPkRhdGU6IEZyaSwgMjQgTWF5IDIwMTkgMDg6MDc6NTYgJiM0MzswMDAwPC9zcGFuPjxi
cj4KPHNwYW4+RnJvbTogVG9tbWFzbyBDb3JkYSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRvbW1hc29j
b3JkYUBob3RtYWlsLml0Ij50b21tYXNvY29yZGFAaG90bWFpbC5pdDwvYT4mZ3Q7PC9zcGFuPjxi
cj4KPHNwYW4+VG86ICZxdW90O0Z1Y2hzLCBBbmRyZWFzJnF1b3Q7ICZsdDs8YSBocmVmPSJtYWls
dG86YW5kcmVhcy5mdWNoc0BzaXQuZnJhdW5ob2Zlci5kZSI+YW5kcmVhcy5mdWNoc0BzaXQuZnJh
dW5ob2Zlci5kZTwvYT4mZ3Q7LDwvc3Bhbj48YnI+CjxzcGFuPiZuYnNwOyAmbmJzcDsmcXVvdDs8
YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZx
dW90OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0yQGxpc3RzLjAx
Lm9yZzwvYT4mZ3Q7PC9zcGFuPjxicj4KPHNwYW4+U3ViamVjdDogW3RwbTJdIFI6IFdpbGRjYXJk
IHBvbGljaWVzIGZvciBOVmluZGV4ZXM8L3NwYW4+PGJyPgo8c3Bhbj5NZXNzYWdlLUlEOjwvc3Bh
bj48YnI+CjxzcGFuPiZuYnNwOyAmbmJzcDsmbHQ7PGEgaHJlZj0ibWFpbHRvOkFNNlBSMTBNQjIx
MzRCMjk0NDRBOUU3MDJERTU1Mzc1N0FFMDIwQEFNNlBSMTBNQjIxMzQuRVVSUFJEMTAuUFJPRC5P
VVRMT09LLkNPTSI+QU02UFIxME1CMjEzNEIyOTQ0NEE5RTcwMkRFNTUzNzU3QUUwMjBAQU02UFIx
ME1CMjEzNC5FVVJQUkQxMC5QUk9ELk9VVExPT0suQ09NPC9hPiZndDs8L3NwYW4+PGJyPgo8c3Bh
bj4mbmJzcDsgJm5ic3A7PC9zcGFuPjxicj4KPHNwYW4+Q29udGVudC1UeXBlOiB0ZXh0L3BsYWlu
OyBjaGFyc2V0PSZxdW90O2lzby04ODU5LTEmcXVvdDs8L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+
PGJyPgo8c3Bhbj48YSBocmVmPSJodHRwczovL2VicmFyeS5uZXQvMjQ4MTQvY29tcHV0ZXJfc2Np
ZW5jZS9mbGV4aWJsZV93aWxkX2NhcmRfcG9saWN5Ij5odHRwczovL2VicmFyeS5uZXQvMjQ4MTQv
Y29tcHV0ZXJfc2NpZW5jZS9mbGV4aWJsZV93aWxkX2NhcmRfcG9saWN5PC9hPjwvc3Bhbj48YnI+
CjxzcGFuPkZsZXhpYmxlIChXaWxkIENhcmQpIFBvbGljeSAtIEEgUHJhY3RpY2FsIEd1aWRlIHRv
IFRQTSAyLjAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9lYnJhcnkubmV0LzI0ODE0L2NvbXB1dGVyX3Nj
aWVuY2UvZmxleGlibGVfd2lsZF9jYXJkX3BvbGljeSI+aHR0cHM6Ly9lYnJhcnkubmV0LzI0ODE0
L2NvbXB1dGVyX3NjaWVuY2UvZmxleGlibGVfd2lsZF9jYXJkX3BvbGljeTwvYT4mZ3Q7PC9zcGFu
Pjxicj4KPHNwYW4+T25lIG1ham9yIHByb2JsZW0gd2l0aCB0aGUgVFBNIDEuMiBkZXNpZ24gd2Fz
IHRoZSBicml0dGxlbmVzcyBvZiBQQ1JzLiBXaGVuIGFuIGVudGl0eSB3YXMgbG9ja2VkIHRvIGEg
UENSLCBpdCB3YXMgbm90IHBvc3NpYmxlIHRvIGNoYW5nZSB0aGUgcmVxdWlyZWQgdmFsdWVzIG9m
IHRoZSBQQ1IgYWZ0ZXIgaXQgd2FzIHNvIGxvY2tlZC48L3NwYW4+PGJyPgo8c3Bhbj48YSBocmVm
PSJodHRwOi8vZWJyYXJ5Lm5ldCI+ZWJyYXJ5Lm5ldDwvYT48L3NwYW4+PGJyPgo8c3Bhbj48L3Nw
YW4+PGJyPgo8c3Bhbj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzwvc3Bhbj48YnI+
CjxzcGFuPkRhOiBGdWNocywgQW5kcmVhcyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFuZHJlYXMuZnVj
aHNAc2l0LmZyYXVuaG9mZXIuZGUiPmFuZHJlYXMuZnVjaHNAc2l0LmZyYXVuaG9mZXIuZGU8L2E+
Jmd0Ozwvc3Bhbj48YnI+CjxzcGFuPkludmlhdG86IHZlbmVyZD8gMjQgbWFnZ2lvIDIwMTkgMTA6
MDU8L3NwYW4+PGJyPgo8c3Bhbj5BOiBUb21tYXNvIENvcmRhOyA8YSBocmVmPSJtYWlsdG86dHBt
MkBsaXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEub3JnPC9hPjwvc3Bhbj48YnI+CjxzcGFuPk9n
Z2V0dG86IFJFOiBXaWxkY2FyZCBwb2xpY2llcyBmb3IgTlZpbmRleGVzPC9zcGFuPjxicj4KPHNw
YW4+PC9zcGFuPjxicj4KPHNwYW4+Q291bGQgeW91IGV4cGxhaW4gdG8gbWUsIHdoYXQgYSBXaWxk
Y2FyZCBwb2xpY3kgc3VwcG9zaW5nbHkgaXMgPzwvc3Bhbj48YnI+CjxzcGFuPkkndmUgbmV2ZXIg
aGVhcmQgb2YgdGhpcy48L3NwYW4+PGJyPgo8c3Bhbj5fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXzwvc3Bhbj48YnI+CjxzcGFuPkZyb206IHRwbTIgWzxhIGhyZWY9Im1haWx0bzp0cG0y
LWJvdW5jZXNAbGlzdHMuMDEub3JnIj50cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnPC9hPl0gb24g
YmVoYWxmIG9mIFRvbW1hc28gQ29yZGEgWzxhIGhyZWY9Im1haWx0bzp0b21tYXNvY29yZGFAaG90
bWFpbC5pdCI+dG9tbWFzb2NvcmRhQGhvdG1haWwuaXQ8L2E+XTwvc3Bhbj48YnI+CjxzcGFuPlNl
bnQ6IEZyaWRheSwgTWF5IDI0LCAyMDE5IDEwOjAzPC9zcGFuPjxicj4KPHNwYW4+VG86IDxhIGhy
ZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PC9zcGFu
Pjxicj4KPHNwYW4+U3ViamVjdDogW3RwbTJdIFdpbGRjYXJkIHBvbGljaWVzIGZvciBOVmluZGV4
ZXM8L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+PGJyPgo8c3Bhbj5I
ZWxsbyBldmVyeW9uZS48L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+PGJyPgo8c3Bhbj5DYW4gYW55
Ym9keSBleHBsYWluIG1lIGhvdyB0byB1c2Ugd2lsZGNhcmQgcG9saWNpZXMgdG8gY3JlYXRlIGEg
TlZpbmRleCBhbmQgaG93IHRvIHVzZSBhIHdpbGRjYXJkIHBvbGljeSB0byBhY2Nlc3MgdGhhdCBO
VmluZGV4Pzwvc3Bhbj48YnI+CjxzcGFuPlRoYW5rcy48L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+
PGJyPgo8c3Bhbj48L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+PGJy
Pgo8c3Bhbj4tLS0tLS0tLS0tLS0tLSBuZXh0IHBhcnQgLS0tLS0tLS0tLS0tLS08L3NwYW4+PGJy
Pgo8c3Bhbj5BbiBIVE1MIGF0dGFjaG1lbnQgd2FzIHNjcnViYmVkLi4uPC9zcGFuPjxicj4KPHNw
YW4+VVJMOiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpc3RzLjAxLm9yZy9waXBlcm1haWwvdHBtMi9h
dHRhY2htZW50cy8yMDE5MDUyNC83MzQyYzQzOC9hdHRhY2htZW50LTAwMDEuaHRtbCI+aHR0cDov
L2xpc3RzLjAxLm9yZy9waXBlcm1haWwvdHBtMi9hdHRhY2htZW50cy8yMDE5MDUyNC83MzQyYzQz
OC9hdHRhY2htZW50LTAwMDEuaHRtbDwvYT4mZ3Q7PC9zcGFuPjxicj4KPHNwYW4+PC9zcGFuPjxi
cj4KPHNwYW4+LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPC9zcGFuPjxicj4KPHNwYW4+
PC9zcGFuPjxicj4KPHNwYW4+TWVzc2FnZTogNDwvc3Bhbj48YnI+CjxzcGFuPkRhdGU6IEZyaSwg
MjQgTWF5IDIwMTkgMDg6MTc6NDQgJiM0MzswMDAwPC9zcGFuPjxicj4KPHNwYW4+RnJvbTogJnF1
b3Q7RnVjaHMsIEFuZHJlYXMmcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzphbmRyZWFzLmZ1Y2hz
QHNpdC5mcmF1bmhvZmVyLmRlIj5hbmRyZWFzLmZ1Y2hzQHNpdC5mcmF1bmhvZmVyLmRlPC9hPiZn
dDs8L3NwYW4+PGJyPgo8c3Bhbj5UbzogVG9tbWFzbyBDb3JkYSAmbHQ7PGEgaHJlZj0ibWFpbHRv
OnRvbW1hc29jb3JkYUBob3RtYWlsLml0Ij50b21tYXNvY29yZGFAaG90bWFpbC5pdDwvYT4mZ3Q7
LCAmcXVvdDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEu
b3JnPC9hPiZxdW90Ozwvc3Bhbj48YnI+CjxzcGFuPiZuYnNwOyAmbmJzcDsmbHQ7PGEgaHJlZj0i
bWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PC9zcGFu
Pjxicj4KPHNwYW4+U3ViamVjdDogUmU6IFt0cG0yXSBXaWxkY2FyZCBwb2xpY2llcyBmb3IgTlZp
bmRleGVzPC9zcGFuPjxicj4KPHNwYW4+TWVzc2FnZS1JRDo8L3NwYW4+PGJyPgo8c3Bhbj4mbmJz
cDsgJm5ic3A7Jmx0OzxhIGhyZWY9Im1haWx0bzo5RjQ4RTFBODIzQjAzQjQ3OTBCN0U2RTY5NDMw
NzI0RDAxNjNBNDU5MTFAZXhjaDIwMTBjLnNpdC5mcmF1bmhvZmVyLmRlIj45RjQ4RTFBODIzQjAz
QjQ3OTBCN0U2RTY5NDMwNzI0RDAxNjNBNDU5MTFAZXhjaDIwMTBjLnNpdC5mcmF1bmhvZmVyLmRl
PC9hPiZndDs8L3NwYW4+PGJyPgo8c3Bhbj4mbmJzcDsgJm5ic3A7PC9zcGFuPjxicj4KPHNwYW4+
Q29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PSZxdW90O2lzby04ODU5LTEmcXVvdDs8
L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+PGJyPgo8c3Bhbj5KdXN0IGEgcmVjb21tZW5kYXRpb24g
Zm9yIHdvcmRpbmc6PC9zcGFuPjxicj4KPHNwYW4+V2lsZENhcmQgUG9saWN5IGlzIG5vdCBvZmZp
Y2lhbCwgb25seSBiZWNhdXNlIHNvbWVvbmUgdXNlZCBpdCBpbiBzb21lIGJvb2suPC9zcGFuPjxi
cj4KPHNwYW4+SnVzdCBjYWxsIGl0ICZxdW90O1BvbGljeUF1dGhvcml6ZSZxdW90OyBhcyB0aGF0
J3MgdGhlIGNvbW1hbmRzIG5hbWUuPC9zcGFuPjxicj4KPHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+
Rm9yIFBvbGljeUF1dGhvcml6ZSB5b3Ugd2lsbCBmaW5kIHNvbWUgZXhhbXBsZXMgaW4gdGhlIG1h
bi1wYWdlcyBvZiB0aGUgdG9vbHM6PC9zcGFuPjxicj4KPHNwYW4+PGEgaHJlZj0iaHR0cHM6Ly9n
aXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9ibG9iLzYxYmJiYjY0NDRlYTM3OWY5
NGJlYzQ2YTM2ZWI2NTEyY2Q3MTc2MzIvbWFuL3RwbTJfcG9saWN5YXV0aG9yaXplLjEubWQiPmh0
dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi82MWJiYmI2NDQ0
ZWEzNzlmOTRiZWM0NmEzNmViNjUxMmNkNzE3NjMyL21hbi90cG0yX3BvbGljeWF1dGhvcml6ZS4x
Lm1kPC9hPjwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPklmIHlvdSBuZWVkIG1v
cmUsIHNlYXJjaCBUUE0tU3BlY2lmaWNhdGlvbiBQYXJ0IDEgb3IgdGhlIEludGVybmV0cyBmb3Ig
JnF1b3Q7UG9saWN5QXV0aG9yaXplJnF1b3Q7Ljwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+
CjxzcGFuPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPC9zcGFuPjxicj4KPHNwYW4+
RnJvbTogVG9tbWFzbyBDb3JkYSBbPGEgaHJlZj0ibWFpbHRvOnRvbW1hc29jb3JkYUBob3RtYWls
Lml0Ij50b21tYXNvY29yZGFAaG90bWFpbC5pdDwvYT5dPC9zcGFuPjxicj4KPHNwYW4+U2VudDog
RnJpZGF5LCBNYXkgMjQsIDIwMTkgMTA6MDc8L3NwYW4+PGJyPgo8c3Bhbj5UbzogRnVjaHMsIEFu
ZHJlYXM7IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5v
cmc8L2E+PC9zcGFuPjxicj4KPHNwYW4+U3ViamVjdDogUjogV2lsZGNhcmQgcG9saWNpZXMgZm9y
IE5WaW5kZXhlczwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPjxhIGhyZWY9Imh0
dHBzOi8vZWJyYXJ5Lm5ldC8yNDgxNC9jb21wdXRlcl9zY2llbmNlL2ZsZXhpYmxlX3dpbGRfY2Fy
ZF9wb2xpY3kiPmh0dHBzOi8vZWJyYXJ5Lm5ldC8yNDgxNC9jb21wdXRlcl9zY2llbmNlL2ZsZXhp
YmxlX3dpbGRfY2FyZF9wb2xpY3k8L2E+PC9zcGFuPjxicj4KPHNwYW4+RmxleGlibGUgKFdpbGQg
Q2FyZCkgUG9saWN5IC0gQSBQcmFjdGljYWwgR3VpZGUgdG8gVFBNIDIuMCZsdDs8YSBocmVmPSJo
dHRwczovL2VicmFyeS5uZXQvMjQ4MTQvY29tcHV0ZXJfc2NpZW5jZS9mbGV4aWJsZV93aWxkX2Nh
cmRfcG9saWN5Ij5odHRwczovL2VicmFyeS5uZXQvMjQ4MTQvY29tcHV0ZXJfc2NpZW5jZS9mbGV4
aWJsZV93aWxkX2NhcmRfcG9saWN5PC9hPiZndDs8L3NwYW4+PGJyPgo8c3Bhbj5PbmUgbWFqb3Ig
cHJvYmxlbSB3aXRoIHRoZSBUUE0gMS4yIGRlc2lnbiB3YXMgdGhlIGJyaXR0bGVuZXNzIG9mIFBD
UnMuIFdoZW4gYW4gZW50aXR5IHdhcyBsb2NrZWQgdG8gYSBQQ1IsIGl0IHdhcyBub3QgcG9zc2li
bGUgdG8gY2hhbmdlIHRoZSByZXF1aXJlZCB2YWx1ZXMgb2YgdGhlIFBDUiBhZnRlciBpdCB3YXMg
c28gbG9ja2VkLjwvc3Bhbj48YnI+CjxzcGFuPjxhIGhyZWY9Imh0dHA6Ly9lYnJhcnkubmV0Ij5l
YnJhcnkubmV0PC9hPjwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48
YnI+CjxzcGFuPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPC9zcGFuPjxicj4KPHNw
YW4+RGE6IEZ1Y2hzLCBBbmRyZWFzICZsdDs8YSBocmVmPSJtYWlsdG86YW5kcmVhcy5mdWNoc0Bz
aXQuZnJhdW5ob2Zlci5kZSI+YW5kcmVhcy5mdWNoc0BzaXQuZnJhdW5ob2Zlci5kZTwvYT4mZ3Q7
PC9zcGFuPjxicj4KPHNwYW4+SW52aWF0bzogdmVuZXJkPyAyNCBtYWdnaW8gMjAxOSAxMDowNTwv
c3Bhbj48YnI+CjxzcGFuPkE6IFRvbW1hc28gQ29yZGE7IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxp
c3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PC9zcGFuPjxicj4KPHNwYW4+T2dnZXR0
bzogUkU6IFdpbGRjYXJkIHBvbGljaWVzIGZvciBOVmluZGV4ZXM8L3NwYW4+PGJyPgo8c3Bhbj48
L3NwYW4+PGJyPgo8c3Bhbj5Db3VsZCB5b3UgZXhwbGFpbiB0byBtZSwgd2hhdCBhIFdpbGRjYXJk
IHBvbGljeSBzdXBwb3NpbmdseSBpcyA/PC9zcGFuPjxicj4KPHNwYW4+SSd2ZSBuZXZlciBoZWFy
ZCBvZiB0aGlzLjwvc3Bhbj48YnI+CjxzcGFuPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fPC9zcGFuPjxicj4KPHNwYW4+RnJvbTogdHBtMiBbPGEgaHJlZj0ibWFpbHRvOnRwbTItYm91
bmNlc0BsaXN0cy4wMS5vcmciPnRwbTItYm91bmNlc0BsaXN0cy4wMS5vcmc8L2E+XSBvbiBiZWhh
bGYgb2YgVG9tbWFzbyBDb3JkYSBbPGEgaHJlZj0ibWFpbHRvOnRvbW1hc29jb3JkYUBob3RtYWls
Lml0Ij50b21tYXNvY29yZGFAaG90bWFpbC5pdDwvYT5dPC9zcGFuPjxicj4KPHNwYW4+U2VudDog
RnJpZGF5LCBNYXkgMjQsIDIwMTkgMTA6MDM8L3NwYW4+PGJyPgo8c3Bhbj5UbzogPGEgaHJlZj0i
bWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48L3NwYW4+PGJy
Pgo8c3Bhbj5TdWJqZWN0OiBbdHBtMl0gV2lsZGNhcmQgcG9saWNpZXMgZm9yIE5WaW5kZXhlczwv
c3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPkhlbGxv
IGV2ZXJ5b25lLjwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPkNhbiBhbnlib2R5
IGV4cGxhaW4gbWUgaG93IHRvIHVzZSB3aWxkY2FyZCBwb2xpY2llcyB0byBjcmVhdGUgYSBOVmlu
ZGV4IGFuZCBob3cgdG8gdXNlIGEgd2lsZGNhcmQgcG9saWN5IHRvIGFjY2VzcyB0aGF0IE5WaW5k
ZXg/PC9zcGFuPjxicj4KPHNwYW4+VGhhbmtzLjwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+
CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+Cjxz
cGFuPi0tLS0tLS0tLS0tLS0tIG5leHQgcGFydCAtLS0tLS0tLS0tLS0tLTwvc3Bhbj48YnI+Cjxz
cGFuPkFuIEhUTUwgYXR0YWNobWVudCB3YXMgc2NydWJiZWQuLi48L3NwYW4+PGJyPgo8c3Bhbj5V
Ukw6ICZsdDs8YSBocmVmPSJodHRwOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC90cG0yL2F0dGFj
aG1lbnRzLzIwMTkwNTI0L2Q0MTRkNDk3L2F0dGFjaG1lbnQuaHRtbCI+aHR0cDovL2xpc3RzLjAx
Lm9yZy9waXBlcm1haWwvdHBtMi9hdHRhY2htZW50cy8yMDE5MDUyNC9kNDE0ZDQ5Ny9hdHRhY2ht
ZW50Lmh0bWw8L2E+Jmd0Ozwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+Cjxz
cGFuPlN1YmplY3Q6IERpZ2VzdCBGb290ZXI8L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+PGJyPgo8
c3Bhbj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzwvc3Bh
bj48YnI+CjxzcGFuPnRwbTIgbWFpbGluZyBsaXN0PC9zcGFuPjxicj4KPHNwYW4+PGEgaHJlZj0i
bWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48L3NwYW4+PGJy
Pgo8c3Bhbj48YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Rw
bTIiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMjwvYT48L3NwYW4+
PGJyPgo8c3Bhbj48L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+PGJyPgo8c3Bhbj4tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS08L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+PGJyPgo8c3Bhbj5F
bmQgb2YgdHBtMiBEaWdlc3QsIFZvbCAyMywgSXNzdWUgMTM8L3NwYW4+PGJyPgo8c3Bhbj4qKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKio8L3NwYW4+PGJyPgo8L2Rpdj4KPC9ibG9j
a3F1b3RlPgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============3659327271979644173==--

