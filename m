Content-Type: multipart/mixed; boundary="===============4118332715434431410=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: Re: [tpm2] tpm2-abrmd in a container
Date: Mon, 04 Feb 2019 16:57:12 +0000
Message-ID: <CAKrSGQS_pe=U-staHmcyoRYgYofSTexkxSC=sYem=K1r=P9Wcg@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649CDE780@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4118332715434431410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 4, 2019 at 4:12 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> I run it in our CI system which is using a docker container, not sure if
> that helps
> But you can look at our scripts for it.
>

Do you mean the following travis-ci file:

https://github.com/tpm2-software/tpm2-abrmd/blob/master/.travis.yml#L2

I noticed this, but I think its a VM (unless I am mistaken):

https://docs.travis-ci.com/user/reference/overview/#virtualization-environm=
ents

Any pointers to files that reference your container use, would be helpful.

Cheers,

Luke



>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Luke Hinds
> > Sent: Monday, February 4, 2019 7:47 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] tpm2-abrmd in a container
> >
> > Hello,
> >
> > I have been working on trying to get tpm2-abrmd running in a container,
> but its
> > proving problematic as there is a requirement on system-d and dbus. This
> in turn
> > requires running the container as privileged and mounting the hosts
> cgroup (and
> > adding cap sys-admin).
> >
> > My reason for using a container, is for CI / functional testing of a
> project that will
> > use abrmd and having a lightweight means to test against the resource
> manager
> > running in a container.
> >
> > I am still early in looking at ways to achieve this, so I wanted to ask
> if any others
> > have snippets of previous attempts (successful or not) they could share?
> >
> > Thanks,
> >
> > Luke
>


-- =

Luke Hinds | NFV Partner Engineering | CTO Office | Red Hat
e: lhinds(a)redhat.com | irc: lhinds @freenode | t: +44 12 52 36 2483

