Content-Type: multipart/mixed; boundary="===============3288718430065766032=="
MIME-Version: 1.0
From: ramyasnair ramyasnair <ramyasnair1996 at gmail.com>
Subject: Re: [tpm2] Loading keys
Date: Thu, 11 Jul 2019 09:56:44 +0530
Message-ID: <CA+M7zR21767NE2vxGJ6SMayMwNQy3c-Chs8P84AAU70yEW9ARQ@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DCC012@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3288718430065766032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks a lot!

On Thu 11 Jul, 2019, 12:46 AM Roberts, William C, <
william.c.roberts(a)intel.com> wrote:

>
>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of ramyasnair
> > ramyasnair
> > Sent: Wednesday, July 10, 2019 2:22 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] Loading keys
> >
> > Hi,
> > When I try to load keys,the files are getting stored as .pub and .priv.
> Why is the
> > private key getting stored in the disk?Even after I load the files also
> remains in
> > the disk. The TPM is supposed to store it in the chip itself as far as I
> understand it.
> > Thanks and regards
> > Ramya
>
> The TPM has two different types of memory, volatile and non-volatile. By
> default, when you
> create an object, it's in the non-volatile memory as a "transient object".
> That object goes
> away on generally two conditions:
> 1. Tpm reboot
> 2. evicted from the tpm via tpm2_evictcotrol.
>
> Those pub and priv files are sealed to your TPM. Internally, the TPM
> encrypts and integrity
> protects those blobs. So in theory, the worst thing an attacker can do if
> they get ahold of
> those blobs is DoS via delete (requires fs permissions). Key use attacks
> should be thwarted
> by strong policies and DA lockout Protections. You should still protect
> those files with good
> DAC and MAC controls.
>
> When you call tpm2_load with the .pub and .priv files, that command loads
> the object into
> Non-volatile memory and gives you back a context file to reference that
> object from. However,
> You can use tpm2_evictcontrol to persist the object at a non-volatile
> location and reference
> That object via a raw tpm handle (think of it like a pointer address in C)
> or an ESYS_TR blob file
> Which provides mechanisms against MITM attacks. It ensures that the object
> you want to get to
> Via an index into non-volatile memory is the object you expect it to be.
>
> After you have an object loaded and have its context file, which is only
> good for that boot of the TPM,
> You can persist it like so:
>
> tpm2_evictcontrol -a o -c key.ctx -o key.handle
>
> You can use the -p command to indicate a specific index to persist the
> object/key at, or you can just
> Not use -p and it will pick the first open slot. The tool outputs in YAML
> what happened and the
> Index it persisted it at.
>
> Bill
>
>
>

