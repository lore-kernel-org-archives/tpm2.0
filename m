Content-Type: multipart/mixed; boundary="===============6480862103964318072=="
MIME-Version: 1.0
From: Rowan Moul <lists at rowan.moul.ca>
Subject: [tpm2] Re: Relating tpm2_createprimary, Primary Seeds, and tpm2_clear
Date: Wed, 01 Apr 2020 18:17:11 -0600
Message-ID: <7169F4BB-61AF-47A4-A76C-13BC3A571822@rowan.moul.ca>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6480862103964318072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=EF=BB=BF
Your quotes look fine to me.

> This appears to be confirmation that these commands are Not present on my=
 TPM:
> $ tpm2_getcap commands|grep eps
> $ tpm2_getcap commands|grep pps

I=E2=80=99m not sure of the exact implementation that tpm2-tools uses. It=
=E2=80=99s possible that the tool name doesn=E2=80=99t match the internal c=
ommand used, but this one is best left to the experts.

> Thanks, do you have a link? I could not find this thread yet after search=
ing. Also, is there a good reason to use the unique data in addition to bei=
ng extra cautious? Maybe this is addressed in the thread.

As for the unique field. I can=E2=80=99t say if it=E2=80=99s better or wors=
e to use it or not. However if you don=E2=80=99t use it, anyone with access=
 to your TPM can re-generate your primary key (assuming they know what othe=
r options you chose). Once they have your Primary Key, they have everything=
 under it too. =

The thread I referred to is mostly about some awkward formatting required. =
It got split into two because I didn=E2=80=99t reply all correctly
The context: https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/threa=
d/B5HVVKDH4PVGOUCT6WPCHRYHB35LMDBW/
The useful part: https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/t=
hread/5YDZRV63LCGX6BZQXRW6S6F77PSS5JU5/


> Regarding Platform authorization value - should I expect this is controll=
ed by BIOS or OS?
> Sounds like I can at least clear it via the BIOS, I'll check.
See section on startup initialization (and read the stuff before that for c=
ontext)
https://link.springer.com/chapter/10.1007/978-1-4302-6584-9_19

You cannot clear the platform auth as it is set on each boot, so clearing i=
t is minimally useful. You can=E2=80=99t do anything with it unless the one=
 who set it gives you this option (the bios/platform manufacturer). This ca=
n be frustrating if like me you have a TPM 2.0 with only sha1 PCR=E2=80=99s=
 allocated despite supporting sha256.
(If this is incorrect, someone please tell me how so I can re-allocate my P=
CRs!)

Rowan

>> On Apr 1, 2020, at 15:59, John S <sedigj(a)gmail.com> wrote:
> =EF=BB=BFThank you both for a prompt reply yesterday.
> =

> From what you contributed yesterday, I understand tpm2_clear will clear t=
he Owner seed/hierarchy, and that the functionality to perform the clear on=
 the Owner hierarchy can be disabled.
> =

>> Platform and Endorsement seeds generally are stable, but the command set
>> Does allow for ChangeEPS and ChangeSPS commands. But I don't think I have
>> ever seen a production TPM support this, but be aware that it exists.
> This appears to be confirmation that these commands are Not present on my=
 TPM:
> $ tpm2_getcap commands|grep eps
> $ tpm2_getcap commands|grep pps
> =

> I read in another discussion that it sounds like this means that platform=
 and endorsement seeds would effectively be unchangeable in my case.
> https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/thread/5KE3W6QLY=
H3N76K753VNQSX6CPJMH7KJ/
> =

> =

>> Also on the note of re-generating primary keys, you may find my previous=
 thread about the
>> unique data option in tpm2_createprimary helpful if you want to use uniq=
ue data in
>> addition to the seed.
> Thanks, do you have a link? I could not find this thread yet after search=
ing. Also, is there a good reason to use the unique data in addition to bei=
ng extra cautious? Maybe this is addressed in the thread.
> =