--===============4118332715434431410==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0
ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+
PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1vbiwgRmViIDQsIDIwMTkgYXQg
NDoxMiBQTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMu
cm9iZXJ0c0BpbnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdy
b3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJn
aW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIw
NCk7cGFkZGluZy1sZWZ0OjFleCI+SSBydW4gaXQgaW4gb3VyIENJIHN5c3RlbSB3aGljaCBpcyB1
c2luZyBhIGRvY2tlciBjb250YWluZXIsIG5vdCBzdXJlIGlmIHRoYXQgaGVscHM8YnI+CkJ1dCB5
b3UgY2FuIGxvb2sgYXQgb3VyIHNjcmlwdHMgZm9yIGl0Ljxicj48L2Jsb2NrcXVvdGU+PGRpdj48
YnI+PC9kaXY+PGRpdj5EbyB5b3UgbWVhbiB0aGUgZm9sbG93aW5nIHRyYXZpcy1jaSBmaWxlOjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTIt
c29mdHdhcmUvdHBtMi1hYnJtZC9ibG9iL21hc3Rlci8udHJhdmlzLnltbCNMMiI+aHR0cHM6Ly9n
aXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi1hYnJtZC9ibG9iL21hc3Rlci8udHJhdmlzLnlt
bCNMMjwvYT48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkkgbm90aWNlZCB0aGlzLCBidXQgSSB0
aGluayBpdHMgYSBWTSAodW5sZXNzIEkgYW0gbWlzdGFrZW4pOjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9kb2NzLnRyYXZpcy1jaS5jb20vdXNlci9yZWZlcmVuY2Uv
b3ZlcnZpZXcvI3ZpcnR1YWxpemF0aW9uLWVudmlyb25tZW50cyI+aHR0cHM6Ly9kb2NzLnRyYXZp
cy1jaS5jb20vdXNlci9yZWZlcmVuY2Uvb3ZlcnZpZXcvI3ZpcnR1YWxpemF0aW9uLWVudmlyb25t
ZW50czwvYT48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5BbnkgcG9pbnRlcnMgdG8gZmls
ZXMgdGhhdCByZWZlcmVuY2UgeW91ciBjb250YWluZXIgdXNlLCB3b3VsZCBiZSBoZWxwZnVsLjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Q2hlZXJzLDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
THVrZTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0i
Z21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6
MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+Cjxicj4KJmd0OyAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4KJmd0OyBGcm9tOiB0cG0yIFttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnRwbTItYm91bmNlc0BsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50
cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnPC9hPl0gT24gQmVoYWxmIE9mIEx1a2UgSGluZHM8YnI+
CiZndDsgU2VudDogTW9uZGF5LCBGZWJydWFyeSA0LCAyMDE5IDc6NDcgQU08YnI+CiZndDsgVG86
IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJA
bGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyBTdWJqZWN0OiBbdHBtMl0gdHBtMi1hYnJtZCBpbiBh
IGNvbnRhaW5lcjxicj4KJmd0OyA8YnI+CiZndDsgSGVsbG8sPGJyPgomZ3Q7IDxicj4KJmd0OyBJ
IGhhdmUgYmVlbiB3b3JraW5nIG9uIHRyeWluZyB0byBnZXQgdHBtMi1hYnJtZCBydW5uaW5nIGlu
IGEgY29udGFpbmVyLCBidXQgaXRzPGJyPgomZ3Q7IHByb3ZpbmcgcHJvYmxlbWF0aWMgYXMgdGhl
cmUgaXMgYSByZXF1aXJlbWVudCBvbiBzeXN0ZW0tZCBhbmQgZGJ1cy4gVGhpcyBpbiB0dXJuPGJy
PgomZ3Q7IHJlcXVpcmVzIHJ1bm5pbmcgdGhlIGNvbnRhaW5lciBhcyBwcml2aWxlZ2VkIGFuZCBt
b3VudGluZyB0aGUgaG9zdHMgY2dyb3VwIChhbmQ8YnI+CiZndDsgYWRkaW5nIGNhcCBzeXMtYWRt
aW4pLjxicj4KJmd0OyA8YnI+CiZndDsgTXkgcmVhc29uIGZvciB1c2luZyBhIGNvbnRhaW5lciwg
aXMgZm9yIENJIC8gZnVuY3Rpb25hbCB0ZXN0aW5nIG9mIGEgcHJvamVjdCB0aGF0IHdpbGw8YnI+
CiZndDsgdXNlIGFicm1kIGFuZCBoYXZpbmcgYSBsaWdodHdlaWdodCBtZWFucyB0byB0ZXN0IGFn
YWluc3QgdGhlIHJlc291cmNlIG1hbmFnZXI8YnI+CiZndDsgcnVubmluZyBpbiBhIGNvbnRhaW5l
ci48YnI+CiZndDsgPGJyPgomZ3Q7IEkgYW0gc3RpbGwgZWFybHkgaW4gbG9va2luZyBhdCB3YXlz
IHRvIGFjaGlldmUgdGhpcywgc28gSSB3YW50ZWQgdG8gYXNrIGlmIGFueSBvdGhlcnM8YnI+CiZn
dDsgaGF2ZSBzbmlwcGV0cyBvZiBwcmV2aW91cyBhdHRlbXB0cyAoc3VjY2Vzc2Z1bCBvciBub3Qp
IHRoZXkgY291bGQgc2hhcmU/PGJyPgomZ3Q7IDxicj4KJmd0OyBUaGFua3MsPGJyPgomZ3Q7IDxi
cj4KJmd0OyBMdWtlPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyIGNsZWFyPSJhbGwiPjxkaXY+
PGJyPjwvZGl2Pi0tIDxicj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfc2lnbmF0dXJlIj48
ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPkx1a2UgSGluZHMgfCBORlYgUGFydG5lciBFbmdp
bmVlcmluZyB8IENUTyBPZmZpY2UgfCBSZWQgSGF0PC9zcGFuPjxiciBzdHlsZT0iZm9udC1zaXpl
OjEyLjhweCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPmU6wqA8L3NwYW4+PGEgaHJl
Zj0ibWFpbHRvOmxoaW5kc0ByZWRoYXQuY29tIiBzdHlsZT0iY29sb3I6cmdiKDE3LDg1LDIwNCk7
Zm9udC1zaXplOjEyLjhweCIgdGFyZ2V0PSJfYmxhbmsiPmxoaW5kc0ByZWRoYXQuY29tPC9hPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij7CoHwgaXJjOiBsaGluZHMgQGZyZWVub2RlIHw8
L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPiB0OsKgPC9zcGFuPis0NCAxMiA1
MiAzNiAyNDgzPGJyIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij48L2Rpdj48L2Rpdj48L2Rpdj48
L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============4118332715434431410==--

