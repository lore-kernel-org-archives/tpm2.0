Content-Type: multipart/mixed; boundary="===============6907038140438155057=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] OpenSSL Compatibility in tpm2_MakeCredential
Date: Fri, 16 Aug 2019 14:35:11 -0700
Message-ID: <CANKkrzG1ssJ6RtZq-j9_M0c8vGv3AD9UTJKWM_ix+p-y2FH6RA@mail.gmail.com>
In-Reply-To: CAP3jAwT0xBrQj_-vhpzERd=Nwv=wjwZG_pKfHCmG=P-tziJdFg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6907038140438155057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2019 at 2:04 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
wrote:

> I copied the code on my server but it seems that mine supports 1.0.2n and
> my manager said that they will not upgrade to newer versions until next
> year.
>

It's unclear to me exactly what code you're referring to here. For example,
your compiler logs below mention "tpm2_common.c", but as far as I can tell,
no such file has ever existed within the tpm2-tools Git repo.

*tpm2_common.c:894:5: warning: implicit declaration of function
> =E2=80=98RSA_padding_add_PKCS1_OAEP_mgf1=E2=80=99 [-Wimplicit-function-de=
claration]*
> *tpm2_common.c:1194:5: warning: implicit declaration of function
> =E2=80=98tpm_alg_to_ossl=E2=80=99 [-Wimplicit-function-declaration]*
>

These two warnings are about static functions that are declared within
lib/tpm2_identity_util.c. Are you maybe trying to just concatenate
tpm2-tools's source files into a single compilation unit?

*tpm2_common.c:1441:5: error: incompatible type for argument 1 of
> =E2=80=98EVP_DigestUpdate=E2=80=99*
> *     return EVP_DigestUpdate(ctx->md_ctx, data, len);*
> *     ^*
>

The string "md_ctx" doesn't appear anywhere in the tpm2-tools Git repo
either, as far as I can tell.

Is this a line of code that you wrote? If so, it should probably be
"&ctx->md_ctx" instead of just "ctx->md_ctx".


> 1.0.2 does not seem to have it or arguments are different!
>

I don't think EVP_DigestUpdate or EVP_DigestFinal_ex have changed in a long
time. For example, here's the OpenBSD man page from 2004, which shows them
taking an "EVP_MD_CTX*" parameter:
http://man.openbsd.org/OpenBSD-3.6/EVP_DigestUpdate

I think your problem is unrelated to OpenSSL version.