--===============3288718430065766032==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPlRoYW5rcyBhIGxvdCHCoDwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFp
bF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFRodSAxMSBKdWws
IDIwMTksIDEyOjQ2IEFNIFJvYmVydHMsIFdpbGxpYW0gQywgJmx0OzxhIGhyZWY9Im1haWx0bzp3
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwv
YT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5n
LWxlZnQ6MWV4Ij48YnI+Cjxicj4KJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4K
Jmd0OyBGcm9tOiB0cG0yIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItYm91bmNlc0BsaXN0
cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnRwbTItYm91bmNlc0Bs
aXN0cy4wMS5vcmc8L2E+XSBPbiBCZWhhbGYgT2YgcmFteWFzbmFpcjxicj4KJmd0OyByYW15YXNu
YWlyPGJyPgomZ3Q7IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAxMCwgMjAxOSAyOjIyIEFNPGJyPgom
Z3Q7IFRvOiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5r
IiByZWw9Im5vcmVmZXJyZXIiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyBTdWJqZWN0
OiBbdHBtMl0gTG9hZGluZyBrZXlzPGJyPgomZ3Q7IDxicj4KJmd0OyBIaSw8YnI+CiZndDsgV2hl
biBJIHRyeSB0byBsb2FkIGtleXMsdGhlIGZpbGVzIGFyZSBnZXR0aW5nIHN0b3JlZCBhcyAucHVi
IGFuZCAucHJpdi4gV2h5IGlzIHRoZTxicj4KJmd0OyBwcml2YXRlIGtleSBnZXR0aW5nIHN0b3Jl
ZCBpbiB0aGUgZGlzaz9FdmVuIGFmdGVyIEkgbG9hZCB0aGUgZmlsZXMgYWxzbyByZW1haW5zIGlu
PGJyPgomZ3Q7IHRoZSBkaXNrLiBUaGUgVFBNIGlzIHN1cHBvc2VkIHRvIHN0b3JlIGl0IGluIHRo
ZSBjaGlwIGl0c2VsZiBhcyBmYXIgYXMgSSB1bmRlcnN0YW5kIGl0Ljxicj4KJmd0OyBUaGFua3Mg
YW5kIHJlZ2FyZHM8YnI+CiZndDsgUmFteWE8YnI+Cjxicj4KVGhlIFRQTSBoYXMgdHdvIGRpZmZl
cmVudCB0eXBlcyBvZiBtZW1vcnksIHZvbGF0aWxlIGFuZCBub24tdm9sYXRpbGUuIEJ5IGRlZmF1
bHQsIHdoZW4geW91PGJyPgpjcmVhdGUgYW4gb2JqZWN0LCBpdCYjMzk7cyBpbiB0aGUgbm9uLXZv
bGF0aWxlIG1lbW9yeSBhcyBhICZxdW90O3RyYW5zaWVudCBvYmplY3QmcXVvdDsuIFRoYXQgb2Jq
ZWN0IGdvZXM8YnI+CmF3YXkgb24gZ2VuZXJhbGx5IHR3byBjb25kaXRpb25zOjxicj4KMS4gVHBt
IHJlYm9vdDxicj4KMi4gZXZpY3RlZCBmcm9tIHRoZSB0cG0gdmlhIHRwbTJfZXZpY3Rjb3Ryb2wu
PGJyPgo8YnI+ClRob3NlIHB1YiBhbmQgcHJpdiBmaWxlcyBhcmUgc2VhbGVkIHRvIHlvdXIgVFBN
LiBJbnRlcm5hbGx5LCB0aGUgVFBNIGVuY3J5cHRzIGFuZCBpbnRlZ3JpdHk8YnI+CnByb3RlY3Rz
IHRob3NlIGJsb2JzLiBTbyBpbiB0aGVvcnksIHRoZSB3b3JzdCB0aGluZyBhbiBhdHRhY2tlciBj
YW4gZG8gaWYgdGhleSBnZXQgYWhvbGQgb2Y8YnI+CnRob3NlIGJsb2JzIGlzIERvUyB2aWEgZGVs
ZXRlIChyZXF1aXJlcyBmcyBwZXJtaXNzaW9ucykuIEtleSB1c2UgYXR0YWNrcyBzaG91bGQgYmUg
dGh3YXJ0ZWQ8YnI+CmJ5IHN0cm9uZyBwb2xpY2llcyBhbmQgREEgbG9ja291dCBQcm90ZWN0aW9u
cy4gWW91IHNob3VsZCBzdGlsbCBwcm90ZWN0IHRob3NlIGZpbGVzIHdpdGggZ29vZDxicj4KREFD
IGFuZCBNQUMgY29udHJvbHMuPGJyPgo8YnI+CldoZW4geW91IGNhbGwgdHBtMl9sb2FkIHdpdGgg
dGhlIC5wdWIgYW5kIC5wcml2IGZpbGVzLCB0aGF0IGNvbW1hbmQgbG9hZHMgdGhlIG9iamVjdCBp
bnRvPGJyPgpOb24tdm9sYXRpbGUgbWVtb3J5IGFuZCBnaXZlcyB5b3UgYmFjayBhIGNvbnRleHQg
ZmlsZSB0byByZWZlcmVuY2UgdGhhdCBvYmplY3QgZnJvbS4gSG93ZXZlciw8YnI+CllvdSBjYW4g
dXNlIHRwbTJfZXZpY3Rjb250cm9sIHRvIHBlcnNpc3QgdGhlIG9iamVjdCBhdCBhIG5vbi12b2xh
dGlsZSBsb2NhdGlvbiBhbmQgcmVmZXJlbmNlPGJyPgpUaGF0IG9iamVjdCB2aWEgYSByYXcgdHBt
IGhhbmRsZSAodGhpbmsgb2YgaXQgbGlrZSBhIHBvaW50ZXIgYWRkcmVzcyBpbiBDKSBvciBhbiBF
U1lTX1RSIGJsb2IgZmlsZTxicj4KV2hpY2ggcHJvdmlkZXMgbWVjaGFuaXNtcyBhZ2FpbnN0IE1J
VE0gYXR0YWNrcy4gSXQgZW5zdXJlcyB0aGF0IHRoZSBvYmplY3QgeW91IHdhbnQgdG8gZ2V0IHRv
PGJyPgpWaWEgYW4gaW5kZXggaW50byBub24tdm9sYXRpbGUgbWVtb3J5IGlzIHRoZSBvYmplY3Qg
eW91IGV4cGVjdCBpdCB0byBiZS48YnI+Cjxicj4KQWZ0ZXIgeW91IGhhdmUgYW4gb2JqZWN0IGxv
YWRlZCBhbmQgaGF2ZSBpdHMgY29udGV4dCBmaWxlLCB3aGljaCBpcyBvbmx5IGdvb2QgZm9yIHRo
YXQgYm9vdCBvZiB0aGUgVFBNLDxicj4KWW91IGNhbiBwZXJzaXN0IGl0IGxpa2Ugc286PGJyPgo8
YnI+CnRwbTJfZXZpY3Rjb250cm9sIC1hIG8gLWMga2V5LmN0eCAtbyBrZXkuaGFuZGxlPGJyPgo8
YnI+CllvdSBjYW4gdXNlIHRoZSAtcCBjb21tYW5kIHRvIGluZGljYXRlIGEgc3BlY2lmaWMgaW5k
ZXggdG8gcGVyc2lzdCB0aGUgb2JqZWN0L2tleSBhdCwgb3IgeW91IGNhbiBqdXN0PGJyPgpOb3Qg
dXNlIC1wIGFuZCBpdCB3aWxsIHBpY2sgdGhlIGZpcnN0IG9wZW4gc2xvdC4gVGhlIHRvb2wgb3V0
cHV0cyBpbiBZQU1MIHdoYXQgaGFwcGVuZWQgYW5kIHRoZTxicj4KSW5kZXggaXQgcGVyc2lzdGVk
IGl0IGF0Ljxicj4KPGJyPgpCaWxsPGJyPgo8YnI+Cjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============3288718430065766032==--

