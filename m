Content-Type: multipart/mixed; boundary="===============2842772175552084234=="
MIME-Version: 1.0
From: Ashok Kumar <ashokar.1980 at gmail.com>
Subject: Re: [tpm2] Using TPM to protect private key
Date: Thu, 12 Sep 2019 17:07:42 +0530
Message-ID: <CAE8e83RH7g+rfTx5YxqRsbdxDqTfLMDAyT8N5Uwj5LffhTLj_w@mail.gmail.com>
In-Reply-To: 688D07BB9E3A9E4A852BA1336D1910FF907A19B1@fmsmsx104.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2842772175552084234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for your response. Please see inline... [ashoka]

Regards,
Ashok Kumar

On Wed, Sep 11, 2019 at 10:15 PM Desai, Imran <imran.desai(a)intel.com> wro=
te:

> Ashok, for what you are doing, tpm2-tss-engine may be more suitable. It is
> available here: https://github.com/tpm2-software/tpm2-tss-engine.
> The readme has an example of how to create a self signed certificate with
> the private key generated and protected by the TPM.
>

[ashoka]
Sure, going through the code now.


> If you are planning to do it the tpm2-tools way instead, There are two
> ways the key can reside as a TPM2 object.
> 1. Create the key using the tpm2_create command
> 2. Import an existing key to the TPM2 using tpm2_import or
> tpm2_loadexternal. (Existing key may be generated with openssl etc.)
>

[ashoka]
In our case, it is the option #2. The key is already generated or will be
imported. Going forward,
we may support option #1 as well.


>
> In general there is an auth/ passphrase associated with the key. Being
> root does not give you exclusive access to the tpm2 key. So long as the
> passphrase or auth is satisfied the key is accessible.
>

[ashoka]
As there is no manual intervention, I thought of using NULL passphrase.
Even if we use passphrase,
we may have to hard-code that passphrase in the app. right?


>
> Man pages for the tools is the best place to find examples and
> explanations for the tools.

All the necessary packages and dependencies information can be found here
> https://github.com/tpm2-software/tpm2-tools/wiki/Dependency-Matrix
>
> Yes we use the IBM simulator for the testing.
>
> You may choose any distribution and install the necessary dependencies.
> All projects tpm2-software are built with autotools which will hint you on
> missing dependencies for your distribution/ installation.
>
>
[ashoka]
Sure, thanks!

 ------------------------------

>
> Message: 4
> Date: Wed, 11 Sep 2019 17:04:18 +0530
> From: Ashok Kumar <ashokar.1980(a)gmail.com>
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Using TPM to protect private key
> Message-ID:
>         <
> CAE8e83SGvJDQhGuHuSUH-ngVk4GkbergqfP-qA3z8roptkZW7w(a)mail.gmail.com>
> Content-Type: text/plain; charset=3D"utf-8"
>
> Hi,
>
> We are planning to use TPM2.0 to protect private key for the certificate.
> Need your help to understand/clarify the following.
>
> 1) What is the proper way to protect the private key using TPM?
>
> 2) Shall we just encrypt the private-key using the TPM? In that case,
>      if somebody has root access, then they can execute a tool which can
> send
>      command to TPM in order to decrypt the private-key. That is still
> vulnerable.
>      Am I missing something?
>
> 3) Are there any abstract API which would work for both TPM1.2 or TPM2.0?
>     Or, application (or wrapper API) needs to call hardware specific
> library functions?
>
> 4) If there are any good document or write-ups about things-to-do to make
> use of
>     TPM2 functionality in application code (especially to protect private
> keys),
>      that will be very helpful.
>
> 5) We are using Ubuntu 18.04 LTS. What are all the packages (and
> dependencies)
>      we need to install?
>
>      I see that tss2 package is available in 18.04. But not sure which
> package has
>      the resource manager. Also, if I want to test with simulator, should
> we use
>      the one provided by IBM?
>      Another TPM2 stack (from Intel) is available in github (tpm2-tss).
> Which one
>      is better to use in Ubuntu 18.04 LTS.
>
> Regards,
> Ashok Kumar
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <
> http://lists.01.org/pipermail/tpm2/attachments/20190911/ae5aca46/attachme=
nt.html
> >
>
> ------------------------------
>
> Subject: Digest Footer
>
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
>
>
> ------------------------------
>
> End of tpm2 Digest, Vol 27, Issue 10
> ************************************
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
>

