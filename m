Content-Type: multipart/mixed; boundary="===============6889598157329984973=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Are there any help documents/sites on writing an ESAPI
 program.
Date: Thu, 30 Apr 2020 11:29:02 -0700
Message-ID: <CAOCvsSkFQO_xfx68Gu7EHG1Q51C99MPdnOJ5dZWkLRS_XMrV1g@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649ED8C53@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6889598157329984973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If you're getting your Private and Public from the same keypair for an ECDH
Zgen that's almost certainly why it's breaking.  As far as I know the
inpoint should be the public key of the other side of the conversation, and
the x coordinate of the output point should be the shared secret.  At least
if the command does what I think it does.
As I understand it if you want to double check your results you can derive
the same shared secret from the other side of the channel, using their
private key and the TPM key's public.  For example using openssl it would
be:
openssl pkeyutl -derive -inkey software.priv.pem -peerkey tpm.pub.pem -out
shared.secret
The shared secrets derived on both sides of the channel are the same but
only public keys are exchanged and verified.  Hence why it's Elliptic Curve
Diffie-Hellman.

The other ECDH commands are for less trivial cases involving more ephemeral
keypairs and the like.

On Thu, Apr 30, 2020 at 9:27 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> I took a few minutes and created a skeleton tool that calls ecdg zgen:
> https://github.com/williamcroberts/tpm2.0-tools/tree/zgen
>
> If you build that branch you will see the tool tpm2_ecdhzgen. You can
> Call that command abd it will run, but has some errors, you need to
> Figure out what to do with in point and out point parameters.
>
>     // Test setup
>     tpm2_createprimary -c primary.ctx
>     tpm2_create -C primary.ctx -G ecc256 -u ec.pub -r ec.priv
>     tpm2_load -C primary.ctx -u ec.pub -r ec.priv -c ec.ctx
>
>     // Command fails...but runs!
>     tpm2_ecdhzgen -c ec.ctx
>     ERROR: Esys_RSA_Decrypt(0x1E7) - tpm:parameter(1):point is not on the
> required curve
>
>
> > -----Original Message-----
> > From: Roberts, William C
> > Sent: Thursday, April 30, 2020 10:59 AM
> > To: 'Steven Clark' <davolfman(a)gmail.com>; 'tpm2' <tpm2(a)lists.01.org>
> > Subject: RE: [tpm2] Are there any help documents/sites on writing an
> ESAPI
> > program.
> >
> > The Esys integration tests are also super helpful:
> > https://github.com/tpm2-software/tpm2-
> > tss/blob/master/test/integration/esys-ecdh-zgen.int.c
> >
> >
> > > -----Original Message-----
> > > From: Roberts, William C
> > > Sent: Thursday, April 30, 2020 10:44 AM
> > > To: 'Steven Clark' <davolfman(a)gmail.com>; tpm2 <tpm2(a)lists.01.org>
> > > Subject: RE: [tpm2] Are there any help documents/sites on writing an
> > > ESAPI program.
> > >
> > > The tools themselves are real world examples.
> > >
> > > You shouldn't go digging into the ESYS_CONTEXT or TCTI_CONTEXT but the
> > > structure parameters And returns to ESYS calls you can. Its set up
> > > where you can't go structure digging and compile with the include
> > > directory includes (https://github.com/tpm2-software/tpm2-
> > tss/tree/master/include/tss2).
> > > If you add includes from the project that exist elsewhere you're doing
> it wrong.
> > >
> > > Now for the ZGen code, we actually want to add it to tools. Its
> > > actually on the short list of commands To add, see bug:
> > > https://github.com/tpm2-
> > > software/tpm2-tools/issues/877
> > >
> > > The reason we didn't add it yet, is we didn't know exactly how it
> > > works and to test it. Imran and I Actually have a meeting with someone
> > > way more knowledgeable on ECC to help us along. We would Love, even
> > > just sample code to help us out, or if you created the tool even
> > > better. Anything you can Share back is a win.
> > >
> > >
> > > Now for taking the training wheels off, Esys_Initialize(), you can
> > > leave off the tcti and abi pointers by passing NULL. That should just
> > > get you a context with the TPM and away you go. Here is a very simple
> > > program to start
> > > With:
> > > https://gist.github.com/williamcroberts/66a7dab3adfb973fbae32199545350
> > > 09
> > >
> > > You can alter that by changing the template and making an EC key to
> > > play with, or have it pass in blobs from tpm2_create tool. Tpm2_create
> > > tool has the output options -u and -r that you can pass along, and
> load those up
> > by:
> > > 1. Desterilizing with libmu (offhand I think the calls will be
> > > Tss2_MU_TPM2B_PRIVATE_Unmarshal and
> > > Tss2_MU_TPM2B_PUBLIC_Unmarshal) 2. Calling Esys_Load() and getting the
> > > ESYS_TR handle to pass to the zgen routine
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Steven Clark [mailto:davolfman(a)gmail.com]
> > > > Sent: Wednesday, April 29, 2020 7:51 PM
> > > > To: tpm2 <tpm2(a)lists.01.org>
> > > > Subject: [tpm2] Are there any help documents/sites on writing an
> > > > ESAPI program.
> > > >
> > > > I need to perform a command that doesn't have a tools executable yet
> > > > (TPM2_ECDH_ZGen) and on a persistent object handle that won't be
> > > > compatible with the on-disk key-databases of FAPI or PKCS#11.  So
> > > > that means I need to write my own code in C, and that code needs to
> use the
> > ESAPI.
> > > >
> > > > I've had a lot of lead time to see this coming so I've done a few
> > > > little
> > > experiments.
> > > > They have not improved my confidence in my understanding of the API.
> > > > For example I'm still not sure which structures I'm supposed to
> > > > access directly and which ones are supposed to be manipulated using
> > functions.
> > > >
> > > > The Specs are either long and theoretical or dry and terse.  And
> > > > both the tests for TSS and the source files for Tools make use of
> > > > internal abstraction layers.  I'm having trouble getting a
> > > > whole-process picture.  Are there any resources out there to help me
> > > > get my sea-legs on ESAPI
> > > code?
>

