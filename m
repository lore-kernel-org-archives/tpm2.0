Content-Type: multipart/mixed; boundary="===============7403054099223648555=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tools: tcti init allocation route failed for library
 "tabrmd"
Date: Thu, 28 Jun 2018 16:28:09 +0200
Message-ID: <CAFOAJEeCW+Xbo+-mSWQ8Qc1ytYQ3GLv0n0so=FN_4rjk75iXUA@mail.gmail.com>
In-Reply-To: ca555d62055741febbf3381803490e84@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7403054099223648555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Thu, Jun 28, 2018 at 3:24 PM, Scheie, Peter M <Petre.Scheie(a)gd-ms.com>
wrote:

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Javier
> Martinez Canillas
> Sent: Thursday, June 28, 2018 7:23 AM
> To: tpm2(a)lists.01.org
> Subject: Re: [tpm2] tools: tcti init allocation route failed for library
> "tabrmd"
>
> Hi Peter,
>
> On 06/26/2018 08:40 PM, Scheie, Peter M wrote:
> > I'm trying to get the tools working with the emulator, on a CentOS 7
> VM.  I've got tss 2.0.0, abrmd 2.0.0, tools 3.1.0, and the IBM emulator
> 1119.  Everything compiles and installs okay, the emulator is running, I
> start abrmd with 'sudo -u tss /tmp/tpm2/sbin/tpm2-abrmd
> --tcti=3Dlibtss2-tcti-mssim.s' and the emulator says 'Client accepted'.
> However, when I then run, say, tpm2_pcrlist, I get this error:
> >
> > WARNING: Failed to create connection with service:
> GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient
> disconnected from message bus without replying
>
> ERROR: tcti init allocation routine failed for library: "tabrmd" options:
> "(null)"
> > ERROR: Could not load tcti, got: "tabrmd"
> >
> > And then abrmd crashes, while the emulator reports 'read() error.  Error
> is 2 No such file or directory'.
> >
> > Suggestions?
> >
>
> That very much sounds like a SELinux issue, did you try putting SELinux in
> permissive mode (setenforce 0) ?
>
> Best regards,
> Javier
>
> ############################################################
>
> Javier,
> That was it!  Thank you!  BTW, what tipped you off that SELinux was
> getting in the way?
>
>
Right, I should had say "the" SELinux issue. There is a need for an SELinux
AV rule to make the latest tpm2-abrmd to work on Fedora / CentOS.

You can build the SELinux policy module with:

$ sudo yum install selinux-policy-devel
$ pushd tpm2-abrmd/selinux && make -f /usr/share/selinux/devel/Makefile
tabrmd.pp
$ sudo semodule -i tabrmd.pp
$ sudo restorecon /path/to/tpm2-abrmd

Best regards,
Javier

