Content-Type: multipart/mixed; boundary="===============3612830772667181974=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: Re: [tpm2] [tpm2-abrmd] Resource manager reconnect.
Date: Mon, 11 Feb 2019 07:38:11 +0000
Message-ID: <CAKrSGQSHZFcooioAXNeC87KuKOQDvtHU-Gk2EbBf6UZ36W0jQA@mail.gmail.com>
In-Reply-To: 7df248df-986f-ec9a-0c54-5dcb6847b1f7@twobit.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3612830772667181974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2019 at 4:27 AM Philip Tricca <flihp(a)twobit.org> wrote:

> Hi Luke,
>
> On 2/8/19 1:36 AM, Luke Hinds wrote:
> > Not sure if this is an known issue, so thought I would float it here
> > first before opening a github issue.
> >
> > I observed the following when using tpm2-abrmd and the mssim
> (ibmtpm1119):
> >
> > Preconditions:
> >
> > running tpm_server
> > active tpm-abrmd service
> >
> > If you now kill / restat the tpm_server, the tpm-abrmd service fails,
> > unless its also restarted.
>
> https://github.com/tpm2-software/tpm2-abrmd/issues/385
>
> We've had a general "make error handling better" issue opened for a while.
>

Thanks Philip, I will read and follow #385


>
> >  Let me demonstrate:
> > [root(a)3896227cc7ee ~]# tpm_server &
> > [root(a)3896227cc7ee ~]# systemctl start tpm2-abrmd
> > [root(a)3896227cc7ee ~]# tpm2_pcrlist
> > sha1:
> >   0 : 0x0000000000000000000000000000000000000003
> >   1 : 0x0000000000000000000000000000000000000000
> > <snip>
> >
> > All good, lets kill and start the tpm_server again, while leaving the
> > tpm2-abrmd service running:
> >
> > [root(a)3896227cc7ee ~]# pkill tpm_server
> > [root(a)3896227cc7ee ~]# tpm_server &
> > [root(a)3896227cc7ee ~]# tpm2_pcrlist
> > ERROR: Tss2_Sys_GetCapability(0xA000A) - tcti:IO failure
> > ERROR: Unable to run tpm2_pcrlist
> >
> > So let's restart the service as well:
> >
> > [root(a)3896227cc7ee ~]# systemctl restart tpm2-abrmd
> > [root(a)3896227cc7ee ~]# tpm2_pcrlist
> > sha1:
> >   0 : 0x0000000000000000000000000000000000000003
> >   1 : 0x0000000000000000000000000000000000000000
> >
> > I guess this may be a limitation / known issue when tpm2-abrmd is used
> > with a swtpm. If so, nothing to see here. If not, let me know and I am
> > happy to raise a GH issue.
>
> Feel free to comment on the existing issue. What we can do in cases like
> this w/r/t recovery are pretty limited but maybe we can come up with
> something better.
>
> Philip
>


-- =

Luke Hinds  | CTO Office | Red Hat
e: lhinds(a)redhat.com | irc: lhinds @freenode | t: +44 12 52 36 2483

