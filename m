Content-Type: multipart/mixed; boundary="===============6203035733861722559=="
MIME-Version: 1.0
From: joseph at zeronsoftn.com
Subject: [tpm2] Re: How can I prevent MITM attacks for unsealing?
Date: Mon, 10 Oct 2022 18:07:18 +0300
Message-ID: <1665414438.939708747@f10.my.com>
In-Reply-To: 3d12759fa0272161dceb21c01026e94d6560fe3b.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6203035733861722559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Here is the commands I tried:
https://gist.github.=C2=ADcom/jclab-joseph/d1d=C2=AD6d9bbbd32c0fe200cc77=C2=
=AD25bcf0d86
A session was estab=C2=ADlished via a seriali=C2=ADzed persistent handl=C2=
=ADe.
This seems to be ab=C2=ADle to prevent MITM in the session connection proce=
ss.
But, assume that an attacker can modify the filesystem.
If the primary.handle can be replaced with the attacker's key, the session =
will be successfully established.
And I suspect that plaintext can be exposed if unsealed through the session.
Wouldn't validation be needed between the connected session and seal.ctx? =
=ED=99=94=EC=9A=94=EC=9D=BC, 04 10=EC=9B=94 2022, 00:54=EC=98=A4=EC=A0=84 +=
09:00 =EB=B0=9C=EC=8B=A0 "Roberts, William C"  william.c.roberts(a)intel.co=
m :

