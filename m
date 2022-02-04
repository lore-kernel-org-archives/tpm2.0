Content-Type: multipart/mixed; boundary="===============4687299693164098438=="
MIME-Version: 1.0
From: Gabriele Saturni <gabriele.saturni at wsense.it>
Subject: [tpm2] Re: How to store AES key inside the TPM and then use it?
Date: Fri, 04 Feb 2022 10:29:07 +0100
Message-ID: <CAFruog2Hc+FqU8mx-5DeLNKzFVA-h5Uww=b=bfjx4U=LbwOY9Q@mail.gmail.com>
In-Reply-To: BN8PR15MB2753693B74C66587A00B44AFF2289@BN8PR15MB2753.namprd15.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4687299693164098438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ok guys thanks a lot for the help! Googling i found these commands can you
confirm that this is the correct procedure ?

1) echo "That is my secret" > secret.txt

2) tpm2_createprimary -c primary.ctx -Q //create primary context

3) tpm2_pcrread -Q -o pcr.bin sha256:x,y,z //read the hash of pcr
register x,y,z and save in a file

4) tpm2_createpolicy -Q --policy-pcr -l sha256:x,y,z -f pcr.bin -L
pcr.policy //use the file created in the prev step for create a policy

5) tpm2_create -C primary.ctx -L pcr.policy -i secret.txt -u seal.pub
-r seal.priv -c seal.ctx -Q //seal the secret in the TPM using the
policy

6) tpm2_load -Q -C primary.ctx -u seal.pub -r seal.priv -n seal.name
-c seal.ctx //load the sensitive portion in the TPM.


Then for unseal:

tpm2_unseal -c seal.ctx -p pcr:sha256:x,y,z

Moreover, I have just one question: after step 6 Can I safely delete
the files primary.ctx -u seal.pub -r seal.priv since they are loaded
inside the TPM ?

Thanks again for your help.


Il giorno gio 3 feb 2022 alle ore 18:31 Kenneth Goldman <kgoldman(a)us.ibm.=
com>
ha scritto:

> I do not advise this.  There are very few (perhaps 7) persistent object
> slots, and many are used by OS-level functions.  It is a waste of a scarce
> resource.
>
>
>
> General TPM principle - use TPM NV only when absolutely necessary.
>
>
>
> *From:* Steven Clark <davolfman(a)gmail.com>
> *Sent:* Wednesday, February 2, 2022 10:28 PM
> *To:* Kenneth Goldman <kgoldman(a)us.ibm.com>
> *Cc:* Gabriele Saturni <gabriele.saturni(a)wsense.it>; tpm2 <
> tpm2(a)lists.01.org>
> *Subject:* [EXTERNAL] [tpm2] Re: How to store AES key inside the TPM and
> then use it?
>
>
>
> For small data it's also possible to store it sealed as a "keyedhash" and
> put it in one of the NVM "persistent object" locations as if it's key.
>
>
>
> On Wed, Feb 2, 2022, 1:06 PM Kenneth Goldman <kgoldman(a)us.ibm.com> wrot=
e:
>
> There are two ways.  Note that, since you're encrypting outside the TPM,
> the 'key' is just a byte stream to the TPM.
>
>
>
> 1.       If you have storage available, create the key as sealed data
> using 'create'.  Retrieve the key with 'unseal', with application specific
> authorization for the unseal operation.
>
> 2.       If you have no external storage available, create the key as an
> NV index using NVdefinespace. Retrieve the key using NV read, again with
> application specific authorization for the read.
>
>
>
>

