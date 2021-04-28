Content-Type: multipart/mixed; boundary="===============8386643052661855767=="
MIME-Version: 1.0
From: Ted Kim <ted.h.kim at oracle.com>
Subject: [tpm2] Re: [External] : AW: Re: get TPM applications to happily
 co-exist
Date: Wed, 28 Apr 2021 10:50:42 -0700
Message-ID: <9bea7d0d-caed-463f-e2c9-3d9c313e9922@oracle.com>
In-Reply-To: AM8P194MB167554BC54141CE6B6FD26B3A6409@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8386643052661855767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Andreas,

I certainly appreciate what the ABRMD or in-kernel resource manager =

does. But I think the MS TPM Base Services goes a bit further. Quoting =

something from a MS web page:

/Each context is only allowed to access virtual resources created =

specifically on its behalf, as well as the physical resources on the TPM =

that corresponds to those virtual resources. /

So for my situation, I am thinking if application A (using its own =

context) created some objects, application B (with a different context) =

would not even see them and would not be able to evict those persistent =

objects of the other application.

++++

Maybe in a VM environment maybe we could have multiple virtual TPMs (not =

just /dev/tpm0, but also /dev/tpm1 and tpm2, etc.) ? I suppose then each =

application could use it's own. However, I am not sure if the ABRMD or =

