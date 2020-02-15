Content-Type: multipart/mixed; boundary="===============4505123222491759494=="
MIME-Version: 1.0
From: Rowan Moul <lists at rowan.moul.ca>
Subject: [tpm2] Re: tpm2_createprimary question about unique field
Date: Sat, 15 Feb 2020 10:57:08 -0700
Message-ID: <3EF767B7-9F0E-443C-9E8C-9E13C69B65C2@rowan.moul.ca>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4505123222491759494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFAhh I think I get it!
The unique portion of a TPMT_PUBLIC is a TPMU_PUBLIC_ID, which is a TPM2B_P=
UBLIC_KEY_RSA when you are creating an RSA primary key.
That last one is a buffer structure: =E2=80=9CThe =E2=80=9CTPM2B_=E2=80=9D =
prefix is used for a structure that has a size field followed by a data buf=
fer with the indicated number of octets. The size field is 16 bits.=E2=80=
=9D
I don=E2=80=99t think it was reading past the end of the file, but past the=
 end of the unique data in memory at a later point in the process. I am usi=
ng the latest release (4.1.1), but these two bytes are still required to de=
fine the size of the data you are passing in. They don=E2=80=99t have to be=
 0x00 0x01 (which represents a size of 256 bytes when interpreted in little=
-endian byte order), but should match the size of the data that you are pas=
sing. So for my test case of 32 bytes it should actually be 0x20 0x00

Knowing this it seems like the man page is accurate, but perhaps further ex=
planation is needed if this is meant to be tool used by a less informed use=
r.
Alternatively the tool could be changed to set this two byte size internall=
y based on the file size that it reads in.

Rowan

>> On Feb 13, 2020, at 01:57, Niklas Andersson <niklas.andersson(a)fredenhe=
im.se> wrote:
> =EF=BB=BF
> Adding one byte should not be needed in the latest version I believe. Rea=
son the byte was skipped earlier is because it just contains the byte size =
of the following struct. When you output the struct to a file the file size=
 is obvious, and thus renders this byte obsolete. =

> =

> Hope this helps. =

> =

> - Niklas
> =

>> On Thu, Feb 13, 2020, 02:12 Rowan Moul <lists(a)rowan.moul.ca> wrote:
>> =EF=BB=BFWhat is the purpose of appending 0x00 0x01 to the beginning of =
the unique data?(https://github.com/tpm2-software/tpm2-tools/blob/master/ma=
n/tpm2_createprimary.1.md#create-a-primary-object-that-follows-the-guidance=
-of-tcg-provisioning-guide)
>> I'm sure it's just something obvious that I'm not seeing, but I can't se=
em to figure it out despite looking over the code and reading through TCG d=
ocuments.
>> All I can determine is that I get a "buffer_size: 4096 with offset: 46 a=
re insufficient for object of size 51919" error if I don't have it. The obj=
ect size reported varies depending on data that I pass in. The amount of da=
ta is always 32 random bytes in my tests, but randomly generated. The objec=
t size seems far too large, which leads me to believe that something is rea=
ding past the end of the file, although I didn't see any obvious issues in =
the code that reads the files.
>> =

>> It seems like more explanation is needed on the man page about the requi=
red format of this file, as the description given doesn't lead to the succe=
ssful creation of a primary key unless you understand that you are supposed=
 to add that to the front of the file rather than it just being an example.
>> =

>> Thanks,
>> =

