Content-Type: multipart/mixed; boundary="===============5808300425377417361=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: How to store AES key inside the TPM and then use it?
Date: Fri, 04 Feb 2022 18:14:22 -0800
Message-ID: <CAOCvsSn3DeRh9+XcNUJbOX_it9c3E_GtRAyF8xFwB3zbh_XuHA@mail.gmail.com>
In-Reply-To: CAFruog2Hc+FqU8mx-5DeLNKzFVA-h5Uww=b=bfjx4U=LbwOY9Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5808300425377417361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think none of them are stored in the TPM.  But if you create a primary
key with an identical procedure in the future you'll get the same key.
Also it might be in the context file but I'm not sure.  So creating
primaries that are ECC keys is beneficial because generation is orders of
magnitude faster than RSA.
Also your secret is now in the context blob so you don't need the pub and
priv regions anymore.

On Fri, Feb 4, 2022, 1:29 AM Gabriele Saturni <gabriele.saturni(a)wsense.it>
wrote:

> Ok guys thanks a lot for the help! Googling i found these commands can you
> confirm that this is the correct procedure ?
>
> 1) echo "That is my secret" > secret.txt
>
> 2) tpm2_createprimary -c primary.ctx -Q //create primary context
>
> 3) tpm2_pcrread -Q -o pcr.bin sha256:x,y,z //read the hash of pcr registe=
r x,y,z and save in a file
>
> 4) tpm2_createpolicy -Q --policy-pcr -l sha256:x,y,z -f pcr.bin -L pcr.po=
licy //use the file created in the prev step for create a policy
>
> 5) tpm2_create -C primary.ctx -L pcr.policy -i secret.txt -u seal.pub -r =
seal.priv -c seal.ctx -Q //seal the secret in the TPM using the policy
>
> 6) tpm2_load -Q -C primary.ctx -u seal.pub -r seal.priv -n seal.name -c s=
eal.ctx //load the sensitive portion in the TPM.
>
>
> Then for unseal:
>
> tpm2_unseal -c seal.ctx -p pcr:sha256:x,y,z
>
> Moreover, I have just one question: after step 6 Can I safely delete the =
files primary.ctx -u seal.pub -r seal.priv since they are loaded inside the=
 TPM ?
>
> Thanks again for your help.
>
>
> Il giorno gio 3 feb 2022 alle ore 18:31 Kenneth Goldman <
> kgoldman(a)us.ibm.com> ha scritto:
>
>> I do not advise this.  There are very few (perhaps 7) persistent object
>> slots, and many are used by OS-level functions.  It is a waste of a scar=
ce
>> resource.
>>
>>
>>
>> General TPM principle - use TPM NV only when absolutely necessary.
>>
>>
>>
>> *From:* Steven Clark <davolfman(a)gmail.com>
>> *Sent:* Wednesday, February 2, 2022 10:28 PM
>> *To:* Kenneth Goldman <kgoldman(a)us.ibm.com>
>> *Cc:* Gabriele Saturni <gabriele.saturni(a)wsense.it>; tpm2 <
>> tpm2(a)lists.01.org>
>> *Subject:* [EXTERNAL] [tpm2] Re: How to store AES key inside the TPM and
>> then use it?
>>
>>
>>
>> For small data it's also possible to store it sealed as a "keyedhash" and
>> put it in one of the NVM "persistent object" locations as if it's key.
>>
>>
>>
>> On Wed, Feb 2, 2022, 1:06 PM Kenneth Goldman <kgoldman(a)us.ibm.com> wro=
te:
>>
>> There are two ways.  Note that, since you're encrypting outside the TPM,
>> the 'key' is just a byte stream to the TPM.
>>
>>
>>
>> 1.       If you have storage available, create the key as sealed data
>> using 'create'.  Retrieve the key with 'unseal', with application specif=
ic
>> authorization for the unseal operation.
>>
>> 2.       If you have no external storage available, create the key as an
>> NV index using NVdefinespace. Retrieve the key using NV read, again with
>> application specific authorization for the read.
>>
>>
>>
>>

