Content-Type: multipart/mixed; boundary="===============5925963114867979020=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Mon, 16 Mar 2020 15:42:41 -0700
Message-ID: <CAP3jAwTDkp+V7yLYipszy562ETNsnvTfXsDw35Lvi2C-9xeuSA@mail.gmail.com>
In-Reply-To: CAP3jAwSmMS_kGF_K2EgCxHxAG7XSR+Otj+0H+_eCcTkXR7pANw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5925963114867979020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

One last attempt...wondering if AK needs to be loaded in this case
Thread 1 in client .. creates EK and AK and sends to server
Server creates credential externally sends secret and credential blob
Thread 2 in client - Calls ActivateCredential (it has access to the global
ESYS_CONTEXT structures, ak_handles and ek_handles that thread 1 created)

Question: Are AK keys still present in the TPM? Will the ESAPI structures
still work even after few seconds or are they flushed?
I'm trying to understand why if I run all these methods in a single thread,
it works!

Thanks
Rahul

On Fri, Mar 13, 2020 at 10:22 AM Rahul Hardikar <rahulhardikar(a)gmail.com>
wrote:

> Any idea folks?
>
> On Thu, Mar 12, 2020 at 5:52 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
> wrote:
>
>> I noticed the same changes when its run as a single process, the remote
>> attestation method works, the moment i move the make external credential
>> part to the server I hit this issue.
>> Wondering what could go wrong? Do the AK keys get flushed out?
>> On the client side, I have the EKCERT and EK and AK keys loaded in the
>> tpm2, I save the handle of EK and AK for future use when I receive the
>> credential blob and secret, so basically i fork out a thread to send the
>> data (and create EK/AK) and then fork another thread to handle the
>> receive part, but EK/AK handles are global and saved and no other process
>> touches the TPM!
>>
>> Why would I get 0x2c4 in Esys_ActivateCredential ()  but works perfectly
>> fine when everything is run as one thread?
>>
>> Thanks,
>> Rahul
>>
>> On Tue, Mar 10, 2020 at 4:22 PM Rahul Hardikar <rahulhardikar(a)gmail.co=
m>
>> wrote:
>>
>>> Thanks Bill.
>>> Wondering why this would fail. The external make credential API,  I have
>>> taken from tss2 GitHub only why would secret fail? When I ran all of th=
is
>>> locally it worked, the moment I moved the make external credential to t=
he
>>> server Im hitting this?
>>> Can it be because of OpenSSL 1.1.0 required in tss2 and 1.0.2 version
>>> running on my server?
>>> Thanks
>>> Rahul
>>>
>>> On Tue, Mar 10, 2020 at 3:36 PM Roberts, William C <
>>> william.c.roberts(a)intel.com> wrote:
>>>
>>>> The error codes encode a bunch of values, so you won't see that value
>>>> via a straight grep.
>>>>
>>>> But you can use tpm2_rc_decode from the tpm2-tools project, like so:
>>>> $ tpm2_rc_decode 0x2c4
>>>> tpm:parameter(2):value is out of range or is not correct for the contex
>>>>
>>>> See the tools project:
>>>> https://github.com/tpm2-software/tpm2-tools
>>>>
>>>> Note that the commands specification will show you what parameter 2 is:
>>>>
>>>> https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-=
3-Commands-01.38.pdf
>>>>
>>>> Everything after the triple line starts the parameters starting at
>>>> index 1.
>>>> So in this case the secret parameter is wrong.
>>>>
>>>> Note that since TSS version 2.3.0 a software library was also added
>>>> for converting these return codes to more human understandable strings,
>>>> The header file is here:
>>>>
>>>> https://github.com/tpm2-software/tpm2-tss/blob/master/include/tss2/tss=
2_rc.h
>>>>
>>>> and then you just link against lib tss2-rc, just in case you needed
>>>> this built into
>>>> your program.
>>>>
>>>> Bill
>>>>
>>>> > -----Original Message-----
>>>> > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
>>>> > Sent: Tuesday, March 10, 2020 5:02 PM
>>>> > To: tpm2(a)lists.01.org
>>>> > Subject: [tpm2] ESys_ActivateCredential
>>>> >
>>>> >
>>>> > Hi All,
>>>> > What does it mean when Esys_ActivateCredential returns 0x2c4? I don't
>>>> see this
>>>> > error defined anywhere.
>>>> >
>>>> > Thanks,
>>>> > Rahul
>>>>
>>>

