Content-Type: multipart/mixed; boundary="===============1979685588124011181=="
MIME-Version: 1.0
From: Bill Gercken <bgercken at gmail.com>
Subject: [tpm2] Re: assistance with TPM2 - StrongSwan
Date: Fri, 09 Oct 2020 14:08:00 -0400
Message-ID: <CAOr2RpMfLDkvvqhNeUto9Vy7vHxtN7azm664W8FZynrZ=S6VvA@mail.gmail.com>
In-Reply-To: CAO4D2DNYVG9XS3r1LKc35FtGX=zCnQRgqJf-tsjPz8p32AugPA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1979685588124011181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Graham,

I was getting the same error message. Then I recompiled the code adding the
following arguments to configure:

`./configure --enable-tpm --enable-tss-tss2`

Then when I ran the example it worked. (I am getting a signature algorithm
error message but the command completes correctly.)

```
[bgercken(a)titan8 ~]$ tpm2_getpubek -H 0x81010001 -g rsa -f ek_rsa.pub

[bgercken(a)titan8 ~]$ sudo /usr/local/bin/pki --pub --keyid 0x81010001
--outform pem
TPM 2.0 via TSS2 v2 available
signature algorithm is NULL with ERROR hash
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmUvJ6RGXXzO6PNqLGYkW
qg63yk+WGLyc0AyzmxMhlR+cQcgcCiBF9WIkpQ/YDKL+W9Cn1MnstWkJ449atGbP
riLsLUX9a0XnZWPFjh/euG7XrBFJH7PF5XW8h6WSlI7hKj/dCJn+Zc1pkhy0P5mL
HcldM+hV484z4DDG4c0ZRBXArFAygiNZnxAIwwA1pTMNjfdmUsKZqxGxkZen7+rn
CyyQaYrJnpbCFztjVkm9QPmZ17qwA2InHAqHdjS1QZd3oNF/lm2+E3C7qnOiX+EZ
rwdkL40pw+cG+Y+ym557a1Toknzs7rUe89zUwa2mRuZD7CeautHxXYWM99OrbzCw
PwIDAQAB
-----END PUBLIC KEY-----

[bgercken(a)titan8 ~]$ sudo /usr/local/bin/pki --pub --keyid 0x81010001
--outform pem > ek_rsa_pub.pem
TPM 2.0 via TSS2 v2 available
signature algorithm is NULL with ERROR hash

[bgercken(a)titan8 ~]$ pki --print --type pub --in ek_rsa_pub.pem
  pubkey:    RSA 2048 bits
  keyid:     17:ed:f2:c3:c2:0c:c0:96:32:0d:57:f2:2a:90:79:bd:30:e9:b9:4f
  subjkey:   7b:45:1d:54:21:71:5b:89:08:95:22:8b:fa:be:bc:1a:fa:37:61:80

[bgercken(a)titan8 ~]$ tpm2_listpersistent
persistent-handle[0]:0x81010001 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|adminwithpolicy|restri=
cted|decrypt
persistent-handle[1]:0x81010005 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|adminwithpolicy|restri=
cted|decrypt
persistent-handle[2]:0x8101000f key-alg:keyedhash hash-alg:sha256
object-attr:fixedtpm|fixedparent|userwithauth
```
I am running on RHEL/CentOS 8 with specifics shown below:

