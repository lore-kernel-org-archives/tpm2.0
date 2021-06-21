Content-Type: multipart/mixed; boundary="===============3671074017325295081=="
MIME-Version: 1.0
From: at rubynerd <x at rubynerd.net>
Subject: [tpm2] Re: Sample applications
Date: Mon, 21 Jun 2021 23:17:13 +0100
Message-ID: <CAFmPt0r6vidoGjvuVmD8hO8_ucw_AEoG4M9Lv+MsukzkQa2DxQ@mail.gmail.com>
In-Reply-To: SN6PR11MB3437748857EB65C9933A54AFB80D9@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3671074017325295081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi both,

Thank you for your responses =E2=80=94 I appreciate your time. My apologies=
 for the
delay in response, I've been on-call for the past week and the shift picked
up at the end.

I've started to read through the specification, but it is quite meaty. I
initially shied away from reading it because I assumed it was for
implementers of TPMs (i.e. TPM manufacturers) and not for
application implementation, but that doesn't seem to be the case. I'm
working my way through it, but as this isn't my day job right now it's
quite slow going.

Bill =E2=80=94 thank you for the code examples: it's actually the best expl=
ainer
I've seen for how to use the different components of tpm2-tools together.
Your example is almost exactly what I need, but I'm looking to keep the
private key hidden & unavailable to the host, and also send the public key
& corresponding attestation statement to a remote server, so the remote
server can validate the attestation statement, then encrypt the secrets it
needs to deliver to the host. The remote server can =E2=80=94 if my underst=
anding
of TPMs is correct! =E2=80=94 deliver the encrypted secrets to the host wit=
h the
relatively secure understanding that only that host can decrypt them.

I'm pretty confident it's possible to prototype the above with both
tpm2-tools and your explanation above, and I'll continue when I get a
little bit of free time.

Concerning TSS: does TSS operate at a higher or lower level than the tools
presented in tpm2-tools? I assumed that because tpm2-tools was compiled
against tpm2-tss, it was a lower level API, but if it's possible to do what
I'm looking to do in less steps, it seems like it should be higher? I
didn't notice any executables produced when I compiled it for tpm2-tools,
but I can check again.

Because a command I was looking to use (I think "getekcertificate") wasn't
present in the Ubuntu packaged tpm2-tools, I compiled the latest version
from source, but the end result is one executable linked against several
object files ("tpm2_getekcertificate" has become "tpm2 getekcertificate"),
which added another layer of confusion because the commands above don't
necessarily work as documented via StackOverflow.

Once again, thank you so much for the assistance with navigation, I really
appreciate it. Whilst my C skills are suboptimal at best, I am more than
happy to contribute documentation upstream if there is interest.

Thanks,
Luke