--===============3612830772667181974==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1vbiwgRmVi
IDExLCAyMDE5IGF0IDQ6MjcgQU0gUGhpbGlwIFRyaWNjYSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmZs
aWhwQHR3b2JpdC5vcmciPmZsaWhwQHR3b2JpdC5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPkhpIEx1a2UsPGJyPgo8YnI+Ck9uIDIvOC8xOSAxOjM2IEFNLCBMdWtlIEhpbmRzIHdy
b3RlOjxicj4KJmd0OyBOb3Qgc3VyZSBpZiB0aGlzIGlzIGFuIGtub3duIGlzc3VlLCBzbyB0aG91
Z2h0IEkgd291bGQgZmxvYXQgaXQgaGVyZTxicj4KJmd0OyBmaXJzdCBiZWZvcmUgb3BlbmluZyBh
IGdpdGh1YiBpc3N1ZS48YnI+CiZndDsgPGJyPgomZ3Q7IEkgb2JzZXJ2ZWQgdGhlIGZvbGxvd2lu
ZyB3aGVuIHVzaW5nIHRwbTItYWJybWQgYW5kIHRoZSBtc3NpbSAoaWJtdHBtMTExOSk6PGJyPgom
Z3Q7IDxicj4KJmd0OyBQcmVjb25kaXRpb25zOjxicj4KJmd0OyA8YnI+CiZndDsgcnVubmluZyB0
cG1fc2VydmVyPGJyPgomZ3Q7IGFjdGl2ZSB0cG0tYWJybWQgc2VydmljZTxicj4KJmd0OyA8YnI+
CiZndDsgSWYgeW91IG5vdyBraWxsIC8gcmVzdGF0IHRoZSB0cG1fc2VydmVyLCB0aGUgdHBtLWFi
cm1kIHNlcnZpY2UgZmFpbHMsPGJyPgomZ3Q7IHVubGVzcyBpdHMgYWxzbyByZXN0YXJ0ZWQuPGJy
Pgo8YnI+CjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItYWJy
bWQvaXNzdWVzLzM4NSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9n
aXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi1hYnJtZC9pc3N1ZXMvMzg1PC9hPjxicj4KPGJy
PgpXZSYjMzk7dmUgaGFkIGEgZ2VuZXJhbCAmcXVvdDttYWtlIGVycm9yIGhhbmRsaW5nIGJldHRl
ciZxdW90OyBpc3N1ZSBvcGVuZWQgZm9yIGEgd2hpbGUuPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxi
cj48L2Rpdj48ZGl2PlRoYW5rcyBQaGlsaXAsIEkgd2lsbCByZWFkIGFuZCBmb2xsb3cgIzM4NTwv
ZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJt
YXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0
LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+Cjxicj4KJmd0O8KgIExldCBtZSBkZW1vbnN0cmF0ZTo8
YnI+CiZndDsgW3Jvb3RAMzg5NjIyN2NjN2VlwqB+XSMgdHBtX3NlcnZlciAmYW1wOzxicj4KJmd0
OyBbcm9vdEAzODk2MjI3Y2M3ZWUgfl0jIHN5c3RlbWN0bCBzdGFydCB0cG0yLWFicm1kPGJyPgom
Z3Q7IFtyb290QDM4OTYyMjdjYzdlZSB+XSMgdHBtMl9wY3JsaXN0wqA8YnI+CiZndDsgc2hhMTo8
YnI+CiZndDsgwqAgMCA6IDB4MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
Mzxicj4KJmd0OyDCoCAxIDogMHgwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwPGJyPgomZ3Q7ICZsdDtzbmlwJmd0Ozxicj4KJmd0OyA8YnI+CiZndDsgQWxsIGdvb2QsIGxl
dHMga2lsbCBhbmQgc3RhcnQgdGhlIHRwbV9zZXJ2ZXIgYWdhaW4sIHdoaWxlIGxlYXZpbmcgdGhl
PGJyPgomZ3Q7IHRwbTItYWJybWQgc2VydmljZSBydW5uaW5nOjxicj4KJmd0OyA8YnI+CiZndDsg
W3Jvb3RAMzg5NjIyN2NjN2VlIH5dIyBwa2lsbCB0cG1fc2VydmVyPGJyPgomZ3Q7IFtyb290QDM4
OTYyMjdjYzdlZSB+XSMgdHBtX3NlcnZlciAmYW1wOzxicj4KJmd0OyBbcm9vdEAzODk2MjI3Y2M3
ZWUgfl0jIHRwbTJfcGNybGlzdMKgPGJyPgomZ3Q7IEVSUk9SOiBUc3MyX1N5c19HZXRDYXBhYmls
aXR5KDB4QTAwMEEpIC0gdGN0aTpJTyBmYWlsdXJlPGJyPgomZ3Q7IEVSUk9SOiBVbmFibGUgdG8g
cnVuIHRwbTJfcGNybGlzdDxicj4KJmd0OyA8YnI+CiZndDsgU28gbGV0JiMzOTtzIHJlc3RhcnQg
dGhlIHNlcnZpY2UgYXMgd2VsbDo8YnI+CiZndDsgPGJyPgomZ3Q7IFtyb290QDM4OTYyMjdjYzdl
ZSB+XSMgc3lzdGVtY3RsIHJlc3RhcnQgdHBtMi1hYnJtZDxicj4KJmd0OyBbcm9vdEAzODk2MjI3
Y2M3ZWUgfl0jIHRwbTJfcGNybGlzdMKgPGJyPgomZ3Q7IHNoYTE6PGJyPgomZ3Q7IMKgIDAgOiAw
eDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDM8YnI+CiZndDsgwqAgMSA6
IDB4MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDxicj4KJmd0OyA8YnI+
CiZndDsgSSBndWVzcyB0aGlzIG1heSBiZSBhIGxpbWl0YXRpb24gLyBrbm93biBpc3N1ZSB3aGVu
IHRwbTItYWJybWQgaXMgdXNlZDxicj4KJmd0OyB3aXRoIGEgc3d0cG0uIElmIHNvLCBub3RoaW5n
IHRvIHNlZSBoZXJlLiBJZiBub3QsIGxldCBtZSBrbm93IGFuZCBJIGFtPGJyPgomZ3Q7IGhhcHB5
IHRvIHJhaXNlIGEgR0ggaXNzdWUuPGJyPgo8YnI+CkZlZWwgZnJlZSB0byBjb21tZW50IG9uIHRo
ZSBleGlzdGluZyBpc3N1ZS4gV2hhdCB3ZSBjYW4gZG8gaW4gY2FzZXMgbGlrZTxicj4KdGhpcyB3
L3IvdCByZWNvdmVyeSBhcmUgcHJldHR5IGxpbWl0ZWQgYnV0IG1heWJlIHdlIGNhbiBjb21lIHVw
IHdpdGg8YnI+CnNvbWV0aGluZyBiZXR0ZXIuPGJyPgo8YnI+ClBoaWxpcDxicj4KPC9ibG9ja3F1
b3RlPjwvZGl2PjxiciBjbGVhcj0iYWxsIj48ZGl2Pjxicj48L2Rpdj4tLSA8YnI+PGRpdiBkaXI9
Imx0ciIgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2IGRp
cj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMi44cHgiPkx1a2UgSGluZHPCoCB8IENUTyBPZmZpY2UgfCBSZWQgSGF0
PC9zcGFuPjxiciBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMi44cHgiPmU6wqA8L3NwYW4+PGEgaHJlZj0ibWFpbHRvOmxoaW5kc0ByZWRoYXQuY29tIiBz
dHlsZT0iY29sb3I6cmdiKDE3LDg1LDIwNCk7Zm9udC1zaXplOjEyLjhweCIgdGFyZ2V0PSJfYmxh
bmsiPmxoaW5kc0ByZWRoYXQuY29tPC9hPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij7C
oHwgaXJjOiBsaGluZHMgQGZyZWVub2RlIHw8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
Mi44cHgiPiB0OsKgPC9zcGFuPis0NCAxMiA1MiAzNiAyNDgzPGJyIHN0eWxlPSJmb250LXNpemU6
MTIuOHB4Ij48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48
L2Rpdj4K

--===============3612830772667181974==--

