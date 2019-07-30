Content-Type: multipart/mixed; boundary="===============0045921575172128213=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] PCR Policy enforcement when using nvram
Date: Tue, 30 Jul 2019 08:28:03 +0000
Message-ID: <11C292BF-F365-4E0F-ABD8-0D98A75ADBDE@intel.com>
In-Reply-To: CA++-fmvSrxcG4hE2sgx0rBnhtHWDbKDGhXOQNHp_LQ1KLut28w@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0045921575172128213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Starting a policy session and extending with multiple policies is the same =
as policyAnd.

Thanks and Regards,

Imran Desai


On Jul 29, 2019, at 7:08 PM, Garrett Fields <ghfields(a)gmail.com<mailto:gh=
fields(a)gmail.com>> wrote:

I really appreciate your responses.  I understand the policyAnd tool might =
not be an option yet.  Either way there seems to be a lot to learn about po=
licies.  You've given me some new avenues to explore.



On Mon, Jul 29, 2019, 7:56 PM Roberts, William C <william.c.roberts(a)intel=
.com<mailto:william.c.roberts(a)intel.com>> wrote:
<snip>
> > >
> > > I believe your right.  If I used policyRead only and gave up on
> > > policyAuth (and the -P switch), it would have succeeded and failed
> > > as expected.  I'm just hoping I can get it to get both working simult=
aneously.
> > >
> > > I really appreciate your response.  I'll play around with object
> > > workflow.  If anyone has tips on making authValue AND authPolicy
> > > apply to nvram or have a comparable method with objects, I'd love to =
hear
> them.
>
>
> I misunderstood...you want BOTH.. then you need to create a policy to do =
what
> you desire and only enable policy authorization. Which means you would ne=
ed
> policyand, which we don't have on master yet, just policyor.

Geez, I had a moment. The policyand is just running policy events. If and i=
s what you wanted this
does it (requires tpm2-abrmd or direct device access, no in kernel rm /dev/=
tpmrm0):

tpm2_startauthsession -S s.dat
tpm2_policypassword -S s.dat
tpm2_policypcr -S s.dat -l sha256:0,1,2,3 -L policy.dat
tpm2_nvdefine -C o -p foobar -x 0x1500016 -s 32 -L policy.dat -a "policyrea=
d|policywrite"
tpm2_flushcontext s.dat
rm s.dat

# repeats steps with real policy session
tpm2_startauthsession --policy -S s.dat

# works
tpm2_policypassword -S s.dat
tpm2_policypcr -S s.dat -l sha256:0,1,2,3 -L policy.dat
echo 'secret' | tpm2_nvwrite -P session:s.dat+foobar -x 0x1500016

# update PCRs
tpm2_pcrevent 0 <<< 'djshfsjdhsdjhdfs'

# fails
echo 'secret' | tpm2_nvwrite -P session:s.dat+foobar -x 0x1500016
WARNING:esys:src/tss2-esys/api/Esys_NV_Write.c:306:Esys_NV_Write_Finish() R=
eceived TPM Error
ERROR:esys:src/tss2-esys/api/Esys_NV_Write.c:110:Esys_NV_Write() Esys Finis=
h ErrorCode (0x0000099d)
ERROR: Failed to write NV area at index 0x1500016
ERROR: Tss2_Sys_NV_Write(0x99D) - tpm:session(1):a policy check failed
ERROR: Unable to run tpm2_nvwrite

-- end of script

I didn't get policyor working, I could get it to auth for the password side=
, but not the pcr part
Of the or branch, likely something I am not getting. So if you want OR, I d=
on't have the answer
at the moment.

>
> It's be a mix of tpm2_startauthsession, tpm2_policypassword/tpm2_policyse=
cret
> tpm2_policypcr and tpm2_policyand, which will give you some policy digest=
. Then
> create an nvspace with that policy digest and only policycread|policywrit=
e.
>
> Imran can probably give you a full example with policyor, then when we ha=
ve
> policyand, you can just swap it out or you could write policyand and upst=
ream it
> to us.

