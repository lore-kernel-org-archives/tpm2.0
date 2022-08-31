Content-Type: multipart/mixed; boundary="===============0908633124706141650=="
MIME-Version: 1.0
From: David Challener <david.c.challener at gmail.com>
Subject: [tpm2] Re: seal with external public EK
Date: Wed, 31 Aug 2022 17:32:09 -0400
Message-ID: <CAAeabfbMPW2M3jZS-VM9qpmYg0j9-Ac_Y5xSS5cC6XuiH1H6OA@mail.gmail.com>
In-Reply-To: FR0P281MB170641DAAFCCBBC8E9EFC847D1789@FR0P281MB1706.DEUP281.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0908633124706141650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have always wondered what the purpose of doing the encryption/decryption
on the TPM is. It may keep the key out of view, but it never keeps the
encrypted DATA out of view. (Presuming good practices are followed so the
key is only used once.) So the decrypted doc is going to be available on
both devices. Devices can encrypt/decrypt much faster than a TPM that can
do the encryption/decryption.
So what is the reason you want to do that?

On Wed, Aug 31, 2022 at 10:32 AM Gadacz, Henry <
henry.gadacz(a)sit.fraunhofer.de> wrote:

> Hello everyone,
>
>
>
> I want to encrypt a larger file on TPM A and decrypt it on TPM B. To share
> a symmetric key for that I have TPM B=E2=80=99s public endorsement keys o=
n TPM A.
> The EK of TPM B is created and persisted as followed:
>
> tpm2_createek -P endPW -w ownerPW -c $EK_HANDLE -G rsa
>
>
>
> The public part is exported with:
>
> pm2_readpublic -c $EK_HANDLE -o B_EK.pem -f pem
>
>
>
> On TPM A I load the public EK key of TPM B:
>
> tpm2_loadexternal -C o -G rsa -u B_EK.pem -c B_EK.ctx
>
>
>
> To seal random data that is used as symmetric key to the TPM B EK I tried:
>
> tpm2_getrandom --hex 32 | tpm2_create -C B_EK.ctx -i- -u
> A_transportKey_pub.seal -r A_transportKey_priv.seal
>
>
>
> But I always get the following error:
>
> WARNING:esys:src/tss2-esys/api/Esys_Create.c:399:Esys_Create_Finish()
> Received TPM Error
>
> ERROR:esys:src/tss2-esys/api/Esys_Create.c:134:Esys_Create() Esys Finish
> ErrorCode (0x0000012f)
>
> ERROR: Esys_Create(0x12F) - tpm:error(2.0): authValue or authPolicy is not
> available for selected entity
>
> ERROR: Unable to run tpm2_create
>
>
>
> Why is an authValue or authPolicy required? I created the EK without
> authorization value or policy.
>
>
>
> I want to use the sealing method instead of tpm2_rsaencrypt to be able to
> process the symmetric key inside TPM B when doing the decryption and don=
=E2=80=99t
> need to store a file with the symmetric key on the disk.
>
>
>
> Any help on what=E2=80=99s the problem or other suggestions to solve this=
 task are
