Content-Type: multipart/mixed; boundary="===============1869819486488999515=="
MIME-Version: 1.0
From: Niklas Andersson <niklas.andersson at fredenheim.se>
Subject: [tpm2] Re: Initial Identity
Date: Thu, 05 Mar 2020 01:04:22 +0100
Message-ID: <CAJ8N_u805Deo5vixSeACA1KPpP4yKrcZ+f2wAEhMJZhxX_Tsfw@mail.gmail.com>
In-Reply-To: CABatt_xVek_wJNDaWops43SevgdBzzd_Kj9nJmSUor63VkQBdw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1869819486488999515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

IDevID is a temporary key only used during enrollment (IMHO).

The CSR is signed by the LDevID (Local Device IDentifier).

This is high-level approach of how you can check the authenticity of a
LDevID:

Hope this helps.

- Niklas

#!/bin/bash

srk_handle=3D0x81000003
ek_handle=3D0x81010001

# IDevID
tpm2_createak \
  --ek-context=3D$ek_handle \
  --ak-context=3DIDevID.ctx \
  --key-algorithm=3Drsa \
  --hash-algorithm=3Dsha1 \
  --public=3DIDevID.pub \
  --private=3DIDevID.priv
# --signing-algorithm=3Dsha1

# LDevID
tpm2_create \
  --parent-context=3D$srk_handle \
  --hash-algorithm=3Dsha1 \
  --key-algorithm=3Drsa2048 \
  --public=3DLDevID.pub \
  --private=3DLDevID.priv \
  --creation-data=3DLDevID.CREATION_DATA \
  --creation-hash=3DLDevID.CREATION_HASH \
  --creation-ticket=3DLDevID.CREATION_TICKET

tpm2_load \
  --parent-context=3D$srk_handle \
  --public=3DLDevID.pub \
  --private=3DLDevID.priv \
  --key-context=3DLDevID.ctx

# Certify
tpm2_certify \
  --certifiedkey-context=3DLDevID.ctx \
  --signingkey-context=3DIDevID.ctx \
  --hash-algorithm=3Dsha1 \
  --attestation=3Dcertify.ATTESTATION \
  --signature=3Dcertify.SIGNATURE \
  --format=3Dplain

# Certify Creation
tpm2_certifycreation \
  --certifiedkey-context=3DLDevID.ctx \
  --signingkey-context=3DIDevID.ctx \
  --hash-algorithm=3Dsha1 \
  --creation-hash=3DLDevID.CREATION_HASH \
  --ticket=3DLDevID.CREATION_TICKET \
  --signature=3Dcertifycreation.SIGNATURE \
  --attestation=3Dcertifycreation.ATTESTATION \
  --format=3Dplain

# IDevID.der
echo 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' | openssl base64 -a -d
> IDevID.header.temp
dd if=3DIDevID.pub bs=3D1 skip=3D$(expr $(stat --format=3D%s IDevID.pub) - =
256)
of=3DIDevID.modulus.temp
echo -en '\x02\x03' > IDevID.mid-header.temp
echo -ne '\x01\x00\x01' > IDevID.exponent.temp
cat IDevID.header.temp IDevID.modulus.temp IDevID.mid-header.temp
IDevID.exponent.temp > IDevID.der

# Verify Certify Creation
openssl dgst \
  -verify IDevID.der -keyform der \
  -sha1 -signature certifycreation.SIGNATURE certifycreation.ATTESTATION_2

# Verify Create
openssl dgst \
  -verify IDevID.der -keyform der \
  -sha1 -signature certify.SIGNATURE certify.ATTESTATION

Den ons 4 mars 2020 kl 17:52 skrev Martin Townsend <mtownsend1973(a)gmail.c=
om
>:

> Hi,
>
> I've been reading up on Initial identity and specifically the sections
> in the "TCG Guidance for Securing Network Equipment Using TCG
> Technology" document and am currently working through the provisioning
> .  Originally I thought tpm2_createak should be used to create the key
> pair that is referred to as the Initial Attestation key (IAK).  But I
> think this tool creates an Attestation Identity Key (AIK) and is
> something that is done after provisioning and used by applications. Is
> this the case?
>
> The document goes on to say that the keys should be primary keys so
> should I create these keys with tpm2_createprimary?  This would create
> the keys from the Endorsement Primary Seed so if I make the IAK a
> restricted signing key and the IDevID an unrestricted signing key then
> they would both be different as this is part of the Template used to
> generate the key from the seed.  I could then use the IDevID with
> software such as OpenSSL. Does anyone know if this sounds plausible?
>
> Also does anyone have any idea how I would certify these keys, for the
> IDevID as it's unrestricted I take it I could sign a CSR with this key
> but I'm not sure how to certify the IAK with TPM2.0.
>
> Many Thanks,
> Martin.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============1869819486488999515==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5JRGV2SUQgaXMgYSB0ZW1wb3Jhcnkga2V5IG9ubHkgdXNlZCBk
dXJpbmcgZW5yb2xsbWVudCAoSU1ITykuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGUgQ1NS
IGlzIHNpZ25lZCBieSB0aGUgTERldklEIChMb2NhbCBEZXZpY2UgSURlbnRpZmllcikuPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5UaGlzIGlzIGhpZ2gtbGV2ZWwgYXBwcm9hY2ggb2YgaG93IHlv
dSBjYW4gY2hlY2sgdGhlIGF1dGhlbnRpY2l0eSBvZiBhIExEZXZJRDo8L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PkhvcGUgdGhpcyBoZWxwcy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pi0gTmlr
bGFzPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+IyEvYmluL2Jhc2g8YnI+PGJyPnNya19o
YW5kbGU9MHg4MTAwMDAwMzxicj5la19oYW5kbGU9MHg4MTAxMDAwMTxicj48YnI+IyBJRGV2SUQ8
YnI+dHBtMl9jcmVhdGVhayBcPGJyPsKgIC0tZWstY29udGV4dD0kZWtfaGFuZGxlIFw8YnI+wqAg
LS1hay1jb250ZXh0PUlEZXZJRC5jdHggXDxicj7CoCAtLWtleS1hbGdvcml0aG09cnNhIFw8YnI+
wqAgLS1oYXNoLWFsZ29yaXRobT1zaGExIFw8YnI+wqAgLS1wdWJsaWM9SURldklELnB1YiBcPGJy
PsKgIC0tcHJpdmF0ZT1JRGV2SUQucHJpdjxicj4jIC0tc2lnbmluZy1hbGdvcml0aG09c2hhMTxi
cj48YnI+IyBMRGV2SUQ8YnI+dHBtMl9jcmVhdGUgXDxicj7CoCAtLXBhcmVudC1jb250ZXh0PSRz
cmtfaGFuZGxlIFw8YnI+wqAgLS1oYXNoLWFsZ29yaXRobT1zaGExIFw8YnI+wqAgLS1rZXktYWxn
b3JpdGhtPXJzYTIwNDggXDxicj7CoCAtLXB1YmxpYz1MRGV2SUQucHViIFw8YnI+wqAgLS1wcml2
YXRlPUxEZXZJRC5wcml2IFw8YnI+wqAgLS1jcmVhdGlvbi1kYXRhPUxEZXZJRC5DUkVBVElPTl9E
QVRBIFw8YnI+wqAgLS1jcmVhdGlvbi1oYXNoPUxEZXZJRC5DUkVBVElPTl9IQVNIIFw8YnI+wqAg
LS1jcmVhdGlvbi10aWNrZXQ9TERldklELkNSRUFUSU9OX1RJQ0tFVDxicj48YnI+dHBtMl9sb2Fk
IFw8YnI+wqAgLS1wYXJlbnQtY29udGV4dD0kc3JrX2hhbmRsZSBcPGJyPsKgIC0tcHVibGljPUxE
ZXZJRC5wdWIgXDxicj7CoCAtLXByaXZhdGU9TERldklELnByaXYgXDxicj7CoCAtLWtleS1jb250
ZXh0PUxEZXZJRC5jdHg8YnI+PGJyPiMgQ2VydGlmeTxicj50cG0yX2NlcnRpZnkgXDxicj7CoCAt
LWNlcnRpZmllZGtleS1jb250ZXh0PUxEZXZJRC5jdHggXDxicj7CoCAtLXNpZ25pbmdrZXktY29u
dGV4dD1JRGV2SUQuY3R4IFw8YnI+wqAgLS1oYXNoLWFsZ29yaXRobT1zaGExIFw8YnI+wqAgLS1h
dHRlc3RhdGlvbj1jZXJ0aWZ5LkFUVEVTVEFUSU9OIFw8YnI+wqAgLS1zaWduYXR1cmU9Y2VydGlm
eS5TSUdOQVRVUkUgXDxicj7CoCAtLWZvcm1hdD1wbGFpbjxicj48YnI+IyBDZXJ0aWZ5IENyZWF0
aW9uPGJyPnRwbTJfY2VydGlmeWNyZWF0aW9uIFw8YnI+wqAgLS1jZXJ0aWZpZWRrZXktY29udGV4
dD1MRGV2SUQuY3R4IFw8YnI+wqAgLS1zaWduaW5na2V5LWNvbnRleHQ9SURldklELmN0eCBcPGJy
PsKgIC0taGFzaC1hbGdvcml0aG09c2hhMSBcPGJyPsKgIC0tY3JlYXRpb24taGFzaD1MRGV2SUQu
Q1JFQVRJT05fSEFTSCBcPGJyPsKgIC0tdGlja2V0PUxEZXZJRC5DUkVBVElPTl9USUNLRVQgXDxi
cj7CoCAtLXNpZ25hdHVyZT1jZXJ0aWZ5Y3JlYXRpb24uU0lHTkFUVVJFIFw8YnI+wqAgLS1hdHRl
c3RhdGlvbj1jZXJ0aWZ5Y3JlYXRpb24uQVRURVNUQVRJT04gXDxicj7CoCAtLWZvcm1hdD1wbGFp
bjxicj48YnI+IyBJRGV2SUQuZGVyPGJyPmVjaG8gJiMzOTtNSUlCSWpBTkJna3Foa2lHOXcwQkFR
RUZBQU9DQVE4QU1JSUJDZ0tDQVFFQSYjMzk7IHwgb3BlbnNzbCBiYXNlNjQgLWEgLWQgJmd0OyBJ
RGV2SUQuaGVhZGVyLnRlbXA8YnI+ZGQgaWY9SURldklELnB1YiBicz0xIHNraXA9JChleHByICQo
c3RhdCAtLWZvcm1hdD0lcyBJRGV2SUQucHViKSAtIDI1Nikgb2Y9SURldklELm1vZHVsdXMudGVt
cDxicj5lY2hvIC1lbiAmIzM5O1x4MDJceDAzJiMzOTsgJmd0OyBJRGV2SUQubWlkLWhlYWRlci50
ZW1wPGJyPmVjaG8gLW5lICYjMzk7XHgwMVx4MDBceDAxJiMzOTsgJmd0OyBJRGV2SUQuZXhwb25l
bnQudGVtcDxicj5jYXQgSURldklELmhlYWRlci50ZW1wIElEZXZJRC5tb2R1bHVzLnRlbXAgSURl
dklELm1pZC1oZWFkZXIudGVtcCBJRGV2SUQuZXhwb25lbnQudGVtcCAmZ3Q7IElEZXZJRC5kZXI8
YnI+PGJyPiMgVmVyaWZ5IENlcnRpZnkgQ3JlYXRpb248YnI+b3BlbnNzbCBkZ3N0IFw8YnI+wqAg
LXZlcmlmeSBJRGV2SUQuZGVyIC1rZXlmb3JtIGRlciBcPGJyPsKgIC1zaGExIC1zaWduYXR1cmUg
Y2VydGlmeWNyZWF0aW9uLlNJR05BVFVSRSBjZXJ0aWZ5Y3JlYXRpb24uQVRURVNUQVRJT05fMjxi
cj48YnI+IyBWZXJpZnkgQ3JlYXRlPGJyPm9wZW5zc2wgZGdzdCBcPGJyPsKgIC12ZXJpZnkgSURl
dklELmRlciAta2V5Zm9ybSBkZXIgXDxicj7CoCAtc2hhMSAtc2lnbmF0dXJlIGNlcnRpZnkuU0lH
TkFUVVJFIGNlcnRpZnkuQVRURVNUQVRJT048L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21h
aWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5EZW4gb25zIDQgbWFy
cyAyMDIwIGtsIDE3OjUyIHNrcmV2IE1hcnRpbiBUb3duc2VuZCAmbHQ7PGEgaHJlZj0ibWFpbHRv
Om10b3duc2VuZDE5NzNAZ21haWwuY29tIj5tdG93bnNlbmQxOTczQGdtYWlsLmNvbTwvYT4mZ3Q7
Ojxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46
MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7
cGFkZGluZy1sZWZ0OjFleCI+SGksPGJyPgo8YnI+CkkmIzM5O3ZlIGJlZW4gcmVhZGluZyB1cCBv
biBJbml0aWFsIGlkZW50aXR5IGFuZCBzcGVjaWZpY2FsbHkgdGhlIHNlY3Rpb25zPGJyPgppbiB0
aGUgJnF1b3Q7VENHIEd1aWRhbmNlIGZvciBTZWN1cmluZyBOZXR3b3JrIEVxdWlwbWVudCBVc2lu
ZyBUQ0c8YnI+ClRlY2hub2xvZ3kmcXVvdDsgZG9jdW1lbnQgYW5kIGFtIGN1cnJlbnRseSB3b3Jr
aW5nIHRocm91Z2ggdGhlIHByb3Zpc2lvbmluZzxicj4KLsKgIE9yaWdpbmFsbHkgSSB0aG91Z2h0
IHRwbTJfY3JlYXRlYWsgc2hvdWxkIGJlIHVzZWQgdG8gY3JlYXRlIHRoZSBrZXk8YnI+CnBhaXIg
dGhhdCBpcyByZWZlcnJlZCB0byBhcyB0aGUgSW5pdGlhbCBBdHRlc3RhdGlvbiBrZXkgKElBSyku
wqAgQnV0IEk8YnI+CnRoaW5rIHRoaXMgdG9vbCBjcmVhdGVzIGFuIEF0dGVzdGF0aW9uIElkZW50
aXR5IEtleSAoQUlLKSBhbmQgaXM8YnI+CnNvbWV0aGluZyB0aGF0IGlzIGRvbmUgYWZ0ZXIgcHJv
dmlzaW9uaW5nIGFuZCB1c2VkIGJ5IGFwcGxpY2F0aW9ucy4gSXM8YnI+CnRoaXMgdGhlIGNhc2U/
PGJyPgo8YnI+ClRoZSBkb2N1bWVudCBnb2VzIG9uIHRvIHNheSB0aGF0IHRoZSBrZXlzIHNob3Vs
ZCBiZSBwcmltYXJ5IGtleXMgc288YnI+CnNob3VsZCBJIGNyZWF0ZSB0aGVzZSBrZXlzIHdpdGgg
dHBtMl9jcmVhdGVwcmltYXJ5P8KgIFRoaXMgd291bGQgY3JlYXRlPGJyPgp0aGUga2V5cyBmcm9t
IHRoZSBFbmRvcnNlbWVudCBQcmltYXJ5IFNlZWQgc28gaWYgSSBtYWtlIHRoZSBJQUsgYTxicj4K
cmVzdHJpY3RlZCBzaWduaW5nIGtleSBhbmQgdGhlIElEZXZJRCBhbiB1bnJlc3RyaWN0ZWQgc2ln
bmluZyBrZXkgdGhlbjxicj4KdGhleSB3b3VsZCBib3RoIGJlIGRpZmZlcmVudCBhcyB0aGlzIGlz
IHBhcnQgb2YgdGhlIFRlbXBsYXRlIHVzZWQgdG88YnI+CmdlbmVyYXRlIHRoZSBrZXkgZnJvbSB0
aGUgc2VlZC7CoCBJIGNvdWxkIHRoZW4gdXNlIHRoZSBJRGV2SUQgd2l0aDxicj4Kc29mdHdhcmUg
c3VjaCBhcyBPcGVuU1NMLiBEb2VzIGFueW9uZSBrbm93IGlmIHRoaXMgc291bmRzIHBsYXVzaWJs
ZT88YnI+Cjxicj4KQWxzbyBkb2VzIGFueW9uZSBoYXZlIGFueSBpZGVhIGhvdyBJIHdvdWxkIGNl
cnRpZnkgdGhlc2Uga2V5cywgZm9yIHRoZTxicj4KSURldklEIGFzIGl0JiMzOTtzIHVucmVzdHJp
Y3RlZCBJIHRha2UgaXQgSSBjb3VsZCBzaWduIGEgQ1NSIHdpdGggdGhpcyBrZXk8YnI+CmJ1dCBJ
JiMzOTttIG5vdCBzdXJlIGhvdyB0byBjZXJ0aWZ5IHRoZSBJQUsgd2l0aCBUUE0yLjAuPGJyPgo8
YnI+Ck1hbnkgVGhhbmtzLDxicj4KTWFydGluLjxicj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9
Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEu
b3JnPC9hPjxicj4KVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWls
dG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxp
c3RzLjAxLm9yZzwvYT48YnI+CiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShf
aW50ZXJuYWxfbmFtZSlzPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============1869819486488999515==--

