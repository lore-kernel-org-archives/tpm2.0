Content-Type: multipart/mixed; boundary="===============0927732852761417430=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: [tpm2] Re: Infineon SLB 9670 lifetime
Date: Fri, 21 Feb 2020 07:34:30 +0000
Message-ID: <CAKrSGQRK+Hi8yyvaaKH52dTCkP=HVq6FVLCAeaT8CwS0mCwctg@mail.gmail.com>
In-Reply-To: 695e0b89-b07d-2bf8-f369-fdf8c5ab8658@mikronika.com.pl
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0927732852761417430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Not an expert legal, but I believe "useful lifetime" is for accounting
purposes, its not a statement on how long a device is expected to remain in
working order, its used to define when its value depreciates as an asset.

Cars, fax machines, computers etc all appear to have the standard 5 years

https://www.investopedia.com/ask/answers/051215/how-do-you-determine-tangib=
le-assets-useful-life.asp

On Thu, 20 Feb 2020, 10:55 Tomasz Przybysz, <
tomasz.przybysz(a)mikronika.com.pl> wrote:

> Hi,
>
> Do you know ?
>
>
>
> From data sheet:
>
> SLB 9670 TPM2.0
> SLB 9670 TCG Family 2 Level 00 Rev. 01.16 Data Sheet, Revision 1.0,
> 2015-11-05:
>
>
> 1.1 Power Management
> In the SLB 9670, power management is handled internally; no explicit
> power-down or standby mode is
> available. The device automatically enters a low-power state after each
> successful command/response
> transaction. If a transaction is started on the SPI bus from the host
> platform, the device will wake immediately
> and will return to the low-power mode after the transaction has been
> finished.
>
>
> 4.2 Functional Operating Range
>
> 1) *The useful lifetime of the device is 5 (five) years with a duty cycle
> (that means, a power-on time) of 100%. A useful*
> *lifetime of 7 (seven) years can be guaranteed for a duty cycle of 70%.
> For both scenarios, it is assumed that the device*
> *will be used for calculations for approximately 5% of the maximum useful
> lifetime.*
>
> Is it true? This is disqualification. Industrial equipment should work
> much longer, 15-20 years. It's not suitable for industrial equipment.
> It's good for ink toner cartridge.
>
>
> Best regards,
> Tom
>
>
>
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============0927732852761417430==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpzYW5zLXNlcmlmIj5Ob3Qg
YW4gZXhwZXJ0IGxlZ2FsLCBidXQgSSBiZWxpZXZlICZxdW90O3VzZWZ1bCBsaWZldGltZSZxdW90
OyBpcyBmb3IgYWNjb3VudGluZyBwdXJwb3NlcywgaXRzIG5vdCBhIHN0YXRlbWVudCBvbiBob3cg
bG9uZyBhIGRldmljZSBpcyBleHBlY3RlZCB0byByZW1haW4gaW4gd29ya2luZyBvcmRlciwgaXRz
IHVzZWQgdG8gZGVmaW5lIHdoZW4gaXRzIHZhbHVlIGRlcHJlY2lhdGVzIGFzIGFuIGFzc2V0Ljwv
c3Bhbj48ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImZvbnQtZmFtaWx5OnNhbnMtc2VyaWYiPjxicj48
L2Rpdj48ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImZvbnQtZmFtaWx5OnNhbnMtc2VyaWYiPkNhcnMs
IGZheCBtYWNoaW5lcywgY29tcHV0ZXJzIGV0YyBhbGwgYXBwZWFyIHRvIGhhdmUgdGhlIHN0YW5k
YXJkIDUgeWVhcnM8L2Rpdj48ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImZvbnQtZmFtaWx5OnNhbnMt
c2VyaWYiPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImZvbnQtZmFtaWx5OnNhbnMt
c2VyaWYiPjxhIGhyZWY9Imh0dHBzOi8vd3d3LmludmVzdG9wZWRpYS5jb20vYXNrL2Fuc3dlcnMv
MDUxMjE1L2hvdy1kby15b3UtZGV0ZXJtaW5lLXRhbmdpYmxlLWFzc2V0cy11c2VmdWwtbGlmZS5h
c3AiPmh0dHBzOi8vd3d3LmludmVzdG9wZWRpYS5jb20vYXNrL2Fuc3dlcnMvMDUxMjE1L2hvdy1k
by15b3UtZGV0ZXJtaW5lLXRhbmdpYmxlLWFzc2V0cy11c2VmdWwtbGlmZS5hc3A8L2E+PC9kaXY+
PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0i
Z21haWxfYXR0ciI+T24gVGh1LCAyMCBGZWIgMjAyMCwgMTA6NTUgVG9tYXN6IFByenlieXN6LCAm
bHQ7PGEgaHJlZj0ibWFpbHRvOnRvbWFzei5wcnp5YnlzekBtaWtyb25pa2EuY29tLnBsIj50b21h
c3oucHJ6eWJ5c3pAbWlrcm9uaWthLmNvbS5wbDwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48Ymxv
Y2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3Jk
ZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KCgoKPGRpdj4KPGRpdiBs
YW5nPSJ4LXVuaWNvZGUiPgo8ZGl2IGxhbmc9IngtdW5pY29kZSI+CjxkaXYgbGFuZz0ieC11bmlj
b2RlIj5IaSwgPGJyPgo8YnI+CkRvIHlvdSBrbm93ID88YnI+Cjxicj4KPGJyPgo8YnI+CkZyb20g
ZGF0YSBzaGVldDo8YnI+Cjxicj4KPHNwYW4+U0xCIDk2NzAgVFBNMi4wPC9zcGFuPiA8YnIgc3R5
bGU9ImZvbnQtc3R5bGU6bm9ybWFsO2ZvbnQtdmFyaWFudDpub3JtYWw7Zm9udC13ZWlnaHQ6bm9y
bWFsO2xldHRlci1zcGFjaW5nOm5vcm1hbDtsaW5lLWhlaWdodDpub3JtYWw7dGV4dC1hbGlnbjot
d2Via2l0LWF1dG87dGV4dC1pbmRlbnQ6MHB4O3RleHQtdHJhbnNmb3JtOm5vbmU7d2hpdGUtc3Bh
Y2U6bm9ybWFsO3dvcmQtc3BhY2luZzowcHgiPgpTTEIgOTY3MCBUQ0cgRmFtaWx5IDIgTGV2ZWwg
MDAgUmV2LiAwMS4xNiBEYXRhIFNoZWV0LCBSZXZpc2lvbiAxLjAsIDIwMTUtMTEtMDU6PGJyPgo8
YnI+Cjxicj4KMS4xIFBvd2VyIE1hbmFnZW1lbnQ8YnI+CkluIHRoZSBTTEIgOTY3MCwgcG93ZXIg
bWFuYWdlbWVudCBpcyBoYW5kbGVkIGludGVybmFsbHk7IG5vIGV4cGxpY2l0IHBvd2VyLWRvd24g
b3Igc3RhbmRieSBtb2RlIGlzPGJyPgphdmFpbGFibGUuIFRoZSBkZXZpY2UgYXV0b21hdGljYWxs
eSBlbnRlcnMgYSBsb3ctcG93ZXIgc3RhdGUgYWZ0ZXIgZWFjaCBzdWNjZXNzZnVsIGNvbW1hbmQv
cmVzcG9uc2U8YnI+CnRyYW5zYWN0aW9uLiBJZiBhIHRyYW5zYWN0aW9uIGlzIHN0YXJ0ZWQgb24g
dGhlIFNQSSBidXMgZnJvbSB0aGUgaG9zdCBwbGF0Zm9ybSwgdGhlIGRldmljZSB3aWxsIHdha2Ug
aW1tZWRpYXRlbHk8YnI+CmFuZCB3aWxsIHJldHVybiB0byB0aGUgbG93LXBvd2VyIG1vZGUgYWZ0
ZXIgdGhlIHRyYW5zYWN0aW9uIGhhcyBiZWVuIGZpbmlzaGVkLjxicj4KPGJyPgo8YnI+CjQuMiBG
dW5jdGlvbmFsIE9wZXJhdGluZyBSYW5nZTxicj4KPGJyPgoxKSA8Yj5UaGUgdXNlZnVsIGxpZmV0
aW1lIG9mIHRoZSBkZXZpY2UgaXMgNSAoZml2ZSkgeWVhcnMgd2l0aCBhIGR1dHkgY3ljbGUgKHRo
YXQgbWVhbnMsIGEgcG93ZXItb24gdGltZSkgb2YgMTAwJS4gQSB1c2VmdWw8L2I+PGI+PGJyPgo8
L2I+PGI+bGlmZXRpbWUgb2YgNyAoc2V2ZW4pIHllYXJzIGNhbiBiZSBndWFyYW50ZWVkIGZvciBh
IGR1dHkgY3ljbGUgb2YgNzAlLiBGb3IgYm90aCBzY2VuYXJpb3MsIGl0IGlzIGFzc3VtZWQgdGhh
dCB0aGUgZGV2aWNlPC9iPjxiPjxicj4KPC9iPjxiPndpbGwgYmUgdXNlZCBmb3IgY2FsY3VsYXRp
b25zIGZvciBhcHByb3hpbWF0ZWx5IDUlIG9mIHRoZSBtYXhpbXVtIHVzZWZ1bCBsaWZldGltZS48
L2I+PGI+PGJyPgo8L2I+PGJyPgpJcyBpdCB0cnVlPyBUaGlzIGlzIGRpc3F1YWxpZmljYXRpb24u
IEluZHVzdHJpYWwgZXF1aXBtZW50IHNob3VsZCB3b3JrIG11Y2ggbG9uZ2VyLCAxNS0yMCB5ZWFy
cy4gSXQmIzM5O3Mgbm90IHN1aXRhYmxlIGZvciBpbmR1c3RyaWFsIGVxdWlwbWVudC48YnI+Ckl0
JiMzOTtzIGdvb2QgZm9yIGluayB0b25lciBjYXJ0cmlkZ2UuPGJyPgo8YnI+Cjxicj4KQmVzdCBy
ZWdhcmRzLDxicj4KVG9tPGJyPgo8YnI+Cjxicj4KPGJyPgo8ZGl2Pjxicj4KPC9kaXY+CjwvZGl2
Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0
cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+dHBtMkBs
aXN0cy4wMS5vcmc8L2E+PGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhy
ZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0i
bm9yZWZlcnJlciI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgolKHdlYl9wYWdlX3Vy
bClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczwvYmxvY2txdW90ZT48L2Rp
dj4K

--===============0927732852761417430==--

