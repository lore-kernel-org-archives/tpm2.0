Content-Type: multipart/mixed; boundary="===============7037198981547315159=="
MIME-Version: 1.0
From: Muthukumar S <muthu.smk at gmail.com>
Subject: [tpm2] Re: authHandle issues
Date: Wed, 20 May 2020 21:34:35 +0530
Message-ID: <CANGCWd2Up3Lkc=u=bR3VYnOSw0U8AF-BuigKhcQ_eY+FLFhu-Q@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EEFEBF@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7037198981547315159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Roberts,

Thank you for the clarification.

BR,
Muthukumar

On Wed, May 20, 2020, 8:29 PM Roberts, William C <
william.c.roberts(a)intel.com wrote:

>
>
> > -----Original Message-----
> > From: Muthukumar S [mailto:muthu.smk(a)gmail.com]
> > Sent: Wednesday, May 20, 2020 4:29 AM
> > To: tpm2(a)lists.01.org; Roberts, William C <william.c.roberts(a)intel.=
com>
> > Subject: authHandle issues
> >
> > Hi Roberts,
> >
> > Thanks a lot for your response. As per your suggestion , I remember that
> I set
> > "authHandle" as ESYS_TR type. And the test code that I have shared also
> has the
> > same implementation.
> >
> > Below is how I set the "authHandle" , which is of ESYS_TR type and
> passed as
> > argument to below Esys_NV_Read () API.
> >
> > ESYS_TR authHandle =3D 0x40000001;
>
> Just because the C type is an ESYS_TR doesn't mean the value you're
> assigning is
> Correct. You're assigning the raw tpm handle to that ESYS_TR. ESYS doesn't
> understand
> That. You need to assign either:
> 1. The value of nv_index2 (saying authorize me by using the authvalue for
> the nv index)
> 2.  ESYS_TR_RH_OWNER (saying authorize me by using the authvalue of the
> owner)
>
> You can find the definition for ESYS_TR_RH_OWNER here:
>
> https://github.com/tpm2-software/tpm2-tss/blob/master/include/tss2/tss2_e=
sys.h#L54
>
> In retrospect, we should have made ESYS_TR an enum to make this more
> explicit.
>
> > rc =3D Esys_NV_Read(
> >                 ectx,
> >               authHandle,
> >                 nv_index2, /* the nv index to read from */
> >                 ESYS_TR_PASSWORD,
> >                 ESYS_TR_NONE,
> >                 ESYS_TR_NONE,
> >               20,
> >                 0,
> >                 &read_data);
> >                 if (rc !=3D TSS2_RC_SUCCESS) {
> >                         printf("Esys_NV_Read <ERROR>: 0x%x\n", rc);
> >                       goto out;
> >               }
> > Let me know , anything else am I missing?
> >
> > BR,
> > Muthukumar
>

