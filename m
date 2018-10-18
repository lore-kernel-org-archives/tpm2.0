Content-Type: multipart/mixed; boundary="===============5795232848990149901=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: Re: [tpm2] does anyone compile tpm2-tss-2.1.0 successful on CentOS7?
Date: Thu, 18 Oct 2018 19:07:58 +0800
Message-ID: <CA+tBKVhcZPfdKj-O+_aZrjrr8FamukWRSqd7BdXW7Wt4rHd_uA@mail.gmail.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0147347A88@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5795232848990149901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks, I'll check it out.

On Thu, Oct 18, 2018 at 6:35 PM Fuchs, Andreas <
andreas.fuchs(a)sit.fraunhofer.de> wrote:

> tpm2-tss requires libgcrypt20 (at least that's was it's called on Ubuntu).
> libgcrypt (which is the 1.x branch) is quite old and had a different API
> than the 20 series...
>
> Maybe that's the problem...
> ------------------------------
> *From:* tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Terry An [
> terry.an.bj(a)gmail.com]
> *Sent:* Thursday, October 18, 2018 12:18
> *To:* tpm2(a)lists.01.org
> *Subject:* [tpm2] does anyone compile tpm2-tss-2.1.0 successful on
> CentOS7?
>
> lots of errors on my laptop.
>
> I have updated libgpg-error, libgcrypt-devel, etc..
>

--===============5795232848990149901==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzLCBJJiMzOTtsbCBjaGVjayBpdCBvdXQuwqA8YnI+PC9kaXY+
PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIj5PbiBUaHUsIE9jdCAx
OCwgMjAxOCBhdCA2OjM1IFBNIEZ1Y2hzLCBBbmRyZWFzICZsdDs8YSBocmVmPSJtYWlsdG86YW5k
cmVhcy5mdWNoc0BzaXQuZnJhdW5ob2Zlci5kZSI+YW5kcmVhcy5mdWNoc0BzaXQuZnJhdW5ob2Zl
ci5kZTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVv
dGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtw
YWRkaW5nLWxlZnQ6MWV4Ij4KCgoKCjxkaXY+CjxkaXYgc3R5bGU9ImRpcmVjdGlvbjpsdHI7Zm9u
dC1mYW1pbHk6VGFob21hO2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjEwcHQiPgo8ZGl2PnRwbTIt
dHNzIHJlcXVpcmVzIGxpYmdjcnlwdDIwIChhdCBsZWFzdCB0aGF0JiMzOTtzIHdhcyBpdCYjMzk7
cyBjYWxsZWQgb24gVWJ1bnR1KS48L2Rpdj4KPGRpdj5saWJnY3J5cHQgKHdoaWNoIGlzIHRoZSAx
LnggYnJhbmNoKSBpcyBxdWl0ZSBvbGQgYW5kIGhhZCBhIGRpZmZlcmVudCBBUEkgdGhhbiB0aGUg
MjAgc2VyaWVzLi4uPGJyPgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pk1heWJlIHRoYXQm
IzM5O3MgdGhlIHByb2JsZW0uLi48YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTpU
aW1lcyBOZXcgUm9tYW47Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTZweCI+Cjxocj4KPGRpdiBp
ZD0ibV80MTIyMTQzMzQzMDQ0ODEwMjM3ZGl2UnBGMzMxMTAwIiBzdHlsZT0iZGlyZWN0aW9uOmx0
ciI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iVGFob21hIiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8
L2I+IHRwbTIgWzxhIGhyZWY9Im1haWx0bzp0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnIiB0YXJn
ZXQ9Il9ibGFuayI+dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZzwvYT5dIG9uIGJlaGFsZiBvZiBU
ZXJyeSBBbiBbPGEgaHJlZj0ibWFpbHRvOnRlcnJ5LmFuLmJqQGdtYWlsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPnRlcnJ5LmFuLmJqQGdtYWlsLmNvbTwvYT5dPGJyPgo8Yj5TZW50OjwvYj4gVGh1cnNk
YXksIE9jdG9iZXIgMTgsIDIwMTggMTI6MTg8YnI+CjxiPlRvOjwvYj4gPGEgaHJlZj0ibWFpbHRv
OnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+
PGJyPgo8Yj5TdWJqZWN0OjwvYj4gW3RwbTJdIGRvZXMgYW55b25lIGNvbXBpbGUgdHBtMi10c3Mt
Mi4xLjAgc3VjY2Vzc2Z1bCBvbiBDZW50T1M3Pzxicj4KPC9mb250Pjxicj4KPC9kaXY+CjxkaXY+
PC9kaXY+CjxkaXY+CjxkaXYgZGlyPSJsdHIiPmxvdHMgb2YgZXJyb3JzIG9uIG15IGxhcHRvcC4K
PGRpdj48YnI+CjwvZGl2Pgo8ZGl2PkkgaGF2ZSB1cGRhdGVkIGxpYmdwZy1lcnJvciwgbGliZ2Ny
eXB0LWRldmVsLCBldGMuLjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+
Cgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============5795232848990149901==--