>On Mon, 2022-10-03 at 18:01 +0300,  joseph(a)zeronsoftn.com wrote:
> Hello,
>
> Does anyone know about this issue?
>
> https://github.com/jc-lab/securekit/blob/466abe16bfe4f28ef86db6bc72649214=
ab2e4b51/pkg/securekit-disk/opt/securekit/sbin/disk-init#L82-L86
>
> Here's one example of sealing and unsealing.
> This method seems (probably?) to prevent the sniffing attack, which
> was a vulnerability of Bitlocker in the past.
>
> But isn't a MITM attack possible in the process of creating an
> encrypted session?
>So just to unpack the commands here for discussion I copied that code
>block:
>
>tpm2_createprimary -Q -C o -c tpm-primary.ctx
>tpm2_load -Q -C tpm-primary.ctx -u ${p1_dir}/seal.pub -r
>${p1_dir}/seal.priv -c tpm-seal.ctx
>tpm2_startauthsession -Q --hmac-session -c tpm-primary.ctx -S
>session.ctx
>tpm2_unseal -Q -p pcr:${tpm_seal_pcr_policy} -c tpm-seal.ctx -o
>${output}
>cleanupSession
>
>The issue here is that the key created by the tpm2_createprimary
>command doesn't have provenance, so it's just be trusted implicitly
>even through it could be attacker controlled. If the attacker was
>controlling the primary object, they could just forward the commands
>unencrypted to the TPM and get the unseal to release them the key in
>the clear.
>
>
> I am not familiar with the process of establishing a session,
> However, it seems that MITM can be prevented only by using a session
> key encrypted with the EK of the TPM, or by signing the asymmetric
> key with the EK to derive the key, when creating a session.
>
>You just need a way to ensure provenance. Another way is to load an
>established key to the TPM and start the authsession with that. If
>you're using a persistent key you need to verify the name after
>establishing the session or use something like a serialized ESYS_TR
>which will do the name checking automatically. If you load a key blob
>to the TPM that you control, ESAPI will have the checks in place to
>make sure you don't get duped.
>
>
> Is MITM not considered in TPM? Or is there another way?
>
>It is considered in the TPM and is discussed in the architecture
>document. Theirs a few ways you can securely set up an encrypted
>session, either with EK and associated Certificate or through other
>keys like the SRK. The big thing is, you have to do it in a way where
>the attacker can not MiTM the session establishment, which boils down
>to using a known key.
>
>
> Regards,
>
>
>
>
>
> _______________________________________________
> tpm2 mailing list --  tpm2(a)lists.01.org
> To unsubscribe send an email to  tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6203035733861722559==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PC9oZWFkPjxib2R5PjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IiBkaXI9
Imx0ciI+PGJyPgpIZXJlIGlzIHRoZSBjb21tYW5kcyBJIHRyaWVkOjxicj4KaHR0cHM6Ly9naXN0
LmdpdGh1Yi7CrWNvbS9qY2xhYi1qb3NlcGgvZDFkwq02ZDliYmJkMzJjMGZlMjAwY2M3N8KtMjVi
Y2YwZDg2PGJyPgpBIHNlc3Npb24gd2FzIGVzdGFiwq1saXNoZWQgdmlhIGEgc2VyaWFsacKtemVk
IHBlcnNpc3RlbnQgaGFuZGzCrWUuPGJyPgpUaGlzIHNlZW1zIHRvIGJlIGFiwq1sZSB0byBwcmV2
ZW50IE1JVE0gaW4gdGhlIHNlc3Npb24gY29ubmVjdGlvbiBwcm9jZXNzLjwvcD4KPHAgZGlyPSJs
dHIiPkJ1dCwgYXNzdW1lIHRoYXQgYW4gYXR0YWNrZXIgY2FuIG1vZGlmeSB0aGUgZmlsZXN5c3Rl
bS48YnI+CklmIHRoZSBwcmltYXJ5LmhhbmRsZSBjYW4gYmUgcmVwbGFjZWQgd2l0aCB0aGUgYXR0
YWNrZXIncyBrZXksIHRoZSBzZXNzaW9uIHdpbGwgYmUgc3VjY2Vzc2Z1bGx5IGVzdGFibGlzaGVk
Ljxicj4KQW5kIEkgc3VzcGVjdCB0aGF0IHBsYWludGV4dCBjYW4gYmUgZXhwb3NlZCBpZiB1bnNl
YWxlZCB0aHJvdWdoIHRoZSBzZXNzaW9uLjwvcD4KPHAgZGlyPSJsdHIiPldvdWxkbid0IHZhbGlk
YXRpb24gYmUgbmVlZGVkIGJldHdlZW4gdGhlIGNvbm5lY3RlZCBzZXNzaW9uIGFuZCBzZWFsLmN0
eD88L3A+Cu2ZlOyalOydvCwgMDQgMTDsm5QgMjAyMiwgMDA6NTTsmKTsoIQgKzA5OjAwIOuwnOyL
oCAiUm9iZXJ0cywgV2lsbGlhbSBDIiA8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNA
aW50ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Ojxicj48YnI+PGJsb2Nr
cXVvdGUgaWQ9Im1haWwtYXBwLWF1dG8tcXVvdGUiIGNpdGU9IjE2NjQ4MTI0NDgwMDAwMDEwODQx
IiBzdHlsZT0iYm9yZGVyLWxlZnQ6MXB4IHNvbGlkICNGQzJDMzg7IG1hcmdpbjowcHggMHB4IDBw
eCAxMHB4OyBwYWRkaW5nOjBweCAwcHggMHB4IDEwcHg7Ij4KCQoKCgogICAgCgoKCgoKCgoKCgkK
CQoKCgkKCQoJCgkKCQoKCQoJCgoJCgkKCgoKPGRpdiBjbGFzcz0ianMtaGVscGVyIGpzLXJlYWRt
c2ctbXNnIj4KCTxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PC9zdHlsZT4KIAk8ZGl2PgoJCTxiYXNl
IHRhcmdldD0iX3NlbGYiIGhyZWY9Imh0dHBzOi8vZS1hai5teS5jb20vIj4KCQkKCQkJPGRpdiBp
ZD0ic3R5bGVfMTY2NDgxMjQ0ODAwMDAwMTA4NDFfQk9EWSI+T24gTW9uLCAyMDIyLTEwLTAzIGF0
IDE4OjAxICswMzAwLCA8YSBocmVmPSJtYWlsdG86am9zZXBoQHplcm9uc29mdG4uY29tIj5qb3Nl
cGhAemVyb25zb2Z0bi5jb208L2E+IHdyb3RlOjxicj4KJmd0OyBIZWxsbyw8YnI+CiZndDsgPGJy
PgomZ3Q7IERvZXMgYW55b25lIGtub3cgYWJvdXQgdGhpcyBpc3N1ZT88YnI+CiZndDsgPGJyPgom
Z3Q7IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9qYy1sYWIvc2VjdXJla2l0L2Jsb2IvNDY2
YWJlMTZiZmU0ZjI4ZWY4NmRiNmJjNzI2NDkyMTRhYjJlNGI1MS9wa2cvc2VjdXJla2l0LWRpc2sv
b3B0L3NlY3VyZWtpdC9zYmluL2Rpc2staW5pdCNMODItTDg2IiB0YXJnZXQ9Il9ibGFuayI+aHR0
cHM6Ly9naXRodWIuY29tL2pjLWxhYi9zZWN1cmVraXQvYmxvYi80NjZhYmUxNmJmZTRmMjhlZjg2
ZGI2YmM3MjY0OTIxNGFiMmU0YjUxL3BrZy9zZWN1cmVraXQtZGlzay9vcHQvc2VjdXJla2l0L3Ni
aW4vZGlzay1pbml0I0w4Mi1MODY8L2E+PGJyPgomZ3Q7IDxicj4KJmd0OyBIZXJlJ3Mgb25lIGV4
YW1wbGUgb2Ygc2VhbGluZyBhbmQgdW5zZWFsaW5nLjxicj4KJmd0OyBUaGlzIG1ldGhvZCBzZWVt
cyAocHJvYmFibHk/KSB0byBwcmV2ZW50IHRoZSBzbmlmZmluZyBhdHRhY2ssIHdoaWNoPGJyPgom
Z3Q7IHdhcyBhIHZ1bG5lcmFiaWxpdHkgb2YgQml0bG9ja2VyIGluIHRoZSBwYXN0Ljxicj4KJmd0
OyA8YnI+CiZndDsgQnV0IGlzbid0IGEgTUlUTSBhdHRhY2sgcG9zc2libGUgaW4gdGhlIHByb2Nl
c3Mgb2YgY3JlYXRpbmcgYW48YnI+CiZndDsgZW5jcnlwdGVkIHNlc3Npb24/PGJyPgogICAgClNv
IGp1c3QgdG8gdW5wYWNrIHRoZSBjb21tYW5kcyBoZXJlIGZvciBkaXNjdXNzaW9uIEkgY29waWVk
IHRoYXQgY29kZTxicj4KYmxvY2s6PGJyPgo8YnI+CnRwbTJfY3JlYXRlcHJpbWFyeSAtUSAtQyBv
IC1jIHRwbS1wcmltYXJ5LmN0eDxicj4KdHBtMl9sb2FkIC1RIC1DIHRwbS1wcmltYXJ5LmN0eCAt
dSAke3AxX2Rpcn0vc2VhbC5wdWIgLXI8YnI+CiR7cDFfZGlyfS9zZWFsLnByaXYgLWMgdHBtLXNl
YWwuY3R4PGJyPgp0cG0yX3N0YXJ0YXV0aHNlc3Npb24gLVEgLS1obWFjLXNlc3Npb24gLWMgdHBt
LXByaW1hcnkuY3R4IC1TPGJyPgpzZXNzaW9uLmN0eDxicj4KdHBtMl91bnNlYWwgLVEgLXAgcGNy
OiR7dHBtX3NlYWxfcGNyX3BvbGljeX0gLWMgdHBtLXNlYWwuY3R4IC1vPGJyPgoke291dHB1dH08
YnI+CmNsZWFudXBTZXNzaW9uPGJyPgo8YnI+ClRoZSBpc3N1ZSBoZXJlIGlzIHRoYXQgdGhlIGtl
eSBjcmVhdGVkIGJ5IHRoZSB0cG0yX2NyZWF0ZXByaW1hcnk8YnI+CmNvbW1hbmQgZG9lc24ndCBo
YXZlIHByb3ZlbmFuY2UsIHNvIGl0J3MganVzdCBiZSB0cnVzdGVkIGltcGxpY2l0bHk8YnI+CmV2
ZW4gdGhyb3VnaCBpdCBjb3VsZCBiZSBhdHRhY2tlciBjb250cm9sbGVkLiBJZiB0aGUgYXR0YWNr
ZXIgd2FzPGJyPgpjb250cm9sbGluZyB0aGUgcHJpbWFyeSBvYmplY3QsIHRoZXkgY291bGQganVz
dCBmb3J3YXJkIHRoZSBjb21tYW5kczxicj4KdW5lbmNyeXB0ZWQgdG8gdGhlIFRQTSBhbmQgZ2V0
IHRoZSB1bnNlYWwgdG8gcmVsZWFzZSB0aGVtIHRoZSBrZXkgaW48YnI+CnRoZSBjbGVhci48YnI+
Cjxicj4KJmd0OyA8YnI+CiZndDsgSSBhbSBub3QgZmFtaWxpYXIgd2l0aCB0aGUgcHJvY2VzcyBv
ZiBlc3RhYmxpc2hpbmcgYSBzZXNzaW9uLDxicj4KJmd0OyBIb3dldmVyLCBpdCBzZWVtcyB0aGF0
IE1JVE0gY2FuIGJlIHByZXZlbnRlZCBvbmx5IGJ5IHVzaW5nIGEgc2Vzc2lvbjxicj4KJmd0OyBr
ZXkgZW5jcnlwdGVkIHdpdGggdGhlIEVLIG9mIHRoZSBUUE0sIG9yIGJ5IHNpZ25pbmcgdGhlIGFz
eW1tZXRyaWM8YnI+CiZndDsga2V5IHdpdGggdGhlIEVLIHRvIGRlcml2ZSB0aGUga2V5LCB3aGVu
IGNyZWF0aW5nIGEgc2Vzc2lvbi48YnI+Cjxicj4KWW91IGp1c3QgbmVlZCBhIHdheSB0byBlbnN1
cmUgcHJvdmVuYW5jZS4gQW5vdGhlciB3YXkgaXMgdG8gbG9hZCBhbjxicj4KZXN0YWJsaXNoZWQg
a2V5IHRvIHRoZSBUUE0gYW5kIHN0YXJ0IHRoZSBhdXRoc2Vzc2lvbiB3aXRoIHRoYXQuIElmPGJy
Pgp5b3UncmUgdXNpbmcgYSBwZXJzaXN0ZW50IGtleSB5b3UgbmVlZCB0byB2ZXJpZnkgdGhlIG5h
bWUgYWZ0ZXI8YnI+CmVzdGFibGlzaGluZyB0aGUgc2Vzc2lvbiBvciB1c2Ugc29tZXRoaW5nIGxp
a2UgYSBzZXJpYWxpemVkIEVTWVNfVFI8YnI+CndoaWNoIHdpbGwgZG8gdGhlIG5hbWUgY2hlY2tp
bmcgYXV0b21hdGljYWxseS4gSWYgeW91IGxvYWQgYSBrZXkgYmxvYjxicj4KdG8gdGhlIFRQTSB0
aGF0IHlvdSBjb250cm9sLCBFU0FQSSB3aWxsIGhhdmUgdGhlIGNoZWNrcyBpbiBwbGFjZSB0bzxi
cj4KbWFrZSBzdXJlIHlvdSBkb24ndCBnZXQgZHVwZWQuPGJyPgo8YnI+CiZndDsgPGJyPgomZ3Q7
IElzIE1JVE0gbm90IGNvbnNpZGVyZWQgaW4gVFBNPyBPciBpcyB0aGVyZSBhbm90aGVyIHdheT88
YnI+Cjxicj4KSXQgaXMgY29uc2lkZXJlZCBpbiB0aGUgVFBNIGFuZCBpcyBkaXNjdXNzZWQgaW4g
dGhlIGFyY2hpdGVjdHVyZTxicj4KZG9jdW1lbnQuIFRoZWlycyBhIGZldyB3YXlzIHlvdSBjYW4g
c2VjdXJlbHkgc2V0IHVwIGFuIGVuY3J5cHRlZDxicj4Kc2Vzc2lvbiwgZWl0aGVyIHdpdGggRUsg
YW5kIGFzc29jaWF0ZWQgQ2VydGlmaWNhdGUgb3IgdGhyb3VnaCBvdGhlcjxicj4Ka2V5cyBsaWtl
IHRoZSBTUksuIFRoZSBiaWcgdGhpbmcgaXMsIHlvdSBoYXZlIHRvIGRvIGl0IGluIGEgd2F5IHdo
ZXJlPGJyPgp0aGUgYXR0YWNrZXIgY2FuIG5vdCBNaVRNIHRoZSBzZXNzaW9uIGVzdGFibGlzaG1l
bnQsIHdoaWNoIGJvaWxzIGRvd248YnI+CnRvIHVzaW5nIGEga25vd24ga2V5Ljxicj4KPGJyPgom
Z3Q7IDxicj4KJmd0OyBSZWdhcmRzLDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4K
Jmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fPGJyPgomZ3Q7IHRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFRv
IHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVA
bGlzdHMuMDEub3JnIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgJSh3ZWJf
cGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+CjwvZGl2
PgoJCQkKCQkKCQk8YmFzZSB0YXJnZXQ9Il9zZWxmIiBocmVmPSJodHRwczovL2UtYWoubXkuY29t
LyI+Cgk8L2Rpdj4KCgkKPC9kaXY+CgoKPC9ibG9ja3F1b3RlPgo8ZGl2Pjxicj48YnI+PGJyPjxp
bWcgc3JjPSJodHRwczovL21haWwuemVyb25zb2Z0bi5jb20vbXRodW1ibmFpbC8yMDQ3ZjVjNC0z
ZjVhLTQzN2YtOGYxNC01MDEyYmY0YmNiNGYucG5nIiBzdHlsZT0ibWF4LWhlaWdodDogMzJweCI+
PC9kaXY+PC9ib2R5PjwvaHRtbD4=
--===============6203035733861722559==--