--===============5808300425377417361==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPjxkaXY+SSB0aGluayBub25lIG9mIHRoZW0gYXJlIHN0b3JlZCBpbiB0
aGUgVFBNLsKgIEJ1dCBpZiB5b3UgY3JlYXRlIGEgcHJpbWFyeSBrZXkgd2l0aCBhbiBpZGVudGlj
YWwgcHJvY2VkdXJlIGluIHRoZSBmdXR1cmUgeW91JiMzOTtsbCBnZXQgdGhlIHNhbWUga2V5LsKg
IEFsc28gaXQgbWlnaHQgYmUgaW4gdGhlIGNvbnRleHQgZmlsZSBidXQgSSYjMzk7bSBub3Qgc3Vy
ZS7CoCBTbyBjcmVhdGluZyBwcmltYXJpZXMgdGhhdCBhcmUgRUNDIGtleXMgaXMgYmVuZWZpY2lh
bCBiZWNhdXNlIGdlbmVyYXRpb24gaXMgb3JkZXJzIG9mIG1hZ25pdHVkZSBmYXN0ZXIgdGhhbiBS
U0EuPC9kaXY+PGRpdiBkaXI9ImF1dG8iPkFsc28geW91ciBzZWNyZXQgaXMgbm93IGluIHRoZSBj
b250ZXh0IGJsb2Igc28geW91IGRvbiYjMzk7dCBuZWVkIHRoZSBwdWIgYW5kIHByaXYgcmVnaW9u
cyBhbnltb3JlLjxicj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiIGRpcj0iYXV0byI+PGRp
diBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIEZyaSwgRmViIDQsIDIwMjIsIDE6Mjkg
QU0gR2FicmllbGUgU2F0dXJuaSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmdhYnJpZWxlLnNhdHVybmlA
d3NlbnNlLml0Ij5nYWJyaWVsZS5zYXR1cm5pQHdzZW5zZS5pdDwvYT4mZ3Q7IHdyb3RlOjxicj48
L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAg
LjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRp
cj0ibHRyIj48ZGl2IGRpcj0ibHRyIj5PayBndXlzIHRoYW5rcyBhIGxvdCBmb3IgdGhlIGhlbHAh
IEdvb2dsaW5nIGkgZm91bmQgdGhlc2UgY29tbWFuZHMgY2FuIHlvdSBjb25maXJtIHRoYXQgdGhp
cyBpcyB0aGUgY29ycmVjdCBwcm9jZWR1cmUgPzxicj48YnI+PGNvZGU+MSkgZWNobyAmcXVvdDtU
aGF0IGlzIG15IHNlY3JldCZxdW90OyAmZ3Q7IHNlY3JldC50eHQ8YnI+PC9jb2RlPjxwcmU+Mikg
dHBtMl9jcmVhdGVwcmltYXJ5IC1jIHByaW1hcnkuY3R4IC1RIC8vY3JlYXRlIHByaW1hcnkgY29u
dGV4dDxicj48YnI+MykgdHBtMl9wY3JyZWFkIC1RIC1vIHBjci5iaW4gc2hhMjU2OngseSx6IC8v
cmVhZCB0aGUgaGFzaCBvZiBwY3IgcmVnaXN0ZXIgeCx5LHogYW5kIHNhdmUgaW4gYSBmaWxlCgo0
KSB0cG0yX2NyZWF0ZXBvbGljeSAtUSAtLXBvbGljeS1wY3IgLWwgc2hhMjU2OngseSx6IC1mIHBj
ci5iaW4gLUwgcGNyLnBvbGljeSAvL3VzZSB0aGUgZmlsZSBjcmVhdGVkIGluIHRoZSBwcmV2IHN0
ZXAgZm9yIGNyZWF0ZSBhIHBvbGljeQoKNSkgdHBtMl9jcmVhdGUgLUMgcHJpbWFyeS5jdHggLUwg
cGNyLnBvbGljeSAtaSA8Y29kZT5zZWNyZXQudHh0IDwvY29kZT4tdSBzZWFsLnB1YiAtciBzZWFs
LnByaXYgLWMgc2VhbC5jdHggLVEgLy9zZWFsIHRoZSBzZWNyZXQgaW4gdGhlIFRQTSB1c2luZyB0
aGUgcG9saWN5PGJyPjxicj48Y29kZT42KSB0cG0yX2xvYWQgLVEgLUMgcHJpbWFyeS5jdHggLXUg
c2VhbC5wdWIgLXIgc2VhbC5wcml2IC1uIDxhIGhyZWY9Imh0dHA6Ly9zZWFsLm5hbWUiIHRhcmdl
dD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnNlYWwubmFtZTwvYT4gLWMgc2VhbC5jdHggLy9s
b2FkIHRoZSBzZW5zaXRpdmUgcG9ydGlvbiBpbiB0aGUgVFBNLjxicj48L2NvZGU+PC9wcmU+PHBy
ZT48Y29kZT48YnI+PC9jb2RlPjwvcHJlPjxwcmU+PGNvZGU+PHNwYW4gc3R5bGU9ImZvbnQtZmFt
aWx5OmFyaWFsLHNhbnMtc2VyaWYiPlRoZW4gZm9yIHVuc2VhbDwvc3Bhbj46PGJyPjxicj50cG0y
X3Vuc2VhbCAtYyBzZWFsLmN0eCAtcCBwY3I6c2hhMjU2OngseSx6PGJyPjxicj48L2NvZGU+PC9w
cmU+PHByZT48Y29kZT48Zm9udCBmYWNlPSJhcmlhbCxzYW5zLXNlcmlmIj5Nb3Jlb3ZlciwgSSBo
YXZlIGp1c3Qgb25lIHF1ZXN0aW9uOiBhZnRlciBzdGVwIDYgQ2FuIEkgc2FmZWx5IGRlbGV0ZSB0
aGUgZmlsZXMgPC9mb250Pjxjb2RlPnByaW1hcnkuY3R4IC11IHNlYWwucHViIC1yIHNlYWwucHJp
diA8Zm9udCBmYWNlPSJhcmlhbCxzYW5zLXNlcmlmIj5zaW5jZSB0aGV5IGFyZSBsb2FkZWQgaW5z
aWRlIHRoZSBUUE0gPzxicj48YnI+PC9mb250PjwvY29kZT48L2NvZGU+PC9wcmU+PHByZT48Y29k
ZT48Y29kZT48Zm9udCBmYWNlPSJhcmlhbCxzYW5zLXNlcmlmIj5UaGFua3MgYWdhaW4gZm9yIHlv
dXIgaGVscC48YnI+PC9mb250PjwvY29kZT48L2NvZGU+PC9wcmU+PC9kaXY+PGJyPjxkaXYgY2xh
c3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+SWwgZ2lv
cm5vIGdpbyAzIGZlYiAyMDIyIGFsbGUgb3JlIDE4OjMxIEtlbm5ldGggR29sZG1hbiAmbHQ7PGEg
aHJlZj0ibWFpbHRvOmtnb2xkbWFuQHVzLmlibS5jb20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5v
cmVmZXJyZXIiPmtnb2xkbWFuQHVzLmlibS5jb208L2E+Jmd0OyBoYSBzY3JpdHRvOjxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+CgoKCgoKPGRpdiBsYW5nPSJFTi1VUyI+CjxkaXY+CjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPkkgZG8gbm90IGFkdmlzZSB0aGlzLsKgIFRoZXJlIGFyZSB2ZXJ5IGZldyAocGVyaGFwcyA3
KSBwZXJzaXN0ZW50IG9iamVjdCBzbG90cywgYW5kIG1hbnkgYXJlIHVzZWQgYnkgT1MtbGV2ZWwg
ZnVuY3Rpb25zLsKgIEl0IGlzIGEgd2FzdGUgb2YgYSBzY2FyY2UgcmVzb3VyY2UuPHU+PC91Pjx1
PjwvdT48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7CoDx1PjwvdT48L3A+CjxwIGNs
YXNzPSJNc29Ob3JtYWwiPkdlbmVyYWwgVFBNIHByaW5jaXBsZSAtIHVzZSBUUE0gTlYgb25seSB3
aGVuIGFic29sdXRlbHkgbmVjZXNzYXJ5Ljx1PjwvdT48dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48dT48L3U+wqA8dT48L3U+PC9wPgo8ZGl2IHN0eWxlPSJib3JkZXItY29sb3I6cmdi
KDIyNSwyMjUsMjI1KSBjdXJyZW50Y29sb3IgY3VycmVudGNvbG9yO2JvcmRlci1zdHlsZTpzb2xp
ZCBub25lIG5vbmU7Ym9yZGVyLXdpZHRoOjFwdCBtZWRpdW0gbWVkaXVtO3BhZGRpbmc6M3B0IDBp
biAwaW4iPgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MC41aW4iPjxi
PkZyb206PC9iPiBTdGV2ZW4gQ2xhcmsgJmx0OzxhIGhyZWY9Im1haWx0bzpkYXZvbGZtYW5AZ21h
aWwuY29tIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5kYXZvbGZtYW5AZ21haWwu
Y29tPC9hPiZndDsKPGJyPgo8Yj5TZW50OjwvYj4gV2VkbmVzZGF5LCBGZWJydWFyeSAyLCAyMDIy
IDEwOjI4IFBNPGJyPgo8Yj5Ubzo8L2I+IEtlbm5ldGggR29sZG1hbiAmbHQ7PGEgaHJlZj0ibWFp
bHRvOmtnb2xkbWFuQHVzLmlibS5jb20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIi
Pmtnb2xkbWFuQHVzLmlibS5jb208L2E+Jmd0Ozxicj4KPGI+Q2M6PC9iPiBHYWJyaWVsZSBTYXR1
cm5pICZsdDs8YSBocmVmPSJtYWlsdG86Z2FicmllbGUuc2F0dXJuaUB3c2Vuc2UuaXQiIHRhcmdl
dD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPmdhYnJpZWxlLnNhdHVybmlAd3NlbnNlLml0PC9h
PiZndDs7IHRwbTIgJmx0OzxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0
PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4K
PGI+U3ViamVjdDo8L2I+IFtFWFRFUk5BTF0gW3RwbTJdIFJlOiBIb3cgdG8gc3RvcmUgQUVTIGtl
eSBpbnNpZGUgdGhlIFRQTSBhbmQgdGhlbiB1c2UgaXQ/PHU+PC91Pjx1PjwvdT48L3A+CjwvZGl2
Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MC41aW4iPjx1PjwvdT7C
oDx1PjwvdT48L3A+CjxkaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tbGVm
dDowLjVpbiI+Rm9yIHNtYWxsIGRhdGEgaXQmIzM5O3MgYWxzbyBwb3NzaWJsZSB0byBzdG9yZSBp
dCBzZWFsZWQgYXMgYSAmcXVvdDtrZXllZGhhc2gmcXVvdDsgYW5kIHB1dCBpdCBpbiBvbmUgb2Yg
dGhlIE5WTSAmcXVvdDtwZXJzaXN0ZW50IG9iamVjdCZxdW90OyBsb2NhdGlvbnMgYXMgaWYgaXQm
IzM5O3Mga2V5Ljx1PjwvdT48dT48L3U+PC9wPgo8L2Rpdj4KPHAgY2xhc3M9Ik1zb05vcm1hbCIg
c3R5bGU9Im1hcmdpbi1sZWZ0OjAuNWluIj48dT48L3U+wqA8dT48L3U+PC9wPgo8ZGl2Pgo8ZGl2
Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MC41aW4iPk9uIFdlZCwg
RmViIDIsIDIwMjIsIDE6MDYgUE0gS2VubmV0aCBHb2xkbWFuICZsdDs8YSBocmVmPSJtYWlsdG86
a2dvbGRtYW5AdXMuaWJtLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+a2dv
bGRtYW5AdXMuaWJtLmNvbTwvYT4mZ3Q7IHdyb3RlOjx1PjwvdT48dT48L3U+PC9wPgo8L2Rpdj4K
PGJsb2NrcXVvdGUgc3R5bGU9ImJvcmRlci1jb2xvcjpjdXJyZW50Y29sb3IgY3VycmVudGNvbG9y
IGN1cnJlbnRjb2xvciByZ2IoMjA0LDIwNCwyMDQpO2JvcmRlci1zdHlsZTpub25lIG5vbmUgbm9u
ZSBzb2xpZDtib3JkZXItd2lkdGg6bWVkaXVtIG1lZGl1bSBtZWRpdW0gMXB0O3BhZGRpbmc6MGlu
IDBpbiAwaW4gNnB0O21hcmdpbi1sZWZ0OjQuOHB0O21hcmdpbi1yaWdodDowaW4iPgo8ZGl2Pgo8
ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MC41aW4iPgpUaGVy
ZSBhcmUgdHdvIHdheXMuwqAgTm90ZSB0aGF0LCBzaW5jZSB5b3UmIzM5O3JlIGVuY3J5cHRpbmcg
b3V0c2lkZSB0aGUgVFBNLCB0aGUgJiMzOTtrZXkmIzM5OyBpcyBqdXN0IGEgYnl0ZSBzdHJlYW0g
dG8gdGhlIFRQTS48dT48L3U+PHU+PC91PjwvcD4KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9
Im1hcmdpbi1sZWZ0OjAuNWluIj4KwqA8dT48L3U+PHU+PC91PjwvcD4KPHAgc3R5bGU9Im1hcmdp
bi1sZWZ0OjFpbiI+Cjx1PjwvdT48c3Bhbj4xLjxzcGFuIHN0eWxlPSJmb250OjdwdCAmcXVvdDtU
aW1lcyBOZXcgUm9tYW4mcXVvdDsiPsKgwqDCoMKgwqDCoAo8L3NwYW4+PC9zcGFuPjx1PjwvdT5J
ZiB5b3UgaGF2ZSBzdG9yYWdlIGF2YWlsYWJsZSwgY3JlYXRlIHRoZSBrZXkgYXMgc2VhbGVkIGRh
dGEgdXNpbmcgJiMzOTtjcmVhdGUmIzM5Oy7CoCBSZXRyaWV2ZSB0aGUga2V5IHdpdGggJiMzOTt1
bnNlYWwmIzM5Oywgd2l0aCBhcHBsaWNhdGlvbiBzcGVjaWZpYyBhdXRob3JpemF0aW9uIGZvciB0
aGUgdW5zZWFsIG9wZXJhdGlvbi48dT48L3U+PHU+PC91PjwvcD4KPHAgc3R5bGU9Im1hcmdpbi1s
ZWZ0OjFpbiI+Cjx1PjwvdT48c3Bhbj4yLjxzcGFuIHN0eWxlPSJmb250OjdwdCAmcXVvdDtUaW1l
cyBOZXcgUm9tYW4mcXVvdDsiPsKgwqDCoMKgwqDCoAo8L3NwYW4+PC9zcGFuPjx1PjwvdT5JZiB5
b3UgaGF2ZSBubyBleHRlcm5hbCBzdG9yYWdlIGF2YWlsYWJsZSwgY3JlYXRlIHRoZSBrZXkgYXMg
YW4gTlYgaW5kZXggdXNpbmcgTlZkZWZpbmVzcGFjZS4gUmV0cmlldmUgdGhlIGtleSB1c2luZyBO
ViByZWFkLCBhZ2FpbiB3aXRoIGFwcGxpY2F0aW9uIHNwZWNpZmljIGF1dGhvcml6YXRpb24gZm9y
IHRoZSByZWFkLjx1PjwvdT48dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0i
bWFyZ2luLWxlZnQ6MC41aW4iPgrCoDx1PjwvdT48dT48L3U+PC9wPgo8L2Rpdj4KPC9kaXY+Cjwv
YmxvY2txdW90ZT4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KCjwvYmxvY2txdW90ZT48L2Rpdj48L2Rp
dj4KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============5808300425377417361==--

