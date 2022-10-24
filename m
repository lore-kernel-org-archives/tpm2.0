Content-Type: multipart/mixed; boundary="===============5340089522609392893=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How can I prevent MITM attacks for unsealing?
Date: Mon, 24 Oct 2022 17:32:16 +0000
Message-ID: <SN6PR11MB343793B30F914D1C4D11D625B82E9@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 1666412618.635839966@f7.my.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5340089522609392893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The TPM2_Cerify command can certify that another key is the TPM based on a =
key you trust, like the EK.

Bill
________________________________
From: joseph(a)zeronsoftn.com <joseph(a)zeronsoftn.com>
Sent: Friday, October 21, 2022 11:23 PM
To: Roberts, William C <william.c.roberts(a)intel.com>
Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: Re[5]: [tpm2] How can I prevent MITM attacks for unsealing?


Serialized primary.handle has a Public Key.
Is there a way to verify whether this public key is a key created by the TP=
M through the TPM's EK?

If this is possible, it will not be possible to protect against MITM in gen=
eral, but if you have the CA of specific TPM manufacturers safely or remote=
ly verify it, can be defend against MITM.

=ED=86=A0=EC=9A=94=EC=9D=BC, 22 10=EC=9B=94 2022, 02:43=EC=98=A4=EC=A0=84 +=
09:00 =EB=B0=9C=EC=8B=A0 "Roberts, William C" william.c.roberts(a)intel.com=
<mailto:william.c.roberts(a)intel.com>:

On Mon, 2022-10-10 at 18:07 +0300, joseph(a)zeronsoftn.com<mailto:joseph(a)=
zeronsoftn.com> wrote:
>
> Here is the commands I tried:
> https://gist.github.com/jclab-joseph/d1d6d9bbbd32c0fe200cc7725bcf0d86
> A session was established via a serialized persistent handle.
> This seems to be able to prevent MITM in the session connection
> process.
>
> But, assume that an attacker can modify the filesystem.
> If the primary.handle can be replaced with the attacker's key, the
> session will be successfully established.
> And I suspect that plaintext can be exposed if unsealed through the
> session.
>
> Wouldn't validation be needed between the connected session and
> seal.ctx?
If the attacker can modify the primary.handle, which is verifying the
encrypted session, then yes you need something else. You could add a
bind key with a password and have the user enter the password and thus
nothing for the attacker to attack that is stored on disk.

>
> =ED=99=94=EC=9A=94=EC=9D=BC, 04 10=EC=9B=94 2022, 00:54=EC=98=A4=EC=A0=84=
 +09:00 =EB=B0=9C=EC=8B=A0 "Roberts, William C"