On Fri, Jun 18, 2021 at 5:20 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> Some tpm2-tools support --format=3Dpem=E2=80=8B. Make sure you're on a 4.=
0+
> version. If you're on master,
> you can even get the pem file during creation time. I am going to provide
> what you can do with tpm2-tools,
> however, there are also tools that start with tss2 prefix that use a
> higher level API called FAPI. Those tools
> might do what you want with far less steps then the tpm2 prefixed tools. I
> CC'd Andreas Fuchs so he can
> advise on those tools.
>
> # versions >=3D 4.0
> tpm2_createprimary -c primary.ctx
> tpm2_readpublic --format=3Dpem -o key.pem -c primary.ctx
>
> head key.pem
> -----BEGIN PUBLIC KEY-----
> MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtFeWoma5eS7x7XjR1QWp
> <snip>
>
> # master
> tpm2_createprimary -c primary.ctx --format=3Dpem -o key.pem
>
> For keys created with tpm2_create, you can use the readpublic option or
> use tpm2_print
> # readpublic example
> tpm2_create -C primary.ctx -u key.pub -r key.priv
> tpm2_load -C primary.ctx -u key.pub -r key.priv -c key.ctx
> tpm2_readpublic --format=3Dpem -o key.pem -c key.ctx
>
> # print example
> tpm2 print --type TPM2B_PUBLIC --format=3Dpem key.pub
> -----BEGIN PUBLIC KEY-----
> MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwEDts9Y64CGuHPjT/8nC
> <snip>
>
> For the other portion of your question is "encrypting application secrets"
> to the TPM.
>
> Thier's a few ways you could do this, but I would suggest using the
> sealing function.
> It creates a TPM protected object but instead of it containing a key the
> tpm knows
> how to use, it contains free form userdata, like the application secretes,
> or if those
> are too large to store in the TPM, an AES key to wrap those with.
>
> I would choose sealing first, it's the simplest. For AES wrapping I would
> pick
> AES 256 GCM but the key type and mode is up to you.
>
> To seal a secret, one would use tpm2_create with the -i option:
>
> # read secret from stdin with -i -, or use -i <file> to read from a file.
> tpm2_create -C primary.ctx -i- -u key.pub -r key.priv <<< 'MY SECRET'
>
> # load
> tpm2 load -C primary.ctx -u key.pub -r key.priv -c key.ctx
>
> # unseal secret from TPM
> tpm2 unseal -c key.ctx
> MY SECRET
>
> # for wrapping a secret with an AES Key, just make 'MY SECRET' an AES key
> and use
> openssl commands. Examples can be found here:
> https://wiki.openssl.org/index.php/Enc
>
>
> You can set passwords and policies on TPM objects as you see fit, and we
> can help
> you craft a policy.
>
> The man pages for the tools should have examples, you can just view the
> markdown on
> the github wiki as well:
>
> https://github.com/tpm2-software/tpm2-tools/tree/master/man
>
>
> There are also examples in the test directory.
>
> Bill
> ------------------------------
> *From:* Steven Clark <davolfman(a)gmail.com>
> *Sent:* Wednesday, June 16, 2021 8:33 PM
> *To:* @rubynerd <x(a)rubynerd.net>
> *Cc:* tpm2 <tpm2(a)lists.01.org>
> *Subject:* [tpm2] Re: Sample applications
>
> On Wed, Jun 16, 2021 at 3:12 PM @rubynerd <x(a)rubynerd.net> wrote:
> >
> > Hi all,
> >
> > I'm looking to build an application which creates a key on a TPM & uses
> the TPM to decrypt some application initialisation secrets delivered to t=
he
> application via a control-plane, which verifies the key the TPM will use =
is
> on a TPM.
> >
> > I'm struggling to find any sample applications/explanations/cookbooks
> for tmp2-tools to prototype out how this would work =E2=80=94 in fact, I =
can't find
> an explainer of how to convert a key from "tss" format to PEM format. Is
> there something I've missed, or is there a sample TPM application or
> something kicking about I can refer to? I'm aware there are specification
> PDF's, but these are unapproachable to someone with attention-span
> disabilities.
> >
> > Thanks,
> > Luke
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
> With tpm2-tools it's pretty easy if you've got a remotely up to date
> version.  Most of the tools that need to interact with outside keys
> natively support the SSL key types.  So you just interact with them on
> the command line.
>
> If you want to actually program using the ESAPI and use outside key
> formats my recommendation would be get comfortable reading the
> structure definitions in the TPM2 specs (sometimes assisted by the
> actual header files from the TSS), the ESAPI spec, and the OpenSSL API
> man pages and learn to tear a key down into low level structures in
> one API to reassemble in the other format.  The math is still the same
> after all.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============3671074017325295081==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SGkgYm90aCw8ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rIHlvdSBmb3Ig
eW91ciByZXNwb25zZXMg4oCUIEkgYXBwcmVjaWF0ZSB5b3VyIHRpbWUuIE15IGFwb2xvZ2llcyBm
b3IgdGhlIGRlbGF5IGluIHJlc3BvbnNlLCBJJiMzOTt2ZSBiZWVuIG9uLWNhbGwgZm9yIHRoZSBw
YXN0IHdlZWsgYW5kIHRoZSBzaGlmdCBwaWNrZWQgdXAgYXQgdGhlIGVuZC48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PkkmIzM5O3ZlIHN0YXJ0ZWQgdG8gcmVhZCB0aHJvdWdoIHRoZSBzcGVjaWZp
Y2F0aW9uLCBidXQgaXQgaXMgcXVpdGUgbWVhdHkuIEkgaW5pdGlhbGx5IHNoaWVkwqBhd2F5IGZy
b20gcmVhZGluZyBpdCBiZWNhdXNlIEkgYXNzdW1lZCBpdCB3YXMgZm9yIGltcGxlbWVudGVyc8Kg
b2YgVFBNcyAoaS5lLiBUUE0gbWFudWZhY3R1cmVycykgYW5kIG5vdCBmb3IgYXBwbGljYXRpb27C
oGltcGxlbWVudGF0aW9uLCBidXQgdGhhdCBkb2VzbiYjMzk7dCBzZWVtIHRvIGJlIHRoZSBjYXNl
LiBJJiMzOTttIHdvcmtpbmcgbXkgd2F5IHRocm91Z2ggaXQsIGJ1dCBhcyB0aGlzIGlzbiYjMzk7
dCBteSBkYXkgam9iIHJpZ2h0IG5vdyBpdCYjMzk7cyBxdWl0ZSBzbG93IGdvaW5nLjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+QmlsbCDigJQgdGhhbmsgeW91IGZvciB0aGUgY29kZSBleGFtcGxl
czogaXQmIzM5O3MgYWN0dWFsbHkgdGhlIGJlc3QgZXhwbGFpbmVyIEkmIzM5O3ZlIHNlZW4gZm9y
IGhvdyB0byB1c2UgdGhlIGRpZmZlcmVudCBjb21wb25lbnRzIG9mIHRwbTItdG9vbHMgdG9nZXRo
ZXIuIFlvdXIgZXhhbXBsZSBpcyBhbG1vc3QgZXhhY3RseSB3aGF0IEkgbmVlZCwgYnV0IEkmIzM5
O20gbG9va2luZyB0byBrZWVwIHRoZSBwcml2YXRlIGtleSBoaWRkZW4gJmFtcDsgdW5hdmFpbGFi
bGUgdG8gdGhlIGhvc3QsIGFuZCBhbHNvIHNlbmQgdGhlIHB1YmxpYyBrZXkgJmFtcDsgY29ycmVz
cG9uZGluZyBhdHRlc3RhdGlvbiBzdGF0ZW1lbnQgdG8gYSByZW1vdGUgc2VydmVyLCBzbyB0aGUg
cmVtb3RlIHNlcnZlciBjYW4gdmFsaWRhdGUgdGhlIGF0dGVzdGF0aW9uIHN0YXRlbWVudCwgdGhl
biBlbmNyeXB0IHRoZSBzZWNyZXRzIGl0IG5lZWRzIHRvIGRlbGl2ZXIgdG8gdGhlIGhvc3QuIFRo
ZSByZW1vdGUgc2VydmVyIGNhbiDigJQgaWYgbXkgdW5kZXJzdGFuZGluZyBvZiBUUE1zIGlzIGNv
cnJlY3QhIOKAlCBkZWxpdmVyIHRoZSBlbmNyeXB0ZWQgc2VjcmV0cyB0byB0aGUgaG9zdCB3aXRo
IHRoZSByZWxhdGl2ZWx5IHNlY3VyZSB1bmRlcnN0YW5kaW5nIHRoYXQgb25seSB0aGF0IGhvc3Qg
Y2FuIGRlY3J5cHQgdGhlbS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5O20gcHJldHR5
IGNvbmZpZGVudCBpdCYjMzk7cyBwb3NzaWJsZSB0byBwcm90b3R5cGUgdGhlwqBhYm92ZSB3aXRo
IGJvdGggdHBtMi10b29scyBhbmQgeW91ciBleHBsYW5hdGlvbiBhYm92ZSwgYW5kIEkmIzM5O2xs
IGNvbnRpbnVlIHdoZW4gSSBnZXQgYSBsaXR0bGUgYml0IG9mIGZyZWUgdGltZS48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PkNvbmNlcm5pbmcgVFNTOiBkb2VzIFRTUyBvcGVyYXRlIGF0IGEgaGln
aGVyIG9yIGxvd2VyIGxldmVsIHRoYW4gdGhlIHRvb2xzIHByZXNlbnRlZCBpbiB0cG0yLXRvb2xz
PyBJIGFzc3VtZWQgdGhhdCBiZWNhdXNlIHRwbTItdG9vbHMgd2FzIGNvbXBpbGVkIGFnYWluc3Qg
dHBtMi10c3MsIGl0IHdhcyBhIGxvd2VyIGxldmVsIEFQSSwgYnV0IGlmIGl0JiMzOTtzIHBvc3Np
YmxlIHRvIGRvIHdoYXQgSSYjMzk7bSBsb29raW5nIHRvIGRvIGluIGxlc3Mgc3RlcHMsIGl0IHNl
ZW1zIGxpa2UgaXQgc2hvdWxkIGJlIGhpZ2hlcj8gSSBkaWRuJiMzOTt0IG5vdGljZSBhbnkgZXhl
Y3V0YWJsZXMgcHJvZHVjZWQgd2hlbiBJIGNvbXBpbGVkIGl0IGZvciB0cG0yLXRvb2xzLCBidXQg
SSBjYW4gY2hlY2sgYWdhaW4uPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5CZWNhdXNlIGEgY29t
bWFuZCBJIHdhcyBsb29raW5nIHRvIHVzZSAoSSB0aGluayAmcXVvdDtnZXRla2NlcnRpZmljYXRl
JnF1b3Q7KSB3YXNuJiMzOTt0IHByZXNlbnQgaW4gdGhlIFVidW50dSBwYWNrYWdlZCB0cG0yLXRv
b2xzLCBJIGNvbXBpbGVkIHRoZSBsYXRlc3QgdmVyc2lvbiBmcm9tIHNvdXJjZSwgYnV0IHRoZSBl
bmQgcmVzdWx0IGlzIG9uZSBleGVjdXRhYmxlIGxpbmtlZCBhZ2FpbnN0IHNldmVyYWwgb2JqZWN0
IGZpbGVzICgmcXVvdDt0cG0yX2dldGVrY2VydGlmaWNhdGUmcXVvdDsgaGFzIGJlY29tZSAmcXVv
dDt0cG0ywqBnZXRla2NlcnRpZmljYXRlJnF1b3Q7KSwgd2hpY2ggYWRkZWQgYW5vdGhlciBsYXll
ciBvZiBjb25mdXNpb24gYmVjYXVzZSB0aGUgY29tbWFuZHMgYWJvdmUgZG9uJiMzOTt0IG5lY2Vz
c2FyaWx5IHdvcmsgYXMgZG9jdW1lbnRlZCB2aWEgU3RhY2tPdmVyZmxvdy48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2Pk9uY2UgYWdhaW4sIHRoYW5rIHlvdSBzbyBtdWNoIGZvciB0aGUgYXNzaXN0
YW5jZSB3aXRoIG5hdmlnYXRpb24sIEkgcmVhbGx5IGFwcHJlY2lhdGUgaXQuIFdoaWxzdCBteSBD
IHNraWxscyBhcmUgc3Vib3B0aW1hbCBhdCBiZXN0LCBJIGFtIG1vcmUgdGhhbiBoYXBweSB0byBj
b250cmlidXRlIGRvY3VtZW50YXRpb24gdXBzdHJlYW0gaWYgdGhlcmUgaXMgaW50ZXJlc3QuPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5MdWtlPC9kaXY+PC9kaXY+
PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxf
YXR0ciI+T24gRnJpLCBKdW4gMTgsIDIwMjEgYXQgNToyMCBQTSBSb2JlcnRzLCBXaWxsaWFtIEMg
Jmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iPndpbGxpYW0u
Yy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBj
bGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+CgoKCgo8
ZGl2IGRpcj0ibHRyIj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2
ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KU29tZSB0
cG0yLXRvb2xzIHN1cHBvcnQgPGNvZGU+LS1mb3JtYXQ9cGVtPC9jb2RlPuKAiy4gTWFrZSBzdXJl
IHlvdSYjMzk7cmUgb24gYSA0LjArIHZlcnNpb24uIElmIHlvdSYjMzk7cmUgb24gbWFzdGVyLDwv
ZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZldGljYSxzYW5z
LXNlcmlmO2ZvbnQtc2l6ZToxMnB0O2NvbG9yOnJnYigwLDAsMCkiPgp5b3UgY2FuIGV2ZW4gZ2V0
IHRoZSBwZW0gZmlsZSBkdXJpbmcgY3JlYXRpb24gdGltZS4gSSBhbSBnb2luZyB0byBwcm92aWRl
IHdoYXQgeW91IGNhbiBkbyB3aXRoIHRwbTItdG9vbHMsPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQt
ZmFtaWx5OkNhbGlicmksQXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7
Y29sb3I6cmdiKDAsMCwwKSI+Cmhvd2V2ZXIsIHRoZXJlIGFyZSBhbHNvIHRvb2xzIHRoYXQgc3Rh
cnQgd2l0aCB0c3MyIHByZWZpeCB0aGF0IHVzZSBhIGhpZ2hlciBsZXZlbCBBUEkgY2FsbGVkIEZB
UEkuIFRob3NlIHRvb2xzPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJp
YWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+
Cm1pZ2h0IGRvIHdoYXQgeW91IHdhbnQgd2l0aCBmYXIgbGVzcyBzdGVwcyB0aGVuIHRoZSB0cG0y
IHByZWZpeGVkIHRvb2xzLiBJIENDJiMzOTtkIEFuZHJlYXMgRnVjaHMgc28gaGUgY2FuPC9kaXY+
CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJpYWwsSGVsdmV0aWNhLHNhbnMtc2Vy
aWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+CmFkdmlzZSBvbiB0aG9zZSB0b29s
cy48L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Es
c2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KPGJyPgo8L2Rpdj4K
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJp
Zjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KIyB2ZXJzaW9ucyAmZ3Q7PSA0LjA8
L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fu
cy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KdHBtMl9jcmVhdGVwcmlt
YXJ5IC1jIHByaW1hcnkuY3R4PGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2Fs
aWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2Io
MCwwLDApIj4KdHBtMl9yZWFkcHVibGljIC0tZm9ybWF0PXBlbSAtbyBrZXkucGVtIC1jIHByaW1h
cnkuY3R4PGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxI
ZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KPGJy
Pgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Es
c2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KaGVhZCBrZXkucGVt
CjxkaXY+LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS08L2Rpdj4KPGRpdj5NSUlCSWpBTkJna3Fo
a2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQXRGZVdvbWE1ZVM3eDdYalIxUVdwPC9kaXY+
CjxkaXY+Jmx0O3NuaXAmZ3Q7PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4jIG1hc3Rlcjwv
ZGl2Pgo8ZGl2PnRwbTJfY3JlYXRlcHJpbWFyeSAtYyBwcmltYXJ5LmN0eCAtLWZvcm1hdD1wZW0g
LW8ga2V5LnBlbTxicj4KPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5Gb3Iga2V5cyBjcmVh
dGVkIHdpdGggdHBtMl9jcmVhdGUsIHlvdSBjYW4gdXNlIHRoZSByZWFkcHVibGljIG9wdGlvbiBv
ciB1c2UgdHBtMl9wcmludDwvZGl2Pgo8ZGl2PiMgcmVhZHB1YmxpYyBleGFtcGxlPC9kaXY+Cjxk
aXY+dHBtMl9jcmVhdGUgLUMgcHJpbWFyeS5jdHggLXUga2V5LnB1YiAtciBrZXkucHJpdjxicj4K
PC9kaXY+CjxkaXY+dHBtMl9sb2FkIC1DIHByaW1hcnkuY3R4IC11IGtleS5wdWIgLXIga2V5LnBy
aXYgLWMga2V5LmN0eDwvZGl2Pgo8ZGl2PjxzcGFuIHN0eWxlPSJtYXJnaW46MHB4O2ZvbnQtc2l6
ZToxMnB0Ij50cG0yX3JlYWRwdWJsaWMgLS1mb3JtYXQ9cGVtIC1vIGtleS5wZW0gLWMga2V5LmN0
eDwvc3Bhbj48YnI+CjxzcGFuIHN0eWxlPSJtYXJnaW46MHB4O2ZvbnQtc2l6ZToxMnB0Ij48L3Nw
YW4+PGJyPgo8L2Rpdj4KPGRpdj4jIHByaW50IGV4YW1wbGU8L2Rpdj4KPGRpdj50cG0yIHByaW50
IC0tdHlwZSBUUE0yQl9QVUJMSUMgLS1mb3JtYXQ9cGVtIGtleS5wdWIKPGRpdj4tLS0tLUJFR0lO
IFBVQkxJQyBLRVktLS0tLTwvZGl2Pgo8ZGl2Pk1JSUJJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NB
UThBTUlJQkNnS0NBUUVBd0VEdHM5WTY0Q0d1SFBqVC84bkM8L2Rpdj4KPGRpdj4mbHQ7c25pcCZn
dDs8L2Rpdj4KPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5Gb3IgdGhlIG90aGVyIHBvcnRp
b24gb2YgeW91ciBxdWVzdGlvbiBpcyAmcXVvdDtlbmNyeXB0aW5nIGFwcGxpY2F0aW9uIHNlY3Jl
dHMmcXVvdDsgdG8gdGhlIFRQTS48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PlRoaWVyJiMz
OTtzIGEgZmV3IHdheXMgeW91IGNvdWxkIGRvIHRoaXMsIGJ1dCBJIHdvdWxkIHN1Z2dlc3QgdXNp
bmcgdGhlIHNlYWxpbmcgZnVuY3Rpb24uPC9kaXY+CjxkaXY+SXQgY3JlYXRlcyBhIFRQTSBwcm90
ZWN0ZWQgb2JqZWN0IGJ1dCBpbnN0ZWFkIG9mIGl0IGNvbnRhaW5pbmcgYSBrZXkgdGhlIHRwbSBr
bm93czwvZGl2Pgo8ZGl2PmhvdyB0byB1c2UsIGl0IGNvbnRhaW5zIGZyZWUgZm9ybSB1c2VyZGF0
YSwgbGlrZSB0aGUgYXBwbGljYXRpb24gc2VjcmV0ZXMsIG9yIGlmIHRob3NlPC9kaXY+CjxkaXY+
YXJlIHRvbyBsYXJnZSB0byBzdG9yZSBpbiB0aGUgVFBNLCBhbiBBRVMga2V5IHRvIHdyYXAgdGhv
c2Ugd2l0aC7CoDwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+SSB3b3VsZCBjaG9vc2Ugc2Vh
bGluZyBmaXJzdCwgaXQmIzM5O3MgdGhlIHNpbXBsZXN0LiBGb3IgQUVTIHdyYXBwaW5nIEkgd291
bGQgcGljazwvZGl2Pgo8ZGl2PkFFUyAyNTYgR0NNIGJ1dCB0aGUga2V5IHR5cGUgYW5kIG1vZGUg
aXMgdXAgdG8geW91LjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+VG8gc2VhbCBhIHNlY3Jl
dCwgb25lIHdvdWxkIHVzZSB0cG0yX2NyZWF0ZSB3aXRoIHRoZSAtaSBvcHRpb246PC9kaXY+Cjxk
aXY+PGJyPgo8L2Rpdj4KPGRpdj4jIHJlYWQgc2VjcmV0IGZyb20gc3RkaW4gd2l0aCAtaSAtLCBv
ciB1c2UgLWkgJmx0O2ZpbGUmZ3Q7IHRvIHJlYWQgZnJvbSBhIGZpbGUuPC9kaXY+CjxkaXY+dHBt
Ml9jcmVhdGUgLUMgcHJpbWFyeS5jdHggLWktIC11IGtleS5wdWIgLXIga2V5LnByaXYgJmx0OyZs
dDsmbHQ7ICYjMzk7TVkgU0VDUkVUJiMzOTs8YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+Cjxk
aXY+IyBsb2FkwqA8L2Rpdj4KPGRpdj50cG0yIGxvYWQgLUMgcHJpbWFyeS5jdHggLXUga2V5LnB1
YiAtciBrZXkucHJpdiAtYyBrZXkuY3R4PGJyPgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2
PiMgdW5zZWFsIHNlY3JldCBmcm9tIFRQTTwvZGl2Pgo8ZGl2PnRwbTIgdW5zZWFsIC1jIGtleS5j
dHg8YnI+CjxzcGFuPk1ZIFNFQ1JFVDwvc3Bhbj48YnI+CjwvZGl2Pgo8ZGl2PjxzcGFuPjxicj4K
PC9zcGFuPjwvZGl2Pgo8ZGl2PjxzcGFuPiMgZm9yIHdyYXBwaW5nIGEgc2VjcmV0IHdpdGggYW4g
QUVTIEtleSwganVzdCBtYWtlICYjMzk7TVkgU0VDUkVUJiMzOTsgYW4gQUVTIGtleSBhbmQgdXNl
PC9zcGFuPjwvZGl2Pgo8ZGl2PjxzcGFuPm9wZW5zc2wgY29tbWFuZHMuIEV4YW1wbGVzIGNhbiBi
ZSBmb3VuZCBoZXJlOjwvc3Bhbj48L2Rpdj4KPGRpdj48c3Bhbj48YSBocmVmPSJodHRwczovL3dp
a2kub3BlbnNzbC5vcmcvaW5kZXgucGhwL0VuYyIgaWQ9ImdtYWlsLW1fLTIzNzMwNTEyMzM3MjA2
MDMzMjVMUGxuayIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vd2lraS5vcGVuc3NsLm9yZy9pbmRl
eC5waHAvRW5jPC9hPjxicj4KPC9zcGFuPjwvZGl2Pgo8ZGl2PjwvZGl2Pgo8ZGl2PjxzcGFuPjxi
cj4KPGJyPgo8L3NwYW4+PC9kaXY+CjxkaXY+PHNwYW4+WW91IGNhbiBzZXQgcGFzc3dvcmRzIGFu
ZCBwb2xpY2llcyBvbiBUUE0gb2JqZWN0cyBhcyB5b3Ugc2VlIGZpdCwgYW5kIHdlIGNhbiBoZWxw
PC9zcGFuPjwvZGl2Pgo8ZGl2PjxzcGFuPnlvdSBjcmFmdCBhIHBvbGljeS48L3NwYW4+PC9kaXY+
CjxkaXY+PHNwYW4+PGJyPgo8L3NwYW4+PC9kaXY+CjxkaXY+PHNwYW4+VGhlIG1hbiBwYWdlcyBm
b3IgdGhlIHRvb2xzIHNob3VsZCBoYXZlIGV4YW1wbGVzLCB5b3UgY2FuIGp1c3QgdmlldyB0aGUg
bWFya2Rvd24gb248L3NwYW4+PC9kaXY+CjxkaXY+PHNwYW4+dGhlIGdpdGh1YiB3aWtpIGFzIHdl
bGw6PC9zcGFuPjwvZGl2Pgo8ZGl2PjxzcGFuPjxicj4KPC9zcGFuPjwvZGl2Pgo8ZGl2PjxzcGFu
PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvdHJl
ZS9tYXN0ZXIvbWFuIiBpZD0iZ21haWwtbV8tMjM3MzA1MTIzMzcyMDYwMzMyNUxQbG5rIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy90
cmVlL21hc3Rlci9tYW48L2E+PGJyPgo8L3NwYW4+PC9kaXY+CjxkaXY+PC9kaXY+Cjxicj4KPGRp
dj48YnI+CjwvZGl2Pgo8ZGl2PlRoZXJlIGFyZSBhbHNvIGV4YW1wbGVzIGluIHRoZSB0ZXN0IGRp
cmVjdG9yeS48L2Rpdj4KPGRpdj48c3Bhbj48YnI+Cjwvc3Bhbj48L2Rpdj4KPGRpdj48c3Bhbj5C
aWxsPC9zcGFuPjwvZGl2Pgo8L2Rpdj4KPGRpdiBpZD0iZ21haWwtbV8tMjM3MzA1MTIzMzcyMDYw
MzMyNWFwcGVuZG9uc2VuZCI+PC9kaXY+CjxociBzdHlsZT0iZGlzcGxheTppbmxpbmUtYmxvY2s7
d2lkdGg6OTglIj4KPGRpdiBpZD0iZ21haWwtbV8tMjM3MzA1MTIzMzcyMDYwMzMyNWRpdlJwbHlG
d2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0i
Zm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gU3RldmVuIENsYXJr
ICZsdDs8YSBocmVmPSJtYWlsdG86ZGF2b2xmbWFuQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmRhdm9sZm1hbkBnbWFpbC5jb208L2E+Jmd0Ozxicj4KPGI+U2VudDo8L2I+IFdlZG5lc2RheSwg
SnVuZSAxNiwgMjAyMSA4OjMzIFBNPGJyPgo8Yj5Ubzo8L2I+IEBydWJ5bmVyZCAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOnhAcnVieW5lcmQubmV0IiB0YXJnZXQ9Il9ibGFuayI+eEBydWJ5bmVyZC5uZXQ8
L2E+Jmd0Ozxicj4KPGI+Q2M6PC9iPiB0cG0yICZsdDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0
cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgo8
Yj5TdWJqZWN0OjwvYj4gW3RwbTJdIFJlOiBTYW1wbGUgYXBwbGljYXRpb25zPC9mb250Pgo8ZGl2
PsKgPC9kaXY+CjwvZGl2Pgo8ZGl2Pjxmb250IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTFwdCI+CjxkaXY+T24gV2VkLCBKdW4gMTYsIDIwMjEgYXQgMzoxMiBQTSBAcnVieW5lcmQg
Jmx0OzxhIGhyZWY9Im1haWx0bzp4QHJ1YnluZXJkLm5ldCIgdGFyZ2V0PSJfYmxhbmsiPnhAcnVi
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
cmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgVG8gdW5zdWJzY3Jp
YmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5v
cmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsg
JSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+
Cjxicj4KV2l0aCB0cG0yLXRvb2xzIGl0JiMzOTtzIHByZXR0eSBlYXN5IGlmIHlvdSYjMzk7dmUg
Z290IGEgcmVtb3RlbHkgdXAgdG8gZGF0ZTxicj4KdmVyc2lvbi7CoCBNb3N0IG9mIHRoZSB0b29s
cyB0aGF0IG5lZWQgdG8gaW50ZXJhY3Qgd2l0aCBvdXRzaWRlIGtleXM8YnI+Cm5hdGl2ZWx5IHN1
cHBvcnQgdGhlIFNTTCBrZXkgdHlwZXMuwqAgU28geW91IGp1c3QgaW50ZXJhY3Qgd2l0aCB0aGVt
IG9uPGJyPgp0aGUgY29tbWFuZCBsaW5lLjxicj4KPGJyPgpJZiB5b3Ugd2FudCB0byBhY3R1YWxs
eSBwcm9ncmFtIHVzaW5nIHRoZSBFU0FQSSBhbmQgdXNlIG91dHNpZGUga2V5PGJyPgpmb3JtYXRz
IG15IHJlY29tbWVuZGF0aW9uIHdvdWxkIGJlIGdldCBjb21mb3J0YWJsZSByZWFkaW5nIHRoZTxi
cj4Kc3RydWN0dXJlIGRlZmluaXRpb25zIGluIHRoZSBUUE0yIHNwZWNzIChzb21ldGltZXMgYXNz
aXN0ZWQgYnkgdGhlPGJyPgphY3R1YWwgaGVhZGVyIGZpbGVzIGZyb20gdGhlIFRTUyksIHRoZSBF
U0FQSSBzcGVjLCBhbmQgdGhlIE9wZW5TU0wgQVBJPGJyPgptYW4gcGFnZXMgYW5kIGxlYXJuIHRv
IHRlYXIgYSBrZXkgZG93biBpbnRvIGxvdyBsZXZlbCBzdHJ1Y3R1cmVzIGluPGJyPgpvbmUgQVBJ
IHRvIHJlYXNzZW1ibGUgaW4gdGhlIG90aGVyIGZvcm1hdC7CoCBUaGUgbWF0aCBpcyBzdGlsbCB0
aGUgc2FtZTxicj4KYWZ0ZXIgYWxsLjxicj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0
bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9h
Pjxicj4KVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBt
Mi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAx
Lm9yZzwvYT48YnI+CiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJu
YWxfbmFtZSlzPC9kaXY+Cjwvc3Bhbj48L2ZvbnQ+PC9kaXY+CjwvZGl2PgoKPC9ibG9ja3F1b3Rl
PjwvZGl2Pgo=

--===============3671074017325295081==--

