Content-Type: multipart/mixed; boundary="===============0370660890308251507=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Re: FAPI
Date: Tue, 16 Jun 2020 15:23:35 -0700
Message-ID: <CAP3jAwQbzmn3Xzuw+cdUczJeLVWjyqV7gHsGQY3O9fsBAEL_aQ@mail.gmail.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0171B6B580@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0370660890308251507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andreas,
Thanks for the pointer but I don't see the make credential
(tpm2_makecredential and tpm2_activatecredential) anywhere?

Thanks,
Rahul

On Tue, Jun 16, 2020 at 1:40 AM Fuchs, Andreas <
andreas.fuchs(a)sit.fraunhofer.de> wrote:

> You might want to use this integration test as starter:
>
> https://github.com/tpm2-software/tpm2-tss/blob/master/test/integration/fa=
pi-quote.int.c
>
> It creates the restricted signing key, calls quote, etc.
>
> Note that we still await the TCG event log format spec to fully support
> the event log.
>
> Cheers,
> Andreas
> ------------------------------
> *From:* Rahul Hardikar [rahulhardikar(a)gmail.com]
> *Sent:* Monday, June 15, 2020 22:50
> *To:* tpm2(a)lists.01.org
> *Cc:* Fuchs, Andreas
> *Subject:* FAPI
>
>
> Sorry for the subject, was going to CC Andreas
> On Mon, Jun 15, 2020 at 1:50 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
> wrote:
>
>> Hi All,
>> Since FAPI is now supported in the latest tss2, I would like to implement
>> the Attestation protocol using FAPI, I believe basic commands like
>> create_ek, create_ak, read_manufac_certificate exist in FAPI API, what is
>> missing is, make credential w/o a TPM chip as most servers don't have tpm
>> chip.  I also don't see Activate Credential.
>>
>> How can we achieve this in FAPI?
>>
>> Thanks,
>> Rahul
>>
>

