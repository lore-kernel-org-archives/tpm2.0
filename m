Content-Type: multipart/mixed; boundary="===============7336986552251180182=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: Re: [tpm2] Creating a TPM EK Public object at the server
Date: Tue, 27 Aug 2019 14:38:21 -0700
Message-ID: <CAP3jAwSG=FDH-PM5RNx4mEeiWyrbkUrm7x2oDv21mEVGF7MhnQ@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DEF3FC@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7336986552251180182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the replies.
So, is it okay to send the Public Object over Internet? I thought we should
only send the EK Certificate!  So there is no harm in sending TPM2B_PUBLIC
generated from createEk??

This will make life so much easier for me.

On Tue, Aug 27, 2019 at 12:40 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

>
>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Roberts,
> William C
> > Sent: Tuesday, August 27, 2019 2:24 PM
> > To: Matthew Dempsky <matthew(a)dempsky.org>; Rahul Hardikar
> > <rahulhardikar(a)gmail.com>
> > Cc: tpm2(a)lists.01.org
> > Subject: Re: [tpm2] Creating a TPM EK Public object at the server
> >
> >
> >
> > > -----Original Message-----
> > > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Matthew
> > > Dempsky
> > > Sent: Tuesday, August 27, 2019 1:21 PM
> > > To: Rahul Hardikar <rahulhardikar(a)gmail.com>
> > > Cc: tpm2(a)lists.01.org
> > > Subject: Re: [tpm2] Creating a TPM EK Public object at the server
> > >
> > > On Tue, Aug 27, 2019, 11:01 AM Rahul Hardikar <rahulhardikar(a)gmail.=
com
> > > <mailto:rahulhardikar(a)gmail.com> > wrote:
> > >
> > >     1. Do we need to also copy the standard AuthPolicy digest into the
> > > structure too? This is definitely needed in TPM to recreate the EK but
> > > do we need it for make_credential_external?
> > >
> > >
> > > Conceptually, the "Make Credential" operation just needs to know the
> > > EK's public key and encryption scheme details (eg, SHA256 and
> AES-128-OFB).
> > >
> > > It's assumed that the auth policy is appropriate, since the TPM
> > > manufacturer certified the public key (and like you said, the EK can't
> > > be regenerated with a different policy); and you can assume the policy
> > > is satisfiable, because otherwise the EK can't be used to decrypt the
> credential
> > blob.
> > >
> > > The tpm2_makecredential tool takes the EK's "public" structure as
> > > input (which does include auth policy) though because it's an easy way
> > > to get the public key and encryption scheme details all in one packag=
e.
> > >
> > > See usage example at https://github.com/tpm2-software/tpm2-
> > > tools/blob/master/man/tpm2_activatecredential.1.md#examples
> > >
> > >
> > >     2. The EKCert is in ASN.1 DER format which i convert to PEM, is it
> > > okay to copy it directly or do I need to convert it to some other
> > > format and then copy the ek public key?
> > >
> > >
> > > tpm2_makecredential doesn't use the EK certificate. It's expected that
> > > you validate that separately, and then match it against the public key
> > > contained in the EK's "pubic" data.
> >
> > You're manufacturer should provide, somehow, the template used for
> > createprimary.
> > I think some manufacturers plop this stuff in NV indices. I'm not sure
> offhand if
> > this is part of PC client specification. But the tpm2_createek command
> goes after
> > NV Indices to get the template.
> > https://github.com/tpm2-software/tpm2-
> > tools/blob/master/tools/tpm2_createek.c#L106
>
> Missed "on server side". You would need that template + the public key
> from the
> cert to create a public TSS structure and call makecredential. Which as
> matt points out,
>  The TSS format is obviously not ideal for that. make credential could be
> modified
> also take a template and a cert. But why not just ask the client for the
> TSS pub and
> verify it? Part 24.2 of the architecture spec says the initiator provides
> the public portion
> of the object.
>
>
> https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1-A=
rchitecture-01.38.pdf
>
>
> >
> > _______________________________________________
> > tpm2 mailing list
> > tpm2(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/tpm2
>

--===============7336986552251180182==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+VGhhbmtzIGZvciB0aGUgcmVwbGllcy48ZGl2
PlNvLCBpcyBpdCBva2F5IHRvIHNlbmQgdGhlIFB1YmxpYyBPYmplY3Qgb3ZlciBJbnRlcm5ldD8g
SSB0aG91Z2h0IHdlIHNob3VsZCBvbmx5IHNlbmQgdGhlIEVLIENlcnRpZmljYXRlIcKgIFNvIHRo
ZXJlIGlzIG5vIGhhcm0gaW4gc2VuZGluZyBUUE0yQl9QVUJMSUMgZ2VuZXJhdGVkIGZyb20gY3Jl
YXRlRWs/P8KgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGlzIHdpbGwgbWFrZSBsaWZlIHNv
IG11Y2jCoGVhc2llciBmb3IgbWUuPGJyPjwvZGl2PjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFR1ZSwg
QXVnIDI3LCAyMDE5IGF0IDEyOjQwIFBNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0i
bWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSI+d2lsbGlhbS5jLnJvYmVydHNAaW50
ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9x
dW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdC13aWR0aDox
cHg7Ym9yZGVyLWxlZnQtc3R5bGU6c29saWQ7Ym9yZGVyLWxlZnQtY29sb3I6cmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48YnI+Cjxicj4KJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLTxicj4KJmd0OyBGcm9tOiB0cG0yIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTIt
Ym91bmNlc0BsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWJvdW5jZXNAbGlzdHMu
MDEub3JnPC9hPl0gT24gQmVoYWxmIE9mIFJvYmVydHMsIFdpbGxpYW0gQzxicj4KJmd0OyBTZW50
OiBUdWVzZGF5LCBBdWd1c3QgMjcsIDIwMTkgMjoyNCBQTTxicj4KJmd0OyBUbzogTWF0dGhldyBE
ZW1wc2t5ICZsdDs8YSBocmVmPSJtYWlsdG86bWF0dGhld0BkZW1wc2t5Lm9yZyIgdGFyZ2V0PSJf
YmxhbmsiPm1hdHRoZXdAZGVtcHNreS5vcmc8L2E+Jmd0OzsgUmFodWwgSGFyZGlrYXI8YnI+CiZn
dDsgJmx0OzxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDs8YnI+CiZndDsgQ2M6IDxhIGhy
ZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMu
MDEub3JnPC9hPjxicj4KJmd0OyBTdWJqZWN0OiBSZTogW3RwbTJdIENyZWF0aW5nIGEgVFBNIEVL
IFB1YmxpYyBvYmplY3QgYXQgdGhlIHNlcnZlcjxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7
IDxicj4KJmd0OyAmZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7ICZndDsg
RnJvbTogdHBtMiBbbWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWJvdW5jZXNAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZzwvYT5dIE9uIEJl
aGFsZiBPZiBNYXR0aGV3PGJyPgomZ3Q7ICZndDsgRGVtcHNreTxicj4KJmd0OyAmZ3Q7IFNlbnQ6
IFR1ZXNkYXksIEF1Z3VzdCAyNywgMjAxOSAxOjIxIFBNPGJyPgomZ3Q7ICZndDsgVG86IFJhaHVs
IEhhcmRpa2FyICZsdDs8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRh
cmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7ICZn
dDsgQ2M6IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
PnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyAmZ3Q7IFN1YmplY3Q6IFJlOiBbdHBtMl0g
Q3JlYXRpbmcgYSBUUE0gRUsgUHVibGljIG9iamVjdCBhdCB0aGUgc2VydmVyPGJyPgomZ3Q7ICZn
dDs8YnI+CiZndDsgJmd0OyBPbiBUdWUsIEF1ZyAyNywgMjAxOSwgMTE6MDEgQU0gUmFodWwgSGFy
ZGlrYXIgJmx0OzxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPjxicj4KJmd0OyAmZ3Q7ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyAmZ3Q7IHdyb3RlOjxicj4KJmd0
OyAmZ3Q7PGJyPgomZ3Q7ICZndDvCoCDCoCDCoDEuIERvIHdlIG5lZWQgdG8gYWxzbyBjb3B5IHRo
ZSBzdGFuZGFyZCBBdXRoUG9saWN5IGRpZ2VzdCBpbnRvIHRoZTxicj4KJmd0OyAmZ3Q7IHN0cnVj
dHVyZSB0b28/IFRoaXMgaXMgZGVmaW5pdGVseSBuZWVkZWQgaW4gVFBNIHRvIHJlY3JlYXRlIHRo
ZSBFSyBidXQ8YnI+CiZndDsgJmd0OyBkbyB3ZSBuZWVkIGl0IGZvciBtYWtlX2NyZWRlbnRpYWxf
ZXh0ZXJuYWw/PGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IENvbmNl
cHR1YWxseSwgdGhlICZxdW90O01ha2UgQ3JlZGVudGlhbCZxdW90OyBvcGVyYXRpb24ganVzdCBu
ZWVkcyB0byBrbm93IHRoZTxicj4KJmd0OyAmZ3Q7IEVLJiMzOTtzIHB1YmxpYyBrZXkgYW5kIGVu
Y3J5cHRpb24gc2NoZW1lIGRldGFpbHMgKGVnLCBTSEEyNTYgYW5kIEFFUy0xMjgtT0ZCKS48YnI+
CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IEl0JiMzOTtzIGFzc3VtZWQgdGhhdCB0aGUgYXV0aCBw
b2xpY3kgaXMgYXBwcm9wcmlhdGUsIHNpbmNlIHRoZSBUUE08YnI+CiZndDsgJmd0OyBtYW51ZmFj
dHVyZXIgY2VydGlmaWVkIHRoZSBwdWJsaWMga2V5IChhbmQgbGlrZSB5b3Ugc2FpZCwgdGhlIEVL
IGNhbiYjMzk7dDxicj4KJmd0OyAmZ3Q7IGJlIHJlZ2VuZXJhdGVkIHdpdGggYSBkaWZmZXJlbnQg
cG9saWN5KTsgYW5kIHlvdSBjYW4gYXNzdW1lIHRoZSBwb2xpY3k8YnI+CiZndDsgJmd0OyBpcyBz
YXRpc2ZpYWJsZSwgYmVjYXVzZSBvdGhlcndpc2UgdGhlIEVLIGNhbiYjMzk7dCBiZSB1c2VkIHRv
IGRlY3J5cHQgdGhlIGNyZWRlbnRpYWw8YnI+CiZndDsgYmxvYi48YnI+CiZndDsgJmd0Ozxicj4K
Jmd0OyAmZ3Q7IFRoZSB0cG0yX21ha2VjcmVkZW50aWFsIHRvb2wgdGFrZXMgdGhlIEVLJiMzOTtz
ICZxdW90O3B1YmxpYyZxdW90OyBzdHJ1Y3R1cmUgYXM8YnI+CiZndDsgJmd0OyBpbnB1dCAod2hp
Y2ggZG9lcyBpbmNsdWRlIGF1dGggcG9saWN5KSB0aG91Z2ggYmVjYXVzZSBpdCYjMzk7cyBhbiBl
YXN5IHdheTxicj4KJmd0OyAmZ3Q7IHRvIGdldCB0aGUgcHVibGljIGtleSBhbmQgZW5jcnlwdGlv
biBzY2hlbWUgZGV0YWlscyBhbGwgaW4gb25lIHBhY2thZ2UuPGJyPgomZ3Q7ICZndDs8YnI+CiZn
dDsgJmd0OyBTZWUgdXNhZ2UgZXhhbXBsZSBhdCA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
dHBtMi1zb2Z0d2FyZS90cG0yLSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi08L2E+PGJyPgomZ3Q7ICZndDsgdG9v
bHMvYmxvYi9tYXN0ZXIvbWFuLzxhIGhyZWY9Imh0dHA6Ly90cG0yX2FjdGl2YXRlY3JlZGVudGlh
bC4xLm1kI2V4YW1wbGVzIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj50cG0yX2Fj
dGl2YXRlY3JlZGVudGlhbC4xLm1kI2V4YW1wbGVzPC9hPjxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7
ICZndDs8YnI+CiZndDsgJmd0O8KgIMKgIMKgMi4gVGhlIEVLQ2VydCBpcyBpbiBBU04uMSBERVIg
Zm9ybWF0IHdoaWNoIGkgY29udmVydCB0byBQRU0sIGlzIGl0PGJyPgomZ3Q7ICZndDsgb2theSB0
byBjb3B5IGl0IGRpcmVjdGx5IG9yIGRvIEkgbmVlZCB0byBjb252ZXJ0IGl0IHRvIHNvbWUgb3Ro
ZXI8YnI+CiZndDsgJmd0OyBmb3JtYXQgYW5kIHRoZW4gY29weSB0aGUgZWsgcHVibGljIGtleT88
YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgdHBtMl9tYWtlY3JlZGVu
dGlhbCBkb2VzbiYjMzk7dCB1c2UgdGhlIEVLIGNlcnRpZmljYXRlLiBJdCYjMzk7cyBleHBlY3Rl
ZCB0aGF0PGJyPgomZ3Q7ICZndDsgeW91IHZhbGlkYXRlIHRoYXQgc2VwYXJhdGVseSwgYW5kIHRo
ZW4gbWF0Y2ggaXQgYWdhaW5zdCB0aGUgcHVibGljIGtleTxicj4KJmd0OyAmZ3Q7IGNvbnRhaW5l
ZCBpbiB0aGUgRUsmIzM5O3MgJnF1b3Q7cHViaWMmcXVvdDsgZGF0YS48YnI+CiZndDsgPGJyPgom
Z3Q7IFlvdSYjMzk7cmUgbWFudWZhY3R1cmVyIHNob3VsZCBwcm92aWRlLCBzb21laG93LCB0aGUg
dGVtcGxhdGUgdXNlZCBmb3I8YnI+CiZndDsgY3JlYXRlcHJpbWFyeS48YnI+CiZndDsgSSB0aGlu
ayBzb21lIG1hbnVmYWN0dXJlcnMgcGxvcCB0aGlzIHN0dWZmIGluIE5WIGluZGljZXMuIEkmIzM5
O20gbm90IHN1cmUgb2ZmaGFuZCBpZjxicj4KJmd0OyB0aGlzIGlzIHBhcnQgb2YgUEMgY2xpZW50
IHNwZWNpZmljYXRpb24uIEJ1dCB0aGUgdHBtMl9jcmVhdGVlayBjb21tYW5kIGdvZXMgYWZ0ZXI8
YnI+CiZndDsgTlYgSW5kaWNlcyB0byBnZXQgdGhlIHRlbXBsYXRlLjxicj4KJmd0OyA8YSBocmVm
PSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLSIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi08
L2E+PGJyPgomZ3Q7IHRvb2xzL2Jsb2IvbWFzdGVyL3Rvb2xzL3RwbTJfY3JlYXRlZWsuYyNMMTA2
PGJyPgo8YnI+Ck1pc3NlZCAmcXVvdDtvbiBzZXJ2ZXIgc2lkZSZxdW90Oy4gWW91IHdvdWxkIG5l
ZWQgdGhhdCB0ZW1wbGF0ZSArIHRoZSBwdWJsaWMga2V5IGZyb20gdGhlPGJyPgpjZXJ0IHRvIGNy
ZWF0ZSBhIHB1YmxpYyBUU1Mgc3RydWN0dXJlIGFuZCBjYWxsIG1ha2VjcmVkZW50aWFsLiBXaGlj
aCBhcyBtYXR0IHBvaW50cyBvdXQsPGJyPgrCoFRoZSBUU1MgZm9ybWF0IGlzIG9idmlvdXNseSBu
b3QgaWRlYWwgZm9yIHRoYXQuIG1ha2UgY3JlZGVudGlhbCBjb3VsZCBiZSBtb2RpZmllZDxicj4K
YWxzbyB0YWtlIGEgdGVtcGxhdGUgYW5kIGEgY2VydC4gQnV0IHdoeSBub3QganVzdCBhc2sgdGhl
IGNsaWVudCBmb3IgdGhlIFRTUyBwdWIgYW5kPGJyPgp2ZXJpZnkgaXQ/IFBhcnQgMjQuMiBvZiB0
aGUgYXJjaGl0ZWN0dXJlIHNwZWMgc2F5cyB0aGUgaW5pdGlhdG9yIHByb3ZpZGVzIHRoZSBwdWJs
aWMgcG9ydGlvbjxicj4Kb2YgdGhlIG9iamVjdC48YnI+Cjxicj4KPGEgaHJlZj0iaHR0cHM6Ly90
cnVzdGVkY29tcHV0aW5nZ3JvdXAub3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy9UUE0tUmV2LTIuMC1Q
YXJ0LTEtQXJjaGl0ZWN0dXJlLTAxLjM4LnBkZiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cHM6Ly90cnVzdGVkY29tcHV0aW5nZ3JvdXAub3JnL3dwLWNvbnRlbnQvdXBsb2Fk
cy9UUE0tUmV2LTIuMC1QYXJ0LTEtQXJjaGl0ZWN0dXJlLTAxLjM4LnBkZjwvYT48YnI+Cjxicj4K
PGJyPgomZ3Q7IDxicj4KJmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXzxicj4KJmd0OyB0cG0yIG1haWxpbmcgbGlzdDxicj4KJmd0OyA8YSBocmVmPSJt
YWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9y
ZzwvYT48YnI+CiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0
aW5mby90cG0yIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3Rz
LjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3RwbTI8L2E+PGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+
Cg==

--===============7336986552251180182==--

