Content-Type: multipart/mixed; boundary="===============3702379228392965274=="
MIME-Version: 1.0
From: Ian Oliver <ian.justin.oliver at gmail.com>
Subject: [tpm2] Re: unique identifier
Date: Wed, 30 Oct 2019 17:35:25 +0200
Message-ID: <CAAxBZJtDoXSPAKbew3BUma610S3jWFRZiQ1dLxt0Sjmp_DigEw@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E2DF10@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3702379228392965274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Here's the result from the Infineon 9670 TPM2.0 Evaluation boards for
Raspberry Pi:  I assume this is what you mean from the above?

:~ $ tpm2_getcap commands | grep Change
TPM2_CC_HierarchyChangeAuth:
TPM2_CC_NV_ChangeAuth:
TPM2_CC_ObjectChangeAuth:

Actually, I remember we have seen the EK change in one of our  Intel NUCs -
though I can be fairly sure that we haven't ever sent the ChangeEPS command
to it...these IIRC are 9670 TPM2.0 devices too. Will check.

t.

Ian


On Wed, 30 Oct 2019 at 15:22, Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> The TSS supports it. If you look at the return code:
>
> ERROR: Esys_ChangeEPS(0xB0143) - rmt:error(2.0): command code not
> supported
>
> The "rmt" portion is the layer that the return code was sent from.
> Looks like the resource manager detected that the command isn't
> supported and issued an error.  I know for tpm2-abrmd it works with
> the simulator, so perhaps abrmd has this logic in it.
>
> Which resource manager are you using?
>
> So if you get a TPM that rejects this command, you can look in tpm2_getcap
> commands
> For a list of supported commands, then you know that in fact your epSeed
> is fixed and
> Non-changeable and that EC is a unique identifier. If the command exists,
> well... then it
> Is likely to be unique but not guaranteed.
>
> Somewhere in the spec is the list of commands indicating which are
> optional and which are required,
> I would guess almost no manufacturers are implementing this interface. But
> I have no empirical
> evidence to assert that claim, just a hunch.
>
> This is what can make the TPM such a pain at times, is this optional
> stuff, there are vast differences
> in resources and capabilities.
>
> Bill
>
>
> > -----Original Message-----
> > From: Max Halld=C3=A9n [mailto:max.hallden(a)wisi.se]
> > Sent: Wednesday, October 30, 2019 3:21 AM
> > To: Roberts, William C <william.c.roberts(a)intel.com>; Ian Oliver
> > <ian.justin.oliver(a)gmail.com>
> > Cc: tpm2(a)lists.01.org
> > Subject: Re: [tpm2] Re: unique identifier
> >
> > Thank you for your answers!
> >
> > It sounds like I might be looking elsewhere for some kind of platform
> identifier.
> > Although I'm sure EK or similar would work since we won't change any
> seeds, it is
> > nice to be able to say that it can't ever change or be removed.
> >
> > The idea that TPM manufacturers might block the changeEPS command is
> > interesting though and when I tested this for my Infineon TPM I got thi=
s:
> >
> > root@(none):~# tpm2_changeeps --tcti=3Ddevice:/dev/tpmrm0
> > WARNING:esys:../tpm2-tss-2.3.1/src/tss2-
> > esys/api/Esys_ChangeEPS.c:283:Esys_ChangeEPS_Finish()
> > Received TPM Error
> > ERROR:esys:../tpm2-tss-2.3.1/src/tss2-
> > esys/api/Esys_ChangeEPS.c:98:Esys_ChangeEPS()
> > Esys Finish ErrorCode (0x000b0143)
> > ERROR: Esys_ChangeEPS(0xB0143) - rmt:error(2.0): command code not
> > supported
> >
> > Granted, I did a quick update from tpm2-tools 4.0 to master to get
> support for
> > that specific command, so it might be tss or something that doesn't
> support it.
> > But that looks like the TPM is not supporting it to me.
> >
> > Regards
> > Max
> >
> > On 2019-10-29 22:46, Roberts, William C wrote:
> > > Section 14.3.2 of the architecture doc is relevant:
> > > https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-
> > > 1-Architecture-01.38.pdf
> > >
> > > While it's safe to say that most of the time the manufacturers key
> > > could be the identifier, it's not guaranteed to always be there if
> > > someone rolls the epSeed. If someone does that, they'd be throwing
> away the
> > manufacturers claims of its authenticity and ensuring they remain
> anonymous.
> > >
> > > So be careful with that command! I wonder if TPM manufacturers are
> allowed
> > to, or do block that command.
> > >
> > >> -----Original Message-----
> > >> From: Ian Oliver [mailto:ian.justin.oliver(a)gmail.com]
> > >> Sent: Tuesday, October 29, 2019 2:50 PM
> > >> To: Roberts, William C <william.c.roberts(a)intel.com>
> > >> Cc: tpm2(a)lists.01.org
> > >> Subject: Re: [tpm2] Re: unique identifier
> > >>
> > >> Thanks - will take a look with the particular TPMs we're using
> > >>
> > >> t.
> > >>
> > >> Ian
> > >>
> > >>
> > >> On Tue, 29 Oct 2019 at 20:37, Roberts, William C
> > >> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com=
> >
> wrote:
> > >>
> > >>
> > >>    Forgot "to be changed" in my sentence... one of those days.
> > >>
> > >>    > -----Original Message-----
> > >>    > From: Roberts, William C [mailto:william.c.roberts(a)intel.com
> > >> <mailto:william.c.roberts(a)intel.com> ]
> > >>    > Sent: Tuesday, October 29, 2019 1:36 PM
> > >>    > To: Ian Oliver <ian.justin.oliver(a)gmail.com
> > >> <mailto:ian.justin.oliver(a)gmail.com> >
> > >>    > Cc: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > >>    > Subject: [tpm2] Re: unique identifier
> > >>    >
> > >>    The TPM allows the seed to be changed on the 3 non-volatile
> > >> hierarchy
> > >> seeds:
> > >>    >
> > >>    > TPM2_ChangeEPS - endorsement seed
> > >>    > TPM2_ChangePPS - platform seed
> > >>    > TPM2_Clear - Storage "Owner" seed
> > >>    >
> > >>    > Null changes on every tpm boot.
> > >>    >
> > >>    > > -----Original Message-----
> > >>    > > From: Ian Oliver [mailto:ian.justin.oliver(a)gmail.com
> > >> <mailto:ian.justin.oliver(a)gmail.com> ]
> > >>    > > Sent: Tuesday, October 29, 2019 11:59 AM
> > >>    > > To: Roberts, William C <william.c.roberts(a)intel.com
> > >> <mailto:william.c.roberts(a)intel.com> >
> > >>    > > Cc: Max Halld=C3=A9n <max.hallden(a)wisi.se
> > >> <mailto:max.hallden(a)wisi.se> >; tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>
> > >>    > > Subject: Re: [tpm2] Re: unique identifier
> > >>    > >
> > >>    > > IIRC the EK is generated from a seed unique to each TPM and
> typically
> > >>    > > implemented as a set of fuses blown at manufacturing time. So
> the EK
> > >>    > > can be generated in a predictable manner and therefore the
> > >> EK_public
> > >>    > > can act as an identifier for that TPM.
> > >>    > >
> > >>    > >
> > >>    > > The privacy aspect applies to the AK as far as I recall
> reading, but
> > >>    > > the notion of privacy here is rather tenuous anyway.
> > >>    > >
> > >>    > > At least in our work, the EK and AK have proven robust enough
> to be
> > >>    > > used as permanent identifiers
> > >>    > >
> > >>    > >
> > >>    > > Ian
> > >>    > >
> > >>    > >
> > >>    > > On Tue, 29 Oct 2019 at 18:40, Roberts, William C
> > >>    > > <william.c.roberts(a)intel.com
> > >> <mailto:william.c.roberts(a)intel.com>
> > >> <mailto:william.c.roberts(a)intel.com
> > >> <mailto:william.c.roberts(a)intel.com> > >
> > >> wrote:
> > >>    > >
> > >>    > >
> > >>    > >     I think that's intentional by design due to privacy
> concerns.
> > >>    > >
> > >>    > >     > -----Original Message-----
> > >>    > >     > From: Max Halld=C3=A9n [mailto:max.hallden(a)wisi.se
> > >> <mailto:max.hallden(a)wisi.se>
> > >>    > > <mailto:max.hallden(a)wisi.se <mailto:max.hallden(a)wisi.se> =
> ]
> > >>    > >     > Sent: Tuesday, October 29, 2019 9:58 AM
> > >>    > >     > To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > >> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> > >>    > >     > Subject: [tpm2] unique identifier
> > >>    > >     >
> > >>    > >     > Hi all,
> > >>    > >     >
> > >>    > >     > I'm looking for some kind of unique identifier for the
> tpm that
> > >>    > > can't be cleared.
> > >>    > >     > AFAICT the TPM2 standard doesn't contain anything like
> this? The
> > >>    > > closest thing is
> > >>    > >     > the EK I guess, but even that can be cleared.
> > >>    > >     >
> > >>    > >     > Regards,
> > >>    > >     > Max
> > >>    > >     >
> > >>    > >     > _______________________________________________
> > >>    > >     > tpm2 mailing list -- tpm2(a)lists.01.org <mailto:
> tpm2(a)lists.01.org>
> > >> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> > >>    > >     > To unsubscribe send an email to tpm2-leave(a)lists.01.o=
rg
> > >> <mailto:tpm2-leave(a)lists.01.org>
> > >>    > > <mailto:tpm2- <mailto:tpm2->  leave(a)lists.01.org
> > >> <mailto:leave(a)lists.01.org> >
> > >>    > >     > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> > >>    > >     _______________________________________________
> > >>    > >     tpm2 mailing list -- tpm2(a)lists.01.org <mailto:
> tpm2(a)lists.01.org>
> > >> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> > >>    > >     To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > >> <mailto:tpm2-leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> > >>    > > leave(a)lists.01.org <mailto:leave(a)lists.01.org> >
> > >>    > >     %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> > >>    > >
> > >>    >
> > >>    > _______________________________________________
> > >>    > tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.0=
1.org
> >
> > >>    > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > >> <mailto:tpm2- leave(a)lists.01.org>
> > >>    > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> > >>
> > > _______________________________________________
> > > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email=
 to
