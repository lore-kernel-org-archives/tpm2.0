Content-Type: multipart/mixed; boundary="===============2834038201525138884=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] Docker Images
Date: Thu, 29 Aug 2019 10:39:26 -0700
Message-ID: <CANKkrzGZeWWV=NkjSKwppzSJEnCmKt3RYd8iytLg02A8VW1yyA@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DEFAE3@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2834038201525138884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 9:40 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> But Dockerhub knows how to map branch/tag name to a docker image name.
>

Understood, but I believe this functionality is customizable. For example,
see this Stack Overflow response:

https://stackoverflow.com/a/44796846
https://i.stack.imgur.com/9GpzT.png


What I understand is you're trying to use the Docker Hub's built-in Git
Branch =3D> Docker Tag mapping functionality.

I'm suggesting to instead configure multiple builds manually; e.g.,

    - Type "Branch", Name "master", Dockerfile Location "/ubuntu", Docker
Tag Name "ubuntu"
    - Type "Branch", Name "master", Dockerfile Location "/fedora", Docker
Tag Name "fedora"
    Etc.

Admittedly, this has the downside that to add/remove OSes, you'll need to
update the Docker Hub configuration. But this is easily documented.

And do to constraints I cannot control, I need to use dockerhub to build
> the images...
>

To clarify, I'm suggesting an alternative way to configure Docker Hub. I'm
not suggesting to stop using Docker Hub.

The other thing is that each distro is likely going to differences to the
> docker file anyways. Setup on
> Ubuntu will likely not be the same as fedora. Right now the updates are
> infrequent enough where
> It shouldn't really be that much of a burden, hopefully.


I'm sure you have a better sense of the effort involved than I do, and
you're going to be the one responsible for that work.

I'm just cautioning that from personal experience with projects I've worked
on (e.g., Android, Chrome, Chrome OS), the "apply N patches to N
repos/branches" model is workable but very tedious, error prone, and
generally dispiriting.

