Content-Type: multipart/mixed; boundary="===============0088866816965732400=="
MIME-Version: 1.0
From: John Brown <jb20141125 at gmail.com>
Subject: Re: [tpm2] TPM2.0 chip access restriction
Date: Wed, 18 Jul 2018 08:12:26 +0200
Message-ID: <CAMCukfUpht_oePPyQzKK6X+mMRfK0Qx7uPGaw9r0LEf8AV+NgA@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649C056B6@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0088866816965732400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2018-07-13 15:12 GMT+02:00 Roberts, William C <william.c.roberts(a)intel.co=
m>:

>
>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of John Brown
> > Sent: Wednesday, July 11, 2018 5:25 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] TPM2.0 chip access restriction
> >
> > Hello all,
> >
> >
> >
> >
> > I do not know how to approach the issue of access restriction to the
> tpm2.0 chip.
> >
> >
> >
> >
> > I would like to use tpm chip to store private keys and would like to be
> sure that
> > the key can be only used by apps that I allow to do it and I think that
> this would
> > increase the security level of the whole system. In TPM2.0 chip the
> private key is
> > hidden, but if every application is allowed to perform operations on
> this key and
> > (for example) the attacker would be able to run some malicious
> application as
> > normal user, he can use it to receive from remote device some data,
> perform
> > operations on the private key, and send the result back. In the result
> the remote
> > device would behave as it would have the private key. And many other
> scenarios
> > are possible. So what is the correct way to restrict the access to the
> TPM chip?
> >
> >
> >
> >
> > - I know that every key can have a password to protect it but in that
> case there is
> > a problem where to store this password in a secure way that only allowed
> apps
> > can read it.
>
> Why would you store the password? You could also derive it from some
> secret. The pub
> And priv files used for access, if you don't use a password, access to
> those files means
> Access to the key itself.
>

Thank you for the answer.
But... Sorry, I do not understand what you mean. Can you explain this in
some more clear way?

>
> >
> >
> >
> >
> > - if an app use tss it talks to abrmd via d-bus and some pipes (am i
> right?). Can the
> > d-bus be used somehow to restrict access to tpm2.0 chip? Can this pipes
> be used
> > in a malicious way?
>
> I think SE Linux has dbus integration. Additionally, the dbus interface
> has access controls,
> but I am not fluent in them.
>
> >
> >
> >
> >
> > - I also know that PCRs can be used during boot to allow private key
> access when
> > the system is not corrupted. But this does not prevent the malicous
> private key
> > usage when the attacker put the application to already booted device
> with key
> > unlocked.
>
> Parsing error.
>

Parsing error?


> >
> >
> >
> >
> > I am already lost in the dark with this. Can somebody put some light on
> this issue?
> >
> >
> >
> >
> > Best regards,
> >
> > John
> >
> >
> >
> >
> >
> >
> >
>
>

