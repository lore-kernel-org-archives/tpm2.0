Content-Type: multipart/mixed; boundary="===============0332667638555564785=="
MIME-Version: 1.0
From: Nicolas Broquet <nico.broquet at gmail.com>
Subject: Re: [tpm2] Help needed to setup an AES key
Date: Fri, 26 Apr 2019 18:48:04 +0200
Message-ID: <CAJ_Jvo=+fE_Jfxh4vBqvSu3EM68qLWLWa2qWWoDqqCxg4kKLFQ@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649D2F00A@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0332667638555564785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The policy was created according to the example at
https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_policyauth=
orize.1.md

DEFAULT_MEASURED_PCRS=3D"sha1:0,2,3,7,10,14"
DEFAULT_EXTERNAL_ATTRIBUTES=3D"restricted|fixedtpm|fixedparent|noda"


tpm2_pcrlist --sel-list=3D$DEFAULT_MEASURED_PCRS --out-file=3D$MEASUREMENTS
tpm2_startauthsession --session=3D$SESSION
tpm2_policypcr --session=3D$SESSION --set-list=3D$DEFAULT_MEASURED_PCRS
--pcr-input-file=3D$MEASUREMENTS --out-policy-file=3D$POLICY
yubico-piv-tool -a read-certificate -s 9c | openssl x509 -pubkey -noout >
$PUBLIC_KEY
OPENSSL_CONF=3Dengine.conf openssl dgst -engine pkcs11 -keyform engine
-sha256 -sign 2 -out $POLICY_SIGNATURE $POLICY
tpm2_loadexternal --hierarchy=3D$DEFAULT_HIERARCHY --key-alg=3Drsa
--pubfile=3D$PUBLIC_KEY --object-attributes=3D$DEFAULT_EXTERNAL_ATTRIBUTES
--out-context=3D$SIGNING_CONTEXT --name=3D$SIGNING_KEY_NAME

tpm2_policyauthorize --session=3D$SESSION --in-policy-file=3D$POLICY
--out-policy-file=3D$AUTHORIZED_POLICY --name=3D$SIGNING_KEY_NAME
tpm2_flushcontext --session=3D$SESSION


That executes without any errors.

On Thu, Apr 25, 2019, 17:57 Roberts, William C <william.c.roberts(a)intel.c=
om>
wrote:

>
>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Nicolas
> Broquet
> > Sent: Sunday, April 21, 2019 12:07 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] Help needed to setup an AES key
> >
> > Hello everyone,
> >
> >
> > New to the TPM world, I've been reading various docs and forums the past
> two
> > weeks and I am now attempting to put all the learning into practice.
> > More specifically, I'm trying to have the TPM create an AES key.
> > Here is what I did so far:
> >
> >
> >
> >
> >       DEFAULT_HIERARCHY=3D"o"
> >       DEFAULT_ATTRIBUTES=3D"restricted|decrypt|fixedtpm|fixedparent|sen=
si
> > tivedataorigin|userwithauth|noda"
> >       DEFAULT_PERSISTENT_HANDLE=3D"0x81010001"
> >       PARENT_PERSISTENT_HANDLE=3D"0x81010002"
> >
> >       tpm2_createprimary --hierarchy=3D$DEFAULT_HIERARCHY --auth-
> > hierarchy=3D"$OWNER_PASSWORD" --object-attributes=3D$DEFAULT_ATTRIBUTES=
 --