--===============4687299693164098438==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T2sgZ3V5cyB0aGFua3MgYSBsb3QgZm9yIHRo
ZSBoZWxwISBHb29nbGluZyBpIGZvdW5kIHRoZXNlIGNvbW1hbmRzIGNhbiB5b3UgY29uZmlybSB0
aGF0IHRoaXMgaXMgdGhlIGNvcnJlY3QgcHJvY2VkdXJlID88YnI+PGJyPjxjb2RlPjEpIGVjaG8g
JnF1b3Q7VGhhdCBpcyBteSBzZWNyZXQmcXVvdDsgJmd0OyBzZWNyZXQudHh0PGJyPjwvY29kZT48
cHJlPjIpIHRwbTJfY3JlYXRlcHJpbWFyeSAtYyBwcmltYXJ5LmN0eCAtUSAvL2NyZWF0ZSBwcmlt
YXJ5IGNvbnRleHQ8YnI+PGJyPjMpIHRwbTJfcGNycmVhZCAtUSAtbyBwY3IuYmluIHNoYTI1Njp4
LHkseiAvL3JlYWQgdGhlIGhhc2ggb2YgcGNyIHJlZ2lzdGVyIHgseSx6IGFuZCBzYXZlIGluIGEg
ZmlsZQoKNCkgdHBtMl9jcmVhdGVwb2xpY3kgLVEgLS1wb2xpY3ktcGNyIC1sIHNoYTI1Njp4LHks
eiAtZiBwY3IuYmluIC1MIHBjci5wb2xpY3kgLy91c2UgdGhlIGZpbGUgY3JlYXRlZCBpbiB0aGUg
cHJldiBzdGVwIGZvciBjcmVhdGUgYSBwb2xpY3kKCjUpIHRwbTJfY3JlYXRlIC1DIHByaW1hcnku
Y3R4IC1MIHBjci5wb2xpY3kgLWkgPGNvZGU+c2VjcmV0LnR4dCA8L2NvZGU+LXUgc2VhbC5wdWIg
LXIgc2VhbC5wcml2IC1jIHNlYWwuY3R4IC1RIC8vc2VhbCB0aGUgc2VjcmV0IGluIHRoZSBUUE0g
dXNpbmcgdGhlIHBvbGljeTxicj48YnI+PGNvZGU+NikgdHBtMl9sb2FkIC1RIC1DIHByaW1hcnku
Y3R4IC11IHNlYWwucHViIC1yIHNlYWwucHJpdiAtbiA8YSBocmVmPSJodHRwOi8vc2VhbC5uYW1l
IiB0YXJnZXQ9Il9ibGFuayI+c2VhbC5uYW1lPC9hPiAtYyBzZWFsLmN0eCAvL2xvYWQgdGhlIHNl
bnNpdGl2ZSBwb3J0aW9uIGluIHRoZSBUUE0uPGJyPjwvY29kZT48L3ByZT48cHJlPjxjb2RlPjxi
cj48L2NvZGU+PC9wcmU+PHByZT48Y29kZT48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWws
c2Fucy1zZXJpZiI+VGhlbiBmb3IgdW5zZWFsPC9zcGFuPjo8YnI+PGJyPnRwbTJfdW5zZWFsIC1j
IHNlYWwuY3R4IC1wIHBjcjpzaGEyNTY6eCx5LHo8YnI+PGJyPjwvY29kZT48L3ByZT48cHJlPjxj
b2RlPjxmb250IGZhY2U9ImFyaWFsLHNhbnMtc2VyaWYiPk1vcmVvdmVyLCBJIGhhdmUganVzdCBv
bmUgcXVlc3Rpb246IGFmdGVyIHN0ZXAgNiBDYW4gSSBzYWZlbHkgZGVsZXRlIHRoZSBmaWxlcyA8
L2ZvbnQ+PGNvZGU+cHJpbWFyeS5jdHggLXUgc2VhbC5wdWIgLXIgc2VhbC5wcml2IDxmb250IGZh
Y2U9ImFyaWFsLHNhbnMtc2VyaWYiPnNpbmNlIHRoZXkgYXJlIGxvYWRlZCBpbnNpZGUgdGhlIFRQ
TSA/PGJyPjxicj48L2ZvbnQ+PC9jb2RlPjwvY29kZT48L3ByZT48cHJlPjxjb2RlPjxjb2RlPjxm
b250IGZhY2U9ImFyaWFsLHNhbnMtc2VyaWYiPlRoYW5rcyBhZ2FpbiBmb3IgeW91ciBoZWxwLjxi
cj48L2ZvbnQ+PC9jb2RlPjwvY29kZT48L3ByZT48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxf
cXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5JbCBnaW9ybm8gZ2lvIDMg
ZmViIDIwMjIgYWxsZSBvcmUgMTg6MzEgS2VubmV0aCBHb2xkbWFuICZsdDs8YSBocmVmPSJtYWls
dG86a2dvbGRtYW5AdXMuaWJtLmNvbSI+a2dvbGRtYW5AdXMuaWJtLmNvbTwvYT4mZ3Q7IGhhIHNj
cml0dG86PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KCgoKCgo8ZGl2IHN0eWxlPSJvdmVyZmxvdy13cmFwOiBi
cmVhay13b3JkOyIgbGFuZz0iRU4tVVMiPgo8ZGl2IGNsYXNzPSJnbWFpbC1tXzQyNzkyNDQzMzUz
NDE0OTU2MjlXb3JkU2VjdGlvbjEiPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj5JIGRvIG5vdCBhZHZp
c2UgdGhpcy7CoCBUaGVyZSBhcmUgdmVyeSBmZXcgKHBlcmhhcHMgNykgcGVyc2lzdGVudCBvYmpl
Y3Qgc2xvdHMsIGFuZCBtYW55IGFyZSB1c2VkIGJ5IE9TLWxldmVsIGZ1bmN0aW9ucy7CoCBJdCBp
cyBhIHdhc3RlIG9mIGEgc2NhcmNlIHJlc291cmNlLjx1PjwvdT48dT48L3U+PC9wPgo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48dT48L3U+wqA8dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj5H
ZW5lcmFsIFRQTSBwcmluY2lwbGUgLSB1c2UgVFBNIE5WIG9ubHkgd2hlbiBhYnNvbHV0ZWx5IG5l
Y2Vzc2FyeS48dT48L3U+PHU+PC91PjwvcD4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHU+PC91PsKg
PHU+PC91PjwvcD4KPGRpdiBzdHlsZT0iYm9yZGVyLWNvbG9yOnJnYigyMjUsMjI1LDIyNSkgY3Vy
cmVudGNvbG9yIGN1cnJlbnRjb2xvcjtib3JkZXItc3R5bGU6c29saWQgbm9uZSBub25lO2JvcmRl
ci13aWR0aDoxcHQgbWVkaXVtIG1lZGl1bTtwYWRkaW5nOjNwdCAwaW4gMGluIj4KPHAgY2xhc3M9
Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjAuNWluIj48Yj5Gcm9tOjwvYj4gU3RldmVu
IENsYXJrICZsdDs8YSBocmVmPSJtYWlsdG86ZGF2b2xmbWFuQGdtYWlsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPmRhdm9sZm1hbkBnbWFpbC5jb208L2E+Jmd0Owo8YnI+CjxiPlNlbnQ6PC9iPiBXZWRu
ZXNkYXksIEZlYnJ1YXJ5IDIsIDIwMjIgMTA6MjggUE08YnI+CjxiPlRvOjwvYj4gS2VubmV0aCBH
b2xkbWFuICZsdDs8YSBocmVmPSJtYWlsdG86a2dvbGRtYW5AdXMuaWJtLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPmtnb2xkbWFuQHVzLmlibS5jb208L2E+Jmd0Ozxicj4KPGI+Q2M6PC9iPiBHYWJyaWVs
ZSBTYXR1cm5pICZsdDs8YSBocmVmPSJtYWlsdG86Z2FicmllbGUuc2F0dXJuaUB3c2Vuc2UuaXQi
IHRhcmdldD0iX2JsYW5rIj5nYWJyaWVsZS5zYXR1cm5pQHdzZW5zZS5pdDwvYT4mZ3Q7OyB0cG0y
ICZsdDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50
cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgo8Yj5TdWJqZWN0OjwvYj4gW0VYVEVSTkFMXSBb
dHBtMl0gUmU6IEhvdyB0byBzdG9yZSBBRVMga2V5IGluc2lkZSB0aGUgVFBNIGFuZCB0aGVuIHVz
ZSBpdD88dT48L3U+PHU+PC91PjwvcD4KPC9kaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxl
PSJtYXJnaW4tbGVmdDowLjVpbiI+PHU+PC91PsKgPHU+PC91PjwvcD4KPGRpdj4KPHAgY2xhc3M9
Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjAuNWluIj5Gb3Igc21hbGwgZGF0YSBpdCYj
Mzk7cyBhbHNvIHBvc3NpYmxlIHRvIHN0b3JlIGl0IHNlYWxlZCBhcyBhICZxdW90O2tleWVkaGFz
aCZxdW90OyBhbmQgcHV0IGl0IGluIG9uZSBvZiB0aGUgTlZNICZxdW90O3BlcnNpc3RlbnQgb2Jq
ZWN0JnF1b3Q7IGxvY2F0aW9ucyBhcyBpZiBpdCYjMzk7cyBrZXkuPHU+PC91Pjx1PjwvdT48L3A+
CjwvZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MC41aW4iPjx1
PjwvdT7CoDx1PjwvdT48L3A+CjxkaXY+CjxkaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxl
PSJtYXJnaW4tbGVmdDowLjVpbiI+T24gV2VkLCBGZWIgMiwgMjAyMiwgMTowNiBQTSBLZW5uZXRo
IEdvbGRtYW4gJmx0OzxhIGhyZWY9Im1haWx0bzprZ29sZG1hbkB1cy5pYm0uY29tIiB0YXJnZXQ9
Il9ibGFuayI+a2dvbGRtYW5AdXMuaWJtLmNvbTwvYT4mZ3Q7IHdyb3RlOjx1PjwvdT48dT48L3U+
PC9wPgo8L2Rpdj4KPGJsb2NrcXVvdGUgc3R5bGU9ImJvcmRlci1jb2xvcjpjdXJyZW50Y29sb3Ig
Y3VycmVudGNvbG9yIGN1cnJlbnRjb2xvciByZ2IoMjA0LDIwNCwyMDQpO2JvcmRlci1zdHlsZTpu
b25lIG5vbmUgbm9uZSBzb2xpZDtib3JkZXItd2lkdGg6bWVkaXVtIG1lZGl1bSBtZWRpdW0gMXB0
O3BhZGRpbmc6MGluIDBpbiAwaW4gNnB0O21hcmdpbi1sZWZ0OjQuOHB0O21hcmdpbi1yaWdodDow
aW4iPgo8ZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6
MC41aW4iPgpUaGVyZSBhcmUgdHdvIHdheXMuwqAgTm90ZSB0aGF0LCBzaW5jZSB5b3UmIzM5O3Jl
IGVuY3J5cHRpbmcgb3V0c2lkZSB0aGUgVFBNLCB0aGUgJiMzOTtrZXkmIzM5OyBpcyBqdXN0IGEg
Ynl0ZSBzdHJlYW0gdG8gdGhlIFRQTS48dT48L3U+PHU+PC91PjwvcD4KPHAgY2xhc3M9Ik1zb05v
cm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjAuNWluIj4KwqA8dT48L3U+PHU+PC91PjwvcD4KPHAg
Y2xhc3M9ImdtYWlsLW1fNDI3OTI0NDMzNTM0MTQ5NTYyOW0tNTE3NjczODM0NTQ3MDY2ODc5NG1z
b2xpc3RwYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDoxaW4iPgo8dT48L3U+PHNwYW4+MS48
c3BhbiBzdHlsZT0iZm9udDo3cHQgJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7Ij7CoMKgwqDC
oMKgwqAKPC9zcGFuPjwvc3Bhbj48dT48L3U+SWYgeW91IGhhdmUgc3RvcmFnZSBhdmFpbGFibGUs
IGNyZWF0ZSB0aGUga2V5IGFzIHNlYWxlZCBkYXRhIHVzaW5nICYjMzk7Y3JlYXRlJiMzOTsuwqAg
UmV0cmlldmUgdGhlIGtleSB3aXRoICYjMzk7dW5zZWFsJiMzOTssIHdpdGggYXBwbGljYXRpb24g
c3BlY2lmaWMgYXV0aG9yaXphdGlvbiBmb3IgdGhlIHVuc2VhbCBvcGVyYXRpb24uPHU+PC91Pjx1
PjwvdT48L3A+CjxwIGNsYXNzPSJnbWFpbC1tXzQyNzkyNDQzMzUzNDE0OTU2MjltLTUxNzY3Mzgz
NDU0NzA2Njg3OTRtc29saXN0cGFyYWdyYXBoIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MWluIj4KPHU+
PC91PjxzcGFuPjIuPHNwYW4gc3R5bGU9ImZvbnQ6N3B0ICZxdW90O1RpbWVzIE5ldyBSb21hbiZx
dW90OyI+wqDCoMKgwqDCoMKgCjwvc3Bhbj48L3NwYW4+PHU+PC91PklmIHlvdSBoYXZlIG5vIGV4
dGVybmFsIHN0b3JhZ2UgYXZhaWxhYmxlLCBjcmVhdGUgdGhlIGtleSBhcyBhbiBOViBpbmRleCB1
c2luZyBOVmRlZmluZXNwYWNlLiBSZXRyaWV2ZSB0aGUga2V5IHVzaW5nIE5WIHJlYWQsIGFnYWlu
IHdpdGggYXBwbGljYXRpb24gc3BlY2lmaWMgYXV0aG9yaXphdGlvbiBmb3IgdGhlIHJlYWQuPHU+
PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tbGVmdDow
LjVpbiI+CsKgPHU+PC91Pjx1PjwvdT48L3A+CjwvZGl2Pgo8L2Rpdj4KPC9ibG9ja3F1b3RlPgo8
L2Rpdj4KPC9kaXY+CjwvZGl2PgoKPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pgo=

--===============4687299693164098438==--

