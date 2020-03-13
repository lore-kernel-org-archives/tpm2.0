Content-Type: multipart/mixed; boundary="===============0840154124803674357=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Thu, 12 Mar 2020 17:52:16 -0700
Message-ID: <CAP3jAwSkRWGYRGD_Rowqab17ob071UeUMsV0YXtAX5Q9Y2gQNw@mail.gmail.com>
In-Reply-To: CAP3jAwTAjD_Jx_O+h=a4u_ghk56C7pGVBGSuacQc4R=Y7e69aA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0840154124803674357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I noticed the same changes when its run as a single process, the remote
attestation method works, the moment i move the make external credential
part to the server I hit this issue.
Wondering what could go wrong? Do the AK keys get flushed out?
On the client side, I have the EKCERT and EK and AK keys loaded in the
tpm2, I save the handle of EK and AK for future use when I receive the
credential blob and secret, so basically i fork out a thread to send the
data (and create EK/AK) and then fork another thread to handle the
receive part, but EK/AK handles are global and saved and no other process
touches the TPM!

Why would I get 0x2c4 in Esys_ActivateCredential ()  but works perfectly
fine when everything is run as one thread?

Thanks,
Rahul

On Tue, Mar 10, 2020 at 4:22 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
wrote:

> Thanks Bill.
> Wondering why this would fail. The external make credential API,  I have
> taken from tss2 GitHub only why would secret fail? When I ran all of this
> locally it worked, the moment I moved the make external credential to the
> server Im hitting this?
> Can it be because of OpenSSL 1.1.0 required in tss2 and 1.0.2 version
> running on my server?
> Thanks
> Rahul
>
> On Tue, Mar 10, 2020 at 3:36 PM Roberts, William C <
> william.c.roberts(a)intel.com> wrote:
>
>> The error codes encode a bunch of values, so you won't see that value via
>> a straight grep.
>>
>> But you can use tpm2_rc_decode from the tpm2-tools project, like so:
>> $ tpm2_rc_decode 0x2c4
>> tpm:parameter(2):value is out of range or is not correct for the contex
>>
>> See the tools project:
>> https://github.com/tpm2-software/tpm2-tools
>>
>> Note that the commands specification will show you what parameter 2 is:
>>
>> https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-3-=
Commands-01.38.pdf
>>
>> Everything after the triple line starts the parameters starting at index
>> 1.
>> So in this case the secret parameter is wrong.
>>
>> Note that since TSS version 2.3.0 a software library was also added
>> for converting these return codes to more human understandable strings,
>> The header file is here:
>>
>> https://github.com/tpm2-software/tpm2-tss/blob/master/include/tss2/tss2_=
rc.h
>>
>> and then you just link against lib tss2-rc, just in case you needed this
>> built into
>> your program.
>>
>> Bill
>>
>> > -----Original Message-----
>> > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
>> > Sent: Tuesday, March 10, 2020 5:02 PM
>> > To: tpm2(a)lists.01.org
>> > Subject: [tpm2] ESys_ActivateCredential
>> >
>> >
>> > Hi All,
>> > What does it mean when Esys_ActivateCredential returns 0x2c4? I don't
>> see this
>> > error defined anywhere.
>> >
>> > Thanks,
>> > Rahul
>>
>

