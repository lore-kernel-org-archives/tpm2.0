Content-Type: multipart/mixed; boundary="===============7439925634079916133=="
MIME-Version: 1.0
From: Muthukumar S <muthu.smk at gmail.com>
Subject: [tpm2] Re: authHandle issues
Date: Thu, 21 May 2020 14:14:04 +0530
Message-ID: <CANGCWd0yY9OeT7u8oGxTSUhGHM+8AJEwLbzn7uSXhTN-Awr6uw@mail.gmail.com>
In-Reply-To: CANGCWd2Up3Lkc=u=bR3VYnOSw0U8AF-BuigKhcQ_eY+FLFhu-Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7439925634079916133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Roberts,

After adding RH_OWNER macro directly, I could able to read the offset which
has data written via tpm2_nvread() tool application.

Once again thanks a lot for sharing the inputs. Now j will be trying to
write using my app in to different offset with random number generated
using TPM  and will read it back from my application.

BR,
Muthukumar



On Wed, May 20, 2020, 9:34 PM Muthukumar S <muthu.smk(a)gmail.com wrote:

> Hi Roberts,
>
> Thank you for the clarification.
>
> BR,
> Muthukumar
>
> On Wed, May 20, 2020, 8:29 PM Roberts, William C <
> william.c.roberts(a)intel.com wrote:
>
>>
>>
>> > -----Original Message-----
>> > From: Muthukumar S [mailto:muthu.smk(a)gmail.com]
>> > Sent: Wednesday, May 20, 2020 4:29 AM
>> > To: tpm2(a)lists.01.org; Roberts, William C <william.c.roberts(a)intel=
.com>
>> > Subject: authHandle issues
>> >
>> > Hi Roberts,
>> >
>> > Thanks a lot for your response. As per your suggestion , I remember
>> that I set
>> > "authHandle" as ESYS_TR type. And the test code that I have shared also
>> has the
>> > same implementation.
>> >
>> > Below is how I set the "authHandle" , which is of ESYS_TR type and
>> passed as
>> > argument to below Esys_NV_Read () API.
>> >
>> > ESYS_TR authHandle =3D 0x40000001;
>>
>> Just because the C type is an ESYS_TR doesn't mean the value you're
>> assigning is
>> Correct. You're assigning the raw tpm handle to that ESYS_TR. ESYS
>> doesn't understand
>> That. You need to assign either:
>> 1. The value of nv_index2 (saying authorize me by using the authvalue for
>> the nv index)
>> 2.  ESYS_TR_RH_OWNER (saying authorize me by using the authvalue of the
>> owner)
>>
>> You can find the definition for ESYS_TR_RH_OWNER here:
>>
>> https://github.com/tpm2-software/tpm2-tss/blob/master/include/tss2/tss2_=
esys.h#L54
>>
>> In retrospect, we should have made ESYS_TR an enum to make this more
>> explicit.
>>
>> > rc =3D Esys_NV_Read(
>> >                 ectx,
>> >               authHandle,
>> >                 nv_index2, /* the nv index to read from */
>> >                 ESYS_TR_PASSWORD,
>> >                 ESYS_TR_NONE,
>> >                 ESYS_TR_NONE,
>> >               20,
>> >                 0,
>> >                 &read_data);
>> >                 if (rc !=3D TSS2_RC_SUCCESS) {
>> >                         printf("Esys_NV_Read <ERROR>: 0x%x\n", rc);
>> >                       goto out;
>> >               }
>> > Let me know , anything else am I missing?
>> >
>> > BR,
>> > Muthukumar
>>
>