> > halg sha256 --kalg rsa2048:aes128cfb --out-context-name=3D$PRIMARY_CONT=
EXT
> >
> >
> >       tpm2_evictcontrol --hierarchy=3D$DEFAULT_HIERARCHY --
> > context=3D$PRIMARY_CONTEXT --auth-hierarchy=3D$OWNER_PASSWORD --
> > persistent=3D$DEFAULT_PERSISTENT_HANDLE
> >
> >
> >       tpm2_create --context-parent=3D$PRIMARY_CONTEXT --object-
> > attributes=3D$DEFAULT_ATTRIBUTES --pubfile=3D$PUBFILE --privfile=3D$PRI=
VFILE
> --halg
> > sha256 --kalg rsa2048:aes128cfb
> >
> >
> >       tpm2_load --quiet --context=3D$PRIMARY_CONTEXT --pubfile=3D$PUBFI=
LE --
> > privfile=3D$PRIVFILE --out-context=3D$PARENT_CONTEXT
> >
> >
> >       tpm2_evictcontrol --hierarchy=3D$DEFAULT_HIERARCHY --
> > context=3D$PARENT_CONTEXT --auth-hierarchy=3D$OWNER_PASSWORD --
> > persistent=3D$PARENT_PERSISTENT_HANDLE
> >
> >
> >
> > All of that is working great; a call to tpm2_listpersistent shows the
> two keys and
> > their persistent handle.
> >
> >
> > Then I try to add an AES key to that hierarchy. I want this key to be
> usable only if
> > some policy is satisfied:
> >
> >
> >
> >       tpm2_create --context-parent=3D$PARENT_CONTEXT --kalg=3Daes --
> > pubfile=3D$PUBFILE --privfile=3D$PRIVFILE --policy-file=3D$AUTHORIZED_P=
OLICY
>
> Where did you get policy-file from?
>
> >
> >
> > This call returns the following:
> >
> >
> >
> >       WARNING:esys:src/tss2-
> > esys/api/Esys_Create.c:412:Esys_Create_Finish() Received TPM Error
> >       ERROR:esys:src/tss2-esys/api/Esys_Create.c:156:Esys_Create() Esys
> > Finish ErrorCode (0x000002c4)
> >       ERROR: Esys_Create(0x2C4) - tpm:parameter(2):value is out of range
> or is
> > not correct for the context
> >       ERROR: Unable to run tpm2_create
>
> FYI there is a scheme in the commands document where there is a thick line
> that indicates
> The parameter section for a command. In your case parameter 2 is the
> public object template.
> Doesn't seem to like it.
>
>
> https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-3-C=
ommands-01.38.pdf
>
> You're likely just hitting different checks within the TPM and not really
> fixing the above issue. Those checks
> have wildly complex interactions and I am by no means an expert. I have
> found the best way is to:
> 1. see if you can replicate on the software simulator.
> 2. place software simulator in debugger and figure out what exact check is
> failing.
>
> >
> >
> > I then tried with "aes128" as key algorithm, instead of just "aes":
> >
> >       WARNING:esys:src/tss2-
> > esys/api/Esys_Create.c:412:Esys_Create_Finish() Received TPM Error
> >       ERROR:esys:src/tss2-esys/api/Esys_Create.c:156:Esys_Create() Esys
> > Finish ErrorCode (0x000002c9)
> >       ERROR: Esys_Create(0x2C9) - tpm:parameter(2):mode of operation not
> > supported
> >       ERROR: Unable to run tpm2_create
> >
> >
> > I also tried to specify a mode instead ("aes128cfb"):
> >
> >       WARNING:esys:src/tss2-
> > esys/api/Esys_Create.c:412:Esys_Create_Finish() Received TPM Error
> >       ERROR:esys:src/tss2-esys/api/Esys_Create.c:156:Esys_Create() Esys
> > Finish ErrorCode (0x000002c2)
> >       ERROR: Esys_Create(0x2C2) - tpm:parameter(2):inconsistent
> attributes
> >       ERROR: Unable to run tpm2_create
> >
> >
> >
> >
> >
> > After having read all the MAN pages twice, I still have no idea what is
> going on or
> > what I did wrong. Most if not all of those commands were merely
> copy/pasted
> > from the MAN pages at https://github.com/tpm2-software/tpm2-
> > tools/tree/master/man .
> >
> >
> > I'm using a Lenovo X1 Carbon (3rd gen) with Intel PTT enabled, so the
> system
> > sees a TPM2.0 device. I can provide more information if needed.
> > I would greatly appreciate if someone could provide some guidance on
> this issue;
> > the TPM world being fascinating so far, I wouldn't want to be stuck on
> that
> > problem.
> >
> > Thanks in advance for your help,
> > Regards,
> >
> >
> > Nicolas
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
>
>

