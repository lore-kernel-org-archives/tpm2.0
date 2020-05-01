Content-Type: multipart/mixed; boundary="===============0461463657306765022=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Are there any help documents/sites on writing an ESAPI
 program.
Date: Thu, 30 Apr 2020 18:36:53 -0700
Message-ID: <CAOCvsS=82HEeXFYbYVqDnSP52F0iTM5O3Hs8zoXzqFA6=vBL3g@mail.gmail.com>
In-Reply-To: CAOCvsSkFQO_xfx68Gu7EHG1Q51C99MPdnOJ5dZWkLRS_XMrV1g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0461463657306765022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm remembering more about the last time I tried to write this code.  I got
far enough to set up an ESYS_CONTEXT and use the TCTI defaulting behavior
to use whatever the system was configured for.  Between the Doxygen pages
and the ESAPI spec I managed to do that much.  I think the next part I ran
into was that the ESAPI seemed to imply that ESYS_TRs were also opaque so I
wasn't sure if I needed to use a function to get a handle that was already
persisted.  I'll remember more questions as I look over my old code and get
back into that mindset.  The problem of converting from OpenSSL to TSS key
format should be only an annoyance now that I've taught myself to read DER
in a hex editor for something else.

Now that I've read Robert's code, and done a little more research to go
with it I've got ideas.  The tool is probably going to need a -u option
which should probably have the ability to load a PEM public key (which I
think is PKCS#8 but all I see on that says it's for private keys) in
addition to the TSS structure like tpm2_loadexternal.  If the
loadexternal behavior really is RSA only then it'll be a pain because ECC
keys can come in a compressed form that takes math to decode.  The tool
should ideally have a -o option that's optional with pipe detection to
switch to binary like tpm2_getrandom, because the expected output format is
a 32-byte integer with no formatting.

Creating an example input point isn't apparently as easy as just punching
in an arbitrary number pair because the valid points for every curve only
have one degree of freedom plus a bit: there are only two valid y
coordinates for every x.  That's why they can be compressed.  Also 0 might
be a special identity, or maybe that's just for scalar multiplication.

On Thu, Apr 30, 2020 at 11:29 AM Steven Clark <davolfman(a)gmail.com> wrote:

> If you're getting your Private and Public from the same keypair for an
> ECDH Zgen that's almost certainly why it's breaking.  As far as I know the
> inpoint should be the public key of the other side of the conversation, a=
nd
> the x coordinate of the output point should be the shared secret.  At lea=
st
> if the command does what I think it does.
> As I understand it if you want to double check your results you can derive
> the same shared secret from the other side of the channel, using their
> private key and the TPM key's public.  For example using openssl it would
> be:
> openssl pkeyutl -derive -inkey software.priv.pem -peerkey tpm.pub.pem -out
> shared.secret
> The shared secrets derived on both sides of the channel are the same but
> only public keys are exchanged and verified.  Hence why it's Elliptic Cur=
ve
> Diffie-Hellman.
>
> The other ECDH commands are for less trivial cases involving more
> ephemeral keypairs and the like.
>
> On Thu, Apr 30, 2020 at 9:27 AM Roberts, William C <
> william.c.roberts(a)intel.com> wrote:
>
>> I took a few minutes and created a skeleton tool that calls ecdg zgen:
>> https://github.com/williamcroberts/tpm2.0-tools/tree/zgen
>>
>> If you build that branch you will see the tool tpm2_ecdhzgen. You can
>> Call that command abd it will run, but has some errors, you need to
>> Figure out what to do with in point and out point parameters.
>>
>>     // Test setup
>>     tpm2_createprimary -c primary.ctx
>>     tpm2_create -C primary.ctx -G ecc256 -u ec.pub -r ec.priv
>>     tpm2_load -C primary.ctx -u ec.pub -r ec.priv -c ec.ctx
>>
>>     // Command fails...but runs!
>>     tpm2_ecdhzgen -c ec.ctx
>>     ERROR: Esys_RSA_Decrypt(0x1E7) - tpm:parameter(1):point is not on the
>> required curve
>>
>>
>> > -----Original Message-----
>> > From: Roberts, William C
>> > Sent: Thursday, April 30, 2020 10:59 AM
>> > To: 'Steven Clark' <davolfman(a)gmail.com>; 'tpm2' <tpm2(a)lists.01.or=
g>
>> > Subject: RE: [tpm2] Are there any help documents/sites on writing an
>> ESAPI
>> > program.
>> >
>> > The Esys integration tests are also super helpful:
>> > https://github.com/tpm2-software/tpm2-
>> > tss/blob/master/test/integration/esys-ecdh-zgen.int.c
>> >
>> >
>> > > -----Original Message-----
>> > > From: Roberts, William C
>> > > Sent: Thursday, April 30, 2020 10:44 AM
>> > > To: 'Steven Clark' <davolfman(a)gmail.com>; tpm2 <tpm2(a)lists.01.or=
g>
>> > > Subject: RE: [tpm2] Are there any help documents/sites on writing an
>> > > ESAPI program.
>> > >
>> > > The tools themselves are real world examples.
>> > >
>> > > You shouldn't go digging into the ESYS_CONTEXT or TCTI_CONTEXT but t=
he
>> > > structure parameters And returns to ESYS calls you can. Its set up
>> > > where you can't go structure digging and compile with the include
>> > > directory includes (https://github.com/tpm2-software/tpm2-
>> > tss/tree/master/include/tss2).
>> > > If you add includes from the project that exist elsewhere you're
>> doing it wrong.
>> > >
>> > > Now for the ZGen code, we actually want to add it to tools. Its
>> > > actually on the short list of commands To add, see bug:
>> > > https://github.com/tpm2-
>> > > software/tpm2-tools/issues/877
>> > >
>> > > The reason we didn't add it yet, is we didn't know exactly how it
>> > > works and to test it. Imran and I Actually have a meeting with someo=
ne
>> > > way more knowledgeable on ECC to help us along. We would Love, even
>> > > just sample code to help us out, or if you created the tool even
>> > > better. Anything you can Share back is a win.
>> > >
>> > >
>> > > Now for taking the training wheels off, Esys_Initialize(), you can
>> > > leave off the tcti and abi pointers by passing NULL. That should just
>> > > get you a context with the TPM and away you go. Here is a very simple
>> > > program to start
>> > > With:
>> > >
>> https://gist.github.com/williamcroberts/66a7dab3adfb973fbae32199545350
>> > > 09
>> > >
>> > > You can alter that by changing the template and making an EC key to
>> > > play with, or have it pass in blobs from tpm2_create tool. Tpm2_crea=
te
>> > > tool has the output options -u and -r that you can pass along, and
>> load those up
>> > by:
>> > > 1. Desterilizing with libmu (offhand I think the calls will be
>> > > Tss2_MU_TPM2B_PRIVATE_Unmarshal and
>> > > Tss2_MU_TPM2B_PUBLIC_Unmarshal) 2. Calling Esys_Load() and getting t=
he
>> > > ESYS_TR handle to pass to the zgen routine
>> > >
>> > >
>> > >
>> > > > -----Original Message-----
>> > > > From: Steven Clark [mailto:davolfman(a)gmail.com]
>> > > > Sent: Wednesday, April 29, 2020 7:51 PM
>> > > > To: tpm2 <tpm2(a)lists.01.org>
>> > > > Subject: [tpm2] Are there any help documents/sites on writing an
>> > > > ESAPI program.
>> > > >
>> > > > I need to perform a command that doesn't have a tools executable y=
et
>> > > > (TPM2_ECDH_ZGen) and on a persistent object handle that won't be
>> > > > compatible with the on-disk key-databases of FAPI or PKCS#11.  So
>> > > > that means I need to write my own code in C, and that code needs to
>> use the
>> > ESAPI.
>> > > >
>> > > > I've had a lot of lead time to see this coming so I've done a few
>> > > > little
>> > > experiments.
>> > > > They have not improved my confidence in my understanding of the AP=
I.
>> > > > For example I'm still not sure which structures I'm supposed to
>> > > > access directly and which ones are supposed to be manipulated using
>> > functions.
>> > > >
>> > > > The Specs are either long and theoretical or dry and terse.  And
>> > > > both the tests for TSS and the source files for Tools make use of
>> > > > internal abstraction layers.  I'm having trouble getting a
>> > > > whole-process picture.  Are there any resources out there to help =
me
>> > > > get my sea-legs on ESAPI
>> > > code?
>>
>

--===============0461463657306765022==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5JJiMzOTttIHJlbWVtYmVyaW5nIG1vcmUgYWJvdXQgdGhlIGxh
c3QgdGltZSBJIHRyaWVkIHRvIHdyaXRlIHRoaXMgY29kZS7CoCBJIGdvdCBmYXIgZW5vdWdoIHRv
IHNldCB1cCBhbiBFU1lTX0NPTlRFWFQgYW5kIHVzZSB0aGUgVENUSSBkZWZhdWx0aW5nIGJlaGF2
aW9yIHRvIHVzZSB3aGF0ZXZlciB0aGUgc3lzdGVtIHdhcyBjb25maWd1cmVkIGZvci7CoCBCZXR3
ZWVuIHRoZSBEb3h5Z2VuIHBhZ2VzIGFuZCB0aGUgRVNBUEkgc3BlYyBJIG1hbmFnZWQgdG8gZG8g
dGhhdCBtdWNoLsKgIEkgdGhpbmsgdGhlIG5leHQgcGFydCBJIHJhbiBpbnRvIHdhcyB0aGF0IHRo
ZSBFU0FQSSBzZWVtZWQgdG8gaW1wbHkgdGhhdCBFU1lTX1RScyB3ZXJlIGFsc28gb3BhcXVlIHNv
IEkgd2FzbiYjMzk7dCBzdXJlIGlmIEkgbmVlZGVkIHRvIHVzZSBhIGZ1bmN0aW9uIHRvIGdldCBh
IGhhbmRsZSB0aGF0IHdhcyBhbHJlYWR5IHBlcnNpc3RlZC7CoCBJJiMzOTtsbCByZW1lbWJlciBt
b3JlIHF1ZXN0aW9ucyBhcyBJIGxvb2sgb3ZlciBteSBvbGQgY29kZSBhbmQgZ2V0IGJhY2sgaW50
byB0aGF0IG1pbmRzZXQuwqAgVGhlIHByb2JsZW0gb2YgY29udmVydGluZyBmcm9tIE9wZW5TU0wg
dG8gVFNTIGtleSBmb3JtYXQgc2hvdWxkIGJlIG9ubHkgYW4gYW5ub3lhbmNlwqBub3cgdGhhdCBJ
JiMzOTt2ZSB0YXVnaHQgbXlzZWxmIHRvIHJlYWQgREVSIGluIGEgaGV4IGVkaXRvciBmb3Igc29t
ZXRoaW5nIGVsc2UuPC9kaXY+PGRpdj48YnI+PC9kaXY+Tm93IHRoYXQgSSYjMzk7dmUgcmVhZCBS
b2JlcnQmIzM5O3MgY29kZSwgYW5kIGRvbmUgYSBsaXR0bGUgbW9yZSByZXNlYXJjaCB0byBnbyB3
aXRoIGl0IEkmIzM5O3ZlIGdvdCBpZGVhcy7CoCBUaGUgdG9vbCBpcyBwcm9iYWJseSBnb2luZyB0
byBuZWVkIGEgLXUgb3B0aW9uIHdoaWNoIHNob3VsZCBwcm9iYWJseSBoYXZlIHRoZSBhYmlsaXR5
IHRvIGxvYWQgYSBQRU0gcHVibGljIGtleSAod2hpY2ggSSB0aGluayBpcyBQS0NTIzggYnV0IGFs
bCBJIHNlZSBvbiB0aGF0IHNheXMgaXQmIzM5O3MgZm9yIHByaXZhdGUga2V5cykgaW4gYWRkaXRp
b24gdG8gdGhlIFRTUyBzdHJ1Y3R1cmUgbGlrZSB0cG0yX2xvYWRleHRlcm5hbC7CoCBJZiB0aGUg
bG9hZGV4dGVybmFswqBiZWhhdmlvciByZWFsbHkgaXMgUlNBIG9ubHkgdGhlbiBpdCYjMzk7bGwg
YmUgYSBwYWluIGJlY2F1c2UgRUNDIGtleXMgY2FuIGNvbWUgaW4gYSBjb21wcmVzc2VkIGZvcm0g
dGhhdCB0YWtlcyBtYXRoIHRvIGRlY29kZS7CoCBUaGUgdG9vbCBzaG91bGQgaWRlYWxseSBoYXZl
IGEgLW8gb3B0aW9uIHRoYXQmIzM5O3Mgb3B0aW9uYWwgd2l0aCBwaXBlIGRldGVjdGlvbiB0byBz
d2l0Y2ggdG8gYmluYXJ5IGxpa2UgdHBtMl9nZXRyYW5kb20sIGJlY2F1c2UgdGhlIGV4cGVjdGVk
IG91dHB1dCBmb3JtYXQgaXMgYSAzMi1ieXRlIGludGVnZXIgd2l0aCBubyBmb3JtYXR0aW5nLjxk
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5DcmVhdGluZyBhbiBleGFtcGxlIGlucHV0IHBvaW50IGlz
biYjMzk7dCBhcHBhcmVudGx5IGFzIGVhc3kgYXMganVzdCBwdW5jaGluZyBpbiBhbiBhcmJpdHJh
cnkgbnVtYmVyIHBhaXIgYmVjYXVzZSB0aGUgdmFsaWQgcG9pbnRzIGZvciBldmVyeSBjdXJ2ZSBv
bmx5IGhhdmUgb25lIGRlZ3JlZSBvZiBmcmVlZG9tIHBsdXMgYSBiaXQ6IHRoZXJlIGFyZSBvbmx5
IHR3byB2YWxpZCB5IGNvb3JkaW5hdGVzIGZvciBldmVyeSB4LsKgIFRoYXQmIzM5O3Mgd2h5IHRo
ZXkgY2FuIGJlIGNvbXByZXNzZWQuwqAgQWxzbyAwIG1pZ2h0IGJlIGEgc3BlY2lhbCBpZGVudGl0
eSwgb3IgbWF5YmUgdGhhdCYjMzk7cyBqdXN0IGZvciBzY2FsYXIgbXVsdGlwbGljYXRpb24uPC9k
aXY+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRy
IiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVGh1LCBBcHIgMzAsIDIwMjAgYXQgMTE6MjkgQU0gU3Rl
dmVuIENsYXJrICZsdDs8YSBocmVmPSJtYWlsdG86ZGF2b2xmbWFuQGdtYWlsLmNvbSI+ZGF2b2xm
bWFuQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0i
Z21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6
MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0
ciI+SWYgeW91JiMzOTtyZSBnZXR0aW5nIHlvdXIgUHJpdmF0ZSBhbmQgUHVibGljIGZyb20gdGhl
IHNhbWUga2V5cGFpciBmb3IgYW4gRUNESCBaZ2VuIHRoYXQmIzM5O3MgYWxtb3N0IGNlcnRhaW5s
eSB3aHkgaXQmIzM5O3MgYnJlYWtpbmcuwqAgQXMgZmFyIGFzIEkga25vdyB0aGUgaW5wb2ludCBz
aG91bGQgYmUgdGhlIHB1YmxpYyBrZXkgb2YgdGhlIG90aGVyIHNpZGUgb2YgdGhlIGNvbnZlcnNh
dGlvbiwgYW5kIHRoZSB4IGNvb3JkaW5hdGUgb2YgdGhlIG91dHB1dCBwb2ludCBzaG91bGQgYmUg
dGhlIHNoYXJlZCBzZWNyZXQuwqAgQXQgbGVhc3QgaWYgdGhlIGNvbW1hbmQgZG9lcyB3aGF0IEkg
dGhpbmsgaXQgZG9lcy48YnI+QXMgSSB1bmRlcnN0YW5kIGl0IGlmIHlvdSB3YW50IHRvIGRvdWJs
ZcKgY2hlY2sgeW91ciByZXN1bHRzIHlvdSBjYW4gZGVyaXZlIHRoZSBzYW1lIHNoYXJlZCBzZWNy
ZXQgZnJvbSB0aGUgb3RoZXIgc2lkZSBvZiB0aGUgY2hhbm5lbCzCoHVzaW5nIHRoZWlyIHByaXZh
dGUga2V5IGFuZCB0aGUgVFBNIGtleSYjMzk7c8KgcHVibGljLsKgIEZvciBleGFtcGxlIHVzaW5n
IG9wZW5zc2wgaXQgd291bGQgYmU6PGJyPm9wZW5zc2wgcGtleXV0bCAtZGVyaXZlIC1pbmtleSBz
b2Z0d2FyZS5wcml2LnBlbSAtcGVlcmtleSB0cG0ucHViLnBlbSAtb3V0IHNoYXJlZC5zZWNyZXQ8
ZGl2PlRoZSBzaGFyZWQgc2VjcmV0cyBkZXJpdmVkIG9uIGJvdGggc2lkZXMgb2YgdGhlIGNoYW5u
ZWwgYXJlIHRoZSBzYW1lIGJ1dCBvbmx5IHB1YmxpYyBrZXlzIGFyZSBleGNoYW5nZWQgYW5kIHZl
cmlmaWVkLsKgIEhlbmNlIHdoeSBpdCYjMzk7cyBFbGxpcHRpYyBDdXJ2ZSBEaWZmaWUtSGVsbG1h
bi48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZSBvdGhlciBFQ0RIIGNvbW1hbmRzIGFyZSBm
b3IgbGVzcyB0cml2aWFsIGNhc2VzIGludm9sdmluZyBtb3JlIGVwaGVtZXJhbCBrZXlwYWlycyBh
bmQgdGhlIGxpa2UuPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2
IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVGh1LCBBcHIgMzAsIDIwMjAgYXQgOToy
NyBBTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5j
b208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCBy
Z2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkkgdG9vayBhIGZldyBtaW51dGVzIGFu
ZCBjcmVhdGVkIGEgc2tlbGV0b24gdG9vbCB0aGF0IGNhbGxzIGVjZGcgemdlbjo8YnI+CjxhIGhy
ZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS93aWxsaWFtY3JvYmVydHMvdHBtMi4wLXRvb2xzL3RyZWUv
emdlbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29t
L3dpbGxpYW1jcm9iZXJ0cy90cG0yLjAtdG9vbHMvdHJlZS96Z2VuPC9hPjxicj4KPGJyPgpJZiB5
b3UgYnVpbGQgdGhhdCBicmFuY2ggeW91IHdpbGwgc2VlIHRoZSB0b29sIHRwbTJfZWNkaHpnZW4u
IFlvdSBjYW48YnI+CkNhbGwgdGhhdCBjb21tYW5kIGFiZCBpdCB3aWxsIHJ1biwgYnV0IGhhcyBz
b21lIGVycm9ycywgeW91IG5lZWQgdG88YnI+CkZpZ3VyZSBvdXQgd2hhdCB0byBkbyB3aXRoIGlu
IHBvaW50IGFuZCBvdXQgcG9pbnQgcGFyYW1ldGVycy48YnI+Cjxicj4KwqAgwqAgLy8gVGVzdCBz
ZXR1cDxicj4KwqAgwqAgdHBtMl9jcmVhdGVwcmltYXJ5IC1jIHByaW1hcnkuY3R4PGJyPgrCoCDC
oCB0cG0yX2NyZWF0ZSAtQyBwcmltYXJ5LmN0eCAtRyBlY2MyNTYgLXUgZWMucHViIC1yIGVjLnBy
aXY8YnI+CsKgIMKgIHRwbTJfbG9hZCAtQyBwcmltYXJ5LmN0eCAtdSBlYy5wdWIgLXIgZWMucHJp
diAtYyBlYy5jdHg8YnI+Cjxicj4KwqAgwqAgLy8gQ29tbWFuZCBmYWlscy4uLmJ1dCBydW5zITxi
cj4KwqAgwqAgdHBtMl9lY2RoemdlbiAtYyBlYy5jdHg8YnI+CsKgIMKgIEVSUk9SOiBFc3lzX1JT
QV9EZWNyeXB0KDB4MUU3KSAtIHRwbTpwYXJhbWV0ZXIoMSk6cG9pbnQgaXMgbm90IG9uIHRoZSBy
ZXF1aXJlZCBjdXJ2ZTxicj4KPGJyPgo8YnI+CiZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS08YnI+CiZndDsgRnJvbTogUm9iZXJ0cywgV2lsbGlhbSBDPGJyPgomZ3Q7IFNlbnQ6IFRodXJz
ZGF5LCBBcHJpbCAzMCwgMjAyMCAxMDo1OSBBTTxicj4KJmd0OyBUbzogJiMzOTtTdGV2ZW4gQ2xh
cmsmIzM5OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRhdm9sZm1hbkBnbWFpbC5jb20iIHRhcmdldD0i
X2JsYW5rIj5kYXZvbGZtYW5AZ21haWwuY29tPC9hPiZndDs7ICYjMzk7dHBtMiYjMzk7ICZsdDs8
YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxp
c3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7IFN1YmplY3Q6IFJFOiBbdHBtMl0gQXJlIHRoZXJl
IGFueSBoZWxwIGRvY3VtZW50cy9zaXRlcyBvbiB3cml0aW5nIGFuIEVTQVBJPGJyPgomZ3Q7IHBy
b2dyYW0uPGJyPgomZ3Q7IDxicj4KJmd0OyBUaGUgRXN5cyBpbnRlZ3JhdGlvbiB0ZXN0cyBhcmUg
YWxzbyBzdXBlciBoZWxwZnVsOjxicj4KJmd0OyA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
dHBtMi1zb2Z0d2FyZS90cG0yLSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi08L2E+PGJyPgomZ3Q7IHRzcy9ibG9i
L21hc3Rlci90ZXN0L2ludGVncmF0aW9uL2VzeXMtZWNkaC16Z2VuLmludC5jPGJyPgomZ3Q7IDxi
cj4KJmd0OyA8YnI+CiZndDsgJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4KJmd0
OyAmZ3Q7IEZyb206IFJvYmVydHMsIFdpbGxpYW0gQzxicj4KJmd0OyAmZ3Q7IFNlbnQ6IFRodXJz
ZGF5LCBBcHJpbCAzMCwgMjAyMCAxMDo0NCBBTTxicj4KJmd0OyAmZ3Q7IFRvOiAmIzM5O1N0ZXZl
biBDbGFyayYjMzk7ICZsdDs8YSBocmVmPSJtYWlsdG86ZGF2b2xmbWFuQGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmRhdm9sZm1hbkBnbWFpbC5jb208L2E+Jmd0OzsgdHBtMiAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmZ3Q7IFN1YmplY3Q6IFJFOiBbdHBtMl0gQXJlIHRoZXJl
IGFueSBoZWxwIGRvY3VtZW50cy9zaXRlcyBvbiB3cml0aW5nIGFuPGJyPgomZ3Q7ICZndDsgRVNB
UEkgcHJvZ3JhbS48YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IFRoZSB0b29scyB0aGVtc2Vs
dmVzIGFyZSByZWFsIHdvcmxkIGV4YW1wbGVzLjxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsg
WW91IHNob3VsZG4mIzM5O3QgZ28gZGlnZ2luZyBpbnRvIHRoZSBFU1lTX0NPTlRFWFQgb3IgVENU
SV9DT05URVhUIGJ1dCB0aGU8YnI+CiZndDsgJmd0OyBzdHJ1Y3R1cmUgcGFyYW1ldGVycyBBbmQg
cmV0dXJucyB0byBFU1lTIGNhbGxzIHlvdSBjYW4uIEl0cyBzZXQgdXA8YnI+CiZndDsgJmd0OyB3
aGVyZSB5b3UgY2FuJiMzOTt0IGdvIHN0cnVjdHVyZSBkaWdnaW5nIGFuZCBjb21waWxlIHdpdGgg
dGhlIGluY2x1ZGU8YnI+CiZndDsgJmd0OyBkaXJlY3RvcnkgaW5jbHVkZXMgKDxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLTwvYT48
YnI+CiZndDsgdHNzL3RyZWUvbWFzdGVyL2luY2x1ZGUvdHNzMikuPGJyPgomZ3Q7ICZndDsgSWYg
eW91IGFkZCBpbmNsdWRlcyBmcm9tIHRoZSBwcm9qZWN0IHRoYXQgZXhpc3QgZWxzZXdoZXJlIHlv
dSYjMzk7cmUgZG9pbmcgaXQgd3JvbmcuPGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyBOb3cg
Zm9yIHRoZSBaR2VuIGNvZGUsIHdlIGFjdHVhbGx5IHdhbnQgdG8gYWRkIGl0IHRvIHRvb2xzLiBJ
dHM8YnI+CiZndDsgJmd0OyBhY3R1YWxseSBvbiB0aGUgc2hvcnQgbGlzdCBvZiBjb21tYW5kcyBU
byBhZGQsIHNlZSBidWc6PGJyPgomZ3Q7ICZndDsgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29t
L3RwbTItIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5j
b20vdHBtMi08L2E+PGJyPgomZ3Q7ICZndDsgc29mdHdhcmUvdHBtMi10b29scy9pc3N1ZXMvODc3
PGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyBUaGUgcmVhc29uIHdlIGRpZG4mIzM5O3QgYWRk
IGl0IHlldCwgaXMgd2UgZGlkbiYjMzk7dCBrbm93IGV4YWN0bHkgaG93IGl0PGJyPgomZ3Q7ICZn
dDsgd29ya3MgYW5kIHRvIHRlc3QgaXQuIEltcmFuIGFuZCBJIEFjdHVhbGx5IGhhdmUgYSBtZWV0
aW5nIHdpdGggc29tZW9uZTxicj4KJmd0OyAmZ3Q7IHdheSBtb3JlIGtub3dsZWRnZWFibGUgb24g
RUNDIHRvIGhlbHAgdXMgYWxvbmcuIFdlIHdvdWxkIExvdmUsIGV2ZW48YnI+CiZndDsgJmd0OyBq
dXN0IHNhbXBsZSBjb2RlIHRvIGhlbHAgdXMgb3V0LCBvciBpZiB5b3UgY3JlYXRlZCB0aGUgdG9v
bCBldmVuPGJyPgomZ3Q7ICZndDsgYmV0dGVyLiBBbnl0aGluZyB5b3UgY2FuIFNoYXJlIGJhY2sg
aXMgYSB3aW4uPGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IE5vdyBm
b3IgdGFraW5nIHRoZSB0cmFpbmluZyB3aGVlbHMgb2ZmLCBFc3lzX0luaXRpYWxpemUoKSwgeW91
IGNhbjxicj4KJmd0OyAmZ3Q7IGxlYXZlIG9mZiB0aGUgdGN0aSBhbmQgYWJpIHBvaW50ZXJzIGJ5
IHBhc3NpbmcgTlVMTC4gVGhhdCBzaG91bGQganVzdDxicj4KJmd0OyAmZ3Q7IGdldCB5b3UgYSBj
b250ZXh0IHdpdGggdGhlIFRQTSBhbmQgYXdheSB5b3UgZ28uIEhlcmUgaXMgYSB2ZXJ5IHNpbXBs
ZTxicj4KJmd0OyAmZ3Q7IHByb2dyYW0gdG8gc3RhcnQ8YnI+CiZndDsgJmd0OyBXaXRoOjxicj4K
Jmd0OyAmZ3Q7IDxhIGhyZWY9Imh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3dpbGxpYW1jcm9iZXJ0
cy82NmE3ZGFiM2FkZmI5NzNmYmFlMzIxOTk1NDUzNTAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3dpbGxpYW1jcm9iZXJ0cy82NmE3ZGFi
M2FkZmI5NzNmYmFlMzIxOTk1NDUzNTA8L2E+PGJyPgomZ3Q7ICZndDsgMDk8YnI+CiZndDsgJmd0
Ozxicj4KJmd0OyAmZ3Q7IFlvdSBjYW4gYWx0ZXIgdGhhdCBieSBjaGFuZ2luZyB0aGUgdGVtcGxh
dGUgYW5kIG1ha2luZyBhbiBFQyBrZXkgdG88YnI+CiZndDsgJmd0OyBwbGF5IHdpdGgsIG9yIGhh
dmUgaXQgcGFzcyBpbiBibG9icyBmcm9tIHRwbTJfY3JlYXRlIHRvb2wuIFRwbTJfY3JlYXRlPGJy
PgomZ3Q7ICZndDsgdG9vbCBoYXMgdGhlIG91dHB1dCBvcHRpb25zIC11IGFuZCAtciB0aGF0IHlv
dSBjYW4gcGFzcyBhbG9uZywgYW5kIGxvYWQgdGhvc2UgdXA8YnI+CiZndDsgYnk6PGJyPgomZ3Q7
ICZndDsgMS4gRGVzdGVyaWxpemluZyB3aXRoIGxpYm11IChvZmZoYW5kIEkgdGhpbmsgdGhlIGNh
bGxzIHdpbGwgYmU8YnI+CiZndDsgJmd0OyBUc3MyX01VX1RQTTJCX1BSSVZBVEVfVW5tYXJzaGFs
IGFuZDxicj4KJmd0OyAmZ3Q7IFRzczJfTVVfVFBNMkJfUFVCTElDX1VubWFyc2hhbCkgMi4gQ2Fs
bGluZyBFc3lzX0xvYWQoKSBhbmQgZ2V0dGluZyB0aGU8YnI+CiZndDsgJmd0OyBFU1lTX1RSIGhh
bmRsZSB0byBwYXNzIHRvIHRoZSB6Z2VuIHJvdXRpbmU8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAm
Z3Q7PGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyAmZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tPGJyPgomZ3Q7ICZndDsgJmd0OyBGcm9tOiBTdGV2ZW4gQ2xhcmsgW21haWx0bzo8YSBo
cmVmPSJtYWlsdG86ZGF2b2xmbWFuQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmRhdm9sZm1h
bkBnbWFpbC5jb208L2E+XTxicj4KJmd0OyAmZ3Q7ICZndDsgU2VudDogV2VkbmVzZGF5LCBBcHJp
bCAyOSwgMjAyMCA3OjUxIFBNPGJyPgomZ3Q7ICZndDsgJmd0OyBUbzogdHBtMiAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmZ3Q7ICZndDsgU3ViamVjdDogW3RwbTJdIEFyZSB0aGVy
ZSBhbnkgaGVscCBkb2N1bWVudHMvc2l0ZXMgb24gd3JpdGluZyBhbjxicj4KJmd0OyAmZ3Q7ICZn
dDsgRVNBUEkgcHJvZ3JhbS48YnI+CiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgJmd0OyBJ
IG5lZWQgdG8gcGVyZm9ybSBhIGNvbW1hbmQgdGhhdCBkb2VzbiYjMzk7dCBoYXZlIGEgdG9vbHMg
ZXhlY3V0YWJsZSB5ZXQ8YnI+CiZndDsgJmd0OyAmZ3Q7IChUUE0yX0VDREhfWkdlbikgYW5kIG9u
IGEgcGVyc2lzdGVudCBvYmplY3QgaGFuZGxlIHRoYXQgd29uJiMzOTt0IGJlPGJyPgomZ3Q7ICZn
dDsgJmd0OyBjb21wYXRpYmxlIHdpdGggdGhlIG9uLWRpc2sga2V5LWRhdGFiYXNlcyBvZiBGQVBJ
IG9yIFBLQ1MjMTEuwqAgU288YnI+CiZndDsgJmd0OyAmZ3Q7IHRoYXQgbWVhbnMgSSBuZWVkIHRv
IHdyaXRlIG15IG93biBjb2RlIGluIEMsIGFuZCB0aGF0IGNvZGUgbmVlZHMgdG8gdXNlIHRoZTxi
cj4KJmd0OyBFU0FQSS48YnI+CiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgJmd0OyBJJiMz
OTt2ZSBoYWQgYSBsb3Qgb2YgbGVhZCB0aW1lIHRvIHNlZSB0aGlzIGNvbWluZyBzbyBJJiMzOTt2
ZSBkb25lIGEgZmV3PGJyPgomZ3Q7ICZndDsgJmd0OyBsaXR0bGU8YnI+CiZndDsgJmd0OyBleHBl
cmltZW50cy48YnI+CiZndDsgJmd0OyAmZ3Q7IFRoZXkgaGF2ZSBub3QgaW1wcm92ZWQgbXkgY29u
ZmlkZW5jZSBpbiBteSB1bmRlcnN0YW5kaW5nIG9mIHRoZSBBUEkuPGJyPgomZ3Q7ICZndDsgJmd0
OyBGb3IgZXhhbXBsZSBJJiMzOTttIHN0aWxsIG5vdCBzdXJlIHdoaWNoIHN0cnVjdHVyZXMgSSYj
Mzk7bSBzdXBwb3NlZCB0bzxicj4KJmd0OyAmZ3Q7ICZndDsgYWNjZXNzIGRpcmVjdGx5IGFuZCB3
aGljaCBvbmVzIGFyZSBzdXBwb3NlZCB0byBiZSBtYW5pcHVsYXRlZCB1c2luZzxicj4KJmd0OyBm
dW5jdGlvbnMuPGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7ICZndDsgVGhlIFNwZWNz
IGFyZSBlaXRoZXIgbG9uZyBhbmQgdGhlb3JldGljYWwgb3IgZHJ5IGFuZCB0ZXJzZS7CoCBBbmQ8
YnI+CiZndDsgJmd0OyAmZ3Q7IGJvdGggdGhlIHRlc3RzIGZvciBUU1MgYW5kIHRoZSBzb3VyY2Ug
ZmlsZXMgZm9yIFRvb2xzIG1ha2UgdXNlIG9mPGJyPgomZ3Q7ICZndDsgJmd0OyBpbnRlcm5hbCBh
YnN0cmFjdGlvbiBsYXllcnMuwqAgSSYjMzk7bSBoYXZpbmcgdHJvdWJsZSBnZXR0aW5nIGE8YnI+
CiZndDsgJmd0OyAmZ3Q7IHdob2xlLXByb2Nlc3MgcGljdHVyZS7CoCBBcmUgdGhlcmUgYW55IHJl
c291cmNlcyBvdXQgdGhlcmUgdG8gaGVscCBtZTxicj4KJmd0OyAmZ3Q7ICZndDsgZ2V0IG15IHNl
YS1sZWdzIG9uIEVTQVBJPGJyPgomZ3Q7ICZndDsgY29kZT88YnI+CjwvYmxvY2txdW90ZT48L2Rp
dj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============0461463657306765022==--

