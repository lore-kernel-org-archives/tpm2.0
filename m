Content-Type: multipart/mixed; boundary="===============7979131498910414792=="
MIME-Version: 1.0
From: Garrett Fields <ghfields at gmail.com>
Subject: Re: [tpm2] PCR Policy enforcement when using nvram
Date: Mon, 29 Jul 2019 22:08:43 -0400
Message-ID: <CA++-fmvSrxcG4hE2sgx0rBnhtHWDbKDGhXOQNHp_LQ1KLut28w@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DD3FC2@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7979131498910414792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I really appreciate your responses.  I understand the policyAnd tool might
not be an option yet.  Either way there seems to be a lot to learn about
policies.  You've given me some new avenues to explore.



On Mon, Jul 29, 2019, 7:56 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> <snip>
> > > >
> > > > I believe your right.  If I used policyRead only and gave up on
> > > > policyAuth (and the -P switch), it would have succeeded and failed
> > > > as expected.  I'm just hoping I can get it to get both working
> simultaneously.
> > > >
> > > > I really appreciate your response.  I'll play around with object
> > > > workflow.  If anyone has tips on making authValue AND authPolicy
> > > > apply to nvram or have a comparable method with objects, I'd love to
> hear
> > them.
> >
> >
> > I misunderstood...you want BOTH.. then you need to create a policy to do
> what
> > you desire and only enable policy authorization. Which means you would
> need
> > policyand, which we don't have on master yet, just policyor.
>
> Geez, I had a moment. The policyand is just running policy events. If and
> is what you wanted this
> does it (requires tpm2-abrmd or direct device access, no in kernel rm
> /dev/tpmrm0):
>
> tpm2_startauthsession -S s.dat
> tpm2_policypassword -S s.dat
> tpm2_policypcr -S s.dat -l sha256:0,1,2,3 -L policy.dat
> tpm2_nvdefine -C o -p foobar -x 0x1500016 -s 32 -L policy.dat -a
> "policyread|policywrite"
> tpm2_flushcontext s.dat
> rm s.dat
>
> # repeats steps with real policy session
> tpm2_startauthsession --policy -S s.dat
>
> # works
> tpm2_policypassword -S s.dat
> tpm2_policypcr -S s.dat -l sha256:0,1,2,3 -L policy.dat
> echo 'secret' | tpm2_nvwrite -P session:s.dat+foobar -x 0x1500016
>
> # update PCRs
> tpm2_pcrevent 0 <<< 'djshfsjdhsdjhdfs'
>
> # fails
> echo 'secret' | tpm2_nvwrite -P session:s.dat+foobar -x 0x1500016
> WARNING:esys:src/tss2-esys/api/Esys_NV_Write.c:306:Esys_NV_Write_Finish()
> Received TPM Error
> ERROR:esys:src/tss2-esys/api/Esys_NV_Write.c:110:Esys_NV_Write() Esys
> Finish ErrorCode (0x0000099d)
> ERROR: Failed to write NV area at index 0x1500016
> ERROR: Tss2_Sys_NV_Write(0x99D) - tpm:session(1):a policy check failed
> ERROR: Unable to run tpm2_nvwrite
>
> -- end of script
>
> I didn't get policyor working, I could get it to auth for the password
> side, but not the pcr part
> Of the or branch, likely something I am not getting. So if you want OR, I
> don't have the answer
> at the moment.
>
> >
> > It's be a mix of tpm2_startauthsession,
> tpm2_policypassword/tpm2_policysecret
> > tpm2_policypcr and tpm2_policyand, which will give you some policy
> digest. Then
> > create an nvspace with that policy digest and only
> policycread|policywrite.
> >
> > Imran can probably give you a full example with policyor, then when we
> have
> > policyand, you can just swap it out or you could write policyand and
> upstream it
> > to us.
>

