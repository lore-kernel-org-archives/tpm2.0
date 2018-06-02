Content-Type: multipart/mixed; boundary="===============6406791007962369079=="
MIME-Version: 1.0
From: Trevor Woerner <twoerner at gmail.com>
Subject: Re: [tpm2] dlopen()'ing raw .so files considered bad
Date: Fri, 01 Jun 2018 22:19:43 -0400
Message-ID: <CAHUNapQ38tcZRFn5qfzjyZExS2XLTqNARWCtWR=9Tv1+TKbWrw@mail.gmail.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D010EB3C750@EXCH2010B.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6406791007962369079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It seems odd for this project would say "we don't want to have to deal with
versioning". Aren't we now, as we speak, witnessing a
non-backwards-compatible API version break with TSS? How are users supposed
to deal with this? There are existing apps that expect the old TSS and they
will never be updated. Now the TSS is changing in such a way that all those
programs will break if they try to link to and run with the new shared
libraries. If those libraries aren't versioned, how are they, or the
runtime linker supposed to know what to do?

If everyone followed convention, the old apps would look for and
runtime-link against, say, libtss.so.0. Now that the API has changed, the
new library should be called libtss.so.1. New apps can link against this
new library, and everything will work. Distributions are welcome to provide
the old TSS library, or the new one, or both, or neither. Applications that
aren't updated and expect the old API will continue to runtime-link against
libtss.so.0, and new apps or old apps that are updated will runtime-link
against libtss.so.1. No conflicts, no issues.

The "shared library hell" occurs when all versioning is removed and
everyone assumes there's just one, unversioned library against which to
link: libtss.so. How will distros provide support for old and new apps? How
will developers ever know which one is installed?

Versioned libraries are not a new idea. Unversioned shared-object files
will make it difficult for distributions to package these libraries, to the
point where they might decide to not bother trying to package them at all.
Unversioned shared-objects will always be a continual source of instability
for anything that tries to use them. With unversioned shared libraries, the
only way old and new apps can exist on the same system is if these
libraries are installed to different locations and the ELF headers are
manually hard-coded to look in one place and not the other for the correct
library against which to link. What about configuring and compiling apps
that want to use this library? The ./configure step will succeed (because
it would look for libtss.so and find it) but the actual compile-time
linking would fail because, inevitably, symbols won't be found or resolved.
Never mind what will happen at runtime :-)

These conventions (that library.so.N is what should be provided and linked
against and that library.so is just a developer crutch for development time
only) are very old and ingrained in the way all Linux distributions package
libraries.

Unless, of course, you want to take on the task of finding and updating
every single application that ever links to your library every time there
is an API change, for the rest of eternity ;-)

On Fri, Jun 1, 2018 at 12:51 PM, Fuchs, Andreas <
andreas.fuchs(a)sit.fraunhofer.de> wrote:

> P.S. or should we just install everything as .so.0 and merely never
> imagine to have a .so.1 file for
> any tcti ever ?
>
> I'm not that familiar with conventions here.
> ------------------------------
> *From:* Fuchs, Andreas
> *Sent:* Friday, June 01, 2018 18:49
> *To:* Trevor Woerner; Philip Tricca
> *Cc:* tpm2(a)lists.01.org
> *Subject:* RE: [tpm2] dlopen()'ing raw .so files considered bad
>
> I just wanted to make sure we're not doing the same work twice.
>
> The (one) symbol Tss2_Tcti_GetInfo() exported by TCTI-so-files is fixed.
> The data structures
> returned by this (the info itself and the function lookup table) are
> versioned in their first field.
>
> The purpose of this was to not require so-file versioning.
>
> Given this background, would you agree that we should not even start
> introducing versioned
> so-file (e.g. tss2_tcti_socket.so.0) but only ever deploy unversioned
> so-files (tss2_tcti_socket.so).
>
>
> ------------------------------
> *From:* tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Trevor Woerner [
> twoerner(a)gmail.com]
> *Sent:* Friday, June 01, 2018 02:15
> *To:* Philip Tricca
> *Cc:* tpm2(a)lists.01.org
> *Subject:* Re: [tpm2] dlopen()'ing raw .so files considered bad
>
> Thank you. I had been working on this for part of the afternoon and wasn't
> successful, but I wanted to raise the flag sooner rather than later.
>
> I had tried William's patch in isolation, but found more was needed. I was
> going to dive into it harder tomorrow.
>

