Content-Type: multipart/mixed; boundary="===============5032790580418024833=="
MIME-Version: 1.0
From: Ian Oliver <ian.justin.oliver at gmail.com>
Subject: Re: [tpm2] tpm2_quote and "safe"
Date: Fri, 16 Mar 2018 08:57:06 +0200
Message-ID: <CAAxBZJt9-gpFhpDCH1m9GEG7fYaccv4HLnxbSaTNaP-c1Mo5PQ@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563FEF43EA@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5032790580418024833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Nothing seen with the TPM simulator- that works correctly (according to TCG
spec).

Lenovo X1 laptops seem to report "1" as the value of safe all the time. The
Xeon based server which varies its value of safe seems to be "randomish".

We're talking with the BIOS manfacturer at the moment too, but it seems
they consider TPM to be "esoteric" at best.

I'll let you know if we find out anything more, but mainly this was to
check with you all just in case you've seen this, to be sure there's
nothing strange in the tpm2 tool stack and also whether anyone had any
ideas why at all.

t.

Ian

On 15 March 2018 at 23:18, Roberts, William C <william.c.roberts(a)intel.co=
m>
wrote:

> Ian,
>
> I wish I could help you more, but this sounds like an issue with the TPM.
> It might be something in the spec I am not aware of. Is this reproducible
> across different manufacturers of tpms? What about using the ibm tpm
> simulator?
>
> Bill
>
> From: Ian Oliver [mailto:ian.justin.oliver(a)gmail.com]
> Sent: Thursday, March 15, 2018 1:27 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] tpm2_quote and "safe"
>
> Thanks William,
> We can only find a reference to the clock too which is what has us a
> little confused.
> Basically we can takes quotes, within that structure is the
> TPMS_CLOCK_INFO struct which contains field safe: TPMI_YES_NO .  We can
> take a series of quotes, say, a few minutes apart and see that particular
> value change to 1 and then back to 0.
> The TPM is not being shutdown during this time, ie: the whole machine is
> powered on and running normally and thus no reason to suspect that the
> clock is in some inconsistent state as according to the spec.
> Is it possible that the TPM is being powered off by the CPU in some power
> saving mode and therefore causing the current clock value not to be saved
> and reread correctly when the TPM is restarted?  We've a script that pars=
es
> the quote and maps this the JSON - we've checked that and it is functioni=
ng
> fine (across half a dozen machines and literally 1000s of quotes now), the
> quote value obtained from the TPM isn't being changed in anyway (we check
> the signature against the AK), therefore our hunch is that something very
> low down in the system is causing this.
> I can send details of the machines and processors off-list if you want.
>
> t.
> Ian
>
> On 15 March 2018 at 19:57, Roberts, William C <william.c.roberts(a)intel.=
com>
> wrote:
> I don=E2=80=99t see that safe value coming out of quote. The only referen=
ce I can
> find is in the spec is in regards to clock.
>
> Can you be more specific?
>
>
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Ian Oliver
> Sent: Tuesday, March 13, 2018 6:11 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] tpm2_quote and "safe"
>
> Hi,
> other than various clock errors what causes the safe flag to be set to 1
> as written into the output of tpm2_quote ?
> We're seeing some odd behaviour from some machines where safe is always
> set to 1 (Lenovo laptop) and on other servers occasionally safe is set to=
 1
> and then returning to 0 on subsequent quotes.
> For example, we might take a number of quotes over time, eg: 5 minutes
> apart. One of those quotes will have safe set to 1, the others are all 0.
> During this time the machine will *not* have experienced a reboot/reset n=
or
> - as far as we can tell - any form of powersave or shutdown. We've also
> noticed that safe gets set to 1 only on some quotes, eg: when quoting
> sha256:16,17,18 for the DRTM measurements.
>
> The machines are all Xeon-E5 based servers, TPM2.0,  tpm2_tools 1.3-rc2
> installed, Ubuntu 17.04 with 4.13 kernel
> Any information appreciated here,
> thanks
> Ian
>
>
> --
> Dr. Ian Oliver
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> Privacy Engineering:  via Amazon
> Twitter: @i_j_oliver
>
>
>
> --
> Dr. Ian Oliver
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> Privacy Engineering:  via Amazon
> Twitter: @i_j_oliver
>



