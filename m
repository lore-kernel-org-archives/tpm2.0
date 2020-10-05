Content-Type: multipart/mixed; boundary="===============0197117767803396285=="
MIME-Version: 1.0
From: Hanson Char <hanson.char at gmail.com>
Subject: [tpm2] Re: tpm2_getpubek
Date: Mon, 05 Oct 2020 08:57:27 -0700
Message-ID: <25672C46-FF36-44FD-AB32-F45B3B0AD0C4@gmail.com>
In-Reply-To: CAO4D2DNvyg-2O8rJwEFHA-_L6yA_eGPV-5VqcuXsD6PQ+4CgvQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0197117767803396285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think you are looking for tpm2_getekcertificate.  (http://manpages.ubuntu=
.com/manpages/focal/man1/tpm2_getekcertificate.1.html <http://manpages.ubun=
tu.com/manpages/focal/man1/tpm2_getekcertificate.1.html>)
Regards,
Hanson

> On Oct 5, 2020, at 7:43 AM, Graham Bartlett <graham.ietf(a)gmail.com> wro=
te:
> =

> Hi
> =

> I'm new to TPMs and am trying to follow some of the online examples.
> =

> In many of these the command 'tpm2_getpubek' is shown, however I'm runnin=
g this on Ubuntu, I built this from source and I have a number of TPM2 comm=
ands, but not 'tpm2_getpubek'.
> =

> Would anyone know if I'm missing something? Or if there's a new CLI for '=
tpm2_getpubek'.
> =

> The following is the commands I have;
> =

> many thanks
> =

> $ tpm2 --help
> ERROR: --help: unknown tool. Available tpm2 commands:
> certifyX509certutil
> checkquote
> eventlog
> print
> rc_decode
> activatecredential
> certify
> changeauth
> changeeps
> changepps
> clear
> clearcontrol
> clockrateadjust
> create
> createak
> createek
> createpolicy
> setprimarypolicy
> createprimary
> dictionarylockout
> duplicate
> getcap
> gettestresult
> encryptdecrypt
> evictcontrol
> flushcontext
> getekcertificate
> getrandom
> gettime
> hash
> hierarchycontrol
> hmac
> import
> incrementalselftest
> load
> loadexternal
> makecredential
> nvdefine
> nvextend
> nvincrement
> nvreadpublic
> nvread
> nvreadlock
> nvundefine
> nvwrite
> nvwritelock
> nvsetbits
> pcrallocate
> pcrevent
> pcrextend
> pcrread
> pcrreset
> policypcr
> policyauthorize
> policyauthorizenv
> policynv
> policycountertimer
> policyor
> policynamehash
> policytemplate
> policycphash
> policypassword
> policysigned
> policyticket
> policyauthvalue
> policysecret
> policyrestart
> policycommandcode
> policynvwritten
> policyduplicationselect
> policylocality
> quote
> readclock
> readpublic
> rsadecrypt
> rsaencrypt
> send
> selftest
> setclock
> shutdown
> sign
> certifycreation
> nvcertify
> startauthsession
> startup
> stirrandom
> testparms
> unseal
> verifysignature
> setcommandauditstatus
> getcommandauditdigest
> getsessionauditdigest
> geteccparameters
> ecephermal
> commit
> ecdhkeygen
> ecdhzgen
> zgen2phase
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s


