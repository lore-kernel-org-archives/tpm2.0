Content-Type: multipart/mixed; boundary="===============5009970110849583914=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: get TPM applications to happily co-exist
Date: Tue, 27 Apr 2021 16:10:33 -0400
Message-ID: <OFBF7BFDC5.2C56D558-ON002586C4.006DFFEC-852586C4.006ED491@notes.na.collabserv.com>
In-Reply-To: 20aa5df0-e69a-46eb-975a-76b7ba7db298@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5009970110849583914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Just my opinion:

The TPM has very few persistent key slots.  They are typically reserved
for early boot when there is no other persistent storage.  Unless you have
a restricted application, like an appliance, try not to use persistent
keys because they may not be available.

Typically, keep your application's key on disk, load it when you need
it, and flush it when you're done or your application exits.

~~

Your understanding is correct - persistent keys are created by the owner,
a higher privileged role that will manage the few (perhaps 7 or less)
key slots.

There are probably complex schemes, forget the owner auth and use
an owner policy specific to each key.  But, unless you have an
appliance / embedded application, you don't control that.

> From: Ted Kim <ted.h.kim(a)oracle.com>
> To: tpm2(a)lists.01.org
> Date: 04/27/2021 12:38 PM
> Subject: [EXTERNAL] [tpm2] get TPM applications to happily co-exist
>
> Folks,
>
> The question has come up about how to get TPM applications to happily
> coexist with minimal coordination.
>
> One issue in the owner hierarchy is we want each application to to be
> able to manage it's own objects but not affect those of the other
> applications.
>
> So for example, we only want application A to be able to evict
> persistent handles owned by that application and not those of another
> application B.
>
> If I understand, tpm2_evictcontrol command, the authorization is on the
> hierarchy and not on the object. Maybe I am thinking about this wrong,
> but is there a way in the authorization to look at some property of the
> object and tell who "owns" it and then figure out if this should be
> allowed or not ?
>
> Otherwise, I think, we end up building some other software which knows
> how to authorize this on the hierarchy and keeps track of who owns what
> and then issues the eviction only when the owner of an object is the
> requester.
>
> Am open to any suggestions.
>
> Thanks,
> -ted
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============5009970110849583914==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PHR0Pjxmb250IHNpemU9IjIiPkp1c3QgbXkgb3Bpbmlvbjo8L2ZvbnQ+
PC90dD48YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5UaGUgVFBNIGhhcyB2ZXJ5IGZldyBwZXJz
aXN0ZW50IGtleSBzbG90cy4gJm5ic3A7VGhleSBhcmUgdHlwaWNhbGx5IHJlc2VydmVkPC9mb250
PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5mb3IgZWFybHkgYm9vdCB3aGVuIHRoZXJlIGlz
IG5vIG90aGVyIHBlcnNpc3RlbnQgc3RvcmFnZS4gJm5ic3A7VW5sZXNzIHlvdSBoYXZlPC9mb250
PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5hIHJlc3RyaWN0ZWQgYXBwbGljYXRpb24sIGxp
a2UgYW4gYXBwbGlhbmNlLCB0cnkgbm90IHRvIHVzZSBwZXJzaXN0ZW50PC9mb250PjwvdHQ+PGJy
Pjx0dD48Zm9udCBzaXplPSIyIj5rZXlzIGJlY2F1c2UgdGhleSBtYXkgbm90IGJlIGF2YWlsYWJs
ZS48L2ZvbnQ+PC90dD48YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5UeXBpY2FsbHksIGtlZXAg
eW91ciBhcHBsaWNhdGlvbidzIGtleSBvbiBkaXNrLCBsb2FkIGl0IHdoZW4geW91IG5lZWQ8L2Zv
bnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPml0LCBhbmQgZmx1c2ggaXQgd2hlbiB5b3Un
cmUgZG9uZSBvciB5b3VyIGFwcGxpY2F0aW9uIGV4aXRzLjwvZm9udD48L3R0Pjxicj48YnI+PHR0
Pjxmb250IHNpemU9IjIiPn5+PC9mb250PjwvdHQ+PGJyPjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+
WW91ciB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QgLSBwZXJzaXN0ZW50IGtleXMgYXJlIGNyZWF0
ZWQgYnkgdGhlIG93bmVyLDwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+YSBoaWdo
ZXIgcHJpdmlsZWdlZCByb2xlIHRoYXQgd2lsbCBtYW5hZ2UgdGhlIGZldyAocGVyaGFwcyA3IG9y
IGxlc3MpPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5rZXkgc2xvdHMuPC9mb250
PjwvdHQ+PGJyPjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+VGhlcmUgYXJlIHByb2JhYmx5IGNvbXBs
ZXggc2NoZW1lcywgZm9yZ2V0IHRoZSBvd25lciBhdXRoIGFuZCB1c2U8L2ZvbnQ+PC90dD48YnI+
PHR0Pjxmb250IHNpemU9IjIiPmFuIG93bmVyIHBvbGljeSBzcGVjaWZpYyB0byBlYWNoIGtleS4g
Jm5ic3A7QnV0LCB1bmxlc3MgeW91IGhhdmUgYW48L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNp
emU9IjIiPmFwcGxpYW5jZSAvIGVtYmVkZGVkIGFwcGxpY2F0aW9uLCB5b3UgZG9uJ3QgY29udHJv
bCB0aGF0Ljxicj48YnI+Jmd0OyBGcm9tOiBUZWQgS2ltICZsdDt0ZWQuaC5raW1Ab3JhY2xlLmNv
bSZndDs8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPiZndDsgVG86IHRwbTJAbGlz
dHMuMDEub3JnPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4mZ3Q7IERhdGU6IDA0
LzI3LzIwMjEgMTI6MzggUE08L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPiZndDsg
U3ViamVjdDogW0VYVEVSTkFMXSBbdHBtMl0gZ2V0IFRQTSBhcHBsaWNhdGlvbnMgdG8gaGFwcGls
eSBjby1leGlzdDwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+Jmd0OyA8YnI+Jmd0
OyBGb2xrcyw8YnI+Jmd0OyA8YnI+Jmd0OyBUaGUgcXVlc3Rpb24gaGFzIGNvbWUgdXAgYWJvdXQg
aG93IHRvIGdldCBUUE0gYXBwbGljYXRpb25zIHRvIGhhcHBpbHkgPGJyPiZndDsgY29leGlzdCB3
aXRoIG1pbmltYWwgY29vcmRpbmF0aW9uLjxicj4mZ3Q7IDxicj4mZ3Q7IE9uZSBpc3N1ZSBpbiB0
aGUgb3duZXIgaGllcmFyY2h5IGlzIHdlIHdhbnQgZWFjaCBhcHBsaWNhdGlvbiB0byB0byBiZSA8
YnI+Jmd0OyBhYmxlIHRvIG1hbmFnZSBpdCdzIG93biBvYmplY3RzIGJ1dCBub3QgYWZmZWN0IHRo
b3NlIG9mIHRoZSBvdGhlciA8YnI+Jmd0OyBhcHBsaWNhdGlvbnMuPGJyPiZndDsgPGJyPiZndDsg
U28gZm9yIGV4YW1wbGUsIHdlIG9ubHkgd2FudCBhcHBsaWNhdGlvbiBBIHRvIGJlIGFibGUgdG8g
ZXZpY3QgPGJyPiZndDsgcGVyc2lzdGVudCBoYW5kbGVzIG93bmVkIGJ5IHRoYXQgYXBwbGljYXRp
b24gYW5kIG5vdCB0aG9zZSBvZiBhbm90aGVyIDxicj4mZ3Q7IGFwcGxpY2F0aW9uIEIuPGJyPiZn
dDsgPGJyPiZndDsgSWYgSSB1bmRlcnN0YW5kLCB0cG0yX2V2aWN0Y29udHJvbCBjb21tYW5kLCB0
aGUgYXV0aG9yaXphdGlvbiBpcyBvbiB0aGUgPGJyPiZndDsgaGllcmFyY2h5IGFuZCBub3Qgb24g
dGhlIG9iamVjdC4gTWF5YmUgSSBhbSB0aGlua2luZyBhYm91dCB0aGlzIHdyb25nLCA8YnI+Jmd0
OyBidXQgaXMgdGhlcmUgYSB3YXkgaW4gdGhlIGF1dGhvcml6YXRpb24gdG8gbG9vayBhdCBzb21l
IHByb3BlcnR5IG9mIHRoZSA8YnI+Jmd0OyBvYmplY3QgYW5kIHRlbGwgd2hvICZxdW90O293bnMm
cXVvdDsgaXQgYW5kIHRoZW4gZmlndXJlIG91dCBpZiB0aGlzIHNob3VsZCBiZSA8YnI+Jmd0OyBh
bGxvd2VkIG9yIG5vdCA/PGJyPiZndDsgPGJyPiZndDsgT3RoZXJ3aXNlLCBJIHRoaW5rLCB3ZSBl
bmQgdXAgYnVpbGRpbmcgc29tZSBvdGhlciBzb2Z0d2FyZSB3aGljaCBrbm93cyA8YnI+Jmd0OyBo
b3cgdG8gYXV0aG9yaXplIHRoaXMgb24gdGhlIGhpZXJhcmNoeSBhbmQga2VlcHMgdHJhY2sgb2Yg
d2hvIG93bnMgd2hhdCA8YnI+Jmd0OyBhbmQgdGhlbiBpc3N1ZXMgdGhlIGV2aWN0aW9uIG9ubHkg
d2hlbiB0aGUgb3duZXIgb2YgYW4gb2JqZWN0IGlzIHRoZSA8YnI+Jmd0OyByZXF1ZXN0ZXIuPGJy
PiZndDsgPGJyPiZndDsgQW0gb3BlbiB0byBhbnkgc3VnZ2VzdGlvbnMuPGJyPiZndDsgPGJyPiZn
dDsgVGhhbmtzLDxicj4mZ3Q7IC10ZWQ8YnI+Jmd0OyA8YnI+Jmd0OyBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4mZ3Q7IHRwbTIgbWFpbGluZyBsaXN0
IC0tIHRwbTJAbGlzdHMuMDEub3JnPGJyPiZndDsgVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFp
bCB0byB0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzxicj4mZ3Q7ICUod2ViX3BhZ2VfdXJsKXNsaXN0
aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPGJyPiZndDsgPGJyPjwvZm9udD48L3R0
PjxCUj4KPC9ib2R5PjwvaHRtbD4K

--===============5009970110849583914==--