in-kernel resource manager would handle that (maybe also the =

virtualization SW won't do the right thing) ?

But of course in bare-metal, I am not aware any system which has more =

than one hardware TPM.


Thanks,
-ted

On 4/28/21 1:15 AM, Fuchs, Andreas wrote:
> The tpm2-abrmd as well as the in-kernel resource manager via /dev/tpmrm0 =
both perform isolation of "connections", i.e. each tss context (on all apis=
 TCTI, SYS; ESYS, FAPI) has an isolated view on the TPM.
>
> That even means if an application opens two ESYS context even they are is=
olated from each other.
> Helps a lot with large multi-module applications.
>
> ________________________________________
> Von: Ted Kim <ted.h.kim(a)oracle.com>
> Gesendet: Mittwoch, 28. April 2021 01:00
> An: tpm2(a)lists.01.org
> Betreff: [tpm2] Re: get TPM applications to happily co-exist
>
> So it looks like Microsoft has done something to keep TPM-using
> applications out of each others way for Windows in "TPM Base Services".
>
> Is someone doing something similar for Linux ?
> Is FAPI supposed to eventually do stuff like this ?
> Of course, I would rather use the accepted standard tool, instead of
> re-inventing the wheel.
>
> Thanks,
> -ted
>
> On 4/27/21 9:38 AM, Ted Kim wrote:
>> Folks,
>>
>> The question has come up about how to get TPM applications to happily
>> coexist with minimal coordination.
>>
>> One issue in the owner hierarchy is we want each application to to be
>> able to manage it's own objects but not affect those of the other
>> applications.
>>
>> So for example, we only want application A to be able to evict
>> persistent handles owned by that application and not those of another
>> application B.
>>
>> If I understand, tpm2_evictcontrol command, the authorization is on
>> the hierarchy and not on the object. Maybe I am thinking about this
>> wrong, but is there a way in the authorization to look at some
>> property of the object and tell who "owns" it and then figure out if
>> this should be allowed or not ?
>>
>> Otherwise, I think, we end up building some other software which knows
>> how to authorize this on the hierarchy and keeps track of who owns
>> what and then issues the eviction only when the owner of an object is
>> the requester.
>>
>> Am open to any suggestions.
>>
>> Thanks,
>> -ted
>>
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> --
> Ted H. Kim, PhD
> ted.h.kim(a)oracle.com
> +1 310-258-7515
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============8386643052661855767==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+CjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4
dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4KICA8L2hlYWQ+CiAgPGJvZHk+CiAgICA8cD5BbmRyZWFz
LDwvcD4KICAgIDxwPkkgY2VydGFpbmx5IGFwcHJlY2lhdGUgd2hhdCB0aGUgQUJSTUQgb3IgaW4t
a2VybmVsIHJlc291cmNlCiAgICAgIG1hbmFnZXIgZG9lcy4gQnV0IEkgdGhpbmsgdGhlIE1TIFRQ
TSBCYXNlIFNlcnZpY2VzIGdvZXMgYSBiaXQKICAgICAgZnVydGhlci4gUXVvdGluZyBzb21ldGhp
bmcgZnJvbSBhIE1TIHdlYiBwYWdlOjwvcD4KICAgIDxwPjxpPkVhY2ggY29udGV4dCBpcyBvbmx5
IGFsbG93ZWQgdG8gYWNjZXNzIHZpcnR1YWwgcmVzb3VyY2VzCiAgICAgICAgY3JlYXRlZCBzcGVj
aWZpY2FsbHkgb24gaXRzIGJlaGFsZiwgYXMgd2VsbCBhcyB0aGUgcGh5c2ljYWwKICAgICAgICBy
ZXNvdXJjZXMgb24gdGhlIFRQTSB0aGF0IGNvcnJlc3BvbmRzIHRvIHRob3NlIHZpcnR1YWwKICAg
ICAgICByZXNvdXJjZXMuIDwvaT48YnI+CiAgICA8L3A+CiAgICA8cD5TbyBmb3IgbXkgc2l0dWF0
aW9uLCBJIGFtIHRoaW5raW5nIGlmIGFwcGxpY2F0aW9uIEEgKHVzaW5nIGl0cwogICAgICBvd24g
Y29udGV4dCkgY3JlYXRlZCBzb21lIG9iamVjdHMsIGFwcGxpY2F0aW9uIEIgKHdpdGggYSBkaWZm
ZXJlbnQKICAgICAgY29udGV4dCkgd291bGQgbm90IGV2ZW4gc2VlIHRoZW0gYW5kIHdvdWxkIG5v
dCBiZSBhYmxlIHRvIGV2aWN0CiAgICAgIHRob3NlIHBlcnNpc3RlbnQgb2JqZWN0cyBvZiB0aGUg
b3RoZXIgYXBwbGljYXRpb24uIDxicj4KICAgIDwvcD4KICAgIDxwPisrKys8YnI+CiAgICA8L3A+
CiAgICA8cD5NYXliZSBpbiBhIFZNIGVudmlyb25tZW50IG1heWJlIHdlIGNvdWxkIGhhdmUgbXVs
dGlwbGUgdmlydHVhbAogICAgICBUUE1zIChub3QganVzdCAvZGV2L3RwbTAsIGJ1dCBhbHNvIC9k
ZXYvdHBtMSBhbmQgdHBtMiwgZXRjLikgPyBJCiAgICAgIHN1cHBvc2UgdGhlbiBlYWNoIGFwcGxp
Y2F0aW9uIGNvdWxkIHVzZSBpdCdzIG93bi4gSG93ZXZlciwgSSBhbQogICAgICBub3Qgc3VyZSBp
ZiB0aGUgQUJSTUQgb3IgaW4ta2VybmVsIHJlc291cmNlIG1hbmFnZXIgd291bGQgaGFuZGxlCiAg
ICAgIHRoYXQgKG1heWJlIGFsc28gdGhlIHZpcnR1YWxpemF0aW9uIFNXIHdvbid0IGRvIHRoZSBy
aWdodCB0aGluZykgPzwvcD4KICAgIDxwPkJ1dCBvZiBjb3Vyc2UgaW4gYmFyZS1tZXRhbCwgSSBh
bSBub3QgYXdhcmUgYW55IHN5c3RlbSB3aGljaCBoYXMKICAgICAgbW9yZSB0aGFuIG9uZSBoYXJk
d2FyZSBUUE0uPGJyPgogICAgPC9wPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPHA+VGhhbmtz
LDxicj4KICAgICAgLXRlZDxicj4KICAgIDwvcD4KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRlLXBy
ZWZpeCI+T24gNC8yOC8yMSAxOjE1IEFNLCBGdWNocywgQW5kcmVhcwogICAgICB3cm90ZTo8YnI+
CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpBTThQMTk0
TUIxNjc1NTRCQzU0MTQxQ0U2QjZGRDI2QjNBNjQwOUBBTThQMTk0TUIxNjc1LkVVUlAxOTQuUFJP
RC5PVVRMT09LLkNPTSI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+
VGhlIHRwbTItYWJybWQgYXMgd2VsbCBhcyB0aGUgaW4ta2VybmVsIHJlc291cmNlIG1hbmFnZXIg
dmlhIC9kZXYvdHBtcm0wIGJvdGggcGVyZm9ybSBpc29sYXRpb24gb2YgJnF1b3Q7Y29ubmVjdGlv
bnMmcXVvdDssIGkuZS4gZWFjaCB0c3MgY29udGV4dCAob24gYWxsIGFwaXMgVENUSSwgU1lTOyBF
U1lTLCBGQVBJKSBoYXMgYW4gaXNvbGF0ZWQgdmlldyBvbiB0aGUgVFBNLgoKVGhhdCBldmVuIG1l
YW5zIGlmIGFuIGFwcGxpY2F0aW9uIG9wZW5zIHR3byBFU1lTIGNvbnRleHQgZXZlbiB0aGV5IGFy
ZSBpc29sYXRlZCBmcm9tIGVhY2ggb3RoZXIuCkhlbHBzIGEgbG90IHdpdGggbGFyZ2UgbXVsdGkt
bW9kdWxlIGFwcGxpY2F0aW9ucy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVm9uOiBUZWQgS2ltIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Im1haWx0bzp0ZWQuaC5raW1Ab3JhY2xlLmNvbSI+Jmx0O3RlZC5oLmtpbUBvcmFjbGUuY29tJmd0
OzwvYT4KR2VzZW5kZXQ6IE1pdHR3b2NoLCAyOC4gQXByaWwgMjAyMSAwMTowMApBbjogPGEgY2xh
c3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4KQmV0cmVmZjogW3RwbTJdIFJlOiBnZXQgVFBNIGFw
cGxpY2F0aW9ucyB0byBoYXBwaWx5IGNvLWV4aXN0CgpTbyBpdCBsb29rcyBsaWtlIE1pY3Jvc29m
dCBoYXMgZG9uZSBzb21ldGhpbmcgdG8ga2VlcCBUUE0tdXNpbmcKYXBwbGljYXRpb25zIG91dCBv
ZiBlYWNoIG90aGVycyB3YXkgZm9yIFdpbmRvd3MgaW4gJnF1b3Q7VFBNIEJhc2UgU2VydmljZXMm
cXVvdDsuCgpJcyBzb21lb25lIGRvaW5nIHNvbWV0aGluZyBzaW1pbGFyIGZvciBMaW51eCA/Cklz
IEZBUEkgc3VwcG9zZWQgdG8gZXZlbnR1YWxseSBkbyBzdHVmZiBsaWtlIHRoaXMgPwpPZiBjb3Vy
c2UsIEkgd291bGQgcmF0aGVyIHVzZSB0aGUgYWNjZXB0ZWQgc3RhbmRhcmQgdG9vbCwgaW5zdGVh
ZCBvZgpyZS1pbnZlbnRpbmcgdGhlIHdoZWVsLgoKVGhhbmtzLAotdGVkCgpPbiA0LzI3LzIxIDk6
MzggQU0sIFRlZCBLaW0gd3JvdGU6CjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRl
Ij4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPkZvbGtzLAoKVGhl
IHF1ZXN0aW9uIGhhcyBjb21lIHVwIGFib3V0IGhvdyB0byBnZXQgVFBNIGFwcGxpY2F0aW9ucyB0
byBoYXBwaWx5CmNvZXhpc3Qgd2l0aCBtaW5pbWFsIGNvb3JkaW5hdGlvbi4KCk9uZSBpc3N1ZSBp
biB0aGUgb3duZXIgaGllcmFyY2h5IGlzIHdlIHdhbnQgZWFjaCBhcHBsaWNhdGlvbiB0byB0byBi
ZQphYmxlIHRvIG1hbmFnZSBpdCdzIG93biBvYmplY3RzIGJ1dCBub3QgYWZmZWN0IHRob3NlIG9m
IHRoZSBvdGhlcgphcHBsaWNhdGlvbnMuCgpTbyBmb3IgZXhhbXBsZSwgd2Ugb25seSB3YW50IGFw
cGxpY2F0aW9uIEEgdG8gYmUgYWJsZSB0byBldmljdApwZXJzaXN0ZW50IGhhbmRsZXMgb3duZWQg
YnkgdGhhdCBhcHBsaWNhdGlvbiBhbmQgbm90IHRob3NlIG9mIGFub3RoZXIKYXBwbGljYXRpb24g
Qi4KCklmIEkgdW5kZXJzdGFuZCwgdHBtMl9ldmljdGNvbnRyb2wgY29tbWFuZCwgdGhlIGF1dGhv
cml6YXRpb24gaXMgb24KdGhlIGhpZXJhcmNoeSBhbmQgbm90IG9uIHRoZSBvYmplY3QuIE1heWJl
IEkgYW0gdGhpbmtpbmcgYWJvdXQgdGhpcwp3cm9uZywgYnV0IGlzIHRoZXJlIGEgd2F5IGluIHRo
ZSBhdXRob3JpemF0aW9uIHRvIGxvb2sgYXQgc29tZQpwcm9wZXJ0eSBvZiB0aGUgb2JqZWN0IGFu
ZCB0ZWxsIHdobyAmcXVvdDtvd25zJnF1b3Q7IGl0IGFuZCB0aGVuIGZpZ3VyZSBvdXQgaWYKdGhp
cyBzaG91bGQgYmUgYWxsb3dlZCBvciBub3QgPwoKT3RoZXJ3aXNlLCBJIHRoaW5rLCB3ZSBlbmQg
dXAgYnVpbGRpbmcgc29tZSBvdGhlciBzb2Z0d2FyZSB3aGljaCBrbm93cwpob3cgdG8gYXV0aG9y
aXplIHRoaXMgb24gdGhlIGhpZXJhcmNoeSBhbmQga2VlcHMgdHJhY2sgb2Ygd2hvIG93bnMKd2hh
dCBhbmQgdGhlbiBpc3N1ZXMgdGhlIGV2aWN0aW9uIG9ubHkgd2hlbiB0aGUgb3duZXIgb2YgYW4g
b2JqZWN0IGlzCnRoZSByZXF1ZXN0ZXIuCgpBbSBvcGVuIHRvIGFueSBzdWdnZXN0aW9ucy4KClRo
YW5rcywKLXRlZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRl
ZCIgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4K
VG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFi
YnJldmlhdGVkIiBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciPnRwbTItbGVh
dmVAbGlzdHMuMDEub3JnPC9hPgolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUo
X2ludGVybmFsX25hbWUpcwo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8cHJlIGNs
YXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgotLQpUZWQgSC4gS2ltLCBQaEQKPGEgY2xhc3M9
Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRvOnRlZC5oLmtpbUBvcmFjbGUu
Y29tIj50ZWQuaC5raW1Ab3JhY2xlLmNvbTwvYT4KKzEgMzEwLTI1OC03NTE1Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCnRwbTIgbWFpbGluZyBsaXN0IC0t
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzp0cG0yQGxp
c3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4g
ZW1haWwgdG8gPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRv
OnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4KJSh3
ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXMKPC9wcmU+
CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8cHJlIGNsYXNzPSJtb3otc2lnbmF0dXJlIiBjb2xzPSI3
MiI+LS0gClRlZCBILiBLaW0sIFBoRAo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVk
IiBocmVmPSJtYWlsdG86dGVkLmgua2ltQG9yYWNsZS5jb20iPnRlZC5oLmtpbUBvcmFjbGUuY29t
PC9hPgorMSAzMTAtMjU4LTc1MTU8L3ByZT4KICA8L2JvZHk+CjwvaHRtbD4K

--===============8386643052661855767==--