> william.c.roberts(a)intel.com:
>
> > On Mon, 2022-10-03 at 18:01 +0300, joseph(a)zeronsoftn.com<mailto:josep=
h(a)zeronsoftn.com> wrote:
> > > Hello,
> > >
> > > Does anyone know about this issue?
> > >
> > >
> > https://github.com/jc-lab/securekit/blob/466abe16bfe4f28ef86db6bc726492=
14ab2e4b51/pkg/securekit-disk/opt/securekit/sbin/disk-init#L82-L86
> > >
> > > Here's one example of sealing and unsealing.
> > > This method seems (probably?) to prevent the sniffing attack,
> > which
> > > was a vulnerability of Bitlocker in the past.
> > >
> > > But isn't a MITM attack possible in the process of creating an
> > > encrypted session?
> > So just to unpack the commands here for discussion I copied that
> > code
> > block:
> >
> > tpm2_createprimary -Q -C o -c tpm-primary.ctx
> > tpm2_load -Q -C tpm-primary.ctx -u ${p1_dir}/seal.pub -r
> > ${p1_dir}/seal.priv -c tpm-seal.ctx
> > tpm2_startauthsession -Q --hmac-session -c tpm-primary.ctx -S
> > session.ctx
> > tpm2_unseal -Q -p pcr:${tpm_seal_pcr_policy} -c tpm-seal.ctx -o
> > ${output}
> > cleanupSession
> >
> > The issue here is that the key created by the tpm2_createprimary
> > command doesn't have provenance, so it's just be trusted implicitly
> > even through it could be attacker controlled. If the attacker was
> > controlling the primary object, they could just forward the
> > commands
> > unencrypted to the TPM and get the unseal to release them the key
> > in
> > the clear.
> >
> > >
> > > I am not familiar with the process of establishing a session,
> > > However, it seems that MITM can be prevented only by using a
> > session
> > > key encrypted with the EK of the TPM, or by signing the
> > asymmetric
> > > key with the EK to derive the key, when creating a session.
> >
> > You just need a way to ensure provenance. Another way is to load an
> > established key to the TPM and start the authsession with that. If
> > you're using a persistent key you need to verify the name after
> > establishing the session or use something like a serialized ESYS_TR
> > which will do the name checking automatically. If you load a key
> > blob
> > to the TPM that you control, ESAPI will have the checks in place to
> > make sure you don't get duped.
> >
> > >
> > > Is MITM not considered in TPM? Or is there another way?
> >
> > It is considered in the TPM and is discussed in the architecture
> > document. Theirs a few ways you can securely set up an encrypted
> > session, either with EK and associated Certificate or through other
> > keys like the SRK. The big thing is, you have to do it in a way
> > where
> > the attacker can not MiTM the session establishment, which boils
> > down
> > to using a known key.
> >
> > >
> > > Regards,
> > >
> > >
> > >
> > >
> > >
> > > _______________________________________________
> > > tpm2 mailing list -- tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
> > > To unsubscribe send an email to tpm2-leave(a)lists.01.org<mailto:tpm2=
-leave(a)lists.01.org>
> > > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>
>



[https://mail.zeronsoftn.com/mthumbnail/7b26b6d8-279b-4527-bfcd-9c3fb591e46=
c.png]

