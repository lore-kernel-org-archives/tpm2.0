Content-Type: multipart/mixed; boundary="===============2044414608870251162=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: does -p (password) work with tpm2_import ?
Date: Mon, 26 Apr 2021 17:40:14 +0000
Message-ID: <SN6PR11MB3437131DCDA9A9C14C13F392B8429@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 0a7359ab-4d4b-aa5d-bb6e-0d92da9bd364@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2044414608870251162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Seems to work for me, what version of the tools are you using?

I modified the test and it seems to work as expected (if I drop the passwor=
d in tpm2 sign it fails)

git diff
diff --git a/test/integration/tests/import.sh b/test/integration/tests/impo=
rt.sh
index ff8f9b3b96eb..d22cdb41a73b 100644
--- a/test/integration/tests/import.sh
+++ b/test/integration/tests/import.sh
@@ -117,13 +117,13 @@ run_ecc_import_test() {
     shasum -a 256 data.in.raw | awk '{ print "000000 " $1 }' | xxd -r -c 3=
2 > \
     data.in.digest

-    tpm2 import -Q -G ecc -g "$name_alg" -i private.ecc.pem -C $1 -u ecc.p=
ub \
+    tpm2 import -Q -G ecc -g "$name_alg" -p password -i private.ecc.pem -C=
 $1 -u ecc.pub \
     -r ecc.priv

     tpm2 load -Q -C $1 -u ecc.pub -r ecc.priv -n ecc.name -c ecc.ctx

     # Sign in the TPM and verify with OSSL
-    tpm2 sign -Q -c ecc.ctx -g sha256 -d -f plain -o data.out.signed \
+    tpm2 sign -Q -c ecc.ctx -p password -g sha256 -d -f plain -o data.out.=
signed \
     data.in.digest
     openssl dgst -verify public.ecc.pem -keyform pem -sha256 \
     -signature data.out.signed data.in.raw

________________________________
From: Ted Kim <ted.h.kim(a)oracle.com>
Sent: Monday, April 19, 2021 4:24 PM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Re: does -p (password) work with tpm2_import ?


On 4/16/21 11:28 AM, Ted Kim wrote:
> Folks,
>
> I tried tpm2_import with the -p option with a password, and it doesn't
> seem to work for me.
>
> Subsequent tpm2_rsadecrypt commands using the key from the import seem
> to work fine without any -p option.
>
> * Does import work with -p ?  Is there something I have overlooked in
> this?

Further, if you actually supply the correct password to tpm2_rsadecrypt
command with the -p option, you get an auth error:

WARNING:esys:src/tss2-esys/api/Esys_RSA_Decrypt.c:305:Esys_RSA_Decrypt_Fini=
sh()
Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_RSA_Decrypt.c:102:Esys_RSA_Decrypt()
Esys Finish ErrorCode (0x0000098e)
ERROR: Esys_RSA_Decrypt(0x98E) - tpm:session(1):the authorization HMAC
check failed and DA counter incremented
ERROR: Unable to run tpm2_rsadecrypt


Trying this same sequence with a key created with tpm2_create works
fine, so am thinking there is something wrong with tpm2_import not
processing the -p properly.

Can the maintainers look into this?

Thanks,
-ted



>
>
>
> I understand that tpm2_rsaencrypt does not take the -p option in line
> with the idea of using a "public" key.
>
> * Is it correct to say that if I want to have authorization on
> encryption, I have to use tpm2_encryptdecrypt (i.e. use symmetric keys) ?
>
>
>
> Thanks,
>
> -ted
>
>
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============2044414608870251162==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KU2VlbXMgdG8gd29yayBmb3IgbWUsIHdoYXQgdmVyc2lvbiBvZiB0
aGUgdG9vbHMgYXJlIHlvdSB1c2luZz88YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWls
eTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0
OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+Cjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFt
aWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEy
cHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KSSBtb2RpZmllZCB0aGUgdGVzdCBhbmQgaXQgc2Vl
bXMgdG8gd29yayBhcyBleHBlY3RlZCAoaWYgSSBkcm9wIHRoZSBwYXNzd29yZCBpbiB0cG0yIHNp
Z24gaXQgZmFpbHMpPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlh
bCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwg
MCwgMCk7Ij4KPGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFy
aWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigw
LCAwLCAwKTsiPgpnaXQgZGlmZgo8ZGl2PmRpZmYgLS1naXQgYS90ZXN0L2ludGVncmF0aW9uL3Rl
c3RzL2ltcG9ydC5zaCBiL3Rlc3QvaW50ZWdyYXRpb24vdGVzdHMvaW1wb3J0LnNoPC9kaXY+Cjxk
aXY+aW5kZXggZmY4ZjliM2I5NmViLi5kMjJjZGI0MWE3M2IgMTAwNjQ0PC9kaXY+CjxkaXY+LS0t
IGEvdGVzdC9pbnRlZ3JhdGlvbi90ZXN0cy9pbXBvcnQuc2g8L2Rpdj4KPGRpdj4rKysgYi90ZXN0
L2ludGVncmF0aW9uL3Rlc3RzL2ltcG9ydC5zaDwvZGl2Pgo8ZGl2PkBAIC0xMTcsMTMgKzExNywx
MyBAQCBydW5fZWNjX2ltcG9ydF90ZXN0KCkgezwvZGl2Pgo8ZGl2PiZuYnNwOyAmbmJzcDsgJm5i
c3A7c2hhc3VtIC1hIDI1NiBkYXRhLmluLnJhdyB8IGF3ayAneyBwcmludCAmcXVvdDswMDAwMDAg
JnF1b3Q7ICQxIH0nIHwgeHhkIC1yIC1jIDMyICZndDsgXDwvZGl2Pgo8ZGl2PiZuYnNwOyAmbmJz
cDsgJm5ic3A7ZGF0YS5pbi5kaWdlc3Q8L2Rpdj4KPGRpdj4mbmJzcDs8L2Rpdj4KPGRpdj4tICZu
YnNwOyAmbmJzcDt0cG0yIGltcG9ydCAtUSAtRyBlY2MgLWcgJnF1b3Q7JG5hbWVfYWxnJnF1b3Q7
IC1pIHByaXZhdGUuZWNjLnBlbSAtQyAkMSAtdSBlY2MucHViIFw8L2Rpdj4KPGRpdj4rICZuYnNw
OyAmbmJzcDt0cG0yIGltcG9ydCAtUSAtRyBlY2MgLWcgJnF1b3Q7JG5hbWVfYWxnJnF1b3Q7IC1w
IHBhc3N3b3JkIC1pIHByaXZhdGUuZWNjLnBlbSAtQyAkMSAtdSBlY2MucHViIFw8L2Rpdj4KPGRp
dj4mbmJzcDsgJm5ic3A7ICZuYnNwOy1yIGVjYy5wcml2PC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+
CjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDt0cG0yIGxvYWQgLVEgLUMgJDEgLXUgZWNjLnB1YiAt
ciBlY2MucHJpdiAtbiBlY2MubmFtZSAtYyBlY2MuY3R4PC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+
CjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDsjIFNpZ24gaW4gdGhlIFRQTSBhbmQgdmVyaWZ5IHdp
dGggT1NTTDwvZGl2Pgo8ZGl2Pi0gJm5ic3A7ICZuYnNwO3RwbTIgc2lnbiAtUSAtYyBlY2MuY3R4
IC1nIHNoYTI1NiAtZCAtZiBwbGFpbiAtbyBkYXRhLm91dC5zaWduZWQgXDwvZGl2Pgo8ZGl2Pisg
Jm5ic3A7ICZuYnNwO3RwbTIgc2lnbiAtUSAtYyBlY2MuY3R4IC1wIHBhc3N3b3JkIC1nIHNoYTI1
NiAtZCAtZiBwbGFpbiAtbyBkYXRhLm91dC5zaWduZWQgXDwvZGl2Pgo8ZGl2PiZuYnNwOyAmbmJz
cDsgJm5ic3A7ZGF0YS5pbi5kaWdlc3Q8L2Rpdj4KPGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwO29w
ZW5zc2wgZGdzdCAtdmVyaWZ5IHB1YmxpYy5lY2MucGVtIC1rZXlmb3JtIHBlbSAtc2hhMjU2IFw8
L2Rpdj4KPGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwOy1zaWduYXR1cmUgZGF0YS5vdXQuc2lnbmVk
IGRhdGEuaW4ucmF3PC9kaXY+Cjxicj4KPC9kaXY+CjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9k
aXY+CjxociBzdHlsZT0iZGlzcGxheTppbmxpbmUtYmxvY2s7d2lkdGg6OTglIiB0YWJpbmRleD0i
LTEiPgo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0iQ2FsaWJy
aSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAwMDAwMCI+PGI+
RnJvbTo8L2I+IFRlZCBLaW0gJmx0O3RlZC5oLmtpbUBvcmFjbGUuY29tJmd0Ozxicj4KPGI+U2Vu
dDo8L2I+IE1vbmRheSwgQXByaWwgMTksIDIwMjEgNDoyNCBQTTxicj4KPGI+VG86PC9iPiB0cG0y
QGxpc3RzLjAxLm9yZyAmbHQ7dHBtMkBsaXN0cy4wMS5vcmcmZ3Q7PGJyPgo8Yj5TdWJqZWN0Ojwv
Yj4gW3RwbTJdIFJlOiBkb2VzIC1wIChwYXNzd29yZCkgd29yayB3aXRoIHRwbTJfaW1wb3J0ID88
L2ZvbnQ+CjxkaXY+Jm5ic3A7PC9kaXY+CjwvZGl2Pgo8ZGl2IGNsYXNzPSJCb2R5RnJhZ21lbnQi
Pjxmb250IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPgo8ZGl2IGNsYXNz
PSJQbGFpblRleHQiPjxicj4KT24gNC8xNi8yMSAxMToyOCBBTSwgVGVkIEtpbSB3cm90ZTo8YnI+
CiZndDsgRm9sa3MsPGJyPgomZ3Q7PGJyPgomZ3Q7IEkgdHJpZWQgdHBtMl9pbXBvcnQgd2l0aCB0
aGUgLXAgb3B0aW9uIHdpdGggYSBwYXNzd29yZCwgYW5kIGl0IGRvZXNuJ3QgPGJyPgomZ3Q7IHNl
ZW0gdG8gd29yayBmb3IgbWUuPGJyPgomZ3Q7PGJyPgomZ3Q7IFN1YnNlcXVlbnQgdHBtMl9yc2Fk
ZWNyeXB0IGNvbW1hbmRzIHVzaW5nIHRoZSBrZXkgZnJvbSB0aGUgaW1wb3J0IHNlZW0gPGJyPgom
Z3Q7IHRvIHdvcmsgZmluZSB3aXRob3V0IGFueSAtcCBvcHRpb24uPGJyPgomZ3Q7PGJyPgomZ3Q7
ICogRG9lcyBpbXBvcnQgd29yayB3aXRoIC1wID8mbmJzcDsgSXMgdGhlcmUgc29tZXRoaW5nIEkg
aGF2ZSBvdmVybG9va2VkIGluIDxicj4KJmd0OyB0aGlzPzxicj4KPGJyPgpGdXJ0aGVyLCBpZiB5
b3UgYWN0dWFsbHkgc3VwcGx5IHRoZSBjb3JyZWN0IHBhc3N3b3JkIHRvIHRwbTJfcnNhZGVjcnlw
dCA8YnI+CmNvbW1hbmQgd2l0aCB0aGUgLXAgb3B0aW9uLCB5b3UgZ2V0IGFuIGF1dGggZXJyb3I6
PGJyPgo8YnI+CldBUk5JTkc6ZXN5czpzcmMvdHNzMi1lc3lzL2FwaS9Fc3lzX1JTQV9EZWNyeXB0
LmM6MzA1OkVzeXNfUlNBX0RlY3J5cHRfRmluaXNoKCkgPGJyPgpSZWNlaXZlZCBUUE0gRXJyb3I8
YnI+CkVSUk9SOmVzeXM6c3JjL3RzczItZXN5cy9hcGkvRXN5c19SU0FfRGVjcnlwdC5jOjEwMjpF
c3lzX1JTQV9EZWNyeXB0KCkgPGJyPgpFc3lzIEZpbmlzaCBFcnJvckNvZGUgKDB4MDAwMDA5OGUp
PGJyPgpFUlJPUjogRXN5c19SU0FfRGVjcnlwdCgweDk4RSkgLSB0cG06c2Vzc2lvbigxKTp0aGUg
YXV0aG9yaXphdGlvbiBITUFDIDxicj4KY2hlY2sgZmFpbGVkIGFuZCBEQSBjb3VudGVyIGluY3Jl
bWVudGVkPGJyPgpFUlJPUjogVW5hYmxlIHRvIHJ1biB0cG0yX3JzYWRlY3J5cHQ8YnI+Cjxicj4K
PGJyPgpUcnlpbmcgdGhpcyBzYW1lIHNlcXVlbmNlIHdpdGggYSBrZXkgY3JlYXRlZCB3aXRoIHRw
bTJfY3JlYXRlIHdvcmtzIDxicj4KZmluZSwgc28gYW0gdGhpbmtpbmcgdGhlcmUgaXMgc29tZXRo
aW5nIHdyb25nIHdpdGggdHBtMl9pbXBvcnQgbm90IDxicj4KcHJvY2Vzc2luZyB0aGUgLXAgcHJv
cGVybHkuPGJyPgo8YnI+CkNhbiB0aGUgbWFpbnRhaW5lcnMgbG9vayBpbnRvIHRoaXM/PGJyPgo8
YnI+ClRoYW5rcyw8YnI+Ci10ZWQ8YnI+Cjxicj4KPGJyPgo8YnI+CiZndDs8YnI+CiZndDs8YnI+
CiZndDs8YnI+CiZndDsgSSB1bmRlcnN0YW5kIHRoYXQgdHBtMl9yc2FlbmNyeXB0IGRvZXMgbm90
IHRha2UgdGhlIC1wIG9wdGlvbiBpbiBsaW5lIDxicj4KJmd0OyB3aXRoIHRoZSBpZGVhIG9mIHVz
aW5nIGEgJnF1b3Q7cHVibGljJnF1b3Q7IGtleS48YnI+CiZndDs8YnI+CiZndDsgKiBJcyBpdCBj
b3JyZWN0IHRvIHNheSB0aGF0IGlmIEkgd2FudCB0byBoYXZlIGF1dGhvcml6YXRpb24gb24gPGJy
PgomZ3Q7IGVuY3J5cHRpb24sIEkgaGF2ZSB0byB1c2UgdHBtMl9lbmNyeXB0ZGVjcnlwdCAoaS5l
LiB1c2Ugc3ltbWV0cmljIGtleXMpID88YnI+CiZndDs8YnI+CiZndDs8YnI+CiZndDs8YnI+CiZn
dDsgVGhhbmtzLDxicj4KJmd0Ozxicj4KJmd0OyAtdGVkPGJyPgomZ3Q7PGJyPgomZ3Q7PGJyPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KdHBtMiBt
YWlsaW5nIGxpc3QgLS0gdHBtMkBsaXN0cy4wMS5vcmc8YnI+ClRvIHVuc3Vic2NyaWJlIHNlbmQg
YW4gZW1haWwgdG8gdHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8YnI+CiUod2ViX3BhZ2VfdXJsKXNs
aXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPC9kaXY+Cjwvc3Bhbj48L2ZvbnQ+
PC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============2044414608870251162==--

