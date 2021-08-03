Content-Type: multipart/mixed; boundary="===============0638464349558528561=="
MIME-Version: 1.0
From: Joseph Lee (ZeronsoftN) <joseph at zeronsoftn.com>
Subject: [tpm2] How can I prevent MITM attacks for unsealing?
Date: Tue, 03 Aug 2021 14:02:18 +0000
Message-ID: <emf01f7daf-5ca7-4f42-8f83-d3525b1216b1@desktop-hihridj>
In-Reply-To: 1627944082.541093249@f20.my.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0638464349558528561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

From the previous messages, I learned how salted sessions exchange keys =

and are encrypted.

However, I have yet to get an idea to prevent MITM attacks.

I was able to get an salted session in the following way.

Sealing:
 > tpm2_startauthsession -S session.ctx
 > tpm2_policypcr -Q -S session.ctx -l sha256:0,2,4 -L pcrs.sha256.policy
 > tpm2_flushcontext session.ctx
 > tpm2_createprimary -C o -c tpm-primary.ctx
 > tpm2_startauthsession --hmac-session -c tpm-primary.ctx -S session.ctx
 > tpm2_create -g sha256 -u seal.pub -r seal.priv -i INPUT_KEY -C =

tpm-primary.ctx -S session.ctx -L pcrs.sha256.policy
 > tpm2_load -C tpm-primary.ctx -u seal.pub -r seal.priv -n seal.name -c =

tpm-seal.ctx
 > tpm2_evictcontrol -C o -c tpm-seal.ctx 0x81000002
 > tpm2_flushcontext session.ctx

Unsealing:
 > tpm2_startauthsession --policy-session -S session.ctx
 > tpm2_policypcr -S session.ctx -l sha256:0,2,4
 > tpm2_unseal -p session:session.ctx -c 0x81000002 -o OUTPUT_KEY
 > tpm2_flushcontext session.ctx

However, in my opinion, from the tpm2_startauthsession part of the =

unsealing process, an MITM attack is performed to establish a session =

between the attacker-PC and the TPM-attacker session is established so =

that the attacker will be able to obtain plaintext data for subsequent =

unsealing.


Thanks & Regards,
Joseph.

------ Previous Message ------
>
>>"Steven Clark" <davolfman(a)gmail.com> wrote on 08/02/2021 01:26:56 PM:
>>
>> > I think it may be an optional standard but my TPM has some certs
>> > permanently stored in nv-indices in the 0x1c0000x range that can be
>> > checked against the manufacturer cert.  I haven't learned how to
>> > leverage those into trusted parameter encryption keys yet but they
>> > should be able to verify there's a real TPM at the other end at the
>> > very least (and more if you learn to use them correctly).
>>
>>The EK certificates in NV are in theory optional, but every TPM
>>I have encountered has them.
>>
>>Checking the certificate against the manufacturer's CA is
>>a standard crypto library function.
>>
>>Once you have an authentic EK, create a salted session using
>>the EK.
>>
>>Once you have the salted session, set the encrypt and/or decrypt bit
>>when running the command.
>>
>>Underneath, there's some complicated crypto, but it's all
>>hidden from the application.
>>
>>
>>_______________________________________________
>>tpm2 mailing list -- tpm2(a)lists.01.org
>>To unsubscribe send an email to tpm2-leave(a)lists.01.org
>>%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>
>

