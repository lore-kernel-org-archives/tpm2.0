Content-Type: multipart/mixed; boundary="===============8991587334385808386=="
MIME-Version: 1.0
From: Ted Kim <ted.h.kim at oracle.com>
Subject: [tpm2] Re: [External] : Re: Re: does -p (password) work with
 tpm2_import ?
Date: Mon, 26 Apr 2021 15:40:00 -0700
Message-ID: <7f0e8d3e-7472-f0dc-c74f-c77e571e5904@oracle.com>
In-Reply-To: SN6PR11MB3437131DCDA9A9C14C13F392B8429@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8991587334385808386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi William,


I am using tpm2-tools-4.3 (tpm2-tss-3.0.1).


I don't know if this would make any difference, but my tpm2_import =

situation is somewhat different. I am taking in something created from =

tpm2_duplicate using a policy constructed with tpm2_policyduplicationselect.


It does seem I can workaround this by using tpm2_changeauth to add the =

password. But for whatever reason when I put -p directly in the =

tpm2_import, it does not seem to take.


Thanks,
-ted


On 4/26/21 10:40 AM, Roberts, William C wrote:
> Seems to work for me, what version of the tools are you using?
>
> I modified the test and it seems to work as expected (if I drop the =

> password in tpm2 sign it fails)
>
> git diff
> diff --git a/test/integration/tests/import.sh =

> b/test/integration/tests/import.sh
> index ff8f9b3b96eb..d22cdb41a73b 100644
> --- a/test/integration/tests/import.sh
> +++ b/test/integration/tests/import.sh
> @@ -117,13 +117,13 @@ run_ecc_import_test() {
> =C2=A0 =C2=A0 =C2=A0shasum -a 256 data.in.raw | awk '{ print "000000 " $1=
 }' | xxd -r =

> -c 32 > \
> =C2=A0 =C2=A0 =C2=A0data.in.digest
> - =C2=A0 =C2=A0tpm2 import -Q -G ecc -g "$name_alg" -i private.ecc.pem -C=
 $1 -u =

> ecc.pub \
> + =C2=A0 =C2=A0tpm2 import -Q -G ecc -g "$name_alg" -p password -i =

> private.ecc.pem -C $1 -u ecc.pub \
> =C2=A0 =C2=A0 =C2=A0-r ecc.priv
> =C2=A0 =C2=A0 =C2=A0tpm2 load -Q -C $1 -u ecc.pub -r ecc.priv -n ecc.name=
 -c ecc.ctx
> =C2=A0 =C2=A0 =C2=A0# Sign in the TPM and verify with OSSL
> - =C2=A0 =C2=A0tpm2 sign -Q -c ecc.ctx -g sha256 -d -f plain -o data.out.=
signed \
> + =C2=A0 =C2=A0tpm2 sign -Q -c ecc.ctx -p password -g sha256 -d -f plain =
-o =

> data.out.signed \
> =C2=A0 =C2=A0 =C2=A0data.in.digest
> =C2=A0 =C2=A0 =C2=A0openssl dgst -verify public.ecc.pem -keyform pem -sha=
256 \
> =C2=A0 =C2=A0 =C2=A0-signature data.out.signed data.in.raw
>
> ------------------------------------------------------------------------
> *From:* Ted Kim <ted.h.kim(a)oracle.com>
> *Sent:* Monday, April 19, 2021 4:24 PM
> *To:* tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> *Subject:* [tpm2] Re: does -p (password) work with tpm2_import ?
>
> On 4/16/21 11:28 AM, Ted Kim wrote:
> > Folks,
> >
> > I tried tpm2_import with the -p option with a password, and it doesn't
> > seem to work for me.
> >
> > Subsequent tpm2_rsadecrypt commands using the key from the import seem
> > to work fine without any -p option.
> >
> > * Does import work with -p ?=C2=A0 Is there something I have overlooked=
 in
> > this?
>
> Further, if you actually supply the correct password to tpm2_rsadecrypt
> command with the -p option, you get an auth error:
>
> WARNING:esys:src/tss2-esys/api/Esys_RSA_Decrypt.c:305:Esys_RSA_Decrypt_Fi=
nish() =