--===============0197117767803396285==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXMtYXNjaWkiPjwvaGVhZD48Ym9keSBzdHlsZT0id29yZC13cmFwOiBi
cmVhay13b3JkOyAtd2Via2l0LW5ic3AtbW9kZTogc3BhY2U7IGxpbmUtYnJlYWs6IGFmdGVyLXdo
aXRlLXNwYWNlOyIgY2xhc3M9IiI+PHByZSBjbGFzcz0iaGlnaGxpZ2h0Ij48Y29kZSBjbGFzcz0i
Ij5JIHRoaW5rIHlvdSBhcmUgbG9va2luZyBmb3IgdHBtMl9nZXRla2NlcnRpZmljYXRlLiAgKDxh
IGhyZWY9Imh0dHA6Ly9tYW5wYWdlcy51YnVudHUuY29tL21hbnBhZ2VzL2ZvY2FsL21hbjEvdHBt
Ml9nZXRla2NlcnRpZmljYXRlLjEuaHRtbCIgY2xhc3M9IiI+aHR0cDovL21hbnBhZ2VzLnVidW50
dS5jb20vbWFucGFnZXMvZm9jYWwvbWFuMS90cG0yX2dldGVrY2VydGlmaWNhdGUuMS5odG1sPC9h
Pik8L2NvZGU+PC9wcmU+PGRpdiBjbGFzcz0iIj5SZWdhcmRzLDwvZGl2PjxkaXYgY2xhc3M9IiI+
SGFuc29uPC9kaXY+PGRpdj48YnIgY2xhc3M9IiI+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xh
c3M9IiI+PGRpdiBjbGFzcz0iIj5PbiBPY3QgNSwgMjAyMCwgYXQgNzo0MyBBTSwgR3JhaGFtIEJh
cnRsZXR0ICZsdDs8YSBocmVmPSJtYWlsdG86Z3JhaGFtLmlldGZAZ21haWwuY29tIiBjbGFzcz0i
Ij5ncmFoYW0uaWV0ZkBnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8L2Rpdj48YnIgY2xhc3M9IkFw
cGxlLWludGVyY2hhbmdlLW5ld2xpbmUiPjxkaXYgY2xhc3M9IiI+PGRpdiBkaXI9Imx0ciIgY2xh
c3M9IiI+PGRpdiBjbGFzcz0iIj5IaTwvZGl2PjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPjwv
ZGl2PjxkaXYgY2xhc3M9IiI+SSdtIG5ldyB0byBUUE1zIGFuZCBhbSB0cnlpbmcgdG8gZm9sbG93
IHNvbWUgb2YgdGhlIG9ubGluZSBleGFtcGxlcy48L2Rpdj48ZGl2IGNsYXNzPSIiPjxiciBjbGFz
cz0iIj48L2Rpdj48ZGl2IGNsYXNzPSIiPkluIG1hbnkgb2YgdGhlc2UgdGhlIGNvbW1hbmQgPGNv
ZGUgY2xhc3M9IiI+J3RwbTJfZ2V0cHViZWsnIGlzIHNob3duLCBob3dldmVyIEknbSBydW5uaW5n
IHRoaXMgb24gVWJ1bnR1LCBJIGJ1aWx0IHRoaXMgZnJvbSBzb3VyY2UgYW5kIEkgaGF2ZSBhIG51
bWJlciBvZiBUUE0yIGNvbW1hbmRzLCBidXQgbm90ICc8L2NvZGU+PGNvZGUgY2xhc3M9IiI+dHBt
Ml9nZXRwdWJlaycuPC9jb2RlPjwvZGl2PjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPjwvZGl2
PjxkaXYgY2xhc3M9IiI+V291bGQgYW55b25lIGtub3cgaWYgSSdtIG1pc3Npbmcgc29tZXRoaW5n
PyBPciBpZiB0aGVyZSdzIGEgbmV3IENMSSBmb3IgJ3RwbTJfZ2V0cHViZWsnLjwvZGl2PjxkaXYg
Y2xhc3M9IiI+PGJyIGNsYXNzPSIiPjwvZGl2PjxkaXYgY2xhc3M9IiI+VGhlIGZvbGxvd2luZyBp
cyB0aGUgY29tbWFuZHMgSSBoYXZlOzwvZGl2PjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPjwv
ZGl2PjxkaXYgY2xhc3M9IiI+bWFueSB0aGFua3M8L2Rpdj48ZGl2IGNsYXNzPSIiPjxiciBjbGFz
cz0iIj48L2Rpdj48ZGl2IGNsYXNzPSIiPiQgdHBtMiAtLWhlbHA8YnIgY2xhc3M9IiI+RVJST1I6
IC0taGVscDogdW5rbm93biB0b29sLiBBdmFpbGFibGUgdHBtMiBjb21tYW5kczo8YnIgY2xhc3M9
IiI+Y2VydGlmeVg1MDljZXJ0dXRpbDxiciBjbGFzcz0iIj5jaGVja3F1b3RlPGJyIGNsYXNzPSIi
PmV2ZW50bG9nPGJyIGNsYXNzPSIiPnByaW50PGJyIGNsYXNzPSIiPnJjX2RlY29kZTxiciBjbGFz
cz0iIj5hY3RpdmF0ZWNyZWRlbnRpYWw8YnIgY2xhc3M9IiI+Y2VydGlmeTxiciBjbGFzcz0iIj5j
aGFuZ2VhdXRoPGJyIGNsYXNzPSIiPmNoYW5nZWVwczxiciBjbGFzcz0iIj5jaGFuZ2VwcHM8YnIg
Y2xhc3M9IiI+Y2xlYXI8YnIgY2xhc3M9IiI+Y2xlYXJjb250cm9sPGJyIGNsYXNzPSIiPmNsb2Nr
cmF0ZWFkanVzdDxiciBjbGFzcz0iIj5jcmVhdGU8YnIgY2xhc3M9IiI+Y3JlYXRlYWs8YnIgY2xh
c3M9IiI+Y3JlYXRlZWs8YnIgY2xhc3M9IiI+Y3JlYXRlcG9saWN5PGJyIGNsYXNzPSIiPnNldHBy
aW1hcnlwb2xpY3k8YnIgY2xhc3M9IiI+Y3JlYXRlcHJpbWFyeTxiciBjbGFzcz0iIj5kaWN0aW9u
YXJ5bG9ja291dDxiciBjbGFzcz0iIj5kdXBsaWNhdGU8YnIgY2xhc3M9IiI+Z2V0Y2FwPGJyIGNs
YXNzPSIiPmdldHRlc3RyZXN1bHQ8YnIgY2xhc3M9IiI+ZW5jcnlwdGRlY3J5cHQ8YnIgY2xhc3M9
IiI+ZXZpY3Rjb250cm9sPGJyIGNsYXNzPSIiPmZsdXNoY29udGV4dDxiciBjbGFzcz0iIj5nZXRl
a2NlcnRpZmljYXRlPGJyIGNsYXNzPSIiPmdldHJhbmRvbTxiciBjbGFzcz0iIj5nZXR0aW1lPGJy
IGNsYXNzPSIiPmhhc2g8YnIgY2xhc3M9IiI+aGllcmFyY2h5Y29udHJvbDxiciBjbGFzcz0iIj5o
bWFjPGJyIGNsYXNzPSIiPmltcG9ydDxiciBjbGFzcz0iIj5pbmNyZW1lbnRhbHNlbGZ0ZXN0PGJy
IGNsYXNzPSIiPmxvYWQ8YnIgY2xhc3M9IiI+bG9hZGV4dGVybmFsPGJyIGNsYXNzPSIiPm1ha2Vj
cmVkZW50aWFsPGJyIGNsYXNzPSIiPm52ZGVmaW5lPGJyIGNsYXNzPSIiPm52ZXh0ZW5kPGJyIGNs
YXNzPSIiPm52aW5jcmVtZW50PGJyIGNsYXNzPSIiPm52cmVhZHB1YmxpYzxiciBjbGFzcz0iIj5u
dnJlYWQ8YnIgY2xhc3M9IiI+bnZyZWFkbG9jazxiciBjbGFzcz0iIj5udnVuZGVmaW5lPGJyIGNs
YXNzPSIiPm52d3JpdGU8YnIgY2xhc3M9IiI+bnZ3cml0ZWxvY2s8YnIgY2xhc3M9IiI+bnZzZXRi
aXRzPGJyIGNsYXNzPSIiPnBjcmFsbG9jYXRlPGJyIGNsYXNzPSIiPnBjcmV2ZW50PGJyIGNsYXNz
PSIiPnBjcmV4dGVuZDxiciBjbGFzcz0iIj5wY3JyZWFkPGJyIGNsYXNzPSIiPnBjcnJlc2V0PGJy
IGNsYXNzPSIiPnBvbGljeXBjcjxiciBjbGFzcz0iIj5wb2xpY3lhdXRob3JpemU8YnIgY2xhc3M9
IiI+cG9saWN5YXV0aG9yaXplbnY8YnIgY2xhc3M9IiI+cG9saWN5bnY8YnIgY2xhc3M9IiI+cG9s
aWN5Y291bnRlcnRpbWVyPGJyIGNsYXNzPSIiPnBvbGljeW9yPGJyIGNsYXNzPSIiPnBvbGljeW5h
bWVoYXNoPGJyIGNsYXNzPSIiPnBvbGljeXRlbXBsYXRlPGJyIGNsYXNzPSIiPnBvbGljeWNwaGFz
aDxiciBjbGFzcz0iIj5wb2xpY3lwYXNzd29yZDxiciBjbGFzcz0iIj5wb2xpY3lzaWduZWQ8YnIg
Y2xhc3M9IiI+cG9saWN5dGlja2V0PGJyIGNsYXNzPSIiPnBvbGljeWF1dGh2YWx1ZTxiciBjbGFz
cz0iIj5wb2xpY3lzZWNyZXQ8YnIgY2xhc3M9IiI+cG9saWN5cmVzdGFydDxiciBjbGFzcz0iIj5w
b2xpY3ljb21tYW5kY29kZTxiciBjbGFzcz0iIj5wb2xpY3ludndyaXR0ZW48YnIgY2xhc3M9IiI+
cG9saWN5ZHVwbGljYXRpb25zZWxlY3Q8YnIgY2xhc3M9IiI+cG9saWN5bG9jYWxpdHk8YnIgY2xh
c3M9IiI+cXVvdGU8YnIgY2xhc3M9IiI+cmVhZGNsb2NrPGJyIGNsYXNzPSIiPnJlYWRwdWJsaWM8
YnIgY2xhc3M9IiI+cnNhZGVjcnlwdDxiciBjbGFzcz0iIj5yc2FlbmNyeXB0PGJyIGNsYXNzPSIi
PnNlbmQ8YnIgY2xhc3M9IiI+c2VsZnRlc3Q8YnIgY2xhc3M9IiI+c2V0Y2xvY2s8YnIgY2xhc3M9
IiI+c2h1dGRvd248YnIgY2xhc3M9IiI+c2lnbjxiciBjbGFzcz0iIj5jZXJ0aWZ5Y3JlYXRpb248
YnIgY2xhc3M9IiI+bnZjZXJ0aWZ5PGJyIGNsYXNzPSIiPnN0YXJ0YXV0aHNlc3Npb248YnIgY2xh
c3M9IiI+c3RhcnR1cDxiciBjbGFzcz0iIj5zdGlycmFuZG9tPGJyIGNsYXNzPSIiPnRlc3RwYXJt
czxiciBjbGFzcz0iIj51bnNlYWw8YnIgY2xhc3M9IiI+dmVyaWZ5c2lnbmF0dXJlPGJyIGNsYXNz
PSIiPnNldGNvbW1hbmRhdWRpdHN0YXR1czxiciBjbGFzcz0iIj5nZXRjb21tYW5kYXVkaXRkaWdl
c3Q8YnIgY2xhc3M9IiI+Z2V0c2Vzc2lvbmF1ZGl0ZGlnZXN0PGJyIGNsYXNzPSIiPmdldGVjY3Bh
cmFtZXRlcnM8YnIgY2xhc3M9IiI+ZWNlcGhlcm1hbDxiciBjbGFzcz0iIj5jb21taXQ8YnIgY2xh
c3M9IiI+ZWNkaGtleWdlbjxiciBjbGFzcz0iIj5lY2RoemdlbjxiciBjbGFzcz0iIj56Z2VuMnBo
YXNlPGJyIGNsYXNzPSIiPjwvZGl2PjwvZGl2PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXzxiciBjbGFzcz0iIj50cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBo
cmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIGNsYXNzPSIiPnRwbTJAbGlzdHMuMDEub3Jn
PC9hPjxiciBjbGFzcz0iIj5UbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9
Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgY2xhc3M9IiI+dHBtMi1sZWF2ZUBsaXN0
cy4wMS5vcmc8L2E+PGJyIGNsYXNzPSIiPiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0
KXMvJShfaW50ZXJuYWxfbmFtZSlzPC9kaXY+PC9ibG9ja3F1b3RlPjwvZGl2PjxiciBjbGFzcz0i
Ij48L2JvZHk+PC9odG1sPg==
--===============0197117767803396285==--

