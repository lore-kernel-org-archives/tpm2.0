Content-Type: multipart/mixed; boundary="===============1434377242055382425=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] Problem with tpm2_unseal after reboot
Date: Mon, 10 Dec 2018 23:18:16 +0100
Message-ID: <CAFOAJEfH7FpbTp+k+nxd84d0ScVGYJqb5krqHoh+oL=o37MOLw@mail.gmail.com>
In-Reply-To: 20A6FE0AC912764FB8B5BC5A1A7CB92B2FA007D2@fmsmsx101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1434377242055382425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I don=E2=80=99t have access to a machine with a TPM2 now but I=E2=80=99ll t=
est it tomorro.

I think Bill is right here though and the problem is that the primary key
isn=E2=80=99t present in the TPM2.

Could you please execute the tpm2_primary command after the reboot? The
primary keys are generated using a key derivation function that=E2=80=99s
deterministic using the hierarchy seed so the PK should be the same.

Best regards,
Javier

On Mon, 10 Dec 2018 at 22:37, Oliver, Dario N <dario.n.oliver(a)intel.com>
wrote:

> The only persistent object I see with tpm2_listpersistent is the child
> object. So I think the parent is not being persisted.
>
> I am trying again the same set of commands in a NUC device, just to see if
> the problem is not the device itself. After that, I will try you approach
> and persist the primary object as well. Hope that works
>
> It is possible that our approach to persist the secret is wrong. in that
> case, do you have some docs showing a sealing process that is expected to
> work with pcr policies with the versions I am using?
>
> Thank you!
>
> -----Original Message-----
> From: Roberts, William C
> Sent: Monday, December 10, 2018 1:31 PM
> To: Oliver, Dario N <dario.n.oliver(a)intel.com>; tpm2(a)lists.01.org
> Subject: RE: Problem with tpm2_unseal after reboot
>
> Oliver,
>
> I wonder if this some weird side-effect. I have never had a persistent
> object under a non-persistent object, does this cause the primary object =
to
> persist as well? I wonder how you could persist a child object when the
> primary parent object is unloaded since the primary object seed protects
> it's children.
>
> What happens if you persist the primary object as well?
>
> Bill
>
>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Oliver,
> > Dario N
> > Sent: Friday, December 7, 2018 2:36 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] Problem with tpm2_unseal after reboot
> >
> > Hello!
> >
> >
> >
> > I am currently having problems to unseal a secret from the tpm.
> >
> > I hope that you can detect the issue in my instructions below :)
> >
> >
> >
> > The versions that I am using are the following:
> >
> > 1.       Tpm2-tss 2.0.0
> >
> > 2.       Tpm2-abrmd 2.0.0
> >
> > 3.       Tpm2-tools 3.1.0
> >
> >
> >
> > The platform I am using is a Compulab Fitlet2 device (Intel Atom
> > x5-E3950 Apollo Lake), with Fedora 28 and Linux kernel 4.19.x.
> >
> > In this case, the device support firmware tpm, and it is enabled in
> > the BIOS
> > (fTPM)
> >
> >
> >
> > So, after installing the tpm2 stack from github releases, I am sealing
> > a secret with the following commands:
> >
> >
> >
> > # Create a random secret to be saved in the TPM
> >
> > tpm2_getrandom 32 --output key.bin
> >
> >
> >
> > # I use a pcr policy on sha1 banks 0 and 1, this gets the pcr state
> >
> > tpm2_pcrlist --sel-list sha1:0,1 --output pcr_state.bin
> >
> >
> >
> > # Create a policy with those PCR
> >
> > tpm2_createpolicy --policy-pcr --set-list sha1:0,1 \
> >
> >                   --pcr-input-file pcr_state.bin
> >
> >                   --policy-file policy.bin
> >
> >
> >
> > # Create a primary object with endorsement hierarchy
> >
> > tpm2_createprimary --hierarchy e --halg sha1 --kalg rsa --context
> > primary.context
> >
> >
> >
> > # Create an object to be loaded in the TPM
> >
> > tpm2_create --halg sha256 --kalg keyedhash --pubfile key.pub
> > --privfile key.priv \
> >
> >             --context-parent primary.context --policy-file policy.bin
> > \
> >
> >            --object-attributes
> > "fixedtpm|fixedparent|noda|adminwithpolicy" --in-file key.bin
> >
> >
> >
> > # Load the object in the TPM
> >
> > tpm2_load --context-parent primary.context --pubfile key.pub
> > --privfile key.priv \
> >
> >           --context load.context
> >
> >
> >
> > # Persist the object in the TPM
> >
> > tpm2_evictcontrol --auth o --context load.context --persistent
> > 0x81010002
> >
> >
> >
> > # Check if the object is persisted, looks good
> >
> > tpm2_listpersistent
> >
> > persistent-handle[0]:0x81010002 key-alg:keyedhash hash-alg:sha256
> > object- attr:fixedtpm|fixedparent|noda|adminwithpolicy
> >
> >
> >
> > # Unseal the object, works!
> >
> > tpm2_unseal --item 0x81010002 --set-list sha1:0,1 > compare_key.bin
> >
> >
> >
> > # Compare original and unsealed objects, the match :)
> >
> > diff compare_key.bin key.bin
> >
> >
> >
> > ##############
> >
> > # After this initial setup, I reboot the device, and try to unseal the
> > secret again
> >
> > ##############
> >
> >
> >
> > # After reboot, open a terminal an do
> >
> > tpm2_unseal --item 0x81010002 --set-list sha1:0,1 >
> > compare_disk_key.bin
> >
> > ERROR: Sys_Unseal failed. Error Code: 0x99d
> >
> > ERROR: Unseal failed!
> >
> > ERROR: Unable to run tpm2_unseal
> >
> >
> >
> > # Use tpm2_rc_decode to decode the error message 0x99d, it is a policy
> > check error!
> >
> > tpm2_rc_decode 0x99d
> >
> > error layer
> >
> >     hex: 0x0
> >
> >     identifier: TSS2_TPM_RC_LAYER
> >
> >     description: Error produced by the TPM
> >
> > format 1 error code
> >
> >     hex: 0x1d
> >
> >     identifier: TPM2_RC_POLICY_FAIL
> >
> >     description: a policy check failed
> >
> > session
> >
> >     hex: 0x100
> >
> >     identifier: TPM2_RC_1
> >
> >     description: (null)
> >
> >
> >
> > ###############
> >
> > # I checked the PCR 0,1, and they have the same values as at the
> > moment to seal the object.
> >
> > # So I don't understand why I am having a "TPM2_RC_POLICY_FAIL" error.
> >
> > # I tried the same process several times, and each time I end up in
> > the same error state.
> >
> > ###############
> >
> >
> >
> > Is there something I am missing here?
> >
> > Is something additional I need to do to satisfy the policy to unseal the
> data?
> >
> > Any help is appreciated!
> >
> >
> >
> > Thank you in advance.
> >
> >
> >
> >
> >
> >
>
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
>

