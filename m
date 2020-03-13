Content-Type: multipart/mixed; boundary="===============1663318772379052661=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Fri, 13 Mar 2020 10:22:09 -0700
Message-ID: <CAP3jAwSmMS_kGF_K2EgCxHxAG7XSR+Otj+0H+_eCcTkXR7pANw@mail.gmail.com>
In-Reply-To: CAP3jAwSkRWGYRGD_Rowqab17ob071UeUMsV0YXtAX5Q9Y2gQNw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1663318772379052661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Any idea folks?

On Thu, Mar 12, 2020 at 5:52 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
wrote:

> I noticed the same changes when its run as a single process, the remote
> attestation method works, the moment i move the make external credential
> part to the server I hit this issue.
> Wondering what could go wrong? Do the AK keys get flushed out?
> On the client side, I have the EKCERT and EK and AK keys loaded in the
> tpm2, I save the handle of EK and AK for future use when I receive the
> credential blob and secret, so basically i fork out a thread to send the
> data (and create EK/AK) and then fork another thread to handle the
> receive part, but EK/AK handles are global and saved and no other process
> touches the TPM!
>
> Why would I get 0x2c4 in Esys_ActivateCredential ()  but works perfectly
> fine when everything is run as one thread?
>
> Thanks,
> Rahul
>
> On Tue, Mar 10, 2020 at 4:22 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
> wrote:
>
>> Thanks Bill.
>> Wondering why this would fail. The external make credential API,  I have
>> taken from tss2 GitHub only why would secret fail? When I ran all of this
>> locally it worked, the moment I moved the make external credential to the
>> server Im hitting this?
>> Can it be because of OpenSSL 1.1.0 required in tss2 and 1.0.2 version
>> running on my server?
>> Thanks
>> Rahul
>>
>> On Tue, Mar 10, 2020 at 3:36 PM Roberts, William C <
>> william.c.roberts(a)intel.com> wrote:
>>
>>> The error codes encode a bunch of values, so you won't see that value
>>> via a straight grep.
>>>
>>> But you can use tpm2_rc_decode from the tpm2-tools project, like so:
>>> $ tpm2_rc_decode 0x2c4
>>> tpm:parameter(2):value is out of range or is not correct for the contex
>>>
>>> See the tools project:
>>> https://github.com/tpm2-software/tpm2-tools
>>>
>>> Note that the commands specification will show you what parameter 2 is:
>>>
>>> https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-3=
-Commands-01.38.pdf
>>>
>>> Everything after the triple line starts the parameters starting at index
>>> 1.
>>> So in this case the secret parameter is wrong.
>>>
>>> Note that since TSS version 2.3.0 a software library was also added
>>> for converting these return codes to more human understandable strings,
>>> The header file is here:
>>>
>>> https://github.com/tpm2-software/tpm2-tss/blob/master/include/tss2/tss2=
_rc.h
>>>
>>> and then you just link against lib tss2-rc, just in case you needed this
>>> built into
>>> your program.
>>>
>>> Bill
>>>
>>> > -----Original Message-----
>>> > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
>>> > Sent: Tuesday, March 10, 2020 5:02 PM
>>> > To: tpm2(a)lists.01.org
>>> > Subject: [tpm2] ESys_ActivateCredential
>>> >
>>> >
>>> > Hi All,
>>> > What does it mean when Esys_ActivateCredential returns 0x2c4? I don't
>>> see this
>>> > error defined anywhere.
>>> >
>>> > Thanks,
>>> > Rahul
>>>
>>