--===============2834038201525138884==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgOTo0
MCBBTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3Rl
Ojxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFw
eCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkJ1dCBEb2NrZXJodWIg
a25vd3MgaG93IHRvIG1hcCBicmFuY2gvdGFnIG5hbWUgdG8gYSBkb2NrZXIgaW1hZ2UgbmFtZS48
YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+VW5kZXJzdG9vZCwgYnV0IEkgYmVs
aWV2ZSB0aGlzIGZ1bmN0aW9uYWxpdHkgaXMgY3VzdG9taXphYmxlLiBGb3IgZXhhbXBsZSwgc2Vl
IHRoaXMgU3RhY2sgT3ZlcmZsb3cgcmVzcG9uc2U6PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+
PGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbjowIDAgMCA0MHB4O2JvcmRlcjpub25lO3BhZGRpbmc6
MHB4Ij48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdj48YSBocmVmPSJodHRwczovL3N0YWNr
b3ZlcmZsb3cuY29tL2EvNDQ3OTY4NDYiPmh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vYS80NDc5
Njg0NjwvYT48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdj48YSBocmVm
PSJodHRwczovL2kuc3RhY2suaW1ndXIuY29tLzlHcHpULnBuZyI+aHR0cHM6Ly9pLnN0YWNrLmlt
Z3VyLmNvbS85R3B6VC5wbmc8L2E+PC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjxkaXYgY2xhc3M9
ImdtYWlsX3F1b3RlIj48ZGl2Pjxicj48L2Rpdj48ZGl2PldoYXQgSSB1bmRlcnN0YW5kIGlzIHlv
dSYjMzk7cmUgdHJ5aW5nIHRvIHVzZSB0aGUgRG9ja2VyIEh1YiYjMzk7cyBidWlsdC1pbiBHaXQg
QnJhbmNoID0mZ3Q7IERvY2tlciBUYWcgbWFwcGluZyBmdW5jdGlvbmFsaXR5LjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+SSYjMzk7bSBzdWdnZXN0aW5nIHRvIGluc3RlYWQgY29uZmlndXJlIG11
bHRpcGxlIGJ1aWxkcyBtYW51YWxseTsgZS5nLiw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PsKg
IMKgIC0gVHlwZSAmcXVvdDtCcmFuY2gmcXVvdDssIE5hbWUgJnF1b3Q7bWFzdGVyJnF1b3Q7LCBE
b2NrZXJmaWxlIExvY2F0aW9uICZxdW90Oy91YnVudHUmcXVvdDssIERvY2tlciBUYWcgTmFtZSAm
cXVvdDt1YnVudHUmcXVvdDs8L2Rpdj48ZGl2PjxkaXY+wqAgwqAgLSBUeXBlICZxdW90O0JyYW5j
aCZxdW90OywgTmFtZSAmcXVvdDttYXN0ZXImcXVvdDssIERvY2tlcmZpbGUgTG9jYXRpb24gJnF1
b3Q7L2ZlZG9yYSZxdW90OywgRG9ja2VyIFRhZyBOYW1lICZxdW90O2ZlZG9yYSZxdW90OzwvZGl2
PjxkaXY+wqAgwqAgRXRjLjwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QWRtaXR0ZWRs
eSwgdGhpcyBoYXMgdGhlIGRvd25zaWRlIHRoYXQgdG8gYWRkL3JlbW92ZSBPU2VzLCB5b3UmIzM5
O2xsIG5lZWQgdG8gdXBkYXRlIHRoZSBEb2NrZXIgSHViIGNvbmZpZ3VyYXRpb24uIEJ1dCB0aGlz
IGlzIGVhc2lseSBkb2N1bWVudGVkLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNs
YXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXIt
bGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KQW5kIGRv
IHRvIGNvbnN0cmFpbnRzIEkgY2Fubm90IGNvbnRyb2wsIEkgbmVlZCB0byB1c2UgZG9ja2VyaHVi
IHRvIGJ1aWxkIHRoZSBpbWFnZXMuLi48YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2Pjxk
aXY+VG8gY2xhcmlmeSwgSSYjMzk7bSBzdWdnZXN0aW5nIGFuIGFsdGVybmF0aXZlIHdheSB0byBj
b25maWd1cmUgRG9ja2VyIEh1Yi4gSSYjMzk7bSBub3Qgc3VnZ2VzdGluZyB0byBzdG9wIHVzaW5n
IERvY2tlciBIdWIuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBz
b2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPgpUaGUgb3RoZXIgdGhpbmcg
aXMgdGhhdCBlYWNoIGRpc3RybyBpcyBsaWtlbHkgZ29pbmcgdG8gZGlmZmVyZW5jZXMgdG8gdGhl
IGRvY2tlciBmaWxlIGFueXdheXMuIFNldHVwIG9uPGJyPgpVYnVudHUgd2lsbCBsaWtlbHkgbm90
IGJlIHRoZSBzYW1lIGFzIGZlZG9yYS4gUmlnaHQgbm93IHRoZSB1cGRhdGVzIGFyZSBpbmZyZXF1
ZW50IGVub3VnaCB3aGVyZTxicj4KSXQgc2hvdWxkbiYjMzk7dCByZWFsbHkgYmUgdGhhdCBtdWNo
IG9mIGEgYnVyZGVuLCBob3BlZnVsbHkuPC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+
SSYjMzk7bSBzdXJlIHlvdSBoYXZlIGEgYmV0dGVyIHNlbnNlIG9mIHRoZSBlZmZvcnQgaW52b2x2
ZWQgdGhhbiBJIGRvLCBhbmQgeW91JiMzOTtyZSBnb2luZyB0byBiZSB0aGUgb25lIHJlc3BvbnNp
YmxlIGZvciB0aGF0IHdvcmsuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSYjMzk7bSBq
dXN0IGNhdXRpb25pbmcgdGhhdCBmcm9tIHBlcnNvbmFsIGV4cGVyaWVuY2Ugd2l0aCBwcm9qZWN0
cyBJJiMzOTt2ZSB3b3JrZWQgb24gKGUuZy4sIEFuZHJvaWQsIENocm9tZSwgQ2hyb21lIE9TKSwg
dGhlICZxdW90O2FwcGx5IE4gcGF0Y2hlcyB0byBOIHJlcG9zL2JyYW5jaGVzJnF1b3Q7IG1vZGVs
IGlzIHdvcmthYmxlIGJ1dCB2ZXJ5IHRlZGlvdXMsIGVycm9yIHByb25lLCBhbmQgZ2VuZXJhbGx5
IGRpc3Bpcml0aW5nLjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============2834038201525138884==--