--===============0638464349558528561==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PHN0eWxlIGlkPSJwZ3BfY3NzIiB0eXBlPSJ0ZXh0L2NzcyI+PCEtLS0tPjwv
c3R5bGU+PHN0eWxlIGlkPSJjc3Nfc3R5bGVzIiB0eXBlPSJ0ZXh0L2NzcyI+PCEtLWJsb2NrcXVv
dGUuY2l0ZSB7IG1hcmdpbi1sZWZ0OiA1cHg7IG1hcmdpbi1yaWdodDogMHB4OyBwYWRkaW5nLWxl
ZnQ6IDEwcHg7IHBhZGRpbmctcmlnaHQ6MHB4OyBib3JkZXItbGVmdDogMXB4IHNvbGlkICNjY2Nj
Y2MgfQpibG9ja3F1b3RlLmNpdGUyIHttYXJnaW4tbGVmdDogNXB4OyBtYXJnaW4tcmlnaHQ6IDBw
eDsgcGFkZGluZy1sZWZ0OiAxMHB4OyBwYWRkaW5nLXJpZ2h0OjBweDsgYm9yZGVyLWxlZnQ6IDFw
eCBzb2xpZCAjY2NjY2NjOyBtYXJnaW4tdG9wOiAzcHg7IHBhZGRpbmctdG9wOiAwcHg7IH0KYSBp
bWcgeyBib3JkZXI6IDBweDsgfQpsaVtzdHlsZT0ndGV4dC1hbGlnbjogY2VudGVyOyddLCBsaVtz
dHlsZT0ndGV4dC1hbGlnbjogY2VudGVyOyAnXSwgbGlbc3R5bGU9J3RleHQtYWxpZ246IHJpZ2h0
OyddLCBsaVtzdHlsZT0ndGV4dC1hbGlnbjogcmlnaHQ7ICddIHsgIGxpc3Qtc3R5bGUtcG9zaXRp
b246IGluc2lkZTt9CmJvZHkgeyBmb250LWZhbWlseTogU2Vnb2UgVUk7IGZvbnQtc2l6ZTogMTJw
dDsgICB9IApxdW90ZSB7IG1hcmdpbi1sZWZ0OiAxZW07IG1hcmdpbi1yaWdodDogMWVtOyBib3Jk
ZXItbGVmdDogNXB4ICNlYmViZWIgc29saWQ7IHBhZGRpbmctbGVmdDogMC4zZW07IH0tLT48L3N0
eWxlPjwvaGVhZD48Ym9keT48ZGl2PkhpLDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+RnJvbSB0
aGUgcHJldmlvdXMgbWVzc2FnZXMsIEkgbGVhcm5lZCBob3cgc2FsdGVkIHNlc3Npb25zIGV4Y2hh
bmdlIGtleXMgYW5kIGFyZSBlbmNyeXB0ZWQuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Ib3dl
dmVyLCBJIGhhdmUgeWV0IHRvIGdldCBhbiBpZGVhIHRvIHByZXZlbnQgTUlUTSBhdHRhY2tzLjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSB3YXMgYWJsZSB0byBnZXQgYW4gc2FsdGVkIHNlc3Np
b24gaW4gdGhlIGZvbGxvd2luZyB3YXkuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5TZWFsaW5n
OjwvZGl2PjxkaXY+Jmd0OyZuYnNwO3RwbTJfc3RhcnRhdXRoc2Vzc2lvbiAtUyBzZXNzaW9uLmN0
eAo8L2Rpdj48ZGl2PiZndDsmbmJzcDt0cG0yX3BvbGljeXBjciAtUSAtUyBzZXNzaW9uLmN0eCAt
bCBzaGEyNTY6MCwyLDQgLUwgcGNycy5zaGEyNTYucG9saWN5CjwvZGl2PjxkaXY+Jmd0OyZuYnNw
O3RwbTJfZmx1c2hjb250ZXh0IHNlc3Npb24uY3R4CjwvZGl2PjxkaXY+Jmd0OyZuYnNwO3RwbTJf
Y3JlYXRlcHJpbWFyeSAtQyBvIC1jIHRwbS1wcmltYXJ5LmN0eAo8L2Rpdj48ZGl2PiZndDsmbmJz
cDt0cG0yX3N0YXJ0YXV0aHNlc3Npb24gLS1obWFjLXNlc3Npb24gLWMgdHBtLXByaW1hcnkuY3R4
IC1TIHNlc3Npb24uY3R4CjwvZGl2PjxkaXY+Jmd0OyZuYnNwO3RwbTJfY3JlYXRlIC1nIHNoYTI1
NiAtdSBzZWFsLnB1YiAtciBzZWFsLnByaXYgLWkgSU5QVVRfS0VZIC1DIHRwbS1wcmltYXJ5LmN0
eCAtUyBzZXNzaW9uLmN0eCAtTCBwY3JzLnNoYTI1Ni5wb2xpY3kKPC9kaXY+PGRpdj4mZ3Q7Jm5i
c3A7dHBtMl9sb2FkIC1DIHRwbS1wcmltYXJ5LmN0eCAtdSBzZWFsLnB1YiAtciBzZWFsLnByaXYg
LW4gc2VhbC5uYW1lIC1jIHRwbS1zZWFsLmN0eAo8L2Rpdj48ZGl2PiZndDsmbmJzcDt0cG0yX2V2
aWN0Y29udHJvbCAtQyBvIC1jIHRwbS1zZWFsLmN0eCAweDgxMDAwMDAyCjwvZGl2PjxkaXY+Jmd0
OyZuYnNwO3RwbTJfZmx1c2hjb250ZXh0IHNlc3Npb24uY3R4PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5VbnNlYWxpbmc6PC9kaXY+PGRpdj4mZ3Q7Jm5ic3A7dHBtMl9zdGFydGF1dGhzZXNzaW9u
IC0tcG9saWN5LXNlc3Npb24gLVMgc2Vzc2lvbi5jdHgKPC9kaXY+PGRpdj4mZ3Q7Jm5ic3A7dHBt
Ml9wb2xpY3lwY3IgLVMgc2Vzc2lvbi5jdHggLWwgc2hhMjU2OjAsMiw0CjwvZGl2PjxkaXY+Jmd0
OyZuYnNwO3RwbTJfdW5zZWFsIC1wIHNlc3Npb246c2Vzc2lvbi5jdHggLWMgMHg4MTAwMDAwMiAt
byBPVVRQVVRfS0VZPC9kaXY+PGRpdj4mZ3Q7Jm5ic3A7dHBtMl9mbHVzaGNvbnRleHQgc2Vzc2lv
bi5jdHg8L2Rpdj4KPGRpdj48YnI+PC9kaXY+PGRpdj5Ib3dldmVyLCBpbiBteSBvcGluaW9uLCBm
cm9tIHRoZSB0cG0yX3N0YXJ0YXV0aHNlc3Npb24gcGFydCBvZiB0aGUgdW5zZWFsaW5nIHByb2Nl
c3MsIGFuIE1JVE0gYXR0YWNrIGlzIHBlcmZvcm1lZCB0byBlc3RhYmxpc2ggYSBzZXNzaW9uIGJl
dHdlZW4gdGhlIGF0dGFja2VyLVBDIGFuZCB0aGUgVFBNLWF0dGFja2VyIHNlc3Npb24gaXMgZXN0
YWJsaXNoZWQgc28gdGhhdCB0aGUgYXR0YWNrZXIgd2lsbCBiZSBhYmxlIHRvIG9idGFpbiBwbGFp
bnRleHQgZGF0YSBmb3Igc3Vic2VxdWVudCB1bnNlYWxpbmcuPC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MgJmFtcDsgUmVnYXJkcyw8L2Rpdj48ZGl2Pkpvc2Vw
aC48L2Rpdj48ZGl2Pjxicj48L2Rpdj4KPGRpdj4tLS0tLS0gUHJldmlvdXMgTWVzc2FnZSAtLS0t
LS08L2Rpdj48ZGl2IGlkPSJ4NzEzNjM4MWM1Y2Y0NDEyIj48YmxvY2txdW90ZSBjaXRlPSIxNjI3
OTQ0MDgyLjU0MTA5MzI0OUBmMjAubXkuY29tIiB0eXBlPSJjaXRlIiBjbGFzcz0iY2l0ZTIiPgo8
cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyIgZGlyPSJsdHIiPjwvcD48YmxvY2txdW90ZSBpZD0i
bWFpbC1hcHAtYXV0by1xdW90ZSIgY2l0ZT0iMTYyNzkzMDc0MjAwMDAwMDU2MDYiIHN0eWxlPSJi
b3JkZXItbGVmdDoxcHggc29saWQgI0ZDMkMzODsgbWFyZ2luOjBweCAwcHggMHB4IDEwcHg7IHBh
ZGRpbmc6MHB4IDBweCAwcHggMTBweDsiPgoJCgoKCiAgICAKCgoKCgoKCgoKCQoJCgoKCQoJCgkK
CQoJCgoJCgkKCgkKCQoKCgo8ZGl2IGNsYXNzPSJqcy1oZWxwZXIganMtcmVhZG1zZy1tc2ciPgoJ
CiAJPGRpdj4KCQkKCQkKCQkJPGRpdiBpZD0ic3R5bGVfMTYyNzkzMDc0MjAwMDAwMDU2MDZfQk9E
WSI+PGRpdiBjbGFzcz0iY2xfOTM4NjU2Ij48cD48dHQ+PGZvbnQgc2l6ZT0iMiI+IlN0ZXZlbiBD
bGFyayIgJmx0OzxhIGhyZWY9Im1haWx0bzpkYXZvbGZtYW5AZ21haWwuY29tIj5kYXZvbGZtYW5A
Z21haWwuY29tPC9hPiZndDsgd3JvdGUgb24gMDgvMDIvMjAyMSAwMToyNjo1NiBQTTo8YnI+PGJy
PiZndDsgSSB0aGluayBpdCBtYXkgYmUgYW4gb3B0aW9uYWwgc3RhbmRhcmQgYnV0IG15IFRQTSBo
YXMgc29tZSBjZXJ0cyA8YnI+Jmd0OyBwZXJtYW5lbnRseSBzdG9yZWQgaW4gbnYtaW5kaWNlcyBp
biB0aGUgMHgxYzAwMDB4IHJhbmdlIHRoYXQgY2FuIGJlIDxicj4mZ3Q7IGNoZWNrZWQgYWdhaW5z
dCB0aGUgbWFudWZhY3R1cmVyIGNlcnQuJm5ic3A7IEkgaGF2ZW4ndCZuYnNwO2xlYXJuZWQgaG93
IHRvIDxicj4mZ3Q7IGxldmVyYWdlIHRob3NlIGludG8gdHJ1c3RlZCBwYXJhbWV0ZXIgZW5jcnlw
dGlvbiBrZXlzIHlldCBidXQgdGhleSA8YnI+Jmd0OyBzaG91bGQgYmUgYWJsZSB0byB2ZXJpZnkg
dGhlcmUncyBhIHJlYWwgVFBNIGF0IHRoZSBvdGhlciBlbmQgYXQgdGhlIDxicj4mZ3Q7IHZlcnkg
bGVhc3QgKGFuZCBtb3JlIGlmIHlvdSBsZWFybiB0byB1c2UgdGhlbSBjb3JyZWN0bHkpLjwvZm9u
dD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+PGJyPlRoZSBFSyBjZXJ0aWZpY2F0ZXMgaW4g
TlYgYXJlIGluIHRoZW9yeSBvcHRpb25hbCwgYnV0IGV2ZXJ5IFRQTTwvZm9udD48L3R0Pjxicj48
dHQ+PGZvbnQgc2l6ZT0iMiI+SSBoYXZlIGVuY291bnRlcmVkIGhhcyB0aGVtLjwvZm9udD48L3R0
Pjxicj48YnI+PHR0Pjxmb250IHNpemU9IjIiPkNoZWNraW5nIHRoZSBjZXJ0aWZpY2F0ZSBhZ2Fp
bnN0IHRoZSBtYW51ZmFjdHVyZXIncyBDQSBpczwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6
ZT0iMiI+YSBzdGFuZGFyZCBjcnlwdG8gbGlicmFyeSBmdW5jdGlvbi48L2ZvbnQ+PC90dD48YnI+
PGJyPjx0dD48Zm9udCBzaXplPSIyIj5PbmNlIHlvdSBoYXZlIGFuIGF1dGhlbnRpYyBFSywgY3Jl
YXRlIGEgc2FsdGVkIHNlc3Npb24gdXNpbmc8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9
IjIiPnRoZSBFSy48L2ZvbnQ+PC90dD48YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5PbmNlIHlv
dSBoYXZlIHRoZSBzYWx0ZWQgc2Vzc2lvbiwgc2V0IHRoZSBlbmNyeXB0IGFuZC9vciBkZWNyeXB0
IGJpdDwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+d2hlbiBydW5uaW5nIHRoZSBj
b21tYW5kLjwvZm9udD48L3R0Pjxicj48YnI+PHR0Pjxmb250IHNpemU9IjIiPlVuZGVybmVhdGgs
IHRoZXJlJ3Mgc29tZSBjb21wbGljYXRlZCBjcnlwdG8sIGJ1dCBpdCdzIGFsbDwvZm9udD48L3R0
Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+aGlkZGVuIGZyb20gdGhlIGFwcGxpY2F0aW9uLjwvZm9u
dD48L3R0Pjxicj4KPGJyPgoKPC9wPjwvZGl2PjwvZGl2PgoJCQk8ZGl2Pl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgp0cG0yIG1haWxpbmcgbGlzdCAt
LSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEub3JnPC9h
Pjxicj4KVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBt
Mi1sZWF2ZUBsaXN0cy4wMS5vcmciPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4KJSh3
ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8L2Rpdj4K
CQkKCQkKCTwvZGl2PgoKCQo8L2Rpdj4KCgo8L2Jsb2NrcXVvdGU+CjxkaXY+PGJyPjxicj48YnI+
PGltZyBzcmM9Imh0dHBzOi8vbWFpbC56ZXJvbnNvZnRuLmNvbS9tdGh1bWJuYWlsLzRlNjQ1YjA1
LWY5NDgtNDA5MC04YTdkLWExMTk2ZjFmYWZiZS5wbmciIHN0eWxlPSJtYXgtaGVpZ2h0OiAzMnB4
Ij48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+CjxkaXY+PGJyPjxicj48YnI+PGltZyBzcmM9Imh0
dHBzOi8vbWFpbC56ZXJvbnNvZnRuLmNvbS9tdGh1bWJuYWlsLzEyY2YyOGYwLTZkM2EtNGU1Mi05
MTNkLWM1M2VkOGE4ZGNkNy5wbmciIHN0eWxlPSJtYXgtaGVpZ2h0OiAzMnB4Ij48L2Rpdj48L2Jv
ZHk+PC9odG1sPgo=

--===============0638464349558528561==--