--===============1663318772379052661==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+QW55IGlkZWEgZm9sa3M/PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVGh1LCBNYXIgMTIs
IDIwMjAgYXQgNTo1MiBQTSBSYWh1bCBIYXJkaWthciAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhaHVs
aGFyZGlrYXJAZ21haWwuY29tIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3Rl
Ojxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46
MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQtd2lkdGg6MXB4O2JvcmRlci1sZWZ0LXN0eWxl
OnNvbGlkO2JvcmRlci1sZWZ0LWNvbG9yOnJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFl
eCI+PGRpdiBkaXI9Imx0ciI+SSBub3RpY2VkIHRoZSBzYW1lIGNoYW5nZXMgd2hlbiBpdHMgcnVu
IGFzIGEgc2luZ2xlIHByb2Nlc3MsIHRoZSByZW1vdGUgYXR0ZXN0YXRpb24gbWV0aG9kIHdvcmtz
LCB0aGUgbW9tZW50IGkgbW92ZSB0aGUgbWFrZSBleHRlcm5hbCBjcmVkZW50aWFsIHBhcnQgdG8g
dGhlIHNlcnZlciBJIGhpdCB0aGlzIGlzc3VlLjxkaXY+V29uZGVyaW5nIHdoYXQgY291bGQgZ28g
d3Jvbmc/IERvIHRoZSBBSyBrZXlzIGdldCBmbHVzaGVkIG91dD/CoDwvZGl2PjxkaXY+T24gdGhl
IGNsaWVudCBzaWRlLCBJIGhhdmUgdGhlIEVLQ0VSVCBhbmQgRUsgYW5kIEFLIGtleXMgbG9hZGVk
IGluIHRoZSB0cG0yLCBJIHNhdmUgdGhlIGhhbmRsZSBvZiBFSyBhbmQgQUsgZm9ywqBmdXR1cmUg
dXNlIHdoZW4gSSByZWNlaXZlIHRoZSBjcmVkZW50aWFsIGJsb2IgYW5kIHNlY3JldCwgc28gYmFz
aWNhbGx5IGkgZm9yayBvdXQgYSB0aHJlYWQgdG8gc2VuZCB0aGUgZGF0YSAoYW5kIGNyZWF0ZSBF
Sy9BSykgYW5kIHRoZW4gZm9yayBhbm90aGVyIHRocmVhZCB0byBoYW5kbGUgdGhlIHJlY2VpdmXC
oHBhcnQsIGJ1dCBFSy9BSyBoYW5kbGVzIGFyZSBnbG9iYWwgYW5kIHNhdmVkIGFuZCBubyBvdGhl
ciBwcm9jZXNzIHRvdWNoZXMgdGhlIFRQTSE8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PldoeSB3
b3VsZCBJIGdldCAweDJjNCBpbiBFc3lzX0FjdGl2YXRlQ3JlZGVudGlhbCAoKSDCoGJ1dCB3b3Jr
cyBwZXJmZWN0bHkgZmluZSB3aGVuIGV2ZXJ5dGhpbmcgaXMgcnVuIGFzIG9uZSB0aHJlYWQ/PC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5SYWh1bDwvZGl2PjwvZGl2
Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWls
X2F0dHIiPk9uIFR1ZSwgTWFyIDEwLCAyMDIwIGF0IDQ6MjIgUE0gUmFodWwgSGFyZGlrYXIgJmx0
OzxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1
b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDti
b3JkZXItbGVmdC13aWR0aDoxcHg7Ym9yZGVyLWxlZnQtc3R5bGU6c29saWQ7Ym9yZGVyLWxlZnQt
Y29sb3I6cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj5U
aGFua3MgQmlsbC48ZGl2PldvbmRlcmluZyB3aHkgdGhpcyB3b3VsZCBmYWlsLiBUaGUgZXh0ZXJu
YWwgbWFrZSBjcmVkZW50aWFsIEFQSSwgwqBJIGhhdmUgdGFrZW4gZnJvbSB0c3MyIEdpdEh1YiBv
bmx5IHdoeSB3b3VsZCBzZWNyZXQgZmFpbD8gV2hlbiBJIHJhbiBhbGwgb2YgdGhpcyBsb2NhbGx5
IGl0IHdvcmtlZCwgdGhlIG1vbWVudCBJIG1vdmVkIHRoZSBtYWtlIGV4dGVybmFsIGNyZWRlbnRp
YWwgdG8gdGhlIHNlcnZlciBJbSBoaXR0aW5nIHRoaXM/PC9kaXY+PGRpdj5DYW4gaXQgYmUgYmVj
YXVzZSBvZiBPcGVuU1NMIDEuMS4wIHJlcXVpcmVkIGluIHRzczIgYW5kIDEuMC4yIHZlcnNpb24g
cnVubmluZyBvbiBteSBzZXJ2ZXI/PC9kaXY+PGRpdj5UaGFua3M8L2Rpdj48ZGl2PlJhaHVsPC9k
aXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFz
cz0iZ21haWxfYXR0ciI+T24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMzozNiBQTSBSb2JlcnRzLCBX
aWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20i
IHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyB3cm90
ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2lu
OjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1zdHls
ZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDox
ZXgiPlRoZSBlcnJvciBjb2RlcyBlbmNvZGUgYSBidW5jaCBvZiB2YWx1ZXMsIHNvIHlvdSB3b24m
IzM5O3Qgc2VlIHRoYXQgdmFsdWUgdmlhIGEgc3RyYWlnaHQgZ3JlcC48YnI+Cjxicj4KQnV0IHlv
dSBjYW4gdXNlIHRwbTJfcmNfZGVjb2RlIGZyb20gdGhlIHRwbTItdG9vbHMgcHJvamVjdCwgbGlr
ZSBzbzo8YnI+CiQgdHBtMl9yY19kZWNvZGUgMHgyYzQ8YnI+CnRwbTpwYXJhbWV0ZXIoMik6dmFs
dWUgaXMgb3V0IG9mIHJhbmdlIG9yIGlzIG5vdCBjb3JyZWN0IGZvciB0aGUgY29udGV4PGJyPgo8
YnI+ClNlZSB0aGUgdG9vbHMgcHJvamVjdDo8YnI+CjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNv
bS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHM8L2E+PGJyPgo8
YnI+Ck5vdGUgdGhhdCB0aGUgY29tbWFuZHMgc3BlY2lmaWNhdGlvbiB3aWxsIHNob3cgeW91IHdo
YXQgcGFyYW1ldGVyIDIgaXM6PGJyPgo8YSBocmVmPSJodHRwczovL3RydXN0ZWRjb21wdXRpbmdn
cm91cC5vcmcvd3AtY29udGVudC91cGxvYWRzL1RQTS1SZXYtMi4wLVBhcnQtMy1Db21tYW5kcy0w
MS4zOC5wZGYiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vdHJ1c3Rl
ZGNvbXB1dGluZ2dyb3VwLm9yZy93cC1jb250ZW50L3VwbG9hZHMvVFBNLVJldi0yLjAtUGFydC0z
LUNvbW1hbmRzLTAxLjM4LnBkZjwvYT48YnI+Cjxicj4KRXZlcnl0aGluZyBhZnRlciB0aGUgdHJp
cGxlIGxpbmUgc3RhcnRzIHRoZSBwYXJhbWV0ZXJzIHN0YXJ0aW5nIGF0IGluZGV4IDEuPGJyPgpT
byBpbiB0aGlzIGNhc2UgdGhlIHNlY3JldCBwYXJhbWV0ZXIgaXMgd3JvbmcuPGJyPgo8YnI+Ck5v
dGUgdGhhdCBzaW5jZSBUU1MgdmVyc2lvbiAyLjMuMCBhIHNvZnR3YXJlIGxpYnJhcnkgd2FzIGFs
c28gYWRkZWQ8YnI+CmZvciBjb252ZXJ0aW5nIHRoZXNlIHJldHVybiBjb2RlcyB0byBtb3JlIGh1
bWFuIHVuZGVyc3RhbmRhYmxlIHN0cmluZ3MsPGJyPgpUaGUgaGVhZGVyIGZpbGUgaXMgaGVyZTo8
YnI+CjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzL2Js
b2IvbWFzdGVyL2luY2x1ZGUvdHNzMi90c3MyX3JjLmgiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzL2Jsb2Iv
bWFzdGVyL2luY2x1ZGUvdHNzMi90c3MyX3JjLmg8L2E+PGJyPgo8YnI+CmFuZCB0aGVuIHlvdSBq
dXN0IGxpbmsgYWdhaW5zdCBsaWIgdHNzMi1yYywganVzdCBpbiBjYXNlIHlvdSBuZWVkZWQgdGhp
cyBidWlsdCBpbnRvPGJyPgp5b3VyIHByb2dyYW0uPGJyPgo8YnI+CkJpbGw8YnI+Cjxicj4KJmd0
OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4KJmd0OyBGcm9tOiBSYWh1bCBIYXJkaWth
ciBbbWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPl08YnI+CiZndDsgU2VudDogVHVl
c2RheSwgTWFyY2ggMTAsIDIwMjAgNTowMiBQTTxicj4KJmd0OyBUbzogPGEgaHJlZj0ibWFpbHRv
OnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+
PGJyPgomZ3Q7IFN1YmplY3Q6IFt0cG0yXSBFU3lzX0FjdGl2YXRlQ3JlZGVudGlhbDxicj4KJmd0
OyA8YnI+CiZndDsgPGJyPgomZ3Q7IEhpIEFsbCw8YnI+CiZndDsgV2hhdCBkb2VzIGl0IG1lYW4g
d2hlbiBFc3lzX0FjdGl2YXRlQ3JlZGVudGlhbCByZXR1cm5zIDB4MmM0PyBJIGRvbiYjMzk7dCBz
ZWUgdGhpczxicj4KJmd0OyBlcnJvciBkZWZpbmVkIGFueXdoZXJlLjxicj4KJmd0OyA8YnI+CiZn
dDsgVGhhbmtzLDxicj4KJmd0OyBSYWh1bDxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo8L2Jsb2Nr
cXVvdGU+PC9kaXY+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============1663318772379052661==--