> > > tpm2-leave(a)lists.01.org
> > > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >
>
>

--===============3702379228392965274==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IZXJlJiMzOTtzIHRoZSByZXN1bHQgZnJvbSB0aGUgSW5maW5l
b24gOTY3MCBUUE0yLjAgRXZhbHVhdGlvbiBib2FyZHMgZm9yIFJhc3BiZXJyeSBQaTrCoCBJIGFz
c3VtZSB0aGlzIGlzIHdoYXQgeW91IG1lYW4gZnJvbSB0aGUgYWJvdmU/PGJyPjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+On4gJCB0cG0yX2dldGNhcCBjb21tYW5kcyB8IGdyZXAgQ2hhbmdlPGJy
PlRQTTJfQ0NfSGllcmFyY2h5Q2hhbmdlQXV0aDo8YnI+VFBNMl9DQ19OVl9DaGFuZ2VBdXRoOjxi
cj5UUE0yX0NDX09iamVjdENoYW5nZUF1dGg6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5BY3R1
YWxseSwgSSByZW1lbWJlciB3ZSBoYXZlIHNlZW4gdGhlIEVLIGNoYW5nZSBpbiBvbmUgb2Ygb3Vy
wqAgSW50ZWwgTlVDcyAtIHRob3VnaCBJIGNhbiBiZSBmYWlybHkgc3VyZSB0aGF0IHdlIGhhdmVu
JiMzOTt0IGV2ZXIgc2VudCB0aGUgQ2hhbmdlRVBTIGNvbW1hbmQgdG8gaXQuLi50aGVzZSBJSVJD
IGFyZSA5NjcwIFRQTTIuMCBkZXZpY2VzIHRvby4gV2lsbCBjaGVjay48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PnQuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JYW48YnI+PC9kaXY+PGRpdj48
YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRy
IiBjbGFzcz0iZ21haWxfYXR0ciI+T24gV2VkLCAzMCBPY3QgMjAxOSBhdCAxNToyMiwgUm9iZXJ0
cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwu
Y29tIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPlRoZSBUU1Mgc3VwcG9ydHMgaXQuIElmIHlvdSBsb29rIGF0IHRoZSByZXR1cm4gY29k
ZTo8YnI+Cjxicj4KRVJST1I6IEVzeXNfQ2hhbmdlRVBTKDB4QjAxNDMpIC0gcm10OmVycm9yKDIu
MCk6IGNvbW1hbmQgY29kZSBub3Q8YnI+CnN1cHBvcnRlZDxicj4KPGJyPgpUaGUgJnF1b3Q7cm10
JnF1b3Q7IHBvcnRpb24gaXMgdGhlIGxheWVyIHRoYXQgdGhlIHJldHVybiBjb2RlIHdhcyBzZW50
IGZyb20uPGJyPgpMb29rcyBsaWtlIHRoZSByZXNvdXJjZSBtYW5hZ2VyIGRldGVjdGVkIHRoYXQg
dGhlIGNvbW1hbmQgaXNuJiMzOTt0PGJyPgpzdXBwb3J0ZWQgYW5kIGlzc3VlZCBhbiBlcnJvci7C
oCBJIGtub3cgZm9yIHRwbTItYWJybWQgaXQgd29ya3Mgd2l0aDxicj4KdGhlIHNpbXVsYXRvciwg
c28gcGVyaGFwcyBhYnJtZCBoYXMgdGhpcyBsb2dpYyBpbiBpdC4gPGJyPgo8YnI+CldoaWNoIHJl
c291cmNlIG1hbmFnZXIgYXJlIHlvdSB1c2luZz88YnI+Cjxicj4KU28gaWYgeW91IGdldCBhIFRQ
TSB0aGF0IHJlamVjdHMgdGhpcyBjb21tYW5kLCB5b3UgY2FuIGxvb2sgaW4gdHBtMl9nZXRjYXAg
Y29tbWFuZHM8YnI+CkZvciBhIGxpc3Qgb2Ygc3VwcG9ydGVkIGNvbW1hbmRzLCB0aGVuIHlvdSBr
bm93IHRoYXQgaW4gZmFjdCB5b3VyIGVwU2VlZCBpcyBmaXhlZCBhbmQ8YnI+Ck5vbi1jaGFuZ2Vh
YmxlIGFuZCB0aGF0IEVDIGlzIGEgdW5pcXVlIGlkZW50aWZpZXIuIElmIHRoZSBjb21tYW5kIGV4
aXN0cywgd2VsbC4uLiB0aGVuIGl0PGJyPgpJcyBsaWtlbHkgdG8gYmUgdW5pcXVlIGJ1dCBub3Qg
Z3VhcmFudGVlZC48YnI+Cjxicj4KU29tZXdoZXJlIGluIHRoZSBzcGVjIGlzIHRoZSBsaXN0IG9m
IGNvbW1hbmRzIGluZGljYXRpbmcgd2hpY2ggYXJlIG9wdGlvbmFsIGFuZCB3aGljaCBhcmUgcmVx
dWlyZWQsPGJyPgpJIHdvdWxkIGd1ZXNzIGFsbW9zdCBubyBtYW51ZmFjdHVyZXJzIGFyZSBpbXBs
ZW1lbnRpbmcgdGhpcyBpbnRlcmZhY2UuIEJ1dCBJIGhhdmUgbm8gZW1waXJpY2FsPGJyPgpldmlk
ZW5jZSB0byBhc3NlcnQgdGhhdCBjbGFpbSwganVzdCBhIGh1bmNoLjxicj4KPGJyPgpUaGlzIGlz
IHdoYXQgY2FuIG1ha2UgdGhlIFRQTSBzdWNoIGEgcGFpbiBhdCB0aW1lcywgaXMgdGhpcyBvcHRp
b25hbCBzdHVmZiwgdGhlcmUgYXJlIHZhc3QgZGlmZmVyZW5jZXM8YnI+CmluIHJlc291cmNlcyBh
bmQgY2FwYWJpbGl0aWVzLjxicj4KPGJyPgpCaWxsPGJyPgo8YnI+Cjxicj4KJmd0OyAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4KJmd0OyBGcm9tOiBNYXggSGFsbGTDqW4gW21haWx0bzo8
YSBocmVmPSJtYWlsdG86bWF4LmhhbGxkZW5Ad2lzaS5zZSIgdGFyZ2V0PSJfYmxhbmsiPm1heC5o
YWxsZGVuQHdpc2kuc2U8L2E+XTxicj4KJmd0OyBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMzAs
IDIwMTkgMzoyMSBBTTxicj4KJmd0OyBUbzogUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVm
PSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2ls
bGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs7IElhbiBPbGl2ZXI8YnI+CiZndDsgJmx0
OzxhIGhyZWY9Im1haWx0bzppYW4uanVzdGluLm9saXZlckBnbWFpbC5jb20iIHRhcmdldD0iX2Js
YW5rIj5pYW4uanVzdGluLm9saXZlckBnbWFpbC5jb208L2E+Jmd0Ozxicj4KJmd0OyBDYzogPGEg
aHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0
cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFN1YmplY3Q6IFJlOiBbdHBtMl0gUmU6IHVuaXF1ZSBpZGVu
dGlmaWVyPGJyPgomZ3Q7IDxicj4KJmd0OyBUaGFuayB5b3UgZm9yIHlvdXIgYW5zd2VycyE8YnI+
CiZndDsgPGJyPgomZ3Q7IEl0IHNvdW5kcyBsaWtlIEkgbWlnaHQgYmUgbG9va2luZyBlbHNld2hl
cmUgZm9yIHNvbWUga2luZCBvZiBwbGF0Zm9ybSBpZGVudGlmaWVyLjxicj4KJmd0OyBBbHRob3Vn
aCBJJiMzOTttIHN1cmUgRUsgb3Igc2ltaWxhciB3b3VsZCB3b3JrIHNpbmNlIHdlIHdvbiYjMzk7
dCBjaGFuZ2UgYW55IHNlZWRzLCBpdCBpczxicj4KJmd0OyBuaWNlIHRvIGJlIGFibGUgdG8gc2F5
IHRoYXQgaXQgY2FuJiMzOTt0IGV2ZXIgY2hhbmdlIG9yIGJlIHJlbW92ZWQuPGJyPgomZ3Q7IDxi
cj4KJmd0OyBUaGUgaWRlYSB0aGF0IFRQTSBtYW51ZmFjdHVyZXJzIG1pZ2h0IGJsb2NrIHRoZSBj
aGFuZ2VFUFMgY29tbWFuZCBpczxicj4KJmd0OyBpbnRlcmVzdGluZyB0aG91Z2ggYW5kIHdoZW4g
SSB0ZXN0ZWQgdGhpcyBmb3IgbXkgSW5maW5lb24gVFBNIEkgZ290IHRoaXM6PGJyPgomZ3Q7IDxi
cj4KJmd0OyByb290QChub25lKTp+IyB0cG0yX2NoYW5nZWVwcyAtLXRjdGk9ZGV2aWNlOi9kZXYv
dHBtcm0wPGJyPgomZ3Q7IFdBUk5JTkc6ZXN5czouLi90cG0yLXRzcy0yLjMuMS9zcmMvdHNzMi08
YnI+CiZndDsgZXN5cy9hcGkvRXN5c19DaGFuZ2VFUFMuYzoyODM6RXN5c19DaGFuZ2VFUFNfRmlu
aXNoKCk8YnI+CiZndDsgUmVjZWl2ZWQgVFBNIEVycm9yPGJyPgomZ3Q7IEVSUk9SOmVzeXM6Li4v
dHBtMi10c3MtMi4zLjEvc3JjL3RzczItPGJyPgomZ3Q7IGVzeXMvYXBpL0VzeXNfQ2hhbmdlRVBT
LmM6OTg6RXN5c19DaGFuZ2VFUFMoKTxicj4KJmd0OyBFc3lzIEZpbmlzaCBFcnJvckNvZGUgKDB4
MDAwYjAxNDMpPGJyPgomZ3Q7IEVSUk9SOiBFc3lzX0NoYW5nZUVQUygweEIwMTQzKSAtIHJtdDpl
cnJvcigyLjApOiBjb21tYW5kIGNvZGUgbm90PGJyPgomZ3Q7IHN1cHBvcnRlZDxicj4KJmd0OyA8
YnI+CiZndDsgR3JhbnRlZCwgSSBkaWQgYSBxdWljayB1cGRhdGUgZnJvbSB0cG0yLXRvb2xzIDQu
MCB0byBtYXN0ZXIgdG8gZ2V0IHN1cHBvcnQgZm9yPGJyPgomZ3Q7IHRoYXQgc3BlY2lmaWMgY29t
bWFuZCwgc28gaXQgbWlnaHQgYmUgdHNzIG9yIHNvbWV0aGluZyB0aGF0IGRvZXNuJiMzOTt0IHN1
cHBvcnQgaXQuPGJyPgomZ3Q7IEJ1dCB0aGF0IGxvb2tzIGxpa2UgdGhlIFRQTSBpcyBub3Qgc3Vw
cG9ydGluZyBpdCB0byBtZS48YnI+CiZndDsgPGJyPgomZ3Q7IFJlZ2FyZHM8YnI+CiZndDsgTWF4
PGJyPgomZ3Q7IDxicj4KJmd0OyBPbiAyMDE5LTEwLTI5IDIyOjQ2LCBSb2JlcnRzLCBXaWxsaWFt
IEMgd3JvdGU6PGJyPgomZ3Q7ICZndDsgU2VjdGlvbiAxNC4zLjIgb2YgdGhlIGFyY2hpdGVjdHVy
ZSBkb2MgaXMgcmVsZXZhbnQ6PGJyPgomZ3Q7ICZndDsgPGEgaHJlZj0iaHR0cHM6Ly90cnVzdGVk
Y29tcHV0aW5nZ3JvdXAub3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy9UUE0tUmV2LTIuMC1QYXJ0LSIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly90cnVzdGVkY29tcHV0aW5n
Z3JvdXAub3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy9UUE0tUmV2LTIuMC1QYXJ0LTwvYT48YnI+CiZn
dDsgJmd0OyAxLUFyY2hpdGVjdHVyZS0wMS4zOC5wZGY8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAm
Z3Q7IFdoaWxlIGl0JiMzOTtzIHNhZmUgdG8gc2F5IHRoYXQgbW9zdCBvZiB0aGUgdGltZSB0aGUg
bWFudWZhY3R1cmVycyBrZXk8YnI+CiZndDsgJmd0OyBjb3VsZCBiZSB0aGUgaWRlbnRpZmllciwg
aXQmIzM5O3Mgbm90IGd1YXJhbnRlZWQgdG8gYWx3YXlzIGJlIHRoZXJlIGlmPGJyPgomZ3Q7ICZn
dDsgc29tZW9uZSByb2xscyB0aGUgZXBTZWVkLiBJZiBzb21lb25lIGRvZXMgdGhhdCwgdGhleSYj
Mzk7ZCBiZSB0aHJvd2luZyBhd2F5IHRoZTxicj4KJmd0OyBtYW51ZmFjdHVyZXJzIGNsYWltcyBv
ZiBpdHMgYXV0aGVudGljaXR5IGFuZCBlbnN1cmluZyB0aGV5IHJlbWFpbiBhbm9ueW1vdXMuPGJy
PgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyBTbyBiZSBjYXJlZnVsIHdpdGggdGhhdCBjb21tYW5k
ISBJIHdvbmRlciBpZiBUUE0gbWFudWZhY3R1cmVycyBhcmUgYWxsb3dlZDxicj4KJmd0OyB0bywg
b3IgZG8gYmxvY2sgdGhhdCBjb21tYW5kLjxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7ICZndDsmZ3Q7IEZyb206IElhbiBP
bGl2ZXIgW21haWx0bzo8YSBocmVmPSJtYWlsdG86aWFuLmp1c3Rpbi5vbGl2ZXJAZ21haWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+aWFuLmp1c3Rpbi5vbGl2ZXJAZ21haWwuY29tPC9hPl08YnI+CiZn
dDsgJmd0OyZndDsgU2VudDogVHVlc2RheSwgT2N0b2JlciAyOSwgMjAxOSAyOjUwIFBNPGJyPgom
Z3Q7ICZndDsmZ3Q7IFRvOiBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb208L2E+Jmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0OyBDYzogPGEgaHJlZj0ibWFp
bHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8
L2E+PGJyPgomZ3Q7ICZndDsmZ3Q7IFN1YmplY3Q6IFJlOiBbdHBtMl0gUmU6IHVuaXF1ZSBpZGVu
dGlmaWVyPGJyPgomZ3Q7ICZndDsmZ3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7IFRoYW5rcyAtIHdpbGwg
dGFrZSBhIGxvb2sgd2l0aCB0aGUgcGFydGljdWxhciBUUE1zIHdlJiMzOTtyZSB1c2luZzxicj4K
Jmd0OyAmZ3Q7Jmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0OyB0Ljxicj4KJmd0OyAmZ3Q7Jmd0Ozxicj4K
Jmd0OyAmZ3Q7Jmd0OyBJYW48YnI+CiZndDsgJmd0OyZndDs8YnI+CiZndDsgJmd0OyZndDs8YnI+
CiZndDsgJmd0OyZndDsgT24gVHVlLCAyOSBPY3QgMjAxOSBhdCAyMDozNywgUm9iZXJ0cywgV2ls
bGlhbSBDPGJyPgomZ3Q7ICZndDsmZ3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJv
YmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwu
Y29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0
OyAmZ3Q7IHdyb3RlOjxicj4KJmd0OyAmZ3Q7Jmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0Ozxicj4KJmd0
OyAmZ3Q7Jmd0O8KgIMKgIEZvcmdvdCAmcXVvdDt0byBiZSBjaGFuZ2VkJnF1b3Q7IGluIG15IHNl
bnRlbmNlLi4uIG9uZSBvZiB0aG9zZSBkYXlzLjxicj4KJmd0OyAmZ3Q7Jmd0Ozxicj4KJmd0OyAm
Z3Q7Jmd0O8KgIMKgICZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+CiZndDsgJmd0
OyZndDvCoCDCoCAmZ3Q7IEZyb206IFJvYmVydHMsIFdpbGxpYW0gQyBbbWFpbHRvOjxhIGhyZWY9
Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxs
aWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+PGJyPgomZ3Q7ICZndDsmZ3Q7ICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IF08YnI+CiZndDsgJmd0OyZn
dDvCoCDCoCAmZ3Q7IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMjksIDIwMTkgMTozNiBQTTxicj4K
Jmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDsgVG86IElhbiBPbGl2ZXIgJmx0OzxhIGhyZWY9Im1haWx0
bzppYW4uanVzdGluLm9saXZlckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pYW4uanVzdGlu
Lm9saXZlckBnbWFpbC5jb208L2E+PGJyPgomZ3Q7ICZndDsmZ3Q7ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOmlhbi5qdXN0aW4ub2xpdmVyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmlh
bi5qdXN0aW4ub2xpdmVyQGdtYWlsLmNvbTwvYT4mZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyZndDvC
oCDCoCAmZ3Q7IENjOiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0i
X2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4m
Z3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyBTdWJqZWN0OiBbdHBtMl0gUmU6IHVuaXF1
ZSBpZGVudGlmaWVyPGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0
O8KgIMKgIFRoZSBUUE0gYWxsb3dzIHRoZSBzZWVkIHRvIGJlIGNoYW5nZWQgb24gdGhlIDMgbm9u
LXZvbGF0aWxlPGJyPgomZ3Q7ICZndDsmZ3Q7IGhpZXJhcmNoeTxicj4KJmd0OyAmZ3Q7Jmd0OyBz
ZWVkczo8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAg
Jmd0OyBUUE0yX0NoYW5nZUVQUyAtIGVuZG9yc2VtZW50IHNlZWQ8YnI+CiZndDsgJmd0OyZndDvC
oCDCoCAmZ3Q7IFRQTTJfQ2hhbmdlUFBTIC0gcGxhdGZvcm0gc2VlZDxicj4KJmd0OyAmZ3Q7Jmd0
O8KgIMKgICZndDsgVFBNMl9DbGVhciAtIFN0b3JhZ2UgJnF1b3Q7T3duZXImcXVvdDsgc2VlZDxi
cj4KJmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDs8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7IE51
bGwgY2hhbmdlcyBvbiBldmVyeSB0cG0gYm9vdC48YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7
PGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAmZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tPGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAmZ3Q7IEZyb206IElhbiBPbGl2ZXIgW21h
aWx0bzo8YSBocmVmPSJtYWlsdG86aWFuLmp1c3Rpbi5vbGl2ZXJAZ21haWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+aWFuLmp1c3Rpbi5vbGl2ZXJAZ21haWwuY29tPC9hPjxicj4KJmd0OyAmZ3Q7Jmd0
OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppYW4uanVzdGluLm9saXZlckBnbWFpbC5jb20i
IHRhcmdldD0iX2JsYW5rIj5pYW4uanVzdGluLm9saXZlckBnbWFpbC5jb208L2E+Jmd0OyBdPGJy
PgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAmZ3Q7IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMjks
IDIwMTkgMTE6NTkgQU08YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDsgVG86IFJvYmVy
dHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+
CiZndDsgJmd0OyZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVy
dHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
PC9hPiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDsgJmd0OyBDYzogTWF4IEhh
bGxkw6luICZsdDs8YSBocmVmPSJtYWlsdG86bWF4LmhhbGxkZW5Ad2lzaS5zZSIgdGFyZ2V0PSJf
YmxhbmsiPm1heC5oYWxsZGVuQHdpc2kuc2U8L2E+PGJyPgomZ3Q7ICZndDsmZ3Q7ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOm1heC5oYWxsZGVuQHdpc2kuc2UiIHRhcmdldD0iX2JsYW5rIj5t
YXguaGFsbGRlbkB3aXNpLnNlPC9hPiZndDsgJmd0OzsgPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9i
bGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0O8KgIMKgICZn
dDsgJmd0OyBTdWJqZWN0OiBSZTogW3RwbTJdIFJlOiB1bmlxdWUgaWRlbnRpZmllcjxicj4KJmd0
OyAmZ3Q7Jmd0O8KgIMKgICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDsgJmd0
OyBJSVJDIHRoZSBFSyBpcyBnZW5lcmF0ZWQgZnJvbSBhIHNlZWQgdW5pcXVlIHRvIGVhY2ggVFBN
IGFuZCB0eXBpY2FsbHk8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDsgaW1wbGVtZW50
ZWQgYXMgYSBzZXQgb2YgZnVzZXMgYmxvd24gYXQgbWFudWZhY3R1cmluZyB0aW1lLiBTbyB0aGUg
RUs8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDsgY2FuIGJlIGdlbmVyYXRlZCBpbiBh
IHByZWRpY3RhYmxlIG1hbm5lciBhbmQgdGhlcmVmb3JlIHRoZTxicj4KJmd0OyAmZ3Q7Jmd0OyBF
S19wdWJsaWM8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDsgY2FuIGFjdCBhcyBhbiBp
ZGVudGlmaWVyIGZvciB0aGF0IFRQTS48YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDs8
YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAm
Z3Q7ICZndDsgVGhlIHByaXZhY3kgYXNwZWN0IGFwcGxpZXMgdG8gdGhlIEFLIGFzIGZhciBhcyBJ
IHJlY2FsbCByZWFkaW5nLCBidXQ8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDsgdGhl
IG5vdGlvbiBvZiBwcml2YWN5IGhlcmUgaXMgcmF0aGVyIHRlbnVvdXMgYW55d2F5Ljxicj4KJmd0
OyAmZ3Q7Jmd0O8KgIMKgICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDsgJmd0
OyBBdCBsZWFzdCBpbiBvdXIgd29yaywgdGhlIEVLIGFuZCBBSyBoYXZlIHByb3ZlbiByb2J1c3Qg
ZW5vdWdoIHRvIGJlPGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAmZ3Q7IHVzZWQgYXMgcGVy
bWFuZW50IGlkZW50aWZpZXJzPGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAmZ3Q7PGJyPgom
Z3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAm
Z3Q7IElhbjxicj4KJmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0
O8KgIMKgICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDsgJmd0OyBPbiBUdWUs
IDI5IE9jdCAyMDE5IGF0IDE4OjQwLCBSb2JlcnRzLCBXaWxsaWFtIEM8YnI+CiZndDsgJmd0OyZn
dDvCoCDCoCAmZ3Q7ICZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0Bp
bnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+
PGJyPgomZ3Q7ICZndDsmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5y
b2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVs
LmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5y
b2JlcnRzQGludGVsLmNvbTwvYT48YnI+CiZndDsgJmd0OyZndDsgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2ls
bGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsm
Z3Q7IHdyb3RlOjxicj4KJmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7
Jmd0O8KgIMKgICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDsgJmd0O8KgIMKg
IMKgSSB0aGluayB0aGF0JiMzOTtzIGludGVudGlvbmFsIGJ5IGRlc2lnbiBkdWUgdG8gcHJpdmFj
eSBjb25jZXJucy48YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0
OyZndDvCoCDCoCAmZ3Q7ICZndDvCoCDCoCDCoCZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS08YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDvCoCDCoCDCoCZndDsgRnJvbTogTWF4
IEhhbGxkw6luIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1heC5oYWxsZGVuQHdpc2kuc2UiIHRh
cmdldD0iX2JsYW5rIj5tYXguaGFsbGRlbkB3aXNpLnNlPC9hPjxicj4KJmd0OyAmZ3Q7Jmd0OyAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzptYXguaGFsbGRlbkB3aXNpLnNlIiB0YXJnZXQ9Il9i
bGFuayI+bWF4LmhhbGxkZW5Ad2lzaS5zZTwvYT4mZ3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAg
Jmd0OyAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1heC5oYWxsZGVuQHdpc2kuc2Ui
IHRhcmdldD0iX2JsYW5rIj5tYXguaGFsbGRlbkB3aXNpLnNlPC9hPiAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzptYXguaGFsbGRlbkB3aXNpLnNlIiB0YXJnZXQ9Il9ibGFuayI+bWF4LmhhbGxk
ZW5Ad2lzaS5zZTwvYT4mZ3Q7ICZndDsgXTxicj4KJmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDsgJmd0
O8KgIMKgIMKgJmd0OyBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDI5LCAyMDE5IDk6NTggQU08YnI+
CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDvCoCDCoCDCoCZndDsgVG86IDxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3Jn
PC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0
PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZndDsgJmd0OyZndDsgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5r
Ij50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7ICZn
dDs8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDvCoCDCoCDCoCZndDsgU3ViamVjdDog
W3RwbTJdIHVuaXF1ZSBpZGVudGlmaWVyPGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAmZ3Q7
wqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAmZ3Q7wqAgwqAgwqAmZ3Q7
IEhpIGFsbCw8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDvCoCDCoCDCoCZndDs8YnI+
CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDvCoCDCoCDCoCZndDsgSSYjMzk7bSBsb29raW5n
IGZvciBzb21lIGtpbmQgb2YgdW5pcXVlIGlkZW50aWZpZXIgZm9yIHRoZSB0cG0gdGhhdDxicj4K
Jmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDsgJmd0OyBjYW4mIzM5O3QgYmUgY2xlYXJlZC48YnI+CiZn
dDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDvCoCDCoCDCoCZndDsgQUZBSUNUIHRoZSBUUE0yIHN0
YW5kYXJkIGRvZXNuJiMzOTt0IGNvbnRhaW4gYW55dGhpbmcgbGlrZSB0aGlzPyBUaGU8YnI+CiZn
dDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDsgY2xvc2VzdCB0aGluZyBpczxicj4KJmd0OyAmZ3Q7
Jmd0O8KgIMKgICZndDsgJmd0O8KgIMKgIMKgJmd0OyB0aGUgRUsgSSBndWVzcywgYnV0IGV2ZW4g
dGhhdCBjYW4gYmUgY2xlYXJlZC48YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDvCoCDC
oCDCoCZndDs8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDvCoCDCoCDCoCZndDsgUmVn
YXJkcyw8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDvCoCDCoCDCoCZndDsgTWF4PGJy
PgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7ICZndDsm
Z3Q7wqAgwqAgJmd0OyAmZ3Q7wqAgwqAgwqAmZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fPGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAmZ3Q7wqAg
wqAgwqAmZ3Q7IHRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJA
bGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZndDsgJmd0OyZndDsgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAx
Lm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRh
cmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7ICZndDs8YnI+CiZndDsgJmd0
OyZndDvCoCDCoCAmZ3Q7ICZndDvCoCDCoCDCoCZndDsgVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBl
bWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0i
X2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgJmd0OyZndDsgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0i
X2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7
wqAgwqAgJmd0OyAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItIiB0YXJnZXQ9
Il9ibGFuayI+dHBtMi08L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItIiB0YXJn
ZXQ9Il9ibGFuayI+dHBtMi08L2E+Jmd0O8KgIDxhIGhyZWY9Im1haWx0bzpsZWF2ZUBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj5sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7ICZn
dDsmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmxlYXZlQGxpc3RzLjAxLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPmxlYXZlQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7ICZndDs8YnI+CiZndDsgJmd0
OyZndDvCoCDCoCAmZ3Q7ICZndDvCoCDCoCDCoCZndDsgJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZv
JShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7
ICZndDvCoCDCoCDCoF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fPGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAmZ3Q7wqAgwqAgwqB0cG0yIG1haWxpbmcg
bGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5r
Ij50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJy
PgomZ3Q7ICZndDsmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0
cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAmZ3Q7wqAg
wqAgwqBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0y
LWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEu
b3JnPC9hPjxicj4KJmd0OyAmZ3Q7Jmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0y
LWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEu
b3JnPC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLSIgdGFyZ2V0PSJf
YmxhbmsiPnRwbTItPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLSIgdGFyZ2V0
PSJfYmxhbmsiPnRwbTItPC9hPiZndDs8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7ICZndDsg
PGEgaHJlZj0ibWFpbHRvOmxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmxlYXZl
QGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bGVhdmVAbGlzdHMu
MDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+bGVhdmVAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0Ozxi
cj4KJmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDsgJmd0O8KgIMKgIMKgJSh3ZWJfcGFnZV91cmwpc2xp
c3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+CiZndDsgJmd0OyZndDvCoCDC
oCAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyZndDvCoCDCoCAmZ3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7
wqAgwqAgJmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xzxicj4KJmd0OyAmZ3Q7Jmd0O8KgIMKgICZndDsgdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJl
Zj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0
YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0
O8KgIMKgICZndDsgVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWls
dG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxp
c3RzLjAxLm9yZzwvYT48YnI+CiZndDsgJmd0OyZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86dHBtMi0iIHRhcmdldD0iX2JsYW5rIj50cG0yLTwvYT4gPGEgaHJlZj0ibWFpbHRvOmxlYXZl
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmxlYXZlQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7
PGJyPgomZ3Q7ICZndDsmZ3Q7wqAgwqAgJmd0OyAlKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNn
aWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KJmd0OyAmZ3Q7Jmd0Ozxicj4KJmd0OyAmZ3Q7
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgomZ3Q7
ICZndDsgdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+IFRvIHVuc3Vic2NyaWJl
IHNlbmQgYW4gZW1haWwgdG88YnI+CiZndDsgJmd0OyA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2
ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwv
YT48YnI+CiZndDsgJmd0OyAlKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2lu
dGVybmFsX25hbWUpczxicj4KJmd0OyA8YnI+Cjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============3702379228392965274==--