--===============6907038140438155057==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMjow
NCBQTSBSYWh1bCBIYXJkaWthciAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21h
aWwuY29tIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48
ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXYgZGlyPSJs
dHIiPjxkaXYgZGlyPSJsdHIiPjxkaXY+SSBjb3BpZWQgdGhlIGNvZGUgb24gbXkgc2VydmVyIGJ1
dCBpdCBzZWVtcyB0aGF0IG1pbmUgc3VwcG9ydHMgMS4wLjJuIGFuZCBteSBtYW5hZ2VyIHNhaWQg
dGhhdCB0aGV5IHdpbGwgbm90IHVwZ3JhZGUgdG8gbmV3ZXIgdmVyc2lvbnMgdW50aWwgbmV4dCB5
ZWFyLjxicj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9k
aXY+PGRpdj5JdCYjMzk7cyB1bmNsZWFyIHRvIG1lIGV4YWN0bHkgd2hhdCBjb2RlIHlvdSYjMzk7
cmXCoHJlZmVycmluZyB0byBoZXJlLiBGb3IgZXhhbXBsZSwgeW91ciBjb21waWxlciBsb2dzIGJl
bG93IG1lbnRpb24gJnF1b3Q7dHBtMl9jb21tb24uYyZxdW90OywgYnV0IGFzIGZhciBhcyBJIGNh
biB0ZWxsLCBubyBzdWNoIGZpbGUgaGFzIGV2ZXIgZXhpc3RlZCB3aXRoaW4gdGhlIHRwbTItdG9v
bHMgR2l0IHJlcG8uPC9kaXY+PGRpdj48YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBz
b2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxk
aXYgZGlyPSJsdHIiPjxkaXYgZGlyPSJsdHIiPjxkaXY+PGk+PGZvbnQgY29sb3I9IiMwMDAwZmYi
PnRwbTJfY29tbW9uLmM6ODk0OjU6IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uIOKAmFJTQV9wYWRkaW5nX2FkZF9QS0NTMV9PQUVQX21nZjHigJkgWy1XaW1wbGljaXQt
ZnVuY3Rpb24tZGVjbGFyYXRpb25dPC9mb250PjwvaT48YnI+PC9kaXY+PGRpdj48ZGl2PjxpPjxm
b250IGNvbG9yPSIjMDAwMGZmIj50cG0yX2NvbW1vbi5jOjExOTQ6NTogd2FybmluZzogaW1wbGlj
aXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdHBtX2FsZ190b19vc3Ns4oCZIFstV2ltcGxp
Y2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXTwvZm9udD48L2k+PC9kaXY+PC9kaXY+PC9kaXY+PC9k
aXY+PC9kaXY+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhlc2UgdHdvIHdhcm5p
bmdzIGFyZSBhYm91dCBzdGF0aWMgZnVuY3Rpb25zIHRoYXQgYXJlIGRlY2xhcmVkIHdpdGhpbiBs
aWIvdHBtMl9pZGVudGl0eV91dGlsLmMuIEFyZSB5b3UgbWF5YmUgdHJ5aW5nIHRvIGp1c3QgY29u
Y2F0ZW5hdGUgdHBtMi10b29scyYjMzk7cyBzb3VyY2UgZmlsZXMgaW50byBhIHNpbmdsZSBjb21w
aWxhdGlvbiB1bml0PzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHgg
c29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj48
ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXY+PGk+PGZvbnQgY29sb3I9IiMw
MDAwZmYiPnRwbTJfY29tbW9uLmM6MTQ0MTo1OiBlcnJvcjogaW5jb21wYXRpYmxlIHR5cGUgZm9y
IGFyZ3VtZW50IDEgb2Yg4oCYRVZQX0RpZ2VzdFVwZGF0ZeKAmTwvZm9udD48L2k+PGJyPjwvZGl2
PjwvZGl2PjxkaXY+PGRpdj48aT48Zm9udCBjb2xvcj0iIzAwMDBmZiI+wqAgwqAgwqByZXR1cm4g
RVZQX0RpZ2VzdFVwZGF0ZShjdHgtJmd0O21kX2N0eCwgZGF0YSwgbGVuKTs8L2ZvbnQ+PC9pPjwv
ZGl2PjxkaXY+PGk+PGZvbnQgY29sb3I9IiMwMDAwZmYiPsKgIMKgIMKgXjwvZm9udD48L2k+PC9k
aXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2Pjxk
aXY+VGhlIHN0cmluZyAmcXVvdDttZF9jdHgmcXVvdDsgZG9lc24mIzM5O3QgYXBwZWFyIGFueXdo
ZXJlIGluIHRoZSB0cG0yLXRvb2xzIEdpdCByZXBvIGVpdGhlciwgYXMgZmFyIGFzIEkgY2FuIHRl
bGwuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JcyB0aGlzIGEgbGluZSBvZiBjb2RlIHRoYXQg
eW91IHdyb3RlPyBJZiBzbywgaXQgc2hvdWxkIHByb2JhYmx5IGJlICZxdW90OyZhbXA7Y3R4LSZn
dDttZF9jdHgmcXVvdDsgaW5zdGVhZCBvZiBqdXN0ICZxdW90O2N0eC0mZ3Q7bWRfY3R4JnF1b3Q7
LjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQs
MjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+
PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjEuMC4yIGRvZXMgbm90IHNlZW0gdG8gaGF2ZSBpdCBv
ciBhcmd1bWVudHMgYXJlIGRpZmZlcmVudCE8L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48
L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGRvbiYjMzk7dCB0aGluayBFVlBfRGln
ZXN0VXBkYXRlIG9yIEVWUF9EaWdlc3RGaW5hbF9leCBoYXZlIGNoYW5nZWQgaW4gYSBsb25nIHRp
bWUuIEZvciBleGFtcGxlLCBoZXJlJiMzOTtzIHRoZSBPcGVuQlNEIG1hbiBwYWdlIGZyb20gMjAw
NCwgd2hpY2ggc2hvd3MgdGhlbSB0YWtpbmcgYW4gJnF1b3Q7RVZQX01EX0NUWComcXVvdDsgcGFy
YW1ldGVyOsKgPGEgaHJlZj0iaHR0cDovL21hbi5vcGVuYnNkLm9yZy9PcGVuQlNELTMuNi9FVlBf
RGlnZXN0VXBkYXRlIj5odHRwOi8vbWFuLm9wZW5ic2Qub3JnL09wZW5CU0QtMy42L0VWUF9EaWdl
c3RVcGRhdGU8L2E+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIHRoaW5rIHlvdXIgcHJvYmxl
bSBpcyB1bnJlbGF0ZWQgdG8gT3BlblNTTCB2ZXJzaW9uLjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============6907038140438155057==--