--===============0045921575172128213==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjwvaGVhZD4KPGJvZHkgZGlyPSJhdXRvIj4KU3Rh
cnRpbmcgYSBwb2xpY3kgc2Vzc2lvbiBhbmQgZXh0ZW5kaW5nIHdpdGggbXVsdGlwbGUgcG9saWNp
ZXMgaXMgdGhlIHNhbWUgYXMgcG9saWN5QW5kLgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+VGhhbmtz
IGFuZCBSZWdhcmRzLDxicj4KPGJyPgo8ZGl2IGRpcj0ibHRyIiBpZD0iQXBwbGVNYWlsU2lnbmF0
dXJlIj5JbXJhbiBEZXNhaQo8ZGl2Pjxicj4KPC9kaXY+CjwvZGl2Pgo8ZGl2IGRpcj0ibHRyIj48
YnI+Ck9uIEp1bCAyOSwgMjAxOSwgYXQgNzowOCBQTSwgR2FycmV0dCBGaWVsZHMgJmx0OzxhIGhy
ZWY9Im1haWx0bzpnaGZpZWxkc0BnbWFpbC5jb20iPmdoZmllbGRzQGdtYWlsLmNvbTwvYT4mZ3Q7
IHdyb3RlOjxicj4KPGJyPgo8L2Rpdj4KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CjxkaXYgZGly
PSJsdHIiPgo8ZGl2IGRpcj0iYXV0byI+SSByZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIHJlc3BvbnNl
cy4mbmJzcDsgSSB1bmRlcnN0YW5kIHRoZSBwb2xpY3lBbmQgdG9vbCBtaWdodCBub3QgYmUgYW4g
b3B0aW9uIHlldC4mbmJzcDsgRWl0aGVyIHdheSB0aGVyZSBzZWVtcyB0byBiZSBhIGxvdCB0byBs
ZWFybiBhYm91dCBwb2xpY2llcy4mbmJzcDsgWW91J3ZlIGdpdmVuIG1lIHNvbWUgbmV3IGF2ZW51
ZXMgdG8gZXhwbG9yZS4KPGRpdiBkaXI9ImF1dG8iPjxicj4KPC9kaXY+CjxkaXYgZGlyPSJhdXRv
Ij48YnI+CjwvZGl2Pgo8L2Rpdj4KPGJyPgo8ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+CjxkaXYg
ZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24sIEp1bCAyOSwgMjAxOSwgNzo1NiBQ
TSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0
c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPndpbGxpYW0uYy5y
b2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4KPC9kaXY+CjxibG9ja3F1b3RlIGNs
YXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFw
eCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPgombHQ7c25pcCZndDs8YnI+CiZndDsgJmd0
OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgJmd0OyBJIGJlbGlldmUgeW91ciByaWdodC4mbmJzcDsgSWYg
SSB1c2VkIHBvbGljeVJlYWQgb25seSBhbmQgZ2F2ZSB1cCBvbjxicj4KJmd0OyAmZ3Q7ICZndDsg
cG9saWN5QXV0aCAoYW5kIHRoZSAtUCBzd2l0Y2gpLCBpdCB3b3VsZCBoYXZlIHN1Y2NlZWRlZCBh
bmQgZmFpbGVkPGJyPgomZ3Q7ICZndDsgJmd0OyBhcyBleHBlY3RlZC4mbmJzcDsgSSdtIGp1c3Qg
aG9waW5nIEkgY2FuIGdldCBpdCB0byBnZXQgYm90aCB3b3JraW5nIHNpbXVsdGFuZW91c2x5Ljxi
cj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyAmZ3Q7IEkgcmVhbGx5IGFwcHJlY2lhdGUg
eW91ciByZXNwb25zZS4mbmJzcDsgSSdsbCBwbGF5IGFyb3VuZCB3aXRoIG9iamVjdDxicj4KJmd0
OyAmZ3Q7ICZndDsgd29ya2Zsb3cuJm5ic3A7IElmIGFueW9uZSBoYXMgdGlwcyBvbiBtYWtpbmcg
YXV0aFZhbHVlIEFORCBhdXRoUG9saWN5PGJyPgomZ3Q7ICZndDsgJmd0OyBhcHBseSB0byBudnJh
bSBvciBoYXZlIGEgY29tcGFyYWJsZSBtZXRob2Qgd2l0aCBvYmplY3RzLCBJJ2QgbG92ZSB0byBo
ZWFyPGJyPgomZ3Q7IHRoZW0uPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgSSBtaXN1bmRl
cnN0b29kLi4ueW91IHdhbnQgQk9USC4uIHRoZW4geW91IG5lZWQgdG8gY3JlYXRlIGEgcG9saWN5
IHRvIGRvIHdoYXQ8YnI+CiZndDsgeW91IGRlc2lyZSBhbmQgb25seSBlbmFibGUgcG9saWN5IGF1
dGhvcml6YXRpb24uIFdoaWNoIG1lYW5zIHlvdSB3b3VsZCBuZWVkPGJyPgomZ3Q7IHBvbGljeWFu
ZCwgd2hpY2ggd2UgZG9uJ3QgaGF2ZSBvbiBtYXN0ZXIgeWV0LCBqdXN0IHBvbGljeW9yLjxicj4K
PGJyPgpHZWV6LCBJIGhhZCBhIG1vbWVudC4gVGhlIHBvbGljeWFuZCBpcyBqdXN0IHJ1bm5pbmcg
cG9saWN5IGV2ZW50cy4gSWYgYW5kIGlzIHdoYXQgeW91IHdhbnRlZCB0aGlzPGJyPgpkb2VzIGl0
IChyZXF1aXJlcyB0cG0yLWFicm1kIG9yIGRpcmVjdCBkZXZpY2UgYWNjZXNzLCBubyBpbiBrZXJu
ZWwgcm0gL2Rldi90cG1ybTApOjxicj4KPGJyPgp0cG0yX3N0YXJ0YXV0aHNlc3Npb24gLVMgcy5k
YXQ8YnI+CnRwbTJfcG9saWN5cGFzc3dvcmQgLVMgcy5kYXQ8YnI+CnRwbTJfcG9saWN5cGNyIC1T
IHMuZGF0IC1sIHNoYTI1NjowLDEsMiwzIC1MIHBvbGljeS5kYXQ8YnI+CnRwbTJfbnZkZWZpbmUg
LUMgbyAtcCBmb29iYXIgLXggMHgxNTAwMDE2IC1zIDMyIC1MIHBvbGljeS5kYXQgLWEgJnF1b3Q7
cG9saWN5cmVhZHxwb2xpY3l3cml0ZSZxdW90Ozxicj4KdHBtMl9mbHVzaGNvbnRleHQgcy5kYXQ8
YnI+CnJtIHMuZGF0PGJyPgo8YnI+CiMgcmVwZWF0cyBzdGVwcyB3aXRoIHJlYWwgcG9saWN5IHNl
c3Npb248YnI+CnRwbTJfc3RhcnRhdXRoc2Vzc2lvbiAtLXBvbGljeSAtUyBzLmRhdDxicj4KPGJy
PgojIHdvcmtzPGJyPgp0cG0yX3BvbGljeXBhc3N3b3JkIC1TIHMuZGF0PGJyPgp0cG0yX3BvbGlj
eXBjciAtUyBzLmRhdCAtbCBzaGEyNTY6MCwxLDIsMyAtTCBwb2xpY3kuZGF0PGJyPgplY2hvICdz
ZWNyZXQnIHwgdHBtMl9udndyaXRlIC1QIHNlc3Npb246cy5kYXQmIzQzO2Zvb2JhciAteCAweDE1
MDAwMTY8YnI+Cjxicj4KIyB1cGRhdGUgUENSczxicj4KdHBtMl9wY3JldmVudCAwICZsdDsmbHQ7
Jmx0OyAnZGpzaGZzamRoc2RqaGRmcyc8YnI+Cjxicj4KIyBmYWlsczxicj4KZWNobyAnc2VjcmV0
JyB8IHRwbTJfbnZ3cml0ZSAtUCBzZXNzaW9uOnMuZGF0JiM0Mztmb29iYXIgLXggMHgxNTAwMDE2
PGJyPgpXQVJOSU5HOmVzeXM6c3JjL3RzczItZXN5cy9hcGkvRXN5c19OVl9Xcml0ZS5jOjMwNjpF
c3lzX05WX1dyaXRlX0ZpbmlzaCgpIFJlY2VpdmVkIFRQTSBFcnJvcgo8YnI+CkVSUk9SOmVzeXM6
c3JjL3RzczItZXN5cy9hcGkvRXN5c19OVl9Xcml0ZS5jOjExMDpFc3lzX05WX1dyaXRlKCkgRXN5
cyBGaW5pc2ggRXJyb3JDb2RlICgweDAwMDAwOTlkKQo8YnI+CkVSUk9SOiBGYWlsZWQgdG8gd3Jp
dGUgTlYgYXJlYSBhdCBpbmRleCAweDE1MDAwMTY8YnI+CkVSUk9SOiBUc3MyX1N5c19OVl9Xcml0
ZSgweDk5RCkgLSB0cG06c2Vzc2lvbigxKTphIHBvbGljeSBjaGVjayBmYWlsZWQ8YnI+CkVSUk9S
OiBVbmFibGUgdG8gcnVuIHRwbTJfbnZ3cml0ZTxicj4KPGJyPgotLSBlbmQgb2Ygc2NyaXB0PGJy
Pgo8YnI+CkkgZGlkbid0IGdldCBwb2xpY3lvciB3b3JraW5nLCBJIGNvdWxkIGdldCBpdCB0byBh
dXRoIGZvciB0aGUgcGFzc3dvcmQgc2lkZSwgYnV0IG5vdCB0aGUgcGNyIHBhcnQ8YnI+Ck9mIHRo
ZSBvciBicmFuY2gsIGxpa2VseSBzb21ldGhpbmcgSSBhbSBub3QgZ2V0dGluZy4gU28gaWYgeW91
IHdhbnQgT1IsIEkgZG9uJ3QgaGF2ZSB0aGUgYW5zd2VyPGJyPgphdCB0aGUgbW9tZW50Ljxicj4K
PGJyPgomZ3Q7IDxicj4KJmd0OyBJdCdzIGJlIGEgbWl4IG9mIHRwbTJfc3RhcnRhdXRoc2Vzc2lv
biwgdHBtMl9wb2xpY3lwYXNzd29yZC90cG0yX3BvbGljeXNlY3JldDxicj4KJmd0OyB0cG0yX3Bv
bGljeXBjciBhbmQgdHBtMl9wb2xpY3lhbmQsIHdoaWNoIHdpbGwgZ2l2ZSB5b3Ugc29tZSBwb2xp
Y3kgZGlnZXN0LiBUaGVuPGJyPgomZ3Q7IGNyZWF0ZSBhbiBudnNwYWNlIHdpdGggdGhhdCBwb2xp
Y3kgZGlnZXN0IGFuZCBvbmx5IHBvbGljeWNyZWFkfHBvbGljeXdyaXRlLjxicj4KJmd0OyA8YnI+
CiZndDsgSW1yYW4gY2FuIHByb2JhYmx5IGdpdmUgeW91IGEgZnVsbCBleGFtcGxlIHdpdGggcG9s
aWN5b3IsIHRoZW4gd2hlbiB3ZSBoYXZlPGJyPgomZ3Q7IHBvbGljeWFuZCwgeW91IGNhbiBqdXN0
IHN3YXAgaXQgb3V0IG9yIHlvdSBjb3VsZCB3cml0ZSBwb2xpY3lhbmQgYW5kIHVwc3RyZWFtIGl0
PGJyPgomZ3Q7IHRvIHVzLjxicj4KPC9ibG9ja3F1b3RlPgo8L2Rpdj4KPC9kaXY+CjwvYmxvY2tx
dW90ZT4KPC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============0045921575172128213==--

