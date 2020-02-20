Content-Type: multipart/mixed; boundary="===============6642728449883351690=="
MIME-Version: 1.0
From: Tomasz Przybysz <tomasz.przybysz at mikronika.com.pl>
Subject: [tpm2] Infineon SLB 9670 lifetime
Date: Thu, 20 Feb 2020 10:53:58 +0000
Message-ID: <695e0b89-b07d-2bf8-f369-fdf8c5ab8658@mikronika.com.pl>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6642728449883351690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Do you know ?



From data sheet:

SLB 9670 TPM2.0
SLB 9670 TCG Family 2 Level 00 Rev. 01.16 Data Sheet, Revision 1.0, 2015-11=
-05:


1.1 Power Management
In the SLB 9670, power management is handled internally; no explicit power-=
down or standby mode is
available. The device automatically enters a low-power state after each suc=
cessful command/response
transaction. If a transaction is started on the SPI bus from the host platf=
orm, the device will wake immediately
and will return to the low-power mode after the transaction has been finish=
ed.


4.2 Functional Operating Range

1) The useful lifetime of the device is 5 (five) years with a duty cycle (t=
hat means, a power-on time) of 100%. A useful
lifetime of 7 (seven) years can be guaranteed for a duty cycle of 70%. For =
both scenarios, it is assumed that the device
will be used for calculations for approximately 5% of the maximum useful li=
fetime.

Is it true? This is disqualification. Industrial equipment should work much=
 longer, 15-20 years. It's not suitable for industrial equipment.
It's good for ink toner cartridge.


Best regards,
Tom





--===============6642728449883351690==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBjbGFzcz0i
bW96LXRleHQtaHRtbCIgbGFuZz0ieC11bmljb2RlIj4NCjxkaXYgY2xhc3M9Im1vei10ZXh0LWh0
bWwiIGxhbmc9IngtdW5pY29kZSI+DQo8ZGl2IGNsYXNzPSJtb3otdGV4dC1odG1sIiBsYW5nPSJ4
LXVuaWNvZGUiPkhpLCA8YnI+DQo8YnI+DQpEbyB5b3Uga25vdyA/PGJyPg0KPGJyPg0KPGJyPg0K
PGJyPg0KRnJvbSBkYXRhIHNoZWV0Ojxicj4NCjxicj4NCjxzcGFuIGNsYXNzPSJmb250c3R5bGUw
Ij5TTEIgOTY3MCBUUE0yLjA8L3NwYW4+IDxiciBzdHlsZT0iDQogICAgICAgICAgICBmb250LXN0
eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudDogbm9ybWFsOyBmb250LXdlaWdodDoNCiAgICAgICAg
ICAgIG5vcm1hbDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsN
CiAgICAgICAgICAgIG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IC13ZWJraXQtYXV0bzsgdGV4dC1p
bmRlbnQ6IDBweDsNCiAgICAgICAgICAgIHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFj
ZTogbm9ybWFsOyB3aWRvd3M6IDI7DQogICAgICAgICAgICB3b3JkLXNwYWNpbmc6IDBweDsgLXdl
YmtpdC10ZXh0LXNpemUtYWRqdXN0OiBhdXRvOw0KICAgICAgICAgICAgLXdlYmtpdC10ZXh0LXN0
cm9rZS13aWR0aDogMHB4OyAiPg0KU0xCIDk2NzAgVENHIEZhbWlseSAyIExldmVsIDAwIFJldi4g
MDEuMTYgRGF0YSBTaGVldCwgUmV2aXNpb24gMS4wLCAyMDE1LTExLTA1Ojxicj4NCjxicj4NCjxi
cj4NCjEuMSBQb3dlciBNYW5hZ2VtZW50PGJyPg0KSW4gdGhlIFNMQiA5NjcwLCBwb3dlciBtYW5h
Z2VtZW50IGlzIGhhbmRsZWQgaW50ZXJuYWxseTsgbm8gZXhwbGljaXQgcG93ZXItZG93biBvciBz
dGFuZGJ5IG1vZGUgaXM8YnI+DQphdmFpbGFibGUuIFRoZSBkZXZpY2UgYXV0b21hdGljYWxseSBl
bnRlcnMgYSBsb3ctcG93ZXIgc3RhdGUgYWZ0ZXIgZWFjaCBzdWNjZXNzZnVsIGNvbW1hbmQvcmVz
cG9uc2U8YnI+DQp0cmFuc2FjdGlvbi4gSWYgYSB0cmFuc2FjdGlvbiBpcyBzdGFydGVkIG9uIHRo
ZSBTUEkgYnVzIGZyb20gdGhlIGhvc3QgcGxhdGZvcm0sIHRoZSBkZXZpY2Ugd2lsbCB3YWtlIGlt
bWVkaWF0ZWx5PGJyPg0KYW5kIHdpbGwgcmV0dXJuIHRvIHRoZSBsb3ctcG93ZXIgbW9kZSBhZnRl
ciB0aGUgdHJhbnNhY3Rpb24gaGFzIGJlZW4gZmluaXNoZWQuPGJyPg0KPGJyPg0KPGJyPg0KNC4y
IEZ1bmN0aW9uYWwgT3BlcmF0aW5nIFJhbmdlPGJyPg0KPGJyPg0KMSkgPGI+VGhlIHVzZWZ1bCBs
aWZldGltZSBvZiB0aGUgZGV2aWNlIGlzIDUgKGZpdmUpIHllYXJzIHdpdGggYSBkdXR5IGN5Y2xl
ICh0aGF0IG1lYW5zLCBhIHBvd2VyLW9uIHRpbWUpIG9mIDEwMCUuIEEgdXNlZnVsPC9iPjxiPjxi
cj4NCjwvYj48Yj5saWZldGltZSBvZiA3IChzZXZlbikgeWVhcnMgY2FuIGJlIGd1YXJhbnRlZWQg
Zm9yIGEgZHV0eSBjeWNsZSBvZiA3MCUuIEZvciBib3RoIHNjZW5hcmlvcywgaXQgaXMgYXNzdW1l
ZCB0aGF0IHRoZSBkZXZpY2U8L2I+PGI+PGJyPg0KPC9iPjxiPndpbGwgYmUgdXNlZCBmb3IgY2Fs
Y3VsYXRpb25zIGZvciBhcHByb3hpbWF0ZWx5IDUlIG9mIHRoZSBtYXhpbXVtIHVzZWZ1bCBsaWZl
dGltZS48L2I+PGI+PGJyPg0KPC9iPjxicj4NCklzIGl0IHRydWU/IFRoaXMgaXMgZGlzcXVhbGlm
aWNhdGlvbi4gSW5kdXN0cmlhbCBlcXVpcG1lbnQgc2hvdWxkIHdvcmsgbXVjaCBsb25nZXIsIDE1
LTIwIHllYXJzLiBJdCdzIG5vdCBzdWl0YWJsZSBmb3IgaW5kdXN0cmlhbCBlcXVpcG1lbnQuPGJy
Pg0KSXQncyBnb29kIGZvciBpbmsgdG9uZXIgY2FydHJpZGdlLjxicj4NCjxicj4NCjxicj4NCkJl
c3QgcmVnYXJkcyw8YnI+DQpUb208YnI+DQo8YnI+DQo8YnI+DQo8YnI+DQo8ZGl2IGNsYXNzPSJt
b3otc2lnbmF0dXJlIj48YnI+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9k
eT4NCjwvaHRtbD4NCg==

--===============6642728449883351690==--