--===============6889598157329984973==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SWYgeW91JiMzOTtyZSBnZXR0aW5nIHlvdXIgUHJpdmF0ZSBhbmQgUHVi
bGljIGZyb20gdGhlIHNhbWUga2V5cGFpciBmb3IgYW4gRUNESCBaZ2VuIHRoYXQmIzM5O3MgYWxt
b3N0IGNlcnRhaW5seSB3aHkgaXQmIzM5O3MgYnJlYWtpbmcuwqAgQXMgZmFyIGFzIEkga25vdyB0
aGUgaW5wb2ludCBzaG91bGQgYmUgdGhlIHB1YmxpYyBrZXkgb2YgdGhlIG90aGVyIHNpZGUgb2Yg
dGhlIGNvbnZlcnNhdGlvbiwgYW5kIHRoZSB4IGNvb3JkaW5hdGUgb2YgdGhlIG91dHB1dCBwb2lu
dCBzaG91bGQgYmUgdGhlIHNoYXJlZCBzZWNyZXQuwqAgQXQgbGVhc3QgaWYgdGhlIGNvbW1hbmQg
ZG9lcyB3aGF0IEkgdGhpbmsgaXQgZG9lcy48YnI+QXMgSSB1bmRlcnN0YW5kIGl0IGlmIHlvdSB3
YW50IHRvIGRvdWJsZcKgY2hlY2sgeW91ciByZXN1bHRzIHlvdSBjYW4gZGVyaXZlIHRoZSBzYW1l
IHNoYXJlZCBzZWNyZXQgZnJvbSB0aGUgb3RoZXIgc2lkZSBvZiB0aGUgY2hhbm5lbCzCoHVzaW5n
IHRoZWlyIHByaXZhdGUga2V5IGFuZCB0aGUgVFBNIGtleSYjMzk7c8KgcHVibGljLsKgIEZvciBl
eGFtcGxlIHVzaW5nIG9wZW5zc2wgaXQgd291bGQgYmU6PGJyPm9wZW5zc2wgcGtleXV0bCAtZGVy
aXZlIC1pbmtleSBzb2Z0d2FyZS5wcml2LnBlbSAtcGVlcmtleSB0cG0ucHViLnBlbSAtb3V0IHNo
YXJlZC5zZWNyZXQ8ZGl2PlRoZSBzaGFyZWQgc2VjcmV0cyBkZXJpdmVkIG9uIGJvdGggc2lkZXMg
b2YgdGhlIGNoYW5uZWwgYXJlIHRoZSBzYW1lIGJ1dCBvbmx5IHB1YmxpYyBrZXlzIGFyZSBleGNo
YW5nZWQgYW5kIHZlcmlmaWVkLsKgIEhlbmNlIHdoeSBpdCYjMzk7cyBFbGxpcHRpYyBDdXJ2ZSBE
aWZmaWUtSGVsbG1hbi48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZSBvdGhlciBFQ0RIIGNv
bW1hbmRzIGFyZSBmb3IgbGVzcyB0cml2aWFsIGNhc2VzIGludm9sdmluZyBtb3JlIGVwaGVtZXJh
bCBrZXlwYWlycyBhbmQgdGhlIGxpa2UuPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVGh1LCBBcHIgMzAs
IDIwMjAgYXQgOToyNyBBTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwv
YT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigy
MDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+SSB0b29rIGEgZmV3IG1pbnV0ZXMgYW5kIGNy
ZWF0ZWQgYSBza2VsZXRvbiB0b29sIHRoYXQgY2FsbHMgZWNkZyB6Z2VuOjxicj4KPGEgaHJlZj0i
aHR0cHM6Ly9naXRodWIuY29tL3dpbGxpYW1jcm9iZXJ0cy90cG0yLjAtdG9vbHMvdHJlZS96Z2Vu
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vd2ls
bGlhbWNyb2JlcnRzL3RwbTIuMC10b29scy90cmVlL3pnZW48L2E+PGJyPgo8YnI+CklmIHlvdSBi
dWlsZCB0aGF0IGJyYW5jaCB5b3Ugd2lsbCBzZWUgdGhlIHRvb2wgdHBtMl9lY2Roemdlbi4gWW91
IGNhbjxicj4KQ2FsbCB0aGF0IGNvbW1hbmQgYWJkIGl0IHdpbGwgcnVuLCBidXQgaGFzIHNvbWUg
ZXJyb3JzLCB5b3UgbmVlZCB0bzxicj4KRmlndXJlIG91dCB3aGF0IHRvIGRvIHdpdGggaW4gcG9p
bnQgYW5kIG91dCBwb2ludCBwYXJhbWV0ZXJzLjxicj4KPGJyPgrCoCDCoCAvLyBUZXN0IHNldHVw
PGJyPgrCoCDCoCB0cG0yX2NyZWF0ZXByaW1hcnkgLWMgcHJpbWFyeS5jdHg8YnI+CsKgIMKgIHRw
bTJfY3JlYXRlIC1DIHByaW1hcnkuY3R4IC1HIGVjYzI1NiAtdSBlYy5wdWIgLXIgZWMucHJpdjxi
cj4KwqAgwqAgdHBtMl9sb2FkIC1DIHByaW1hcnkuY3R4IC11IGVjLnB1YiAtciBlYy5wcml2IC1j
IGVjLmN0eDxicj4KPGJyPgrCoCDCoCAvLyBDb21tYW5kIGZhaWxzLi4uYnV0IHJ1bnMhPGJyPgrC
oCDCoCB0cG0yX2VjZGh6Z2VuIC1jIGVjLmN0eDxicj4KwqAgwqAgRVJST1I6IEVzeXNfUlNBX0Rl
Y3J5cHQoMHgxRTcpIC0gdHBtOnBhcmFtZXRlcigxKTpwb2ludCBpcyBub3Qgb24gdGhlIHJlcXVp
cmVkIGN1cnZlPGJyPgo8YnI+Cjxicj4KJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxi
cj4KJmd0OyBGcm9tOiBSb2JlcnRzLCBXaWxsaWFtIEM8YnI+CiZndDsgU2VudDogVGh1cnNkYXks
IEFwcmlsIDMwLCAyMDIwIDEwOjU5IEFNPGJyPgomZ3Q7IFRvOiAmIzM5O1N0ZXZlbiBDbGFyayYj
Mzk7ICZsdDs8YSBocmVmPSJtYWlsdG86ZGF2b2xmbWFuQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmRhdm9sZm1hbkBnbWFpbC5jb208L2E+Jmd0OzsgJiMzOTt0cG0yJiMzOTsgJmx0OzxhIGhy
ZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMu
MDEub3JnPC9hPiZndDs8YnI+CiZndDsgU3ViamVjdDogUkU6IFt0cG0yXSBBcmUgdGhlcmUgYW55
IGhlbHAgZG9jdW1lbnRzL3NpdGVzIG9uIHdyaXRpbmcgYW4gRVNBUEk8YnI+CiZndDsgcHJvZ3Jh
bS48YnI+CiZndDsgPGJyPgomZ3Q7IFRoZSBFc3lzIGludGVncmF0aW9uIHRlc3RzIGFyZSBhbHNv
IHN1cGVyIGhlbHBmdWw6PGJyPgomZ3Q7IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0y
LXNvZnR3YXJlL3RwbTItIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczov
L2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLTwvYT48YnI+CiZndDsgdHNzL2Jsb2IvbWFz
dGVyL3Rlc3QvaW50ZWdyYXRpb24vZXN5cy1lY2RoLXpnZW4uaW50LmM8YnI+CiZndDsgPGJyPgom
Z3Q7IDxicj4KJmd0OyAmZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7ICZn
dDsgRnJvbTogUm9iZXJ0cywgV2lsbGlhbSBDPGJyPgomZ3Q7ICZndDsgU2VudDogVGh1cnNkYXks
IEFwcmlsIDMwLCAyMDIwIDEwOjQ0IEFNPGJyPgomZ3Q7ICZndDsgVG86ICYjMzk7U3RldmVuIENs
YXJrJiMzOTsgJmx0OzxhIGhyZWY9Im1haWx0bzpkYXZvbGZtYW5AZ21haWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+ZGF2b2xmbWFuQGdtYWlsLmNvbTwvYT4mZ3Q7OyB0cG0yICZsdDs8YSBocmVmPSJt
YWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9y
ZzwvYT4mZ3Q7PGJyPgomZ3Q7ICZndDsgU3ViamVjdDogUkU6IFt0cG0yXSBBcmUgdGhlcmUgYW55
IGhlbHAgZG9jdW1lbnRzL3NpdGVzIG9uIHdyaXRpbmcgYW48YnI+CiZndDsgJmd0OyBFU0FQSSBw
cm9ncmFtLjxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgVGhlIHRvb2xzIHRoZW1zZWx2ZXMg
YXJlIHJlYWwgd29ybGQgZXhhbXBsZXMuPGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyBZb3Ug
c2hvdWxkbiYjMzk7dCBnbyBkaWdnaW5nIGludG8gdGhlIEVTWVNfQ09OVEVYVCBvciBUQ1RJX0NP
TlRFWFQgYnV0IHRoZTxicj4KJmd0OyAmZ3Q7IHN0cnVjdHVyZSBwYXJhbWV0ZXJzIEFuZCByZXR1
cm5zIHRvIEVTWVMgY2FsbHMgeW91IGNhbi4gSXRzIHNldCB1cDxicj4KJmd0OyAmZ3Q7IHdoZXJl
IHlvdSBjYW4mIzM5O3QgZ28gc3RydWN0dXJlIGRpZ2dpbmcgYW5kIGNvbXBpbGUgd2l0aCB0aGUg
aW5jbHVkZTxicj4KJmd0OyAmZ3Q7IGRpcmVjdG9yeSBpbmNsdWRlcyAoPGEgaHJlZj0iaHR0cHM6
Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItPC9hPjxicj4K
Jmd0OyB0c3MvdHJlZS9tYXN0ZXIvaW5jbHVkZS90c3MyKS48YnI+CiZndDsgJmd0OyBJZiB5b3Ug
YWRkIGluY2x1ZGVzIGZyb20gdGhlIHByb2plY3QgdGhhdCBleGlzdCBlbHNld2hlcmUgeW91JiMz
OTtyZSBkb2luZyBpdCB3cm9uZy48YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IE5vdyBmb3Ig
dGhlIFpHZW4gY29kZSwgd2UgYWN0dWFsbHkgd2FudCB0byBhZGQgaXQgdG8gdG9vbHMuIEl0czxi
cj4KJmd0OyAmZ3Q7IGFjdHVhbGx5IG9uIHRoZSBzaG9ydCBsaXN0IG9mIGNvbW1hbmRzIFRvIGFk
ZCwgc2VlIGJ1Zzo8YnI+CiZndDsgJmd0OyA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBt
Mi0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90
cG0yLTwvYT48YnI+CiZndDsgJmd0OyBzb2Z0d2FyZS90cG0yLXRvb2xzL2lzc3Vlcy84Nzc8YnI+
CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IFRoZSByZWFzb24gd2UgZGlkbiYjMzk7dCBhZGQgaXQg
eWV0LCBpcyB3ZSBkaWRuJiMzOTt0IGtub3cgZXhhY3RseSBob3cgaXQ8YnI+CiZndDsgJmd0OyB3
b3JrcyBhbmQgdG8gdGVzdCBpdC4gSW1yYW4gYW5kIEkgQWN0dWFsbHkgaGF2ZSBhIG1lZXRpbmcg
d2l0aCBzb21lb25lPGJyPgomZ3Q7ICZndDsgd2F5IG1vcmUga25vd2xlZGdlYWJsZSBvbiBFQ0Mg
dG8gaGVscCB1cyBhbG9uZy4gV2Ugd291bGQgTG92ZSwgZXZlbjxicj4KJmd0OyAmZ3Q7IGp1c3Qg
c2FtcGxlIGNvZGUgdG8gaGVscCB1cyBvdXQsIG9yIGlmIHlvdSBjcmVhdGVkIHRoZSB0b29sIGV2
ZW48YnI+CiZndDsgJmd0OyBiZXR0ZXIuIEFueXRoaW5nIHlvdSBjYW4gU2hhcmUgYmFjayBpcyBh
IHdpbi48YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgTm93IGZvciB0
YWtpbmcgdGhlIHRyYWluaW5nIHdoZWVscyBvZmYsIEVzeXNfSW5pdGlhbGl6ZSgpLCB5b3UgY2Fu
PGJyPgomZ3Q7ICZndDsgbGVhdmUgb2ZmIHRoZSB0Y3RpIGFuZCBhYmkgcG9pbnRlcnMgYnkgcGFz
c2luZyBOVUxMLiBUaGF0IHNob3VsZCBqdXN0PGJyPgomZ3Q7ICZndDsgZ2V0IHlvdSBhIGNvbnRl
eHQgd2l0aCB0aGUgVFBNIGFuZCBhd2F5IHlvdSBnby4gSGVyZSBpcyBhIHZlcnkgc2ltcGxlPGJy
PgomZ3Q7ICZndDsgcHJvZ3JhbSB0byBzdGFydDxicj4KJmd0OyAmZ3Q7IFdpdGg6PGJyPgomZ3Q7
ICZndDsgPGEgaHJlZj0iaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vd2lsbGlhbWNyb2JlcnRzLzY2
YTdkYWIzYWRmYjk3M2ZiYWUzMjE5OTU0NTM1MCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vd2lsbGlhbWNyb2JlcnRzLzY2YTdkYWIzYWRm
Yjk3M2ZiYWUzMjE5OTU0NTM1MDwvYT48YnI+CiZndDsgJmd0OyAwOTxicj4KJmd0OyAmZ3Q7PGJy
PgomZ3Q7ICZndDsgWW91IGNhbiBhbHRlciB0aGF0IGJ5IGNoYW5naW5nIHRoZSB0ZW1wbGF0ZSBh
bmQgbWFraW5nIGFuIEVDIGtleSB0bzxicj4KJmd0OyAmZ3Q7IHBsYXkgd2l0aCwgb3IgaGF2ZSBp
dCBwYXNzIGluIGJsb2JzIGZyb20gdHBtMl9jcmVhdGUgdG9vbC4gVHBtMl9jcmVhdGU8YnI+CiZn
dDsgJmd0OyB0b29sIGhhcyB0aGUgb3V0cHV0IG9wdGlvbnMgLXUgYW5kIC1yIHRoYXQgeW91IGNh
biBwYXNzIGFsb25nLCBhbmQgbG9hZCB0aG9zZSB1cDxicj4KJmd0OyBieTo8YnI+CiZndDsgJmd0
OyAxLiBEZXN0ZXJpbGl6aW5nIHdpdGggbGlibXUgKG9mZmhhbmQgSSB0aGluayB0aGUgY2FsbHMg
d2lsbCBiZTxicj4KJmd0OyAmZ3Q7IFRzczJfTVVfVFBNMkJfUFJJVkFURV9Vbm1hcnNoYWwgYW5k
PGJyPgomZ3Q7ICZndDsgVHNzMl9NVV9UUE0yQl9QVUJMSUNfVW5tYXJzaGFsKSAyLiBDYWxsaW5n
IEVzeXNfTG9hZCgpIGFuZCBnZXR0aW5nIHRoZTxicj4KJmd0OyAmZ3Q7IEVTWVNfVFIgaGFuZGxl
IHRvIHBhc3MgdG8gdGhlIHpnZW4gcm91dGluZTxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDs8
YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7ICZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS08YnI+CiZndDsgJmd0OyAmZ3Q7IEZyb206IFN0ZXZlbiBDbGFyayBbbWFpbHRvOjxhIGhyZWY9
Im1haWx0bzpkYXZvbGZtYW5AZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+ZGF2b2xmbWFuQGdt
YWlsLmNvbTwvYT5dPGJyPgomZ3Q7ICZndDsgJmd0OyBTZW50OiBXZWRuZXNkYXksIEFwcmlsIDI5
LCAyMDIwIDc6NTEgUE08YnI+CiZndDsgJmd0OyAmZ3Q7IFRvOiB0cG0yICZsdDs8YSBocmVmPSJt
YWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9y
ZzwvYT4mZ3Q7PGJyPgomZ3Q7ICZndDsgJmd0OyBTdWJqZWN0OiBbdHBtMl0gQXJlIHRoZXJlIGFu
eSBoZWxwIGRvY3VtZW50cy9zaXRlcyBvbiB3cml0aW5nIGFuPGJyPgomZ3Q7ICZndDsgJmd0OyBF
U0FQSSBwcm9ncmFtLjxicj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyAmZ3Q7IEkgbmVl
ZCB0byBwZXJmb3JtIGEgY29tbWFuZCB0aGF0IGRvZXNuJiMzOTt0IGhhdmUgYSB0b29scyBleGVj
dXRhYmxlIHlldDxicj4KJmd0OyAmZ3Q7ICZndDsgKFRQTTJfRUNESF9aR2VuKSBhbmQgb24gYSBw
ZXJzaXN0ZW50IG9iamVjdCBoYW5kbGUgdGhhdCB3b24mIzM5O3QgYmU8YnI+CiZndDsgJmd0OyAm
Z3Q7IGNvbXBhdGlibGUgd2l0aCB0aGUgb24tZGlzayBrZXktZGF0YWJhc2VzIG9mIEZBUEkgb3Ig
UEtDUyMxMS7CoCBTbzxicj4KJmd0OyAmZ3Q7ICZndDsgdGhhdCBtZWFucyBJIG5lZWQgdG8gd3Jp
dGUgbXkgb3duIGNvZGUgaW4gQywgYW5kIHRoYXQgY29kZSBuZWVkcyB0byB1c2UgdGhlPGJyPgom
Z3Q7IEVTQVBJLjxicj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyAmZ3Q7IEkmIzM5O3Zl
IGhhZCBhIGxvdCBvZiBsZWFkIHRpbWUgdG8gc2VlIHRoaXMgY29taW5nIHNvIEkmIzM5O3ZlIGRv
bmUgYSBmZXc8YnI+CiZndDsgJmd0OyAmZ3Q7IGxpdHRsZTxicj4KJmd0OyAmZ3Q7IGV4cGVyaW1l
bnRzLjxicj4KJmd0OyAmZ3Q7ICZndDsgVGhleSBoYXZlIG5vdCBpbXByb3ZlZCBteSBjb25maWRl
bmNlIGluIG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIEFQSS48YnI+CiZndDsgJmd0OyAmZ3Q7IEZv
ciBleGFtcGxlIEkmIzM5O20gc3RpbGwgbm90IHN1cmUgd2hpY2ggc3RydWN0dXJlcyBJJiMzOTtt
IHN1cHBvc2VkIHRvPGJyPgomZ3Q7ICZndDsgJmd0OyBhY2Nlc3MgZGlyZWN0bHkgYW5kIHdoaWNo
IG9uZXMgYXJlIHN1cHBvc2VkIHRvIGJlIG1hbmlwdWxhdGVkIHVzaW5nPGJyPgomZ3Q7IGZ1bmN0
aW9ucy48YnI+CiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgJmd0OyBUaGUgU3BlY3MgYXJl
IGVpdGhlciBsb25nIGFuZCB0aGVvcmV0aWNhbCBvciBkcnkgYW5kIHRlcnNlLsKgIEFuZDxicj4K
Jmd0OyAmZ3Q7ICZndDsgYm90aCB0aGUgdGVzdHMgZm9yIFRTUyBhbmQgdGhlIHNvdXJjZSBmaWxl
cyBmb3IgVG9vbHMgbWFrZSB1c2Ugb2Y8YnI+CiZndDsgJmd0OyAmZ3Q7IGludGVybmFsIGFic3Ry
YWN0aW9uIGxheWVycy7CoCBJJiMzOTttIGhhdmluZyB0cm91YmxlIGdldHRpbmcgYTxicj4KJmd0
OyAmZ3Q7ICZndDsgd2hvbGUtcHJvY2VzcyBwaWN0dXJlLsKgIEFyZSB0aGVyZSBhbnkgcmVzb3Vy
Y2VzIG91dCB0aGVyZSB0byBoZWxwIG1lPGJyPgomZ3Q7ICZndDsgJmd0OyBnZXQgbXkgc2VhLWxl
Z3Mgb24gRVNBUEk8YnI+CiZndDsgJmd0OyBjb2RlPzxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============6889598157329984973==--