>> Rowan
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============4505123222491759494==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPjxkaXYgZGlyPSJs
dHIiPu+7vzxtZXRhIGh0dHAtZXF1aXY9ImNvbnRlbnQtdHlwZSIgY29udGVudD0idGV4dC9odG1s
OyBjaGFyc2V0PXV0Zi04Ij5BaGggSSB0aGluayBJIGdldCBpdCE8ZGl2PlRoZSB1bmlxdWUgcG9y
dGlvbiBvZiBhIFRQTVRfUFVCTElDIGlzIGEgVFBNVV9QVUJMSUNfSUQsIHdoaWNoIGlzIGEgVFBN
MkJfUFVCTElDX0tFWV9SU0Egd2hlbiB5b3UgYXJlIGNyZWF0aW5nIGFuIFJTQSBwcmltYXJ5IGtl
eS48L2Rpdj48ZGl2PlRoYXQgbGFzdCBvbmUgaXMgYSBidWZmZXIgc3RydWN0dXJlOiDigJxUaGUg
4oCcVFBNMkJf4oCdIHByZWZpeCBpcyB1c2VkIGZvciBhIHN0cnVjdHVyZSB0aGF0IGhhcyBhIHNp
emUgZmllbGQgZm9sbG93ZWQgYnkgYSBkYXRhIGJ1ZmZlciB3aXRoIHRoZSBpbmRpY2F0ZWQgbnVt
YmVyIG9mIG9jdGV0cy4gVGhlIHNpemUgZmllbGQgaXMgMTYgYml0cy7igJ08L2Rpdj48ZGl2Pkkg
ZG9u4oCZdCB0aGluayBpdCB3YXMgcmVhZGluZyBwYXN0IHRoZSBlbmQgb2YgdGhlIGZpbGUsIGJ1
dCBwYXN0IHRoZSBlbmQgb2YgdGhlIHVuaXF1ZSBkYXRhIGluIG1lbW9yeSBhdCBhIGxhdGVyIHBv
aW50IGluIHRoZSBwcm9jZXNzLiBJIGFtIHVzaW5nIHRoZSBsYXRlc3QgcmVsZWFzZSAoNC4xLjEp
LCBidXQgdGhlc2UgdHdvIGJ5dGVzIGFyZSBzdGlsbCByZXF1aXJlZCB0byBkZWZpbmUgdGhlIHNp
emUgb2YgdGhlIGRhdGEgeW91IGFyZSBwYXNzaW5nIGluLiBUaGV5IGRvbuKAmXQgaGF2ZSB0byBi
ZSAweDAwIDB4MDEgKHdoaWNoIHJlcHJlc2VudHMgYSBzaXplIG9mIDI1NiBieXRlcyB3aGVuIGlu
dGVycHJldGVkIGluIGxpdHRsZS1lbmRpYW4gYnl0ZSBvcmRlciksIGJ1dCBzaG91bGQgbWF0Y2gg
dGhlIHNpemUgb2YgdGhlIGRhdGEgdGhhdCB5b3UgYXJlIHBhc3NpbmcuIFNvIGZvciBteSB0ZXN0
IGNhc2Ugb2YgMzIgYnl0ZXMgaXQgc2hvdWxkIGFjdHVhbGx5IGJlIDB4MjAgMHgwMDwvZGl2Pjxk
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Lbm93aW5nIHRoaXMgaXQgc2VlbXMgbGlrZSB0aGUgbWFu
IHBhZ2UgaXMgYWNjdXJhdGUsIGJ1dCBwZXJoYXBzIGZ1cnRoZXIgZXhwbGFuYXRpb24gaXMgbmVl
ZGVkIGlmIHRoaXMgaXMgbWVhbnQgdG8gYmUgdG9vbCB1c2VkIGJ5IGEgbGVzcyBpbmZvcm1lZCB1
c2VyLjwvZGl2PjxkaXY+QWx0ZXJuYXRpdmVseSB0aGUgdG9vbCBjb3VsZCBiZSBjaGFuZ2VkIHRv
IHNldCB0aGlzIHR3byBieXRlIHNpemUgaW50ZXJuYWxseSBiYXNlZCBvbiB0aGUgZmlsZSBzaXpl
IHRoYXQgaXQgcmVhZHMgaW4uPGJyPjxkaXYgZGlyPSJsdHIiPjxkaXY+PGJyPjwvZGl2PlJvd2Fu
PC9kaXY+PGRpdiBkaXI9Imx0ciI+PGJyPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPk9uIEZlYiAx
MywgMjAyMCwgYXQgMDE6NTcsIE5pa2xhcyBBbmRlcnNzb24gJmx0O25pa2xhcy5hbmRlcnNzb25A
ZnJlZGVuaGVpbS5zZSZndDsgd3JvdGU6PGJyPjxicj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSI+PGRpdiBkaXI9Imx0ciI+77u/PGRpdiBkaXI9ImF1dG8iPkFkZGlu
ZyBvbmUgYnl0ZSBzaG91bGQgbm90IGJlIG5lZWRlZCBpbiB0aGUgbGF0ZXN0IHZlcnNpb24gSSBi
ZWxpZXZlLiBSZWFzb24gdGhlIGJ5dGUgd2FzIHNraXBwZWQgZWFybGllciBpcyBiZWNhdXNlIGl0
IGp1c3QgY29udGFpbnMgdGhlIGJ5dGUgc2l6ZSBvZiB0aGUgZm9sbG93aW5nIHN0cnVjdC4gV2hl
biB5b3Ugb3V0cHV0IHRoZSBzdHJ1Y3QgdG8gYSBmaWxlIHRoZSBmaWxlIHNpemUgaXMgb2J2aW91
cywgYW5kIHRodXMgcmVuZGVycyB0aGlzIGJ5dGUgb2Jzb2xldGUuJm5ic3A7PGRpdiBkaXI9ImF1
dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+SG9wZSB0aGlzIGhlbHBzLiZuYnNwOzwvZGl2
PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPi0gTmlrbGFzPC9kaXY+
PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0i
Z21haWxfYXR0ciI+T24gVGh1LCBGZWIgMTMsIDIwMjAsIDAyOjEyIFJvd2FuIE1vdWwgJmx0Ozxh
IGhyZWY9Im1haWx0bzpsaXN0c0Byb3dhbi5tb3VsLmNhIj5saXN0c0Byb3dhbi5tb3VsLmNhPC9h
PiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5
bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmct
bGVmdDoxZXgiPjxkaXYgZGlyPSJhdXRvIj48ZGl2IGRpcj0ibHRyIj48Zm9udCBmYWNlPSJIZWx2
ZXRpY2EiPjxzcGFuIHN0eWxlPSJmb250LXN0eWxlOm5vcm1hbCI+77u/PHNwYW4gc3R5bGU9ImNv
bG9yOnJnYigzNiw0MSw0NikiPldoYXQgaXMgdGhlIHB1cnBvc2Ugb2YgYXBwZW5kaW5nIDB4MDAg
MHgwMSB0byB0aGUgYmVnaW5uaW5nIG9mIHRoZSB1bmlxdWUgZGF0YTwvc3Bhbj48c3BhbiBzdHls
ZT0iY29sb3I6cmdiKDM2LDQxLDQ2KSI+Pyg8L3NwYW4+PC9zcGFuPjwvZm9udD48YSBocmVmPSJo
dHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2Jsb2IvbWFzdGVyL21h
bi90cG0yX2NyZWF0ZXByaW1hcnkuMS5tZCNjcmVhdGUtYS1wcmltYXJ5LW9iamVjdC10aGF0LWZv
bGxvd3MtdGhlLWd1aWRhbmNlLW9mLXRjZy1wcm92aXNpb25pbmctZ3VpZGUiPmh0dHBzOi8vZ2l0
aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9tYXN0ZXIvbWFuL3RwbTJfY3Jl
YXRlcHJpbWFyeS4xLm1kI2NyZWF0ZS1hLXByaW1hcnktb2JqZWN0LXRoYXQtZm9sbG93cy10aGUt
Z3VpZGFuY2Utb2YtdGNnLXByb3Zpc2lvbmluZy1ndWlkZTwvYT4pPC9kaXY+PC9kaXY+PC9ibG9j
a3F1b3RlPjwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48
ZGl2IGRpcj0ibHRyIj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9
ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNj
Y2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9ImF1dG8iPjxkaXYgZGlyPSJsdHIi
Pjxmb250IGZhY2U9IkhlbHZldGljYSI+PHNwYW4gc3R5bGU9ImZvbnQtc3R5bGU6bm9ybWFsIj48
c3BhbiBzdHlsZT0iY29sb3I6cmdiKDM2LDQxLDQ2KSI+SSdtIHN1cmUgaXQncyBqdXN0IHNvbWV0
aGluZyBvYnZpb3VzIHRoYXQgSSdtIG5vdCBzZWVpbmcsIGJ1dCBJIGNhbid0IHNlZW0gdG8gZmln
dXJlIGl0IG91dCBkZXNwaXRlIGxvb2tpbmcgb3ZlciB0aGUgY29kZSBhbmQgcmVhZGluZyB0aHJv
dWdoIFRDRyBkb2N1bWVudHMuPC9zcGFuPjwvc3Bhbj48L2ZvbnQ+PGRpdiBkaXI9Imx0ciI+PHAg
c3R5bGU9Im1hcmdpbi1ib3R0b206MTJwdDtiYWNrZ3JvdW5kLWNvbG9yOndoaXRlIj48c3BhbiBz
dHlsZT0iY29sb3I6cmdiKDM2LDQxLDQ2KTtmb250LXN0eWxlOm5vcm1hbCI+PGZvbnQgZmFjZT0i
SGVsdmV0aWNhIj5BbGwgSSZuYnNwO2NhbiZuYnNwO2RldGVybWluZSBpcyB0aGF0IEkgZ2V0IGEg
ImJ1ZmZlcl9zaXplOiA0MDk2IHdpdGggb2Zmc2V0OiA0NiBhcmUgaW5zdWZmaWNpZW50IGZvciBv
YmplY3Qgb2Ygc2l6ZSA1MTkxOSIgZXJyb3IgaWYgSSBkb24ndCBoYXZlIGl0LiBUaGUgb2JqZWN0
IHNpemUgcmVwb3J0ZWQgdmFyaWVzIGRlcGVuZGluZyBvbiBkYXRhIHRoYXQgSSBwYXNzIGluLiBU
aGUgYW1vdW50IG9mIGRhdGEgaXMgYWx3YXlzIDMyIHJhbmRvbSBieXRlcyBpbiBteSB0ZXN0cywg
YnV0IHJhbmRvbWx5IGdlbmVyYXRlZC4gVGhlIG9iamVjdCBzaXplIHNlZW1zIGZhciB0b28gbGFy
Z2UsIHdoaWNoIGxlYWRzIG1lIHRvIGJlbGlldmUgdGhhdCBzb21ldGhpbmcgaXMgcmVhZGluZyBw
YXN0IHRoZSBlbmQgb2YgdGhlIGZpbGUsIGFsdGhvdWdoIEkgZGlkbid0IHNlZSBhbnkgb2J2aW91
cyBpc3N1ZXMgaW4gdGhlIGNvZGUgdGhhdCByZWFkcyB0aGUgZmlsZXMuPHU+PC91Pjx1PjwvdT48
L2ZvbnQ+PC9zcGFuPjwvcD48cCBzdHlsZT0ibWFyZ2luLXJpZ2h0OjBjbTttYXJnaW4tYm90dG9t
OjEycHQ7bWFyZ2luLWxlZnQ6MGNtO2JhY2tncm91bmQtY29sb3I6d2hpdGU7Ym94LXNpemluZzpi
b3JkZXItYm94O2ZvbnQtdmFyaWFudC1saWdhdHVyZXM6bm9ybWFsIj48c3BhbiBzdHlsZT0iY29s
b3I6cmdiKDM2LDQxLDQ2KTtmb250LXN0eWxlOm5vcm1hbCI+PGZvbnQgZmFjZT0iSGVsdmV0aWNh
Ij5JdCBzZWVtcyBsaWtlIG1vcmUgZXhwbGFuYXRpb24gaXMgbmVlZGVkIG9uIHRoZSBtYW4gcGFn
ZSBhYm91dCB0aGUgcmVxdWlyZWQgZm9ybWF0IG9mIHRoaXMgZmlsZSwgYXMgdGhlIGRlc2NyaXB0
aW9uIGdpdmVuIGRvZXNuJ3QgbGVhZCB0byB0aGUgc3VjY2Vzc2Z1bCBjcmVhdGlvbiBvZiBhIHBy
aW1hcnkga2V5IHVubGVzcyB5b3UgdW5kZXJzdGFuZCB0aGF0IHlvdSBhcmUgc3VwcG9zZWQgdG8g
YWRkIHRoYXQgdG8gdGhlIGZyb250IG9mIHRoZSBmaWxlIHJhdGhlciB0aGFuIGl0IGp1c3QgYmVp
bmcgYW4gZXhhbXBsZS48L2ZvbnQ+PC9zcGFuPjwvcD48cCBzdHlsZT0ibWFyZ2luLWJvdHRvbTox
MnB0O2JhY2tncm91bmQtY29sb3I6d2hpdGUiPjxmb250IGZhY2U9IkhlbHZldGljYSI+PHNwYW4g
c3R5bGU9ImZvbnQtc3R5bGU6bm9ybWFsIj5UaGFua3MsPC9zcGFuPjwvZm9udD48L3A+PGZvbnQg
ZmFjZT0iSGVsdmV0aWNhIj48c3BhbiBzdHlsZT0iZm9udC1zdHlsZTpub3JtYWwiPlJvd2FuPC9z
cGFuPjwvZm9udD48L2Rpdj48L2Rpdj48L2Rpdj5fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXzxicj4KdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFp
bHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj50
cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8g
PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayIg
cmVsPSJub3JlZmVycmVyIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+CiUod2ViX3Bh
Z2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPC9ibG9ja3F1b3Rl
PjwvZGl2Pgo8L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+PC9kaXY+PC9ib2R5PjwvaHRt
bD4=
--===============4505123222491759494==--

