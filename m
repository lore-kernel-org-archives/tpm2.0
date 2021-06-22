Content-Type: multipart/mixed; boundary="===============6112276293684229833=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Sample applications
Date: Mon, 21 Jun 2021 18:30:45 -0700
Message-ID: <CAOCvsSkfZwWKyQ22Rah2b7yRZWqJrZBdDT0etGDiKoWQXj7iZA@mail.gmail.com>
In-Reply-To: CAFmPt0r6vidoGjvuVmD8hO8_ucw_AEoG4M9Lv+MsukzkQa2DxQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6112276293684229833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There's an unfortunate confusion in naming here.  The tpm2-tss project is a
set of libraries which contain all levels of the C API, including the low
level SAPI, the low-level-with-sane-defaults-and implementations ESAPI, and
the high-level FAPI.

The tpm2-tools project is a set of high-level command line tools.  Tools
beginning with tpm2 are based mostly on the ESAPI though they used to be
SAPI.  The TPM commands that the SAPI and ESAPI functions ape start with
tpm2.  Tools beginning with tss2 are based on the FAPI library functions
for some reason, maybe to ape the older IBM implementation?  Any tool has
significantly more helper code than the TSS C library and even the tpm2
commands are pretty high level.

The model of the ESAPI/tpm2 commands makes storing objects in the tpm
rather than on disk more straightforward or possible at all.  But managing
that is difficult which is why it's discouraged.

On Mon, Jun 21, 2021, 3:17 PM @rubynerd <x(a)rubynerd.net> wrote:

> Hi both,
>
> Thank you for your responses =E2=80=94 I appreciate your time. My apologi=
es for
> the delay in response, I've been on-call for the past week and the shift
> picked up at the end.
>
> I've started to read through the specification, but it is quite meaty. I
> initially shied away from reading it because I assumed it was for
> implementers of TPMs (i.e. TPM manufacturers) and not for
> application implementation, but that doesn't seem to be the case. I'm
> working my way through it, but as this isn't my day job right now it's
> quite slow going.
>
> Bill =E2=80=94 thank you for the code examples: it's actually the best ex=
plainer
> I've seen for how to use the different components of tpm2-tools together.
> Your example is almost exactly what I need, but I'm looking to keep the
> private key hidden & unavailable to the host, and also send the public key
> & corresponding attestation statement to a remote server, so the remote
> server can validate the attestation statement, then encrypt the secrets it
> needs to deliver to the host. The remote server can =E2=80=94 if my under=
standing
> of TPMs is correct! =E2=80=94 deliver the encrypted secrets to the host w=
ith the
> relatively secure understanding that only that host can decrypt them.
>
> I'm pretty confident it's possible to prototype the above with both
> tpm2-tools and your explanation above, and I'll continue when I get a
> little bit of free time.
>
> Concerning TSS: does TSS operate at a higher or lower level than the tools
> presented in tpm2-tools? I assumed that because tpm2-tools was compiled
> against tpm2-tss, it was a lower level API, but if it's possible to do wh=
at
> I'm looking to do in less steps, it seems like it should be higher? I
> didn't notice any executables produced when I compiled it for tpm2-tools,
> but I can check again.
>
> Because a command I was looking to use (I think "getekcertificate") wasn't
> present in the Ubuntu packaged tpm2-tools, I compiled the latest version
> from source, but the end result is one executable linked against several
> object files ("tpm2_getekcertificate" has become "tpm2 getekcertificate"),
> which added another layer of confusion because the commands above don't
> necessarily work as documented via StackOverflow.
>
> Once again, thank you so much for the assistance with navigation, I really
> appreciate it. Whilst my C skills are suboptimal at best, I am more than
> happy to contribute documentation upstream if there is interest.
>
> Thanks,
> Luke
>
> On Fri, Jun 18, 2021 at 5:20 PM Roberts, William C <
> william.c.roberts(a)intel.com> wrote:
>
>> Some tpm2-tools support --format=3Dpem=E2=80=8B. Make sure you're on a 4=
.0+
>> version. If you're on master,
>> you can even get the pem file during creation time. I am going to provide
>> what you can do with tpm2-tools,
>> however, there are also tools that start with tss2 prefix that use a
>> higher level API called FAPI. Those tools
>> might do what you want with far less steps then the tpm2 prefixed tools.
>> I CC'd Andreas Fuchs so he can
>> advise on those tools.
>>
>> # versions >=3D 4.0
>> tpm2_createprimary -c primary.ctx
>> tpm2_readpublic --format=3Dpem -o key.pem -c primary.ctx
>>
>> head key.pem
>> -----BEGIN PUBLIC KEY-----
>> MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtFeWoma5eS7x7XjR1QWp
>> <snip>
>>
>> # master
>> tpm2_createprimary -c primary.ctx --format=3Dpem -o key.pem
>>
>> For keys created with tpm2_create, you can use the readpublic option or
>> use tpm2_print
>> # readpublic example
>> tpm2_create -C primary.ctx -u key.pub -r key.priv
>> tpm2_load -C primary.ctx -u key.pub -r key.priv -c key.ctx
>> tpm2_readpublic --format=3Dpem -o key.pem -c key.ctx
>>
>> # print example
>> tpm2 print --type TPM2B_PUBLIC --format=3Dpem key.pub
>> -----BEGIN PUBLIC KEY-----
>> MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwEDts9Y64CGuHPjT/8nC
>> <snip>
>>
>> For the other portion of your question is "encrypting application
>> secrets" to the TPM.
>>
>> Thier's a few ways you could do this, but I would suggest using the
>> sealing function.
>> It creates a TPM protected object but instead of it containing a key the
>> tpm knows
>> how to use, it contains free form userdata, like the application
>> secretes, or if those
>> are too large to store in the TPM, an AES key to wrap those with.
>>
>> I would choose sealing first, it's the simplest. For AES wrapping I would
>> pick
>> AES 256 GCM but the key type and mode is up to you.
>>
>> To seal a secret, one would use tpm2_create with the -i option:
>>
>> # read secret from stdin with -i -, or use -i <file> to read from a file.
>> tpm2_create -C primary.ctx -i- -u key.pub -r key.priv <<< 'MY SECRET'
>>
>> # load
>> tpm2 load -C primary.ctx -u key.pub -r key.priv -c key.ctx
>>
>> # unseal secret from TPM
>> tpm2 unseal -c key.ctx
>> MY SECRET
>>
>> # for wrapping a secret with an AES Key, just make 'MY SECRET' an AES key
>> and use
>> openssl commands. Examples can be found here:
>> https://wiki.openssl.org/index.php/Enc
>>
>>
>> You can set passwords and policies on TPM objects as you see fit, and we
>> can help
>> you craft a policy.
>>
>> The man pages for the tools should have examples, you can just view the
>> markdown on
>> the github wiki as well:
>>
>> https://github.com/tpm2-software/tpm2-tools/tree/master/man
>>
>>
>> There are also examples in the test directory.
>>
>> Bill
>> ------------------------------
>> *From:* Steven Clark <davolfman(a)gmail.com>
>> *Sent:* Wednesday, June 16, 2021 8:33 PM
>> *To:* @rubynerd <x(a)rubynerd.net>
>> *Cc:* tpm2 <tpm2(a)lists.01.org>
>> *Subject:* [tpm2] Re: Sample applications
>>
>> On Wed, Jun 16, 2021 at 3:12 PM @rubynerd <x(a)rubynerd.net> wrote:
>> >
>> > Hi all,
>> >
>> > I'm looking to build an application which creates a key on a TPM & uses
>> the TPM to decrypt some application initialisation secrets delivered to =
the
>> application via a control-plane, which verifies the key the TPM will use=
 is