--===============0840154124803674357==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SSBub3RpY2VkIHRoZSBzYW1lIGNoYW5nZXMgd2hlbiBpdHMgcnVuIGFz
IGEgc2luZ2xlIHByb2Nlc3MsIHRoZSByZW1vdGUgYXR0ZXN0YXRpb24gbWV0aG9kIHdvcmtzLCB0
aGUgbW9tZW50IGkgbW92ZSB0aGUgbWFrZSBleHRlcm5hbCBjcmVkZW50aWFsIHBhcnQgdG8gdGhl
IHNlcnZlciBJIGhpdCB0aGlzIGlzc3VlLjxkaXY+V29uZGVyaW5nIHdoYXQgY291bGQgZ28gd3Jv
bmc/IERvIHRoZSBBSyBrZXlzIGdldCBmbHVzaGVkIG91dD/CoDwvZGl2PjxkaXY+T24gdGhlIGNs
aWVudCBzaWRlLCBJIGhhdmUgdGhlIEVLQ0VSVCBhbmQgRUsgYW5kIEFLIGtleXMgbG9hZGVkIGlu
IHRoZSB0cG0yLCBJIHNhdmUgdGhlIGhhbmRsZSBvZiBFSyBhbmQgQUsgZm9ywqBmdXR1cmUgdXNl
IHdoZW4gSSByZWNlaXZlIHRoZSBjcmVkZW50aWFsIGJsb2IgYW5kIHNlY3JldCwgc28gYmFzaWNh
bGx5IGkgZm9yayBvdXQgYSB0aHJlYWQgdG8gc2VuZCB0aGUgZGF0YSAoYW5kIGNyZWF0ZSBFSy9B
SykgYW5kIHRoZW4gZm9yayBhbm90aGVyIHRocmVhZCB0byBoYW5kbGUgdGhlIHJlY2VpdmXCoHBh
cnQsIGJ1dCBFSy9BSyBoYW5kbGVzIGFyZSBnbG9iYWwgYW5kIHNhdmVkIGFuZCBubyBvdGhlciBw
cm9jZXNzIHRvdWNoZXMgdGhlIFRQTSE8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PldoeSB3b3Vs
ZCBJIGdldCAweDJjNCBpbiBFc3lzX0FjdGl2YXRlQ3JlZGVudGlhbCAoKSDCoGJ1dCB3b3JrcyBw
ZXJmZWN0bHkgZmluZSB3aGVuIGV2ZXJ5dGhpbmcgaXMgcnVuIGFzIG9uZSB0aHJlYWQ/PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5SYWh1bDwvZGl2PjwvZGl2Pjxi
cj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0
dHIiPk9uIFR1ZSwgTWFyIDEwLCAyMDIwIGF0IDQ6MjIgUE0gUmFodWwgSGFyZGlrYXIgJmx0Ozxh
IGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSI+cmFodWxoYXJkaWthckBnbWFp
bC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFw
eDtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwy
MDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPlRoYW5rcyBCaWxsLjxkaXY+V29u
ZGVyaW5nIHdoeSB0aGlzIHdvdWxkIGZhaWwuIFRoZSBleHRlcm5hbCBtYWtlIGNyZWRlbnRpYWwg
QVBJLCDCoEkgaGF2ZSB0YWtlbiBmcm9tIHRzczIgR2l0SHViIG9ubHkgd2h5IHdvdWxkIHNlY3Jl
dCBmYWlsPyBXaGVuIEkgcmFuIGFsbCBvZiB0aGlzIGxvY2FsbHkgaXQgd29ya2VkLCB0aGUgbW9t
ZW50IEkgbW92ZWQgdGhlIG1ha2UgZXh0ZXJuYWwgY3JlZGVudGlhbCB0byB0aGUgc2VydmVyIElt
IGhpdHRpbmcgdGhpcz88L2Rpdj48ZGl2PkNhbiBpdCBiZSBiZWNhdXNlIG9mIE9wZW5TU0wgMS4x
LjAgcmVxdWlyZWQgaW4gdHNzMiBhbmQgMS4wLjIgdmVyc2lvbiBydW5uaW5nIG9uIG15IHNlcnZl
cj88L2Rpdj48ZGl2PlRoYW5rczwvZGl2PjxkaXY+UmFodWw8L2Rpdj48L2Rpdj48YnI+PGRpdiBj
bGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBU
dWUsIE1hciAxMCwgMjAyMCBhdCAzOjM2IFBNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndp
bGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2tx
dW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7
Ym9yZGVyLWxlZnQtd2lkdGg6MXB4O2JvcmRlci1sZWZ0LXN0eWxlOnNvbGlkO2JvcmRlci1sZWZ0
LWNvbG9yOnJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+VGhlIGVycm9yIGNvZGVz
IGVuY29kZSBhIGJ1bmNoIG9mIHZhbHVlcywgc28geW91IHdvbiYjMzk7dCBzZWUgdGhhdCB2YWx1
ZSB2aWEgYSBzdHJhaWdodCBncmVwLjxicj4KPGJyPgpCdXQgeW91IGNhbiB1c2UgdHBtMl9yY19k
ZWNvZGUgZnJvbSB0aGUgdHBtMi10b29scyBwcm9qZWN0LCBsaWtlIHNvOjxicj4KJCB0cG0yX3Jj
X2RlY29kZSAweDJjNDxicj4KdHBtOnBhcmFtZXRlcigyKTp2YWx1ZSBpcyBvdXQgb2YgcmFuZ2Ug
b3IgaXMgbm90IGNvcnJlY3QgZm9yIHRoZSBjb250ZXg8YnI+Cjxicj4KU2VlIHRoZSB0b29scyBw
cm9qZWN0Ojxicj4KPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBt
Mi10b29scyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIu
Y29tL3RwbTItc29mdHdhcmUvdHBtMi10b29sczwvYT48YnI+Cjxicj4KTm90ZSB0aGF0IHRoZSBj
b21tYW5kcyBzcGVjaWZpY2F0aW9uIHdpbGwgc2hvdyB5b3Ugd2hhdCBwYXJhbWV0ZXIgMiBpczo8
YnI+CjxhIGhyZWY9Imh0dHBzOi8vdHJ1c3RlZGNvbXB1dGluZ2dyb3VwLm9yZy93cC1jb250ZW50
L3VwbG9hZHMvVFBNLVJldi0yLjAtUGFydC0zLUNvbW1hbmRzLTAxLjM4LnBkZiIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly90cnVzdGVkY29tcHV0aW5nZ3JvdXAub3Jn
L3dwLWNvbnRlbnQvdXBsb2Fkcy9UUE0tUmV2LTIuMC1QYXJ0LTMtQ29tbWFuZHMtMDEuMzgucGRm
PC9hPjxicj4KPGJyPgpFdmVyeXRoaW5nIGFmdGVyIHRoZSB0cmlwbGUgbGluZSBzdGFydHMgdGhl
IHBhcmFtZXRlcnMgc3RhcnRpbmcgYXQgaW5kZXggMS48YnI+ClNvIGluIHRoaXMgY2FzZSB0aGUg
c2VjcmV0IHBhcmFtZXRlciBpcyB3cm9uZy48YnI+Cjxicj4KTm90ZSB0aGF0IHNpbmNlIFRTUyB2
ZXJzaW9uIDIuMy4wIGEgc29mdHdhcmUgbGlicmFyeSB3YXMgYWxzbyBhZGRlZDxicj4KZm9yIGNv
bnZlcnRpbmcgdGhlc2UgcmV0dXJuIGNvZGVzIHRvIG1vcmUgaHVtYW4gdW5kZXJzdGFuZGFibGUg
c3RyaW5ncyw8YnI+ClRoZSBoZWFkZXIgZmlsZSBpcyBoZXJlOjxicj4KPGEgaHJlZj0iaHR0cHM6
Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3MvYmxvYi9tYXN0ZXIvaW5jbHVkZS90
c3MyL3RzczJfcmMuaCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9n
aXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3MvYmxvYi9tYXN0ZXIvaW5jbHVkZS90c3My
L3RzczJfcmMuaDwvYT48YnI+Cjxicj4KYW5kIHRoZW4geW91IGp1c3QgbGluayBhZ2FpbnN0IGxp
YiB0c3MyLXJjLCBqdXN0IGluIGNhc2UgeW91IG5lZWRlZCB0aGlzIGJ1aWx0IGludG88YnI+Cnlv
dXIgcHJvZ3JhbS48YnI+Cjxicj4KQmlsbDxicj4KPGJyPgomZ3Q7IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tPGJyPgomZ3Q7IEZyb206IFJhaHVsIEhhcmRpa2FyIFttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJk
aWthckBnbWFpbC5jb208L2E+XTxicj4KJmd0OyBTZW50OiBUdWVzZGF5LCBNYXJjaCAxMCwgMjAy
MCA1OjAyIFBNPGJyPgomZ3Q7IFRvOiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmci
IHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgU3ViamVjdDog
W3RwbTJdIEVTeXNfQWN0aXZhdGVDcmVkZW50aWFsPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZn
dDsgSGkgQWxsLDxicj4KJmd0OyBXaGF0IGRvZXMgaXQgbWVhbiB3aGVuIEVzeXNfQWN0aXZhdGVD
cmVkZW50aWFsIHJldHVybnMgMHgyYzQ/IEkgZG9uJiMzOTt0IHNlZSB0aGlzPGJyPgomZ3Q7IGVy
cm9yIGRlZmluZWQgYW55d2hlcmUuPGJyPgomZ3Q7IDxicj4KJmd0OyBUaGFua3MsPGJyPgomZ3Q7
IFJhaHVsPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============0840154124803674357==--

