Content-Type: multipart/mixed; boundary="===============0006519979872042619=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Re: Approaching 100 hours of troubleshooting
Date: Mon, 25 Nov 2019 09:39:30 +0000
Message-ID: <CALtZhhOCa=MTpmrAqe+qvDWMFFrP+SWvHXwnh2d4pmE5hDfmAw@mail.gmail.com>
In-Reply-To: A3DEEEBB19900C48B49572CB9C2891C987A25C89@SHSMSX108.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0006519979872042619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When I try to run the test script "encryptdecrypt.sh", I get the following
output:

WARN: Command EncryptDecrypt is not supported by your device,
skipping...

Anyone got any idea what would cause this?


On Sun, Nov 24, 2019 at 3:11 PM Zhu, Bing <bing.zhu(a)intel.com> wrote:

> >>> I see one about fTPM but I'm not sure what it does.
>
> Firmware-based TPM, google Intel Platform Trust Technology (PTT) to know
> more details.
>
>
>
> *From:* Frederick Gotham <cauldwell.thomas(a)gmail.com>
> *Sent:* Sunday, November 24, 2019 02:07 AM
> *To:* tpm2(a)lists.01.org
> *Subject:* [tpm2] Approaching 100 hours of troubleshooting
>
>
>
> Hi
>
>
>
> I'm trying to get the TPM2 working in embedded Linux, and I've been
> troubleshooting for nearly two weeks now.
>
>
>
> I thought it would be a good idea to get the latest releases of the
> following packages:
>
>
>
>     tpm2-tss
>
>     tpm2-tools
>
>     tpm2-tss-engine
>
>
>
> And also the latest commit of: tpm2-pkcs11
>
>
>
> All I have succeeded in doing so far is getting random numbers from the
> TPM2 chip. I haven't be able to store (or retrieve) keys, nor have I been
> able to encrypt or decrypt data.
>
>
>
> The first problem I'm having is that the command line options for the
> tools (and also scripts) have been changed several times. Every time I try
> to follow an example I find on the web, I get "unrecognised option -C".
>
>
>
> In order to try follow examples I find online, I have repeatedly upgraded
> and downgraded my versions of the packages, sometimes even mixing old too=
ls
> with new tools (sometimes even rewinding to an historical commit in Github
> between official releases).
>
>
>
> Can someone please suggest what are the best stable versions of these
> packages for working with embedded Linux?
>
>
>
> Another thing:
>
> When my device boots up, I can go into the BIOS where I see a lot of
> options for Trusted Platform. I'm not exactly sure what these options
> actually do. Can someone advise me which settings in particular to watch
> out for? I see one about fTPM but I'm not sure what it does.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============0006519979872042619==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+V2hlbiBJIHRyeSB0byBydW4gdGhlIHRlc3Qgc2NyaXB0ICZxdW90O2Vu
Y3J5cHRkZWNyeXB0LnNoJnF1b3Q7LCBJIGdldCB0aGUgZm9sbG93aW5nIG91dHB1dDo8ZGl2Pjxi
cj48L2Rpdj48ZGl2PldBUk46IENvbW1hbmQgRW5jcnlwdERlY3J5cHQgaXMgbm90IHN1cHBvcnRl
ZCBieSB5b3VyIGRldmljZSwgwqAgwqAgc2tpcHBpbmcuLi48YnI+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5BbnlvbmUgZ290IGFueSBpZGVhIHdoYXQgd291bGQgY2F1c2UgdGhpcz88L2Rpdj48
ZGl2Pjxicj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGly
PSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBTdW4sIE5vdiAyNCwgMjAxOSBhdCAzOjExIFBN
IFpodSwgQmluZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmJpbmcuemh1QGludGVsLmNvbSI+YmluZy56
aHVAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDox
cHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KCgoKCgo8ZGl2IGxh
bmc9IkVOLVVTIj4KPGRpdiBjbGFzcz0iZ21haWwtbV8tMjc5NjEzNDIwNDIxOTk0NTEyOVdvcmRT
ZWN0aW9uMSI+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTom
cXVvdDtUcmVidWNoZXQgTVMmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjpibHVlIj4mZ3Q7Jmd0OyZn
dDsKPC9zcGFuPkkgc2VlIG9uZSBhYm91dCBmVFBNIGJ1dCBJJiMzOTttIG5vdCBzdXJlIHdoYXQg
aXQgZG9lcy48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7VHJlYnVjaGV0IE1TJnF1b3Q7
LHNhbnMtc2VyaWY7Y29sb3I6Ymx1ZSI+PHU+PC91Pjx1PjwvdT48L3NwYW4+PC9wPgo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7VHJlYnVjaGV0IE1T
JnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Ymx1ZSI+RmlybXdhcmUtYmFzZWQgVFBNLCBnb29nbGUg
SW50ZWwgUGxhdGZvcm0gVHJ1c3QgVGVjaG5vbG9neSAoUFRUKSB0byBrbm93IG1vcmUgZGV0YWls
cy48dT48L3U+PHU+PC91Pjwvc3Bhbj48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LWZhbWlseTomcXVvdDtUcmVidWNoZXQgTVMmcXVvdDssc2Fucy1zZXJpZjtjb2xv
cjpibHVlIj48dT48L3U+wqA8dT48L3U+PC9zcGFuPjwvcD4KPGRpdiBzdHlsZT0iYm9yZGVyLXRv
cDpub25lO2JvcmRlci1yaWdodDpub25lO2JvcmRlci1ib3R0b206bm9uZTtib3JkZXItbGVmdDox
LjVwdCBzb2xpZCBibHVlO3BhZGRpbmc6MGluIDBpbiAwaW4gNHB0Ij4KPGRpdj4KPGRpdiBzdHls
ZT0iYm9yZGVyLXJpZ2h0Om5vbmU7Ym9yZGVyLWJvdHRvbTpub25lO2JvcmRlci1sZWZ0Om5vbmU7
Ym9yZGVyLXRvcDoxcHQgc29saWQgcmdiKDIyNSwyMjUsMjI1KTtwYWRkaW5nOjNwdCAwaW4gMGlu
Ij4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGEgbmFtZT0ibV8tMjc5NjEzNDIwNDIxOTk0NTEyOV9f
X19fX3JlcGx5c2VwYXJhdG9yIj48L2E+PGI+RnJvbTo8L2I+IEZyZWRlcmljayBHb3RoYW0gJmx0
OzxhIGhyZWY9Im1haWx0bzpjYXVsZHdlbGwudGhvbWFzQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmNhdWxkd2VsbC50aG9tYXNAZ21haWwuY29tPC9hPiZndDsKPGJyPgo8Yj5TZW50OjwvYj4g
U3VuZGF5LCBOb3ZlbWJlciAyNCwgMjAxOSAwMjowNyBBTTxicj4KPGI+VG86PC9iPiA8YSBocmVm
PSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAx
Lm9yZzwvYT48YnI+CjxiPlN1YmplY3Q6PC9iPiBbdHBtMl0gQXBwcm9hY2hpbmcgMTAwIGhvdXJz
IG9mIHRyb3VibGVzaG9vdGluZzx1PjwvdT48dT48L3U+PC9wPgo8L2Rpdj4KPC9kaXY+CjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7CoDx1PjwvdT48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwi
PkhpPHU+PC91Pjx1PjwvdT48L3A+CjxkaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7C
oDx1PjwvdT48L3A+CjwvZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj5JJiMzOTttIHRy
eWluZyB0byBnZXQgdGhlIFRQTTIgd29ya2luZyBpbiBlbWJlZGRlZCBMaW51eCwgYW5kIEkmIzM5
O3ZlIGJlZW4gdHJvdWJsZXNob290aW5nIGZvciBuZWFybHkgdHdvIHdlZWtzIG5vdy48dT48L3U+
PHU+PC91PjwvcD4KPC9kaXY+CjxkaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7CoDx1
PjwvdT48L3A+CjwvZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj5JIHRob3VnaHQgaXQg
d291bGQgYmUgYSBnb29kIGlkZWEgdG8gZ2V0IHRoZSBsYXRlc3QgcmVsZWFzZXMgb2YgdGhlIGZv
bGxvd2luZyBwYWNrYWdlczo8dT48L3U+PHU+PC91PjwvcD4KPC9kaXY+CjxkaXY+CjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjx1PjwvdT7CoDx1PjwvdT48L3A+CjwvZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0i
TXNvTm9ybWFsIj7CoCDCoCB0cG0yLXRzczx1PjwvdT48dT48L3U+PC9wPgo8L2Rpdj4KPGRpdj4K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+wqAgwqAgdHBtMi10b29sczx1PjwvdT48dT48L3U+PC9wPgo8
L2Rpdj4KPGRpdj4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+wqAgwqAgdHBtMi10c3MtZW5naW5lPHU+
PC91Pjx1PjwvdT48L3A+CjwvZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48dT48L3U+
wqA8dT48L3U+PC9wPgo8L2Rpdj4KPGRpdj4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+QW5kIGFsc28g
dGhlIGxhdGVzdCBjb21taXQgb2Y6IHRwbTItcGtjczExPHU+PC91Pjx1PjwvdT48L3A+CjwvZGl2
Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48dT48L3U+wqA8dT48L3U+PC9wPgo8L2Rpdj4K
PGRpdj4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+QWxsIEkgaGF2ZSBzdWNjZWVkZWQgaW4gZG9pbmcg
c28gZmFyIGlzIGdldHRpbmcgcmFuZG9tIG51bWJlcnMgZnJvbSB0aGUgVFBNMiBjaGlwLiBJIGhh
dmVuJiMzOTt0IGJlIGFibGUgdG8gc3RvcmUgKG9yIHJldHJpZXZlKSBrZXlzLCBub3IgaGF2ZSBJ
IGJlZW4gYWJsZSB0byBlbmNyeXB0IG9yIGRlY3J5cHQgZGF0YS48dT48L3U+PHU+PC91PjwvcD4K
PC9kaXY+CjxkaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7CoDx1PjwvdT48L3A+Cjwv
ZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGUgZmlyc3QgcHJvYmxlbSBJJiMzOTtt
IGhhdmluZyBpcyB0aGF0IHRoZSBjb21tYW5kIGxpbmUgb3B0aW9ucyBmb3IgdGhlIHRvb2xzIChh
bmQgYWxzbyBzY3JpcHRzKSBoYXZlIGJlZW4gY2hhbmdlZCBzZXZlcmFsIHRpbWVzLiBFdmVyeSB0
aW1lIEkgdHJ5IHRvIGZvbGxvdyBhbiBleGFtcGxlIEkgZmluZCBvbiB0aGUgd2ViLCBJIGdldCAm
cXVvdDt1bnJlY29nbmlzZWQgb3B0aW9uIC1DJnF1b3Q7Ljx1PjwvdT48dT48L3U+PC9wPgo8L2Rp
dj4KPGRpdj4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHU+PC91PsKgPHU+PC91PjwvcD4KPC9kaXY+
CjxkaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPkluIG9yZGVyIHRvIHRyeSBmb2xsb3cgZXhhbXBs
ZXMgSSBmaW5kIG9ubGluZSwgSSBoYXZlIHJlcGVhdGVkbHkgdXBncmFkZWQgYW5kIGRvd25ncmFk
ZWQgbXkgdmVyc2lvbnMgb2YgdGhlIHBhY2thZ2VzLCBzb21ldGltZXMgZXZlbiBtaXhpbmcgb2xk
IHRvb2xzIHdpdGggbmV3IHRvb2xzIChzb21ldGltZXMgZXZlbiByZXdpbmRpbmcgdG8gYW4gaGlz
dG9yaWNhbCBjb21taXQgaW4gR2l0aHViIGJldHdlZW4gb2ZmaWNpYWwKIHJlbGVhc2VzKS48dT48
L3U+PHU+PC91PjwvcD4KPC9kaXY+CjxkaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7C
oDx1PjwvdT48L3A+CjwvZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj5DYW4gc29tZW9u
ZSBwbGVhc2Ugc3VnZ2VzdCB3aGF0IGFyZSB0aGUgYmVzdCBzdGFibGUgdmVyc2lvbnMgb2YgdGhl
c2UgcGFja2FnZXMgZm9yIHdvcmtpbmcgd2l0aCBlbWJlZGRlZCBMaW51eD88dT48L3U+PHU+PC91
PjwvcD4KPC9kaXY+CjxkaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7CoDx1PjwvdT48
L3A+CjwvZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Bbm90aGVyIHRoaW5nOjx1Pjwv
dT48dT48L3U+PC9wPgo8L2Rpdj4KPGRpdj4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+V2hlbiBteSBk
ZXZpY2UgYm9vdHMgdXAsIEkgY2FuIGdvIGludG8gdGhlIEJJT1Mgd2hlcmUgSSBzZWUgYSBsb3Qg
b2Ygb3B0aW9ucyBmb3IgVHJ1c3RlZCBQbGF0Zm9ybS4gSSYjMzk7bSBub3QgZXhhY3RseSBzdXJl
IHdoYXQgdGhlc2Ugb3B0aW9ucyBhY3R1YWxseSBkby4gQ2FuIHNvbWVvbmUgYWR2aXNlIG1lIHdo
aWNoIHNldHRpbmdzIGluIHBhcnRpY3VsYXIgdG8gd2F0Y2ggb3V0IGZvcj8gSSBzZWUgb25lIGFi
b3V0CiBmVFBNIGJ1dCBJJiMzOTttIG5vdCBzdXJlIHdoYXQgaXQgZG9lcy48dT48L3U+PHU+PC91
PjwvcD4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJl
Zj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+PGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1h
aWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVA
bGlzdHMuMDEub3JnPC9hPjxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8l
KF9pbnRlcm5hbF9uYW1lKXM8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============0006519979872042619==--

