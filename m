Content-Type: multipart/mixed; boundary="===============6493623597135068676=="
MIME-Version: 1.0
From: Petko Manolov <sti at nucleusys.com>
Subject: Re: [tpm2] facilitating BIOS update with seamless PCR policy change
Date: Mon, 18 Feb 2019 09:48:37 +0100
Message-ID: <20190218084837.GA4620@carbon>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649CD993A@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6493623597135068676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

	Hello again,

I managed to get authorized PCR policies to work for me.  The attached scri=
pt =

works fine on my thinkpad and on rpi3 with Infineon's SLB9670 SPI TPM2.

However, i stumbled upon a problem with an fTPM implementation in a very re=
cent =

AMI BIOS.  Everything seems to be working properly, until i get tpm2_unseal=
 to =

give me the error below.  The tpm2-tools is built with at-the-time tip of g=
it =

commit id:

	872076e1b31f22b18391c6761d47575a93891cd7

tpm2_unseal -v:

	tool=3D"tpm2_unseal" version=3D"3.0.2-858-g88956e75" tctis=3D"dynamic" tct=
i-default=3Dtabrmd dlclose=3Denabled

tpm-tss is v2.1.0 and tpm-abrmd is v2.0.3.  Unfortunately the error message=
 does =

not mean much for me so any help will be greatly appreciated.


thanks,
Petko



---

Generating RSA private key, 2048 bit long modulus
..............................+++++
...........................................+++++
e is 65537 (0x10001)
writing RSA key
transient-context: signing_key.ctx
name: 0x000b5e069ba4b591842c25155d812f635970dabe7cee663aff121088940f88e2da80
Signing authority created
sha256:
  0 : 0x647992CBC9EEBF49D367559D870620C324B1A4307EB2A6166F1ACEC0DC186AEA
  1 : 0x519B03509291B643DA7FEC4407FFC47C1C18AF706A611ECA1C159D4608342338
  2 : 0x369BB94CEB4A1DF8E76720141B64C57EC70E6C620F07B27E335E70AD2DDC25DB
  3 : 0x369BB94CEB4A1DF8E76720141B64C57EC70E6C620F07B27E335E70AD2DDC25DB
session-context: session.ctx
policy-digest: 0x22035897291FE4681D7800685BFC5C73EBCBB88C7A579AB20C2E345A98=
15FDFE
pcr policy created
policy is signed
session-context: session.ctx
45a41a53c9f74f09b72151af6ffdd199fe1129eff2b749b8e481b6b21f2281f1
policy authorized
sealing object created
session-context: session.ctx
45a41a53c9f74f09b72151af6ffdd199fe1129eff2b749b8e481b6b21f2281f1
WARNING:esys:../tpm2-tss/src/tss2-esys/api/Esys_Unseal.c:295:Esys_Unseal_Fi=
nish() Received TPM Error
ERROR:esys:../tpm2-tss/src/tss2-esys/api/Esys_Unseal.c:101:Esys_Unseal() Es=
ys Finish ErrorCode (0x0000008f)
ERROR: Esys_Unseal(0x8F) - tpm:handle(unk):invalid nonce size or nonce valu=
e mismatch
ERROR: Unseal failed!
ERROR: Unable to run tpm2_unseal
cat: unsealed: No such file or directory
the end

--===============6493623597135068676==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="policy_auth.sh"