--===============5340089522609392893==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1rc19jXzU2MDEtMTk4NyI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIg
c3R5bGU9ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30g
PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7
IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1
KTsiIGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+ClRoZSBUUE0yX0NlcmlmeSBjb21tYW5kIGNhbiBj
ZXJ0aWZ5IHRoYXQgYW5vdGhlciBrZXkgaXMgdGhlIFRQTSBiYXNlZCBvbiBhIGtleSB5b3UgdHJ1
c3QsIGxpa2UgdGhlIEVLLjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwg
QXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdi
KDAsIDAsIDApOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IiBjbGFzcz0i
ZWxlbWVudFRvUHJvb2YiPgo8YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2Fs
aWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xv
cjogcmdiKDAsIDAsIDApOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IiBj
bGFzcz0iZWxlbWVudFRvUHJvb2YiPgpCaWxsPC9kaXY+CjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+
PC9kaXY+CjxociBzdHlsZT0iZGlzcGxheTppbmxpbmUtYmxvY2s7d2lkdGg6OTglIiB0YWJpbmRl
eD0iLTEiPgo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0iQ2Fs
aWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAwMDAwMCI+
PGI+RnJvbTo8L2I+IGpvc2VwaEB6ZXJvbnNvZnRuLmNvbSAmbHQ7am9zZXBoQHplcm9uc29mdG4u
Y29tJmd0Ozxicj4KPGI+U2VudDo8L2I+IEZyaWRheSwgT2N0b2JlciAyMSwgMjAyMiAxMToyMyBQ
TTxicj4KPGI+VG86PC9iPiBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0O3dpbGxpYW0uYy5yb2JlcnRz
QGludGVsLmNvbSZndDs8YnI+CjxiPkNjOjwvYj4gdHBtMkBsaXN0cy4wMS5vcmcgJmx0O3RwbTJA
bGlzdHMuMDEub3JnJmd0Ozxicj4KPGI+U3ViamVjdDo8L2I+IFJlWzVdOiBbdHBtMl0gSG93IGNh
biBJIHByZXZlbnQgTUlUTSBhdHRhY2tzIGZvciB1bnNlYWxpbmc/PC9mb250Pgo8ZGl2PiZuYnNw
OzwvZGl2Pgo8L2Rpdj4KPGRpdj4KPHAgZGlyPSJsdHIiIHN0eWxlPSJtYXJnaW4tdG9wOjBweCI+
U2VyaWFsaXplZCBwcmltYXJ5LmhhbmRsZSBoYXMgYSBQdWJsaWMgS2V5Ljxicj4KSXMgdGhlcmUg
YSB3YXkgdG8gdmVyaWZ5IHdoZXRoZXIgdGhpcyBwdWJsaWMga2V5IGlzIGEga2V5IGNyZWF0ZWQg
YnkgdGhlIFRQTSB0aHJvdWdoIHRoZSBUUE0ncyBFSz88L3A+CjxwIGRpcj0ibHRyIj5JZiB0aGlz
IGlzIHBvc3NpYmxlLCBpdCB3aWxsIG5vdCBiZSBwb3NzaWJsZSB0byBwcm90ZWN0IGFnYWluc3Qg
TUlUTSBpbiBnZW5lcmFsLCBidXQgaWYgeW91IGhhdmUgdGhlIENBIG9mIHNwZWNpZmljIFRQTSBt
YW51ZmFjdHVyZXJzIHNhZmVseSBvciByZW1vdGVseSB2ZXJpZnkgaXQsIGNhbiBiZSBkZWZlbmQg
YWdhaW5zdCBNSVRNLjwvcD4KxeS/5MDPLCAyMiAxML/5IDIwMjIsIDAyOjQzv8DA/CArMDk6MDAg
ud+9xSAmcXVvdDtSb2JlcnRzLCBXaWxsaWFtIEMmcXVvdDsgPGEgaHJlZj0ibWFpbHRvOndpbGxp
YW0uYy5yb2JlcnRzQGludGVsLmNvbSI+CndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT46
PGJyPgo8YnI+CjxibG9ja3F1b3RlIGlkPSJ4X21haWwtYXBwLWF1dG8tcXVvdGUiIHN0eWxlPSJi
b3JkZXItbGVmdDoxcHggc29saWQgI0ZDMkMzODsgbWFyZ2luOjBweCAwcHggMHB4IDEwcHg7IHBh
ZGRpbmc6MHB4IDBweCAwcHggMTBweCI+CjxkaXYgY2xhc3M9InhfanMtaGVscGVyIHhfanMtcmVh
ZG1zZy1tc2ciPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+CjwhLS0KLS0+Cjwvc3R5bGU+CjxkaXY+
PGJhc2UgaHJlZj0iaHR0cHM6Ly9lLWFqLm15LmNvbS8iPgo8ZGl2IGlkPSJ4X3N0eWxlXzE2NjYz
NzQxODMwMDAwMDExMDI5X0JPRFkiPk9uIE1vbiwgMjAyMi0xMC0xMCBhdCAxODowNyArMDMwMCwg
PGEgaHJlZj0ibWFpbHRvOmpvc2VwaEB6ZXJvbnNvZnRuLmNvbSI+Cmpvc2VwaEB6ZXJvbnNvZnRu
LmNvbTwvYT4gd3JvdGU6PGJyPgomZ3Q7IDxicj4KJmd0OyBIZXJlIGlzIHRoZSBjb21tYW5kcyBJ
IHRyaWVkOjxicj4KJmd0OyA8YSBocmVmPSJodHRwczovL2dpc3QuZ2l0aHViLmNvbS9qY2xhYi1q
b3NlcGgvZDFkNmQ5YmJiZDMyYzBmZTIwMGNjNzcyNWJjZjBkODYiIHRhcmdldD0iX2JsYW5rIj4K
aHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vamNsYWItam9zZXBoL2QxZDZkOWJiYmQzMmMwZmUyMDBj
Yzc3MjViY2YwZDg2PC9hPjxicj4KJmd0OyBBIHNlc3Npb24gd2FzIGVzdGFibGlzaGVkIHZpYSBh
IHNlcmlhbGl6ZWQgcGVyc2lzdGVudCBoYW5kbGUuPGJyPgomZ3Q7IFRoaXMgc2VlbXMgdG8gYmUg
YWJsZSB0byBwcmV2ZW50IE1JVE0gaW4gdGhlIHNlc3Npb24gY29ubmVjdGlvbjxicj4KJmd0OyBw
cm9jZXNzLjxicj4KJmd0OyA8YnI+CiZndDsgQnV0LCBhc3N1bWUgdGhhdCBhbiBhdHRhY2tlciBj
YW4gbW9kaWZ5IHRoZSBmaWxlc3lzdGVtLjxicj4KJmd0OyBJZiB0aGUgcHJpbWFyeS5oYW5kbGUg
Y2FuIGJlIHJlcGxhY2VkIHdpdGggdGhlIGF0dGFja2VyJ3Mga2V5LCB0aGU8YnI+CiZndDsgc2Vz
c2lvbiB3aWxsIGJlIHN1Y2Nlc3NmdWxseSBlc3RhYmxpc2hlZC48YnI+CiZndDsgQW5kIEkgc3Vz
cGVjdCB0aGF0IHBsYWludGV4dCBjYW4gYmUgZXhwb3NlZCBpZiB1bnNlYWxlZCB0aHJvdWdoIHRo
ZTxicj4KJmd0OyBzZXNzaW9uLjxicj4KJmd0OyA8YnI+CiZndDsgV291bGRuJ3QgdmFsaWRhdGlv
biBiZSBuZWVkZWQgYmV0d2VlbiB0aGUgY29ubmVjdGVkIHNlc3Npb24gYW5kPGJyPgomZ3Q7IHNl
YWwuY3R4Pzxicj4KSWYgdGhlIGF0dGFja2VyIGNhbiBtb2RpZnkgdGhlIHByaW1hcnkuaGFuZGxl
LCB3aGljaCBpcyB2ZXJpZnlpbmcgdGhlPGJyPgplbmNyeXB0ZWQgc2Vzc2lvbiwgdGhlbiB5ZXMg
eW91IG5lZWQgc29tZXRoaW5nIGVsc2UuIFlvdSBjb3VsZCBhZGQgYTxicj4KYmluZCBrZXkgd2l0
aCBhIHBhc3N3b3JkIGFuZCBoYXZlIHRoZSB1c2VyIGVudGVyIHRoZSBwYXNzd29yZCBhbmQgdGh1
czxicj4Kbm90aGluZyBmb3IgdGhlIGF0dGFja2VyIHRvIGF0dGFjayB0aGF0IGlzIHN0b3JlZCBv
biBkaXNrLjxicj4KPGJyPgomZ3Q7IDxicj4KJmd0OyDIrb/kwM8sIDA0IDEwv/kgMjAyMiwgMDA6
NTS/wMD8ICswOTowMCC5373FICZxdW90O1JvYmVydHMsIFdpbGxpYW0gQyZxdW90OyA8YnI+CiZn
dDsgd2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tOjxicj4KJmd0OyA8YnI+CiZndDsgJmd0OyBP
biBNb24sIDIwMjItMTAtMDMgYXQgMTg6MDEgKzAzMDAsIDxhIGhyZWY9Im1haWx0bzpqb3NlcGhA
emVyb25zb2Z0bi5jb20iPmpvc2VwaEB6ZXJvbnNvZnRuLmNvbTwvYT4gd3JvdGU6PGJyPgomZ3Q7
ICZndDsgJmd0OyBIZWxsbyw8YnI+CiZndDsgJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsg
RG9lcyBhbnlvbmUga25vdyBhYm91dCB0aGlzIGlzc3VlPzxicj4KJmd0OyAmZ3Q7ICZndDsgPGJy
PgomZ3Q7ICZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5j
b20vamMtbGFiL3NlY3VyZWtpdC9ibG9iLzQ2NmFiZTE2YmZlNGYyOGVmODZkYjZiYzcyNjQ5MjE0
YWIyZTRiNTEvcGtnL3NlY3VyZWtpdC1kaXNrL29wdC9zZWN1cmVraXQvc2Jpbi9kaXNrLWluaXQj
TDgyLUw4NiIgdGFyZ2V0PSJfYmxhbmsiPgpodHRwczovL2dpdGh1Yi5jb20vamMtbGFiL3NlY3Vy
ZWtpdC9ibG9iLzQ2NmFiZTE2YmZlNGYyOGVmODZkYjZiYzcyNjQ5MjE0YWIyZTRiNTEvcGtnL3Nl
Y3VyZWtpdC1kaXNrL29wdC9zZWN1cmVraXQvc2Jpbi9kaXNrLWluaXQjTDgyLUw4NjwvYT48YnI+
CiZndDsgJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsgSGVyZSdzIG9uZSBleGFtcGxlIG9m
IHNlYWxpbmcgYW5kIHVuc2VhbGluZy48YnI+CiZndDsgJmd0OyAmZ3Q7IFRoaXMgbWV0aG9kIHNl
ZW1zIChwcm9iYWJseT8pIHRvIHByZXZlbnQgdGhlIHNuaWZmaW5nIGF0dGFjayw8YnI+CiZndDsg
Jmd0OyB3aGljaDxicj4KJmd0OyAmZ3Q7ICZndDsgd2FzIGEgdnVsbmVyYWJpbGl0eSBvZiBCaXRs
b2NrZXIgaW4gdGhlIHBhc3QuPGJyPgomZ3Q7ICZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7
IEJ1dCBpc24ndCBhIE1JVE0gYXR0YWNrIHBvc3NpYmxlIGluIHRoZSBwcm9jZXNzIG9mIGNyZWF0
aW5nIGFuPGJyPgomZ3Q7ICZndDsgJmd0OyBlbmNyeXB0ZWQgc2Vzc2lvbj88YnI+CiZndDsgJmd0
OyBTbyBqdXN0IHRvIHVucGFjayB0aGUgY29tbWFuZHMgaGVyZSBmb3IgZGlzY3Vzc2lvbiBJIGNv
cGllZCB0aGF0PGJyPgomZ3Q7ICZndDsgY29kZTxicj4KJmd0OyAmZ3Q7IGJsb2NrOjxicj4KJmd0
OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7IHRwbTJfY3JlYXRlcHJpbWFyeSAtUSAtQyBvIC1jIHRwbS1w
cmltYXJ5LmN0eDxicj4KJmd0OyAmZ3Q7IHRwbTJfbG9hZCAtUSAtQyB0cG0tcHJpbWFyeS5jdHgg
LXUgJHtwMV9kaXJ9L3NlYWwucHViIC1yPGJyPgomZ3Q7ICZndDsgJHtwMV9kaXJ9L3NlYWwucHJp
diAtYyB0cG0tc2VhbC5jdHg8YnI+CiZndDsgJmd0OyB0cG0yX3N0YXJ0YXV0aHNlc3Npb24gLVEg
LS1obWFjLXNlc3Npb24gLWMgdHBtLXByaW1hcnkuY3R4IC1TPGJyPgomZ3Q7ICZndDsgc2Vzc2lv
bi5jdHg8YnI+CiZndDsgJmd0OyB0cG0yX3Vuc2VhbCAtUSAtcCBwY3I6JHt0cG1fc2VhbF9wY3Jf
cG9saWN5fSAtYyB0cG0tc2VhbC5jdHggLW88YnI+CiZndDsgJmd0OyAke291dHB1dH08YnI+CiZn
dDsgJmd0OyBjbGVhbnVwU2Vzc2lvbjxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7IFRoZSBp
c3N1ZSBoZXJlIGlzIHRoYXQgdGhlIGtleSBjcmVhdGVkIGJ5IHRoZSB0cG0yX2NyZWF0ZXByaW1h
cnk8YnI+CiZndDsgJmd0OyBjb21tYW5kIGRvZXNuJ3QgaGF2ZSBwcm92ZW5hbmNlLCBzbyBpdCdz
IGp1c3QgYmUgdHJ1c3RlZCBpbXBsaWNpdGx5PGJyPgomZ3Q7ICZndDsgZXZlbiB0aHJvdWdoIGl0
IGNvdWxkIGJlIGF0dGFja2VyIGNvbnRyb2xsZWQuIElmIHRoZSBhdHRhY2tlciB3YXM8YnI+CiZn
dDsgJmd0OyBjb250cm9sbGluZyB0aGUgcHJpbWFyeSBvYmplY3QsIHRoZXkgY291bGQganVzdCBm
b3J3YXJkIHRoZTxicj4KJmd0OyAmZ3Q7IGNvbW1hbmRzPGJyPgomZ3Q7ICZndDsgdW5lbmNyeXB0
ZWQgdG8gdGhlIFRQTSBhbmQgZ2V0IHRoZSB1bnNlYWwgdG8gcmVsZWFzZSB0aGVtIHRoZSBrZXk8
YnI+CiZndDsgJmd0OyBpbjxicj4KJmd0OyAmZ3Q7IHRoZSBjbGVhci48YnI+CiZndDsgJmd0OyA8
YnI+CiZndDsgJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsgSSBhbSBub3QgZmFtaWxpYXIg
d2l0aCB0aGUgcHJvY2VzcyBvZiBlc3RhYmxpc2hpbmcgYSBzZXNzaW9uLDxicj4KJmd0OyAmZ3Q7
ICZndDsgSG93ZXZlciwgaXQgc2VlbXMgdGhhdCBNSVRNIGNhbiBiZSBwcmV2ZW50ZWQgb25seSBi
eSB1c2luZyBhPGJyPgomZ3Q7ICZndDsgc2Vzc2lvbjxicj4KJmd0OyAmZ3Q7ICZndDsga2V5IGVu
Y3J5cHRlZCB3aXRoIHRoZSBFSyBvZiB0aGUgVFBNLCBvciBieSBzaWduaW5nIHRoZTxicj4KJmd0
OyAmZ3Q7IGFzeW1tZXRyaWM8YnI+CiZndDsgJmd0OyAmZ3Q7IGtleSB3aXRoIHRoZSBFSyB0byBk
ZXJpdmUgdGhlIGtleSwgd2hlbiBjcmVhdGluZyBhIHNlc3Npb24uPGJyPgomZ3Q7ICZndDsgPGJy
PgomZ3Q7ICZndDsgWW91IGp1c3QgbmVlZCBhIHdheSB0byBlbnN1cmUgcHJvdmVuYW5jZS4gQW5v
dGhlciB3YXkgaXMgdG8gbG9hZCBhbjxicj4KJmd0OyAmZ3Q7IGVzdGFibGlzaGVkIGtleSB0byB0
aGUgVFBNIGFuZCBzdGFydCB0aGUgYXV0aHNlc3Npb24gd2l0aCB0aGF0LiBJZjxicj4KJmd0OyAm
Z3Q7IHlvdSdyZSB1c2luZyBhIHBlcnNpc3RlbnQga2V5IHlvdSBuZWVkIHRvIHZlcmlmeSB0aGUg
bmFtZSBhZnRlcjxicj4KJmd0OyAmZ3Q7IGVzdGFibGlzaGluZyB0aGUgc2Vzc2lvbiBvciB1c2Ug
c29tZXRoaW5nIGxpa2UgYSBzZXJpYWxpemVkIEVTWVNfVFI8YnI+CiZndDsgJmd0OyB3aGljaCB3
aWxsIGRvIHRoZSBuYW1lIGNoZWNraW5nIGF1dG9tYXRpY2FsbHkuIElmIHlvdSBsb2FkIGEga2V5
PGJyPgomZ3Q7ICZndDsgYmxvYjxicj4KJmd0OyAmZ3Q7IHRvIHRoZSBUUE0gdGhhdCB5b3UgY29u
dHJvbCwgRVNBUEkgd2lsbCBoYXZlIHRoZSBjaGVja3MgaW4gcGxhY2UgdG88YnI+CiZndDsgJmd0
OyBtYWtlIHN1cmUgeW91IGRvbid0IGdldCBkdXBlZC48YnI+CiZndDsgJmd0OyA8YnI+CiZndDsg
Jmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsgSXMgTUlUTSBub3QgY29uc2lkZXJlZCBpbiBU
UE0/IE9yIGlzIHRoZXJlIGFub3RoZXIgd2F5Pzxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7
IEl0IGlzIGNvbnNpZGVyZWQgaW4gdGhlIFRQTSBhbmQgaXMgZGlzY3Vzc2VkIGluIHRoZSBhcmNo
aXRlY3R1cmU8YnI+CiZndDsgJmd0OyBkb2N1bWVudC4gVGhlaXJzIGEgZmV3IHdheXMgeW91IGNh
biBzZWN1cmVseSBzZXQgdXAgYW4gZW5jcnlwdGVkPGJyPgomZ3Q7ICZndDsgc2Vzc2lvbiwgZWl0
aGVyIHdpdGggRUsgYW5kIGFzc29jaWF0ZWQgQ2VydGlmaWNhdGUgb3IgdGhyb3VnaCBvdGhlcjxi
cj4KJmd0OyAmZ3Q7IGtleXMgbGlrZSB0aGUgU1JLLiBUaGUgYmlnIHRoaW5nIGlzLCB5b3UgaGF2
ZSB0byBkbyBpdCBpbiBhIHdheTxicj4KJmd0OyAmZ3Q7IHdoZXJlPGJyPgomZ3Q7ICZndDsgdGhl
IGF0dGFja2VyIGNhbiBub3QgTWlUTSB0aGUgc2Vzc2lvbiBlc3RhYmxpc2htZW50LCB3aGljaCBi
b2lsczxicj4KJmd0OyAmZ3Q7IGRvd248YnI+CiZndDsgJmd0OyB0byB1c2luZyBhIGtub3duIGtl
eS48YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsg
UmVnYXJkcyw8YnI+CiZndDsgJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsgPGJyPgomZ3Q7
ICZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsgPGJyPgom
Z3Q7ICZndDsgJmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXzxicj4KJmd0OyAmZ3Q7ICZndDsgdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFp
bHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgJmd0
OyAmZ3Q7IFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOnRw
bTItbGVhdmVAbGlzdHMuMDEub3JnIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZn
dDsgJmd0OyAmZ3Q7ICUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJu
YWxfbmFtZSlzPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgo8L2Rpdj4KPGJhc2Ug
aHJlZj0iaHR0cHM6Ly9lLWFqLm15LmNvbS8iPjwvZGl2Pgo8L2Rpdj4KPC9ibG9ja3F1b3RlPgo8
ZGl2Pjxicj4KPGJyPgo8YnI+CjxpbWcgc3R5bGU9Im1heC1oZWlnaHQ6MzJweCIgc3JjPSJodHRw
czovL21haWwuemVyb25zb2Z0bi5jb20vbXRodW1ibmFpbC83YjI2YjZkOC0yNzliLTQ1MjctYmZj
ZC05YzNmYjU5MWU0NmMucG5nIj48L2Rpdj4KPC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============5340089522609392893==--

