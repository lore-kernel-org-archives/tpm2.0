Content-Type: multipart/mixed; boundary="===============5926431120715174719=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] Re: how unique are primary keys ?
Date: Mon, 08 Jun 2020 14:28:13 -0700
Message-ID: <417bc43c-1aec-cb58-08b7-394333299dec@oracle.com>
In-Reply-To: SN6PR11MB3437DB5C94E6F8B873F3BD8CB8850@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5926431120715174719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

William,

Thanks for filing the issue.


  https://github.com/tpm2-software/tpm2-tools/issues/2091


  unique data format is binary, make it easier to format

-ted

On 6/8/20 7:42 AM, Roberts, William C wrote:
>
>> -----Original Message-----
>> From: ted.h.kim(a)oracle.com <ted.h.kim(a)oracle.com>
>> Sent: Thursday, June 4, 2020 6:47 PM
>> To: tpm2(a)lists.01.org
>> Subject: [tpm2] how unique are primary keys ?
>>
>> Folks,
>>
>> How unique are primary keys ?
>>
>> As an example:
>>
>> $ tpm2_createprimary -Q -C o -c prim1.ctx $ tpm2_createprimary -Q -C o -c
>> prim2.ctx $ tpm2_createprimary -Q -C o -u /dev/random -c prim3.ctx $
>> tpm2_readpublic -c prim1.ctx > prim1.rp $ tpm2_readpublic -c prim2.ctx >
>> prim2.rp $ tpm2_readpublic -c prim3.ctx > prim3.rp $ diff prim1.rp prim2=
.rp $ diff
>> prim1.rp prim3.rp $
> You got that to work? The -u data needs to be formatted as a binary TPMU_=
PUBLIC_ID
> Union (which is utterly terrible).
>
> See:
> - https://urldefense.com/v3/__https://github.com/tpm2-software/tpm2-tools=
/commit/6c9377faf056b6700e19ceaa11fb6425342daa49__;!!GqivPVa7Brio!IluyUE7Di=
EgqTu52mNKQK6d9yC8GLdNlqkoNuiIfqCA2Rto35JQOUk20ShsnGZs$
> - https://urldefense.com/v3/__https://github.com/tpm2-software/tpm2-tools=
/blob/master/lib/tpm2_alg_util.c*L957__;Iw!!GqivPVa7Brio!IluyUE7DiEgqTu52mN=
KQK6d9yC8GLdNlqkoNuiIfqCA2Rto35JQOUk20FR6bGKI$
>
> I filed a bug against the project for this unique data format.
>
> I tried getting it to work, briefly and failed. I'm not even sure if this=
 feature works, especially without tests
> around it.
>
>> Is it supposed to be like this?
>> Shouldn't they be different in some way?
>> For prim3, I thought putting some -u data would make a difference, but i=
t seems
>> not.
>>
>> FWIW, I am using 4.1 branch of tpm2-tools with swtpm.
>>
>> Thanks,
>> -ted
>>
>> --
>> Ted H. Kim, PhD
>> ted.h.kim(a)oracle.com
>> +1 310-258-7515
>>
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515