--===============5925963114867979020==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+T25lIGxhc3QgYXR0ZW1wdC4uLndvbmRlcmluZyBpZiBBSyBuZWVkcyB0
byBiZSBsb2FkZWQgaW4gdGhpcyBjYXNlPGRpdj5UaHJlYWQgMSBpbiBjbGllbnQgLi4gY3JlYXRl
cyBFSyBhbmQgQUsgYW5kIHNlbmRzIHRvIHNlcnZlcjwvZGl2PjxkaXY+U2VydmVyIGNyZWF0ZXMg
Y3JlZGVudGlhbCBleHRlcm5hbGx5IHNlbmRzIHNlY3JldCBhbmQgY3JlZGVudGlhbCBibG9iPC9k
aXY+PGRpdj5UaHJlYWQgMiBpbiBjbGllbnQgLSBDYWxscyBBY3RpdmF0ZUNyZWRlbnRpYWwgKGl0
IGhhcyBhY2Nlc3MgdG8gdGhlIGdsb2JhbCBFU1lTX0NPTlRFWFQgc3RydWN0dXJlcywgYWtfaGFu
ZGxlcyBhbmQgZWtfaGFuZGxlcyB0aGF0IHRocmVhZCAxIGNyZWF0ZWQpPC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5RdWVzdGlvbjogQXJlIEFLIGtleXMgc3RpbGwgcHJlc2VudCBpbiB0aGUgVFBN
PyBXaWxsIHRoZSBFU0FQSSBzdHJ1Y3R1cmVzIHN0aWxsIHdvcmsgZXZlbiBhZnRlciBmZXcgc2Vj
b25kcyBvciBhcmUgdGhleSBmbHVzaGVkPzwvZGl2PjxkaXY+SSYjMzk7bSB0cnlpbmcgdG8gdW5k
ZXJzdGFuZCB3aHkgaWYgSSBydW4gYWxsIHRoZXNlIG1ldGhvZHMgaW4gYSBzaW5nbGUgdGhyZWFk
LCBpdCB3b3JrcyE8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rczwvZGl2PjxkaXY+UmFo
dWw8L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIi
IGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBGcmksIE1hciAxMywgMjAyMCBhdCAxMDoyMiBBTSBSYWh1
bCBIYXJkaWthciAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIj5y
YWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9y
ZGVyLWxlZnQtd2lkdGg6MXB4O2JvcmRlci1sZWZ0LXN0eWxlOnNvbGlkO2JvcmRlci1sZWZ0LWNv
bG9yOnJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+QW55
IGlkZWEgZm9sa3M/PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0i
bHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgNTo1MiBQTSBS
YWh1bCBIYXJkaWthciAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8
YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1zdHlsZTpz
b2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgi
PjxkaXYgZGlyPSJsdHIiPkkgbm90aWNlZCB0aGUgc2FtZSBjaGFuZ2VzIHdoZW4gaXRzIHJ1biBh
cyBhIHNpbmdsZSBwcm9jZXNzLCB0aGUgcmVtb3RlIGF0dGVzdGF0aW9uIG1ldGhvZCB3b3Jrcywg
dGhlIG1vbWVudCBpIG1vdmUgdGhlIG1ha2UgZXh0ZXJuYWwgY3JlZGVudGlhbCBwYXJ0IHRvIHRo
ZSBzZXJ2ZXIgSSBoaXQgdGhpcyBpc3N1ZS48ZGl2PldvbmRlcmluZyB3aGF0IGNvdWxkIGdvIHdy
b25nPyBEbyB0aGUgQUsga2V5cyBnZXQgZmx1c2hlZCBvdXQ/wqA8L2Rpdj48ZGl2Pk9uIHRoZSBj
bGllbnQgc2lkZSwgSSBoYXZlIHRoZSBFS0NFUlQgYW5kIEVLIGFuZCBBSyBrZXlzIGxvYWRlZCBp
biB0aGUgdHBtMiwgSSBzYXZlIHRoZSBoYW5kbGUgb2YgRUsgYW5kIEFLIGZvcsKgZnV0dXJlIHVz
ZSB3aGVuIEkgcmVjZWl2ZSB0aGUgY3JlZGVudGlhbCBibG9iIGFuZCBzZWNyZXQsIHNvIGJhc2lj
YWxseSBpIGZvcmsgb3V0IGEgdGhyZWFkIHRvIHNlbmQgdGhlIGRhdGEgKGFuZCBjcmVhdGUgRUsv
QUspIGFuZCB0aGVuIGZvcmsgYW5vdGhlciB0aHJlYWQgdG8gaGFuZGxlIHRoZSByZWNlaXZlwqBw
YXJ0LCBidXQgRUsvQUsgaGFuZGxlcyBhcmUgZ2xvYmFsIGFuZCBzYXZlZCBhbmQgbm8gb3RoZXIg
cHJvY2VzcyB0b3VjaGVzIHRoZSBUUE0hPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5XaHkgd291
bGQgSSBnZXQgMHgyYzQgaW4gRXN5c19BY3RpdmF0ZUNyZWRlbnRpYWwgKCkgwqBidXQgd29ya3Mg
cGVyZmVjdGx5IGZpbmUgd2hlbiBldmVyeXRoaW5nIGlzIHJ1biBhcyBvbmUgdGhyZWFkPzwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmtzLDwvZGl2PjxkaXY+UmFodWw8L2Rpdj48L2Rpdj48
YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9h
dHRyIj5PbiBUdWUsIE1hciAxMCwgMjAyMCBhdCA0OjIyIFBNIFJhaHVsIEhhcmRpa2FyICZsdDs8
YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5y
YWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9y
ZGVyLWxlZnQtd2lkdGg6MXB4O2JvcmRlci1sZWZ0LXN0eWxlOnNvbGlkO2JvcmRlci1sZWZ0LWNv
bG9yOnJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+VGhh
bmtzIEJpbGwuPGRpdj5Xb25kZXJpbmcgd2h5IHRoaXMgd291bGQgZmFpbC4gVGhlIGV4dGVybmFs
IG1ha2UgY3JlZGVudGlhbCBBUEksIMKgSSBoYXZlIHRha2VuIGZyb20gdHNzMiBHaXRIdWIgb25s
eSB3aHkgd291bGQgc2VjcmV0IGZhaWw/IFdoZW4gSSByYW4gYWxsIG9mIHRoaXMgbG9jYWxseSBp
dCB3b3JrZWQsIHRoZSBtb21lbnQgSSBtb3ZlZCB0aGUgbWFrZSBleHRlcm5hbCBjcmVkZW50aWFs
IHRvIHRoZSBzZXJ2ZXIgSW0gaGl0dGluZyB0aGlzPzwvZGl2PjxkaXY+Q2FuIGl0IGJlIGJlY2F1
c2Ugb2YgT3BlblNTTCAxLjEuMCByZXF1aXJlZCBpbiB0c3MyIGFuZCAxLjAuMiB2ZXJzaW9uIHJ1
bm5pbmcgb24gbXkgc2VydmVyPzwvZGl2PjxkaXY+VGhhbmtzPC9kaXY+PGRpdj5SYWh1bDwvZGl2
PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9
ImdtYWlsX2F0dHIiPk9uIFR1ZSwgTWFyIDEwLCAyMDIwIGF0IDM6MzYgUE0gUm9iZXJ0cywgV2ls
bGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6
PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjow
cHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdC13aWR0aDoxcHg7Ym9yZGVyLWxlZnQtc3R5bGU6
c29saWQ7Ym9yZGVyLWxlZnQtY29sb3I6cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4
Ij5UaGUgZXJyb3IgY29kZXMgZW5jb2RlIGEgYnVuY2ggb2YgdmFsdWVzLCBzbyB5b3Ugd29uJiMz
OTt0IHNlZSB0aGF0IHZhbHVlIHZpYSBhIHN0cmFpZ2h0IGdyZXAuPGJyPgo8YnI+CkJ1dCB5b3Ug
Y2FuIHVzZSB0cG0yX3JjX2RlY29kZSBmcm9tIHRoZSB0cG0yLXRvb2xzIHByb2plY3QsIGxpa2Ug
c286PGJyPgokIHRwbTJfcmNfZGVjb2RlIDB4MmM0PGJyPgp0cG06cGFyYW1ldGVyKDIpOnZhbHVl
IGlzIG91dCBvZiByYW5nZSBvciBpcyBub3QgY29ycmVjdCBmb3IgdGhlIGNvbnRleDxicj4KPGJy
PgpTZWUgdGhlIHRvb2xzIHByb2plY3Q6PGJyPgo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
dHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzPC9hPjxicj4KPGJy
PgpOb3RlIHRoYXQgdGhlIGNvbW1hbmRzIHNwZWNpZmljYXRpb24gd2lsbCBzaG93IHlvdSB3aGF0
IHBhcmFtZXRlciAyIGlzOjxicj4KPGEgaHJlZj0iaHR0cHM6Ly90cnVzdGVkY29tcHV0aW5nZ3Jv
dXAub3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy9UUE0tUmV2LTIuMC1QYXJ0LTMtQ29tbWFuZHMtMDEu
MzgucGRmIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3RydXN0ZWRj
b21wdXRpbmdncm91cC5vcmcvd3AtY29udGVudC91cGxvYWRzL1RQTS1SZXYtMi4wLVBhcnQtMy1D
b21tYW5kcy0wMS4zOC5wZGY8L2E+PGJyPgo8YnI+CkV2ZXJ5dGhpbmcgYWZ0ZXIgdGhlIHRyaXBs
ZSBsaW5lIHN0YXJ0cyB0aGUgcGFyYW1ldGVycyBzdGFydGluZyBhdCBpbmRleCAxLjxicj4KU28g
aW4gdGhpcyBjYXNlIHRoZSBzZWNyZXQgcGFyYW1ldGVyIGlzIHdyb25nLjxicj4KPGJyPgpOb3Rl
IHRoYXQgc2luY2UgVFNTIHZlcnNpb24gMi4zLjAgYSBzb2Z0d2FyZSBsaWJyYXJ5IHdhcyBhbHNv
IGFkZGVkPGJyPgpmb3IgY29udmVydGluZyB0aGVzZSByZXR1cm4gY29kZXMgdG8gbW9yZSBodW1h
biB1bmRlcnN0YW5kYWJsZSBzdHJpbmdzLDxicj4KVGhlIGhlYWRlciBmaWxlIGlzIGhlcmU6PGJy
Pgo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy9ibG9i
L21hc3Rlci9pbmNsdWRlL3RzczIvdHNzMl9yYy5oIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy9ibG9iL21h
c3Rlci9pbmNsdWRlL3RzczIvdHNzMl9yYy5oPC9hPjxicj4KPGJyPgphbmQgdGhlbiB5b3UganVz
dCBsaW5rIGFnYWluc3QgbGliIHRzczItcmMsIGp1c3QgaW4gY2FzZSB5b3UgbmVlZGVkIHRoaXMg
YnVpbHQgaW50bzxicj4KeW91ciBwcm9ncmFtLjxicj4KPGJyPgpCaWxsPGJyPgo8YnI+CiZndDsg
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+CiZndDsgRnJvbTogUmFodWwgSGFyZGlrYXIg
W21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0i
X2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT5dPGJyPgomZ3Q7IFNlbnQ6IFR1ZXNk
YXksIE1hcmNoIDEwLCAyMDIwIDU6MDIgUE08YnI+CiZndDsgVG86IDxhIGhyZWY9Im1haWx0bzp0
cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxi
cj4KJmd0OyBTdWJqZWN0OiBbdHBtMl0gRVN5c19BY3RpdmF0ZUNyZWRlbnRpYWw8YnI+CiZndDsg
PGJyPgomZ3Q7IDxicj4KJmd0OyBIaSBBbGwsPGJyPgomZ3Q7IFdoYXQgZG9lcyBpdCBtZWFuIHdo
ZW4gRXN5c19BY3RpdmF0ZUNyZWRlbnRpYWwgcmV0dXJucyAweDJjND8gSSBkb24mIzM5O3Qgc2Vl
IHRoaXM8YnI+CiZndDsgZXJyb3IgZGVmaW5lZCBhbnl3aGVyZS48YnI+CiZndDsgPGJyPgomZ3Q7
IFRoYW5rcyw8YnI+CiZndDsgUmFodWw8YnI+CjwvYmxvY2txdW90ZT48L2Rpdj4KPC9ibG9ja3F1
b3RlPjwvZGl2Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============5925963114867979020==--

