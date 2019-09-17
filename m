Content-Type: multipart/mixed; boundary="===============3158780009401563511=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: Re: [tpm2] 1.2 and 2.0
Date: Tue, 17 Sep 2019 13:33:12 -0700
Message-ID: <CAP3jAwS+RTacqLpC2Hs=nfVgGUFe1c5qEbka9mPOu5_n354O4A@mail.gmail.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0163B3091D@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3158780009401563511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Andreas.  I feel even the protocol is slightly different, the
privacy CA steps differ slightly for 1.2 and 2.0.

On Tue, Sep 17, 2019 at 12:23 AM Fuchs, Andreas <
andreas.fuchs(a)sit.fraunhofer.de> wrote:

> Hi,
>
> yes, 2.0 is a complete rework and not compatible with 1.2
> Thus one would have to do a complete rewrite of said software.
>
> The protocol and schemes would remain the same, but data-types and API are
> new.
>
> Cheers,
> Andreas
>
> ------------------------------
> *From:* tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Rahul Hardikar [
> rahulhardikar(a)gmail.com]
> *Sent:* Tuesday, September 17, 2019 03:08
> *To:* tpm2(a)lists.01.org
> *Subject:* [tpm2] 1.2 and 2.0
>
> Hi All,
> General question here.
> Is 2.0 not at all compatible with 1.2?  The AIK scheme in 1.2 looks quite
> different than that of 2.0.
>
> How would one migrate to 2.0 support if they implemented AIK (attestation
> CA) using 1.2 structures, for example,  1.2 defines TCPA_IDENTITY_REQ whi=
ch
> is so different that what's in 2.0
>
> How would one migrate such code?
> Thanks,
> Rahul
>

--===============3158780009401563511==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzIEFuZHJlYXMuwqAgSSBmZWVsIGV2ZW4gdGhlIHByb3RvY29s
IGlzIHNsaWdodGx5IGRpZmZlcmVudCwgdGhlIHByaXZhY3kgQ0Egc3RlcHMgZGlmZmVyIHNsaWdo
dGx5IGZvciAxLjIgYW5kIDIuMC48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxk
aXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIFNlcCAxNywgMjAxOSBhdCAx
MjoyMyBBTSBGdWNocywgQW5kcmVhcyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFuZHJlYXMuZnVjaHNA
c2l0LmZyYXVuaG9mZXIuZGUiPmFuZHJlYXMuZnVjaHNAc2l0LmZyYXVuaG9mZXIuZGU8L2E+Jmd0
OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0i
bWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVm
dC1zdHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmct
bGVmdDoxZXgiPgoKCgoKPGRpdj4KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOmx0cjtmb250LWZhbWls
eTpUYWhvbWE7Y29sb3I6cmdiKDAsMCwwKTtmb250LXNpemU6MTBwdCI+CjxkaXY+SGksPC9kaXY+
CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj55ZXMsIDIuMCBpcyBhIGNvbXBsZXRlIHJld29yayBhbmQg
bm90IGNvbXBhdGlibGUgd2l0aCAxLjI8L2Rpdj4KPGRpdj5UaHVzIG9uZSB3b3VsZCBoYXZlIHRv
IGRvIGEgY29tcGxldGUgcmV3cml0ZSBvZiBzYWlkIHNvZnR3YXJlLjwvZGl2Pgo8ZGl2Pjxicj4K
PC9kaXY+CjxkaXY+VGhlIHByb3RvY29sIGFuZCBzY2hlbWVzIHdvdWxkIHJlbWFpbiB0aGUgc2Ft
ZSwgYnV0IGRhdGEtdHlwZXMgYW5kIEFQSSBhcmUgbmV3LjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+
CjxkaXY+Q2hlZXJzLDwvZGl2Pgo8ZGl2PkFuZHJlYXM8YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9k
aXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90Oztj
b2xvcjpyZ2IoMCwwLDApO2ZvbnQtc2l6ZToxNnB4Ij4KPGhyPgo8ZGl2IGlkPSJnbWFpbC1tXy0x
OTY4NTU4Mzc4ODgyMDQ1MzA4ZGl2UnBGMjY2ODI1IiBzdHlsZT0iZGlyZWN0aW9uOmx0ciI+PGZv
bnQgc2l6ZT0iMiIgZmFjZT0iVGFob21hIiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IHRw
bTIgWzxhIGhyZWY9Im1haWx0bzp0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9i
bGFuayI+dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZzwvYT5dIG9uIGJlaGFsZiBvZiBSYWh1bCBI
YXJkaWthciBbPGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+XTxicj4KPGI+U2VudDo8L2I+IFR1
ZXNkYXksIFNlcHRlbWJlciAxNywgMjAxOSAwMzowODxicj4KPGI+VG86PC9iPiA8YSBocmVmPSJt
YWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9y
ZzwvYT48YnI+CjxiPlN1YmplY3Q6PC9iPiBbdHBtMl0gMS4yIGFuZCAyLjA8YnI+CjwvZm9udD48
YnI+CjwvZGl2Pgo8ZGl2PjwvZGl2Pgo8ZGl2Pgo8ZGl2IGRpcj0ibHRyIj5IaSBBbGwsCjxkaXY+
R2VuZXJhbCBxdWVzdGlvbiBoZXJlLjxicj4KPGRpdj5JcyAyLjAgbm90IGF0IGFsbCBjb21wYXRp
YmxlIHdpdGggMS4yP8KgIFRoZSBBSUsgc2NoZW1lIGluIDEuMiBsb29rcyBxdWl0ZSBkaWZmZXJl
bnTCoHRoYW4gdGhhdCBvZiAyLjAuPC9kaXY+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+
SG93IHdvdWxkIG9uZSBtaWdyYXRlIHRvIDIuMCBzdXBwb3J0IGlmIHRoZXkgaW1wbGVtZW50ZWQg
QUlLIChhdHRlc3RhdGlvbiBDQSkgdXNpbmcgMS4yIHN0cnVjdHVyZXMsIGZvciBleGFtcGxlLCDC
oDEuMiBkZWZpbmVzIFRDUEFfSURFTlRJVFlfUkVRIHdoaWNoIGlzIHNvIGRpZmZlcmVudCB0aGF0
IHdoYXQmIzM5O3MgaW4gMi4wPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5Ib3cgd291bGQg
b25lIG1pZ3JhdGUgc3VjaCBjb2RlP8KgPC9kaXY+CjxkaXY+VGhhbmtzLDwvZGl2Pgo8ZGl2PlJh
aHVsPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KCjwvYmxvY2txdW90
ZT48L2Rpdj4K

--===============3158780009401563511==--