--===============5926431120715174719==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5PgogICAgPHA+
V2lsbGlhbSw8YnI+CiAgICA8L3A+CiAgICA8cD5UaGFua3MgZm9yIGZpbGluZyB0aGUgaXNzdWUu
PC9wPgogICAgPGgxIGNsYXNzPSJnaC1oZWFkZXItdGl0bGUgZjEgbXItMCBmbGV4LWF1dG8gYnJl
YWstd29yZCI+PGZvbnQKICAgICAgICBzaXplPSItMSI+PHNwYW4gY2xhc3M9ImpzLWlzc3VlLXRp
dGxlIj48YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dpdGh1
Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2lzc3Vlcy8yMDkxIj5odHRwczovL2dpdGh1
Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2lzc3Vlcy8yMDkxPC9hPjwvc3Bhbj48L2Zv
bnQ+PC9oMT4KICAgIDxoMSBjbGFzcz0iZ2gtaGVhZGVyLXRpdGxlIGYxIG1yLTAgZmxleC1hdXRv
IGJyZWFrLXdvcmQiPjxmb250CiAgICAgICAgc2l6ZT0iLTEiPjxzcGFuIGNsYXNzPSJqcy1pc3N1
ZS10aXRsZSI+dW5pcXVlIGRhdGEgZm9ybWF0IGlzCiAgICAgICAgICBiaW5hcnksIG1ha2UgaXQg
ZWFzaWVyIHRvIGZvcm1hdCA8YnI+CiAgICAgICAgICA8YnI+CiAgICAgICAgPC9zcGFuPjwvZm9u
dD48c3BhbiBjbGFzcz0iZ2gtaGVhZGVyLW51bWJlciI+PC9zcGFuPjwvaDE+CiAgICA8ZGl2IGNs
YXNzPSJtb3otY2l0ZS1wcmVmaXgiPi10ZWQ8L2Rpdj4KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRl
LXByZWZpeCI+PGJyPgogICAgPC9kaXY+CiAgICA8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgi
Pk9uIDYvOC8yMCA3OjQyIEFNLCBSb2JlcnRzLCBXaWxsaWFtIEMKICAgICAgd3JvdGU6PGJyPgog
ICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgpjaXRlPSJtaWQ6U042UFIxMU1C
MzQzN0RCNUM5NEU2RjhCODczRjNCRDhDQjg4NTBAU042UFIxMU1CMzQzNy5uYW1wcmQxMS5wcm9k
Lm91dGxvb2suY29tIj4KICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4K
CjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICA8cHJlIGNsYXNz
PSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzp0ZWQuaC5r
aW1Ab3JhY2xlLmNvbSI+dGVkLmgua2ltQG9yYWNsZS5jb208L2E+IDxhIGNsYXNzPSJtb3otdHh0
LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzp0ZWQuaC5raW1Ab3JhY2xlLmNvbSI+Jmx0O3Rl
ZC5oLmtpbUBvcmFjbGUuY29tJmd0OzwvYT4KU2VudDogVGh1cnNkYXksIEp1bmUgNCwgMjAyMCA2
OjQ3IFBNClRvOiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWls
dG86dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEub3JnPC9hPgpTdWJqZWN0OiBbdHBt
Ml0gaG93IHVuaXF1ZSBhcmUgcHJpbWFyeSBrZXlzID8KCkZvbGtzLAoKSG93IHVuaXF1ZSBhcmUg
cHJpbWFyeSBrZXlzID8KCkFzIGFuIGV4YW1wbGU6CgokIHRwbTJfY3JlYXRlcHJpbWFyeSAtUSAt
QyBvIC1jIHByaW0xLmN0eCAkIHRwbTJfY3JlYXRlcHJpbWFyeSAtUSAtQyBvIC1jCnByaW0yLmN0
eCAkIHRwbTJfY3JlYXRlcHJpbWFyeSAtUSAtQyBvIC11IC9kZXYvcmFuZG9tIC1jIHByaW0zLmN0
eCAkCnRwbTJfcmVhZHB1YmxpYyAtYyBwcmltMS5jdHggJmd0OyBwcmltMS5ycCAkIHRwbTJfcmVh
ZHB1YmxpYyAtYyBwcmltMi5jdHggJmd0OwpwcmltMi5ycCAkIHRwbTJfcmVhZHB1YmxpYyAtYyBw
cmltMy5jdHggJmd0OyBwcmltMy5ycCAkIGRpZmYgcHJpbTEucnAgcHJpbTIucnAgJCBkaWZmCnBy
aW0xLnJwIHByaW0zLnJwICQKPC9wcmU+CiAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgPHByZSBj
bGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4KWW91IGdvdCB0aGF0IHRvIHdvcms/IFRoZSAt
dSBkYXRhIG5lZWRzIHRvIGJlIGZvcm1hdHRlZCBhcyBhIGJpbmFyeSBUUE1VX1BVQkxJQ19JRApV
bmlvbiAod2hpY2ggaXMgdXR0ZXJseSB0ZXJyaWJsZSkuCgpTZWU6Ci0gPGEgY2xhc3M9Im1vei10
eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBz
Oi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvY29tbWl0LzZjOTM3N2ZhZjA1
NmI2NzAwZTE5Y2VhYTExZmI2NDI1MzQyZGFhNDlfXzshIUdxaXZQVmE3QnJpbyFJbHV5VUU3RGlF
Z3FUdTUybU5LUUs2ZDl5QzhHTGRObHFrb051aUlmcUNBMlJ0bzM1SlFPVWsyMFNoc25HWnMkIj5o
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdh
cmUvdHBtMi10b29scy9jb21taXQvNmM5Mzc3ZmFmMDU2YjY3MDBlMTljZWFhMTFmYjY0MjUzNDJk
YWE0OV9fOyEhR3FpdlBWYTdCcmlvIUlsdXlVRTdEaUVncVR1NTJtTktRSzZkOXlDOEdMZE5scWtv
TnVpSWZxQ0EyUnRvMzVKUU9VazIwU2hzbkdacyQ8L2E+IAotIDxhIGNsYXNzPSJtb3otdHh0LWxp
bmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dp
dGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2Jsb2IvbWFzdGVyL2xpYi90cG0yX2Fs
Z191dGlsLmMqTDk1N19fO0l3ISFHcWl2UFZhN0JyaW8hSWx1eVVFN0RpRWdxVHU1Mm1OS1FLNmQ5
eUM4R0xkTmxxa29OdWlJZnFDQTJSdG8zNUpRT1VrMjBGUjZiR0tJJCI+aHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMv
YmxvYi9tYXN0ZXIvbGliL3RwbTJfYWxnX3V0aWwuYypMOTU3X187SXchIUdxaXZQVmE3QnJpbyFJ
bHV5VUU3RGlFZ3FUdTUybU5LUUs2ZDl5QzhHTGRObHFrb051aUlmcUNBMlJ0bzM1SlFPVWsyMEZS
NmJHS0kkPC9hPiAKCkkgZmlsZWQgYSBidWcgYWdhaW5zdCB0aGUgcHJvamVjdCBmb3IgdGhpcyB1
bmlxdWUgZGF0YSBmb3JtYXQuCgpJIHRyaWVkIGdldHRpbmcgaXQgdG8gd29yaywgYnJpZWZseSBh
bmQgZmFpbGVkLiBJJ20gbm90IGV2ZW4gc3VyZSBpZiB0aGlzIGZlYXR1cmUgd29ya3MsIGVzcGVj
aWFsbHkgd2l0aG91dCB0ZXN0cwphcm91bmQgaXQuCgo8L3ByZT4KICAgICAgPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4K
SXMgaXQgc3VwcG9zZWQgdG8gYmUgbGlrZSB0aGlzPwpTaG91bGRuJ3QgdGhleSBiZSBkaWZmZXJl
bnQgaW4gc29tZSB3YXk/CkZvciBwcmltMywgSSB0aG91Z2h0IHB1dHRpbmcgc29tZSAtdSBkYXRh
IHdvdWxkIG1ha2UgYSBkaWZmZXJlbmNlLCBidXQgaXQgc2VlbXMKbm90LgoKRldJVywgSSBhbSB1
c2luZyA0LjEgYnJhbmNoIG9mIHRwbTItdG9vbHMgd2l0aCBzd3RwbS4KClRoYW5rcywKLXRlZAoK
LS0KVGVkIEguIEtpbSwgUGhECjxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhy
ZWY9Im1haWx0bzp0ZWQuaC5raW1Ab3JhY2xlLmNvbSI+dGVkLmgua2ltQG9yYWNsZS5jb208L2E+
CisxIDMxMC0yNTgtNzUxNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJy
ZXZpYXRlZCIgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0yQGxpc3RzLjAxLm9y
ZzwvYT4KVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciPnRw
bTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPgolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4
dClzLyUoX2ludGVybmFsX25hbWUpcwo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8
cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGNsYXNzPSJt
b3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+
dHBtMkBsaXN0cy4wMS5vcmc8L2E+ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEg
Y2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVA
bGlzdHMuMDEub3JnIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4KJSh3ZWJfcGFnZV91cmwp
c2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXMKPC9wcmU+CiAgICA8L2Jsb2Nr
cXVvdGU+CiAgICA8cHJlIGNsYXNzPSJtb3otc2lnbmF0dXJlIiBjb2xzPSI3MiI+LS0gClRlZCBI
LiBLaW0sIFBoRAo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWls
dG86dGVkLmgua2ltQG9yYWNsZS5jb20iPnRlZC5oLmtpbUBvcmFjbGUuY29tPC9hPgorMSAzMTAt
MjU4LTc1MTUKCgo8L3ByZT4KICA8L2JvZHk+CjwvaHRtbD4K

--===============5926431120715174719==--

