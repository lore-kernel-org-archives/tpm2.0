Content-Type: multipart/mixed; boundary="===============6783527641225330525=="
MIME-Version: 1.0
From: Andrew Featherstone <andrew.featherstone at gmail.com>
Subject: [tpm2] Re: tpm2_certify signature verification
Date: Tue, 10 Mar 2020 22:29:15 +0000
Message-ID: <CAGW41X47Yz3MDeu2Z3qvbc0wCvrOKJiLOE9J5qf_65mTZd+Mrg@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E9937A@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6783527641225330525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think I've made some progress here. I think the signature is over a
digest of the entire attestation structure. Here's an example of certifying
a primary key under the endorsement hierarchy. I think this could do with a
little polish, but I think it's a useful example. The eventual aim is to
use this as part of the SKAE Extension in X.509 certificates.

tpm2_createprimary -Q -C e -g sha256 -G rsa -c primary.ctx
tpm2_create -Q -g sha256 -G rsa -u certify.pub -r certify.priv -C primary.c=
tx
# Generate a PEM file suitable for use with OpenSSL containing the
public key used to certify the primary key.
tpm2_readpublic -Q -c certify.ctx -f pem -o certify.pemtpm2_certify -Q
-c primary.ctx -C certify.ctx -g sha256 -o attest.out -s sig.out#
We're only interested in the raw SHA-256 signature, not the
TPMT_SIGNATURE's TPMI_ALG_SIG_SCHEME, so extract the raw signature
from the last 256 bytes.tail -c 256 sig.out > sig.out.raw# Verify the
signature across a SHA-256 digest of the TPM2B_ATTEST structure using
OpenSSL.$ openssl dgst -verify certify.pem -keyform pem -sha256
-signature sig.out.raw attest.outVerified OK