--===============2842772175552084234==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2PjxkaXYgZGlyPSJsdHIiPlRo
YW5rcyBmb3IgeW91ciByZXNwb25zZS4gUGxlYXNlIHNlZSBpbmxpbmUuLi4gW2FzaG9rYV08L2Rp
dj48ZGl2IGRpcj0ibHRyIj48YnIgY2xlYXI9ImFsbCI+PGRpdj48ZGl2IGRpcj0ibHRyIiBjbGFz
cz0iZ21haWxfc2lnbmF0dXJlIiBkYXRhLXNtYXJ0bWFpbD0iZ21haWxfc2lnbmF0dXJlIj48ZGl2
IGRpcj0ibHRyIj5SZWdhcmRzLDxkaXY+QXNob2sgS3VtYXI8L2Rpdj48L2Rpdj48L2Rpdj48L2Rp
dj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNz
PSJnbWFpbF9hdHRyIj5PbiBXZWQsIFNlcCAxMSwgMjAxOSBhdCAxMDoxNSBQTSBEZXNhaSwgSW1y
YW4gJmx0OzxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iPmltcmFuLmRlc2Fp
QGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21h
aWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4
IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+QXNob2ssIGZvciB3aGF0
IHlvdSBhcmUgZG9pbmcsIHRwbTItdHNzLWVuZ2luZSBtYXkgYmUgbW9yZSBzdWl0YWJsZS4gSXQg
aXMgYXZhaWxhYmxlIGhlcmU6IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3
YXJlL3RwbTItdHNzLWVuZ2luZSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3MtZW5naW5lPC9hPi48YnI+ClRo
ZSByZWFkbWUgaGFzIGFuIGV4YW1wbGUgb2YgaG93IHRvIGNyZWF0ZSBhIHNlbGYgc2lnbmVkIGNl
cnRpZmljYXRlIHdpdGggdGhlIHByaXZhdGUga2V5IGdlbmVyYXRlZCBhbmQgcHJvdGVjdGVkIGJ5
IHRoZSBUUE0uPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2Plthc2hva2FdPC9k
aXY+PGRpdj5TdXJlLCBnb2luZyB0aHJvdWdoIHRoZSBjb2RlIG5vdy48L2Rpdj48ZGl2PsKgPC9k
aXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHgg
MHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmct
bGVmdDoxZXgiPgpJZiB5b3UgYXJlIHBsYW5uaW5nIHRvIGRvIGl0IHRoZSB0cG0yLXRvb2xzIHdh
eSBpbnN0ZWFkLCBUaGVyZSBhcmUgdHdvIHdheXMgdGhlIGtleSBjYW4gcmVzaWRlIGFzIGEgVFBN
MiBvYmplY3QuPGJyPgoxLiBDcmVhdGUgdGhlIGtleSB1c2luZyB0aGUgdHBtMl9jcmVhdGUgY29t
bWFuZDxicj4KMi4gSW1wb3J0IGFuIGV4aXN0aW5nIGtleSB0byB0aGUgVFBNMiB1c2luZyB0cG0y
X2ltcG9ydCBvciB0cG0yX2xvYWRleHRlcm5hbC4gKEV4aXN0aW5nIGtleSBtYXkgYmUgZ2VuZXJh
dGVkIHdpdGggb3BlbnNzbCBldGMuKTxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRp
dj5bYXNob2thXTwvZGl2PjxkaXY+SW4gb3VyIGNhc2UsIGl0IGlzIHRoZSBvcHRpb24gIzIuIFRo
ZSBrZXkgaXMgYWxyZWFkeSBnZW5lcmF0ZWQgb3Igd2lsbCBiZSBpbXBvcnRlZC4gR29pbmcgZm9y
d2FyZCw8L2Rpdj48ZGl2PndlIG1heSBzdXBwb3J0IG9wdGlvbiAjMSBhcyB3ZWxsLjwvZGl2Pjxk
aXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46
MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7
cGFkZGluZy1sZWZ0OjFleCI+Cjxicj4KSW4gZ2VuZXJhbCB0aGVyZSBpcyBhbiBhdXRoLyBwYXNz
cGhyYXNlIGFzc29jaWF0ZWQgd2l0aCB0aGUga2V5LiBCZWluZyByb290IGRvZXMgbm90IGdpdmUg
eW91IGV4Y2x1c2l2ZSBhY2Nlc3MgdG8gdGhlIHRwbTIga2V5LiBTbyBsb25nIGFzIHRoZSBwYXNz
cGhyYXNlIG9yIGF1dGggaXMgc2F0aXNmaWVkIHRoZSBrZXkgaXMgYWNjZXNzaWJsZS48YnI+PC9i
bG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+W2FzaG9rYV08L2Rpdj48ZGl2PkFzIHRoZXJl
IGlzIG5vIG1hbnVhbCBpbnRlcnZlbnRpb24sIEkgdGhvdWdodCBvZiB1c2luZyBOVUxMIHBhc3Nw
aHJhc2UuIEV2ZW4gaWYgd2UgdXNlIHBhc3NwaHJhc2UsPC9kaXY+PGRpdj53ZSBtYXkgaGF2ZSB0
byBoYXJkLWNvZGUgdGhhdCBwYXNzcGhyYXNlIGluIHRoZSBhcHAuIHJpZ2h0PzwvZGl2PjxkaXY+
wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4
IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFk
ZGluZy1sZWZ0OjFleCI+Cjxicj4KTWFuIHBhZ2VzIGZvciB0aGUgdG9vbHMgaXMgdGhlIGJlc3Qg
cGxhY2UgdG8gZmluZCBleGFtcGxlcyBhbmQgZXhwbGFuYXRpb25zIGZvciB0aGUgdG9vbHMuwqA8
L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2lu
OjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQp
O3BhZGRpbmctbGVmdDoxZXgiPgpBbGwgdGhlIG5lY2Vzc2FyeSBwYWNrYWdlcyBhbmQgZGVwZW5k
ZW5jaWVzIGluZm9ybWF0aW9uIGNhbiBiZSBmb3VuZCBoZXJlIDxhIGhyZWY9Imh0dHBzOi8vZ2l0
aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvd2lraS9EZXBlbmRlbmN5LU1hdHJpeCIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTIt
c29mdHdhcmUvdHBtMi10b29scy93aWtpL0RlcGVuZGVuY3ktTWF0cml4PC9hPjxicj4KPGJyPgpZ
ZXMgd2UgdXNlIHRoZSBJQk0gc2ltdWxhdG9yIGZvciB0aGUgdGVzdGluZy48YnI+Cjxicj4KWW91
IG1heSBjaG9vc2UgYW55IGRpc3RyaWJ1dGlvbiBhbmQgaW5zdGFsbCB0aGUgbmVjZXNzYXJ5IGRl
cGVuZGVuY2llcy4gQWxsIHByb2plY3RzIHRwbTItc29mdHdhcmUgYXJlIGJ1aWx0IHdpdGggYXV0
b3Rvb2xzIHdoaWNoIHdpbGwgaGludCB5b3Ugb24gbWlzc2luZyBkZXBlbmRlbmNpZXMgZm9yIHlv
dXIgZGlzdHJpYnV0aW9uLyBpbnN0YWxsYXRpb24uPGJyPgo8YnI+PC9ibG9ja3F1b3RlPjxkaXY+
PGJyPjwvZGl2PjxkaXY+W2FzaG9rYV08L2Rpdj48ZGl2PlN1cmUsIHRoYW5rcyE8L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PsKgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPC9kaXY+PGJs
b2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAu
OGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDox
ZXgiPgo8YnI+Ck1lc3NhZ2U6IDQ8YnI+CkRhdGU6IFdlZCwgMTEgU2VwIDIwMTkgMTc6MDQ6MTgg
KzA1MzA8YnI+CkZyb206IEFzaG9rIEt1bWFyICZsdDs8YSBocmVmPSJtYWlsdG86YXNob2thci4x
OTgwQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFzaG9rYXIuMTk4MEBnbWFpbC5jb208L2E+
Jmd0Ozxicj4KVG86IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJf
YmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KU3ViamVjdDogW3RwbTJdIFVzaW5nIFRQ
TSB0byBwcm90ZWN0IHByaXZhdGUga2V5PGJyPgpNZXNzYWdlLUlEOjxicj4KwqAgwqAgwqAgwqAg
Jmx0OzxhIGhyZWY9Im1haWx0bzpDQUU4ZTgzU0d2SkRRaEd1SHVTVUgtbmdWazRHa2JlcmdxZlAt
cUEzejhyb3B0a1pXN3dAbWFpbC5nbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5DQUU4ZTgzU0d2
SkRRaEd1SHVTVUgtbmdWazRHa2JlcmdxZlAtcUEzejhyb3B0a1pXN3dAbWFpbC5nbWFpbC5jb208
L2E+Jmd0Ozxicj4KQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PSZxdW90O3V0Zi04
JnF1b3Q7PGJyPgo8YnI+CkhpLDxicj4KPGJyPgpXZSBhcmUgcGxhbm5pbmcgdG8gdXNlIFRQTTIu
MCB0byBwcm90ZWN0IHByaXZhdGUga2V5IGZvciB0aGUgY2VydGlmaWNhdGUuPGJyPgpOZWVkIHlv
dXIgaGVscCB0byB1bmRlcnN0YW5kL2NsYXJpZnkgdGhlIGZvbGxvd2luZy48YnI+Cjxicj4KMSkg
V2hhdCBpcyB0aGUgcHJvcGVyIHdheSB0byBwcm90ZWN0IHRoZSBwcml2YXRlIGtleSB1c2luZyBU
UE0/PGJyPgo8YnI+CjIpIFNoYWxsIHdlIGp1c3QgZW5jcnlwdCB0aGUgcHJpdmF0ZS1rZXkgdXNp
bmcgdGhlIFRQTT8gSW4gdGhhdCBjYXNlLDxicj4KwqAgwqAgwqBpZiBzb21lYm9keSBoYXMgcm9v
dCBhY2Nlc3MsIHRoZW4gdGhleSBjYW4gZXhlY3V0ZSBhIHRvb2wgd2hpY2ggY2FuPGJyPgpzZW5k
PGJyPgrCoCDCoCDCoGNvbW1hbmQgdG8gVFBNIGluIG9yZGVyIHRvIGRlY3J5cHQgdGhlIHByaXZh
dGUta2V5LiBUaGF0IGlzIHN0aWxsPGJyPgp2dWxuZXJhYmxlLjxicj4KwqAgwqAgwqBBbSBJIG1p
c3Npbmcgc29tZXRoaW5nPzxicj4KPGJyPgozKSBBcmUgdGhlcmUgYW55IGFic3RyYWN0IEFQSSB3
aGljaCB3b3VsZCB3b3JrIGZvciBib3RoIFRQTTEuMiBvciBUUE0yLjA/PGJyPgrCoCDCoCBPciwg
YXBwbGljYXRpb24gKG9yIHdyYXBwZXIgQVBJKSBuZWVkcyB0byBjYWxsIGhhcmR3YXJlIHNwZWNp
ZmljPGJyPgpsaWJyYXJ5IGZ1bmN0aW9ucz88YnI+Cjxicj4KNCkgSWYgdGhlcmUgYXJlIGFueSBn
b29kIGRvY3VtZW50IG9yIHdyaXRlLXVwcyBhYm91dCB0aGluZ3MtdG8tZG8gdG8gbWFrZTxicj4K
dXNlIG9mPGJyPgrCoCDCoCBUUE0yIGZ1bmN0aW9uYWxpdHkgaW4gYXBwbGljYXRpb24gY29kZSAo
ZXNwZWNpYWxseSB0byBwcm90ZWN0IHByaXZhdGU8YnI+CmtleXMpLDxicj4KwqAgwqAgwqB0aGF0
IHdpbGwgYmUgdmVyeSBoZWxwZnVsLjxicj4KPGJyPgo1KSBXZSBhcmUgdXNpbmcgVWJ1bnR1IDE4
LjA0IExUUy4gV2hhdCBhcmUgYWxsIHRoZSBwYWNrYWdlcyAoYW5kPGJyPgpkZXBlbmRlbmNpZXMp
PGJyPgrCoCDCoCDCoHdlIG5lZWQgdG8gaW5zdGFsbD88YnI+Cjxicj4KwqAgwqAgwqBJIHNlZSB0
aGF0IHRzczIgcGFja2FnZSBpcyBhdmFpbGFibGUgaW4gMTguMDQuIEJ1dCBub3Qgc3VyZSB3aGlj
aDxicj4KcGFja2FnZSBoYXM8YnI+CsKgIMKgIMKgdGhlIHJlc291cmNlIG1hbmFnZXIuIEFsc28s
IGlmIEkgd2FudCB0byB0ZXN0IHdpdGggc2ltdWxhdG9yLCBzaG91bGQ8YnI+CndlIHVzZTxicj4K
wqAgwqAgwqB0aGUgb25lIHByb3ZpZGVkIGJ5IElCTT88YnI+CsKgIMKgIMKgQW5vdGhlciBUUE0y
IHN0YWNrIChmcm9tIEludGVsKSBpcyBhdmFpbGFibGUgaW4gZ2l0aHViICh0cG0yLXRzcykuPGJy
PgpXaGljaCBvbmU8YnI+CsKgIMKgIMKgaXMgYmV0dGVyIHRvIHVzZSBpbiBVYnVudHUgMTguMDQg
TFRTLjxicj4KPGJyPgpSZWdhcmRzLDxicj4KQXNob2sgS3VtYXI8YnI+Ci0tLS0tLS0tLS0tLS0t
IG5leHQgcGFydCAtLS0tLS0tLS0tLS0tLTxicj4KQW4gSFRNTCBhdHRhY2htZW50IHdhcyBzY3J1
YmJlZC4uLjxicj4KVVJMOiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpc3RzLjAxLm9yZy9waXBlcm1h
aWwvdHBtMi9hdHRhY2htZW50cy8yMDE5MDkxMS9hZTVhY2E0Ni9hdHRhY2htZW50Lmh0bWwiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saXN0cy4wMS5vcmcvcGlwZXJt
YWlsL3RwbTIvYXR0YWNobWVudHMvMjAxOTA5MTEvYWU1YWNhNDYvYXR0YWNobWVudC5odG1sPC9h
PiZndDs8YnI+Cjxicj4KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPgo8YnI+ClN1
YmplY3Q6IERpZ2VzdCBGb290ZXI8YnI+Cjxicj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0PGJyPgo8YSBocmVmPSJt
YWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9y
ZzwvYT48YnI+CjxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8v
dHBtMiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy4wMS5v
cmcvbWFpbG1hbi9saXN0aW5mby90cG0yPC9hPjxicj4KPGJyPgo8YnI+Ci0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLTxicj4KPGJyPgpFbmQgb2YgdHBtMiBEaWdlc3QsIFZvbCAyNywgSXNz
dWUgMTA8YnI+CioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKjxicj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CnRwbTIgbWFpbGlu
ZyBsaXN0PGJyPgo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2Js
YW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+CjxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEu
b3JnL21haWxtYW4vbGlzdGluZm8vdHBtMiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby90cG0yPC9hPjxicj4KPC9i
bG9ja3F1b3RlPjwvZGl2PjwvZGl2Pgo=

--===============2842772175552084234==--