--===============0088866816965732400==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPjIwMTgtMDctMTMgMTU6MTIgR01UKzAyOjAwIFJvYmVydHMsIFdpbGxp
YW0gQyA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0
c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208
L2E+Jmd0Ozwvc3Bhbj46PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVm
dDoxZXgiPjxzcGFuIGNsYXNzPSIiPjxicj4KPGJyPgomZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tPGJyPgomZ3Q7IEZyb206IHRwbTIgW21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1i
b3VuY2VzQGxpc3RzLjAxLm9yZyI+dHBtMi1ib3VuY2VzQGxpc3RzLjAxLjx3YnI+b3JnPC9hPl0g
T24gQmVoYWxmIE9mIEpvaG4gQnJvd248YnI+CiZndDsgU2VudDogV2VkbmVzZGF5LCBKdWx5IDEx
LCAyMDE4IDU6MjUgQU08YnI+CiZndDsgVG86IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAx
Lm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFN1YmplY3Q6IFt0cG0yXSBUUE0y
LjAgY2hpcCBhY2Nlc3MgcmVzdHJpY3Rpb248YnI+CiZndDsgPGJyPgomZ3Q7IEhlbGxvIGFsbCw8
YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IEkgZG8gbm90
IGtub3cgaG93IHRvIGFwcHJvYWNoIHRoZSBpc3N1ZSBvZiBhY2Nlc3MgcmVzdHJpY3Rpb24gdG8g
dGhlIHRwbTIuMCBjaGlwLjxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8
YnI+CiZndDsgSSB3b3VsZCBsaWtlIHRvIHVzZSB0cG0gY2hpcCB0byBzdG9yZSBwcml2YXRlIGtl
eXMgYW5kIHdvdWxkIGxpa2UgdG8gYmUgc3VyZSB0aGF0PGJyPgomZ3Q7IHRoZSBrZXkgY2FuIGJl
IG9ubHkgdXNlZCBieSBhcHBzIHRoYXQgSSBhbGxvdyB0byBkbyBpdCBhbmQgSSB0aGluayB0aGF0
IHRoaXMgd291bGQ8YnI+CiZndDsgaW5jcmVhc2UgdGhlIHNlY3VyaXR5IGxldmVsIG9mIHRoZSB3
aG9sZSBzeXN0ZW0uIEluIFRQTTIuMCBjaGlwIHRoZSBwcml2YXRlIGtleSBpczxicj4KJmd0OyBo
aWRkZW4sIGJ1dCBpZiBldmVyeSBhcHBsaWNhdGlvbiBpcyBhbGxvd2VkIHRvIHBlcmZvcm0gb3Bl
cmF0aW9ucyBvbiB0aGlzIGtleSBhbmQ8YnI+CiZndDsgKGZvciBleGFtcGxlKSB0aGUgYXR0YWNr
ZXIgd291bGQgYmUgYWJsZSB0byBydW4gc29tZSBtYWxpY2lvdXMgYXBwbGljYXRpb24gYXM8YnI+
CiZndDsgbm9ybWFsIHVzZXIsIGhlIGNhbiB1c2UgaXQgdG8gcmVjZWl2ZSBmcm9tIHJlbW90ZSBk
ZXZpY2Ugc29tZSBkYXRhLCBwZXJmb3JtPGJyPgomZ3Q7IG9wZXJhdGlvbnMgb24gdGhlIHByaXZh
dGUga2V5LCBhbmQgc2VuZCB0aGUgcmVzdWx0IGJhY2suIEluIHRoZSByZXN1bHQgdGhlIHJlbW90
ZTxicj4KJmd0OyBkZXZpY2Ugd291bGQgYmVoYXZlIGFzIGl0IHdvdWxkIGhhdmUgdGhlIHByaXZh
dGUga2V5LiBBbmQgbWFueSBvdGhlciBzY2VuYXJpb3M8YnI+CiZndDsgYXJlIHBvc3NpYmxlLiBT
byB3aGF0IGlzIHRoZSBjb3JyZWN0IHdheSB0byByZXN0cmljdCB0aGUgYWNjZXNzIHRvIHRoZSBU
UE0gY2hpcD88YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7
IC0gSSBrbm93IHRoYXQgZXZlcnkga2V5IGNhbiBoYXZlIGEgcGFzc3dvcmQgdG8gcHJvdGVjdCBp
dCBidXQgaW4gdGhhdCBjYXNlIHRoZXJlIGlzPGJyPgomZ3Q7IGEgcHJvYmxlbSB3aGVyZSB0byBz
dG9yZSB0aGlzIHBhc3N3b3JkIGluIGEgc2VjdXJlIHdheSB0aGF0IG9ubHkgYWxsb3dlZCBhcHBz
PGJyPgomZ3Q7IGNhbiByZWFkIGl0Ljxicj4KPGJyPgo8L3NwYW4+V2h5IHdvdWxkIHlvdSBzdG9y
ZSB0aGUgcGFzc3dvcmQ/IFlvdSBjb3VsZCBhbHNvIGRlcml2ZSBpdCBmcm9tIHNvbWUgc2VjcmV0
LiBUaGUgcHViPGJyPgpBbmQgcHJpdiBmaWxlcyB1c2VkIGZvciBhY2Nlc3MsIGlmIHlvdSBkb24m
IzM5O3QgdXNlIGEgcGFzc3dvcmQsIGFjY2VzcyB0byB0aG9zZSBmaWxlcyBtZWFuczxicj4KQWNj
ZXNzIHRvIHRoZSBrZXkgaXRzZWxmLjxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRp
dj5UaGFuayB5b3UgZm9yIHRoZSBhbnN3ZXIuPGJyPjwvZGl2PjxkaXY+QnV0Li4uIFNvcnJ5LCBJ
IGRvIG5vdCB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4uIENhbiB5b3UgZXhwbGFpbiB0aGlzIGlu
IHNvbWUgbW9yZSBjbGVhciB3YXk/IDxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xp
ZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KPHNwYW4gY2xhc3M9IiI+PGJyPgomZ3Q7IDxicj4KJmd0OyA8
YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyAtIGlmIGFuIGFwcCB1c2UgdHNzIGl0IHRhbGtz
IHRvIGFicm1kIHZpYSBkLWJ1cyBhbmQgc29tZSBwaXBlcyAoYW0gaSByaWdodD8pLiBDYW4gdGhl
PGJyPgomZ3Q7IGQtYnVzIGJlIHVzZWQgc29tZWhvdyB0byByZXN0cmljdCBhY2Nlc3MgdG8gdHBt
Mi4wIGNoaXA/IENhbiB0aGlzIHBpcGVzIGJlIHVzZWQ8YnI+CiZndDsgaW4gYSBtYWxpY2lvdXMg
d2F5Pzxicj4KPGJyPgo8L3NwYW4+SSB0aGluayBTRSBMaW51eCBoYXMgZGJ1cyBpbnRlZ3JhdGlv
bi4gQWRkaXRpb25hbGx5LCB0aGUgZGJ1cyBpbnRlcmZhY2UgaGFzIGFjY2VzcyBjb250cm9scyw8
YnI+CmJ1dCBJIGFtIG5vdCBmbHVlbnQgaW4gdGhlbS48YnI+CjxzcGFuIGNsYXNzPSIiPjxicj4K
Jmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgLSBJIGFsc28ga25v
dyB0aGF0IFBDUnMgY2FuIGJlIHVzZWQgZHVyaW5nIGJvb3QgdG8gYWxsb3cgcHJpdmF0ZSBrZXkg
YWNjZXNzIHdoZW48YnI+CiZndDsgdGhlIHN5c3RlbSBpcyBub3QgY29ycnVwdGVkLiBCdXQgdGhp
cyBkb2VzIG5vdCBwcmV2ZW50IHRoZSBtYWxpY291cyBwcml2YXRlIGtleTxicj4KJmd0OyB1c2Fn
ZSB3aGVuIHRoZSBhdHRhY2tlciBwdXQgdGhlIGFwcGxpY2F0aW9uIHRvIGFscmVhZHkgYm9vdGVk
IGRldmljZSB3aXRoIGtleTxicj4KJmd0OyB1bmxvY2tlZC48YnI+Cjxicj4KPC9zcGFuPlBhcnNp
bmcgZXJyb3IuPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PlBhcnNpbmcgZXJy
b3I/IDxicj48L2Rpdj48ZGl2PiA8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7
cGFkZGluZy1sZWZ0OjFleCI+CjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPjxi
cj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgSSBhbSBhbHJl
YWR5IGxvc3QgaW4gdGhlIGRhcmsgd2l0aCB0aGlzLiBDYW4gc29tZWJvZHkgcHV0IHNvbWUgbGln
aHQgb24gdGhpcyBpc3N1ZT88YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsg
PGJyPgomZ3Q7IEJlc3QgcmVnYXJkcyw8YnI+CiZndDsgPGJyPgomZ3Q7IEpvaG48YnI+CiZndDsg
PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZn
dDsgPGJyPgo8YnI+CjwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+PC9k
aXY+Cg==

--===============0088866816965732400==--