--===============7403054099223648555==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGkgUGV0ZXIsPGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+
PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIFRodSwgSnVuIDI4LCAyMDE4IGF0IDM6MjQgUE0s
IFNjaGVpZSwgUGV0ZXIgTSA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpQZXRy
ZS5TY2hlaWVAZ2QtbXMuY29tIiB0YXJnZXQ9Il9ibGFuayI+UGV0cmUuU2NoZWllQGdkLW1zLmNv
bTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCBy
Z2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgY2xhc3M9ImdtYWlsLUhPRW5a
YiI+PGRpdiBjbGFzcz0iZ21haWwtaDUiPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgpG
cm9tOiB0cG0yIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItYm91bmNlc0BsaXN0cy4wMS5v
cmciPnRwbTItYm91bmNlc0BsaXN0cy4wMS48d2JyPm9yZzwvYT5dIE9uIEJlaGFsZiBPZiBKYXZp
ZXIgTWFydGluZXogQ2FuaWxsYXM8YnI+ClNlbnQ6IFRodXJzZGF5LCBKdW5lIDI4LCAyMDE4IDc6
MjMgQU08YnI+ClRvOiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJAbGlz
dHMuMDEub3JnPC9hPjxicj4KU3ViamVjdDogUmU6IFt0cG0yXSB0b29sczogdGN0aSBpbml0IGFs
bG9jYXRpb24gcm91dGUgZmFpbGVkIGZvciBsaWJyYXJ5ICZxdW90O3RhYnJtZCZxdW90Ozxicj4K
PGJyPgpIaSBQZXRlciw8YnI+Cjxicj4KT24gMDYvMjYvMjAxOCAwODo0MCBQTSwgU2NoZWllLCBQ
ZXRlciBNIHdyb3RlOjxicj4KJmd0OyBJJiMzOTttIHRyeWluZyB0byBnZXQgdGhlIHRvb2xzIHdv
cmtpbmcgd2l0aCB0aGUgZW11bGF0b3IsIG9uIGEgQ2VudE9TIDcgVk0uwqAgSSYjMzk7dmUgZ290
IHRzcyAyLjAuMCwgYWJybWQgMi4wLjAsIHRvb2xzIDMuMS4wLCBhbmQgdGhlIElCTSBlbXVsYXRv
ciAxMTE5LsKgIEV2ZXJ5dGhpbmcgY29tcGlsZXMgYW5kIGluc3RhbGxzIG9rYXksIHRoZSBlbXVs
YXRvciBpcyBydW5uaW5nLCBJIHN0YXJ0IGFicm1kIHdpdGggJiMzOTtzdWRvIC11IHRzcyAvdG1w
L3RwbTIvc2Jpbi90cG0yLWFicm1kIC0tdGN0aT1saWJ0c3MyLXRjdGktbXNzaW0ucyYjMzk7IGFu
ZCB0aGUgZW11bGF0b3Igc2F5cyAmIzM5O0NsaWVudCBhY2NlcHRlZCYjMzk7LsKgIEhvd2V2ZXIs
IHdoZW4gSSB0aGVuIHJ1biwgc2F5LCB0cG0yX3Bjcmxpc3QsIEkgZ2V0IHRoaXMgZXJyb3I6PGJy
PgomZ3Q7IDxicj4KJmd0OyBXQVJOSU5HOiBGYWlsZWQgdG8gY3JlYXRlIGNvbm5lY3Rpb24gd2l0
aCBzZXJ2aWNlOiBHREJ1cy5FcnJvcjpvcmcuZnJlZWRlc2t0b3AuPHdicj5EQnVzLkVycm9yLk5v
UmVwbHk6IE1lc3NhZ2UgcmVjaXBpZW50IGRpc2Nvbm5lY3RlZCBmcm9tIG1lc3NhZ2UgYnVzIHdp
dGhvdXQgcmVwbHlpbmc8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgY2xhc3M9
ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0
OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgY2xhc3M9
ImdtYWlsLUhPRW5aYiI+PGRpdiBjbGFzcz0iZ21haWwtaDUiPgomZ3Q7IEVSUk9SOiB0Y3RpIGlu
aXQgYWxsb2NhdGlvbiByb3V0aW5lIGZhaWxlZCBmb3IgbGlicmFyeTogJnF1b3Q7dGFicm1kJnF1
b3Q7IG9wdGlvbnM6ICZxdW90OyhudWxsKSZxdW90Ozxicj4KJmd0OyBFUlJPUjogQ291bGQgbm90
IGxvYWQgdGN0aSwgZ290OiAmcXVvdDt0YWJybWQmcXVvdDs8YnI+CiZndDsgPGJyPgomZ3Q7IEFu
ZCB0aGVuIGFicm1kIGNyYXNoZXMsIHdoaWxlIHRoZSBlbXVsYXRvciByZXBvcnRzICYjMzk7cmVh
ZCgpIGVycm9yLsKgIEVycm9yIGlzIDIgTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSYjMzk7Ljxi
cj4KJmd0OyA8YnI+CiZndDsgU3VnZ2VzdGlvbnM/PGJyPgomZ3Q7PGJyPgo8YnI+ClRoYXQgdmVy
eSBtdWNoIHNvdW5kcyBsaWtlIGEgU0VMaW51eCBpc3N1ZSwgZGlkIHlvdSB0cnkgcHV0dGluZyBT
RUxpbnV4IGluPGJyPgpwZXJtaXNzaXZlIG1vZGUgKHNldGVuZm9yY2UgMCkgPzxicj4KPGJyPgpC
ZXN0IHJlZ2FyZHMsPGJyPgpKYXZpZXI8YnI+Cjxicj4KPC9kaXY+PC9kaXY+IyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjPHdicj4jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+
Cjxicj4KSmF2aWVyLDxicj4KVGhhdCB3YXMgaXQhwqAgVGhhbmsgeW91IcKgIEJUVywgd2hhdCB0
aXBwZWQgeW91IG9mZiB0aGF0IFNFTGludXggd2FzIGdldHRpbmcgaW4gdGhlIHdheT88YnI+Cjxi
cj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5SaWdodCwgSSBzaG91bGQgaGFkIHNh
eSAmcXVvdDt0aGUmcXVvdDsgU0VMaW51eCBpc3N1ZS4gVGhlcmUgaXMgYSBuZWVkIGZvciBhbiBT
RUxpbnV4IEFWIHJ1bGUgdG8gbWFrZSB0aGUgbGF0ZXN0IHRwbTItYWJybWQgdG8gd29yayBvbiBG
ZWRvcmEgLyBDZW50T1MuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Zb3UgY2FuIGJ1aWxkIHRo
ZSBTRUxpbnV4IHBvbGljeSBtb2R1bGUgd2l0aDo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxk
aXY+JCBzdWRvIHl1bSBpbnN0YWxsIHNlbGludXgtcG9saWN5LWRldmVsPC9kaXY+PGRpdj4kIHB1
c2hkIHRwbTItYWJybWQvc2VsaW51eCAmYW1wOyZhbXA7IG1ha2UgLWYgL3Vzci9zaGFyZS9zZWxp
bnV4L2RldmVsL01ha2VmaWxlIHRhYnJtZC5wcDwvZGl2PjxkaXY+JCBzdWRvIHNlbW9kdWxlIC1p
IHRhYnJtZC5wcDwvZGl2PjxkaXY+JCBzdWRvIHJlc3RvcmVjb24gL3BhdGgvdG8vdHBtMi1hYnJt
ZDwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QmVzdCByZWdhcmRzLDwvZGl2PjxkaXY+
SmF2aWVyPC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+Cg==

--===============7403054099223648555==--