--===============0370660890308251507==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SGkgQW5kcmVhcyw8ZGl2PlRoYW5rcyBmb3IgdGhlIHBvaW50ZXIgYnV0
IEkgZG9uJiMzOTt0IHNlZSB0aGUgbWFrZSBjcmVkZW50aWFsICh0cG0yX21ha2VjcmVkZW50aWFs
IGFuZCB0cG0yX2FjdGl2YXRlY3JlZGVudGlhbCkgYW55d2hlcmU/IMKgPC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5SYWh1bDwvZGl2PjwvZGl2Pjxicj48ZGl2IGNs
YXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFR1
ZSwgSnVuIDE2LCAyMDIwIGF0IDE6NDAgQU0gRnVjaHMsIEFuZHJlYXMgJmx0OzxhIGhyZWY9Im1h
aWx0bzphbmRyZWFzLmZ1Y2hzQHNpdC5mcmF1bmhvZmVyLmRlIj5hbmRyZWFzLmZ1Y2hzQHNpdC5m
cmF1bmhvZmVyLmRlPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdC13
aWR0aDoxcHg7Ym9yZGVyLWxlZnQtc3R5bGU6c29saWQ7Ym9yZGVyLWxlZnQtY29sb3I6cmdiKDIw
NCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KCgoKCjxkaXY+CjxkaXYgc3R5bGU9ImRpcmVj
dGlvbjpsdHI7Zm9udC1mYW1pbHk6VGFob21hO2NvbG9yOnJnYigwLDAsMCk7Zm9udC1zaXplOjEw
cHQiPgo8ZGl2PllvdSBtaWdodCB3YW50IHRvIHVzZSB0aGlzIGludGVncmF0aW9uIHRlc3QgYXMg
c3RhcnRlcjo8L2Rpdj4KPGRpdj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0
d2FyZS90cG0yLXRzcy9ibG9iL21hc3Rlci90ZXN0L2ludGVncmF0aW9uL2ZhcGktcXVvdGUuaW50
LmMiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0y
LXRzcy9ibG9iL21hc3Rlci90ZXN0L2ludGVncmF0aW9uL2ZhcGktcXVvdGUuaW50LmM8L2E+PC9k
aXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5JdCBjcmVhdGVzIHRoZSByZXN0cmljdGVkIHNpZ25p
bmcga2V5LCBjYWxscyBxdW90ZSwgZXRjLjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+Tm90
ZSB0aGF0IHdlIHN0aWxsIGF3YWl0IHRoZSBUQ0cgZXZlbnQgbG9nIGZvcm1hdCBzcGVjIHRvIGZ1
bGx5IHN1cHBvcnQgdGhlIGV2ZW50IGxvZy48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PkNo
ZWVycyw8L2Rpdj4KPGRpdj5BbmRyZWFzPGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1p
bHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7O2NvbG9yOnJnYigwLDAsMCk7Zm9udC1zaXpl
OjE2cHgiPgo8aHI+CjxkaXYgaWQ9ImdtYWlsLW1fLTM1MDQzMDc2NDY5Mjk3NzEzMjdkaXZScEYx
NTgyNjAiIHN0eWxlPSJkaXJlY3Rpb246bHRyIj48Zm9udCBzaXplPSIyIiBmYWNlPSJUYWhvbWEi
IGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gUmFodWwgSGFyZGlrYXIgWzxhIGhyZWY9Im1h
aWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tPC9hPl08YnI+CjxiPlNlbnQ6PC9iPiBNb25kYXksIEp1bmUgMTUsIDIwMjAg
MjI6NTA8YnI+CjxiPlRvOjwvYj4gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0
YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8Yj5DYzo8L2I+IEZ1Y2hz
LCBBbmRyZWFzPGJyPgo8Yj5TdWJqZWN0OjwvYj4gRkFQSTxicj4KPC9mb250Pjxicj4KPC9kaXY+
CjxkaXY+PC9kaXY+CjxkaXY+CjxkaXYgZGlyPSJsdHIiPgo8ZGl2IGRpcj0ibHRyIj48YnI+Cjwv
ZGl2PgpTb3JyeSBmb3IgdGhlIHN1YmplY3QsIHdhcyBnb2luZyB0byBDQyBBbmRyZWFzPGJyPgo8
ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+CjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRy
Ij5PbiBNb24sIEp1biAxNSwgMjAyMCBhdCAxOjUwIFBNIFJhaHVsIEhhcmRpa2FyICZsdDs8YSBo
cmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHJlbD0ibm9vcGVuZXIgbm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgd3Jv
dGU6PGJyPgo8L2Rpdj4KPGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1z
dHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPgo8ZGl2IGRpcj0ibHRyIj5IaSBBbGwsCjxkaXY+U2luY2UgRkFQSSBpcyBub3cgc3Vw
cG9ydGVkIGluIHRoZSBsYXRlc3QgdHNzMiwgSSB3b3VsZCBsaWtlIHRvIGltcGxlbWVudCB0aGUg
QXR0ZXN0YXRpb24gcHJvdG9jb2wgdXNpbmcgRkFQSSwgSSBiZWxpZXZlIGJhc2ljIGNvbW1hbmRz
IGxpa2UgY3JlYXRlX2VrLCBjcmVhdGVfYWssIHJlYWRfbWFudWZhY19jZXJ0aWZpY2F0ZSBleGlz
dCBpbiBGQVBJIEFQSSwgd2hhdCBpcyBtaXNzaW5nIGlzLCBtYWtlIGNyZWRlbnRpYWwgdy9vIGEg
VFBNCiBjaGlwIGFzIG1vc3Qgc2VydmVycyBkb24mIzM5O3QgaGF2ZSB0cG0gY2hpcC7CoCBJIGFs
c28gZG9uJiMzOTt0IHNlZSBBY3RpdmF0ZSBDcmVkZW50aWFsLjwvZGl2Pgo8ZGl2Pjxicj4KPC9k
aXY+CjxkaXY+SG93IGNhbiB3ZSBhY2hpZXZlIHRoaXMgaW4gRkFQST88L2Rpdj4KPGRpdj48YnI+
CjwvZGl2Pgo8ZGl2PlRoYW5rcyw8L2Rpdj4KPGRpdj5SYWh1bDwvZGl2Pgo8L2Rpdj4KPC9ibG9j
a3F1b3RlPgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2PgoKPC9ibG9j
a3F1b3RlPjwvZGl2Pgo=

--===============0370660890308251507==--

