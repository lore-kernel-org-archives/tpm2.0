Content-Type: multipart/mixed; boundary="===============3211719557602779377=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] Docker Images
Date: Wed, 28 Aug 2019 16:36:11 -0700
Message-ID: <CANKkrzG0y9xdOaVFDoW-smReSiM+wWrt8QJnw+n7nQe8etUb=Q@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DEF841@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3211719557602779377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 1:19 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> If we want to utilize dockerhub to build multiple images and extend our
> build coverage,
>
This seems limited. Dockerhub has the ability to follow any branch and
> associate a tag.
> I'm thinking that we create branches for each base image, like:
>   - branch: ubuntu-16.04
>   - ubuntu-18.04
>   - fedora-29
>   - fedora-30
>   - opensuse-tumbleweed
>   - opensuse-leap
>   - etc
>

If I understand you correctly, you're suggesting to create a separate Git
branch for each supported OS, and each Git branch has a single Dockerfile?

That seems like it might lead to a lot of extra busy work. E.g., if you
want to add a new dependency, you'll have to do N commits touching N files
across N branches.

I'd think you could configure Docker Hub to build multiple Dockerfiles
(e.g., stored within separate subdirectories, or "build contexts" in Docker
lingo?
<https://docs.docker.com/docker-hub/builds/#set-the-build-context-and-docke=
rfile-location>)
within a single branch. Then if you need to make sweeping updates, that's
only 1 commit touching N files across 1 branch.

Thoughts, ideas objections are welcome. I am **not** a Docker expert.
>

Caveat: I'm certainly not either.

--===============3211719557602779377==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTox
OSBQTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3Rl
Ojxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFw
eCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPklmIHdlIHdhbnQgdG8g
dXRpbGl6ZSBkb2NrZXJodWIgdG8gYnVpbGQgbXVsdGlwbGUgaW1hZ2VzIGFuZCBleHRlbmQgb3Vy
IGJ1aWxkIGNvdmVyYWdlLDxicj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBz
b2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPgpUaGlzIHNlZW1zIGxpbWl0
ZWQuIERvY2tlcmh1YiBoYXMgdGhlIGFiaWxpdHkgdG8gZm9sbG93IGFueSBicmFuY2ggYW5kIGFz
c29jaWF0ZSBhIHRhZy48YnI+CkkmIzM5O20gdGhpbmtpbmcgdGhhdCB3ZSBjcmVhdGUgYnJhbmNo
ZXMgZm9yIGVhY2ggYmFzZSBpbWFnZSwgbGlrZTo8YnI+CsKgIC0gYnJhbmNoOiB1YnVudHUtMTYu
MDQ8YnI+CsKgIC0gdWJ1bnR1LTE4LjA0IDxicj4KwqAgLSBmZWRvcmEtMjk8YnI+CsKgIC0gZmVk
b3JhLTMwPGJyPgrCoCAtIG9wZW5zdXNlLXR1bWJsZXdlZWQ8YnI+CsKgIC0gb3BlbnN1c2UtbGVh
cDxicj4KwqAgLSBldGM8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+SWYgSSB1
bmRlcnN0YW5kIHlvdSBjb3JyZWN0bHksIHlvdSYjMzk7cmUgc3VnZ2VzdGluZyB0byBjcmVhdGUg
YSBzZXBhcmF0ZSBHaXQgYnJhbmNoIGZvciBlYWNoIHN1cHBvcnRlZCBPUywgYW5kIGVhY2ggR2l0
IGJyYW5jaCBoYXMgYSBzaW5nbGUgRG9ja2VyZmlsZT88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PlRoYXQgc2VlbXMgbGlrZSBpdCBtaWdodCBsZWFkIHRvIGEgbG90IG9mIGV4dHJhIGJ1c3kgd29y
ay4gRS5nLiwgaWYgeW91IHdhbnQgdG8gYWRkIGEgbmV3IGRlcGVuZGVuY3ksIHlvdSYjMzk7bGwg
aGF2ZSB0byBkbyBOIGNvbW1pdHMgdG91Y2hpbmcgTiBmaWxlcyBhY3Jvc3MgTiBicmFuY2hlcy48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5O2QgdGhpbmsgeW91IGNvdWxkIGNvbmZpZ3Vy
ZSBEb2NrZXIgSHViIHRvIGJ1aWxkIG11bHRpcGxlIERvY2tlcmZpbGVzIChlLmcuLCBzdG9yZWQg
d2l0aGluIHNlcGFyYXRlIHN1YmRpcmVjdG9yaWVzLCBvciA8YSBocmVmPSJodHRwczovL2RvY3Mu
ZG9ja2VyLmNvbS9kb2NrZXItaHViL2J1aWxkcy8jc2V0LXRoZS1idWlsZC1jb250ZXh0LWFuZC1k
b2NrZXJmaWxlLWxvY2F0aW9uIj4mcXVvdDtidWlsZCBjb250ZXh0cyZxdW90OyBpbiBEb2NrZXIg
bGluZ28/PC9hPikgd2l0aGluIGEgc2luZ2xlIGJyYW5jaC4gVGhlbiBpZiB5b3UgbmVlZCB0byBt
YWtlIHN3ZWVwaW5nIHVwZGF0ZXMsIHRoYXQmIzM5O3Mgb25seSAxIGNvbW1pdCB0b3VjaGluZyBO
IGZpbGVzIGFjcm9zcyAxIGJyYW5jaC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48YmxvY2txdW90ZSBj
bGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+ClRob3Vn
aHRzLCBpZGVhcyBvYmplY3Rpb25zIGFyZSB3ZWxjb21lLiBJIGFtICoqbm90KiogYSBEb2NrZXIg
ZXhwZXJ0LiA8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+Q2F2ZWF0OiBJJiMz
OTttIGNlcnRhaW5seSBub3QgZWl0aGVyLjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============3211719557602779377==--

