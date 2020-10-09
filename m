Content-Type: multipart/mixed; boundary="===============6277527414265805287=="
MIME-Version: 1.0
From: Bill Gercken <bgercken at gmail.com>
Subject: [tpm2] Re: assistance with TPM2 - StrongSwan
Date: Fri, 09 Oct 2020 17:42:52 -0400
Message-ID: <CAOr2RpOn1z97Bg++xaFGWM8p_U06xw2Y-W_JF2aeoBmX0yVLvg@mail.gmail.com>
In-Reply-To: CAOr2RpMfLDkvvqhNeUto9Vy7vHxtN7azm664W8FZynrZ=S6VvA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6277527414265805287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Graham,

Also - not sure what your use case is but if all you want is the public
portion of the EK in a PEM format you can use the tpm2_readpublic command
for that as well.

-bill

```
[bgercken(a)titan8 0]$ tpm2_readpublic -Q -H 0x81010001 -f pem -o ek_pub.pem

[bgercken(a)titan8 0]$ cat ek_pub.pem

-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmUvJ6RGXXzO6PNqLGYkW
qg63yk+WGLyc0AyzmxMhlR+cQcgcCiBF9WIkpQ/YDKL+W9Cn1MnstWkJ449atGbP
riLsLUX9a0XnZWPFjh/euG7XrBFJH7PF5XW8h6WSlI7hKj/dCJn+Zc1pkhy0P5mL
HcldM+hV484z4DDG4c0ZRBXArFAygiNZnxAIwwA1pTMNjfdmUsKZqxGxkZen7+rn
CyyQaYrJnpbCFztjVkm9QPmZ17qwA2InHAqHdjS1QZd3oNF/lm2+E3C7qnOiX+EZ
rwdkL40pw+cG+Y+ym557a1Toknzs7rUe89zUwa2mRuZD7CeautHxXYWM99OrbzCw
PwIDAQAB
-----END PUBLIC KEY-----
```


On Fri, Oct 9, 2020 at 2:08 PM Bill Gercken <bgercken(a)gmail.com> wrote:

> Graham,
>
> I was getting the same error message. Then I recompiled the code adding
> the following arguments to configure:
>
> `./configure --enable-tpm --enable-tss-tss2`
>
> Then when I ran the example it worked. (I am getting a signature algorithm
> error message but the command completes correctly.)
>
> ```
> [bgercken(a)titan8 ~]$ tpm2_getpubek -H 0x81010001 -g rsa -f ek_rsa.pub
>
> [bgercken(a)titan8 ~]$ sudo /usr/local/bin/pki --pub --keyid 0x81010001
> --outform pem
> TPM 2.0 via TSS2 v2 available
> signature algorithm is NULL with ERROR hash
> -----BEGIN PUBLIC KEY-----
> MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmUvJ6RGXXzO6PNqLGYkW
> qg63yk+WGLyc0AyzmxMhlR+cQcgcCiBF9WIkpQ/YDKL+W9Cn1MnstWkJ449atGbP
> riLsLUX9a0XnZWPFjh/euG7XrBFJH7PF5XW8h6WSlI7hKj/dCJn+Zc1pkhy0P5mL
> HcldM+hV484z4DDG4c0ZRBXArFAygiNZnxAIwwA1pTMNjfdmUsKZqxGxkZen7+rn
> CyyQaYrJnpbCFztjVkm9QPmZ17qwA2InHAqHdjS1QZd3oNF/lm2+E3C7qnOiX+EZ
> rwdkL40pw+cG+Y+ym557a1Toknzs7rUe89zUwa2mRuZD7CeautHxXYWM99OrbzCw
> PwIDAQAB
> -----END PUBLIC KEY-----
>
> [bgercken(a)titan8 ~]$ sudo /usr/local/bin/pki --pub --keyid 0x81010001
> --outform pem > ek_rsa_pub.pem
> TPM 2.0 via TSS2 v2 available
> signature algorithm is NULL with ERROR hash
>
> [bgercken(a)titan8 ~]$ pki --print --type pub --in ek_rsa_pub.pem
>   pubkey:    RSA 2048 bits
>   keyid:     17:ed:f2:c3:c2:0c:c0:96:32:0d:57:f2:2a:90:79:bd:30:e9:b9:4f
>   subjkey:   7b:45:1d:54:21:71:5b:89:08:95:22:8b:fa:be:bc:1a:fa:37:61:80
>
> [bgercken(a)titan8 ~]$ tpm2_listpersistent
> persistent-handle[0]:0x81010001 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|adminwithpolicy|rest=
ricted|decrypt
> persistent-handle[1]:0x81010005 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|adminwithpolicy|rest=
ricted|decrypt
> persistent-handle[2]:0x8101000f key-alg:keyedhash hash-alg:sha256
> object-attr:fixedtpm|fixedparent|userwithauth
> ```
> I am running on RHEL/CentOS 8 with specifics shown below:
>
> ```
> [bgercken(a)titan8 ~]$ rpm -qa | grep tpm
> tpm2-abrmd-debuginfo-2.1.1-3.el8.x86_64
> tpm2-abrmd-debugsource-2.1.1-3.el8.x86_64
> tpm2-tss-devel-2.0.0-4.el8.x86_64
> tpm2-abrmd-2.1.1-3.el8.x86_64
> tpm2-tss-debuginfo-2.0.0-4.el8.x86_64
> tpm2-tss-debugsource-2.0.0-4.el8.x86_64
> tpm2-tss-2.0.0-4.el8.x86_64
> tpm2-abrmd-selinux-2.0.0-3.el8.noarch
> tpm2-tools-3.2.1-1.el8.x86_64
>
> [bgercken(a)titan8 ~]$ uname -r
> 4.18.0-193.14.2.el8_2.x86_64
>
> [bgercken(a)titan8 ~]$ cat /etc/os-release
> NAME=3D"CentOS Linux"
> VERSION=3D"8 (Core)"
> ID=3D"centos"
> ID_LIKE=3D"rhel fedora"
> VERSION_ID=3D"8"
> PLATFORM_ID=3D"platform:el8"
> PRETTY_NAME=3D"CentOS Linux 8 (Core)"
> ANSI_COLOR=3D"0;31"
> CPE_NAME=3D"cpe:/o:centos:centos:8"
> HOME_URL=3D"https://www.centos.org/"
> BUG_REPORT_URL=3D"https://bugs.centos.org/"
>
> CENTOS_MANTISBT_PROJECT=3D"CentOS-8"
> CENTOS_MANTISBT_PROJECT_VERSION=3D"8"
> REDHAT_SUPPORT_PRODUCT=3D"centos"
> REDHAT_SUPPORT_PRODUCT_VERSION=3D"8"
> ```
>  Cheers,
> -bill
>
> On Fri, Oct 9, 2020 at 11:17 AM Graham Bartlett <graham.ietf(a)gmail.com>
> wrote:
>
>> Hi
>>
>> I'm following the StrongSwan example of using the TPM;
>>
>> https://wiki.strongswan.org/projects/strongswan/wiki/TpmPlugin
>>
>> The StrongSwan guide suggests;
>>
>> Derive a Persistent RSA Endorsement Key
>>
>> The following tpm2-tools command derives a 2048 bit RSA Endorsement Key
>> (EK) in a deterministic way from the secret *Endorsement Primary Seed*
>> *unique* to each TPM device and makes the key persistent in the
>> non-volatile memory of the TPM under the object handle 0x81010001
>>
>> tpm2_getpubek -H 0x81010001 -g rsa -f ek_rsa.pub
>>
>> The EK public key stored in the ek_rsa.pub file is encoded in a TPM 2.0
>> proprietary format but the key can be exported from the TPM in the regul=
ar
>> PKCS#1 format using the *pki* tool
>>
>> pki --pub --keyid 0x81010001 --outform pem > ek_rsa_pub.pem
>>
>> /
>>
>> I am running the latest/greatest TPM on Ubuntu 20.04.
>>
>> I have created an EK as per;
>>
>> $ sudo tpm2_createek -G rsa -u ek.pub -c 0x81010004
>>
>> When I then try to export this it fails;
>>
>> $ pki --pub --keyid 0x81010004 --outform pem > ek_rsa_pub.pem
>> building CRED_PRIVATE_KEY - ANY failed, tried 5 builders
>> parsing private key failed
>>
>> Would anyone know what I'm doing wrong, or have any guidance on an upto =
date example?
>>
>> many thanks
>>
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>