On Tue, 10 Mar 2020 at 16:56, Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> Imran could you weigh in on this?
>
> Thanks,
> Bill
>
> > -----Original Message-----
> > From: andrew.featherstone(a)gmail.com
> > [mailto:andrew.featherstone(a)gmail.com]
> > Sent: Saturday, March 7, 2020 7:12 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] tpm2_certify signature verification
> >
> > Hi there,
> >
> > I'm trying to use the output of tpm2_certify to construt the Subject Key
> > Attestation Evidence Extension (SKAE Extension)[1] for a X.509
> Certificate
> > Request. I've followed the example at
> https://github.com/tpm2-software/tpm2-
> > tools/blob/master/man/tpm2_certify.1.md , but I'm struggling to work
> out how
> > to use the tpm2-tools to check the signature over the attestation
> structure.
> > Looking at https://github.com/tpm2-software/tpm2-
> > tools/blob/master/man/tpm2_verifysignature.1.md I expected to perform
> > something like the following (unfortunately I'm not able to retrieve the
> complete
> > command history right now):
> >
> > tpm2_create -G rsa -u rsa.pub -r rsa.priv -C primary.ctx tpm2_load -C
> primary.ctx
> > -u rsa.pub -r rsa.priv -c rsa.ctx tpm2_certify -c rsa.ctx -C certify.ctx
> -g sha256 -o
> > attest.out -s sig.out tpm2_verifysignature -c rsa.ctx -g sha256 -m
> attest.out -s
> > sig.out
> > WARNING:esys:../tpm2-tss-2.3.2/src/tss2-
> > esys/api/Esys_VerifySignature.c:302:Esys_VerifySignature_Finish()
> Received
> > TPM Error
> > ERROR:esys:../tpm2-tss-2.3.2/src/tss2-
> > esys/api/Esys_VerifySignature.c:103:Esys_VerifySignature() Esys Finish
> ErrorCode
> > (0x000002db)
> > ERROR: Esys_VerifySignature(0x2DB) - tpm:parameter(2):the signature is
> not
> > valid
> > ERROR: Verify signature failed!
> > ERROR: Unable to run tpm2_verifysignature
> >
> > Is anyone able to post a complete example to show how the output of
> > tpm2_certify is verified, based on the attestation key used?
> >
> > [1] https://trustedcomputinggroup.org/wp-
> > content/uploads/IWG_SKAE_Extension_1-00.pdf
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============6783527641225330525==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5JIHRoaW5rIEkmIzM5O3ZlIG1hZGUgc29tZSBwcm9ncmVzcyBo
ZXJlLiBJIHRoaW5rIHRoZSBzaWduYXR1cmUgaXMgb3ZlciBhIGRpZ2VzdCBvZiB0aGUgZW50aXJl
IGF0dGVzdGF0aW9uIHN0cnVjdHVyZS4gSGVyZSYjMzk7cyBhbiBleGFtcGxlIG9mIGNlcnRpZnlp
bmcgYSBwcmltYXJ5IGtleSB1bmRlciB0aGUgZW5kb3JzZW1lbnQgaGllcmFyY2h5LiBJIHRoaW5r
IHRoaXMgY291bGQgZG8gd2l0aCBhIGxpdHRsZSBwb2xpc2gsIGJ1dCBJIHRoaW5rIGl0JiMzOTtz
IGEgdXNlZnVsIGV4YW1wbGUuIFRoZSBldmVudHVhbCBhaW0gaXMgdG8gdXNlIHRoaXMgYXMgcGFy
dCBvZiB0aGUgU0tBRSBFeHRlbnNpb24gaW4gWC41MDkgY2VydGlmaWNhdGVzLjxicj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuIGlkPSJnbWFpbC1MQzIiIGNsYXNzPSJnbWFpbC1saW5l
IiBsYW5nPSJwbGFpbnRleHQiPjwvc3Bhbj48cHJlIGNsYXNzPSJnbWFpbC1jb2RlIGdtYWlsLWhp
Z2hsaWdodCIgbGFuZz0icGxhaW50ZXh0Ij48c3BhbiBpZD0iZ21haWwtTEMyIiBjbGFzcz0iZ21h
aWwtbGluZSIgbGFuZz0icGxhaW50ZXh0Ij50cG0yX2NyZWF0ZXByaW1hcnkgLVEgLUMgZSAtZyBz
aGEyNTYgLUcgcnNhIC1jIHByaW1hcnkuY3R4PGJyPnRwbTJfY3JlYXRlIC1RIC1nIHNoYTI1NiAt
RyByc2EgLXUgY2VydGlmeS5wdWIgLXIgY2VydGlmeS5wcml2IC1DIHByaW1hcnkuY3R4PC9zcGFu
Pjxicj4jIEdlbmU8c3BhbiBpZD0iZ21haWwtTEMzIiBjbGFzcz0iZ21haWwtbGluZSIgbGFuZz0i
cGxhaW50ZXh0Ij5yYXRlIGEgUEVNIGZpbGUgc3VpdGFibGUgZm9yIHVzZSB3aXRoIE9wZW5TU0wg
Y29udGFpbmluZyB0aGUgcHVibGljIGtleSB1c2VkIHRvIGNlcnRpZnkgdGhlIHByaW1hcnkga2V5
Ljxicj50cG0yX3JlYWRwdWJsaWMgLVEgLWMgY2VydGlmeS5jdHggLWYgcGVtIC1vIGNlcnRpZnku
cGVtPC9zcGFuPjxzcGFuIGlkPSJnbWFpbC1MQzEiIGNsYXNzPSJnbWFpbC1saW5lIiBsYW5nPSJw
bGFpbnRleHQiPjwvc3Bhbj4KPHNwYW4gaWQ9ImdtYWlsLUxDMiIgY2xhc3M9ImdtYWlsLWxpbmUi
IGxhbmc9InBsYWludGV4dCI+dHBtMl9jZXJ0aWZ5IC1RIC1jIHByaW1hcnkuY3R4IC1DIGNlcnRp
ZnkuY3R4IC1nIHNoYTI1NiAtbyBhdHRlc3Qub3V0IC1zIHNpZy5vdXQ8L3NwYW4+CjxzcGFuIGlk
PSJnbWFpbC1MQzMiIGNsYXNzPSJnbWFpbC1saW5lIiBsYW5nPSJwbGFpbnRleHQiPiMgV2UmIzM5
O3JlIG9ubHkgaW50ZXJlc3RlZCBpbiB0aGUgcmF3IFNIQS0yNTYgc2lnbmF0dXJlLCBub3QgdGhl
IFRQTVRfU0lHTkFUVVJFJiMzOTtzIFRQTUlfQUxHX1NJR19TQ0hFTUUsIHNvIGV4dHJhY3QgdGhl
IHJhdyBzaWduYXR1cmUgZnJvbSB0aGUgbGFzdCAyNTYgYnl0ZXMuPC9zcGFuPgo8c3BhbiBpZD0i
Z21haWwtTEM0IiBjbGFzcz0iZ21haWwtbGluZSIgbGFuZz0icGxhaW50ZXh0Ij50YWlsIC1jIDI1
NiBzaWcub3V0ICZndDsgc2lnLm91dC5yYXc8L3NwYW4+CjxzcGFuIGlkPSJnbWFpbC1MQzUiIGNs
YXNzPSJnbWFpbC1saW5lIiBsYW5nPSJwbGFpbnRleHQiPiMgVmVyaWZ5IHRoZSBzaWduYXR1cmUg
YWNyb3NzIGEgU0hBLTI1NiBkaWdlc3Qgb2YgdGhlIFRQTTJCX0FUVEVTVCBzdHJ1Y3R1cmUgdXNp
bmcgT3BlblNTTC48L3NwYW4+PHNwYW4gaWQ9ImdtYWlsLUxDMSIgY2xhc3M9ImdtYWlsLWxpbmUi
IGxhbmc9InBsYWludGV4dCI+PC9zcGFuPgo8c3BhbiBpZD0iZ21haWwtTEMyIiBjbGFzcz0iZ21h
aWwtbGluZSIgbGFuZz0icGxhaW50ZXh0Ij4kIG9wZW5zc2wgZGdzdCAtdmVyaWZ5IGNlcnRpZnku
cGVtIC1rZXlmb3JtIHBlbSAtc2hhMjU2IC1zaWduYXR1cmUgc2lnLm91dC5yYXcgYXR0ZXN0Lm91
dDwvc3Bhbj4KPHNwYW4gaWQ9ImdtYWlsLUxDMyIgY2xhc3M9ImdtYWlsLWxpbmUiIGxhbmc9InBs
YWludGV4dCI+VmVyaWZpZWQgT0s8L3NwYW4+CjwvcHJlPgoKPC9kaXY+PC9kaXY+PGJyPjxkaXYg
Y2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24g
VHVlLCAxMCBNYXIgMjAyMCBhdCAxNjo1NiwgUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVm
PSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0c0Bp
bnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBz
b2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkltcmFuIGNvdWxkIHlvdSB3
ZWlnaCBpbiBvbiB0aGlzPzxicj4KPGJyPgpUaGFua3MsPGJyPgpCaWxsPGJyPgo8YnI+CiZndDsg
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+CiZndDsgRnJvbTogPGEgaHJlZj0ibWFpbHRv
OmFuZHJldy5mZWF0aGVyc3RvbmVAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+YW5kcmV3LmZl
YXRoZXJzdG9uZUBnbWFpbC5jb208L2E+PGJyPgomZ3Q7IFttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OmFuZHJldy5mZWF0aGVyc3RvbmVAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+YW5kcmV3LmZl
YXRoZXJzdG9uZUBnbWFpbC5jb208L2E+XTxicj4KJmd0OyBTZW50OiBTYXR1cmRheSwgTWFyY2gg
NywgMjAyMCA3OjEyIEFNPGJyPgomZ3Q7IFRvOiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgU3Vi
amVjdDogW3RwbTJdIHRwbTJfY2VydGlmeSBzaWduYXR1cmUgdmVyaWZpY2F0aW9uPGJyPgomZ3Q7
IDxicj4KJmd0OyBIaSB0aGVyZSw8YnI+CiZndDsgPGJyPgomZ3Q7IEkmIzM5O20gdHJ5aW5nIHRv
IHVzZSB0aGUgb3V0cHV0IG9mIHRwbTJfY2VydGlmeSB0byBjb25zdHJ1dCB0aGUgU3ViamVjdCBL
ZXk8YnI+CiZndDsgQXR0ZXN0YXRpb24gRXZpZGVuY2UgRXh0ZW5zaW9uIChTS0FFIEV4dGVuc2lv
bilbMV0gZm9yIGEgWC41MDkgQ2VydGlmaWNhdGU8YnI+CiZndDsgUmVxdWVzdC4gSSYjMzk7dmUg
Zm9sbG93ZWQgdGhlIGV4YW1wbGUgYXQgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTIt
c29mdHdhcmUvdHBtMi0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
Z2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItPC9hPjxicj4KJmd0OyB0b29scy9ibG9iL21h
c3Rlci9tYW4vPGEgaHJlZj0iaHR0cDovL3RwbTJfY2VydGlmeS4xLm1kIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj50cG0yX2NlcnRpZnkuMS5tZDwvYT4gLCBidXQgSSYjMzk7bSBz
dHJ1Z2dsaW5nIHRvIHdvcmsgb3V0IGhvdzxicj4KJmd0OyB0byB1c2UgdGhlIHRwbTItdG9vbHMg
dG8gY2hlY2sgdGhlIHNpZ25hdHVyZSBvdmVyIHRoZSBhdHRlc3RhdGlvbiBzdHJ1Y3R1cmUuPGJy
PgomZ3Q7IExvb2tpbmcgYXQgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdh
cmUvdHBtMi0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHVi
LmNvbS90cG0yLXNvZnR3YXJlL3RwbTItPC9hPjxicj4KJmd0OyB0b29scy9ibG9iL21hc3Rlci9t
YW4vPGEgaHJlZj0iaHR0cDovL3RwbTJfdmVyaWZ5c2lnbmF0dXJlLjEubWQiIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJfdmVyaWZ5c2lnbmF0dXJlLjEubWQ8L2E+IEkgZXhw
ZWN0ZWQgdG8gcGVyZm9ybTxicj4KJmd0OyBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nICh1
bmZvcnR1bmF0ZWx5IEkmIzM5O20gbm90IGFibGUgdG8gcmV0cmlldmUgdGhlIGNvbXBsZXRlPGJy
PgomZ3Q7IGNvbW1hbmQgaGlzdG9yeSByaWdodCBub3cpOjxicj4KJmd0OyA8YnI+CiZndDsgdHBt
Ml9jcmVhdGUgLUcgcnNhIC11IHJzYS5wdWIgLXIgcnNhLnByaXYgLUMgcHJpbWFyeS5jdHggdHBt
Ml9sb2FkIC1DIHByaW1hcnkuY3R4PGJyPgomZ3Q7IC11IHJzYS5wdWIgLXIgcnNhLnByaXYgLWMg
cnNhLmN0eCB0cG0yX2NlcnRpZnkgLWMgcnNhLmN0eCAtQyBjZXJ0aWZ5LmN0eCAtZyBzaGEyNTYg
LW88YnI+CiZndDsgYXR0ZXN0Lm91dCAtcyBzaWcub3V0IHRwbTJfdmVyaWZ5c2lnbmF0dXJlIC1j
IHJzYS5jdHggLWcgc2hhMjU2IC1tIGF0dGVzdC5vdXQgLXM8YnI+CiZndDsgc2lnLm91dDxicj4K
Jmd0OyBXQVJOSU5HOmVzeXM6Li4vdHBtMi10c3MtMi4zLjIvc3JjL3RzczItPGJyPgomZ3Q7IGVz
eXMvYXBpL0VzeXNfVmVyaWZ5U2lnbmF0dXJlLmM6MzAyOkVzeXNfVmVyaWZ5U2lnbmF0dXJlX0Zp
bmlzaCgpIFJlY2VpdmVkPGJyPgomZ3Q7IFRQTSBFcnJvcjxicj4KJmd0OyBFUlJPUjplc3lzOi4u
L3RwbTItdHNzLTIuMy4yL3NyYy90c3MyLTxicj4KJmd0OyBlc3lzL2FwaS9Fc3lzX1ZlcmlmeVNp
Z25hdHVyZS5jOjEwMzpFc3lzX1ZlcmlmeVNpZ25hdHVyZSgpIEVzeXMgRmluaXNoIEVycm9yQ29k
ZTxicj4KJmd0OyAoMHgwMDAwMDJkYik8YnI+CiZndDsgRVJST1I6IEVzeXNfVmVyaWZ5U2lnbmF0
dXJlKDB4MkRCKSAtIHRwbTpwYXJhbWV0ZXIoMik6dGhlIHNpZ25hdHVyZSBpcyBub3Q8YnI+CiZn
dDsgdmFsaWQ8YnI+CiZndDsgRVJST1I6IFZlcmlmeSBzaWduYXR1cmUgZmFpbGVkITxicj4KJmd0
OyBFUlJPUjogVW5hYmxlIHRvIHJ1biB0cG0yX3ZlcmlmeXNpZ25hdHVyZTxicj4KJmd0OyA8YnI+
CiZndDsgSXMgYW55b25lIGFibGUgdG8gcG9zdCBhIGNvbXBsZXRlIGV4YW1wbGUgdG8gc2hvdyBo
b3cgdGhlIG91dHB1dCBvZjxicj4KJmd0OyB0cG0yX2NlcnRpZnkgaXMgdmVyaWZpZWQsIGJhc2Vk
IG9uIHRoZSBhdHRlc3RhdGlvbiBrZXkgdXNlZD88YnI+CiZndDsgPGJyPgomZ3Q7IFsxXSA8YSBo
cmVmPSJodHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91cC5vcmcvd3AtIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91cC5vcmcvd3At
PC9hPjxicj4KJmd0OyBjb250ZW50L3VwbG9hZHMvSVdHX1NLQUVfRXh0ZW5zaW9uXzEtMDAucGRm
PGJyPgomZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
PGJyPgomZ3Q7IHRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyBU
byB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZl
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9h
Pjxicj4KJmd0OyAlKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFs
X25hbWUpczxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============6783527641225330525==--