> Regarding Platform authorization value - should I expect this is controll=
ed by BIOS or OS?
> Sounds like I can at least clear it via the BIOS, I'll check.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6480862103964318072==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPjxkaXYgZGlyPSJs
dHIiPu+7vzxtZXRhIGh0dHAtZXF1aXY9ImNvbnRlbnQtdHlwZSIgY29udGVudD0idGV4dC9odG1s
OyBjaGFyc2V0PXV0Zi04Ij48ZGl2IGRpcj0ibHRyIj48bWV0YSBodHRwLWVxdWl2PSJjb250ZW50
LXR5cGUiIGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+WW91ciBxdW90ZXMgbG9v
ayBmaW5lIHRvIG1lLjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+
PGRpdiBkaXI9Imx0ciI+VGhpcyBhcHBlYXJzIHRvIGJlIGNvbmZpcm1hdGlvbiB0aGF0IHRoZXNl
IGNvbW1hbmRzIGFyZSBOb3QgcHJlc2VudCBvbiBteSBUUE06PGJyPiQgdHBtMl9nZXRjYXAgY29t
bWFuZHN8Z3JlcCBlcHM8YnI+JCB0cG0yX2dldGNhcCBjb21tYW5kc3xncmVwIHBwczwvZGl2Pjwv
YmxvY2txdW90ZT48L2Rpdj48ZGl2PknigJltIG5vdCBzdXJlIG9mIHRoZSBleGFjdCBpbXBsZW1l
bnRhdGlvbiB0aGF0IHRwbTItdG9vbHMgdXNlcy4gSXTigJlzIHBvc3NpYmxlIHRoYXQgdGhlIHRv
b2wgbmFtZSBkb2VzbuKAmXQgbWF0Y2ggdGhlIGludGVybmFsIGNvbW1hbmQgdXNlZCwgYnV0IHRo
aXMgb25lIGlzIGJlc3QgbGVmdCB0byB0aGUgZXhwZXJ0cy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxkaXYgZGlyPSJsdHIiPlRoYW5rcywgZG8geW91
IGhhdmUgYSBsaW5rPyBJIGNvdWxkIG5vdCBmaW5kIHRoaXMgdGhyZWFkIHlldCBhZnRlciBzZWFy
Y2hpbmcuIEFsc28sIGlzIHRoZXJlIGEgZ29vZCByZWFzb24gdG8gdXNlIHRoZSB1bmlxdWUgZGF0
YSBpbiBhZGRpdGlvbiB0byBiZWluZyBleHRyYSBjYXV0aW91cz8gTWF5YmUgdGhpcyBpcyBhZGRy
ZXNzZWQgaW4gdGhlIHRocmVhZC48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PGRpdj5BcyBmb3Ig
dGhlIHVuaXF1ZSBmaWVsZC4gSSBjYW7igJl0IHNheSBpZiBpdOKAmXMgYmV0dGVyIG9yIHdvcnNl
IHRvIHVzZSBpdCBvciBub3QuIEhvd2V2ZXIgaWYgeW91IGRvbuKAmXQgdXNlIGl0LCBhbnlvbmUg
d2l0aCBhY2Nlc3MgdG8geW91ciBUUE0gY2FuIHJlLWdlbmVyYXRlIHlvdXIgcHJpbWFyeSBrZXkg
KGFzc3VtaW5nIHRoZXkga25vdyB3aGF0IG90aGVyIG9wdGlvbnMgeW91IGNob3NlKS4gT25jZSB0
aGV5IGhhdmUgeW91ciBQcmltYXJ5IEtleSwgdGhleSBoYXZlIGV2ZXJ5dGhpbmcgdW5kZXIgaXQg
dG9vLiZuYnNwOzwvZGl2PjxkaXY+VGhlIHRocmVhZCBJIHJlZmVycmVkIHRvIGlzIG1vc3RseSBh
Ym91dCBzb21lIGF3a3dhcmQgZm9ybWF0dGluZyByZXF1aXJlZC4gSXQgZ290IHNwbGl0IGludG8g
dHdvIGJlY2F1c2UgSSBkaWRu4oCZdCByZXBseSBhbGwgY29ycmVjdGx5PC9kaXY+PGRpdj5UaGUg
Y29udGV4dDo8YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9oeXBlcmtpdHR5L2xpc3QvdHBt
MkBsaXN0cy4wMS5vcmcvdGhyZWFkL0I1SFZWS0RINFBWR09VQ1Q2V1BDSFJZSEIzNUxNREJXLyI+
Jm5ic3A7aHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlwZXJraXR0eS9saXN0L3RwbTJAbGlzdHMuMDEu
b3JnL3RocmVhZC9CNUhWVktESDRQVkdPVUNUNldQQ0hSWUhCMzVMTURCVy88L2E+PC9kaXY+PGRp
dj5UaGUgdXNlZnVsIHBhcnQ6Jm5ic3A7PGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlw
ZXJraXR0eS9saXN0L3RwbTJAbGlzdHMuMDEub3JnL3RocmVhZC81WURaUlY2M0xDR1g2QlpRWFJX
NlM2Rjc3UFNTNUpVNS8iPmh0dHBzOi8vbGlzdHMuMDEub3JnL2h5cGVya2l0dHkvbGlzdC90cG0y
QGxpc3RzLjAxLm9yZy90aHJlYWQvNVlEWlJWNjNMQ0dYNkJaUVhSVzZTNkY3N1BTUzVKVTUvPC9h
Pjxicj48YnI+PGRpdiBkaXI9Imx0ciI+PGRpdj48YnI+PC9kaXY+PGRpdj48YmxvY2txdW90ZSB0
eXBlPSJjaXRlIj48ZGl2IGRpcj0ibHRyIj5SZWdhcmRpbmcgUGxhdGZvcm0gYXV0aG9yaXphdGlv
biB2YWx1ZSAtIHNob3VsZCBJIGV4cGVjdCB0aGlzIGlzIGNvbnRyb2xsZWQgYnkgQklPUyBvciBP
Uz88YnI+U291bmRzIGxpa2UgSSBjYW4gYXQgbGVhc3QgY2xlYXIgaXQgdmlhIHRoZSBCSU9TLCBJ
J2xsIGNoZWNrLjwvZGl2PjwvYmxvY2txdW90ZT5TZWUgc2VjdGlvbiBvbiBzdGFydHVwIGluaXRp
YWxpemF0aW9uIChhbmQgcmVhZCB0aGUgc3R1ZmYgYmVmb3JlIHRoYXQgZm9yIGNvbnRleHQpPC9k
aXY+PGRpdj48YSBocmVmPSJodHRwczovL2xpbmsuc3ByaW5nZXIuY29tL2NoYXB0ZXIvMTAuMTAw
Ny85NzgtMS00MzAyLTY1ODQtOV8xOSI+aHR0cHM6Ly9saW5rLnNwcmluZ2VyLmNvbS9jaGFwdGVy
LzEwLjEwMDcvOTc4LTEtNDMwMi02NTg0LTlfMTk8L2E+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5Zb3UgY2Fubm90IGNsZWFyIHRoZSBwbGF0Zm9ybSBhdXRoIGFzIGl0IGlzIHNldCBvbiBlYWNo
IGJvb3QsIHNvIGNsZWFyaW5nIGl0IGlzIG1pbmltYWxseSB1c2VmdWwuIFlvdSBjYW7igJl0IGRv
IGFueXRoaW5nIHdpdGggaXQgdW5sZXNzIHRoZSBvbmUgd2hvIHNldCBpdCBnaXZlcyB5b3UgdGhp
cyBvcHRpb24gKHRoZSBiaW9zL3BsYXRmb3JtIG1hbnVmYWN0dXJlcikuIFRoaXMgY2FuIGJlIGZy
dXN0cmF0aW5nIGlmIGxpa2UgbWUgeW91IGhhdmUgYSBUUE0gMi4wIHdpdGggb25seSBzaGExIFBD
UuKAmXMgYWxsb2NhdGVkIGRlc3BpdGUgc3VwcG9ydGluZyBzaGEyNTYuPC9kaXY+PGRpdj4oSWYg
dGhpcyBpcyBpbmNvcnJlY3QsIHNvbWVvbmUgcGxlYXNlIHRlbGwgbWUgaG93IHNvIEkgY2FuIHJl
LWFsbG9jYXRlIG15IFBDUnMhKTwvZGl2PjxkaXY+PGJyPjwvZGl2PlJvd2FuPC9kaXY+PGRpdiBk
aXI9Imx0ciI+PGJyPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPk9uIEFwciAxLCAyMDIwLCBhdCAx
NTo1OSwgSm9obiBTICZsdDtzZWRpZ2pAZ21haWwuY29tJmd0OyB3cm90ZTo8YnI+PGJyPjwvYmxv
Y2txdW90ZT48L2Rpdj48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48ZGl2IGRpcj0ibHRyIj7vu788
c3Bhbj5UaGFuayB5b3UgYm90aCBmb3IgYSBwcm9tcHQgcmVwbHkgeWVzdGVyZGF5Ljwvc3Bhbj48
YnI+PHNwYW4+PC9zcGFuPjxicj48c3Bhbj5Gcm9tIHdoYXQgeW91IGNvbnRyaWJ1dGVkIHllc3Rl
cmRheSwgSSB1bmRlcnN0YW5kIHRwbTJfY2xlYXIgd2lsbCBjbGVhciB0aGUgT3duZXIgc2VlZC9o
aWVyYXJjaHksIGFuZCB0aGF0IHRoZSBmdW5jdGlvbmFsaXR5IHRvIHBlcmZvcm0gdGhlIGNsZWFy
IG9uIHRoZSBPd25lciBoaWVyYXJjaHkgY2FuIGJlIGRpc2FibGVkLjwvc3Bhbj48YnI+PHNwYW4+
PC9zcGFuPjxicj48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj5QbGF0Zm9ybSBhbmQgRW5k
b3JzZW1lbnQgc2VlZHMgZ2VuZXJhbGx5IGFyZSBzdGFibGUsIGJ1dCB0aGUgY29tbWFuZCBzZXQ8
L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj5Eb2Vz
IGFsbG93IGZvciBDaGFuZ2VFUFMgYW5kIENoYW5nZVNQUyBjb21tYW5kcy4gQnV0IEkgZG9uJ3Qg
dGhpbmsgSSBoYXZlPC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+PHNwYW4+ZXZlciBzZWVuIGEgcHJvZHVjdGlvbiBUUE0gc3VwcG9ydCB0aGlzLCBidXQgYmUg
YXdhcmUgdGhhdCBpdCBleGlzdHMuPC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PHNwYW4+VGhpcyBh
cHBlYXJzIHRvIGJlIGNvbmZpcm1hdGlvbiB0aGF0IHRoZXNlIGNvbW1hbmRzIGFyZSBOb3QgcHJl
c2VudCBvbiBteSBUUE06PC9zcGFuPjxicj48c3Bhbj4kIHRwbTJfZ2V0Y2FwIGNvbW1hbmRzfGdy
ZXAgZXBzPC9zcGFuPjxicj48c3Bhbj4kIHRwbTJfZ2V0Y2FwIGNvbW1hbmRzfGdyZXAgcHBzPC9z
cGFuPjxicj48c3Bhbj48L3NwYW4+PGJyPjxzcGFuPkkgcmVhZCBpbiBhbm90aGVyIGRpc2N1c3Np
b24gdGhhdCBpdCBzb3VuZHMgbGlrZSB0aGlzIG1lYW5zIHRoYXQgcGxhdGZvcm0gYW5kIGVuZG9y
c2VtZW50IHNlZWRzIHdvdWxkIGVmZmVjdGl2ZWx5IGJlIHVuY2hhbmdlYWJsZSBpbiBteSBjYXNl
Ljwvc3Bhbj48YnI+PHNwYW4+aHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlwZXJraXR0eS9saXN0L3Rw
bTJAbGlzdHMuMDEub3JnL3RocmVhZC81S0UzVzZRTFlIM043Nks3NTNWTlFTWDZDUEpNSDdLSi88
L3NwYW4+PGJyPjxzcGFuPjwvc3Bhbj48YnI+PHNwYW4+PC9zcGFuPjxicj48YmxvY2txdW90ZSB0
eXBlPSJjaXRlIj48c3Bhbj5BbHNvIG9uIHRoZSBub3RlIG9mIHJlLWdlbmVyYXRpbmcgcHJpbWFy
eSBrZXlzLCB5b3UgbWF5IGZpbmQgbXkgcHJldmlvdXMgdGhyZWFkIGFib3V0IHRoZTwvc3Bhbj48
YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPnVuaXF1ZSBkYXRh
IG9wdGlvbiBpbiB0cG0yX2NyZWF0ZXByaW1hcnkgaGVscGZ1bCBpZiB5b3Ugd2FudCB0byB1c2Ug
dW5pcXVlIGRhdGEgaW48L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48YmxvY2txdW90ZSB0eXBlPSJj
aXRlIj48c3Bhbj5hZGRpdGlvbiB0byB0aGUgc2VlZC48L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48
c3Bhbj5UaGFua3MsIGRvIHlvdSBoYXZlIGEgbGluaz8gSSBjb3VsZCBub3QgZmluZCB0aGlzIHRo
cmVhZCB5ZXQgYWZ0ZXIgc2VhcmNoaW5nLiBBbHNvLCBpcyB0aGVyZSBhIGdvb2QgcmVhc29uIHRv
IHVzZSB0aGUgdW5pcXVlIGRhdGEgaW4gYWRkaXRpb24gdG8gYmVpbmcgZXh0cmEgY2F1dGlvdXM/
IE1heWJlIHRoaXMgaXMgYWRkcmVzc2VkIGluIHRoZSB0aHJlYWQuPC9zcGFuPjxicj48c3Bhbj48
L3NwYW4+PGJyPjxzcGFuPlJlZ2FyZGluZyBQbGF0Zm9ybSBhdXRob3JpemF0aW9uIHZhbHVlIC0g
c2hvdWxkIEkgZXhwZWN0IHRoaXMgaXMgY29udHJvbGxlZCBieSBCSU9TIG9yIE9TPzwvc3Bhbj48
YnI+PHNwYW4+U291bmRzIGxpa2UgSSBjYW4gYXQgbGVhc3QgY2xlYXIgaXQgdmlhIHRoZSBCSU9T
LCBJJ2xsIGNoZWNrLjwvc3Bhbj48YnI+PHNwYW4+X19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX188L3NwYW4+PGJyPjxzcGFuPnRwbTIgbWFpbGluZyBsaXN0IC0t
IHRwbTJAbGlzdHMuMDEub3JnPC9zcGFuPjxicj48c3Bhbj5UbyB1bnN1YnNjcmliZSBzZW5kIGFu
IGVtYWlsIHRvIHRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9zcGFuPjxicj48c3Bhbj4lKHdlYl9w
YWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczwvc3Bhbj48YnI+
PC9kaXY+PC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2PjwvZGl2PjwvYm9keT48L2h0bWw+
--===============6480862103964318072==--