>
> Received TPM Error
> ERROR:esys:src/tss2-esys/api/Esys_RSA_Decrypt.c:102:Esys_RSA_Decrypt()
> Esys Finish ErrorCode (0x0000098e)
> ERROR: Esys_RSA_Decrypt(0x98E) - tpm:session(1):the authorization HMAC
> check failed and DA counter incremented
> ERROR: Unable to run tpm2_rsadecrypt
>
>
> Trying this same sequence with a key created with tpm2_create works
> fine, so am thinking there is something wrong with tpm2_import not
> processing the -p properly.
>
> Can the maintainers look into this?
>
> Thanks,
> -ted
>
>
>
> >
> >
> >
> > I understand that tpm2_rsaencrypt does not take the -p option in line
> > with the idea of using a "public" key.
> >
> > * Is it correct to say that if I want to have authorization on
> > encryption, I have to use tpm2_encryptdecrypt (i.e. use symmetric =

> keys) ?
> >
> >
> >
> > Thanks,
> >
> > -ted
> >
> >
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============8991587334385808386==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+CjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4
dC9odG1sOyBjaGFyc2V0PVdpbmRvd3MtMTI1MiI+CiAgPC9oZWFkPgogIDxib2R5PgogICAgPHA+
SGkgV2lsbGlhbSw8L3A+CiAgICA8cD48YnI+CiAgICA8L3A+CiAgICA8cD5JIGFtIHVzaW5nIHRw
bTItdG9vbHMtNC4zICh0cG0yLXRzcy0zLjAuMSkuPC9wPgogICAgPHA+PGJyPgogICAgPC9wPgog
ICAgPHA+SSBkb24ndCBrbm93IGlmIHRoaXMgd291bGQgbWFrZSBhbnkgZGlmZmVyZW5jZSwgYnV0
IG15CiAgICAgIHRwbTJfaW1wb3J0IHNpdHVhdGlvbiBpcyBzb21ld2hhdCBkaWZmZXJlbnQuIEkg
YW0gdGFraW5nIGluCiAgICAgIHNvbWV0aGluZyBjcmVhdGVkIGZyb20gdHBtMl9kdXBsaWNhdGUg
dXNpbmcgYSBwb2xpY3kgY29uc3RydWN0ZWQKICAgICAgd2l0aCB0cG0yX3BvbGljeWR1cGxpY2F0
aW9uc2VsZWN0LjwvcD4KICAgIDxwPjxicj4KICAgIDwvcD4KICAgIDxwPkl0IGRvZXMgc2VlbSBJ
IGNhbiB3b3JrYXJvdW5kIHRoaXMgYnkgdXNpbmcgdHBtMl9jaGFuZ2VhdXRoIHRvCiAgICAgIGFk
ZCB0aGUgcGFzc3dvcmQuIEJ1dCBmb3Igd2hhdGV2ZXIgcmVhc29uIHdoZW4gSSBwdXQgLXAgZGly
ZWN0bHkKICAgICAgaW4gdGhlIHRwbTJfaW1wb3J0LCBpdCBkb2VzIG5vdCBzZWVtIHRvIHRha2Uu
PC9wPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPHA+VGhhbmtzLDxicj4KICAgICAgLXRlZDwv
cD4KICAgIDxwPjxicj4KICAgIDwvcD4KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRlLXByZWZpeCI+
T24gNC8yNi8yMSAxMDo0MCBBTSwgUm9iZXJ0cywgV2lsbGlhbSBDCiAgICAgIHdyb3RlOjxicj4K
ICAgIDwvZGl2PgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOlNONlBSMTFN
QjM0MzcxMzFEQ0RBOUE5QzE0QzEzRjM5MkI4NDI5QFNONlBSMTFNQjM0MzcubmFtcHJkMTEucHJv
ZC5vdXRsb29rLmNvbSI+CiAgICAgIAogICAgICA8c3R5bGUgdHlwZT0idGV4dC9jc3MiIHN0eWxl
PSJkaXNwbGF5Om5vbmU7Ij5QIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO308L3N0eWxl
PgogICAgICA8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGlj
YSwgc2Fucy1zZXJpZjsKICAgICAgICBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwg
MCk7Ij4KICAgICAgICBTZWVtcyB0byB3b3JrIGZvciBtZSwgd2hhdCB2ZXJzaW9uIG9mIHRoZSB0
b29scyBhcmUgeW91IHVzaW5nPzxicj4KICAgICAgPC9kaXY+CiAgICAgIDxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOwogICAgICAg
IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgogICAgICAgIDxicj4KICAg
ICAgPC9kaXY+CiAgICAgIDxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwg
SGVsdmV0aWNhLCBzYW5zLXNlcmlmOwogICAgICAgIGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJn
YigwLCAwLCAwKTsiPgogICAgICAgIEkgbW9kaWZpZWQgdGhlIHRlc3QgYW5kIGl0IHNlZW1zIHRv
IHdvcmsgYXMgZXhwZWN0ZWQgKGlmIEkgZHJvcAogICAgICAgIHRoZSBwYXNzd29yZCBpbiB0cG0y
IHNpZ24gaXQgZmFpbHMpPC9kaXY+CiAgICAgIDxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOwogICAgICAgIGZvbnQtc2l6ZTogMTJw
dDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgogICAgICAgIDxicj4KICAgICAgPC9kaXY+CiAgICAg
IDxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5z
LXNlcmlmOwogICAgICAgIGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgog
ICAgICAgIGdpdCBkaWZmCiAgICAgICAgPGRpdj5kaWZmIC0tZ2l0IGEvdGVzdC9pbnRlZ3JhdGlv
bi90ZXN0cy9pbXBvcnQuc2gKICAgICAgICAgIGIvdGVzdC9pbnRlZ3JhdGlvbi90ZXN0cy9pbXBv
cnQuc2g8L2Rpdj4KICAgICAgICA8ZGl2PmluZGV4IGZmOGY5YjNiOTZlYi4uZDIyY2RiNDFhNzNi
IDEwMDY0NDwvZGl2PgogICAgICAgIDxkaXY+LS0tIGEvdGVzdC9pbnRlZ3JhdGlvbi90ZXN0cy9p
bXBvcnQuc2g8L2Rpdj4KICAgICAgICA8ZGl2PisrKyBiL3Rlc3QvaW50ZWdyYXRpb24vdGVzdHMv
aW1wb3J0LnNoPC9kaXY+CiAgICAgICAgPGRpdj5AQCAtMTE3LDEzICsxMTcsMTMgQEAgcnVuX2Vj
Y19pbXBvcnRfdGVzdCgpIHs8L2Rpdj4KICAgICAgICA8ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7
c2hhc3VtIC1hIDI1NiBkYXRhLmluLnJhdyB8IGF3ayAneyBwcmludCAmcXVvdDswMDAwMDAgJnF1
b3Q7ICQxCiAgICAgICAgICB9JyB8IHh4ZCAtciAtYyAzMiAmZ3Q7IFw8L2Rpdj4KICAgICAgICA8
ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7ZGF0YS5pbi5kaWdlc3Q8L2Rpdj4KICAgICAgICA8ZGl2
PiZuYnNwOzwvZGl2PgogICAgICAgIDxkaXY+LSAmbmJzcDsgJm5ic3A7dHBtMiBpbXBvcnQgLVEg
LUcgZWNjIC1nICZxdW90OyRuYW1lX2FsZyZxdW90OyAtaQogICAgICAgICAgcHJpdmF0ZS5lY2Mu
cGVtIC1DICQxIC11IGVjYy5wdWIgXDwvZGl2PgogICAgICAgIDxkaXY+KyAmbmJzcDsgJm5ic3A7
dHBtMiBpbXBvcnQgLVEgLUcgZWNjIC1nICZxdW90OyRuYW1lX2FsZyZxdW90OyAtcCBwYXNzd29y
ZCAtaQogICAgICAgICAgcHJpdmF0ZS5lY2MucGVtIC1DICQxIC11IGVjYy5wdWIgXDwvZGl2Pgog
ICAgICAgIDxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDstciBlY2MucHJpdjwvZGl2PgogICAgICAg
IDxkaXY+Jm5ic3A7PC9kaXY+CiAgICAgICAgPGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwO3RwbTIg
bG9hZCAtUSAtQyAkMSAtdSBlY2MucHViIC1yIGVjYy5wcml2IC1uIGVjYy5uYW1lCiAgICAgICAg
ICAtYyBlY2MuY3R4PC9kaXY+CiAgICAgICAgPGRpdj4mbmJzcDs8L2Rpdj4KICAgICAgICA8ZGl2
PiZuYnNwOyAmbmJzcDsgJm5ic3A7IyBTaWduIGluIHRoZSBUUE0gYW5kIHZlcmlmeSB3aXRoIE9T
U0w8L2Rpdj4KICAgICAgICA8ZGl2Pi0gJm5ic3A7ICZuYnNwO3RwbTIgc2lnbiAtUSAtYyBlY2Mu
Y3R4IC1nIHNoYTI1NiAtZCAtZiBwbGFpbiAtbwogICAgICAgICAgZGF0YS5vdXQuc2lnbmVkIFw8
L2Rpdj4KICAgICAgICA8ZGl2PisgJm5ic3A7ICZuYnNwO3RwbTIgc2lnbiAtUSAtYyBlY2MuY3R4
IC1wIHBhc3N3b3JkIC1nIHNoYTI1NiAtZCAtZgogICAgICAgICAgcGxhaW4gLW8gZGF0YS5vdXQu
c2lnbmVkIFw8L2Rpdj4KICAgICAgICA8ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7ZGF0YS5pbi5k
aWdlc3Q8L2Rpdj4KICAgICAgICA8ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7b3BlbnNzbCBkZ3N0
IC12ZXJpZnkgcHVibGljLmVjYy5wZW0gLWtleWZvcm0gcGVtCiAgICAgICAgICAtc2hhMjU2IFw8
L2Rpdj4KICAgICAgICA8ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7LXNpZ25hdHVyZSBkYXRhLm91
dC5zaWduZWQgZGF0YS5pbi5yYXc8L2Rpdj4KICAgICAgICA8YnI+CiAgICAgIDwvZGl2PgogICAg
ICA8aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0x
Ij4KICAgICAgPGRpdiBpZD0iZGl2UnBseUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250IHN0eWxlPSJm
b250LXNpemU6MTFwdCIgZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgY29sb3I9IiMwMDAwMDAi
PjxiPkZyb206PC9iPiBUZWQKICAgICAgICAgIEtpbSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86dGVkLmgua2ltQG9yYWNsZS5jb20iPiZsdDt0ZWQuaC5raW1A
b3JhY2xlLmNvbSZndDs8L2E+PGJyPgogICAgICAgICAgPGI+U2VudDo8L2I+IE1vbmRheSwgQXBy
aWwgMTksIDIwMjEgNDoyNCBQTTxicj4KICAgICAgICAgIDxiPlRvOjwvYj4gPGEgY2xhc3M9Im1v
ei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50
cG0yQGxpc3RzLjAxLm9yZzwvYT4gPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJl
Zj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj4mbHQ7dHBtMkBsaXN0cy4wMS5vcmcmZ3Q7PC9h
Pjxicj4KICAgICAgICAgIDxiPlN1YmplY3Q6PC9iPiBbdHBtMl0gUmU6IGRvZXMgLXAgKHBhc3N3
b3JkKSB3b3JrIHdpdGgKICAgICAgICAgIHRwbTJfaW1wb3J0ID88L2ZvbnQ+CiAgICAgICAgPGRp
dj4mbmJzcDs8L2Rpdj4KICAgICAgPC9kaXY+CiAgICAgIDxkaXYgY2xhc3M9IkJvZHlGcmFnbWVu
dCI+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+CiAgICAgICAg
ICAgIDxkaXYgY2xhc3M9IlBsYWluVGV4dCI+PGJyPgogICAgICAgICAgICAgIE9uIDQvMTYvMjEg
MTE6MjggQU0sIFRlZCBLaW0gd3JvdGU6PGJyPgogICAgICAgICAgICAgICZndDsgRm9sa3MsPGJy
PgogICAgICAgICAgICAgICZndDs8YnI+CiAgICAgICAgICAgICAgJmd0OyBJIHRyaWVkIHRwbTJf
aW1wb3J0IHdpdGggdGhlIC1wIG9wdGlvbiB3aXRoIGEKICAgICAgICAgICAgICBwYXNzd29yZCwg
YW5kIGl0IGRvZXNuJ3QgPGJyPgogICAgICAgICAgICAgICZndDsgc2VlbSB0byB3b3JrIGZvciBt
ZS48YnI+CiAgICAgICAgICAgICAgJmd0Ozxicj4KICAgICAgICAgICAgICAmZ3Q7IFN1YnNlcXVl
bnQgdHBtMl9yc2FkZWNyeXB0IGNvbW1hbmRzIHVzaW5nIHRoZSBrZXkKICAgICAgICAgICAgICBm
cm9tIHRoZSBpbXBvcnQgc2VlbSA8YnI+CiAgICAgICAgICAgICAgJmd0OyB0byB3b3JrIGZpbmUg
d2l0aG91dCBhbnkgLXAgb3B0aW9uLjxicj4KICAgICAgICAgICAgICAmZ3Q7PGJyPgogICAgICAg
ICAgICAgICZndDsgKiBEb2VzIGltcG9ydCB3b3JrIHdpdGggLXAgPyZuYnNwOyBJcyB0aGVyZSBz
b21ldGhpbmcgSQogICAgICAgICAgICAgIGhhdmUgb3Zlcmxvb2tlZCBpbiA8YnI+CiAgICAgICAg
ICAgICAgJmd0OyB0aGlzPzxicj4KICAgICAgICAgICAgICA8YnI+CiAgICAgICAgICAgICAgRnVy
dGhlciwgaWYgeW91IGFjdHVhbGx5IHN1cHBseSB0aGUgY29ycmVjdCBwYXNzd29yZCB0bwogICAg
ICAgICAgICAgIHRwbTJfcnNhZGVjcnlwdCA8YnI+CiAgICAgICAgICAgICAgY29tbWFuZCB3aXRo
IHRoZSAtcCBvcHRpb24sIHlvdSBnZXQgYW4gYXV0aCBlcnJvcjo8YnI+CiAgICAgICAgICAgICAg
PGJyPgpXQVJOSU5HOmVzeXM6c3JjL3RzczItZXN5cy9hcGkvRXN5c19SU0FfRGVjcnlwdC5jOjMw
NTpFc3lzX1JTQV9EZWNyeXB0X0ZpbmlzaCgpCiAgICAgICAgICAgICAgPGJyPgogICAgICAgICAg
ICAgIFJlY2VpdmVkIFRQTSBFcnJvcjxicj4KRVJST1I6ZXN5czpzcmMvdHNzMi1lc3lzL2FwaS9F
c3lzX1JTQV9EZWNyeXB0LmM6MTAyOkVzeXNfUlNBX0RlY3J5cHQoKSA8YnI+CiAgICAgICAgICAg
ICAgRXN5cyBGaW5pc2ggRXJyb3JDb2RlICgweDAwMDAwOThlKTxicj4KICAgICAgICAgICAgICBF
UlJPUjogRXN5c19SU0FfRGVjcnlwdCgweDk4RSkgLSB0cG06c2Vzc2lvbigxKTp0aGUKICAgICAg
ICAgICAgICBhdXRob3JpemF0aW9uIEhNQUMgPGJyPgogICAgICAgICAgICAgIGNoZWNrIGZhaWxl
ZCBhbmQgREEgY291bnRlciBpbmNyZW1lbnRlZDxicj4KICAgICAgICAgICAgICBFUlJPUjogVW5h
YmxlIHRvIHJ1biB0cG0yX3JzYWRlY3J5cHQ8YnI+CiAgICAgICAgICAgICAgPGJyPgogICAgICAg
ICAgICAgIDxicj4KICAgICAgICAgICAgICBUcnlpbmcgdGhpcyBzYW1lIHNlcXVlbmNlIHdpdGgg
YSBrZXkgY3JlYXRlZCB3aXRoCiAgICAgICAgICAgICAgdHBtMl9jcmVhdGUgd29ya3MgPGJyPgog
ICAgICAgICAgICAgIGZpbmUsIHNvIGFtIHRoaW5raW5nIHRoZXJlIGlzIHNvbWV0aGluZyB3cm9u
ZyB3aXRoCiAgICAgICAgICAgICAgdHBtMl9pbXBvcnQgbm90IDxicj4KICAgICAgICAgICAgICBw
cm9jZXNzaW5nIHRoZSAtcCBwcm9wZXJseS48YnI+CiAgICAgICAgICAgICAgPGJyPgogICAgICAg
ICAgICAgIENhbiB0aGUgbWFpbnRhaW5lcnMgbG9vayBpbnRvIHRoaXM/PGJyPgogICAgICAgICAg
ICAgIDxicj4KICAgICAgICAgICAgICBUaGFua3MsPGJyPgogICAgICAgICAgICAgIC10ZWQ8YnI+
CiAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICA8YnI+
CiAgICAgICAgICAgICAgJmd0Ozxicj4KICAgICAgICAgICAgICAmZ3Q7PGJyPgogICAgICAgICAg
ICAgICZndDs8YnI+CiAgICAgICAgICAgICAgJmd0OyBJIHVuZGVyc3RhbmQgdGhhdCB0cG0yX3Jz
YWVuY3J5cHQgZG9lcyBub3QgdGFrZSB0aGUKICAgICAgICAgICAgICAtcCBvcHRpb24gaW4gbGlu
ZSA8YnI+CiAgICAgICAgICAgICAgJmd0OyB3aXRoIHRoZSBpZGVhIG9mIHVzaW5nIGEgJnF1b3Q7
cHVibGljJnF1b3Q7IGtleS48YnI+CiAgICAgICAgICAgICAgJmd0Ozxicj4KICAgICAgICAgICAg
ICAmZ3Q7ICogSXMgaXQgY29ycmVjdCB0byBzYXkgdGhhdCBpZiBJIHdhbnQgdG8gaGF2ZQogICAg
ICAgICAgICAgIGF1dGhvcml6YXRpb24gb24gPGJyPgogICAgICAgICAgICAgICZndDsgZW5jcnlw
dGlvbiwgSSBoYXZlIHRvIHVzZSB0cG0yX2VuY3J5cHRkZWNyeXB0IChpLmUuCiAgICAgICAgICAg
ICAgdXNlIHN5bW1ldHJpYyBrZXlzKSA/PGJyPgogICAgICAgICAgICAgICZndDs8YnI+CiAgICAg
ICAgICAgICAgJmd0Ozxicj4KICAgICAgICAgICAgICAmZ3Q7PGJyPgogICAgICAgICAgICAgICZn
dDsgVGhhbmtzLDxicj4KICAgICAgICAgICAgICAmZ3Q7PGJyPgogICAgICAgICAgICAgICZndDsg
LXRlZDxicj4KICAgICAgICAgICAgICAmZ3Q7PGJyPgogICAgICAgICAgICAgICZndDs8YnI+CiAg
ICAgICAgICAgICAgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X188YnI+CiAgICAgICAgICAgICAgdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgY2xhc3M9Im1vei10
eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0y
QGxpc3RzLjAxLm9yZzwvYT48YnI+CiAgICAgICAgICAgICAgVG8gdW5zdWJzY3JpYmUgc2VuZCBh
biBlbWFpbCB0byA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWls
dG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxi
cj4KICAgICAgICAgICAgICAlKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2lu
dGVybmFsX25hbWUpczwvZGl2PgogICAgICAgICAgPC9zcGFuPjwvZm9udD48L2Rpdj4KICAgIDwv
YmxvY2txdW90ZT4KICAgIDxwcmUgY2xhc3M9Im1vei1zaWduYXR1cmUiIGNvbHM9IjcyIj4tLSAK
VGVkIEguIEtpbSwgUGhECjxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9
Im1haWx0bzp0ZWQuaC5raW1Ab3JhY2xlLmNvbSI+dGVkLmgua2ltQG9yYWNsZS5jb208L2E+Cisx
IDMxMC0yNTgtNzUxNTwvcHJlPgogIDwvYm9keT4KPC9odG1sPgo=

--===============8991587334385808386==--