```
[bgercken(a)titan8 ~]$ rpm -qa | grep tpm
tpm2-abrmd-debuginfo-2.1.1-3.el8.x86_64
tpm2-abrmd-debugsource-2.1.1-3.el8.x86_64
tpm2-tss-devel-2.0.0-4.el8.x86_64
tpm2-abrmd-2.1.1-3.el8.x86_64
tpm2-tss-debuginfo-2.0.0-4.el8.x86_64
tpm2-tss-debugsource-2.0.0-4.el8.x86_64
tpm2-tss-2.0.0-4.el8.x86_64
tpm2-abrmd-selinux-2.0.0-3.el8.noarch
tpm2-tools-3.2.1-1.el8.x86_64

[bgercken(a)titan8 ~]$ uname -r
4.18.0-193.14.2.el8_2.x86_64

[bgercken(a)titan8 ~]$ cat /etc/os-release
NAME=3D"CentOS Linux"
VERSION=3D"8 (Core)"
ID=3D"centos"
ID_LIKE=3D"rhel fedora"
VERSION_ID=3D"8"
PLATFORM_ID=3D"platform:el8"
PRETTY_NAME=3D"CentOS Linux 8 (Core)"
ANSI_COLOR=3D"0;31"
CPE_NAME=3D"cpe:/o:centos:centos:8"
HOME_URL=3D"https://www.centos.org/"
BUG_REPORT_URL=3D"https://bugs.centos.org/"

CENTOS_MANTISBT_PROJECT=3D"CentOS-8"
CENTOS_MANTISBT_PROJECT_VERSION=3D"8"
REDHAT_SUPPORT_PRODUCT=3D"centos"
REDHAT_SUPPORT_PRODUCT_VERSION=3D"8"
```
 Cheers,
-bill

On Fri, Oct 9, 2020 at 11:17 AM Graham Bartlett <graham.ietf(a)gmail.com>
wrote:

> Hi
>
> I'm following the StrongSwan example of using the TPM;
>
> https://wiki.strongswan.org/projects/strongswan/wiki/TpmPlugin
>
> The StrongSwan guide suggests;
>
> Derive a Persistent RSA Endorsement Key
>
> The following tpm2-tools command derives a 2048 bit RSA Endorsement Key
> (EK) in a deterministic way from the secret *Endorsement Primary Seed*
> *unique* to each TPM device and makes the key persistent in the
> non-volatile memory of the TPM under the object handle 0x81010001
>
> tpm2_getpubek -H 0x81010001 -g rsa -f ek_rsa.pub
>
> The EK public key stored in the ek_rsa.pub file is encoded in a TPM 2.0
> proprietary format but the key can be exported from the TPM in the regular
> PKCS#1 format using the *pki* tool
>
> pki --pub --keyid 0x81010001 --outform pem > ek_rsa_pub.pem
>
> /
>
> I am running the latest/greatest TPM on Ubuntu 20.04.
>
> I have created an EK as per;
>
> $ sudo tpm2_createek -G rsa -u ek.pub -c 0x81010004
>
> When I then try to export this it fails;
>
> $ pki --pub --keyid 0x81010004 --outform pem > ek_rsa_pub.pem
> building CRED_PRIVATE_KEY - ANY failed, tried 5 builders
> parsing private key failed
>
> Would anyone know what I'm doing wrong, or have any guidance on an upto d=
ate example?
>
> many thanks
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============1979685588124011181==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+R3JhaGFtLDxkaXY+PGJyPjwvZGl2PjxkaXY+SSB3YXMgZ2V0dGluZyB0
aGUgc2FtZSBlcnJvciBtZXNzYWdlLiBUaGVuIEkgcmVjb21waWxlZCB0aGUgY29kZSBhZGRpbmcg
dGhlIGZvbGxvd2luZyBhcmd1bWVudHMgdG8gY29uZmlndXJlOjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+YC4vY29uZmlndXJlIC0tZW5hYmxlLXRwbSAtLWVuYWJsZS10c3MtdHNzMmA8L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZW4gd2hlbiBJIHJhbiB0aGUgZXhhbXBsZSBpdCB3b3JrZWQu
IChJIGFtIGdldHRpbmcgYSBzaWduYXR1cmUgYWxnb3JpdGhtIGVycm9yIG1lc3NhZ2UgYnV0IHRo
ZSBjb21tYW5kIGNvbXBsZXRlcyBjb3JyZWN0bHkuKTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
YGBgPC9kaXY+PGRpdj5bYmdlcmNrZW5AdGl0YW44IH5dJCB0cG0yX2dldHB1YmVrIC1IIDB4ODEw
MTAwMDEgLWcgcnNhIC1mIGVrX3JzYS5wdWI8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5b
YmdlcmNrZW5AdGl0YW44IH5dJCBzdWRvIC91c3IvbG9jYWwvYmluL3BraSAtLXB1YiAtLWtleWlk
IDB4ODEwMTAwMDEgLS1vdXRmb3JtIHBlbTxicj5UUE0gMi4wIHZpYSBUU1MyIHYyIGF2YWlsYWJs
ZTxicj5zaWduYXR1cmUgYWxnb3JpdGhtIGlzIE5VTEwgd2l0aCBFUlJPUiBoYXNoPGJyPi0tLS0t
QkVHSU4gUFVCTElDIEtFWS0tLS0tPGJyPk1JSUJJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBUThB
TUlJQkNnS0NBUUVBbVV2SjZSR1hYek82UE5xTEdZa1c8YnI+cWc2M3lrK1dHTHljMEF5em14TWhs
UitjUWNnY0NpQkY5V0lrcFEvWURLTCtXOUNuMU1uc3RXa0o0NDlhdEdiUDxicj5yaUxzTFVYOWEw
WG5aV1BGamgvZXVHN1hyQkZKSDdQRjVYVzhoNldTbEk3aEtqL2RDSm4rWmMxcGtoeTBQNW1MPGJy
PkhjbGRNK2hWNDg0ejREREc0YzBaUkJYQXJGQXlnaU5abnhBSXd3QTFwVE1OamZkbVVzS1pxeEd4
a1plbjcrcm48YnI+Q3l5UWFZckpucGJDRnp0alZrbTlRUG1aMTdxd0EySW5IQXFIZGpTMVFaZDNv
TkYvbG0yK0UzQzdxbk9pWCtFWjxicj5yd2RrTDQwcHcrY0crWSt5bTU1N2ExVG9rbnpzN3JVZTg5
elV3YTJtUnVaRDdDZWF1dEh4WFlXTTk5T3JiekN3PGJyPlB3SURBUUFCPGJyPi0tLS0tRU5EIFBV
QkxJQyBLRVktLS0tLTxicj48YnI+PC9kaXY+PGRpdj5bYmdlcmNrZW5AdGl0YW44IH5dJCBzdWRv
IC91c3IvbG9jYWwvYmluL3BraSAtLXB1YiAtLWtleWlkIDB4ODEwMTAwMDEgLS1vdXRmb3JtIHBl
bSAmZ3Q7IGVrX3JzYV9wdWIucGVtPGJyPlRQTSAyLjAgdmlhIFRTUzIgdjIgYXZhaWxhYmxlPGJy
PnNpZ25hdHVyZSBhbGdvcml0aG0gaXMgTlVMTCB3aXRoIEVSUk9SIGhhc2g8YnI+PGJyPjwvZGl2
PjxkaXY+W2JnZXJja2VuQHRpdGFuOCB+XSQgcGtpIC0tcHJpbnQgLS10eXBlIHB1YiAtLWluIGVr
X3JzYV9wdWIucGVtPGJyPsKgIHB1YmtleTogwqAgwqBSU0EgMjA0OCBiaXRzPGJyPsKgIGtleWlk
OiDCoCDCoCAxNzplZDpmMjpjMzpjMjowYzpjMDo5NjozMjowZDo1NzpmMjoyYTo5MDo3OTpiZDoz
MDplOTpiOTo0Zjxicj7CoCBzdWJqa2V5OiDCoCA3Yjo0NToxZDo1NDoyMTo3MTo1Yjo4OTowODo5
NToyMjo4YjpmYTpiZTpiYzoxYTpmYTozNzo2MTo4MDxicj48YnI+PC9kaXY+PGRpdj5bYmdlcmNr
ZW5AdGl0YW44IH5dJCB0cG0yX2xpc3RwZXJzaXN0ZW50PGJyPnBlcnNpc3RlbnQtaGFuZGxlWzBd
OjB4ODEwMTAwMDEga2V5LWFsZzpyc2EgaGFzaC1hbGc6c2hhMjU2IG9iamVjdC1hdHRyOmZpeGVk
dHBtfGZpeGVkcGFyZW50fHNlbnNpdGl2ZWRhdGFvcmlnaW58YWRtaW53aXRocG9saWN5fHJlc3Ry
aWN0ZWR8ZGVjcnlwdDxicj5wZXJzaXN0ZW50LWhhbmRsZVsxXToweDgxMDEwMDA1IGtleS1hbGc6
cnNhIGhhc2gtYWxnOnNoYTI1NiBvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5z
aXRpdmVkYXRhb3JpZ2lufGFkbWlud2l0aHBvbGljeXxyZXN0cmljdGVkfGRlY3J5cHQ8YnI+cGVy
c2lzdGVudC1oYW5kbGVbMl06MHg4MTAxMDAwZiBrZXktYWxnOmtleWVkaGFzaCBoYXNoLWFsZzpz
aGEyNTYgb2JqZWN0LWF0dHI6Zml4ZWR0cG18Zml4ZWRwYXJlbnR8dXNlcndpdGhhdXRoPGJyPjwv
ZGl2PjxkaXY+YGBgPC9kaXY+PGRpdj5JIGFtIHJ1bm5pbmcgb24gUkhFTC9DZW50T1MgOCB3aXRo
IHNwZWNpZmljcyBzaG93biBiZWxvdzo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmBgYDwvZGl2
PjxkaXY+W2JnZXJja2VuQHRpdGFuOCB+XSQgcnBtIC1xYSB8IGdyZXAgdHBtPGJyPnRwbTItYWJy
bWQtZGVidWdpbmZvLTIuMS4xLTMuZWw4Lng4Nl82NDxicj50cG0yLWFicm1kLWRlYnVnc291cmNl
LTIuMS4xLTMuZWw4Lng4Nl82NDxicj50cG0yLXRzcy1kZXZlbC0yLjAuMC00LmVsOC54ODZfNjQ8
YnI+dHBtMi1hYnJtZC0yLjEuMS0zLmVsOC54ODZfNjQ8YnI+dHBtMi10c3MtZGVidWdpbmZvLTIu
MC4wLTQuZWw4Lng4Nl82NDxicj50cG0yLXRzcy1kZWJ1Z3NvdXJjZS0yLjAuMC00LmVsOC54ODZf
NjQ8YnI+dHBtMi10c3MtMi4wLjAtNC5lbDgueDg2XzY0PGJyPnRwbTItYWJybWQtc2VsaW51eC0y
LjAuMC0zLmVsOC5ub2FyY2g8YnI+dHBtMi10b29scy0zLjIuMS0xLmVsOC54ODZfNjQ8L2Rpdj48
ZGl2Pjxicj5bYmdlcmNrZW5AdGl0YW44IH5dJCB1bmFtZSAtcjxicj40LjE4LjAtMTkzLjE0LjIu
ZWw4XzIueDg2XzY0PGJyPjxicj48L2Rpdj48ZGl2PltiZ2VyY2tlbkB0aXRhbjggfl0kIGNhdCAv
ZXRjL29zLXJlbGVhc2U8YnI+TkFNRT0mcXVvdDtDZW50T1MgTGludXgmcXVvdDs8YnI+VkVSU0lP
Tj0mcXVvdDs4IChDb3JlKSZxdW90Ozxicj5JRD0mcXVvdDtjZW50b3MmcXVvdDs8YnI+SURfTElL
RT0mcXVvdDtyaGVsIGZlZG9yYSZxdW90Ozxicj5WRVJTSU9OX0lEPSZxdW90OzgmcXVvdDs8YnI+
UExBVEZPUk1fSUQ9JnF1b3Q7cGxhdGZvcm06ZWw4JnF1b3Q7PGJyPlBSRVRUWV9OQU1FPSZxdW90
O0NlbnRPUyBMaW51eCA4IChDb3JlKSZxdW90Ozxicj5BTlNJX0NPTE9SPSZxdW90OzA7MzEmcXVv
dDs8YnI+Q1BFX05BTUU9JnF1b3Q7Y3BlOi9vOmNlbnRvczpjZW50b3M6OCZxdW90Ozxicj5IT01F
X1VSTD0mcXVvdDs8YSBocmVmPSJodHRwczovL3d3dy5jZW50b3Mub3JnLyI+aHR0cHM6Ly93d3cu
Y2VudG9zLm9yZy88L2E+JnF1b3Q7PGJyPkJVR19SRVBPUlRfVVJMPSZxdW90OzxhIGhyZWY9Imh0
dHBzOi8vYnVncy5jZW50b3Mub3JnLyI+aHR0cHM6Ly9idWdzLmNlbnRvcy5vcmcvPC9hPiZxdW90
Ozxicj48YnI+Q0VOVE9TX01BTlRJU0JUX1BST0pFQ1Q9JnF1b3Q7Q2VudE9TLTgmcXVvdDs8YnI+
Q0VOVE9TX01BTlRJU0JUX1BST0pFQ1RfVkVSU0lPTj0mcXVvdDs4JnF1b3Q7PGJyPlJFREhBVF9T
VVBQT1JUX1BST0RVQ1Q9JnF1b3Q7Y2VudG9zJnF1b3Q7PGJyPlJFREhBVF9TVVBQT1JUX1BST0RV
Q1RfVkVSU0lPTj0mcXVvdDs4JnF1b3Q7PGJyPmBgYDwvZGl2PjxkaXY+wqBDaGVlcnMsPC9kaXY+
PGRpdj4tYmlsbDwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBk
aXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIEZyaSwgT2N0IDksIDIwMjAgYXQgMTE6MTcg
QU0gR3JhaGFtIEJhcnRsZXR0ICZsdDs8YSBocmVmPSJtYWlsdG86Z3JhaGFtLmlldGZAZ21haWwu
Y29tIj5ncmFoYW0uaWV0ZkBnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2Nr
cXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4
O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgi
PjxkaXYgZGlyPSJsdHIiPjxkaXY+SGk8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5O20g
Zm9sbG93aW5nIHRoZSBTdHJvbmdTd2FuIGV4YW1wbGUgb2YgdXNpbmcgdGhlIFRQTTs8L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vd2lraS5zdHJvbmdzd2FuLm9yZy9w
cm9qZWN0cy9zdHJvbmdzd2FuL3dpa2kvVHBtUGx1Z2luIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6
Ly93aWtpLnN0cm9uZ3N3YW4ub3JnL3Byb2plY3RzL3N0cm9uZ3N3YW4vd2lraS9UcG1QbHVnaW48
L2E+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGUgU3Ryb25nU3dhbiBndWlkZSBzdWdnZXN0
czs8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxoMj5EZXJpdmUgYSBQZXJzaXN0ZW50IFJTQSBF
bmRvcnNlbWVudCBLZXk8L2gyPgoKCgk8cD5UaGUgZm9sbG93aW5nIHRwbTItdG9vbHMgY29tbWFu
ZCBkZXJpdmVzIGEgMjA0OCBiaXQgUlNBIEVuZG9yc2VtZW50IEtleSAoRUspIGluIGEgZGV0ZXJt
aW5pc3RpYyB3YXkgZnJvbSB0aGUgc2VjcmV0IDxlbT5FbmRvcnNlbWVudCBQcmltYXJ5IFNlZWQ8
L2VtPiA8c3Ryb25nPnVuaXF1ZTwvc3Ryb25nPiB0byBlYWNoIFRQTSBkZXZpY2UgYW5kIG1ha2Vz
IHRoZSBrZXkgcGVyc2lzdGVudCBpbiB0aGUgbm9uLXZvbGF0aWxlIG1lbW9yeSBvZiB0aGUgVFBN
IHVuZGVyIHRoZSBvYmplY3QgaGFuZGxlIDB4ODEwMTAwMDE8L3A+CgoKCTxwcmU+PGNvZGU+dHBt
Ml9nZXRwdWJlayAtSCAweDgxMDEwMDAxIC1nIHJzYSAtZiBla19yc2EucHViPC9jb2RlPjwvcHJl
PgoKCgk8cD5UaGUgRUsgcHVibGljIGtleSBzdG9yZWQgaW4gdGhlIGVrX3JzYS5wdWIgZmlsZSBp
cyBlbmNvZGVkIGluIGEgVFBNIAoyLjAgcHJvcHJpZXRhcnkgZm9ybWF0IGJ1dCB0aGUga2V5IGNh
biBiZSBleHBvcnRlZCBmcm9tIHRoZSBUUE0gaW4gdGhlIApyZWd1bGFyIFBLQ1MjMSBmb3JtYXQg
dXNpbmcgdGhlIDxzdHJvbmc+cGtpPC9zdHJvbmc+IHRvb2w8L3A+CgoKCTxwcmU+PGNvZGU+cGtp
IC0tcHViIC0ta2V5aWQgMHg4MTAxMDAwMSAtLW91dGZvcm0gcGVtICZndDsgZWtfcnNhX3B1Yi5w
ZW08YnI+PGJyPi88YnI+PC9jb2RlPjwvcHJlPjxwcmU+PGNvZGU+SSBhbSBydW5uaW5nIHRoZSBs
YXRlc3QvZ3JlYXRlc3QgVFBNIG9uIFVidW50dSAyMC4wNC48YnI+PC9jb2RlPjwvcHJlPjxwcmU+
PGNvZGU+SSBoYXZlIGNyZWF0ZWQgYW4gRUsgYXMgcGVyOzxicj48YnI+JCBzdWRvIHRwbTJfY3Jl
YXRlZWsgLUcgcnNhIC11IGVrLnB1YiAtYyAweDgxMDEwMDA0PGJyPjxicj5XaGVuIEkgdGhlbiB0
cnkgdG8gZXhwb3J0IHRoaXMgaXQgZmFpbHM7PGJyPjxicj4kIHBraSAtLXB1YiAtLWtleWlkIDB4
ODEwMTAwMDQgLS1vdXRmb3JtIHBlbSAmZ3Q7IGVrX3JzYV9wdWIucGVtPGJyPmJ1aWxkaW5nIENS
RURfUFJJVkFURV9LRVkgLSBBTlkgZmFpbGVkLCB0cmllZCA1IGJ1aWxkZXJzPGJyPnBhcnNpbmcg
cHJpdmF0ZSBrZXkgZmFpbGVkPGJyPjxicj48L2NvZGU+PC9wcmU+PHByZT48Y29kZT5Xb3VsZCBh
bnlvbmUga25vdyB3aGF0IEkmIzM5O20gZG9pbmcgd3JvbmcsIG9yIGhhdmUgYW55IGd1aWRhbmNl
IG9uIGFuIHVwdG8gZGF0ZSBleGFtcGxlPzxicj48YnI+PC9jb2RlPjwvcHJlPjxwcmU+PGNvZGU+
bWFueSB0aGFua3M8YnI+PC9jb2RlPjwvcHJlPjwvZGl2PjwvZGl2PgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KdHBtMiBtYWlsaW5nIGxpc3QgLS0g
PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBs
aXN0cy4wMS5vcmc8L2E+PGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhy
ZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTIt
bGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2ll
eHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============1979685588124011181==--