--===============7979131498910414792==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPkkgcmVhbGx5IGFwcHJlY2lhdGUgeW91ciByZXNwb25zZXMuwqAgSSB1
bmRlcnN0YW5kIHRoZSBwb2xpY3lBbmQgdG9vbCBtaWdodCBub3QgYmUgYW4gb3B0aW9uIHlldC7C
oCBFaXRoZXIgd2F5IHRoZXJlIHNlZW1zIHRvIGJlIGEgbG90IHRvIGxlYXJuIGFib3V0IHBvbGlj
aWVzLsKgIFlvdSYjMzk7dmUgZ2l2ZW4gbWUgc29tZSBuZXcgYXZlbnVlcyB0byBleHBsb3JlLjxk
aXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48L2Rpdj48
YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9h
dHRyIj5PbiBNb24sIEp1bCAyOSwgMjAxOSwgNzo1NiBQTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0
OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2Js
YW5rIiByZWw9Im5vcmVmZXJyZXIiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7
IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJt
YXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6
MWV4Ij4mbHQ7c25pcCZndDs8YnI+CiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgJmd0OyBJ
IGJlbGlldmUgeW91ciByaWdodC7CoCBJZiBJIHVzZWQgcG9saWN5UmVhZCBvbmx5IGFuZCBnYXZl
IHVwIG9uPGJyPgomZ3Q7ICZndDsgJmd0OyBwb2xpY3lBdXRoIChhbmQgdGhlIC1QIHN3aXRjaCks
IGl0IHdvdWxkIGhhdmUgc3VjY2VlZGVkIGFuZCBmYWlsZWQ8YnI+CiZndDsgJmd0OyAmZ3Q7IGFz
IGV4cGVjdGVkLsKgIEkmIzM5O20ganVzdCBob3BpbmcgSSBjYW4gZ2V0IGl0IHRvIGdldCBib3Ro
IHdvcmtpbmcgc2ltdWx0YW5lb3VzbHkuPGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7
ICZndDsgSSByZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIHJlc3BvbnNlLsKgIEkmIzM5O2xsIHBsYXkg
YXJvdW5kIHdpdGggb2JqZWN0PGJyPgomZ3Q7ICZndDsgJmd0OyB3b3JrZmxvdy7CoCBJZiBhbnlv
bmUgaGFzIHRpcHMgb24gbWFraW5nIGF1dGhWYWx1ZSBBTkQgYXV0aFBvbGljeTxicj4KJmd0OyAm
Z3Q7ICZndDsgYXBwbHkgdG8gbnZyYW0gb3IgaGF2ZSBhIGNvbXBhcmFibGUgbWV0aG9kIHdpdGgg
b2JqZWN0cywgSSYjMzk7ZCBsb3ZlIHRvIGhlYXI8YnI+CiZndDsgdGhlbS48YnI+CiZndDsgPGJy
PgomZ3Q7IDxicj4KJmd0OyBJIG1pc3VuZGVyc3Rvb2QuLi55b3Ugd2FudCBCT1RILi4gdGhlbiB5
b3UgbmVlZCB0byBjcmVhdGUgYSBwb2xpY3kgdG8gZG8gd2hhdDxicj4KJmd0OyB5b3UgZGVzaXJl
IGFuZCBvbmx5IGVuYWJsZSBwb2xpY3kgYXV0aG9yaXphdGlvbi4gV2hpY2ggbWVhbnMgeW91IHdv
dWxkIG5lZWQ8YnI+CiZndDsgcG9saWN5YW5kLCB3aGljaCB3ZSBkb24mIzM5O3QgaGF2ZSBvbiBt
YXN0ZXIgeWV0LCBqdXN0IHBvbGljeW9yLjxicj4KPGJyPgpHZWV6LCBJIGhhZCBhIG1vbWVudC4g
VGhlIHBvbGljeWFuZCBpcyBqdXN0IHJ1bm5pbmcgcG9saWN5IGV2ZW50cy4gSWYgYW5kIGlzIHdo
YXQgeW91IHdhbnRlZCB0aGlzPGJyPgpkb2VzIGl0IChyZXF1aXJlcyB0cG0yLWFicm1kIG9yIGRp
cmVjdCBkZXZpY2UgYWNjZXNzLCBubyBpbiBrZXJuZWwgcm0gL2Rldi90cG1ybTApOjxicj4KPGJy
Pgp0cG0yX3N0YXJ0YXV0aHNlc3Npb24gLVMgcy5kYXQ8YnI+CnRwbTJfcG9saWN5cGFzc3dvcmQg
LVMgcy5kYXQ8YnI+CnRwbTJfcG9saWN5cGNyIC1TIHMuZGF0IC1sIHNoYTI1NjowLDEsMiwzIC1M
IHBvbGljeS5kYXQ8YnI+CnRwbTJfbnZkZWZpbmUgLUMgbyAtcCBmb29iYXIgLXggMHgxNTAwMDE2
IC1zIDMyIC1MIHBvbGljeS5kYXQgLWEgJnF1b3Q7cG9saWN5cmVhZHxwb2xpY3l3cml0ZSZxdW90
Ozxicj4KdHBtMl9mbHVzaGNvbnRleHQgcy5kYXQ8YnI+CnJtIHMuZGF0PGJyPgo8YnI+CiMgcmVw
ZWF0cyBzdGVwcyB3aXRoIHJlYWwgcG9saWN5IHNlc3Npb248YnI+CnRwbTJfc3RhcnRhdXRoc2Vz
c2lvbiAtLXBvbGljeSAtUyBzLmRhdDxicj4KPGJyPgojIHdvcmtzPGJyPgp0cG0yX3BvbGljeXBh
c3N3b3JkIC1TIHMuZGF0PGJyPgp0cG0yX3BvbGljeXBjciAtUyBzLmRhdCAtbCBzaGEyNTY6MCwx
LDIsMyAtTCBwb2xpY3kuZGF0PGJyPgplY2hvICYjMzk7c2VjcmV0JiMzOTsgfCB0cG0yX252d3Jp
dGUgLVAgc2Vzc2lvbjpzLmRhdCtmb29iYXIgLXggMHgxNTAwMDE2PGJyPgo8YnI+CiMgdXBkYXRl
IFBDUnM8YnI+CnRwbTJfcGNyZXZlbnQgMCAmbHQ7Jmx0OyZsdDsgJiMzOTtkanNoZnNqZGhzZGpo
ZGZzJiMzOTs8YnI+Cjxicj4KIyBmYWlsczxicj4KZWNobyAmIzM5O3NlY3JldCYjMzk7IHwgdHBt
Ml9udndyaXRlIC1QIHNlc3Npb246cy5kYXQrZm9vYmFyIC14IDB4MTUwMDAxNjxicj4KV0FSTklO
Rzplc3lzOnNyYy90c3MyLWVzeXMvYXBpL0VzeXNfTlZfV3JpdGUuYzozMDY6RXN5c19OVl9Xcml0
ZV9GaW5pc2goKSBSZWNlaXZlZCBUUE0gRXJyb3IgPGJyPgpFUlJPUjplc3lzOnNyYy90c3MyLWVz
eXMvYXBpL0VzeXNfTlZfV3JpdGUuYzoxMTA6RXN5c19OVl9Xcml0ZSgpIEVzeXMgRmluaXNoIEVy
cm9yQ29kZSAoMHgwMDAwMDk5ZCkgPGJyPgpFUlJPUjogRmFpbGVkIHRvIHdyaXRlIE5WIGFyZWEg
YXQgaW5kZXggMHgxNTAwMDE2PGJyPgpFUlJPUjogVHNzMl9TeXNfTlZfV3JpdGUoMHg5OUQpIC0g
dHBtOnNlc3Npb24oMSk6YSBwb2xpY3kgY2hlY2sgZmFpbGVkPGJyPgpFUlJPUjogVW5hYmxlIHRv
IHJ1biB0cG0yX252d3JpdGU8YnI+Cjxicj4KLS0gZW5kIG9mIHNjcmlwdDxicj4KPGJyPgpJIGRp
ZG4mIzM5O3QgZ2V0IHBvbGljeW9yIHdvcmtpbmcsIEkgY291bGQgZ2V0IGl0IHRvIGF1dGggZm9y
IHRoZSBwYXNzd29yZCBzaWRlLCBidXQgbm90IHRoZSBwY3IgcGFydDxicj4KT2YgdGhlIG9yIGJy
YW5jaCwgbGlrZWx5IHNvbWV0aGluZyBJIGFtIG5vdCBnZXR0aW5nLiBTbyBpZiB5b3Ugd2FudCBP
UiwgSSBkb24mIzM5O3QgaGF2ZSB0aGUgYW5zd2VyPGJyPgphdCB0aGUgbW9tZW50Ljxicj4KPGJy
PgomZ3Q7IDxicj4KJmd0OyBJdCYjMzk7cyBiZSBhIG1peCBvZiB0cG0yX3N0YXJ0YXV0aHNlc3Np
b24sIHRwbTJfcG9saWN5cGFzc3dvcmQvdHBtMl9wb2xpY3lzZWNyZXQ8YnI+CiZndDsgdHBtMl9w
b2xpY3lwY3IgYW5kIHRwbTJfcG9saWN5YW5kLCB3aGljaCB3aWxsIGdpdmUgeW91IHNvbWUgcG9s
aWN5IGRpZ2VzdC4gVGhlbjxicj4KJmd0OyBjcmVhdGUgYW4gbnZzcGFjZSB3aXRoIHRoYXQgcG9s
aWN5IGRpZ2VzdCBhbmQgb25seSBwb2xpY3ljcmVhZHxwb2xpY3l3cml0ZS48YnI+CiZndDsgPGJy
PgomZ3Q7IEltcmFuIGNhbiBwcm9iYWJseSBnaXZlIHlvdSBhIGZ1bGwgZXhhbXBsZSB3aXRoIHBv
bGljeW9yLCB0aGVuIHdoZW4gd2UgaGF2ZTxicj4KJmd0OyBwb2xpY3lhbmQsIHlvdSBjYW4ganVz
dCBzd2FwIGl0IG91dCBvciB5b3UgY291bGQgd3JpdGUgcG9saWN5YW5kIGFuZCB1cHN0cmVhbSBp
dDxicj4KJmd0OyB0byB1cy48YnI+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============7979131498910414792==--