--===============1434377242055382425==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdj48ZGl2IGRpcj0iYXV0byI+SGVsbG8sPC9kaXY+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxi
cj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+SSBkb27igJl0IGhhdmUgYWNjZXNzIHRvIGEgbWFjaGlu
ZSB3aXRoIGEgVFBNMiBub3cgYnV0IEnigJlsbCB0ZXN0IGl0IHRvbW9ycm8uPC9kaXY+PGRpdiBk
aXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+SSB0aGluayBCaWxsIGlzIHJpZ2h0
IGhlcmUgdGhvdWdoIGFuZCB0aGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBwcmltYXJ5IGtleSBpc27i
gJl0IHByZXNlbnQgaW4gdGhlIFRQTTIuPC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48
ZGl2IGRpcj0iYXV0byI+Q291bGQgeW91IHBsZWFzZSBleGVjdXRlIHRoZSB0cG0yX3ByaW1hcnkg
Y29tbWFuZCBhZnRlciB0aGUgcmVib290PyBUaGUgcHJpbWFyeSBrZXlzIGFyZSBnZW5lcmF0ZWQg
dXNpbmcgYSBrZXkgZGVyaXZhdGlvbiBmdW5jdGlvbiB0aGF04oCZcyBkZXRlcm1pbmlzdGljIHVz
aW5nIHRoZSBoaWVyYXJjaHkgc2VlZCBzbyB0aGUgUEsgc2hvdWxkIGJlIHRoZSBzYW1lLjwvZGl2
PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPkJlc3QgcmVnYXJkcyw8
L2Rpdj48ZGl2IGRpcj0iYXV0byI+SmF2aWVyPC9kaXY+PGRpdj48YnI+PGRpdiBjbGFzcz0iZ21h
aWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiPk9uIE1vbiwgMTAgRGVjIDIwMTggYXQgMjI6MzcsIE9s
aXZlciwgRGFyaW8gTiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRhcmlvLm4ub2xpdmVyQGludGVsLmNv
bSI+ZGFyaW8ubi5vbGl2ZXJAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9j
a3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRl
ci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPlRoZSBvbmx5IHBlcnNpc3Rl
bnQgb2JqZWN0IEkgc2VlIHdpdGggdHBtMl9saXN0cGVyc2lzdGVudCBpcyB0aGUgY2hpbGQgb2Jq
ZWN0LiBTbyBJIHRoaW5rIHRoZSBwYXJlbnQgaXMgbm90IGJlaW5nIHBlcnNpc3RlZC4gPGJyPgo8
YnI+CkkgYW0gdHJ5aW5nIGFnYWluIHRoZSBzYW1lIHNldCBvZiBjb21tYW5kcyBpbiBhIE5VQyBk
ZXZpY2UsIGp1c3QgdG8gc2VlIGlmIHRoZSBwcm9ibGVtIGlzIG5vdCB0aGUgZGV2aWNlIGl0c2Vs
Zi4gQWZ0ZXIgdGhhdCwgSSB3aWxsIHRyeSB5b3UgYXBwcm9hY2ggYW5kIHBlcnNpc3QgdGhlIHBy
aW1hcnkgb2JqZWN0IGFzIHdlbGwuIEhvcGUgdGhhdCB3b3Jrczxicj4KPGJyPgpJdCBpcyBwb3Nz
aWJsZSB0aGF0IG91ciBhcHByb2FjaCB0byBwZXJzaXN0IHRoZSBzZWNyZXQgaXMgd3JvbmcuIGlu
IHRoYXQgY2FzZSwgZG8geW91IGhhdmUgc29tZSBkb2NzIHNob3dpbmcgYSBzZWFsaW5nIHByb2Nl
c3MgdGhhdCBpcyBleHBlY3RlZCB0byB3b3JrIHdpdGggcGNyIHBvbGljaWVzIHdpdGggdGhlIHZl
cnNpb25zIEkgYW0gdXNpbmc/IDxicj4KPGJyPgpUaGFuayB5b3UhPGJyPgo8YnI+Ci0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tPGJyPgpGcm9tOiBSb2JlcnRzLCBXaWxsaWFtIEMgPGJyPgpTZW50
OiBNb25kYXksIERlY2VtYmVyIDEwLCAyMDE4IDE6MzEgUE08YnI+ClRvOiBPbGl2ZXIsIERhcmlv
IE4gJmx0OzxhIGhyZWY9Im1haWx0bzpkYXJpby5uLm9saXZlckBpbnRlbC5jb20iIHRhcmdldD0i
X2JsYW5rIj5kYXJpby5uLm9saXZlckBpbnRlbC5jb208L2E+Jmd0OzsgPGEgaHJlZj0ibWFpbHRv
OnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+
PGJyPgpTdWJqZWN0OiBSRTogUHJvYmxlbSB3aXRoIHRwbTJfdW5zZWFsIGFmdGVyIHJlYm9vdDxi
cj4KPGJyPgpPbGl2ZXIsPGJyPgo8YnI+Ckkgd29uZGVyIGlmIHRoaXMgc29tZSB3ZWlyZCBzaWRl
LWVmZmVjdC4gSSBoYXZlIG5ldmVyIGhhZCBhIHBlcnNpc3RlbnQgb2JqZWN0IHVuZGVyIGEgbm9u
LXBlcnNpc3RlbnQgb2JqZWN0LCBkb2VzIHRoaXMgY2F1c2UgdGhlIHByaW1hcnkgb2JqZWN0IHRv
IHBlcnNpc3QgYXMgd2VsbD8gSSB3b25kZXIgaG93IHlvdSBjb3VsZCBwZXJzaXN0IGEgY2hpbGQg
b2JqZWN0IHdoZW4gdGhlIHByaW1hcnkgcGFyZW50IG9iamVjdCBpcyB1bmxvYWRlZCBzaW5jZSB0
aGUgcHJpbWFyeSBvYmplY3Qgc2VlZCBwcm90ZWN0cyBpdCYjMzk7cyBjaGlsZHJlbi48YnI+Cjxi
cj4KV2hhdCBoYXBwZW5zIGlmIHlvdSBwZXJzaXN0IHRoZSBwcmltYXJ5IG9iamVjdCBhcyB3ZWxs
Pzxicj4KPGJyPgpCaWxsPGJyPgo8YnI+Cjxicj4KJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLTxicj4KJmd0OyBGcm9tOiB0cG0yIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItYm91
bmNlc0BsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWJvdW5jZXNAbGlzdHMuMDEu
b3JnPC9hPl0gT24gQmVoYWxmIE9mIE9saXZlciwgPGJyPgomZ3Q7IERhcmlvIE48YnI+CiZndDsg
U2VudDogRnJpZGF5LCBEZWNlbWJlciA3LCAyMDE4IDI6MzYgUE08YnI+CiZndDsgVG86IDxhIGhy
ZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMu
MDEub3JnPC9hPjxicj4KJmd0OyBTdWJqZWN0OiBbdHBtMl0gUHJvYmxlbSB3aXRoIHRwbTJfdW5z
ZWFsIGFmdGVyIHJlYm9vdDxicj4KJmd0OyA8YnI+CiZndDsgSGVsbG8hPGJyPgomZ3Q7IDxicj4K
Jmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IEkgYW0gY3VycmVudGx5IGhhdmluZyBwcm9ibGVtcyB0
byB1bnNlYWwgYSBzZWNyZXQgZnJvbSB0aGUgdHBtLjxicj4KJmd0OyA8YnI+CiZndDsgSSBob3Bl
IHRoYXQgeW91IGNhbiBkZXRlY3QgdGhlIGlzc3VlIGluIG15IGluc3RydWN0aW9ucyBiZWxvdyA6
KTxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBUaGUgdmVyc2lvbnMgdGhh
dCBJIGFtIHVzaW5nIGFyZSB0aGUgZm9sbG93aW5nOjxicj4KJmd0OyA8YnI+CiZndDsgMS7CoCDC
oCDCoCDCoFRwbTItdHNzIDIuMC4wPGJyPgomZ3Q7IDxicj4KJmd0OyAyLsKgIMKgIMKgIMKgVHBt
Mi1hYnJtZCAyLjAuMDxicj4KJmd0OyA8YnI+CiZndDsgMy7CoCDCoCDCoCDCoFRwbTItdG9vbHMg
My4xLjA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgVGhlIHBsYXRmb3Jt
IEkgYW0gdXNpbmcgaXMgYSBDb21wdWxhYiBGaXRsZXQyIGRldmljZSAoSW50ZWwgQXRvbcKgIDxi
cj4KJmd0OyB4NS1FMzk1MCBBcG9sbG8gTGFrZSksIHdpdGggRmVkb3JhIDI4IGFuZCBMaW51eCBr
ZXJuZWwgNC4xOS54Ljxicj4KJmd0OyA8YnI+CiZndDsgSW4gdGhpcyBjYXNlLCB0aGUgZGV2aWNl
IHN1cHBvcnQgZmlybXdhcmUgdHBtLCBhbmQgaXQgaXMgZW5hYmxlZCBpbiA8YnI+CiZndDsgdGhl
IEJJT1M8YnI+CiZndDsgKGZUUE0pPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgom
Z3Q7IFNvLCBhZnRlciBpbnN0YWxsaW5nIHRoZSB0cG0yIHN0YWNrIGZyb20gZ2l0aHViIHJlbGVh
c2VzLCBJIGFtIHNlYWxpbmcgPGJyPgomZ3Q7IGEgc2VjcmV0IHdpdGggdGhlIGZvbGxvd2luZyBj
b21tYW5kczo8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgIyBDcmVhdGUg
YSByYW5kb20gc2VjcmV0IHRvIGJlIHNhdmVkIGluIHRoZSBUUE08YnI+CiZndDsgPGJyPgomZ3Q7
IHRwbTJfZ2V0cmFuZG9tIDMyIC0tb3V0cHV0IGtleS5iaW48YnI+CiZndDsgPGJyPgomZ3Q7IDxi
cj4KJmd0OyA8YnI+CiZndDsgIyBJIHVzZSBhIHBjciBwb2xpY3kgb24gc2hhMSBiYW5rcyAwIGFu
ZCAxLCB0aGlzIGdldHMgdGhlIHBjciBzdGF0ZTxicj4KJmd0OyA8YnI+CiZndDsgdHBtMl9wY3Js
aXN0IC0tc2VsLWxpc3Qgc2hhMTowLDEgLS1vdXRwdXQgcGNyX3N0YXRlLmJpbjxicj4KJmd0OyA8
YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyAjIENyZWF0ZSBhIHBvbGljeSB3aXRoIHRob3Nl
IFBDUjxicj4KJmd0OyA8YnI+CiZndDsgdHBtMl9jcmVhdGVwb2xpY3kgLS1wb2xpY3ktcGNyIC0t
c2V0LWxpc3Qgc2hhMTowLDEgXDxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoC0tcGNyLWlucHV0LWZpbGUgcGNyX3N0YXRlLmJpbjxicj4KJmd0OyA8YnI+CiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC0tcG9saWN5LWZpbGUgcG9saWN5LmJpbjxi
cj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyAjIENyZWF0ZSBhIHByaW1hcnkg
b2JqZWN0IHdpdGggZW5kb3JzZW1lbnQgaGllcmFyY2h5PGJyPgomZ3Q7IDxicj4KJmd0OyB0cG0y
X2NyZWF0ZXByaW1hcnkgLS1oaWVyYXJjaHkgZSAtLWhhbGcgc2hhMSAtLWthbGcgcnNhIC0tY29u
dGV4dCA8YnI+CiZndDsgcHJpbWFyeS5jb250ZXh0PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZn
dDsgPGJyPgomZ3Q7ICMgQ3JlYXRlIGFuIG9iamVjdCB0byBiZSBsb2FkZWQgaW4gdGhlIFRQTTxi
cj4KJmd0OyA8YnI+CiZndDsgdHBtMl9jcmVhdGUgLS1oYWxnIHNoYTI1NiAtLWthbGcga2V5ZWRo
YXNoIC0tcHViZmlsZSBrZXkucHViIDxicj4KJmd0OyAtLXByaXZmaWxlIGtleS5wcml2IFw8YnI+
CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAtLWNvbnRleHQtcGFyZW50IHByaW1h
cnkuY29udGV4dCAtLXBvbGljeS1maWxlIHBvbGljeS5iaW4gPGJyPgomZ3Q7IFw8YnI+CiZndDsg
PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgLS1vYmplY3QtYXR0cmlidXRlcyA8YnI+CiZndDsg
JnF1b3Q7Zml4ZWR0cG18Zml4ZWRwYXJlbnR8bm9kYXxhZG1pbndpdGhwb2xpY3kmcXVvdDsgLS1p
bi1maWxlIGtleS5iaW48YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgIyBM
b2FkIHRoZSBvYmplY3QgaW4gdGhlIFRQTTxicj4KJmd0OyA8YnI+CiZndDsgdHBtMl9sb2FkIC0t
Y29udGV4dC1wYXJlbnQgcHJpbWFyeS5jb250ZXh0IC0tcHViZmlsZSBrZXkucHViIDxicj4KJmd0
OyAtLXByaXZmaWxlIGtleS5wcml2IFw8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAtLWNvbnRleHQgbG9hZC5jb250ZXh0PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJy
PgomZ3Q7ICMgUGVyc2lzdCB0aGUgb2JqZWN0IGluIHRoZSBUUE08YnI+CiZndDsgPGJyPgomZ3Q7
IHRwbTJfZXZpY3Rjb250cm9sIC0tYXV0aCBvIC0tY29udGV4dCBsb2FkLmNvbnRleHQgLS1wZXJz
aXN0ZW50IDxicj4KJmd0OyAweDgxMDEwMDAyPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsg
PGJyPgomZ3Q7ICMgQ2hlY2sgaWYgdGhlIG9iamVjdCBpcyBwZXJzaXN0ZWQsIGxvb2tzIGdvb2Q8
YnI+CiZndDsgPGJyPgomZ3Q7IHRwbTJfbGlzdHBlcnNpc3RlbnQ8YnI+CiZndDsgPGJyPgomZ3Q7
IHBlcnNpc3RlbnQtaGFuZGxlWzBdOjB4ODEwMTAwMDIga2V5LWFsZzprZXllZGhhc2ggaGFzaC1h
bGc6c2hhMjU2IDxicj4KJmd0OyBvYmplY3QtIGF0dHI6Zml4ZWR0cG18Zml4ZWRwYXJlbnR8bm9k
YXxhZG1pbndpdGhwb2xpY3k8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsg
IyBVbnNlYWwgdGhlIG9iamVjdCwgd29ya3MhPGJyPgomZ3Q7IDxicj4KJmd0OyB0cG0yX3Vuc2Vh
bCAtLWl0ZW0gMHg4MTAxMDAwMiAtLXNldC1saXN0IHNoYTE6MCwxICZndDsgY29tcGFyZV9rZXku
YmluPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7ICMgQ29tcGFyZSBvcmln
aW5hbCBhbmQgdW5zZWFsZWQgb2JqZWN0cywgdGhlIG1hdGNoIDopPGJyPgomZ3Q7IDxicj4KJmd0
OyBkaWZmIGNvbXBhcmVfa2V5LmJpbiBrZXkuYmluPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZn
dDsgPGJyPgomZ3Q7ICMjIyMjIyMjIyMjIyMjPGJyPgomZ3Q7IDxicj4KJmd0OyAjIEFmdGVyIHRo
aXMgaW5pdGlhbCBzZXR1cCwgSSByZWJvb3QgdGhlIGRldmljZSwgYW5kIHRyeSB0byB1bnNlYWwg
dGhlIDxicj4KJmd0OyBzZWNyZXQgYWdhaW48YnI+CiZndDsgPGJyPgomZ3Q7ICMjIyMjIyMjIyMj
IyMjPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7ICMgQWZ0ZXIgcmVib290
LCBvcGVuIGEgdGVybWluYWwgYW4gZG88YnI+CiZndDsgPGJyPgomZ3Q7IHRwbTJfdW5zZWFsIC0t
aXRlbSAweDgxMDEwMDAyIC0tc2V0LWxpc3Qgc2hhMTowLDEgJmd0OyA8YnI+CiZndDsgY29tcGFy
ZV9kaXNrX2tleS5iaW48YnI+CiZndDsgPGJyPgomZ3Q7IEVSUk9SOiBTeXNfVW5zZWFsIGZhaWxl
ZC4gRXJyb3IgQ29kZTogMHg5OWQ8YnI+CiZndDsgPGJyPgomZ3Q7IEVSUk9SOiBVbnNlYWwgZmFp
bGVkITxicj4KJmd0OyA8YnI+CiZndDsgRVJST1I6IFVuYWJsZSB0byBydW4gdHBtMl91bnNlYWw8
YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgIyBVc2UgdHBtMl9yY19kZWNv
ZGUgdG8gZGVjb2RlIHRoZSBlcnJvciBtZXNzYWdlIDB4OTlkLCBpdCBpcyBhIHBvbGljeSA8YnI+
CiZndDsgY2hlY2sgZXJyb3IhPGJyPgomZ3Q7IDxicj4KJmd0OyB0cG0yX3JjX2RlY29kZSAweDk5
ZDxicj4KJmd0OyA8YnI+CiZndDsgZXJyb3IgbGF5ZXI8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAg
wqBoZXg6IDB4MDxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoGlkZW50aWZpZXI6IFRTUzJfVFBN
X1JDX0xBWUVSPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgZGVzY3JpcHRpb246IEVycm9yIHBy
b2R1Y2VkIGJ5IHRoZSBUUE08YnI+CiZndDsgPGJyPgomZ3Q7IGZvcm1hdCAxIGVycm9yIGNvZGU8
YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqBoZXg6IDB4MWQ8YnI+CiZndDsgPGJyPgomZ3Q7wqAg
wqAgwqBpZGVudGlmaWVyOiBUUE0yX1JDX1BPTElDWV9GQUlMPGJyPgomZ3Q7IDxicj4KJmd0O8Kg
IMKgIMKgZGVzY3JpcHRpb246IGEgcG9saWN5IGNoZWNrIGZhaWxlZDxicj4KJmd0OyA8YnI+CiZn
dDsgc2Vzc2lvbjxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoGhleDogMHgxMDA8YnI+CiZndDsg
PGJyPgomZ3Q7wqAgwqAgwqBpZGVudGlmaWVyOiBUUE0yX1JDXzE8YnI+CiZndDsgPGJyPgomZ3Q7
wqAgwqAgwqBkZXNjcmlwdGlvbjogKG51bGwpPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsg
PGJyPgomZ3Q7ICMjIyMjIyMjIyMjIyMjIzxicj4KJmd0OyA8YnI+CiZndDsgIyBJIGNoZWNrZWQg
dGhlIFBDUiAwLDEsIGFuZCB0aGV5IGhhdmUgdGhlIHNhbWUgdmFsdWVzIGFzIGF0IHRoZSA8YnI+
CiZndDsgbW9tZW50IHRvIHNlYWwgdGhlIG9iamVjdC48YnI+CiZndDsgPGJyPgomZ3Q7ICMgU28g
SSBkb24mIzM5O3QgdW5kZXJzdGFuZCB3aHkgSSBhbSBoYXZpbmcgYSAmcXVvdDtUUE0yX1JDX1BP
TElDWV9GQUlMJnF1b3Q7IGVycm9yLjxicj4KJmd0OyA8YnI+CiZndDsgIyBJIHRyaWVkIHRoZSBz
YW1lIHByb2Nlc3Mgc2V2ZXJhbCB0aW1lcywgYW5kIGVhY2ggdGltZSBJIGVuZCB1cCBpbiA8YnI+
CiZndDsgdGhlIHNhbWUgZXJyb3Igc3RhdGUuPGJyPgomZ3Q7IDxicj4KJmd0OyAjIyMjIyMjIyMj
IyMjIyM8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgSXMgdGhlcmUgc29t
ZXRoaW5nIEkgYW0gbWlzc2luZyBoZXJlPzxicj4KJmd0OyA8YnI+CiZndDsgSXMgc29tZXRoaW5n
IGFkZGl0aW9uYWwgSSBuZWVkIHRvIGRvIHRvIHNhdGlzZnkgdGhlIHBvbGljeSB0byB1bnNlYWwg
dGhlIGRhdGE/PGJyPgomZ3Q7IDxicj4KJmd0OyBBbnkgaGVscCBpcyBhcHByZWNpYXRlZCE8YnI+
CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgVGhhbmsgeW91IGluIGFkdmFuY2Uu
PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZn
dDsgPGJyPgo8YnI+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fPGJyPgp0cG0yIG1haWxpbmcgbGlzdDxicj4KPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMu
MDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8YSBocmVm
PSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3RwbTIiIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGlu
Zm8vdHBtMjwvYT48YnI+CjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj4K

--===============1434377242055382425==--