--===============0332667638555564785==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+VGhlIHBvbGljeSB3
YXMgY3JlYXRlZCBhY2NvcmRpbmcgdG8gdGhlIGV4YW1wbGUgYXTCoDxhIGhyZWY9Imh0dHBzOi8v
Z2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9tYXN0ZXIvbWFuL3RwbTJf
cG9saWN5YXV0aG9yaXplLjEubWQiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3Rw
bTItdG9vbHMvYmxvYi9tYXN0ZXIvbWFuL3RwbTJfcG9saWN5YXV0aG9yaXplLjEubWQ8L2E+PC9k
aXY+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2PjwvZGl2PjxibG9ja3F1b3RlIHN0eWxlPSJtYXJn
aW46MCAwIDAgNDBweDtib3JkZXI6bm9uZTtwYWRkaW5nOjBweCI+PGRpdj48ZGl2PjxkaXY+PGRp
dj48Zm9udCBmYWNlPSJtb25vc3BhY2UsIG1vbm9zcGFjZSI+REVGQVVMVF9NRUFTVVJFRF9QQ1JT
PSZxdW90O3NoYTE6MCwyLDMsNywxMCwxNCZxdW90OzwvZm9udD48L2Rpdj48L2Rpdj48L2Rpdj48
L2Rpdj48ZGl2PjxkaXY+PGRpdj48ZGl2Pjxmb250IGZhY2U9Im1vbm9zcGFjZSwgbW9ub3NwYWNl
Ij5ERUZBVUxUX0VYVEVSTkFMX0FUVFJJQlVURVM9JnF1b3Q7cmVzdHJpY3RlZHxmaXhlZHRwbXxm
aXhlZHBhcmVudHxub2RhJnF1b3Q7PC9mb250PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvYmxv
Y2txdW90ZT48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2Pjxicj48L2Rpdj48L2Rp
dj48YmxvY2txdW90ZSBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDQwcHg7Ym9yZGVyOm5vbmU7
cGFkZGluZzowcHgiPjxkaXY+PGRpdj48ZGl2Pjxmb250IGZhY2U9Im1vbm9zcGFjZSwgbW9ub3Nw
YWNlIj50cG0yX3Bjcmxpc3QgLS1zZWwtbGlzdD0kREVGQVVMVF9NRUFTVVJFRF9QQ1JTIC0tb3V0
LWZpbGU9JE1FQVNVUkVNRU5UUzwvZm9udD48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2PjxkaXY+PGRp
dj48Zm9udCBmYWNlPSJtb25vc3BhY2UsIG1vbm9zcGFjZSI+dHBtMl9zdGFydGF1dGhzZXNzaW9u
IC0tc2Vzc2lvbj0kU0VTU0lPTjwvZm9udD48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2PjxkaXY+PGRp
dj48Zm9udCBmYWNlPSJtb25vc3BhY2UsIG1vbm9zcGFjZSI+dHBtMl9wb2xpY3lwY3IgLS1zZXNz
aW9uPSRTRVNTSU9OIC0tc2V0LWxpc3Q9JERFRkFVTFRfTUVBU1VSRURfUENSUyAtLXBjci1pbnB1
dC1maWxlPSRNRUFTVVJFTUVOVFMgLS1vdXQtcG9saWN5LWZpbGU9JFBPTElDWTwvZm9udD48L2Rp
dj48L2Rpdj48L2Rpdj48ZGl2PjxkaXY+PGRpdj48Zm9udCBmYWNlPSJtb25vc3BhY2UsIG1vbm9z
cGFjZSI+eXViaWNvLXBpdi10b29sIC1hIHJlYWQtY2VydGlmaWNhdGUgLXMgOWMgfCBvcGVuc3Ns
IHg1MDkgLXB1YmtleSAtbm9vdXQgJmd0OyAkUFVCTElDX0tFWTwvZm9udD48L2Rpdj48L2Rpdj48
L2Rpdj48ZGl2PjxkaXY+PGRpdj48Zm9udCBmYWNlPSJtb25vc3BhY2UsIG1vbm9zcGFjZSI+T1BF
TlNTTF9DT05GPWVuZ2luZS5jb25mIG9wZW5zc2wgZGdzdCAtZW5naW5lIHBrY3MxMSAta2V5Zm9y
bSBlbmdpbmUgLXNoYTI1NiAtc2lnbiAyIC1vdXQgJFBPTElDWV9TSUdOQVRVUkUgJFBPTElDWTwv
Zm9udD48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2PjxkaXY+PGRpdj48Zm9udCBmYWNlPSJtb25vc3Bh
Y2UsIG1vbm9zcGFjZSI+dHBtMl9sb2FkZXh0ZXJuYWwgLS1oaWVyYXJjaHk9JERFRkFVTFRfSElF
UkFSQ0hZIC0ta2V5LWFsZz1yc2EgLS1wdWJmaWxlPSRQVUJMSUNfS0VZIC0tb2JqZWN0LWF0dHJp
YnV0ZXM9JERFRkFVTFRfRVhURVJOQUxfQVRUUklCVVRFUyAtLW91dC1jb250ZXh0PSRTSUdOSU5H
X0NPTlRFWFQgLS1uYW1lPSRTSUdOSU5HX0tFWV9OQU1FPC9mb250PjwvZGl2PjwvZGl2PjwvZGl2
PjxkaXY+PGRpdj48ZGl2Pjxmb250IGZhY2U9Im1vbm9zcGFjZSwgbW9ub3NwYWNlIj48YnI+PC9m
b250PjwvZGl2PjwvZGl2PjwvZGl2PjxkaXY+PGRpdj48ZGl2Pjxmb250IGZhY2U9Im1vbm9zcGFj
ZSwgbW9ub3NwYWNlIj50cG0yX3BvbGljeWF1dGhvcml6ZSAtLXNlc3Npb249JFNFU1NJT04gLS1p
bi1wb2xpY3ktZmlsZT0kUE9MSUNZIC0tb3V0LXBvbGljeS1maWxlPSRBVVRIT1JJWkVEX1BPTElD
WSAtLW5hbWU9JFNJR05JTkdfS0VZX05BTUU8L2ZvbnQ+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdj48
ZGl2PjxkaXY+PGZvbnQgZmFjZT0ibW9ub3NwYWNlLCBtb25vc3BhY2UiPnRwbTJfZmx1c2hjb250
ZXh0IC0tc2Vzc2lvbj0kU0VTU0lPTjwvZm9udD48L2Rpdj48L2Rpdj48L2Rpdj48L2Jsb2NrcXVv
dGU+PGRpdiBkaXI9Imx0ciI+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGF0IGV4ZWN1dGVzIHdpdGhv
dXQgYW55IGVycm9ycy48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21h
aWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUaHUsIEFwciAy
NSwgMjAxOSwgMTc6NTcgUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2ls
bGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVy
dHNAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDox
cHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48YnI+Cjxicj4KJmd0
OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4KJmd0OyBGcm9tOiB0cG0yIFttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnRwbTItYm91bmNlc0BsaXN0cy4wMS5vcmciIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItYm91bmNlc0BsaXN0cy4wMS5vcmc8L2E+XSBPbiBCZWhh
bGYgT2YgTmljb2xhcyBCcm9xdWV0PGJyPgomZ3Q7IFNlbnQ6IFN1bmRheSwgQXByaWwgMjEsIDIw
MTkgMTI6MDcgUE08YnI+CiZndDsgVG86IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9y
ZyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+
PGJyPgomZ3Q7IFN1YmplY3Q6IFt0cG0yXSBIZWxwIG5lZWRlZCB0byBzZXR1cCBhbiBBRVMga2V5
PGJyPgomZ3Q7IDxicj4KJmd0OyBIZWxsbyBldmVyeW9uZSw8YnI+CiZndDsgPGJyPgomZ3Q7IDxi
cj4KJmd0OyBOZXcgdG8gdGhlIFRQTSB3b3JsZCwgSSYjMzk7dmUgYmVlbiByZWFkaW5nIHZhcmlv
dXMgZG9jcyBhbmQgZm9ydW1zIHRoZSBwYXN0IHR3bzxicj4KJmd0OyB3ZWVrcyBhbmQgSSBhbSBu
b3cgYXR0ZW1wdGluZyB0byBwdXQgYWxsIHRoZSBsZWFybmluZyBpbnRvIHByYWN0aWNlLjxicj4K
Jmd0OyBNb3JlIHNwZWNpZmljYWxseSwgSSYjMzk7bSB0cnlpbmcgdG8gaGF2ZSB0aGUgVFBNIGNy
ZWF0ZSBhbiBBRVMga2V5Ljxicj4KJmd0OyBIZXJlIGlzIHdoYXQgSSBkaWQgc28gZmFyOjxicj4K
Jmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoERF
RkFVTFRfSElFUkFSQ0hZPSZxdW90O28mcXVvdDs8YnI+CiZndDvCoCDCoCDCoCDCoERFRkFVTFRf
QVRUUklCVVRFUz0mcXVvdDtyZXN0cmljdGVkfGRlY3J5cHR8Zml4ZWR0cG18Zml4ZWRwYXJlbnR8
c2Vuc2k8YnI+CiZndDsgdGl2ZWRhdGFvcmlnaW58dXNlcndpdGhhdXRofG5vZGEmcXVvdDs8YnI+
CiZndDvCoCDCoCDCoCDCoERFRkFVTFRfUEVSU0lTVEVOVF9IQU5ETEU9JnF1b3Q7MHg4MTAxMDAw
MSZxdW90Ozxicj4KJmd0O8KgIMKgIMKgIMKgUEFSRU5UX1BFUlNJU1RFTlRfSEFORExFPSZxdW90
OzB4ODEwMTAwMDImcXVvdDs8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqB0cG0yX2NyZWF0
ZXByaW1hcnkgLS1oaWVyYXJjaHk9JERFRkFVTFRfSElFUkFSQ0hZIC0tYXV0aC08YnI+CiZndDsg
aGllcmFyY2h5PSZxdW90OyRPV05FUl9QQVNTV09SRCZxdW90OyAtLW9iamVjdC1hdHRyaWJ1dGVz
PSRERUZBVUxUX0FUVFJJQlVURVMgLS08YnI+CiZndDsgaGFsZyBzaGEyNTYgLS1rYWxnIHJzYTIw
NDg6YWVzMTI4Y2ZiIC0tb3V0LWNvbnRleHQtbmFtZT0kUFJJTUFSWV9DT05URVhUPGJyPgomZ3Q7
IDxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoHRwbTJfZXZpY3Rjb250cm9sIC0taGllcmFy
Y2h5PSRERUZBVUxUX0hJRVJBUkNIWSAtLTxicj4KJmd0OyBjb250ZXh0PSRQUklNQVJZX0NPTlRF
WFQgLS1hdXRoLWhpZXJhcmNoeT0kT1dORVJfUEFTU1dPUkQgLS08YnI+CiZndDsgcGVyc2lzdGVu
dD0kREVGQVVMVF9QRVJTSVNURU5UX0hBTkRMRTxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7
wqAgwqAgwqAgwqB0cG0yX2NyZWF0ZSAtLWNvbnRleHQtcGFyZW50PSRQUklNQVJZX0NPTlRFWFQg
LS1vYmplY3QtPGJyPgomZ3Q7IGF0dHJpYnV0ZXM9JERFRkFVTFRfQVRUUklCVVRFUyAtLXB1YmZp
bGU9JFBVQkZJTEUgLS1wcml2ZmlsZT0kUFJJVkZJTEUgLS1oYWxnPGJyPgomZ3Q7IHNoYTI1NiAt
LWthbGcgcnNhMjA0ODphZXMxMjhjZmI8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKg
IMKgIMKgdHBtMl9sb2FkIC0tcXVpZXQgLS1jb250ZXh0PSRQUklNQVJZX0NPTlRFWFQgLS1wdWJm
aWxlPSRQVUJGSUxFIC0tPGJyPgomZ3Q7IHByaXZmaWxlPSRQUklWRklMRSAtLW91dC1jb250ZXh0
PSRQQVJFTlRfQ09OVEVYVDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqB0
cG0yX2V2aWN0Y29udHJvbCAtLWhpZXJhcmNoeT0kREVGQVVMVF9ISUVSQVJDSFkgLS08YnI+CiZn
dDsgY29udGV4dD0kUEFSRU5UX0NPTlRFWFQgLS1hdXRoLWhpZXJhcmNoeT0kT1dORVJfUEFTU1dP
UkQgLS08YnI+CiZndDsgcGVyc2lzdGVudD0kUEFSRU5UX1BFUlNJU1RFTlRfSEFORExFPGJyPgom
Z3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IEFsbCBvZiB0aGF0IGlzIHdvcmtpbmcg
Z3JlYXQ7IGEgY2FsbCB0byB0cG0yX2xpc3RwZXJzaXN0ZW50IHNob3dzIHRoZSB0d28ga2V5cyBh
bmQ8YnI+CiZndDsgdGhlaXIgcGVyc2lzdGVudCBoYW5kbGUuPGJyPgomZ3Q7IDxicj4KJmd0OyA8
YnI+CiZndDsgVGhlbiBJIHRyeSB0byBhZGQgYW4gQUVTIGtleSB0byB0aGF0IGhpZXJhcmNoeS4g
SSB3YW50IHRoaXMga2V5IHRvIGJlIHVzYWJsZSBvbmx5IGlmPGJyPgomZ3Q7IHNvbWUgcG9saWN5
IGlzIHNhdGlzZmllZDo8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDvCoCDC
oCDCoCDCoHRwbTJfY3JlYXRlIC0tY29udGV4dC1wYXJlbnQ9JFBBUkVOVF9DT05URVhUIC0ta2Fs
Zz1hZXMgLS08YnI+CiZndDsgcHViZmlsZT0kUFVCRklMRSAtLXByaXZmaWxlPSRQUklWRklMRSAt
LXBvbGljeS1maWxlPSRBVVRIT1JJWkVEX1BPTElDWTxicj4KPGJyPgpXaGVyZSBkaWQgeW91IGdl
dCBwb2xpY3ktZmlsZSBmcm9tPzxicj4KPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgVGhp
cyBjYWxsIHJldHVybnMgdGhlIGZvbGxvd2luZzo8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0
OyA8YnI+CiZndDvCoCDCoCDCoCDCoFdBUk5JTkc6ZXN5czpzcmMvdHNzMi08YnI+CiZndDsgZXN5
cy9hcGkvRXN5c19DcmVhdGUuYzo0MTI6RXN5c19DcmVhdGVfRmluaXNoKCkgUmVjZWl2ZWQgVFBN
IEVycm9yPGJyPgomZ3Q7wqAgwqAgwqAgwqBFUlJPUjplc3lzOnNyYy90c3MyLWVzeXMvYXBpL0Vz
eXNfQ3JlYXRlLmM6MTU2OkVzeXNfQ3JlYXRlKCkgRXN5czxicj4KJmd0OyBGaW5pc2ggRXJyb3JD
b2RlICgweDAwMDAwMmM0KTxicj4KJmd0O8KgIMKgIMKgIMKgRVJST1I6IEVzeXNfQ3JlYXRlKDB4
MkM0KSAtIHRwbTpwYXJhbWV0ZXIoMik6dmFsdWUgaXMgb3V0IG9mIHJhbmdlIG9yIGlzPGJyPgom
Z3Q7IG5vdCBjb3JyZWN0IGZvciB0aGUgY29udGV4dDxicj4KJmd0O8KgIMKgIMKgIMKgRVJST1I6
IFVuYWJsZSB0byBydW4gdHBtMl9jcmVhdGU8YnI+Cjxicj4KRllJIHRoZXJlIGlzIGEgc2NoZW1l
IGluIHRoZSBjb21tYW5kcyBkb2N1bWVudCB3aGVyZSB0aGVyZSBpcyBhIHRoaWNrIGxpbmUgdGhh
dCBpbmRpY2F0ZXM8YnI+ClRoZSBwYXJhbWV0ZXIgc2VjdGlvbiBmb3IgYSBjb21tYW5kLiBJbiB5
b3VyIGNhc2UgcGFyYW1ldGVyIDIgaXMgdGhlIHB1YmxpYyBvYmplY3QgdGVtcGxhdGUuPGJyPgpE
b2VzbiYjMzk7dCBzZWVtIHRvIGxpa2UgaXQuPGJyPgo8YnI+CjxhIGhyZWY9Imh0dHBzOi8vdHJ1
c3RlZGNvbXB1dGluZ2dyb3VwLm9yZy93cC1jb250ZW50L3VwbG9hZHMvVFBNLVJldi0yLjAtUGFy
dC0zLUNvbW1hbmRzLTAxLjM4LnBkZiIgcmVsPSJub3JlZmVycmVyIG5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91cC5vcmcvd3AtY29udGVudC91
cGxvYWRzL1RQTS1SZXYtMi4wLVBhcnQtMy1Db21tYW5kcy0wMS4zOC5wZGY8L2E+PGJyPgo8YnI+
CllvdSYjMzk7cmUgbGlrZWx5IGp1c3QgaGl0dGluZyBkaWZmZXJlbnQgY2hlY2tzIHdpdGhpbiB0
aGUgVFBNIGFuZCBub3QgcmVhbGx5IGZpeGluZyB0aGUgYWJvdmUgaXNzdWUuIFRob3NlIGNoZWNr
czxicj4KaGF2ZSB3aWxkbHkgY29tcGxleCBpbnRlcmFjdGlvbnMgYW5kIEkgYW0gYnkgbm8gbWVh
bnMgYW4gZXhwZXJ0LiBJIGhhdmUgZm91bmQgdGhlIGJlc3Qgd2F5IGlzIHRvOjxicj4KMS4gc2Vl
IGlmIHlvdSBjYW4gcmVwbGljYXRlIG9uIHRoZSBzb2Z0d2FyZSBzaW11bGF0b3IuPGJyPgoyLiBw
bGFjZSBzb2Z0d2FyZSBzaW11bGF0b3IgaW4gZGVidWdnZXIgYW5kIGZpZ3VyZSBvdXQgd2hhdCBl
eGFjdCBjaGVjayBpcyBmYWlsaW5nLjxicj4KPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsg
SSB0aGVuIHRyaWVkIHdpdGggJnF1b3Q7YWVzMTI4JnF1b3Q7IGFzIGtleSBhbGdvcml0aG0sIGlu
c3RlYWQgb2YganVzdCAmcXVvdDthZXMmcXVvdDs6PGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKg
IMKgV0FSTklORzplc3lzOnNyYy90c3MyLTxicj4KJmd0OyBlc3lzL2FwaS9Fc3lzX0NyZWF0ZS5j
OjQxMjpFc3lzX0NyZWF0ZV9GaW5pc2goKSBSZWNlaXZlZCBUUE0gRXJyb3I8YnI+CiZndDvCoCDC
oCDCoCDCoEVSUk9SOmVzeXM6c3JjL3RzczItZXN5cy9hcGkvRXN5c19DcmVhdGUuYzoxNTY6RXN5
c19DcmVhdGUoKSBFc3lzPGJyPgomZ3Q7IEZpbmlzaCBFcnJvckNvZGUgKDB4MDAwMDAyYzkpPGJy
PgomZ3Q7wqAgwqAgwqAgwqBFUlJPUjogRXN5c19DcmVhdGUoMHgyQzkpIC0gdHBtOnBhcmFtZXRl
cigyKTptb2RlIG9mIG9wZXJhdGlvbiBub3Q8YnI+CiZndDsgc3VwcG9ydGVkPGJyPgomZ3Q7wqAg
wqAgwqAgwqBFUlJPUjogVW5hYmxlIHRvIHJ1biB0cG0yX2NyZWF0ZTxicj4KJmd0OyA8YnI+CiZn
dDsgPGJyPgomZ3Q7IEkgYWxzbyB0cmllZCB0byBzcGVjaWZ5IGEgbW9kZSBpbnN0ZWFkICgmcXVv
dDthZXMxMjhjZmImcXVvdDspOjxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoFdBUk5JTkc6
ZXN5czpzcmMvdHNzMi08YnI+CiZndDsgZXN5cy9hcGkvRXN5c19DcmVhdGUuYzo0MTI6RXN5c19D
cmVhdGVfRmluaXNoKCkgUmVjZWl2ZWQgVFBNIEVycm9yPGJyPgomZ3Q7wqAgwqAgwqAgwqBFUlJP
Ujplc3lzOnNyYy90c3MyLWVzeXMvYXBpL0VzeXNfQ3JlYXRlLmM6MTU2OkVzeXNfQ3JlYXRlKCkg
RXN5czxicj4KJmd0OyBGaW5pc2ggRXJyb3JDb2RlICgweDAwMDAwMmMyKTxicj4KJmd0O8KgIMKg
IMKgIMKgRVJST1I6IEVzeXNfQ3JlYXRlKDB4MkMyKSAtIHRwbTpwYXJhbWV0ZXIoMik6aW5jb25z
aXN0ZW50IGF0dHJpYnV0ZXM8YnI+CiZndDvCoCDCoCDCoCDCoEVSUk9SOiBVbmFibGUgdG8gcnVu
IHRwbTJfY3JlYXRlPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4K
Jmd0OyA8YnI+CiZndDsgQWZ0ZXIgaGF2aW5nIHJlYWQgYWxsIHRoZSBNQU4gcGFnZXMgdHdpY2Us
IEkgc3RpbGwgaGF2ZSBubyBpZGVhIHdoYXQgaXMgZ29pbmcgb24gb3I8YnI+CiZndDsgd2hhdCBJ
IGRpZCB3cm9uZy4gTW9zdCBpZiBub3QgYWxsIG9mIHRob3NlIGNvbW1hbmRzIHdlcmUgbWVyZWx5
IGNvcHkvcGFzdGVkPGJyPgomZ3Q7IGZyb20gdGhlIE1BTiBwYWdlcyBhdCA8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLSIgcmVsPSJub3JlZmVycmVyIG5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90
cG0yLTwvYT48YnI+CiZndDsgdG9vbHMvdHJlZS9tYXN0ZXIvbWFuIC48YnI+CiZndDsgPGJyPgom
Z3Q7IDxicj4KJmd0OyBJJiMzOTttIHVzaW5nIGEgTGVub3ZvIFgxIENhcmJvbiAoM3JkIGdlbikg
d2l0aCBJbnRlbCBQVFQgZW5hYmxlZCwgc28gdGhlIHN5c3RlbTxicj4KJmd0OyBzZWVzIGEgVFBN
Mi4wIGRldmljZS4gSSBjYW4gcHJvdmlkZSBtb3JlIGluZm9ybWF0aW9uIGlmIG5lZWRlZC48YnI+
CiZndDsgSSB3b3VsZCBncmVhdGx5IGFwcHJlY2lhdGUgaWYgc29tZW9uZSBjb3VsZCBwcm92aWRl
IHNvbWUgZ3VpZGFuY2Ugb24gdGhpcyBpc3N1ZTs8YnI+CiZndDsgdGhlIFRQTSB3b3JsZCBiZWlu
ZyBmYXNjaW5hdGluZyBzbyBmYXIsIEkgd291bGRuJiMzOTt0IHdhbnQgdG8gYmUgc3R1Y2sgb24g
dGhhdDxicj4KJmd0OyBwcm9ibGVtLjxicj4KJmd0OyA8YnI+CiZndDsgVGhhbmtzIGluIGFkdmFu
Y2UgZm9yIHlvdXIgaGVscCw8YnI+CiZndDsgUmVnYXJkcyw8YnI+CiZndDsgPGJyPgomZ3Q7IDxi
cj4KJmd0OyBOaWNvbGFzPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxi
cj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7
IDxicj4KJmd0OyA8YnI+Cjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============0332667638555564785==--

