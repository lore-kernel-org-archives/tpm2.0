Content-Type: multipart/mixed; boundary="===============4086813294231769572=="
MIME-Version: 1.0
From: Ian Oliver <ian.justin.oliver at gmail.com>
Subject: Re: [tpm2] tpm support on Intel NUCs
Date: Tue, 08 May 2018 19:24:13 +0300
Message-ID: <CAAxBZJtt+a0izPiPS3B2qvpuOy9L93-FBcB0R+xz3rMO+qOQ1Q@mail.gmail.com>
In-Reply-To: CANtcRX7L4GpHBVXg3qKOWGTvVhFwx7s680hq5j+DJPBX_UC79w@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4086813294231769572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fedora 27, Ubuntu 18.04  both with 4.15 kernels work on the NUCs with the
current release version of TPM tools.  Legacy boot is enabled, otherwise
tboot hands during the DRTM measurement.   We have SELinux+IMA/EMA working
on Fedora and correctly writing to the TPM only with Fedora - Ubuntu has
AppArmor unfortunately.

The patch for the TPM BUFFER size is required otherwise nv_write/read do
not work (this has now been pushed into the tools code base as I
understand).

Ian



On 8 May 2018 at 18:56, Peter Magnusson <blaufish.public.email(a)gmail.com>
wrote:

> 1/
> For the record, the combo of tpm2-tools 3.0.4, tpm2-tss 1.4.0, tpm2-abrmd
> 1.3.1 works excellently on NUC.
>
> 2/
> Regarding Boot hang on Ubuntu, I see this on Ubuntu 18 as well. I'm
> planning to install in BIOS legacy mode to get tboot logs on screen unless
> this is resolved otherwise (ubuntu grub scripts disables VGA log for efi
> tboot).
>
> The following blog posts suggests that tboot should not be working on Int=
el
> NUC out of the box, but the commands are tpm_tools based.
> https://blog.twobit.us/2015/01/02/txt-and-tboot-on-the-ivb-nuc/
> I tried to follow the advice on the blog but get error 0x9a2
> TPM_RC_BAD_AUTH... do I need to take ownership before executing command?
>
> tpm2_nvdefine -T device:/dev/tpmrm0 --index=3D0xffffffff --size=3D0
> WARN: Defining an index with size 0
> ERROR: Failed to define NV area at index 0xffffffff (-1).Error:0x9a2
> tpm2_rc_decode 0x9a2
> error layer
>    hex: 0x0
>    identifier: TSS2_TPM_ERROR_LEVEL
>    description: Error produced by the TPM
> format 1 error code
>    hex: 0x22
>    identifier: TPM_RC_BAD_AUTH
>    description: authorization failure without DA implications
> session
>    hex: 0x100
>    identifier: TPM_RC_1
>    description:  (null)
> On Fri, Apr 27, 2018 at 6:59 AM Ian Oliver <ian.justin.oliver(a)gmail.com>
> wrote:
>
> > Hello Duncan,
>
> > we've three NUC7i5DNKE - two running Fedora (latest) and one with Ubuntu
> 17.04.  Worked for us out of the box: had to enable TXT in the BIOS but
> that set everything else necessary automatically.  SRTM measures work, DR=
TM
> with tboot does not - tboot just hangs - still debugging this one - the A=
CM
> module seems to be correct.
>
> > Fedora requires a kernel recompile to get SELinux and IMA/EMA running;
>   Ubuntu does not support IMA policies an AppArmor kernel panics.
>
> > tss/abrmd/tpm2-tools all compile with the latest releases, "master" does
> not without some hacking - old libraries etc (CentOS was nigh on impossib=
le
> in this respect)
>
> > I'll check the kernel versions and tpm drivers when I get into the
> office, but 4.13 (at least) for the kernal has worked for us on more or
> less everything (NUC, Nokia AirFrame, Lenovo laptops).
>
> > t.
>
> > Ian
>
> > On 27 April 2018 at 01:20, <Duncan.Palmer(a)data61.csiro.au> wrote:
>
> >> Apologies if this is slightly OT for this list...
>
>
> >> We're running the tpm2 tools in Intel NUCs (a NUC5i7RYH to be exact),
> using Linux kernel 4.4.59 (shipped by Ubuntu as 4.4.0-77). The tpm drivers
> on this kernel don't work out of the box, and I had to put in a fairly
> nasty hack to make them work. The same driver now does not work on a newer
> NUC7i7 model. Are other people using NUCs, and if so, are you having
> similar issues?
>
>
> >> Cheers,
>
> >> Dunk
>
>
> >> Duncan Palmer
> >> Senior Software Engineer | Autonomous Systems
> >> Data61 | CSIRO
>
> >> E duncan.palmer(a)csiro.au
>
> >> Queensland Centre for Advanced Technologies (QCAT),
>
> >> 1 Technology Court, Pullenvale QLD, 4069
>
> >> www.data61.csiro.au
>
>
> >> CSIRO=E2=80=99s Digital Productivity business unit and NICTA have join=
ed forces
> to create digital powerhouse Data61
>
>
>
>
> > --
> > Dr. Ian Oliver
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > Privacy Engineering:  via Amazon
> > Twitter: @i_j_oliver
> > _______________________________________________
> > tpm2 mailing list
> > tpm2(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/tpm2
>



-- =

*Dr. Ian Oliver*
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:  via Amazon <http://www.amazon.co.uk/dp/1497569710>
*Twitter: @i_j_oliver*

--===============4086813294231769572==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PkZlZG9yYSAyNywgVWJ1bnR1IDE4LjA0wqAgYm90aCB3
aXRoIDQuMTUga2VybmVscyB3b3JrIG9uIHRoZSBOVUNzIHdpdGggdGhlIGN1cnJlbnQgcmVsZWFz
ZSB2ZXJzaW9uIG9mIFRQTSB0b29scy7CoCBMZWdhY3kgYm9vdCBpcyBlbmFibGVkLCBvdGhlcndp
c2UgdGJvb3QgaGFuZHMgZHVyaW5nIHRoZSBEUlRNIG1lYXN1cmVtZW50LsKgwqAgV2UgaGF2ZSBT
RUxpbnV4K0lNQS9FTUEgd29ya2luZyBvbiBGZWRvcmEgYW5kIGNvcnJlY3RseSB3cml0aW5nIHRv
IHRoZSBUUE0gb25seSB3aXRoIEZlZG9yYSAtIFVidW50dSBoYXMgQXBwQXJtb3IgdW5mb3J0dW5h
dGVseS48YnI+PGJyPjwvZGl2PlRoZSBwYXRjaCBmb3IgdGhlIFRQTSBCVUZGRVIgc2l6ZSBpcyBy
ZXF1aXJlZCBvdGhlcndpc2UgbnZfd3JpdGUvcmVhZCBkbyBub3Qgd29yayAodGhpcyBoYXMgbm93
IGJlZW4gcHVzaGVkIGludG8gdGhlIHRvb2xzIGNvZGUgYmFzZSBhcyBJIHVuZGVyc3RhbmQpLjxi
cj48YnI+PC9kaXY+SWFuPGJyPjxkaXY+PGJyPjxicj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJn
bWFpbF9leHRyYSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiA4IE1heSAyMDE4IGF0
IDE4OjU2LCBQZXRlciBNYWdudXNzb24gPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWls
dG86YmxhdWZpc2gucHVibGljLmVtYWlsQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmJsYXVm
aXNoLnB1YmxpYy5lbWFpbEBnbWFpbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9j
a3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRl
ci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjEvPGJyPgpGb3IgdGhlIHJl
Y29yZCwgdGhlIGNvbWJvIG9mIHRwbTItdG9vbHMgMy4wLjQsIHRwbTItdHNzIDEuNC4wLCB0cG0y
LWFicm1kPGJyPgoxLjMuMSB3b3JrcyBleGNlbGxlbnRseSBvbiBOVUMuPGJyPgo8YnI+CjIvPGJy
PgpSZWdhcmRpbmcgQm9vdCBoYW5nIG9uIFVidW50dSwgSSBzZWUgdGhpcyBvbiBVYnVudHUgMTgg
YXMgd2VsbC4gSSYjMzk7bTxicj4KcGxhbm5pbmcgdG8gaW5zdGFsbCBpbiBCSU9TIGxlZ2FjeSBt
b2RlIHRvIGdldCB0Ym9vdCBsb2dzIG9uIHNjcmVlbiB1bmxlc3M8YnI+CnRoaXMgaXMgcmVzb2x2
ZWQgb3RoZXJ3aXNlICh1YnVudHUgZ3J1YiBzY3JpcHRzIGRpc2FibGVzIFZHQSBsb2cgZm9yIGVm
aTxicj4KdGJvb3QpLjxicj4KPGJyPgpUaGUgZm9sbG93aW5nIGJsb2cgcG9zdHMgc3VnZ2VzdHMg
dGhhdCB0Ym9vdCBzaG91bGQgbm90IGJlIHdvcmtpbmcgb24gSW50ZWw8YnI+Ck5VQyBvdXQgb2Yg
dGhlIGJveCwgYnV0IHRoZSBjb21tYW5kcyBhcmUgdHBtX3Rvb2xzIGJhc2VkLjxicj4KPGEgaHJl
Zj0iaHR0cHM6Ly9ibG9nLnR3b2JpdC51cy8yMDE1LzAxLzAyL3R4dC1hbmQtdGJvb3Qtb24tdGhl
LWl2Yi1udWMvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2Jsb2cu
dHdvYml0LnVzLzIwMTUvPHdicj4wMS8wMi90eHQtYW5kLXRib290LW9uLXRoZS08d2JyPml2Yi1u
dWMvPC9hPjxicj4KSSB0cmllZCB0byBmb2xsb3cgdGhlIGFkdmljZSBvbiB0aGUgYmxvZyBidXQg
Z2V0IGVycm9yIDB4OWEyPGJyPgpUUE1fUkNfQkFEX0FVVEguLi4gZG8gSSBuZWVkIHRvIHRha2Ug
b3duZXJzaGlwIGJlZm9yZSBleGVjdXRpbmcgY29tbWFuZD88YnI+Cjxicj4KdHBtMl9udmRlZmlu
ZSAtVCBkZXZpY2U6L2Rldi90cG1ybTAgLS1pbmRleD0weGZmZmZmZmZmIC0tc2l6ZT0wPGJyPgpX
QVJOOiBEZWZpbmluZyBhbiBpbmRleCB3aXRoIHNpemUgMDxicj4KRVJST1I6IEZhaWxlZCB0byBk
ZWZpbmUgTlYgYXJlYSBhdCBpbmRleCAweGZmZmZmZmZmICgtMSkuRXJyb3I6MHg5YTI8YnI+CnRw
bTJfcmNfZGVjb2RlIDB4OWEyPGJyPgplcnJvciBsYXllcjxicj4KwqAgwqBoZXg6IDB4MDxicj4K
wqAgwqBpZGVudGlmaWVyOiBUU1MyX1RQTV9FUlJPUl9MRVZFTDxicj4KwqAgwqBkZXNjcmlwdGlv
bjogRXJyb3IgcHJvZHVjZWQgYnkgdGhlIFRQTTxicj4KZm9ybWF0IDEgZXJyb3IgY29kZTxicj4K
wqAgwqBoZXg6IDB4MjI8YnI+CsKgIMKgaWRlbnRpZmllcjogVFBNX1JDX0JBRF9BVVRIPGJyPgrC
oCDCoGRlc2NyaXB0aW9uOiBhdXRob3JpemF0aW9uIGZhaWx1cmUgd2l0aG91dCBEQSBpbXBsaWNh
dGlvbnM8YnI+CnNlc3Npb248YnI+CsKgIMKgaGV4OiAweDEwMDxicj4KwqAgwqBpZGVudGlmaWVy
OiBUUE1fUkNfMTxicj4KwqAgwqBkZXNjcmlwdGlvbjrCoCAobnVsbCk8YnI+Ck9uIEZyaSwgQXBy
IDI3LCAyMDE4IGF0IDY6NTkgQU0gSWFuIE9saXZlciAmbHQ7PGEgaHJlZj0ibWFpbHRvOmlhbi5q
dXN0aW4ub2xpdmVyQGdtYWlsLmNvbSI+aWFuLmp1c3Rpbi5vbGl2ZXJAZ21haWwuY29tPC9hPiZn
dDs8YnI+Cndyb3RlOjxicj4KPGRpdj48ZGl2IGNsYXNzPSJoNSI+PGJyPgomZ3Q7IEhlbGxvIER1
bmNhbiw8YnI+Cjxicj4KJmd0OyB3ZSYjMzk7dmUgdGhyZWUgTlVDN2k1RE5LRSAtIHR3byBydW5u
aW5nIEZlZG9yYSAobGF0ZXN0KSBhbmQgb25lIHdpdGggVWJ1bnR1PGJyPgoxNy4wNC7CoCBXb3Jr
ZWQgZm9yIHVzIG91dCBvZiB0aGUgYm94OiBoYWQgdG8gZW5hYmxlIFRYVCBpbiB0aGUgQklPUyBi
dXQ8YnI+CnRoYXQgc2V0IGV2ZXJ5dGhpbmcgZWxzZSBuZWNlc3NhcnkgYXV0b21hdGljYWxseS7C
oCBTUlRNIG1lYXN1cmVzIHdvcmssIERSVE08YnI+CndpdGggdGJvb3QgZG9lcyBub3QgLSB0Ym9v
dCBqdXN0IGhhbmdzIC0gc3RpbGwgZGVidWdnaW5nIHRoaXMgb25lIC0gdGhlIEFDTTxicj4KbW9k
dWxlIHNlZW1zIHRvIGJlIGNvcnJlY3QuPGJyPgo8YnI+CiZndDsgRmVkb3JhIHJlcXVpcmVzIGEg
a2VybmVsIHJlY29tcGlsZSB0byBnZXQgU0VMaW51eCBhbmQgSU1BL0VNQSBydW5uaW5nOzxicj4K
wqAgVWJ1bnR1IGRvZXMgbm90IHN1cHBvcnQgSU1BIHBvbGljaWVzIGFuIEFwcEFybW9yIGtlcm5l
bCBwYW5pY3MuPGJyPgo8YnI+CiZndDsgdHNzL2Ficm1kL3RwbTItdG9vbHMgYWxsIGNvbXBpbGUg
d2l0aCB0aGUgbGF0ZXN0IHJlbGVhc2VzLCAmcXVvdDttYXN0ZXImcXVvdDsgZG9lczxicj4Kbm90
IHdpdGhvdXQgc29tZSBoYWNraW5nIC0gb2xkIGxpYnJhcmllcyBldGMgKENlbnRPUyB3YXMgbmln
aCBvbiBpbXBvc3NpYmxlPGJyPgppbiB0aGlzIHJlc3BlY3QpPGJyPgo8YnI+CiZndDsgSSYjMzk7
bGwgY2hlY2sgdGhlIGtlcm5lbCB2ZXJzaW9ucyBhbmQgdHBtIGRyaXZlcnMgd2hlbiBJIGdldCBp
bnRvIHRoZTxicj4Kb2ZmaWNlLCBidXQgNC4xMyAoYXQgbGVhc3QpIGZvciB0aGUga2VybmFsIGhh
cyB3b3JrZWQgZm9yIHVzIG9uIG1vcmUgb3I8YnI+Cmxlc3MgZXZlcnl0aGluZyAoTlVDLCBOb2tp
YSBBaXJGcmFtZSwgTGVub3ZvIGxhcHRvcHMpLjxicj4KPGJyPgomZ3Q7IHQuPGJyPgo8YnI+CiZn
dDsgSWFuPGJyPgo8YnI+CiZndDsgT24gMjcgQXByaWwgMjAxOCBhdCAwMToyMCwgJmx0OzxhIGhy
ZWY9Im1haWx0bzpEdW5jYW4uUGFsbWVyQGRhdGE2MS5jc2lyby5hdSI+RHVuY2FuLlBhbG1lckBk
YXRhNjEuY3Npcm8uYXU8L2E+PHdicj4mZ3Q7IHdyb3RlOjxicj4KPGJyPgomZ3Q7Jmd0OyBBcG9s
b2dpZXMgaWYgdGhpcyBpcyBzbGlnaHRseSBPVCBmb3IgdGhpcyBsaXN0Li4uPGJyPgo8YnI+Cjxi
cj4KJmd0OyZndDsgV2UmIzM5O3JlIHJ1bm5pbmcgdGhlIHRwbTIgdG9vbHMgaW4gSW50ZWwgTlVD
cyAoYSBOVUM1aTdSWUggdG8gYmUgZXhhY3QpLDxicj4KdXNpbmcgTGludXgga2VybmVsIDQuNC41
OSAoc2hpcHBlZCBieSBVYnVudHUgYXMgNC40LjAtNzcpLiBUaGUgdHBtIGRyaXZlcnM8YnI+Cm9u
IHRoaXMga2VybmVsIGRvbiYjMzk7dCB3b3JrIG91dCBvZiB0aGUgYm94LCBhbmQgSSBoYWQgdG8g
cHV0IGluIGEgZmFpcmx5PGJyPgpuYXN0eSBoYWNrIHRvIG1ha2UgdGhlbSB3b3JrLiBUaGUgc2Ft
ZSBkcml2ZXIgbm93IGRvZXMgbm90IHdvcmsgb24gYSBuZXdlcjxicj4KTlVDN2k3IG1vZGVsLiBB
cmUgb3RoZXIgcGVvcGxlIHVzaW5nIE5VQ3MsIGFuZCBpZiBzbywgYXJlIHlvdSBoYXZpbmc8YnI+
CnNpbWlsYXIgaXNzdWVzPzxicj4KPGJyPgo8YnI+CiZndDsmZ3Q7IENoZWVycyw8YnI+Cjxicj4K
Jmd0OyZndDsgRHVuazxicj4KPGJyPgo8YnI+CiZndDsmZ3Q7IER1bmNhbiBQYWxtZXI8YnI+CiZn
dDsmZ3Q7IFNlbmlvciBTb2Z0d2FyZSBFbmdpbmVlciB8IEF1dG9ub21vdXMgU3lzdGVtczxicj4K
Jmd0OyZndDsgRGF0YTYxIHwgQ1NJUk88YnI+Cjxicj4KJmd0OyZndDsgRSBkdW5jYW4ucGFsbWVy
QGNzaXJvLmF1PGJyPgo8YnI+CiZndDsmZ3Q7IFF1ZWVuc2xhbmQgQ2VudHJlIGZvciBBZHZhbmNl
ZCBUZWNobm9sb2dpZXMgKFFDQVQpLDxicj4KPGJyPgomZ3Q7Jmd0OyAxIFRlY2hub2xvZ3kgQ291
cnQsIFB1bGxlbnZhbGUgUUxELCA0MDY5PGJyPgo8YnI+CiZndDsmZ3Q7IDxhIGhyZWY9Imh0dHA6
Ly93d3cuZGF0YTYxLmNzaXJvLmF1IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj53
d3cuZGF0YTYxLmNzaXJvLmF1PC9hPjxicj4KPGJyPgo8YnI+CiZndDsmZ3Q7IENTSVJP4oCZcyBE
aWdpdGFsIFByb2R1Y3Rpdml0eSBidXNpbmVzcyB1bml0IGFuZCBOSUNUQSBoYXZlIGpvaW5lZCBm
b3JjZXM8YnI+CnRvIGNyZWF0ZSBkaWdpdGFsIHBvd2VyaG91c2UgRGF0YTYxPGJyPgo8YnI+Cjxi
cj4KPGJyPgo8YnI+CiZndDsgLS08YnI+CiZndDsgRHIuIElhbiBPbGl2ZXI8YnI+CiZndDsgPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PHdicj49PGJyPgomZ3Q7IFByaXZhY3kgRW5naW5l
ZXJpbmc6wqAgdmlhIEFtYXpvbjxicj4KJmd0OyBUd2l0dGVyOiBAaV9qX29saXZlcjxicj4KPC9k
aXY+PC9kaXY+Jmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX188d2JyPl9fX19fX19f
X19fX19fX19fPGJyPgomZ3Q7IHRwbTIgbWFpbGluZyBsaXN0PGJyPgomZ3Q7IDxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IDxh
IGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMiIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi88
d2JyPmxpc3RpbmZvL3RwbTI8L2E+PGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjxiciBjbGVh
cj0iYWxsIj48YnI+LS0gPGJyPjxkaXYgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSIgZGF0YS1zbWFy
dG1haWw9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRy
Ij48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PGRpdiBzdHlsZT0iZm9u
dC1mYW1pbHk6YXJpYWw7Zm9udC1zaXplOnNtYWxsIj48Yj5Eci4gSWFuIE9saXZlcjwvYj48YnI+
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PTxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250
LWZhbWlseTphcmlhbDtmb250LXNpemU6c21hbGwiPlByaXZhY3kgRW5naW5lZXJpbmc6wqAgPGI+
PC9iPjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMTcsMTcsMTcpO2ZvbnQtZmFtaWx5OkFyaWFsLHNh
bnMtc2VyaWY7Zm9udC1zaXplOjEzcHg7bGluZS1oZWlnaHQ6MTlweCI+PGEgaHJlZj0iaHR0cDov
L3d3dy5hbWF6b24uY28udWsvZHAvMTQ5NzU2OTcxMCIgdGFyZ2V0PSJfYmxhbmsiPnZpYSBBbWF6
b248L2E+PC9zcGFuPjxiPjxicj5Ud2l0dGVyOiBAaV9qX29saXZlcjwvYj48L2Rpdj48L2Rpdj48
L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4KPC9kaXY+Cg==

--===============4086813294231769572==--