--===============6406791007962369079==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj5JdCBzZWVtcyBvZGQgZm9yIHRoaXMgcHJvamVjdCB3b3VsZCBzYXkgJnF1b3Q7d2Ug
ZG9uJiMzOTt0IHdhbnQgdG8gaGF2ZSB0byBkZWFsIHdpdGggdmVyc2lvbmluZyZxdW90Oy4gQXJl
biYjMzk7dCB3ZSBub3csIGFzIHdlIHNwZWFrLCB3aXRuZXNzaW5nIGEgbm9uLWJhY2t3YXJkcy1j
b21wYXRpYmxlIEFQSSB2ZXJzaW9uIGJyZWFrIHdpdGggVFNTPyBIb3cgYXJlIHVzZXJzIHN1cHBv
c2VkIHRvIGRlYWwgd2l0aCB0aGlzPyBUaGVyZSBhcmUgZXhpc3RpbmcgYXBwcyB0aGF0IGV4cGVj
dCB0aGUgb2xkIFRTUyBhbmQgdGhleSB3aWxsIG5ldmVyIGJlIHVwZGF0ZWQuIE5vdyB0aGUgVFNT
IGlzIGNoYW5naW5nIGluIHN1Y2ggYSB3YXkgdGhhdCBhbGwgdGhvc2UgcHJvZ3JhbXMgd2lsbCBi
cmVhayBpZiB0aGV5IHRyeSB0byBsaW5rIHRvIGFuZCBydW4gd2l0aCB0aGUgbmV3IHNoYXJlZCBs
aWJyYXJpZXMuIElmIHRob3NlIGxpYnJhcmllcyBhcmVuJiMzOTt0IHZlcnNpb25lZCwgaG93IGFy
ZSB0aGV5LCBvciB0aGUgcnVudGltZSBsaW5rZXIgc3VwcG9zZWQgdG8ga25vdyB3aGF0IHRvIGRv
PzwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21h
aWxfcXVvdGUiPklmIGV2ZXJ5b25lIGZvbGxvd2VkIGNvbnZlbnRpb24sIHRoZSBvbGQgYXBwcyB3
b3VsZCBsb29rIGZvciBhbmQgcnVudGltZS1saW5rIGFnYWluc3QsIHNheSwgbGlidHNzLnNvLjAu
IE5vdyB0aGF0IHRoZSBBUEkgaGFzIGNoYW5nZWQsIHRoZSBuZXcgbGlicmFyeSBzaG91bGQgYmUg
Y2FsbGVkIGxpYnRzcy5zby4xLiBOZXcgYXBwcyBjYW4gbGluayBhZ2FpbnN0IHRoaXMgbmV3IGxp
YnJhcnksIGFuZCBldmVyeXRoaW5nIHdpbGwgd29yay4gRGlzdHJpYnV0aW9ucyBhcmUgd2VsY29t
ZSB0byBwcm92aWRlIHRoZSBvbGQgVFNTIGxpYnJhcnksIG9yIHRoZSBuZXcgb25lLCBvciBib3Ro
LCBvciBuZWl0aGVyLiBBcHBsaWNhdGlvbnMgdGhhdCBhcmVuJiMzOTt0IHVwZGF0ZWQgYW5kIGV4
cGVjdCB0aGUgb2xkIEFQSSB3aWxsIGNvbnRpbnVlIHRvIHJ1bnRpbWUtbGluayBhZ2FpbnN0IGxp
YnRzcy5zby4wLCBhbmQgbmV3IGFwcHMgb3Igb2xkIGFwcHMgdGhhdCBhcmUgdXBkYXRlZCB3aWxs
IHJ1bnRpbWUtbGluayBhZ2FpbnN0IGxpYnRzcy5zby4xLiBObyBjb25mbGljdHMsIG5vIGlzc3Vl
cy48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9Imdt
YWlsX3F1b3RlIj5UaGUgJnF1b3Q7c2hhcmVkIGxpYnJhcnkgaGVsbCZxdW90OyBvY2N1cnMgd2hl
biBhbGwgdmVyc2lvbmluZyBpcyByZW1vdmVkIGFuZCBldmVyeW9uZSBhc3N1bWVzIHRoZXJlJiMz
OTtzIGp1c3Qgb25lLCB1bnZlcnNpb25lZCBsaWJyYXJ5IGFnYWluc3Qgd2hpY2ggdG8gbGluazog
bGlidHNzLnNvLiBIb3cgd2lsbCBkaXN0cm9zIHByb3ZpZGUgc3VwcG9ydCBmb3Igb2xkIGFuZCBu
ZXcgYXBwcz8gSG93IHdpbGwgZGV2ZWxvcGVycyBldmVyIGtub3cgd2hpY2ggb25lIGlzIGluc3Rh
bGxlZD88L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9
ImdtYWlsX3F1b3RlIj5WZXJzaW9uZWQgbGlicmFyaWVzIGFyZSBub3QgYSBuZXcgaWRlYS4gVW52
ZXJzaW9uZWQgc2hhcmVkLW9iamVjdCBmaWxlcyB3aWxsIG1ha2UgaXQgZGlmZmljdWx0IGZvciBk
aXN0cmlidXRpb25zIHRvIHBhY2thZ2UgdGhlc2UgbGlicmFyaWVzLCB0byB0aGUgcG9pbnQgd2hl
cmUgdGhleSBtaWdodCBkZWNpZGUgdG8gbm90IGJvdGhlciB0cnlpbmcgdG8gcGFja2FnZSB0aGVt
IGF0IGFsbC4gVW52ZXJzaW9uZWQgc2hhcmVkLW9iamVjdHMgd2lsbCBhbHdheXMgYmUgYSBjb250
aW51YWwgc291cmNlIG9mIGluc3RhYmlsaXR5IGZvciBhbnl0aGluZyB0aGF0IHRyaWVzIHRvIHVz
ZSB0aGVtLiBXaXRoIHVudmVyc2lvbmVkIHNoYXJlZCBsaWJyYXJpZXMsIHRoZSBvbmx5IHdheSBv
bGQgYW5kIG5ldyBhcHBzIGNhbiBleGlzdCBvbiB0aGUgc2FtZSBzeXN0ZW0gaXMgaWYgdGhlc2Ug
bGlicmFyaWVzIGFyZSBpbnN0YWxsZWQgdG8gZGlmZmVyZW50IGxvY2F0aW9ucyBhbmQgdGhlIEVM
RiBoZWFkZXJzIGFyZSBtYW51YWxseSBoYXJkLWNvZGVkIHRvIGxvb2sgaW4gb25lIHBsYWNlIGFu
ZCBub3QgdGhlIG90aGVyIGZvciB0aGUgY29ycmVjdCBsaWJyYXJ5IGFnYWluc3Qgd2hpY2ggdG8g
bGluay4gV2hhdCBhYm91dCBjb25maWd1cmluZyBhbmQgY29tcGlsaW5nIGFwcHMgdGhhdCB3YW50
IHRvIHVzZSB0aGlzIGxpYnJhcnk/IFRoZSAuL2NvbmZpZ3VyZSBzdGVwIHdpbGwgc3VjY2VlZCAo
YmVjYXVzZSBpdCB3b3VsZCBsb29rIGZvciBsaWJ0c3Muc28gYW5kIGZpbmQgaXQpIGJ1dCB0aGUg
YWN0dWFsIGNvbXBpbGUtdGltZSBsaW5raW5nIHdvdWxkIGZhaWwgYmVjYXVzZSwgaW5ldml0YWJs
eSwgc3ltYm9scyB3b24mIzM5O3QgYmUgZm91bmQgb3IgcmVzb2x2ZWQuIE5ldmVyIG1pbmQgd2hh
dCB3aWxsIGhhcHBlbiBhdCBydW50aW1lIDotKTwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3Rl
Ij48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPlRoZXNlIGNvbnZlbnRpb25zICh0
aGF0IGxpYnJhcnkuc28uTiBpcyB3aGF0IHNob3VsZCBiZSBwcm92aWRlZCBhbmQgbGlua2VkIGFn
YWluc3QgYW5kIHRoYXQgbGlicmFyeS5zbyBpcyBqdXN0IGEgZGV2ZWxvcGVyIGNydXRjaCBmb3Ig
ZGV2ZWxvcG1lbnQgdGltZSBvbmx5KSBhcmUgdmVyeSBvbGQgYW5kIGluZ3JhaW5lZCBpbiB0aGUg
d2F5IGFsbCBMaW51eCBkaXN0cmlidXRpb25zIHBhY2thZ2UgbGlicmFyaWVzLjwvZGl2PjxkaXYg
Y2xhc3M9ImdtYWlsX3F1b3RlIj48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPlVu
bGVzcywgb2YgY291cnNlLCB5b3Ugd2FudCB0byB0YWtlIG9uIHRoZSB0YXNrIG9mIGZpbmRpbmcg
YW5kIHVwZGF0aW5nIGV2ZXJ5IHNpbmdsZSBhcHBsaWNhdGlvbiB0aGF0IGV2ZXIgbGlua3MgdG8g
eW91ciBsaWJyYXJ5IGV2ZXJ5IHRpbWUgdGhlcmUgaXMgYW4gQVBJIGNoYW5nZSwgZm9yIHRoZSBy
ZXN0IG9mIGV0ZXJuaXR5IDstKTwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48YnI+PC9k
aXY+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIEZyaSwgSnVuIDEsIDIwMTggYXQgMTI6NTEg
UE0sIEZ1Y2hzLCBBbmRyZWFzIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOmFu
ZHJlYXMuZnVjaHNAc2l0LmZyYXVuaG9mZXIuZGUiIHRhcmdldD0iX2JsYW5rIj5hbmRyZWFzLmZ1
Y2hzQHNpdC5mcmF1bmhvZmVyLmRlPC9hPiZndDs8L3NwYW4+IHdyb3RlOjxicj48YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVm
dDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KCgoKCjxkaXY+CjxkaXYgc3R5bGU9
ImRpcmVjdGlvbjpsdHI7Zm9udC1mYW1pbHk6VGFob21hO2NvbG9yOiMwMDAwMDA7Zm9udC1zaXpl
OjEwcHQiPgo8ZGl2PlAuUy4gb3Igc2hvdWxkIHdlIGp1c3QgaW5zdGFsbCBldmVyeXRoaW5nIGFz
IC5zby4wIGFuZCBtZXJlbHkgbmV2ZXIgaW1hZ2luZSB0byBoYXZlIGEgLnNvLjEgZmlsZSBmb3I8
L2Rpdj4KPGRpdj5hbnkgdGN0aSBldmVyID88L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pkkm
IzM5O20gbm90IHRoYXQgZmFtaWxpYXIgd2l0aCBjb252ZW50aW9ucyBoZXJlLjxicj4KPC9kaXY+
CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OlRpbWVzIE5ldyBSb21hbjtjb2xvcjojMDAwMDAwO2Zv
bnQtc2l6ZToxNnB4Ij4KPGhyPgo8ZGl2IGlkPSJtXzU3MTg2MTAwMDU2NjMyMzk4ODdkaXZScEYx
MTA3NDkiIHN0eWxlPSJkaXJlY3Rpb246bHRyIj48Zm9udCBzaXplPSIyIiBmYWNlPSJUYWhvbWEi
IGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gRnVjaHMsIEFuZHJlYXM8YnI+CjxiPlNlbnQ6
PC9iPiBGcmlkYXksIEp1bmUgMDEsIDIwMTggMTg6NDk8YnI+CjxiPlRvOjwvYj4gVHJldm9yIFdv
ZXJuZXI7IFBoaWxpcCBUcmljY2E8YnI+CjxiPkNjOjwvYj4gPGEgaHJlZj0ibWFpbHRvOnRwbTJA
bGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8
Yj5TdWJqZWN0OjwvYj4gUkU6IFt0cG0yXSBkbG9wZW4oKSYjMzk7aW5nIHJhdyAuc28gZmlsZXMg
Y29uc2lkZXJlZCBiYWQ8YnI+CjwvZm9udD48YnI+CjwvZGl2PjxkaXY+PGRpdiBjbGFzcz0iaDUi
Pgo8ZGl2PjwvZGl2Pgo8ZGl2Pgo8ZGl2IHN0eWxlPSJkaXJlY3Rpb246bHRyO2ZvbnQtZmFtaWx5
OlRhaG9tYTtjb2xvcjojMDAwMDAwO2ZvbnQtc2l6ZToxMHB0Ij4KPGRpdj5JIGp1c3Qgd2FudGVk
IHRvIG1ha2Ugc3VyZSB3ZSYjMzk7cmUgbm90IGRvaW5nIHRoZSBzYW1lIHdvcmsgdHdpY2UuPC9k
aXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5UaGUgKG9uZSkgc3ltYm9sIFRzczJfVGN0aV9HZXRJ
bmZvKCkgZXhwb3J0ZWQgYnkgVENUSS1zby1maWxlcyBpcyBmaXhlZC4gVGhlIGRhdGEgc3RydWN0
dXJlczwvZGl2Pgo8ZGl2PnJldHVybmVkIGJ5IHRoaXMgKHRoZSBpbmZvIGl0c2VsZiBhbmQgdGhl
IGZ1bmN0aW9uIGxvb2t1cCB0YWJsZSkgYXJlIHZlcnNpb25lZCBpbiB0aGVpciBmaXJzdCBmaWVs
ZC48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PlRoZSBwdXJwb3NlIG9mIHRoaXMgd2FzIHRv
IG5vdCByZXF1aXJlIHNvLWZpbGUgdmVyc2lvbmluZy48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8
ZGl2PkdpdmVuIHRoaXMgYmFja2dyb3VuZCwgd291bGQgeW91IGFncmVlIHRoYXQgd2Ugc2hvdWxk
IG5vdCBldmVuIHN0YXJ0IGludHJvZHVjaW5nIHZlcnNpb25lZDwvZGl2Pgo8ZGl2PnNvLWZpbGUg
KGUuZy4gdHNzMl90Y3RpX3NvY2tldC5zby4wKSBidXQgb25seSBldmVyIGRlcGxveSB1bnZlcnNp
b25lZCBzby1maWxlcyAodHNzMl90Y3RpX3NvY2tldC5zbykuPC9kaXY+CjxkaXY+PGJyPgo8L2Rp
dj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTpUaW1lcyBOZXcgUm9t
YW47Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTZweCI+Cjxocj4KPGRpdiBpZD0ibV81NzE4NjEw
MDA1NjYzMjM5ODg3ZGl2UnBGNTU3OTg2IiBzdHlsZT0iZGlyZWN0aW9uOmx0ciI+PGZvbnQgc2l6
ZT0iMiIgZmFjZT0iVGFob21hIiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IHRwbTIgWzxh
IGhyZWY9Im1haWx0bzp0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+
dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZzwvYT5dIG9uIGJlaGFsZiBvZiBUcmV2b3IgV29lcm5l
ciBbPGEgaHJlZj0ibWFpbHRvOnR3b2VybmVyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnR3
b2VybmVyQGdtYWlsLmNvbTwvYT5dPGJyPgo8Yj5TZW50OjwvYj4gRnJpZGF5LCBKdW5lIDAxLCAy
MDE4IDAyOjE1PGJyPgo8Yj5Ubzo8L2I+IFBoaWxpcCBUcmljY2E8YnI+CjxiPkNjOjwvYj4gPGEg
aHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0
cy4wMS5vcmc8L2E+PGJyPgo8Yj5TdWJqZWN0OjwvYj4gUmU6IFt0cG0yXSBkbG9wZW4oKSYjMzk7
aW5nIHJhdyAuc28gZmlsZXMgY29uc2lkZXJlZCBiYWQ8YnI+CjwvZm9udD48YnI+CjwvZGl2Pgo8
ZGl2PjwvZGl2Pgo8ZGl2Pgo8ZGl2IGRpcj0ibHRyIj4KPGRpdiBjbGFzcz0iZ21haWxfZXh0cmEi
PlRoYW5rIHlvdS4gSSBoYWQgYmVlbiB3b3JraW5nIG9uIHRoaXMgZm9yIHBhcnQgb2YgdGhlIGFm
dGVybm9vbiBhbmQgd2FzbiYjMzk7dCBzdWNjZXNzZnVsLCBidXQgSSB3YW50ZWQgdG8gcmFpc2Ug
dGhlIGZsYWcgc29vbmVyIHJhdGhlciB0aGFuIGxhdGVyLjwvZGl2Pgo8ZGl2IGNsYXNzPSJnbWFp
bF9leHRyYSI+PGJyPgo8L2Rpdj4KPGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPkkgaGFkIHRyaWVk
IFdpbGxpYW0mIzM5O3MgcGF0Y2ggaW4gaXNvbGF0aW9uLCBidXQgZm91bmQgbW9yZSB3YXMgbmVl
ZGVkLiBJIHdhcyBnb2luZyB0byBkaXZlIGludG8gaXQgaGFyZGVyIHRvbW9ycm93LjwvZGl2Pgo8
L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2PjwvZGl2PjwvZGl2Pgo8L2Rp
dj4KPC9kaXY+Cgo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2PjwvZGl2Pgo=

--===============6406791007962369079==--

