Content-Type: multipart/mixed; boundary="===============3426854586672386912=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: policies in conjunctive normal form
Date: Wed, 17 Feb 2021 17:32:07 -0500
Message-ID: <OFFCE1D34D.95FFF320-ON0025867F.007B4A24-8525867F.007BCA5B@notes.na.collabserv.com>
In-Reply-To: 20210217203616.2937.51368@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3426854586672386912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I actually really liked this question.  I had to think about it.
The answer is separate from any particular TSS.

AFAIK, You could do

((A or B) and C) or ((A or B) and D))

However, this would require 5 calls to the TPM:
	A, B, or, C, or

Your plan B only requires 3 TPM commands.  I.e., it looks
more complicated but it will perform better.

> From: narcis2004(a)yahoo.com
> To: tpm2(a)lists.01.org
> Date: 02/17/2021 03:36 PM
> Subject: [EXTERNAL] [tpm2] policies in conjunctive normal form
>
> Question: is it possible to structure a policy using tpm2-tools in
> the following form?
>   policy =3D (a OR b) AND (c OR d)
>   - where a, b, c, d are simple pcr policies.
>
> I tried this, and apparently creating an *AND* of policy *OR* did
> not work as i thought. "and.policy" will contain the hash of the
> second tpm2_policyor instead of generating a new hash
>   tpm2_startauthsession --session session.ctx
>   tpm2_policyor --session session.ctx sha256:a.policy,b.policy
>   tpm2_policyor --session session.ctx sha256:c.policy,d.policy --
> policy and.policy
>   tpm2_flushcontext session.ctx
>
>
> Plan B would be to structure the policy in the equivalent
> disjunctive normal form, which works but is less scalable. i.e.:
>   policy =3D (a AND c) OR (a AND d) OR (b AND c) OR (b AND d)
>
> Thanks,
> Narcis
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============3426854586672386912==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PHR0Pjxmb250IHNpemU9IjIiPkkgYWN0dWFsbHkgcmVhbGx5IGxpa2Vk
IHRoaXMgcXVlc3Rpb24uICZuYnNwO0kgaGFkIHRvIHRoaW5rIGFib3V0IGl0LjwvZm9udD48L3R0
Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+VGhlIGFuc3dlciBpcyBzZXBhcmF0ZSBmcm9tIGFueSBw
YXJ0aWN1bGFyIFRTUy48L2ZvbnQ+PC90dD48YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5BRkFJ
SywgWW91IGNvdWxkIGRvPC9mb250PjwvdHQ+PGJyPjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+KChB
IG9yIEIpIGFuZCBDKSBvciAoKEEgb3IgQikgYW5kIEQpKTwvZm9udD48L3R0Pjxicj48YnI+PHR0
Pjxmb250IHNpemU9IjIiPkhvd2V2ZXIsIHRoaXMgd291bGQgcmVxdWlyZSA1IGNhbGxzIHRvIHRo
ZSBUUE06PC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4gICAgICAgIEEsIEIsIG9y
LCBDLCBvcjwvZm9udD48L3R0Pjxicj48YnI+PHR0Pjxmb250IHNpemU9IjIiPllvdXIgcGxhbiBC
IG9ubHkgcmVxdWlyZXMgMyBUUE0gY29tbWFuZHMuICZuYnNwO0kuZS4sIGl0IGxvb2tzPC9mb250
PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5tb3JlIGNvbXBsaWNhdGVkIGJ1dCBpdCB3aWxs
IHBlcmZvcm0gYmV0dGVyLjxicj48YnI+Jmd0OyBGcm9tOiBuYXJjaXMyMDA0QHlhaG9vLmNvbTwv
Zm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+Jmd0OyBUbzogdHBtMkBsaXN0cy4wMS5v
cmc8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPiZndDsgRGF0ZTogMDIvMTcvMjAy
MSAwMzozNiBQTTwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+Jmd0OyBTdWJqZWN0
OiBbRVhURVJOQUxdIFt0cG0yXSBwb2xpY2llcyBpbiBjb25qdW5jdGl2ZSBub3JtYWwgZm9ybTwv
Zm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+Jmd0OyA8YnI+Jmd0OyBRdWVzdGlvbjog
aXMgaXQgcG9zc2libGUgdG8gc3RydWN0dXJlIGEgcG9saWN5IHVzaW5nIHRwbTItdG9vbHMgaW4g
PGJyPiZndDsgdGhlIGZvbGxvd2luZyBmb3JtPzxicj4mZ3Q7ICZuYnNwOyBwb2xpY3kgPSAoYSBP
UiBiKSBBTkQgKGMgT1IgZCk8YnI+Jmd0OyAmbmJzcDsgLSB3aGVyZSBhLCBiLCBjLCBkIGFyZSBz
aW1wbGUgcGNyIHBvbGljaWVzLjxicj4mZ3Q7IDxicj4mZ3Q7IEkgdHJpZWQgdGhpcywgYW5kIGFw
cGFyZW50bHkgY3JlYXRpbmcgYW4gKkFORCogb2YgcG9saWN5ICpPUiogZGlkIDxicj4mZ3Q7IG5v
dCB3b3JrIGFzIGkgdGhvdWdodC4gJnF1b3Q7YW5kLnBvbGljeSZxdW90OyB3aWxsIGNvbnRhaW4g
dGhlIGhhc2ggb2YgdGhlIDxicj4mZ3Q7IHNlY29uZCB0cG0yX3BvbGljeW9yIGluc3RlYWQgb2Yg
Z2VuZXJhdGluZyBhIG5ldyBoYXNoPGJyPiZndDsgJm5ic3A7IHRwbTJfc3RhcnRhdXRoc2Vzc2lv
biAtLXNlc3Npb24gc2Vzc2lvbi5jdHg8YnI+Jmd0OyAmbmJzcDsgdHBtMl9wb2xpY3lvciAtLXNl
c3Npb24gc2Vzc2lvbi5jdHggc2hhMjU2OmEucG9saWN5LGIucG9saWN5PGJyPiZndDsgJm5ic3A7
IHRwbTJfcG9saWN5b3IgLS1zZXNzaW9uIHNlc3Npb24uY3R4IHNoYTI1NjpjLnBvbGljeSxkLnBv
bGljeSAtLTxicj4mZ3Q7IHBvbGljeSBhbmQucG9saWN5PGJyPiZndDsgJm5ic3A7IHRwbTJfZmx1
c2hjb250ZXh0IHNlc3Npb24uY3R4PGJyPiZndDsgPGJyPiZndDsgPGJyPiZndDsgUGxhbiBCIHdv
dWxkIGJlIHRvIHN0cnVjdHVyZSB0aGUgcG9saWN5IGluIHRoZSBlcXVpdmFsZW50IDxicj4mZ3Q7
IGRpc2p1bmN0aXZlIG5vcm1hbCBmb3JtLCB3aGljaCB3b3JrcyBidXQgaXMgbGVzcyBzY2FsYWJs
ZS4gaS5lLjo8YnI+Jmd0OyAmbmJzcDsgcG9saWN5ID0gKGEgQU5EIGMpIE9SIChhIEFORCBkKSBP
UiAoYiBBTkQgYykgT1IgKGIgQU5EIGQpPGJyPiZndDsgPGJyPiZndDsgVGhhbmtzLDxicj4mZ3Q7
IE5hcmNpczxicj4mZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fPGJyPiZndDsgdHBtMiBtYWlsaW5nIGxpc3QgLS0gdHBtMkBsaXN0cy4wMS5vcmc8YnI+
Jmd0OyBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIHRwbTItbGVhdmVAbGlzdHMuMDEu
b3JnPGJyPiZndDsgJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5h
bF9uYW1lKXM8YnI+Jmd0OyA8YnI+PC9mb250PjwvdHQ+PEJSPgo8L2JvZHk+PC9odG1sPgo=

--===============3426854586672386912==--