--===============7037198981547315159==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPjxkaXYgZGlyPSJhdXRvIj5IaSBSb2JlcnRzLDwvZGl2PjxkaXYgZGly
PSJhdXRvIj48YnI+PC9kaXY+VGhhbmsgeW91IGZvciB0aGUgY2xhcmlmaWNhdGlvbi7CoDxkaXYg
ZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPkJSLDwvZGl2PjxkaXYgZGlyPSJh
dXRvIj5NdXRodWt1bWFyPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48
ZGl2IGRpcj0ibHRyIj5PbiBXZWQsIE1heSAyMCwgMjAyMCwgODoyOSBQTSBSb2JlcnRzLCBXaWxs
aWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iPndp
bGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4gd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3Rl
IGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0
OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxicj4KPGJyPgomZ3Q7IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7IEZyb206IE11dGh1a3VtYXIgUyBbbWFpbHRvOjxh
IGhyZWY9Im1haWx0bzptdXRodS5zbWtAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJu
b3JlZmVycmVyIj5tdXRodS5zbWtAZ21haWwuY29tPC9hPl08YnI+CiZndDsgU2VudDogV2VkbmVz
ZGF5LCBNYXkgMjAsIDIwMjAgNDoyOSBBTTxicj4KJmd0OyBUbzogPGEgaHJlZj0ibWFpbHRvOnRw
bTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj50cG0yQGxp
c3RzLjAxLm9yZzwvYT47IFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndp
bGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJl
ciI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDsgU3ViamVjdDog
YXV0aEhhbmRsZSBpc3N1ZXM8YnI+CiZndDsgPGJyPgomZ3Q7IEhpIFJvYmVydHMsPGJyPgomZ3Q7
IDxicj4KJmd0OyBUaGFua3MgYSBsb3QgZm9yIHlvdXIgcmVzcG9uc2UuIEFzIHBlciB5b3VyIHN1
Z2dlc3Rpb24gLCBJIHJlbWVtYmVyIHRoYXQgSSBzZXQ8YnI+CiZndDsgJnF1b3Q7YXV0aEhhbmRs
ZSZxdW90OyBhcyBFU1lTX1RSIHR5cGUuIEFuZCB0aGUgdGVzdCBjb2RlIHRoYXQgSSBoYXZlIHNo
YXJlZCBhbHNvIGhhcyB0aGU8YnI+CiZndDsgc2FtZSBpbXBsZW1lbnRhdGlvbi48YnI+CiZndDsg
PGJyPgomZ3Q7IEJlbG93IGlzIGhvdyBJIHNldCB0aGUgJnF1b3Q7YXV0aEhhbmRsZSZxdW90OyAs
IHdoaWNoIGlzIG9mIEVTWVNfVFIgdHlwZSBhbmQgcGFzc2VkIGFzPGJyPgomZ3Q7IGFyZ3VtZW50
IHRvIGJlbG93IEVzeXNfTlZfUmVhZCAoKSBBUEkuPGJyPgomZ3Q7IDxicj4KJmd0OyBFU1lTX1RS
IGF1dGhIYW5kbGUgPSAweDQwMDAwMDAxOzxicj4KPGJyPgpKdXN0IGJlY2F1c2UgdGhlIEMgdHlw
ZSBpcyBhbiBFU1lTX1RSIGRvZXNuJiMzOTt0IG1lYW4gdGhlIHZhbHVlIHlvdSYjMzk7cmUgYXNz
aWduaW5nIGlzPGJyPgpDb3JyZWN0LiBZb3UmIzM5O3JlIGFzc2lnbmluZyB0aGUgcmF3IHRwbSBo
YW5kbGUgdG8gdGhhdCBFU1lTX1RSLiBFU1lTIGRvZXNuJiMzOTt0IHVuZGVyc3RhbmQ8YnI+ClRo
YXQuIFlvdSBuZWVkIHRvIGFzc2lnbiBlaXRoZXI6PGJyPgoxLiBUaGUgdmFsdWUgb2YgbnZfaW5k
ZXgyIChzYXlpbmcgYXV0aG9yaXplIG1lIGJ5IHVzaW5nIHRoZSBhdXRodmFsdWUgZm9yIHRoZSBu
diBpbmRleCk8YnI+CjIuwqAgRVNZU19UUl9SSF9PV05FUiAoc2F5aW5nIGF1dGhvcml6ZSBtZSBi
eSB1c2luZyB0aGUgYXV0aHZhbHVlIG9mIHRoZSBvd25lcik8YnI+Cjxicj4KWW91IGNhbiBmaW5k
IHRoZSBkZWZpbml0aW9uIGZvciBFU1lTX1RSX1JIX09XTkVSIGhlcmU6PGJyPgo8YSBocmVmPSJo
dHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy9ibG9iL21hc3Rlci9pbmNs
dWRlL3RzczIvdHNzMl9lc3lzLmgjTDU0IiByZWw9Im5vcmVmZXJyZXIgbm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzL2Js
b2IvbWFzdGVyL2luY2x1ZGUvdHNzMi90c3MyX2VzeXMuaCNMNTQ8L2E+PGJyPgo8YnI+CkluIHJl
dHJvc3BlY3QsIHdlIHNob3VsZCBoYXZlIG1hZGUgRVNZU19UUiBhbiBlbnVtIHRvIG1ha2UgdGhp
cyBtb3JlIGV4cGxpY2l0Ljxicj4KPGJyPgomZ3Q7IHJjID0gRXN5c19OVl9SZWFkKDxicj4KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZWN0eCw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGF1dGhIYW5kbGUsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBudl9p
bmRleDIsIC8qIHRoZSBudiBpbmRleCB0byByZWFkIGZyb20gKi88YnI+CiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoEVTWVNfVFJfUEFTU1dPUkQsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBFU1lTX1RSX05PTkUsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBFU1lTX1RSX05PTkUsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAyMCw8YnI+CiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDAsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmYW1wO3JlYWRfZGF0YSk7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBpZiAocmMgIT0gVFNTMl9SQ19TVUNDRVNTKSB7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7RXN5c19OVl9SZWFkICZsdDtFUlJPUiZn
dDs6IDB4JXhcbiZxdW90OywgcmMpOzxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZ290byBvdXQ7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPgom
Z3Q7IExldCBtZSBrbm93ICwgYW55dGhpbmcgZWxzZSBhbSBJIG1pc3Npbmc/PGJyPgomZ3Q7IDxi
cj4KJmd0OyBCUiw8YnI+CiZndDsgTXV0aHVrdW1hcjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============7037198981547315159==--