>> on a TPM.
>> >
>> > I'm struggling to find any sample applications/explanations/cookbooks
>> for tmp2-tools to prototype out how this would work =E2=80=94 in fact, I=
 can't find
>> an explainer of how to convert a key from "tss" format to PEM format. Is
>> there something I've missed, or is there a sample TPM application or
>> something kicking about I can refer to? I'm aware there are specification
>> PDF's, but these are unapproachable to someone with attention-span
>> disabilities.
>> >
>> > Thanks,
>> > Luke
>> > _______________________________________________
>> > tpm2 mailing list -- tpm2(a)lists.01.org
>> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>>
>> With tpm2-tools it's pretty easy if you've got a remotely up to date
>> version.  Most of the tools that need to interact with outside keys
>> natively support the SSL key types.  So you just interact with them on
>> the command line.
>>
>> If you want to actually program using the ESAPI and use outside key
>> formats my recommendation would be get comfortable reading the
>> structure definitions in the TPM2 specs (sometimes assisted by the
>> actual header files from the TSS), the ESAPI spec, and the OpenSSL API
>> man pages and learn to tear a key down into low level structures in
>> one API to reassemble in the other format.  The math is still the same
>> after all.
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>>
>

--===============6112276293684229833==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPlRoZXJlJiMzOTtzIGFuIHVuZm9ydHVuYXRlIGNvbmZ1c2lvbiBpbiBu
YW1pbmcgaGVyZS7CoCBUaGUgdHBtMi10c3MgcHJvamVjdCBpcyBhIHNldCBvZiBsaWJyYXJpZXMg
d2hpY2ggY29udGFpbiBhbGwgbGV2ZWxzIG9mIHRoZSBDIEFQSSwgaW5jbHVkaW5nIHRoZSBsb3cg
bGV2ZWwgU0FQSSwgdGhlIGxvdy1sZXZlbC13aXRoLXNhbmUtZGVmYXVsdHMtYW5kIGltcGxlbWVu
dGF0aW9ucyBFU0FQSSwgYW5kIHRoZSBoaWdoLWxldmVsIEZBUEkuPGRpdiBkaXI9ImF1dG8iPjxi
cj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+VGhlIHRwbTItdG9vbHMgcHJvamVjdCBpcyBhIHNldCBv
ZiBoaWdoLWxldmVsIGNvbW1hbmQgbGluZSB0b29scy7CoCBUb29scyBiZWdpbm5pbmcgd2l0aCB0
cG0yIGFyZSBiYXNlZCBtb3N0bHkgb24gdGhlIEVTQVBJIHRob3VnaCB0aGV5IHVzZWQgdG8gYmUg
U0FQSS7CoCBUaGUgVFBNIGNvbW1hbmRzIHRoYXQgdGhlIFNBUEkgYW5kIEVTQVBJIGZ1bmN0aW9u
cyBhcGUgc3RhcnQgd2l0aCB0cG0yLsKgIFRvb2xzIGJlZ2lubmluZyB3aXRoIHRzczIgYXJlIGJh
c2VkIG9uIHRoZSBGQVBJIGxpYnJhcnkgZnVuY3Rpb25zIGZvciBzb21lIHJlYXNvbiwgbWF5YmUg
dG8gYXBlIHRoZSBvbGRlciBJQk0gaW1wbGVtZW50YXRpb24/wqAgQW55IHRvb2wgaGFzIHNpZ25p
ZmljYW50bHkgbW9yZSBoZWxwZXIgY29kZSB0aGFuIHRoZSBUU1MgQyBsaWJyYXJ5IGFuZCBldmVu
IHRoZSB0cG0yIGNvbW1hbmRzIGFyZSBwcmV0dHkgaGlnaCBsZXZlbC48L2Rpdj48ZGl2IGRpcj0i
YXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5UaGUgbW9kZWwgb2YgdGhlIEVTQVBJL3Rw
bTIgY29tbWFuZHMgbWFrZXMgc3RvcmluZyBvYmplY3RzIGluIHRoZSB0cG0gcmF0aGVyIHRoYW4g
b24gZGlzayBtb3JlIHN0cmFpZ2h0Zm9yd2FyZCBvciBwb3NzaWJsZSBhdCBhbGwuwqAgQnV0IG1h
bmFnaW5nIHRoYXQgaXMgZGlmZmljdWx0IHdoaWNoIGlzIHdoeSBpdCYjMzk7cyBkaXNjb3VyYWdl
ZC48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIi
IGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24sIEp1biAyMSwgMjAyMSwgMzoxNyBQTSBAcnVieW5l
cmQgJmx0OzxhIGhyZWY9Im1haWx0bzp4QHJ1YnluZXJkLm5ldCI+eEBydWJ5bmVyZC5uZXQ8L2E+
Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1s
ZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+SGkgYm90aCw8ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5r
IHlvdSBmb3IgeW91ciByZXNwb25zZXMg4oCUIEkgYXBwcmVjaWF0ZSB5b3VyIHRpbWUuIE15IGFw
b2xvZ2llcyBmb3IgdGhlIGRlbGF5IGluIHJlc3BvbnNlLCBJJiMzOTt2ZSBiZWVuIG9uLWNhbGwg
Zm9yIHRoZSBwYXN0IHdlZWsgYW5kIHRoZSBzaGlmdCBwaWNrZWQgdXAgYXQgdGhlIGVuZC48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5O3ZlIHN0YXJ0ZWQgdG8gcmVhZCB0aHJvdWdoIHRo
ZSBzcGVjaWZpY2F0aW9uLCBidXQgaXQgaXMgcXVpdGUgbWVhdHkuIEkgaW5pdGlhbGx5IHNoaWVk
wqBhd2F5IGZyb20gcmVhZGluZyBpdCBiZWNhdXNlIEkgYXNzdW1lZCBpdCB3YXMgZm9yIGltcGxl
bWVudGVyc8Kgb2YgVFBNcyAoaS5lLiBUUE0gbWFudWZhY3R1cmVycykgYW5kIG5vdCBmb3IgYXBw
bGljYXRpb27CoGltcGxlbWVudGF0aW9uLCBidXQgdGhhdCBkb2VzbiYjMzk7dCBzZWVtIHRvIGJl
IHRoZSBjYXNlLiBJJiMzOTttIHdvcmtpbmcgbXkgd2F5IHRocm91Z2ggaXQsIGJ1dCBhcyB0aGlz
IGlzbiYjMzk7dCBteSBkYXkgam9iIHJpZ2h0IG5vdyBpdCYjMzk7cyBxdWl0ZSBzbG93IGdvaW5n
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QmlsbCDigJQgdGhhbmsgeW91IGZvciB0aGUgY29k
ZSBleGFtcGxlczogaXQmIzM5O3MgYWN0dWFsbHkgdGhlIGJlc3QgZXhwbGFpbmVyIEkmIzM5O3Zl
IHNlZW4gZm9yIGhvdyB0byB1c2UgdGhlIGRpZmZlcmVudCBjb21wb25lbnRzIG9mIHRwbTItdG9v
bHMgdG9nZXRoZXIuIFlvdXIgZXhhbXBsZSBpcyBhbG1vc3QgZXhhY3RseSB3aGF0IEkgbmVlZCwg
YnV0IEkmIzM5O20gbG9va2luZyB0byBrZWVwIHRoZSBwcml2YXRlIGtleSBoaWRkZW4gJmFtcDsg
dW5hdmFpbGFibGUgdG8gdGhlIGhvc3QsIGFuZCBhbHNvIHNlbmQgdGhlIHB1YmxpYyBrZXkgJmFt
cDsgY29ycmVzcG9uZGluZyBhdHRlc3RhdGlvbiBzdGF0ZW1lbnQgdG8gYSByZW1vdGUgc2VydmVy
LCBzbyB0aGUgcmVtb3RlIHNlcnZlciBjYW4gdmFsaWRhdGUgdGhlIGF0dGVzdGF0aW9uIHN0YXRl
bWVudCwgdGhlbiBlbmNyeXB0IHRoZSBzZWNyZXRzIGl0IG5lZWRzIHRvIGRlbGl2ZXIgdG8gdGhl
IGhvc3QuIFRoZSByZW1vdGUgc2VydmVyIGNhbiDigJQgaWYgbXkgdW5kZXJzdGFuZGluZyBvZiBU
UE1zIGlzIGNvcnJlY3QhIOKAlCBkZWxpdmVyIHRoZSBlbmNyeXB0ZWQgc2VjcmV0cyB0byB0aGUg
aG9zdCB3aXRoIHRoZSByZWxhdGl2ZWx5IHNlY3VyZSB1bmRlcnN0YW5kaW5nIHRoYXQgb25seSB0
aGF0IGhvc3QgY2FuIGRlY3J5cHQgdGhlbS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5
O20gcHJldHR5IGNvbmZpZGVudCBpdCYjMzk7cyBwb3NzaWJsZSB0byBwcm90b3R5cGUgdGhlwqBh
Ym92ZSB3aXRoIGJvdGggdHBtMi10b29scyBhbmQgeW91ciBleHBsYW5hdGlvbiBhYm92ZSwgYW5k
IEkmIzM5O2xsIGNvbnRpbnVlIHdoZW4gSSBnZXQgYSBsaXR0bGUgYml0IG9mIGZyZWUgdGltZS48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkNvbmNlcm5pbmcgVFNTOiBkb2VzIFRTUyBvcGVyYXRl
IGF0IGEgaGlnaGVyIG9yIGxvd2VyIGxldmVsIHRoYW4gdGhlIHRvb2xzIHByZXNlbnRlZCBpbiB0
cG0yLXRvb2xzPyBJIGFzc3VtZWQgdGhhdCBiZWNhdXNlIHRwbTItdG9vbHMgd2FzIGNvbXBpbGVk
IGFnYWluc3QgdHBtMi10c3MsIGl0IHdhcyBhIGxvd2VyIGxldmVsIEFQSSwgYnV0IGlmIGl0JiMz
OTtzIHBvc3NpYmxlIHRvIGRvIHdoYXQgSSYjMzk7bSBsb29raW5nIHRvIGRvIGluIGxlc3Mgc3Rl
cHMsIGl0IHNlZW1zIGxpa2UgaXQgc2hvdWxkIGJlIGhpZ2hlcj8gSSBkaWRuJiMzOTt0IG5vdGlj
ZSBhbnkgZXhlY3V0YWJsZXMgcHJvZHVjZWQgd2hlbiBJIGNvbXBpbGVkIGl0IGZvciB0cG0yLXRv
b2xzLCBidXQgSSBjYW4gY2hlY2sgYWdhaW4uPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5CZWNh
dXNlIGEgY29tbWFuZCBJIHdhcyBsb29raW5nIHRvIHVzZSAoSSB0aGluayAmcXVvdDtnZXRla2Nl
cnRpZmljYXRlJnF1b3Q7KSB3YXNuJiMzOTt0IHByZXNlbnQgaW4gdGhlIFVidW50dSBwYWNrYWdl
ZCB0cG0yLXRvb2xzLCBJIGNvbXBpbGVkIHRoZSBsYXRlc3QgdmVyc2lvbiBmcm9tIHNvdXJjZSwg
YnV0IHRoZSBlbmQgcmVzdWx0IGlzIG9uZSBleGVjdXRhYmxlIGxpbmtlZCBhZ2FpbnN0IHNldmVy
YWwgb2JqZWN0IGZpbGVzICgmcXVvdDt0cG0yX2dldGVrY2VydGlmaWNhdGUmcXVvdDsgaGFzIGJl
Y29tZSAmcXVvdDt0cG0ywqBnZXRla2NlcnRpZmljYXRlJnF1b3Q7KSwgd2hpY2ggYWRkZWQgYW5v
dGhlciBsYXllciBvZiBjb25mdXNpb24gYmVjYXVzZSB0aGUgY29tbWFuZHMgYWJvdmUgZG9uJiMz
OTt0IG5lY2Vzc2FyaWx5IHdvcmsgYXMgZG9jdW1lbnRlZCB2aWEgU3RhY2tPdmVyZmxvdy48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk9uY2UgYWdhaW4sIHRoYW5rIHlvdSBzbyBtdWNoIGZvciB0
aGUgYXNzaXN0YW5jZSB3aXRoIG5hdmlnYXRpb24sIEkgcmVhbGx5IGFwcHJlY2lhdGUgaXQuIFdo
aWxzdCBteSBDIHNraWxscyBhcmUgc3Vib3B0aW1hbCBhdCBiZXN0LCBJIGFtIG1vcmUgdGhhbiBo
YXBweSB0byBjb250cmlidXRlIGRvY3VtZW50YXRpb24gdXBzdHJlYW0gaWYgdGhlcmUgaXMgaW50
ZXJlc3QuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5MdWtlPC9k
aXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFz
cz0iZ21haWxfYXR0ciI+T24gRnJpLCBKdW4gMTgsIDIwMjEgYXQgNToyMCBQTSBSb2JlcnRzLCBX
aWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20i
IHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPndpbGxpYW0uYy5yb2JlcnRzQGludGVs
LmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVv
dGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlk
IHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+CgoKCgo8ZGl2IGRpcj0ibHRyIj4K
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJp
Zjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KU29tZSB0cG0yLXRvb2xzIHN1cHBv
cnQgPGNvZGU+LS1mb3JtYXQ9cGVtPC9jb2RlPuKAiy4gTWFrZSBzdXJlIHlvdSYjMzk7cmUgb24g
YSA0LjArIHZlcnNpb24uIElmIHlvdSYjMzk7cmUgb24gbWFzdGVyLDwvZGl2Pgo8ZGl2IHN0eWxl
PSJmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6
ZToxMnB0O2NvbG9yOnJnYigwLDAsMCkiPgp5b3UgY2FuIGV2ZW4gZ2V0IHRoZSBwZW0gZmlsZSBk
dXJpbmcgY3JlYXRpb24gdGltZS4gSSBhbSBnb2luZyB0byBwcm92aWRlIHdoYXQgeW91IGNhbiBk
byB3aXRoIHRwbTItdG9vbHMsPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmks
QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCww
KSI+Cmhvd2V2ZXIsIHRoZXJlIGFyZSBhbHNvIHRvb2xzIHRoYXQgc3RhcnQgd2l0aCB0c3MyIHBy
ZWZpeCB0aGF0IHVzZSBhIGhpZ2hlciBsZXZlbCBBUEkgY2FsbGVkIEZBUEkuIFRob3NlIHRvb2xz
PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJpYWwsSGVsdmV0aWNhLHNh
bnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+Cm1pZ2h0IGRvIHdoYXQg
eW91IHdhbnQgd2l0aCBmYXIgbGVzcyBzdGVwcyB0aGVuIHRoZSB0cG0yIHByZWZpeGVkIHRvb2xz
LiBJIENDJiMzOTtkIEFuZHJlYXMgRnVjaHMgc28gaGUgY2FuPC9kaXY+CjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OkNhbGlicmksQXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEy
cHQ7Y29sb3I6cmdiKDAsMCwwKSI+CmFkdmlzZSBvbiB0aG9zZSB0b29scy48L2Rpdj4KPGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250
LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KPGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9u
dC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJw
dDtjb2xvcjpyZ2IoMCwwLDApIj4KIyB2ZXJzaW9ucyAmZ3Q7PSA0LjA8L2Rpdj4KPGRpdiBzdHls
ZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNp
emU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KdHBtMl9jcmVhdGVwcmltYXJ5IC1jIHByaW1hcnku
Y3R4PGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2
ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KdHBtMl9y
ZWFkcHVibGljIC0tZm9ybWF0PXBlbSAtbyBrZXkucGVtIC1jIHByaW1hcnkuY3R4PGJyPgo8L2Rp
dj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1z
ZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KPGJyPgo8L2Rpdj4KPGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250
LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KaGVhZCBrZXkucGVtCjxkaXY+LS0tLS1CRUdJ
TiBQVUJMSUMgS0VZLS0tLS08L2Rpdj4KPGRpdj5NSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9D
QVE4QU1JSUJDZ0tDQVFFQXRGZVdvbWE1ZVM3eDdYalIxUVdwPC9kaXY+CjxkaXY+Jmx0O3NuaXAm
Z3Q7PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4jIG1hc3RlcjwvZGl2Pgo8ZGl2PnRwbTJf
Y3JlYXRlcHJpbWFyeSAtYyBwcmltYXJ5LmN0eCAtLWZvcm1hdD1wZW0gLW8ga2V5LnBlbTxicj4K
PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5Gb3Iga2V5cyBjcmVhdGVkIHdpdGggdHBtMl9j
cmVhdGUsIHlvdSBjYW4gdXNlIHRoZSByZWFkcHVibGljIG9wdGlvbiBvciB1c2UgdHBtMl9wcmlu
dDwvZGl2Pgo8ZGl2PiMgcmVhZHB1YmxpYyBleGFtcGxlPC9kaXY+CjxkaXY+dHBtMl9jcmVhdGUg
LUMgcHJpbWFyeS5jdHggLXUga2V5LnB1YiAtciBrZXkucHJpdjxicj4KPC9kaXY+CjxkaXY+dHBt
Ml9sb2FkIC1DIHByaW1hcnkuY3R4IC11IGtleS5wdWIgLXIga2V5LnByaXYgLWMga2V5LmN0eDwv
ZGl2Pgo8ZGl2PjxzcGFuIHN0eWxlPSJtYXJnaW46MHB4O2ZvbnQtc2l6ZToxMnB0Ij50cG0yX3Jl
YWRwdWJsaWMgLS1mb3JtYXQ9cGVtIC1vIGtleS5wZW0gLWMga2V5LmN0eDwvc3Bhbj48YnI+Cjxz
cGFuIHN0eWxlPSJtYXJnaW46MHB4O2ZvbnQtc2l6ZToxMnB0Ij48L3NwYW4+PGJyPgo8L2Rpdj4K
PGRpdj4jIHByaW50IGV4YW1wbGU8L2Rpdj4KPGRpdj50cG0yIHByaW50IC0tdHlwZSBUUE0yQl9Q
VUJMSUMgLS1mb3JtYXQ9cGVtIGtleS5wdWIKPGRpdj4tLS0tLUJFR0lOIFBVQkxJQyBLRVktLS0t
LTwvZGl2Pgo8ZGl2Pk1JSUJJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBUThBTUlJQkNnS0NBUUVB
d0VEdHM5WTY0Q0d1SFBqVC84bkM8L2Rpdj4KPGRpdj4mbHQ7c25pcCZndDs8L2Rpdj4KPC9kaXY+
CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5Gb3IgdGhlIG90aGVyIHBvcnRpb24gb2YgeW91ciBxdWVz
dGlvbiBpcyAmcXVvdDtlbmNyeXB0aW5nIGFwcGxpY2F0aW9uIHNlY3JldHMmcXVvdDsgdG8gdGhl
IFRQTS48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PlRoaWVyJiMzOTtzIGEgZmV3IHdheXMg
eW91IGNvdWxkIGRvIHRoaXMsIGJ1dCBJIHdvdWxkIHN1Z2dlc3QgdXNpbmcgdGhlIHNlYWxpbmcg
ZnVuY3Rpb24uPC9kaXY+CjxkaXY+SXQgY3JlYXRlcyBhIFRQTSBwcm90ZWN0ZWQgb2JqZWN0IGJ1
dCBpbnN0ZWFkIG9mIGl0IGNvbnRhaW5pbmcgYSBrZXkgdGhlIHRwbSBrbm93czwvZGl2Pgo8ZGl2
PmhvdyB0byB1c2UsIGl0IGNvbnRhaW5zIGZyZWUgZm9ybSB1c2VyZGF0YSwgbGlrZSB0aGUgYXBw
bGljYXRpb24gc2VjcmV0ZXMsIG9yIGlmIHRob3NlPC9kaXY+CjxkaXY+YXJlIHRvbyBsYXJnZSB0
byBzdG9yZSBpbiB0aGUgVFBNLCBhbiBBRVMga2V5IHRvIHdyYXAgdGhvc2Ugd2l0aC7CoDwvZGl2
Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+SSB3b3VsZCBjaG9vc2Ugc2VhbGluZyBmaXJzdCwgaXQm
IzM5O3MgdGhlIHNpbXBsZXN0LiBGb3IgQUVTIHdyYXBwaW5nIEkgd291bGQgcGljazwvZGl2Pgo8
ZGl2PkFFUyAyNTYgR0NNIGJ1dCB0aGUga2V5IHR5cGUgYW5kIG1vZGUgaXMgdXAgdG8geW91Ljwv
ZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+VG8gc2VhbCBhIHNlY3JldCwgb25lIHdvdWxkIHVz
ZSB0cG0yX2NyZWF0ZSB3aXRoIHRoZSAtaSBvcHRpb246PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4K
PGRpdj4jIHJlYWQgc2VjcmV0IGZyb20gc3RkaW4gd2l0aCAtaSAtLCBvciB1c2UgLWkgJmx0O2Zp
bGUmZ3Q7IHRvIHJlYWQgZnJvbSBhIGZpbGUuPC9kaXY+CjxkaXY+dHBtMl9jcmVhdGUgLUMgcHJp
bWFyeS5jdHggLWktIC11IGtleS5wdWIgLXIga2V5LnByaXYgJmx0OyZsdDsmbHQ7ICYjMzk7TVkg
U0VDUkVUJiMzOTs8YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+IyBsb2FkwqA8L2Rp
dj4KPGRpdj50cG0yIGxvYWQgLUMgcHJpbWFyeS5jdHggLXUga2V5LnB1YiAtciBrZXkucHJpdiAt
YyBrZXkuY3R4PGJyPgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PiMgdW5zZWFsIHNlY3Jl
dCBmcm9tIFRQTTwvZGl2Pgo8ZGl2PnRwbTIgdW5zZWFsIC1jIGtleS5jdHg8YnI+CjxzcGFuPk1Z
IFNFQ1JFVDwvc3Bhbj48YnI+CjwvZGl2Pgo8ZGl2PjxzcGFuPjxicj4KPC9zcGFuPjwvZGl2Pgo8
ZGl2PjxzcGFuPiMgZm9yIHdyYXBwaW5nIGEgc2VjcmV0IHdpdGggYW4gQUVTIEtleSwganVzdCBt
YWtlICYjMzk7TVkgU0VDUkVUJiMzOTsgYW4gQUVTIGtleSBhbmQgdXNlPC9zcGFuPjwvZGl2Pgo8
ZGl2PjxzcGFuPm9wZW5zc2wgY29tbWFuZHMuIEV4YW1wbGVzIGNhbiBiZSBmb3VuZCBoZXJlOjwv
c3Bhbj48L2Rpdj4KPGRpdj48c3Bhbj48YSBocmVmPSJodHRwczovL3dpa2kub3BlbnNzbC5vcmcv
aW5kZXgucGhwL0VuYyIgaWQ9Im1fMzQxNTQ3NjkyMTIzMjQ2MjkwMmdtYWlsLW1fLTIzNzMwNTEy
MzM3MjA2MDMzMjVMUGxuayIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+aHR0cHM6
Ly93aWtpLm9wZW5zc2wub3JnL2luZGV4LnBocC9FbmM8L2E+PGJyPgo8L3NwYW4+PC9kaXY+Cjxk
aXY+PC9kaXY+CjxkaXY+PHNwYW4+PGJyPgo8YnI+Cjwvc3Bhbj48L2Rpdj4KPGRpdj48c3Bhbj5Z
b3UgY2FuIHNldCBwYXNzd29yZHMgYW5kIHBvbGljaWVzIG9uIFRQTSBvYmplY3RzIGFzIHlvdSBz
ZWUgZml0LCBhbmQgd2UgY2FuIGhlbHA8L3NwYW4+PC9kaXY+CjxkaXY+PHNwYW4+eW91IGNyYWZ0
IGEgcG9saWN5Ljwvc3Bhbj48L2Rpdj4KPGRpdj48c3Bhbj48YnI+Cjwvc3Bhbj48L2Rpdj4KPGRp
dj48c3Bhbj5UaGUgbWFuIHBhZ2VzIGZvciB0aGUgdG9vbHMgc2hvdWxkIGhhdmUgZXhhbXBsZXMs
IHlvdSBjYW4ganVzdCB2aWV3IHRoZSBtYXJrZG93biBvbjwvc3Bhbj48L2Rpdj4KPGRpdj48c3Bh
bj50aGUgZ2l0aHViIHdpa2kgYXMgd2VsbDo8L3NwYW4+PC9kaXY+CjxkaXY+PHNwYW4+PGJyPgo8
L3NwYW4+PC9kaXY+CjxkaXY+PHNwYW4+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTIt
c29mdHdhcmUvdHBtMi10b29scy90cmVlL21hc3Rlci9tYW4iIGlkPSJtXzM0MTU0NzY5MjEyMzI0
NjI5MDJnbWFpbC1tXy0yMzczMDUxMjMzNzIwNjAzMzI1TFBsbmsiIHRhcmdldD0iX2JsYW5rIiBy
ZWw9Im5vcmVmZXJyZXIiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9v
bHMvdHJlZS9tYXN0ZXIvbWFuPC9hPjxicj4KPC9zcGFuPjwvZGl2Pgo8ZGl2PjwvZGl2Pgo8YnI+
CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5UaGVyZSBhcmUgYWxzbyBleGFtcGxlcyBpbiB0aGUgdGVz
dCBkaXJlY3RvcnkuPC9kaXY+CjxkaXY+PHNwYW4+PGJyPgo8L3NwYW4+PC9kaXY+CjxkaXY+PHNw
YW4+QmlsbDwvc3Bhbj48L2Rpdj4KPC9kaXY+CjxkaXYgaWQ9Im1fMzQxNTQ3NjkyMTIzMjQ2Mjkw
MmdtYWlsLW1fLTIzNzMwNTEyMzM3MjA2MDMzMjVhcHBlbmRvbnNlbmQiPjwvZGl2Pgo8aHIgc3R5
bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSI+CjxkaXYgaWQ9Im1fMzQxNTQ3Njky
MTIzMjQ2MjkwMmdtYWlsLW1fLTIzNzMwNTEyMzM3MjA2MDMzMjVkaXZScGx5RndkTXNnIiBkaXI9
Imx0ciI+PGZvbnQgZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZTox
MXB0IiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IFN0ZXZlbiBDbGFyayAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOmRhdm9sZm1hbkBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVm
ZXJyZXIiPmRhdm9sZm1hbkBnbWFpbC5jb208L2E+Jmd0Ozxicj4KPGI+U2VudDo8L2I+IFdlZG5l
c2RheSwgSnVuZSAxNiwgMjAyMSA4OjMzIFBNPGJyPgo8Yj5Ubzo8L2I+IEBydWJ5bmVyZCAmbHQ7
PGEgaHJlZj0ibWFpbHRvOnhAcnVieW5lcmQubmV0IiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3Jl
ZmVycmVyIj54QHJ1YnluZXJkLm5ldDwvYT4mZ3Q7PGJyPgo8Yj5DYzo8L2I+IHRwbTIgJmx0Ozxh
IGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9y
ZWZlcnJlciI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KPGI+U3ViamVjdDo8L2I+IFt0
cG0yXSBSZTogU2FtcGxlIGFwcGxpY2F0aW9uczwvZm9udD4KPGRpdj7CoDwvZGl2Pgo8L2Rpdj4K
PGRpdj48Zm9udCBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQiPgo8ZGl2Pk9u
IFdlZCwgSnVuIDE2LCAyMDIxIGF0IDM6MTIgUE0gQHJ1YnluZXJkICZsdDs8YSBocmVmPSJtYWls
dG86eEBydWJ5bmVyZC5uZXQiIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnhAcnVi
eW5lcmQubmV0PC9hPiZndDsgd3JvdGU6PGJyPgomZ3Q7PGJyPgomZ3Q7IEhpIGFsbCw8YnI+CiZn
dDs8YnI+CiZndDsgSSYjMzk7bSBsb29raW5nIHRvIGJ1aWxkIGFuIGFwcGxpY2F0aW9uIHdoaWNo
IGNyZWF0ZXMgYSBrZXkgb24gYSBUUE0gJmFtcDsgdXNlcyB0aGUgVFBNIHRvIGRlY3J5cHQgc29t
ZSBhcHBsaWNhdGlvbiBpbml0aWFsaXNhdGlvbiBzZWNyZXRzIGRlbGl2ZXJlZCB0byB0aGUgYXBw
bGljYXRpb24gdmlhIGEgY29udHJvbC1wbGFuZSwgd2hpY2ggdmVyaWZpZXMgdGhlIGtleSB0aGUg
VFBNIHdpbGwgdXNlIGlzIG9uIGEgVFBNLjxicj4KJmd0Ozxicj4KJmd0OyBJJiMzOTttIHN0cnVn
Z2xpbmcgdG8gZmluZCBhbnkgc2FtcGxlIGFwcGxpY2F0aW9ucy9leHBsYW5hdGlvbnMvY29va2Jv
b2tzIGZvciB0bXAyLXRvb2xzIHRvIHByb3RvdHlwZSBvdXQgaG93IHRoaXMgd291bGQgd29yayDi
gJQgaW4gZmFjdCwgSSBjYW4mIzM5O3QgZmluZCBhbiBleHBsYWluZXIgb2YgaG93IHRvIGNvbnZl
cnQgYSBrZXkgZnJvbSAmcXVvdDt0c3MmcXVvdDsgZm9ybWF0IHRvIFBFTSBmb3JtYXQuIElzIHRo
ZXJlIHNvbWV0aGluZyBJJiMzOTt2ZSBtaXNzZWQsIG9yIGlzIHRoZXJlCiBhIHNhbXBsZSBUUE0g
YXBwbGljYXRpb24gb3Igc29tZXRoaW5nIGtpY2tpbmcgYWJvdXQgSSBjYW4gcmVmZXIgdG8/IEkm
IzM5O20gYXdhcmUgdGhlcmUgYXJlIHNwZWNpZmljYXRpb24gUERGJiMzOTtzLCBidXQgdGhlc2Ug
YXJlIHVuYXBwcm9hY2hhYmxlIHRvIHNvbWVvbmUgd2l0aCBhdHRlbnRpb24tc3BhbiBkaXNhYmls
aXRpZXMuPGJyPgomZ3Q7PGJyPgomZ3Q7IFRoYW5rcyw8YnI+CiZndDsgTHVrZTxicj4KJmd0OyBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KJmd0OyB0
cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRh
cmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4K
Jmd0OyBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0y
LWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+dHBt
Mi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7ICUod2ViX3BhZ2VfdXJsKXNsaXN0aW5m
byUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPGJyPgo8YnI+CldpdGggdHBtMi10b29scyBp
dCYjMzk7cyBwcmV0dHkgZWFzeSBpZiB5b3UmIzM5O3ZlIGdvdCBhIHJlbW90ZWx5IHVwIHRvIGRh
dGU8YnI+CnZlcnNpb24uwqAgTW9zdCBvZiB0aGUgdG9vbHMgdGhhdCBuZWVkIHRvIGludGVyYWN0
IHdpdGggb3V0c2lkZSBrZXlzPGJyPgpuYXRpdmVseSBzdXBwb3J0IHRoZSBTU0wga2V5IHR5cGVz
LsKgIFNvIHlvdSBqdXN0IGludGVyYWN0IHdpdGggdGhlbSBvbjxicj4KdGhlIGNvbW1hbmQgbGlu
ZS48YnI+Cjxicj4KSWYgeW91IHdhbnQgdG8gYWN0dWFsbHkgcHJvZ3JhbSB1c2luZyB0aGUgRVNB
UEkgYW5kIHVzZSBvdXRzaWRlIGtleTxicj4KZm9ybWF0cyBteSByZWNvbW1lbmRhdGlvbiB3b3Vs
ZCBiZSBnZXQgY29tZm9ydGFibGUgcmVhZGluZyB0aGU8YnI+CnN0cnVjdHVyZSBkZWZpbml0aW9u
cyBpbiB0aGUgVFBNMiBzcGVjcyAoc29tZXRpbWVzIGFzc2lzdGVkIGJ5IHRoZTxicj4KYWN0dWFs
IGhlYWRlciBmaWxlcyBmcm9tIHRoZSBUU1MpLCB0aGUgRVNBUEkgc3BlYywgYW5kIHRoZSBPcGVu
U1NMIEFQSTxicj4KbWFuIHBhZ2VzIGFuZCBsZWFybiB0byB0ZWFyIGEga2V5IGRvd24gaW50byBs
b3cgbGV2ZWwgc3RydWN0dXJlcyBpbjxicj4Kb25lIEFQSSB0byByZWFzc2VtYmxlIGluIHRoZSBv
dGhlciBmb3JtYXQuwqAgVGhlIG1hdGggaXMgc3RpbGwgdGhlIHNhbWU8YnI+CmFmdGVyIGFsbC48
YnI+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgp0
cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRh
cmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4K
VG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2
ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnRwbTItbGVh
dmVAbGlzdHMuMDEub3JnPC9hPjxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQp
cy8lKF9pbnRlcm5hbF9uYW1lKXM8L2Rpdj4KPC9zcGFuPjwvZm9udD48L2Rpdj4KPC9kaXY+Cgo8
L2Jsb2NrcXVvdGU+PC9kaXY+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============6112276293684229833==--

