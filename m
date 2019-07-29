Content-Type: multipart/mixed; boundary="===============7638508194552760099=="
MIME-Version: 1.0
From: Garrett Fields <ghfields at gmail.com>
Subject: Re: [tpm2] PCR Policy enforcement when using nvram
Date: Mon, 29 Jul 2019 12:17:43 -0400
Message-ID: <CA++-fmtn+9Z4ssEx3A+ONZTpH-f2OO7UHMR3hZokkvPuf+1=1w@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DD3E14@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7638508194552760099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2019 at 10:42 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

>
> Can't you do tpm2_nvreadlock?
>

Indeed.  That's the TPM 2.0 way I got this to work.  Set "read_stclear"
attribute and run tpm2_nvreadlock.

>
> Per section 37.2.5 of
> https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1-A=
rchitecture-01.38.pdf
> TPMA_NV_AUTHREAD allows the Index to be read using the authValue of the
> Index; and
> TPMA_NV_POLICYREAD allows the Index to be read if the authPolicy of the
> Index is satisfied.
> ---
>
> I think you're ending up in an OR situation, AUTH value OR policy. IIRC,
> Javier hit this issue too, I
> added him to see if he can enlighten us.
>
> FYI you should use tpm2_policyauthorize, locking to PCR values is brittle.
> If anything changes, you
> can lock yourself out of the object. This way you lock it to a signed
> policy and that policy can
> change. Ie PCR values change on update.
>
> I was trying to avoid the authValue OR authPolicy situation.  I thought
that only specifying the authValue to unlock and having a policy present
would do an authValue AND authPolicy.  Otherwise it seems pointless to be
able to attach a policy without any policy related attributes.  Since this
is autounlock of drive encryption, I was hoping to make any system twitch
fail the TPM assisted autounlock and require the user to directly enter the
passphrase in a non-tpm prompt.  In order to re-enable the autounlock, the
nvram region would be deleted and recreated.  The authPolicy would check
the PCRs while the authValue, since it is the filesystem's GUID, verifies
it was created for the correct filesystem and in the event someone is
playing around with disposed equipment with drives removed, recovery of the
stored password in a non-cleared TPM would not be possible.  Later, instead
of a GUID, I could use a usb device or a connection to a server to be
present to retrieve the NVRAM authValue, that unlocks the region.

>
> > ------
> >
> > I would really like to incorporate the pcr system check also (kinda the
> whole
> > point).  I tried:
> > -----------
> > tpm2_listpcrs --tcti=3Ddevice    #To see current values
> > tpm2_createpolicy -L sha1:0,1,2,3,4,5,6,7 -o ./0-7policy.pol --policy-p=
cr
> >
> > tpm2_nvdefine -x 0x1000000 -a o -P ownerpass -p indexsecret -L
> ./0-7policy.pol -
> > b "authread|authwrite|read_stclear" -s 11
> >
> > echo "hdpassword" | tpm2_nvwrite  -x 0x1000000 -a 0x1000000 -P
> indexsecret
> >
> > tpm2_nvlist   # Verfiied that 0x1000000 has a "authorization policy"
> > tpm2_nvread -x 0x1000000 -a 0x1000000 -P indexsecret   #Expected to work
> since
> > PCRs are the same as policy creation
> > tpm2_pcrextend 4:sha1=3Df1d2d2f924e986ac86fdf7b36c94bcdf32beec15
> >
> > tpm2_listpcrs    #Verify pcr4 is different
> > tpm2_nvread -x 0x1000000 -a 0x1000000 -P indexsecret   #Expected to fail
> > -----------
> > The last line I would expect to fail, because of the PCR4 change, but it
> still
> > produces the password.  Am I missing something on the nvdefine to enable
> > policy enforcement?
>
> I think if you dropped that password it would fail on both commands. You
> need
> To ensure that TPMA_NV_POLICYREAD is in there. Looking at 3.X and master
> branch, I don't see us checking if -L is specified and adding
> TPMA_NV_POLICYREAD
> so it's something you would have to do via attributes.
>
> I believe your right.  If I used policyRead only and gave up on policyAuth
(and the -P switch), it would have succeeded and failed as expected.  I'm
just hoping I can get it to get both working simultaneously.

I really appreciate your response.  I'll play around with object
workflow.  If anyone has tips on making authValue AND authPolicy apply to
nvram or have a comparable method with objects, I'd love to hear them.