IyEvYmluL2Jhc2gKCnNvdXJjZSBjb21tb24uc2gKCiMgICBDcmVhdGUgYSBzaWduaW5nIGF1dGhv
cml0eQpvcGVuc3NsIGdlbnJzYSAtb3V0IHNpZ25pbmdfa2V5X3ByaXZhdGUucGVtIDIwNDgKb3Bl
bnNzbCByc2EgLWluIHNpZ25pbmdfa2V5X3ByaXZhdGUucGVtIC1vdXQgc2lnbmluZ19rZXlfcHVi
bGljLnBlbSAtcHVib3V0CnRwbTJfbG9hZGV4dGVybmFsIC1HIHJzYSAtYSBvIC11IHNpZ25pbmdf
a2V5X3B1YmxpYy5wZW0gLW8gc2lnbmluZ19rZXkuY3R4IFwKCS1uIHNpZ25pbmdfa2V5Lm5hbWUK
CmVjaG8gIlNpZ25pbmcgYXV0aG9yaXR5IGNyZWF0ZWQiCgojICAgQ3JlYXRlIGEgcG9saWN5IHRv
IGJlIGF1dGhvcml6ZWQgbGlrZSBhIHBjciBwb2xpY3k6CnRwbTJfcGNybGlzdCAtTCAkUENSUyAt
byBwY3JzLnNoYTI1Ngp0cG0yX3N0YXJ0YXV0aHNlc3Npb24gLVMgc2Vzc2lvbi5jdHgKdHBtMl9w
b2xpY3lwY3IgLVMgc2Vzc2lvbi5jdHggLUwgJFBDUlMgLUYgcGNycy5zaGEyNTYgLWYgcGNyLnBv
bGljeQp0cG0yX2ZsdXNoY29udGV4dCAtUyBzZXNzaW9uLmN0eApybSAtZiBzZXNzaW9uLmN0eAoK
ZWNobyAicGNyIHBvbGljeSBjcmVhdGVkIgoKIyAgIFNpZ24gdGhlIHBvbGljeQpvcGVuc3NsIGRn
c3QgLXNoYTI1NiAtc2lnbiBzaWduaW5nX2tleV9wcml2YXRlLnBlbSAtb3V0IHBjci5zaWduYXR1
cmUgcGNyLnBvbGljeQoKZWNobyAicG9saWN5IGlzIHNpZ25lZCIKCiMgICBBdXRob3JpemUgdGhl
IHBvbGljeSBpbiB0aGUgcG9saWN5IGRpZ2VzdDoKdHBtMl9zdGFydGF1dGhzZXNzaW9uIC1TIHNl
c3Npb24uY3R4CnRwbTJfcG9saWN5YXV0aG9yaXplIC1TIHNlc3Npb24uY3R4IC1vIGF1dGhvcml6
ZWQucG9saWN5IC1mIHBjci5wb2xpY3kgXAoJLW4gc2lnbmluZ19rZXkubmFtZQp0cG0yX2ZsdXNo
Y29udGV4dCAtUyBzZXNzaW9uLmN0eApybSAtZiBzZXNzaW9uLmN0eAoKZWNobyAicG9saWN5IGF1
dGhvcml6ZWQiCgojICAgQ3JlYXRlIGEgVFBNIG9iamVjdCBsaWtlIGEgc2VhbGluZyBvYmplY3Qg
d2l0aCB0aGUgYXV0aG9yaXplZCBwb2xpY3kKIyAgIGJhc2VkIGF1dGhlbnRpY2F0aW9uOgplY2hv
ICJzZWNyZXQgdG8gc2VhbCAxMjMiID4gc2VjcmV0X2ZpbGUKdHBtMl9jcmVhdGVwcmltYXJ5IC1R
IC1hIG8gLWcgc2hhMjU2IC1HIHJzYSAtbyBwcmltLmN0eAp0cG0yX2NyZWF0ZSAtUSAtZyBzaGEy
NTYgLXUgc2VhbGluZ19wdWJrZXkucHViIC1yIHNlYWxpbmdfcHJpa2V5LnB1YiBcCgktSSBzZWNy
ZXRfZmlsZSAtQyBwcmltLmN0eCAtTCBhdXRob3JpemVkLnBvbGljeQoKZWNobyAic2VhbGluZyBv
YmplY3QgY3JlYXRlZCIKCiMgICBTYXRpc2Z5IHBvbGljeSBhbmQgdW5zZWFsIHRoZSBzZWNyZXQ6
CnRwbTJfdmVyaWZ5c2lnbmF0dXJlIC1jIHNpZ25pbmdfa2V5LmN0eCAtRyBzaGEyNTYgLW0gcGNy
LnBvbGljeSBcCgktcyBwY3Iuc2lnbmF0dXJlIC10IHZlcmlmaWNhdGlvbi50a3QgLWYgcnNhc3Nh
CnRwbTJfc3RhcnRhdXRoc2Vzc2lvbiAtYSAtUyBzZXNzaW9uLmN0eAp0cG0yX3BvbGljeXBjciAt
USAtUyBzZXNzaW9uLmN0eCAtTCAkUENSUyAtZiBwY3IucG9saWN5CnRwbTJfcG9saWN5YXV0aG9y
aXplIC1TIHNlc3Npb24uY3R4IC1vIGF1dGhvcml6ZWQucG9saWN5IC1mIHBjci5wb2xpY3kgXAoJ
LW4gc2lnbmluZ19rZXkubmFtZSAtdCB2ZXJpZmljYXRpb24udGt0CnRwbTJfbG9hZCAtUSAtQyBw
cmltLmN0eCAtdSBzZWFsaW5nX3B1YmtleS5wdWIgLXIgc2VhbGluZ19wcmlrZXkucHViIFwKCS1v
IHNlYWxpbmdfa2V5LmN0eAp0cG0yX3Vuc2VhbCAtcCAic2Vzc2lvbjpzZXNzaW9uLmN0eCIgLWMg
c2VhbGluZ19rZXkuY3R4IC1vIHVuc2VhbGVkCmNhdCB1bnNlYWxlZAp0cG0yX2ZsdXNoY29udGV4
dCAtUyBzZXNzaW9uLmN0eApybSAtZiBzZXNzaW9uLmN0eCB1bnNlYWxlZAoKZWNobyAidGhlIGVu
ZCIK

--===============6493623597135068676==--