> really appreciated.
>
>
>
> Best Regards,
>
> Henry
>
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============0908633124706141650==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5JIGhhdmUgYWx3YXlzIHdvbmRlcmVkIHdoYXQgdGhlIHB1cnBv
c2Ugb2YgZG9pbmcgdGhlIGVuY3J5cHRpb24vZGVjcnlwdGlvbiBvbiB0aGUgVFBNIGlzLiBJdCBt
YXkga2VlcCB0aGUga2V5IG91dCBvZiB2aWV3LCBidXQgaXQgbmV2ZXIga2VlcHMgdGhlIGVuY3J5
cHRlZCBEQVRBIG91dCBvZiB2aWV3LiAoUHJlc3VtaW5nIGdvb2QgcHJhY3RpY2VzIGFyZSBmb2xs
b3dlZCBzbyB0aGUga2V5IGlzIG9ubHkgdXNlZCBvbmNlLikgU28gdGhlIGRlY3J5cHRlZCBkb2Mg
aXMgZ29pbmcgdG8gYmUgYXZhaWxhYmxlIG9uIGJvdGggZGV2aWNlcy4gRGV2aWNlcyBjYW4gZW5j
cnlwdC9kZWNyeXB0IG11Y2ggZmFzdGVyIHRoYW4gYSBUUE0gdGhhdCBjYW4gZG8gdGhlIGVuY3J5
cHRpb24vZGVjcnlwdGlvbi48L2Rpdj48ZGl2PlNvIHdoYXQgaXMgdGhlIHJlYXNvbiB5b3Ugd2Fu
dCB0byBkbyB0aGF0Pzxicj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUi
PjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBXZWQsIEF1ZyAzMSwgMjAyMiBh
dCAxMDozMiBBTSBHYWRhY3osIEhlbnJ5ICZsdDs8YSBocmVmPSJtYWlsdG86aGVucnkuZ2FkYWN6
QHNpdC5mcmF1bmhvZmVyLmRlIj5oZW5yeS5nYWRhY3pAc2l0LmZyYXVuaG9mZXIuZGU8L2E+Jmd0
OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0i
bWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIw
NCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgY2xhc3M9Im1zZy04MDU1NjA0MDUzMjc5NjA3
ODA5Ij48ZGl2IHN0eWxlPSJvdmVyZmxvdy13cmFwOiBicmVhay13b3JkOyIgbGFuZz0iRU4tVVMi
PjxkaXYgY2xhc3M9Im1fLTgwNTU2MDQwNTMyNzk2MDc4MDlXb3JkU2VjdGlvbjEiPjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkRFIj5IZWxsbyBldmVyeW9uZSw8dT48L3U+PHU+PC91
Pjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iREUiPjx1PjwvdT7C
oDx1PjwvdT48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiPkkgd2FudCB0byBlbmNyeXB0
IGEgbGFyZ2VyIGZpbGUgb24gVFBNIEEgYW5kIGRlY3J5cHQgaXQgb24gVFBNIEIuIFRvIHNoYXJl
IGEgc3ltbWV0cmljIGtleSBmb3IgdGhhdCBJIGhhdmUgVFBNIELigJlzIHB1YmxpYyBlbmRvcnNl
bWVudCBrZXlzIG9uIFRQTSBBLiBUaGUgRUsgb2YgVFBNIEIgaXMgY3JlYXRlZCBhbmQgcGVyc2lz
dGVkIGFzIGZvbGxvd2VkOjx1PjwvdT48dT48L3U+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiPnRw
bTJfY3JlYXRlZWsgLVAgZW5kUFcgLXcgb3duZXJQVyAtYyAkRUtfSEFORExFIC1HIHJzYSA8dT48
L3U+PHU+PC91PjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIj48dT48L3U+wqA8dT48L3U+PC9wPjxw
IGNsYXNzPSJNc29Ob3JtYWwiPlRoZSBwdWJsaWMgcGFydCBpcyBleHBvcnRlZCB3aXRoOjx1Pjwv
dT48dT48L3U+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiPnBtMl9yZWFkcHVibGljIC1jICRFS19I
QU5ETEUgLW8gQl9FSy5wZW0gLWYgcGVtPHU+PC91Pjx1PjwvdT48L3A+PHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHU+PC91PsKgPHU+PC91PjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIj5PbiBUUE0gQSBJ
IGxvYWQgdGhlIHB1YmxpYyBFSyBrZXkgb2YgVFBNIEI6PHU+PC91Pjx1PjwvdT48L3A+PHAgY2xh
c3M9Ik1zb05vcm1hbCI+dHBtMl9sb2FkZXh0ZXJuYWwgLUMgbyAtRyByc2EgLXUgQl9FSy5wZW0g
LWMgQl9FSy5jdHg8dT48L3U+PHU+PC91PjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIj48dT48L3U+
wqA8dT48L3U+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRvIHNlYWwgcmFuZG9tIGRhdGEgdGhh
dCBpcyB1c2VkIGFzIHN5bW1ldHJpYyBrZXkgdG8gdGhlIFRQTSBCIEVLIEkgdHJpZWQ6PHU+PC91
Pjx1PjwvdT48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCI+dHBtMl9nZXRyYW5kb20gLS1oZXggMzIg
fCB0cG0yX2NyZWF0ZSAtQyBCX0VLLmN0eCAtaS0gLXUgQV90cmFuc3BvcnRLZXlfcHViLnNlYWwg
LXIgQV90cmFuc3BvcnRLZXlfcHJpdi5zZWFsPHU+PC91Pjx1PjwvdT48L3A+PHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHU+PC91PsKgPHU+PC91PjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIj5CdXQgSSBh
bHdheXMgZ2V0IHRoZSBmb2xsb3dpbmcgZXJyb3I6PHU+PC91Pjx1PjwvdT48L3A+PHAgY2xhc3M9
Ik1zb05vcm1hbCI+V0FSTklORzplc3lzOnNyYy90c3MyLWVzeXMvYXBpL0VzeXNfQ3JlYXRlLmM6
Mzk5OkVzeXNfQ3JlYXRlX0ZpbmlzaCgpIFJlY2VpdmVkIFRQTSBFcnJvciA8dT48L3U+PHU+PC91
PjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIj5FUlJPUjplc3lzOnNyYy90c3MyLWVzeXMvYXBpL0Vz
eXNfQ3JlYXRlLmM6MTM0OkVzeXNfQ3JlYXRlKCkgRXN5cyBGaW5pc2ggRXJyb3JDb2RlICgweDAw
MDAwMTJmKSA8dT48L3U+PHU+PC91PjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIj5FUlJPUjogRXN5
c19DcmVhdGUoMHgxMkYpIC0gdHBtOmVycm9yKDIuMCk6IGF1dGhWYWx1ZSBvciBhdXRoUG9saWN5
IGlzIG5vdCBhdmFpbGFibGUgZm9yIHNlbGVjdGVkIGVudGl0eTx1PjwvdT48dT48L3U+PC9wPjxw
IGNsYXNzPSJNc29Ob3JtYWwiPkVSUk9SOiBVbmFibGUgdG8gcnVuIHRwbTJfY3JlYXRlPHU+PC91
Pjx1PjwvdT48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHU+PC91PsKgPHU+PC91PjwvcD48cCBj
bGFzcz0iTXNvTm9ybWFsIj5XaHkgaXMgYW4gYXV0aFZhbHVlIG9yIGF1dGhQb2xpY3kgcmVxdWly
ZWQ/IEkgY3JlYXRlZCB0aGUgRUsgd2l0aG91dCBhdXRob3JpemF0aW9uIHZhbHVlIG9yIHBvbGlj
eS4gPHU+PC91Pjx1PjwvdT48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHU+PC91PsKgPHU+PC91
PjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIj5JIHdhbnQgdG8gdXNlIHRoZSBzZWFsaW5nIG1ldGhv
ZCBpbnN0ZWFkIG9mIHRwbTJfcnNhZW5jcnlwdCB0byBiZSBhYmxlIHRvIHByb2Nlc3MgdGhlIHN5
bW1ldHJpYyBrZXkgaW5zaWRlIFRQTSBCIHdoZW4gZG9pbmcgdGhlIGRlY3J5cHRpb24gYW5kIGRv
buKAmXQgbmVlZCB0byBzdG9yZSBhIGZpbGUgd2l0aCB0aGUgc3ltbWV0cmljIGtleSBvbiB0aGUg
ZGlzay48dT48L3U+PHU+PC91PjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIj48dT48L3U+wqA8dT48
L3U+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiPkFueSBoZWxwIG9uIHdoYXTigJlzIHRoZSBwcm9i
bGVtIG9yIG90aGVyIHN1Z2dlc3Rpb25zIHRvIHNvbHZlIHRoaXMgdGFzayBhcmUgcmVhbGx5IGFw
cHJlY2lhdGVkLjx1PjwvdT48dT48L3U+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7C
oDx1PjwvdT48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCI+QmVzdCBSZWdhcmRzLDx1PjwvdT48dT48
L3U+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhlbnJ5PHU+PC91Pjx1PjwvdT48L3A+PHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHU+PC91PsKgPHU+PC91PjwvcD48L2Rpdj48L2Rpdj5fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KdHBtMiBtYWlsaW5nIGxp
c3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+
dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRv
IDxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
PnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZv
JShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============0908633124706141650==--