-- =

*Dr. Ian Oliver*
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:  via Amazon <http://www.amazon.co.uk/dp/1497569710>
*Twitter: @i_j_oliver*

--===============5032790580418024833==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+PGRpdj5Ob3RoaW5nIHNlZW4gd2l0aCB0aGUg
VFBNIHNpbXVsYXRvci0gdGhhdCB3b3JrcyBjb3JyZWN0bHkgKGFjY29yZGluZyB0byBUQ0cgc3Bl
YykuPGJyPjxicj48L2Rpdj5MZW5vdm8gWDEgbGFwdG9wcyBzZWVtIHRvIHJlcG9ydCAmcXVvdDsx
JnF1b3Q7IGFzIHRoZSB2YWx1ZSBvZiBzYWZlIGFsbCB0aGUgdGltZS4gVGhlIFhlb24gYmFzZWQg
c2VydmVyIHdoaWNoIHZhcmllcyBpdHMgdmFsdWUgb2Ygc2FmZSBzZWVtcyB0byBiZSAmcXVvdDty
YW5kb21pc2gmcXVvdDsuPGJyPjxicj48L2Rpdj5XZSYjMzk7cmUgdGFsa2luZyB3aXRoIHRoZSBC
SU9TIG1hbmZhY3R1cmVyIGF0IHRoZSBtb21lbnQgdG9vLCBidXQgaXQgc2VlbXMgdGhleSBjb25z
aWRlciBUUE0gdG8gYmUgJnF1b3Q7ZXNvdGVyaWMmcXVvdDsgYXQgYmVzdC48YnI+PGJyPjwvZGl2
PjxkaXY+SSYjMzk7bGwgbGV0IHlvdSBrbm93IGlmIHdlIGZpbmQgb3V0IGFueXRoaW5nIG1vcmUs
IGJ1dCBtYWlubHkgdGhpcyB3YXMgdG8gY2hlY2sgd2l0aCB5b3UgYWxsIGp1c3QgaW4gY2FzZSB5
b3UmIzM5O3ZlIHNlZW4gdGhpcywgdG8gYmUgc3VyZSB0aGVyZSYjMzk7cyBub3RoaW5nIHN0cmFu
Z2UgaW4gdGhlIHRwbTIgdG9vbCBzdGFjayBhbmQgYWxzbyB3aGV0aGVyIGFueW9uZSBoYWQgYW55
IGlkZWFzIHdoeSBhdCBhbGwuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PnQuPGJyPjxicj48L2Rp
dj5JYW48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+T24gMTUgTWFyY2ggMjAxOCBhdCAyMzoxOCwgUm9iZXJ0cywgV2lsbGlhbSBD
IDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4m
Z3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1s
ZWZ0OjFleCI+SWFuLDxicj4KPGJyPgpJIHdpc2ggSSBjb3VsZCBoZWxwIHlvdSBtb3JlLCBidXQg
dGhpcyBzb3VuZHMgbGlrZSBhbiBpc3N1ZSB3aXRoIHRoZSBUUE0uIEl0IG1pZ2h0IGJlIHNvbWV0
aGluZyBpbiB0aGUgc3BlYyBJIGFtIG5vdCBhd2FyZSBvZi4gSXMgdGhpcyByZXByb2R1Y2libGUg
YWNyb3NzIGRpZmZlcmVudCBtYW51ZmFjdHVyZXJzIG9mIHRwbXM/IFdoYXQgYWJvdXQgdXNpbmcg
dGhlIGlibSB0cG0gc2ltdWxhdG9yPzxicj4KPGJyPgpCaWxsPGJyPgo8YnI+CkZyb206IElhbiBP
bGl2ZXIgW21haWx0bzo8YSBocmVmPSJtYWlsdG86aWFuLmp1c3Rpbi5vbGl2ZXJAZ21haWwuY29t
Ij5pYW4uanVzdGluLm9saXZlckA8d2JyPmdtYWlsLmNvbTwvYT5dPGJyPgpTZW50OiBUaHVyc2Rh
eSwgTWFyY2ggMTUsIDIwMTggMToyNyBQTTxicj4KVG86IFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7
PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSI+d2lsbGlhbS5jLnJv
YmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+CkNjOiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0
cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KU3ViamVjdDogUmU6IFt0cG0yXSB0
cG0yX3F1b3RlIGFuZCAmcXVvdDtzYWZlJnF1b3Q7PGJyPgo8ZGl2IGNsYXNzPSJIT0VuWmIiPjxk
aXYgY2xhc3M9Img1Ij48YnI+ClRoYW5rcyBXaWxsaWFtLDxicj4KV2UgY2FuIG9ubHkgZmluZCBh
IHJlZmVyZW5jZSB0byB0aGUgY2xvY2sgdG9vIHdoaWNoIGlzIHdoYXQgaGFzIHVzIGEgbGl0dGxl
IGNvbmZ1c2VkLjxicj4KQmFzaWNhbGx5IHdlIGNhbiB0YWtlcyBxdW90ZXMsIHdpdGhpbiB0aGF0
IHN0cnVjdHVyZSBpcyB0aGUgVFBNU19DTE9DS19JTkZPIHN0cnVjdCB3aGljaCBjb250YWlucyBm
aWVsZCBzYWZlOiBUUE1JX1lFU19OTyAuwqAgV2UgY2FuIHRha2UgYSBzZXJpZXMgb2YgcXVvdGVz
LCBzYXksIGEgZmV3IG1pbnV0ZXMgYXBhcnQgYW5kIHNlZSB0aGF0IHBhcnRpY3VsYXIgdmFsdWUg
Y2hhbmdlIHRvIDEgYW5kIHRoZW4gYmFjayB0byAwLjxicj4KVGhlIFRQTSBpcyBub3QgYmVpbmcg
c2h1dGRvd24gZHVyaW5nIHRoaXMgdGltZSwgaWU6IHRoZSB3aG9sZSBtYWNoaW5lIGlzIHBvd2Vy
ZWQgb24gYW5kIHJ1bm5pbmcgbm9ybWFsbHkgYW5kIHRodXMgbm8gcmVhc29uIHRvIHN1c3BlY3Qg
dGhhdCB0aGUgY2xvY2sgaXMgaW4gc29tZSBpbmNvbnNpc3RlbnQgc3RhdGUgYXMgYWNjb3JkaW5n
IHRvIHRoZSBzcGVjLsKgPGJyPgpJcyBpdCBwb3NzaWJsZSB0aGF0IHRoZSBUUE0gaXMgYmVpbmcg
cG93ZXJlZCBvZmYgYnkgdGhlIENQVSBpbiBzb21lIHBvd2VyIHNhdmluZyBtb2RlIGFuZCB0aGVy
ZWZvcmUgY2F1c2luZyB0aGUgY3VycmVudCBjbG9jayB2YWx1ZSBub3QgdG8gYmUgc2F2ZWQgYW5k
IHJlcmVhZCBjb3JyZWN0bHkgd2hlbiB0aGUgVFBNIGlzIHJlc3RhcnRlZD/CoCBXZSYjMzk7dmUg
YSBzY3JpcHQgdGhhdCBwYXJzZXMgdGhlIHF1b3RlIGFuZCBtYXBzIHRoaXMgdGhlIEpTT04gLSB3
ZSYjMzk7dmUgY2hlY2tlZCB0aGF0IGFuZCBpdCBpcyBmdW5jdGlvbmluZyBmaW5lIChhY3Jvc3Mg
aGFsZiBhIGRvemVuIG1hY2hpbmVzIGFuZCBsaXRlcmFsbHkgMTAwMHMgb2YgcXVvdGVzIG5vdyks
IHRoZSBxdW90ZSB2YWx1ZSBvYnRhaW5lZCBmcm9tIHRoZSBUUE0gaXNuJiMzOTt0IGJlaW5nIGNo
YW5nZWQgaW4gYW55d2F5ICh3ZSBjaGVjayB0aGUgc2lnbmF0dXJlIGFnYWluc3QgdGhlIEFLKSwg
dGhlcmVmb3JlIG91ciBodW5jaCBpcyB0aGF0IHNvbWV0aGluZyB2ZXJ5IGxvdyBkb3duIGluIHRo
ZSBzeXN0ZW0gaXMgY2F1c2luZyB0aGlzLjxicj4KSSBjYW4gc2VuZCBkZXRhaWxzIG9mIHRoZSBt
YWNoaW5lcyBhbmQgcHJvY2Vzc29ycyBvZmYtbGlzdCBpZiB5b3Ugd2FudC48YnI+Cjxicj4KdC48
YnI+Cklhbjxicj4KPGJyPgpPbiAxNSBNYXJjaCAyMDE4IGF0IDE5OjU3LCBSb2JlcnRzLCBXaWxs
aWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iPndp
bGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4KSSBkb27igJl0IHNl
ZSB0aGF0IHNhZmUgdmFsdWUgY29taW5nIG91dCBvZiBxdW90ZS4gVGhlIG9ubHkgcmVmZXJlbmNl
IEkgY2FuIGZpbmQgaXMgaW4gdGhlIHNwZWMgaXMgaW4gcmVnYXJkcyB0byBjbG9jay48YnI+CsKg
PGJyPgpDYW4geW91IGJlIG1vcmUgc3BlY2lmaWM/PGJyPgrCoDxicj4KwqA8YnI+CkZyb206IHRw
bTIgW21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZyI+dHBt
Mi1ib3VuY2VzQGxpc3RzLjAxLjx3YnI+b3JnPC9hPl0gT24gQmVoYWxmIE9mIElhbiBPbGl2ZXI8
YnI+ClNlbnQ6IFR1ZXNkYXksIE1hcmNoIDEzLCAyMDE4IDY6MTEgQU08YnI+ClRvOiA8YSBocmVm
PSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KU3Vi
amVjdDogW3RwbTJdIHRwbTJfcXVvdGUgYW5kICZxdW90O3NhZmUmcXVvdDs8YnI+CsKgPGJyPgpI
aSw8YnI+Cm90aGVyIHRoYW4gdmFyaW91cyBjbG9jayBlcnJvcnMgd2hhdCBjYXVzZXMgdGhlIHNh
ZmUgZmxhZyB0byBiZSBzZXQgdG8gMSBhcyB3cml0dGVuIGludG8gdGhlIG91dHB1dCBvZiB0cG0y
X3F1b3RlID88YnI+CldlJiMzOTtyZSBzZWVpbmcgc29tZSBvZGQgYmVoYXZpb3VyIGZyb20gc29t
ZSBtYWNoaW5lcyB3aGVyZSBzYWZlIGlzIGFsd2F5cyBzZXQgdG8gMSAoTGVub3ZvIGxhcHRvcCkg
YW5kIG9uIG90aGVyIHNlcnZlcnMgb2NjYXNpb25hbGx5IHNhZmUgaXMgc2V0IHRvIDEgYW5kIHRo
ZW4gcmV0dXJuaW5nIHRvIDAgb24gc3Vic2VxdWVudCBxdW90ZXMuPGJyPgpGb3IgZXhhbXBsZSwg
d2UgbWlnaHQgdGFrZSBhIG51bWJlciBvZiBxdW90ZXMgb3ZlciB0aW1lLCBlZzogNSBtaW51dGVz
IGFwYXJ0LiBPbmUgb2YgdGhvc2UgcXVvdGVzIHdpbGwgaGF2ZSBzYWZlIHNldCB0byAxLCB0aGUg
b3RoZXJzIGFyZSBhbGwgMC7CoCBEdXJpbmcgdGhpcyB0aW1lIHRoZSBtYWNoaW5lIHdpbGwgKm5v
dCogaGF2ZSBleHBlcmllbmNlZCBhIHJlYm9vdC9yZXNldCBub3IgLSBhcyBmYXIgYXMgd2UgY2Fu
IHRlbGwgLSBhbnkgZm9ybSBvZiBwb3dlcnNhdmUgb3Igc2h1dGRvd24uIFdlJiMzOTt2ZSBhbHNv
IG5vdGljZWQgdGhhdCBzYWZlIGdldHMgc2V0IHRvIDEgb25seSBvbiBzb21lIHF1b3RlcywgZWc6
IHdoZW4gcXVvdGluZyBzaGEyNTY6MTYsMTcsMTggZm9yIHRoZSBEUlRNIG1lYXN1cmVtZW50cy48
YnI+CsKgPGJyPgpUaGUgbWFjaGluZXMgYXJlIGFsbCBYZW9uLUU1IGJhc2VkIHNlcnZlcnMsIFRQ
TTIuMCzCoCB0cG0yX3Rvb2xzIDEuMy1yYzIgaW5zdGFsbGVkLCBVYnVudHUgMTcuMDQgd2l0aCA0
LjEzIGtlcm5lbDxicj4KQW55IGluZm9ybWF0aW9uIGFwcHJlY2lhdGVkIGhlcmUsPGJyPgp0aGFu
a3M8YnI+Cklhbjxicj4KPGJyPgo8YnI+Ci0tPGJyPgpEci4gSWFuIE9saXZlcjxicj4KPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PHdicj49PGJyPgpQcml2YWN5IEVuZ2luZWVyaW5nOsKg
IHZpYSBBbWF6b248YnI+ClR3aXR0ZXI6IEBpX2pfb2xpdmVyPGJyPgo8YnI+Cjxicj4KPGJyPgot
LTxicj4KRHIuIElhbiBPbGl2ZXI8YnI+Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PTx3
YnI+PTxicj4KUHJpdmFjeSBFbmdpbmVlcmluZzrCoCB2aWEgQW1hem9uPGJyPgpUd2l0dGVyOiBA
aV9qX29saXZlcjxicj4KPC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48YnIgY2xl
YXI9ImFsbCI+PGJyPi0tIDxicj48ZGl2IGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiIGRhdGEtc21h
cnRtYWlsPSJnbWFpbF9zaWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0
ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OmFyaWFsO2ZvbnQtc2l6ZTpzbWFsbCI+PGI+RHIuIElhbiBPbGl2ZXI8L2I+PGJy
Pj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9u
dC1mYW1pbHk6YXJpYWw7Zm9udC1zaXplOnNtYWxsIj5Qcml2YWN5IEVuZ2luZWVyaW5nOsKgIDxi
PjwvYj48c3BhbiBzdHlsZT0iY29sb3I6cmdiKDE3LDE3LDE3KTtmb250LWZhbWlseTpBcmlhbCxz
YW5zLXNlcmlmO2ZvbnQtc2l6ZToxM3B4O2xpbmUtaGVpZ2h0OjE5cHgiPjxhIGhyZWY9Imh0dHA6
Ly93d3cuYW1hem9uLmNvLnVrL2RwLzE0OTc1Njk3MTAiIHRhcmdldD0iX2JsYW5rIj52aWEgQW1h
em9uPC9hPjwvc3Bhbj48Yj48YnI+VHdpdHRlcjogQGlfal9vbGl2ZXI8L2I+PC9kaXY+PC9kaXY+
PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+CjwvZGl2Pgo=

--===============5032790580418024833==--