--===============7439925634079916133==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPkhpIFJvYmVydHMsPGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2
IGRpcj0iYXV0byI+QWZ0ZXIgYWRkaW5nIFJIX09XTkVSIG1hY3JvIGRpcmVjdGx5LCBJIGNvdWxk
IGFibGUgdG8gcmVhZCB0aGUgb2Zmc2V0IHdoaWNoIGhhcyBkYXRhIHdyaXR0ZW4gdmlhIHRwbTJf
bnZyZWFkKCkgdG9vbCBhcHBsaWNhdGlvbi48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2
PjxkaXYgZGlyPSJhdXRvIj5PbmNlIGFnYWluIHRoYW5rcyBhIGxvdCBmb3Igc2hhcmluZyB0aGUg
aW5wdXRzLiBOb3cgaiB3aWxsIGJlIHRyeWluZyB0byB3cml0ZSB1c2luZyBteSBhcHAgaW4gdG8g
ZGlmZmVyZW50IG9mZnNldCB3aXRoIHJhbmRvbSBudW1iZXIgZ2VuZXJhdGVkIHVzaW5nIFRQTcKg
IGFuZCB3aWxsIHJlYWQgaXQgYmFjayBmcm9tIG15IGFwcGxpY2F0aW9uLjwvZGl2PjxkaXYgZGly
PSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPkJSLDwvZGl2PjxkaXYgZGlyPSJhdXRv
Ij5NdXRodWt1bWFyPC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0
byI+PGJyPjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9
Imx0ciI+T24gV2VkLCBNYXkgMjAsIDIwMjAsIDk6MzQgUE0gTXV0aHVrdW1hciBTICZsdDs8YSBo
cmVmPSJtYWlsdG86bXV0aHUuc21rQGdtYWlsLmNvbSI+bXV0aHUuc21rQGdtYWlsLmNvbTwvYT4g
d3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDox
ZXgiPjxkaXYgZGlyPSJhdXRvIj48ZGl2IGRpcj0iYXV0byI+SGkgUm9iZXJ0cyw8L2Rpdj48ZGl2
IGRpcj0iYXV0byI+PGJyPjwvZGl2PlRoYW5rIHlvdSBmb3IgdGhlIGNsYXJpZmljYXRpb24uwqA8
ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5CUiw8L2Rpdj48ZGl2IGRp
cj0iYXV0byI+TXV0aHVrdW1hcjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90
ZSI+PGRpdiBkaXI9Imx0ciI+T24gV2VkLCBNYXkgMjAsIDIwMjAsIDg6MjkgUE0gUm9iZXJ0cywg
V2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb208L2E+IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRk
aW5nLWxlZnQ6MWV4Ij48YnI+Cjxicj4KJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxi
cj4KJmd0OyBGcm9tOiBNdXRodWt1bWFyIFMgW21haWx0bzo8YSBocmVmPSJtYWlsdG86bXV0aHUu
c21rQGdtYWlsLmNvbSIgcmVsPSJub3JlZmVycmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5tdXRodS5zbWtAZ21haWwuY29tPC9hPl08YnI+CiZndDsgU2VudDogV2VkbmVzZGF5LCBNYXkg
MjAsIDIwMjAgNDoyOSBBTTxicj4KJmd0OyBUbzogPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMu
MDEub3JnIiByZWw9Im5vcmVmZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJA
bGlzdHMuMDEub3JnPC9hPjsgUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86
d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiByZWw9Im5vcmVmZXJyZXIgbm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgom
Z3Q7IFN1YmplY3Q6IGF1dGhIYW5kbGUgaXNzdWVzPGJyPgomZ3Q7IDxicj4KJmd0OyBIaSBSb2Jl
cnRzLDxicj4KJmd0OyA8YnI+CiZndDsgVGhhbmtzIGEgbG90IGZvciB5b3VyIHJlc3BvbnNlLiBB
cyBwZXIgeW91ciBzdWdnZXN0aW9uICwgSSByZW1lbWJlciB0aGF0IEkgc2V0PGJyPgomZ3Q7ICZx
dW90O2F1dGhIYW5kbGUmcXVvdDsgYXMgRVNZU19UUiB0eXBlLiBBbmQgdGhlIHRlc3QgY29kZSB0
aGF0IEkgaGF2ZSBzaGFyZWQgYWxzbyBoYXMgdGhlPGJyPgomZ3Q7IHNhbWUgaW1wbGVtZW50YXRp
b24uPGJyPgomZ3Q7IDxicj4KJmd0OyBCZWxvdyBpcyBob3cgSSBzZXQgdGhlICZxdW90O2F1dGhI
YW5kbGUmcXVvdDsgLCB3aGljaCBpcyBvZiBFU1lTX1RSIHR5cGUgYW5kIHBhc3NlZCBhczxicj4K
Jmd0OyBhcmd1bWVudCB0byBiZWxvdyBFc3lzX05WX1JlYWQgKCkgQVBJLjxicj4KJmd0OyA8YnI+
CiZndDsgRVNZU19UUiBhdXRoSGFuZGxlID0gMHg0MDAwMDAwMTs8YnI+Cjxicj4KSnVzdCBiZWNh
dXNlIHRoZSBDIHR5cGUgaXMgYW4gRVNZU19UUiBkb2VzbiYjMzk7dCBtZWFuIHRoZSB2YWx1ZSB5
b3UmIzM5O3JlIGFzc2lnbmluZyBpczxicj4KQ29ycmVjdC4gWW91JiMzOTtyZSBhc3NpZ25pbmcg
dGhlIHJhdyB0cG0gaGFuZGxlIHRvIHRoYXQgRVNZU19UUi4gRVNZUyBkb2VzbiYjMzk7dCB1bmRl
cnN0YW5kPGJyPgpUaGF0LiBZb3UgbmVlZCB0byBhc3NpZ24gZWl0aGVyOjxicj4KMS4gVGhlIHZh
bHVlIG9mIG52X2luZGV4MiAoc2F5aW5nIGF1dGhvcml6ZSBtZSBieSB1c2luZyB0aGUgYXV0aHZh
bHVlIGZvciB0aGUgbnYgaW5kZXgpPGJyPgoyLsKgIEVTWVNfVFJfUkhfT1dORVIgKHNheWluZyBh
dXRob3JpemUgbWUgYnkgdXNpbmcgdGhlIGF1dGh2YWx1ZSBvZiB0aGUgb3duZXIpPGJyPgo8YnI+
CllvdSBjYW4gZmluZCB0aGUgZGVmaW5pdGlvbiBmb3IgRVNZU19UUl9SSF9PV05FUiBoZXJlOjxi
cj4KPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3MvYmxv
Yi9tYXN0ZXIvaW5jbHVkZS90c3MyL3RzczJfZXN5cy5oI0w1NCIgcmVsPSJub3JlZmVycmVyIG5v
cmVmZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90
cG0yLXNvZnR3YXJlL3RwbTItdHNzL2Jsb2IvbWFzdGVyL2luY2x1ZGUvdHNzMi90c3MyX2VzeXMu
aCNMNTQ8L2E+PGJyPgo8YnI+CkluIHJldHJvc3BlY3QsIHdlIHNob3VsZCBoYXZlIG1hZGUgRVNZ
U19UUiBhbiBlbnVtIHRvIG1ha2UgdGhpcyBtb3JlIGV4cGxpY2l0Ljxicj4KPGJyPgomZ3Q7IHJj
ID0gRXN5c19OVl9SZWFkKDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZWN0eCw8
YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF1dGhIYW5kbGUsPGJyPgomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBudl9pbmRleDIsIC8qIHRoZSBudiBpbmRleCB0byByZWFkIGZy
b20gKi88YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEVTWVNfVFJfUEFTU1dPUkQs
PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBFU1lTX1RSX05PTkUsPGJyPgomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBFU1lTX1RSX05PTkUsPGJyPgomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAyMCw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDAsPGJy
PgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmYW1wO3JlYWRfZGF0YSk7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmMgIT0gVFNTMl9SQ19TVUNDRVNTKSB7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7
RXN5c19OVl9SZWFkICZsdDtFUlJPUiZndDs6IDB4JXhcbiZxdW90OywgcmMpOzxicj4KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBvdXQ7PGJyPgomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9PGJyPgomZ3Q7IExldCBtZSBrbm93ICwgYW55dGhpbmcgZWxzZSBh
bSBJIG1pc3Npbmc/PGJyPgomZ3Q7IDxicj4KJmd0OyBCUiw8YnI+CiZndDsgTXV0aHVrdW1hcjxi
cj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============7439925634079916133==--

