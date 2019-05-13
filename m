Content-Type: multipart/mixed; boundary="===============6175114201667449959=="
MIME-Version: 1.0
From: Emmanuel Deloget <logout at free.fr>
Subject: Re: [tpm2] Openssl 1.0.2
Date: Mon, 13 May 2019 09:56:13 +0200
Message-ID: <CAKh=nwG4rNSv2-Cmfxz-SNzGs+CCfFXgpRvQ066RL5DB+LTtsA@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649D74618@ORSMSX106.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6175114201667449959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

For good stats about OpenSSL use, you may try to contect the OpenVPN team.

From what I know the oldest versions of OpenSSL are used on old, not-eoled
distributions such as RHEL 7 (based upon OSSL 1.0.2, with EOL support at
the end of 2020) or Suse Entreprise (SE11 has extended support ending in
2024 and still uses OSSL 0.9.8 as far as I know but my knowledge of Suse is
quite limited, and I may be wrong).

Best regards,

-- Emmanuel Deloget

On Mon, May 13, 2019 at 1:01 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> Encase folks don't know, OpenSSL 1.0.2 will be End Of Lifed at the end of
> 2019:
> https://www.openssl.org/policies/releasestrat.html
>
> Currently, the projects support OpenSSL 1.0.2. We need to consider moving
> away from this. I'd like to gauge people's reactions
> And how many users are still on OpenSSL 1.0.2 and don't plan to upgrade?
> If you do that, you won't get security fixes, so it seems
> like a bad idea.
>
> In tpm2-tools, since 4.0 is already quite non-api compatible, I was
> considering moving away from OSSL1.0.2 on that release, objections?
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
>

--===============6175114201667449959==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFt
aWx5Om1vbm9zcGFjZSxtb25vc3BhY2UiPkhlbGxvLMKgPC9kaXY+PGRpdiBjbGFzcz0iZ21haWxf
ZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSxtb25vc3BhY2UiPjxicj48L2Rp
dj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNl
LG1vbm9zcGFjZSI+Rm9yIGdvb2Qgc3RhdHMgYWJvdXQgT3BlblNTTCB1c2UsIHlvdSBtYXkgdHJ5
IHRvIGNvbnRlY3QgdGhlIE9wZW5WUE4gdGVhbS7CoDwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2Rl
ZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj48YnI+PC9kaXY+
PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSxt
b25vc3BhY2UiPkZyb20gd2hhdCBJIGtub3cgdGhlIG9sZGVzdCB2ZXJzaW9ucyBvZiBPcGVuU1NM
IGFyZSB1c2VkIG9uIG9sZCwgbm90LWVvbGVkIGRpc3RyaWJ1dGlvbnMgc3VjaCBhcyBSSEVMIDcg
KGJhc2VkIHVwb24gT1NTTCAxLjAuMiwgd2l0aCBFT0wgc3VwcG9ydCBhdCB0aGUgZW5kIG9mIDIw
MjApIG9yIFN1c2UgRW50cmVwcmlzZSAoU0UxMSBoYXMgZXh0ZW5kZWQgc3VwcG9ydCBlbmRpbmcg
aW4gMjAyNCBhbmQgc3RpbGwgdXNlcyBPU1NMIDAuOS44IGFzIGZhciBhcyBJIGtub3cgYnV0IG15
IGtub3dsZWRnZSBvZiBTdXNlIGlzIHF1aXRlIGxpbWl0ZWQsIGFuZCBJIG1heSBiZSB3cm9uZyku
wqA8L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1mYW1pbHk6bW9u
b3NwYWNlLG1vbm9zcGFjZSI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0
eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj5CZXN0IHJlZ2FyZHMswqA8L2Rp
dj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNl
LG1vbm9zcGFjZSI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJm
b250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj4tLSBFbW1hbnVlbCBEZWxvZ2V0PC9kaXY+
PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0i
Z21haWxfYXR0ciI+T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMTowMSBBTSBSb2JlcnRzLCBXaWxs
aWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iPndp
bGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2tx
dW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+
RW5jYXNlIGZvbGtzIGRvbiYjMzk7dCBrbm93LCBPcGVuU1NMIDEuMC4yIHdpbGwgYmUgRW5kIE9m
IExpZmVkIGF0IHRoZSBlbmQgb2YgMjAxOTo8YnI+CjxhIGhyZWY9Imh0dHBzOi8vd3d3Lm9wZW5z
c2wub3JnL3BvbGljaWVzL3JlbGVhc2VzdHJhdC5odG1sIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL3d3dy5vcGVuc3NsLm9yZy9wb2xpY2llcy9yZWxlYXNlc3RyYXQu
aHRtbDwvYT48YnI+Cjxicj4KQ3VycmVudGx5LCB0aGUgcHJvamVjdHMgc3VwcG9ydCBPcGVuU1NM
IDEuMC4yLiBXZSBuZWVkIHRvIGNvbnNpZGVyIG1vdmluZyBhd2F5IGZyb20gdGhpcy4gSSYjMzk7
ZCBsaWtlIHRvIGdhdWdlIHBlb3BsZSYjMzk7cyByZWFjdGlvbnM8YnI+CkFuZCBob3cgbWFueSB1
c2VycyBhcmUgc3RpbGwgb24gT3BlblNTTCAxLjAuMiBhbmQgZG9uJiMzOTt0IHBsYW4gdG8gdXBn
cmFkZT8gSWYgeW91IGRvIHRoYXQsIHlvdSB3b24mIzM5O3QgZ2V0IHNlY3VyaXR5IGZpeGVzLCBz
byBpdCBzZWVtczxicj4KbGlrZSBhIGJhZCBpZGVhLjxicj4KPGJyPgpJbiB0cG0yLXRvb2xzLCBz
aW5jZSA0LjAgaXMgYWxyZWFkeSBxdWl0ZSBub24tYXBpIGNvbXBhdGlibGUsIEkgd2FzIGNvbnNp
ZGVyaW5nIG1vdmluZyBhd2F5IGZyb20gT1NTTDEuMC4yIG9uIHRoYXQgcmVsZWFzZSwgb2JqZWN0
aW9ucz88YnI+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
PGJyPgp0cG0yIG1haWxpbmcgbGlzdDxicj4KPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8YSBocmVmPSJo
dHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3RwbTIiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8v
dHBtMjwvYT48YnI+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============6175114201667449959==--