--===============7638508194552760099==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1vbiwgSnVs
IDI5LCAyMDE5IGF0IDEwOjQyIEFNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFp
bHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwu
Y29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90
ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQg
cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48YnI+CkNhbiYjMzk7dCB5b3UgZG8g
dHBtMl9udnJlYWRsb2NrPzxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5JbmRl
ZWQuwqAgVGhhdCYjMzk7cyB0aGUgVFBNIDIuMCB3YXkgSSBnb3QgdGhpcyB0byB3b3JrLsKgIFNl
dCAmcXVvdDtyZWFkX3N0Y2xlYXImcXVvdDsgYXR0cmlidXRlIGFuZCBydW4gdHBtMl9udnJlYWRs
b2NrLjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjow
cHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtw
YWRkaW5nLWxlZnQ6MWV4Ij48YnI+ClBlciBzZWN0aW9uIDM3LjIuNSBvZiA8YSBocmVmPSJodHRw
czovL3RydXN0ZWRjb21wdXRpbmdncm91cC5vcmcvd3AtY29udGVudC91cGxvYWRzL1RQTS1SZXYt
Mi4wLVBhcnQtMS1BcmNoaXRlY3R1cmUtMDEuMzgucGRmIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91cC5vcmcvd3AtY29udGVudC91
cGxvYWRzL1RQTS1SZXYtMi4wLVBhcnQtMS1BcmNoaXRlY3R1cmUtMDEuMzgucGRmPC9hPjxicj4K
VFBNQV9OVl9BVVRIUkVBRCBhbGxvd3MgdGhlIEluZGV4IHRvIGJlIHJlYWQgdXNpbmcgdGhlIGF1
dGhWYWx1ZSBvZiB0aGUgSW5kZXg7IGFuZDxicj4KVFBNQV9OVl9QT0xJQ1lSRUFEIGFsbG93cyB0
aGUgSW5kZXggdG8gYmUgcmVhZCBpZiB0aGUgYXV0aFBvbGljeSBvZiB0aGUgSW5kZXggaXMgc2F0
aXNmaWVkLjxicj4KLS0tPGJyPgo8YnI+CkkgdGhpbmsgeW91JiMzOTtyZSBlbmRpbmcgdXAgaW4g
YW4gT1Igc2l0dWF0aW9uLCBBVVRIIHZhbHVlIE9SIHBvbGljeS4gSUlSQywgSmF2aWVyIGhpdCB0
aGlzIGlzc3VlIHRvbywgSTxicj4KYWRkZWQgaGltIHRvIHNlZSBpZiBoZSBjYW4gZW5saWdodGVu
IHVzLjxicj4KPGJyPgpGWUkgeW91IHNob3VsZCB1c2UgdHBtMl9wb2xpY3lhdXRob3JpemUsIGxv
Y2tpbmcgdG8gUENSIHZhbHVlcyBpcyBicml0dGxlLiBJZiBhbnl0aGluZyBjaGFuZ2VzLCB5b3U8
YnI+CmNhbiBsb2NrIHlvdXJzZWxmIG91dCBvZiB0aGUgb2JqZWN0LiBUaGlzIHdheSB5b3UgbG9j
ayBpdCB0byBhIHNpZ25lZCBwb2xpY3kgYW5kIHRoYXQgcG9saWN5IGNhbjxicj4KY2hhbmdlLiBJ
ZSBQQ1IgdmFsdWVzIGNoYW5nZSBvbiB1cGRhdGUuPGJyPgo8YnI+PC9ibG9ja3F1b3RlPjxkaXY+
SSB3YXMgdHJ5aW5nIHRvIGF2b2lkIHRoZSBhdXRoVmFsdWUgT1IgYXV0aFBvbGljeSBzaXR1YXRp
b24uwqAgSSB0aG91Z2h0IHRoYXQgb25seSBzcGVjaWZ5aW5nIHRoZSBhdXRoVmFsdWUgdG8gdW5s
b2NrIGFuZCBoYXZpbmcgYSBwb2xpY3kgcHJlc2VudCB3b3VsZCBkbyBhbiBhdXRoVmFsdWUgQU5E
IGF1dGhQb2xpY3kuwqAgT3RoZXJ3aXNlIGl0IHNlZW1zIHBvaW50bGVzcyB0byBiZSBhYmxlIHRv
IGF0dGFjaCBhIHBvbGljeSB3aXRob3V0IGFueSBwb2xpY3kgcmVsYXRlZCBhdHRyaWJ1dGVzLsKg
IFNpbmNlIHRoaXMgaXMgYXV0b3VubG9jayBvZiBkcml2ZSBlbmNyeXB0aW9uLCBJIHdhcyBob3Bp
bmcgdG8gbWFrZSBhbnkgc3lzdGVtIHR3aXRjaCBmYWlsIHRoZSBUUE0gYXNzaXN0ZWQgYXV0b3Vu
bG9jayBhbmQgcmVxdWlyZSB0aGUgdXNlciB0byBkaXJlY3RseSBlbnRlciB0aGUgcGFzc3BocmFz
ZSBpbiBhIG5vbi10cG0gcHJvbXB0LsKgIEluIG9yZGVyIHRvIHJlLWVuYWJsZSB0aGUgYXV0b3Vu
bG9jaywgdGhlIG52cmFtIHJlZ2lvbiB3b3VsZCBiZSBkZWxldGVkIGFuZCByZWNyZWF0ZWQuwqAg
VGhlIGF1dGhQb2xpY3kgd291bGQgY2hlY2sgdGhlIFBDUnMgd2hpbGUgdGhlIGF1dGhWYWx1ZSwg
c2luY2UgaXQgaXMgdGhlIGZpbGVzeXN0ZW0mIzM5O3MgR1VJRCwgdmVyaWZpZXMgaXQgd2FzIGNy
ZWF0ZWQgZm9yIHRoZSBjb3JyZWN0IGZpbGVzeXN0ZW0gYW5kIGluIHRoZSBldmVudCBzb21lb25l
IGlzIHBsYXlpbmcgYXJvdW5kIHdpdGggZGlzcG9zZWQgZXF1aXBtZW50IHdpdGggZHJpdmVzIHJl
bW92ZWQsIHJlY292ZXJ5IG9mIHRoZSBzdG9yZWQgcGFzc3dvcmQgaW4gYSBub24tY2xlYXJlZCBU
UE0gd291bGQgbm90IGJlIHBvc3NpYmxlLsKgIExhdGVyLCBpbnN0ZWFkIG9mIGEgR1VJRCwgSSBj
b3VsZCB1c2UgYSB1c2IgZGV2aWNlIG9yIGEgY29ubmVjdGlvbiB0byBhIHNlcnZlciB0byBiZSBw
cmVzZW50IHRvIHJldHJpZXZlIHRoZSBOVlJBTSBhdXRoVmFsdWUsIHRoYXQgdW5sb2NrcyB0aGUg
cmVnaW9uLsKgwqA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNv
bGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+CiZndDsgPGJyPgomZ3Q7IC0t
LS0tLTxicj4KJmd0OyA8YnI+CiZndDsgSSB3b3VsZCByZWFsbHkgbGlrZSB0byBpbmNvcnBvcmF0
ZSB0aGUgcGNyIHN5c3RlbSBjaGVjayBhbHNvIChraW5kYSB0aGUgd2hvbGU8YnI+CiZndDsgcG9p
bnQpLsKgIEkgdHJpZWQ6PGJyPgomZ3Q7IC0tLS0tLS0tLS0tPGJyPgomZ3Q7IHRwbTJfbGlzdHBj
cnMgLS10Y3RpPWRldmljZcKgIMKgICNUbyBzZWUgY3VycmVudCB2YWx1ZXM8YnI+CiZndDsgdHBt
Ml9jcmVhdGVwb2xpY3kgLUwgc2hhMTowLDEsMiwzLDQsNSw2LDcgLW8gLi8wLTdwb2xpY3kucG9s
IC0tcG9saWN5LXBjcjxicj4KJmd0OyA8YnI+CiZndDsgdHBtMl9udmRlZmluZSAteCAweDEwMDAw
MDAgLWEgbyAtUCBvd25lcnBhc3MgLXAgaW5kZXhzZWNyZXQgLUwgLi8wLTdwb2xpY3kucG9sIC08
YnI+CiZndDsgYiAmcXVvdDthdXRocmVhZHxhdXRod3JpdGV8cmVhZF9zdGNsZWFyJnF1b3Q7IC1z
IDExPGJyPgomZ3Q7IDxicj4KJmd0OyBlY2hvICZxdW90O2hkcGFzc3dvcmQmcXVvdDsgfCB0cG0y
X252d3JpdGXCoCAteCAweDEwMDAwMDAgLWEgMHgxMDAwMDAwIC1QIGluZGV4c2VjcmV0PGJyPgom
Z3Q7IDxicj4KJmd0OyB0cG0yX252bGlzdMKgIMKgIyBWZXJmaWllZCB0aGF0IDB4MTAwMDAwMCBo
YXMgYSAmcXVvdDthdXRob3JpemF0aW9uIHBvbGljeSZxdW90Ozxicj4KJmd0OyB0cG0yX252cmVh
ZCAteCAweDEwMDAwMDAgLWEgMHgxMDAwMDAwIC1QIGluZGV4c2VjcmV0wqAgwqAjRXhwZWN0ZWQg
dG8gd29yayBzaW5jZTxicj4KJmd0OyBQQ1JzIGFyZSB0aGUgc2FtZSBhcyBwb2xpY3kgY3JlYXRp
b248YnI+CiZndDsgdHBtMl9wY3JleHRlbmQgNDpzaGExPWYxZDJkMmY5MjRlOTg2YWM4NmZkZjdi
MzZjOTRiY2RmMzJiZWVjMTU8YnI+CiZndDsgPGJyPgomZ3Q7IHRwbTJfbGlzdHBjcnPCoCDCoCAj
VmVyaWZ5IHBjcjQgaXMgZGlmZmVyZW50PGJyPgomZ3Q7IHRwbTJfbnZyZWFkIC14IDB4MTAwMDAw
MCAtYSAweDEwMDAwMDAgLVAgaW5kZXhzZWNyZXTCoCDCoCNFeHBlY3RlZCB0byBmYWlsPGJyPgom
Z3Q7IC0tLS0tLS0tLS0tPGJyPgomZ3Q7IFRoZSBsYXN0IGxpbmUgSSB3b3VsZCBleHBlY3QgdG8g
ZmFpbCwgYmVjYXVzZSBvZiB0aGUgUENSNCBjaGFuZ2UsIGJ1dCBpdCBzdGlsbDxicj4KJmd0OyBw
cm9kdWNlcyB0aGUgcGFzc3dvcmQuwqAgQW0gSSBtaXNzaW5nIHNvbWV0aGluZyBvbiB0aGUgbnZk
ZWZpbmUgdG8gZW5hYmxlPGJyPgomZ3Q7IHBvbGljeSBlbmZvcmNlbWVudD88YnI+Cjxicj4KSSB0
aGluayBpZiB5b3UgZHJvcHBlZCB0aGF0IHBhc3N3b3JkIGl0IHdvdWxkIGZhaWwgb24gYm90aCBj
b21tYW5kcy4gWW91IG5lZWQ8YnI+ClRvIGVuc3VyZSB0aGF0IFRQTUFfTlZfUE9MSUNZUkVBRCBp
cyBpbiB0aGVyZS4gTG9va2luZyBhdCAzLlggYW5kIG1hc3Rlcjxicj4KYnJhbmNoLCBJIGRvbiYj
Mzk7dCBzZWUgdXMgY2hlY2tpbmcgaWYgLUwgaXMgc3BlY2lmaWVkIGFuZCBhZGRpbmcgVFBNQV9O
Vl9QT0xJQ1lSRUFEPGJyPgpzbyBpdCYjMzk7cyBzb21ldGhpbmcgeW91IHdvdWxkIGhhdmUgdG8g
ZG8gdmlhIGF0dHJpYnV0ZXMuPGJyPjxicj48L2Jsb2NrcXVvdGU+PGRpdj5JIGJlbGlldmUgeW91
ciByaWdodC7CoCBJZiBJIHVzZWQgcG9saWN5UmVhZCBvbmx5IGFuZCBnYXZlIHVwIG9uIHBvbGlj
eUF1dGggKGFuZCB0aGUgLVAgc3dpdGNoKSwgaXQgd291bGQgaGF2ZSBzdWNjZWVkZWQgYW5kIGZh
aWxlZCBhcyBleHBlY3RlZC7CoCBJJiMzOTttIGp1c3QgaG9waW5nIEkgY2FuIGdldCBpdCB0byBn
ZXQgYm90aCB3b3JraW5nIHNpbXVsdGFuZW91c2x5LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
SSByZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIHJlc3BvbnNlLsKgIEkmIzM5O2xsIHBsYXkgYXJvdW5k
IHdpdGggb2JqZWN0wqAgd29ya2Zsb3cuwqAgSWYgYW55b25lIGhhcyB0aXBzIG9uIG1ha2luZyBh
dXRoVmFsdWUgQU5EIGF1dGhQb2xpY3kgYXBwbHkgdG8gbnZyYW0gb3IgaGF2ZSBhIGNvbXBhcmFi
bGUgbWV0aG9kIHdpdGggb2JqZWN0cywgSSYjMzk7ZCBsb3ZlIHRvIGhlYXIgdGhlbS48L2Rpdj48
L2Rpdj48L2Rpdj4K

--===============7638508194552760099==--