--===============6277527414265805287==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+R3JhaGFtLDxkaXY+PGJyPjwvZGl2PjxkaXY+QWxzbyAtIG5vdCBzdXJl
IHdoYXQgeW91ciB1c2UgY2FzZSBpcyBidXQgaWYgYWxsIHlvdSB3YW50IGlzIHRoZSBwdWJsaWMg
cG9ydGlvbiBvZiB0aGUgRUsgaW4gYSBQRU0gZm9ybWF0IHlvdSBjYW4gdXNlIHRoZSB0cG0yX3Jl
YWRwdWJsaWMgY29tbWFuZCBmb3IgdGhhdCBhcyB3ZWxsLjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+LWJpbGw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmBgYDwvZGl2PjxkaXY+CgoKCgoKW2Jn
ZXJja2VuQHRpdGFuOCAwXSQgdHBtMl9yZWFkcHVibGljIC1RIC1IIDB4ODEwMTAwMDEgLWYgcGVt
IC1vIGVrX3B1Yi5wZW08YnI+PGJyPltiZ2VyY2tlbkB0aXRhbjggMF0kIGNhdCBla19wdWIucGVt
IDxicj48YnI+LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS08YnI+TUlJQklqQU5CZ2txaGtpRzl3
MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUFtVXZKNlJHWFh6TzZQTnFMR1lrVzxicj5xZzYzeWsr
V0dMeWMwQXl6bXhNaGxSK2NRY2djQ2lCRjlXSWtwUS9ZREtMK1c5Q24xTW5zdFdrSjQ0OWF0R2JQ
PGJyPnJpTHNMVVg5YTBYblpXUEZqaC9ldUc3WHJCRkpIN1BGNVhXOGg2V1NsSTdoS2ovZENKbita
YzFwa2h5MFA1bUw8YnI+SGNsZE0raFY0ODR6NERERzRjMFpSQlhBckZBeWdpTlpueEFJd3dBMXBU
TU5qZmRtVXNLWnF4R3hrWmVuNytybjxicj5DeXlRYVlySm5wYkNGenRqVmttOVFQbVoxN3F3QTJJ
bkhBcUhkalMxUVpkM29ORi9sbTIrRTNDN3FuT2lYK0VaPGJyPnJ3ZGtMNDBwdytjRytZK3ltNTU3
YTFUb2tuenM3clVlODl6VXdhMm1SdVpEN0NlYXV0SHhYWVdNOTlPcmJ6Q3c8YnI+UHdJREFRQUI8
YnI+LS0tLS1FTkQgUFVCTElDIEtFWS0tLS0tPC9kaXY+PGRpdj5gYGA8L2Rpdj48ZGl2Pjxicj48
L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNs
YXNzPSJnbWFpbF9hdHRyIj5PbiBGcmksIE9jdCA5LCAyMDIwIGF0IDI6MDggUE0gQmlsbCBHZXJj
a2VuICZsdDs8YSBocmVmPSJtYWlsdG86YmdlcmNrZW5AZ21haWwuY29tIj5iZ2VyY2tlbkBnbWFp
bC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xp
ZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPkdyYWhh
bSw8ZGl2Pjxicj48L2Rpdj48ZGl2Pkkgd2FzIGdldHRpbmcgdGhlIHNhbWUgZXJyb3IgbWVzc2Fn
ZS4gVGhlbiBJIHJlY29tcGlsZWQgdGhlIGNvZGUgYWRkaW5nIHRoZSBmb2xsb3dpbmcgYXJndW1l
bnRzIHRvIGNvbmZpZ3VyZTo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmAuL2NvbmZpZ3VyZSAt
LWVuYWJsZS10cG0gLS1lbmFibGUtdHNzLXRzczJgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5U
aGVuIHdoZW4gSSByYW4gdGhlIGV4YW1wbGUgaXQgd29ya2VkLiAoSSBhbSBnZXR0aW5nIGEgc2ln
bmF0dXJlIGFsZ29yaXRobSBlcnJvciBtZXNzYWdlIGJ1dCB0aGUgY29tbWFuZCBjb21wbGV0ZXMg
Y29ycmVjdGx5Lik8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmBgYDwvZGl2PjxkaXY+W2JnZXJj
a2VuQHRpdGFuOCB+XSQgdHBtMl9nZXRwdWJlayAtSCAweDgxMDEwMDAxIC1nIHJzYSAtZiBla19y
c2EucHViPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+W2JnZXJja2VuQHRpdGFuOCB+XSQg
c3VkbyAvdXNyL2xvY2FsL2Jpbi9wa2kgLS1wdWIgLS1rZXlpZCAweDgxMDEwMDAxIC0tb3V0Zm9y
bSBwZW08YnI+VFBNIDIuMCB2aWEgVFNTMiB2MiBhdmFpbGFibGU8YnI+c2lnbmF0dXJlIGFsZ29y
aXRobSBpcyBOVUxMIHdpdGggRVJST1IgaGFzaDxicj4tLS0tLUJFR0lOIFBVQkxJQyBLRVktLS0t
LTxicj5NSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQW1Vdko2UkdY
WHpPNlBOcUxHWWtXPGJyPnFnNjN5aytXR0x5YzBBeXpteE1obFIrY1FjZ2NDaUJGOVdJa3BRL1lE
S0wrVzlDbjFNbnN0V2tKNDQ5YXRHYlA8YnI+cmlMc0xVWDlhMFhuWldQRmpoL2V1RzdYckJGSkg3
UEY1WFc4aDZXU2xJN2hLai9kQ0puK1pjMXBraHkwUDVtTDxicj5IY2xkTStoVjQ4NHo0RERHNGMw
WlJCWEFyRkF5Z2lOWm54QUl3d0ExcFRNTmpmZG1Vc0tacXhHeGtaZW43K3JuPGJyPkN5eVFhWXJK
bnBiQ0Z6dGpWa205UVBtWjE3cXdBMkluSEFxSGRqUzFRWmQzb05GL2xtMitFM0M3cW5PaVgrRVo8
YnI+cndka0w0MHB3K2NHK1kreW01NTdhMVRva256czdyVWU4OXpVd2EybVJ1WkQ3Q2VhdXRIeFhZ
V005OU9yYnpDdzxicj5Qd0lEQVFBQjxicj4tLS0tLUVORCBQVUJMSUMgS0VZLS0tLS08YnI+PGJy
PjwvZGl2PjxkaXY+W2JnZXJja2VuQHRpdGFuOCB+XSQgc3VkbyAvdXNyL2xvY2FsL2Jpbi9wa2kg
LS1wdWIgLS1rZXlpZCAweDgxMDEwMDAxIC0tb3V0Zm9ybSBwZW0gJmd0OyBla19yc2FfcHViLnBl
bTxicj5UUE0gMi4wIHZpYSBUU1MyIHYyIGF2YWlsYWJsZTxicj5zaWduYXR1cmUgYWxnb3JpdGht
IGlzIE5VTEwgd2l0aCBFUlJPUiBoYXNoPGJyPjxicj48L2Rpdj48ZGl2PltiZ2VyY2tlbkB0aXRh
bjggfl0kIHBraSAtLXByaW50IC0tdHlwZSBwdWIgLS1pbiBla19yc2FfcHViLnBlbTxicj7CoCBw
dWJrZXk6IMKgIMKgUlNBIDIwNDggYml0czxicj7CoCBrZXlpZDogwqAgwqAgMTc6ZWQ6ZjI6YzM6
YzI6MGM6YzA6OTY6MzI6MGQ6NTc6ZjI6MmE6OTA6Nzk6YmQ6MzA6ZTk6Yjk6NGY8YnI+wqAgc3Vi
amtleTogwqAgN2I6NDU6MWQ6NTQ6MjE6NzE6NWI6ODk6MDg6OTU6MjI6OGI6ZmE6YmU6YmM6MWE6
ZmE6Mzc6NjE6ODA8YnI+PGJyPjwvZGl2PjxkaXY+W2JnZXJja2VuQHRpdGFuOCB+XSQgdHBtMl9s
aXN0cGVyc2lzdGVudDxicj5wZXJzaXN0ZW50LWhhbmRsZVswXToweDgxMDEwMDAxIGtleS1hbGc6
cnNhIGhhc2gtYWxnOnNoYTI1NiBvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5z
aXRpdmVkYXRhb3JpZ2lufGFkbWlud2l0aHBvbGljeXxyZXN0cmljdGVkfGRlY3J5cHQ8YnI+cGVy
c2lzdGVudC1oYW5kbGVbMV06MHg4MTAxMDAwNSBrZXktYWxnOnJzYSBoYXNoLWFsZzpzaGEyNTYg
b2JqZWN0LWF0dHI6Zml4ZWR0cG18Zml4ZWRwYXJlbnR8c2Vuc2l0aXZlZGF0YW9yaWdpbnxhZG1p
bndpdGhwb2xpY3l8cmVzdHJpY3RlZHxkZWNyeXB0PGJyPnBlcnNpc3RlbnQtaGFuZGxlWzJdOjB4
ODEwMTAwMGYga2V5LWFsZzprZXllZGhhc2ggaGFzaC1hbGc6c2hhMjU2IG9iamVjdC1hdHRyOmZp
eGVkdHBtfGZpeGVkcGFyZW50fHVzZXJ3aXRoYXV0aDxicj48L2Rpdj48ZGl2PmBgYDwvZGl2Pjxk
aXY+SSBhbSBydW5uaW5nIG9uIFJIRUwvQ2VudE9TIDggd2l0aCBzcGVjaWZpY3Mgc2hvd24gYmVs
b3c6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5gYGA8L2Rpdj48ZGl2PltiZ2VyY2tlbkB0aXRh
bjggfl0kIHJwbSAtcWEgfCBncmVwIHRwbTxicj50cG0yLWFicm1kLWRlYnVnaW5mby0yLjEuMS0z
LmVsOC54ODZfNjQ8YnI+dHBtMi1hYnJtZC1kZWJ1Z3NvdXJjZS0yLjEuMS0zLmVsOC54ODZfNjQ8
YnI+dHBtMi10c3MtZGV2ZWwtMi4wLjAtNC5lbDgueDg2XzY0PGJyPnRwbTItYWJybWQtMi4xLjEt
My5lbDgueDg2XzY0PGJyPnRwbTItdHNzLWRlYnVnaW5mby0yLjAuMC00LmVsOC54ODZfNjQ8YnI+
dHBtMi10c3MtZGVidWdzb3VyY2UtMi4wLjAtNC5lbDgueDg2XzY0PGJyPnRwbTItdHNzLTIuMC4w
LTQuZWw4Lng4Nl82NDxicj50cG0yLWFicm1kLXNlbGludXgtMi4wLjAtMy5lbDgubm9hcmNoPGJy
PnRwbTItdG9vbHMtMy4yLjEtMS5lbDgueDg2XzY0PC9kaXY+PGRpdj48YnI+W2JnZXJja2VuQHRp
dGFuOCB+XSQgdW5hbWUgLXI8YnI+NC4xOC4wLTE5My4xNC4yLmVsOF8yLng4Nl82NDxicj48YnI+
PC9kaXY+PGRpdj5bYmdlcmNrZW5AdGl0YW44IH5dJCBjYXQgL2V0Yy9vcy1yZWxlYXNlPGJyPk5B
TUU9JnF1b3Q7Q2VudE9TIExpbnV4JnF1b3Q7PGJyPlZFUlNJT049JnF1b3Q7OCAoQ29yZSkmcXVv
dDs8YnI+SUQ9JnF1b3Q7Y2VudG9zJnF1b3Q7PGJyPklEX0xJS0U9JnF1b3Q7cmhlbCBmZWRvcmEm
cXVvdDs8YnI+VkVSU0lPTl9JRD0mcXVvdDs4JnF1b3Q7PGJyPlBMQVRGT1JNX0lEPSZxdW90O3Bs
YXRmb3JtOmVsOCZxdW90Ozxicj5QUkVUVFlfTkFNRT0mcXVvdDtDZW50T1MgTGludXggOCAoQ29y
ZSkmcXVvdDs8YnI+QU5TSV9DT0xPUj0mcXVvdDswOzMxJnF1b3Q7PGJyPkNQRV9OQU1FPSZxdW90
O2NwZTovbzpjZW50b3M6Y2VudG9zOjgmcXVvdDs8YnI+SE9NRV9VUkw9JnF1b3Q7PGEgaHJlZj0i
aHR0cHM6Ly93d3cuY2VudG9zLm9yZy8iIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3d3dy5jZW50
b3Mub3JnLzwvYT4mcXVvdDs8YnI+QlVHX1JFUE9SVF9VUkw9JnF1b3Q7PGEgaHJlZj0iaHR0cHM6
Ly9idWdzLmNlbnRvcy5vcmcvIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9idWdzLmNlbnRvcy5v
cmcvPC9hPiZxdW90Ozxicj48YnI+Q0VOVE9TX01BTlRJU0JUX1BST0pFQ1Q9JnF1b3Q7Q2VudE9T
LTgmcXVvdDs8YnI+Q0VOVE9TX01BTlRJU0JUX1BST0pFQ1RfVkVSU0lPTj0mcXVvdDs4JnF1b3Q7
PGJyPlJFREhBVF9TVVBQT1JUX1BST0RVQ1Q9JnF1b3Q7Y2VudG9zJnF1b3Q7PGJyPlJFREhBVF9T
VVBQT1JUX1BST0RVQ1RfVkVSU0lPTj0mcXVvdDs4JnF1b3Q7PGJyPmBgYDwvZGl2PjxkaXY+wqBD
aGVlcnMsPC9kaXY+PGRpdj4tYmlsbDwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9x
dW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIEZyaSwgT2N0IDksIDIw
MjAgYXQgMTE6MTcgQU0gR3JhaGFtIEJhcnRsZXR0ICZsdDs8YSBocmVmPSJtYWlsdG86Z3JhaGFt
LmlldGZAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+Z3JhaGFtLmlldGZAZ21haWwuY29tPC9h
PiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5
bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIw
NCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj48ZGl2PkhpPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5JJiMzOTttIGZvbGxvd2luZyB0aGUgU3Ryb25nU3dhbiBleGFt
cGxlIG9mIHVzaW5nIHRoZSBUUE07PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YSBocmVmPSJo
dHRwczovL3dpa2kuc3Ryb25nc3dhbi5vcmcvcHJvamVjdHMvc3Ryb25nc3dhbi93aWtpL1RwbVBs
dWdpbiIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vd2lraS5zdHJvbmdzd2FuLm9yZy9wcm9qZWN0
cy9zdHJvbmdzd2FuL3dpa2kvVHBtUGx1Z2luPC9hPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
VGhlIFN0cm9uZ1N3YW4gZ3VpZGUgc3VnZ2VzdHM7PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48
aDI+RGVyaXZlIGEgUGVyc2lzdGVudCBSU0EgRW5kb3JzZW1lbnQgS2V5PC9oMj4KCgoJPHA+VGhl
IGZvbGxvd2luZyB0cG0yLXRvb2xzIGNvbW1hbmQgZGVyaXZlcyBhIDIwNDggYml0IFJTQSBFbmRv
cnNlbWVudCBLZXkgKEVLKSBpbiBhIGRldGVybWluaXN0aWMgd2F5IGZyb20gdGhlIHNlY3JldCA8
ZW0+RW5kb3JzZW1lbnQgUHJpbWFyeSBTZWVkPC9lbT4gPHN0cm9uZz51bmlxdWU8L3N0cm9uZz4g
dG8gZWFjaCBUUE0gZGV2aWNlIGFuZCBtYWtlcyB0aGUga2V5IHBlcnNpc3RlbnQgaW4gdGhlIG5v
bi12b2xhdGlsZSBtZW1vcnkgb2YgdGhlIFRQTSB1bmRlciB0aGUgb2JqZWN0IGhhbmRsZSAweDgx
MDEwMDAxPC9wPgoKCgk8cHJlPjxjb2RlPnRwbTJfZ2V0cHViZWsgLUggMHg4MTAxMDAwMSAtZyBy
c2EgLWYgZWtfcnNhLnB1YjwvY29kZT48L3ByZT4KCgoJPHA+VGhlIEVLIHB1YmxpYyBrZXkgc3Rv
cmVkIGluIHRoZSBla19yc2EucHViIGZpbGUgaXMgZW5jb2RlZCBpbiBhIFRQTSAKMi4wIHByb3By
aWV0YXJ5IGZvcm1hdCBidXQgdGhlIGtleSBjYW4gYmUgZXhwb3J0ZWQgZnJvbSB0aGUgVFBNIGlu
IHRoZSAKcmVndWxhciBQS0NTIzEgZm9ybWF0IHVzaW5nIHRoZSA8c3Ryb25nPnBraTwvc3Ryb25n
PiB0b29sPC9wPgoKCgk8cHJlPjxjb2RlPnBraSAtLXB1YiAtLWtleWlkIDB4ODEwMTAwMDEgLS1v
dXRmb3JtIHBlbSAmZ3Q7IGVrX3JzYV9wdWIucGVtPGJyPjxicj4vPGJyPjwvY29kZT48L3ByZT48
cHJlPjxjb2RlPkkgYW0gcnVubmluZyB0aGUgbGF0ZXN0L2dyZWF0ZXN0IFRQTSBvbiBVYnVudHUg
MjAuMDQuPGJyPjwvY29kZT48L3ByZT48cHJlPjxjb2RlPkkgaGF2ZSBjcmVhdGVkIGFuIEVLIGFz
IHBlcjs8YnI+PGJyPiQgc3VkbyB0cG0yX2NyZWF0ZWVrIC1HIHJzYSAtdSBlay5wdWIgLWMgMHg4
MTAxMDAwNDxicj48YnI+V2hlbiBJIHRoZW4gdHJ5IHRvIGV4cG9ydCB0aGlzIGl0IGZhaWxzOzxi
cj48YnI+JCBwa2kgLS1wdWIgLS1rZXlpZCAweDgxMDEwMDA0IC0tb3V0Zm9ybSBwZW0gJmd0OyBl
a19yc2FfcHViLnBlbTxicj5idWlsZGluZyBDUkVEX1BSSVZBVEVfS0VZIC0gQU5ZIGZhaWxlZCwg
dHJpZWQgNSBidWlsZGVyczxicj5wYXJzaW5nIHByaXZhdGUga2V5IGZhaWxlZDxicj48YnI+PC9j
b2RlPjwvcHJlPjxwcmU+PGNvZGU+V291bGQgYW55b25lIGtub3cgd2hhdCBJJiMzOTttIGRvaW5n
IHdyb25nLCBvciBoYXZlIGFueSBndWlkYW5jZSBvbiBhbiB1cHRvIGRhdGUgZXhhbXBsZT88YnI+
PGJyPjwvY29kZT48L3ByZT48cHJlPjxjb2RlPm1hbnkgdGhhbmtzPGJyPjwvY29kZT48L3ByZT48
L2Rpdj48L2Rpdj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAx
Lm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KVG8gdW5zdWJz
Y3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+CiUo
d2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPC9ibG9j
a3F1b3RlPjwvZGl2Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============6277527414265805287==--

