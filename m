Content-Type: multipart/mixed; boundary="===============2612930674998058530=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Fri, 10 Apr 2020 14:15:10 -0700
Message-ID: <CAP3jAwTMARj3nM+eEpO6iwUXO1GUbNsHdK7TfE8ZH+Kx1edN0g@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EBC266@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2612930674998058530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Bill,
I have this on my system: Is tpmrm0 same as tabrmd? I believe mine is using
this right now , i'm changing it to what you mentioned  to see if it helps.

[root(a)nfvis ~]# ls -l /dev/tpm*
crw-rw----. 1 tss root  10,   224 Apr  8 23:19 /dev/tpm0
crw-rw----. 1 tss tss  254, 65536 Apr  8 23:19 /dev/tpmrm0

Thanks,

Rahul


On Fri, Apr 10, 2020 at 11:33 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

>
>
> > -----Original Message-----
> > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
> > Sent: Friday, April 10, 2020 1:08 PM
> > To: Roberts, William C <william.c.roberts(a)intel.com>
> > Cc: Desai, Imran <imran.desai(a)intel.com>; tpm2(a)lists.01.org
> > Subject: Re: [tpm2] Re: ESys_ActivateCredential
> >
> > Thanks Bill, trying that.
> >  I did not get debug build tpm2_tss, isn't it all prebuilt ? I will have
> to see how to
> > do it in poky.
>
> If you're getting it from a package manager, yes. But there's nothing
> stopping you
> from using source builds. Some distro's will package debug symbols for
> their
> packages.
>
> >
> > On Fri, Apr 10, 2020 at 8:16 AM Roberts, William C <
> william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > wrote:
> >
> >
> >
> >
> >       > -----Original Message-----
> >       > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> ]
> >       > Sent: Thursday, April 9, 2020 2:51 PM
> >       > To: Roberts, William C <william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> >
> >       > Cc: Desai, Imran <imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> >; tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>
> >       > Subject: Re: [tpm2] Re: ESys_ActivateCredential
> >       >
> >       > Thanks Bill. I use this
> >       > Esys_Initialize( &ectx, NULL, NULL);
> >       >
> >       > so i'm assuming it would take the default
> libtss2-tcti-tabrmd.so.0.
> >
> >       This should do it for you:
> >       TSS2_RC
> >       Tss2_TctiLdr_Initialize (const char *nameConf,
> >                                TSS2_TCTI_CONTEXT **context);
> >
> >       Set nameConf to the string "tabrmd", that should give you a tcti
> pointer
> > you can
> >       pass wot Esys_Initialize()
> >
> >       >
> >       >
> >       > If I need to debug Esys_ActivateCredential more, how can I do
> it, these
> > APIs are
> >       > no more standalone, I have integrated it in a bigger code base
> and
> > added the
> >       > esys-tss2 and other libs in my poky build, so now it runs as
> different
> > process that
> >       > invokes this function, I can gdb into the process but I can't
> seem to gdb
> > into
> >       > Esys_Activate..( )
> >
> >       Did you build tpm2-tss with debug symbols?
> >       Add --enable-debug
> >
> >       >
> >       >
> >       > Thanks,
> >       > Rahul
> >       >
> >       >
> >       >
> >       >
> >       > On Thu, Apr 9, 2020 at 10:23 AM Roberts, William C
> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> >       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > > wrote:
> >       >
> >       >
> >       >       > -----Original Message-----
> >       >       > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>
> >       > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail=
.com>
> >
> > ]
> >       >       > Sent: Thursday, April 9, 2020 11:18 AM
> >       >       > To: Desai, Imran <imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>
> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com=
> > >
> >       >       > Cc: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> >       >       > Subject: [tpm2] Re: ESys_ActivateCredential
> >       >       >
> >       >       > How do I know if  RM is being used?
> >       >
> >       >
> >       >       If you set the tcti to the device tcti, it will open
> /dev/tpm0 by
> > default. And
> >       > that wont
> >       >       Be an RM. You can also give it an option.
> Esys_Initialize() takes a tcti
> > as an
> >       > option,
> >       >       NULL will cause it to use the default search behavior of
> the
> > Tss2_TctiLdr,
> >       > see:
> >       >
> >       >       https://github.com/tpm2-software/tpm2-
> >       > tss/blob/master/man/Tss2_TctiLdr_Initialize.3.in
> > <http://Tss2_TctiLdr_Initialize.3.in>
> >       >       https://github.com/tpm2-software/tpm2-
> >       > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> > <http://Tss2_Tcti_Device_Init.3.in>
> >       >       https://github.com/tpm2-software/tpm2-
> > tss/blob/master/man/tss2-
> >       > tcti-device.7.in <http://tcti-device.7.in>
> >       >
> >       >       You can use man locally if you prefer as well:
> >       >       man 3 Tss2_TctiLdr_Initialize
> >       >       man 7 tss2-tcti-device
> >       >       man 3 Tss2_Tcti_Device_Init
> >       >
> >       >       Note that https://github.com/tpm2-software/tpm2-
> >       > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> > <http://Tss2_Tcti_Device_Init.3.in>
> >       >       Has sample code in it.
> >       >
> >       >       If you're using the tools, it supports explicitly choosing
> the TCTI:
> >       >       https://github.com/tpm2-software/tpm2-
> >       > tools/blob/master/man/common/tcti.md
> >       >
> >       >       Also note that the /dev/tpmrm0 (Notice the RM) is an
> in-kernel
> > resource
> >       > manager.
> >       >
> >       >
> >       >       > When I do ESys_Initialize, I see these WARNINGs,
> wondering if it's
> > okay
> >       > for multi-
> >       >       > thread
> >       >       > WARNING:esys:src/tss2-
> > esys/esys_tcti_default.c:137:tcti_from_file()
> >       > Could not
> >       >       > load TCTI file: libtss2-tcti-default.so <
> http://libtss2-tcti-
> > default.so/>
> >       > libtss2-tcti-
> >       >       > default.so <http://libtss2-tcti-default.so/>
> >       >       > WARNING:esys:src/tss2-
> > esys/esys_tcti_default.c:137:tcti_from_file()
> >       > Could not
> >       >       > load TCTI file: libtss2-tcti-tabrmd.so <
> http://libtss2-tcti-
> > tabrmd.so/>
> >       >       >
> >       >       > In my single threaded process, everything works so
> smoothly
> > [root]#
> >       > ./tpm
> >       >       > WARNING:esys:src/tss2-
> > esys/esys_tcti_default.c:137:tcti_from_file()
> >       > Could not
> >       >       > load TCTI file: libtss2-tcti-default.so <
> http://libtss2-tcti-
> > default.so/>
> >       >       > WARNING:esys:src/tss2-
> > esys/esys_tcti_default.c:137:tcti_from_file()
> >       > Could not
> >       >       > load TCTI file: libtss2-tcti-tabrmd.so <
> http://libtss2-tcti-
> > tabrmd.so/>
> >       > ESYS
> >       >       > Initialization: Pass
> >       >       >
> >       >       > Read TPM EK Certificate: Pass
> >       >       >
> >       >       > TPM EK Certificate Root-CA Verification: Pass
> >       >       >
> >       >       > Clear TPM State: Pass
> >       >       >
> >       >       > Created EK Primary object: Pass
> >       >       > #####Handle 0x418368
> >       >       >
> >       >       > Create Attestation Key: Pass
> >       >       > #####Ak_Handle 0x41836b
> >       >       >
> >       >       > Original Credential=3D"deadbeefdeadbeefdead"
> >       >       >
> >       >       > Make Credential: Pass
> >       >       > #####Encrypted Credential
> >       >       >
> >       >
> > Blob=3D"0020508e439bc6512d044bb8739e8d61c8ce3664d25f3572389b46c8797e562a
> >       >       > 45c412864f020a7f1bbcab7a34f0"
> >       >       >
> >       >       > #####Encrypted
> >       >       >
> >       >
> > Secret=3D"b70689bb0ed9fa8324cfa03d727e6c6795069b4f0943108409b89009b9cc7=
6c
> >       >       >
> >       >
> > 76bddb31a5ccf34cfebc5d3fe715899bb725a8a3c8fe4a6046233869123f3e978051aec
> >       >       >
> >       >
> > e0d7af0ad6f85164a32fd2c5ad756e8c3b72f6311126de79a30c0d72aa0a6f3f437f6bc
> >       >       >
> >       >
> > 077c41d3cc6450c71e803ca6074d34ce3debf5114f4bac2fd7ee6a87ef9f07d83079477
> >       >       >
> >       >
> > 5dda4f77e4620cbaf9aeb302040ee2a66a352b9fffaa5447c09a249bb22d9d989b7f14
> >       >       >
> >       >
> > 06612a90b8d8bce6bb940fbfd1d50f31398403a2643c73bec336e6fcca46f29f9b6aa87
> >       >       >
> >       >
> > fd11d53ec6f145d61b2a61dffc783ae2b2c66184435d633d0b5a420efa01748e39d687
> >       >       > e1eb9fcc1759c184972779bfc"
> >       >       >
> >       >       > Activating Credential: Pass
> >       >       > #####Recovered Credential=3D"deadbeefdeadbeefdead"
> >       >       >
> >       >       > [root]#
> >       >       >
> >       >       >
> >       >       >
> >       >       > On Wed, Apr 8, 2020 at 7:02 PM Rahul Hardikar
> >       > <rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> >       >       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> > >
> >       > > wrote:
> >       >       >
> >       >       >
> >       >       >       Thanks guys, I'll try this but  i also wanted to
> know if there is a
> > way to
> >       >       > know if the TPM still has the EK and AK keys loaded? I
> have the EK
> >       > handle and AK
> >       >       > handle (not made it persistent) but I want to make sure
> it's
> > present as
> >       > these are
> >       >       > necessary for ActivateCredential to succeed
> >       >       >       ESys_ActivateCredential complaining about secret
> parameter
> >       > doesn't
> >       >       > make sense to me, I tested on server side, ak_name is
> same as
> > that
> >       > sent and so is
> >       >       > EK_PUB object as well as  EK_Cert in nvram, I call the
> same
> >       >       > external_makecredential call that's in the GitHub to
> create secret
> > and
> >       > made sure
> >       >       > secret,credblob matches on the client side when received
> from
> > server.
> >       >       >
> >       >       >       Thanks,
> >       >       >       Rahul
> >       >       >
> >       >       >       On Tue, Mar 17, 2020 at 6:19 AM Imran Desai
> >       > <imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> >       >       > <mailto:imran.desai(a)intel.com <mailto:
> imran.desai(a)intel.com>
> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> >       > wrote:
> >       >       >
> >       >       >
> >       >       >               Set this up with all handles in use made
> persistent. If you
> > still see
> >       >       > issues, gdb-break or turn on debug logging at the Esys
> call and
> > compare
> >       > the
> >       >       > function arguments.
> >       >       >
> > _______________________________________________
> >       >       >               tpm2 mailing list -- tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org> >
> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> >       >       >               To unsubscribe send an email to
> tpm2-leave(a)lists.01.org
> > <mailto:tpm2-leave(a)lists.01.org>
> >       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01=
.org>
> >
> >       >       > <mailto:tpm2-leave(a)lists.01.org <mailto:
> tpm2-leave(a)lists.01.org>
> > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> > >
> >       >       >
>  %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >       >       >
> >       >
> >       >
> >
> >
>
>

--===============2612930674998058530==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PHNwYW4gc3R5bGU9ImNvbG9yOnJnYigwLDAs
MCk7Zm9udC1mYW1pbHk6LXdlYmtpdC1zdGFuZGFyZCI+PGZvbnQgc2l6ZT0iNCI+SGkgQmlsbCw8
L2ZvbnQ+PC9zcGFuPjxkaXYgc3R5bGU9ImNvbG9yOnJnYigwLDAsMCkiPjxmb250IHNpemU9IjQi
PkkgaGF2ZSB0aGlzIG9uIG15IHN5c3RlbTogSXMgdHBtcm0wIHNhbWUgYXMgdGFicm1kPyBJIGJl
bGlldmUgbWluZSBpcyB1c2luZyB0aGlzIHJpZ2h0IG5vdyAsIGkmIzM5O20gY2hhbmdpbmfCoGl0
IHRvIHdoYXQgeW91IG1lbnRpb25lZCDCoHRvIHNlZSBpZiBpdCBoZWxwcy48L2ZvbnQ+PC9kaXY+
PGRpdiBzdHlsZT0iY29sb3I6cmdiKDAsMCwwKSI+PHByZT48Zm9udCBzaXplPSI0Ij5bcm9vdEBu
ZnZpcyB+XSMgbHMgLWwgL2Rldi90cG0qCmNydy1ydy0tLS0uIDEgdHNzIHJvb3QgIDEwLCAgIDIy
NCBBcHIgIDggMjM6MTkgL2Rldi90cG0wCmNydy1ydy0tLS0uIDEgdHNzIHRzcyAgMjU0LCA2NTUz
NiBBcHIgIDggMjM6MTkgL2Rldi90cG1ybTA8L2ZvbnQ+PC9wcmU+PHByZT48Zm9udCBzaXplPSI0
Ij5UaGFua3MsPC9mb250PjwvcHJlPjxwcmU+PGZvbnQgc2l6ZT0iNCI+UmFodWw8L2ZvbnQ+PC9w
cmU+PC9kaXY+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRp
cj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gRnJpLCBBcHIgMTAsIDIwMjAgYXQgMTE6MzMg
QU0gUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVy
dHNAaW50ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8
YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1zdHlsZTpz
b2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgi
Pjxicj4KPGJyPgomZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7IEZyb206
IFJhaHVsIEhhcmRpa2FyIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21h
aWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+XTxicj4K
Jmd0OyBTZW50OiBGcmlkYXksIEFwcmlsIDEwLCAyMDIwIDE6MDggUE08YnI+CiZndDsgVG86IFJv
YmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4m
Z3Q7PGJyPgomZ3Q7IENjOiBEZXNhaSwgSW1yYW4gJmx0OzxhIGhyZWY9Im1haWx0bzppbXJhbi5k
ZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+
Jmd0OzsgPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+
dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFN1YmplY3Q6IFJlOiBbdHBtMl0gUmU6IEVT
eXNfQWN0aXZhdGVDcmVkZW50aWFsPGJyPgomZ3Q7IDxicj4KJmd0OyBUaGFua3MgQmlsbCwgdHJ5
aW5nIHRoYXQuPGJyPgomZ3Q7wqAgSSBkaWQgbm90IGdldCBkZWJ1ZyBidWlsZCB0cG0yX3Rzcywg
aXNuJiMzOTt0IGl0IGFsbCBwcmVidWlsdCA/IEkgd2lsbCBoYXZlIHRvIHNlZSBob3cgdG88YnI+
CiZndDsgZG8gaXQgaW4gcG9reS48YnI+Cjxicj4KSWYgeW91JiMzOTtyZSBnZXR0aW5nIGl0IGZy
b20gYSBwYWNrYWdlIG1hbmFnZXIsIHllcy4gQnV0IHRoZXJlJiMzOTtzIG5vdGhpbmcgc3RvcHBp
bmcgeW91PGJyPgpmcm9tIHVzaW5nIHNvdXJjZSBidWlsZHMuIFNvbWUgZGlzdHJvJiMzOTtzIHdp
bGwgcGFja2FnZSBkZWJ1ZyBzeW1ib2xzIGZvciB0aGVpcjxicj4KcGFja2FnZXMuPGJyPgo8YnI+
CiZndDsgPGJyPgomZ3Q7IE9uIEZyaSwgQXByIDEwLCAyMDIwIGF0IDg6MTYgQU0gUm9iZXJ0cywg
V2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4KJmd0
OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20i
IHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7
IHdyb3RlOjxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+CiZndDvCoCDCoCDC
oCDCoCZndDsgRnJvbTogUmFodWwgSGFyZGlrYXIgW21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFo
dWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWls
LmNvbTwvYT48YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWth
ckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4m
Z3Q7IF08YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgU2VudDogVGh1cnNkYXksIEFwcmlsIDksIDIw
MjAgMjo1MSBQTTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBUbzogUm9iZXJ0cywgV2lsbGlhbSBD
ICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4KJmd0OyAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0i
X2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IENjOiBEZXNhaSwgSW1yYW4gJmx0OzxhIGhyZWY9Im1haWx0bzppbXJh
bi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208
L2E+PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZndDs7
IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJA
bGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0y
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgU3ViamVjdDogUmU6IFt0cG0yXSBSZTogRVN5c19BY3Rp
dmF0ZUNyZWRlbnRpYWw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDsgVGhhbmtzIEJpbGwuIEkgdXNlIHRoaXM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgRXN5
c19Jbml0aWFsaXplKCAmYW1wO2VjdHgsIE5VTEwsIE5VTEwpOzxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBzbyBpJiMzOTttIGFzc3VtaW5nIGl0IHdvdWxk
IHRha2UgdGhlIGRlZmF1bHTCoCBsaWJ0c3MyLXRjdGktdGFicm1kLnNvLjAuPGJyPgomZ3Q7IDxi
cj4KJmd0O8KgIMKgIMKgIMKgVGhpcyBzaG91bGQgZG8gaXQgZm9yIHlvdTo8YnI+CiZndDvCoCDC
oCDCoCDCoFRTUzJfUkM8YnI+CiZndDvCoCDCoCDCoCDCoFRzczJfVGN0aUxkcl9Jbml0aWFsaXpl
IChjb25zdCBjaGFyICpuYW1lQ29uZiw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBUU1MyX1RDVElfQ09OVEVYVCAqKmNvbnRleHQpOzxicj4K
Jmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoFNldCBuYW1lQ29uZiB0byB0aGUgc3RyaW5nICZxdW90
O3RhYnJtZCZxdW90OywgdGhhdCBzaG91bGQgZ2l2ZSB5b3UgYSB0Y3RpIHBvaW50ZXI8YnI+CiZn
dDsgeW91IGNhbjxicj4KJmd0O8KgIMKgIMKgIMKgcGFzcyB3b3QgRXN5c19Jbml0aWFsaXplKCk8
YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IElmIEkgbmVlZCB0byBkZWJ1ZyBFc3lzX0FjdGl2YXRl
Q3JlZGVudGlhbCBtb3JlLCBob3cgY2FuIEkgZG8gaXQsIHRoZXNlPGJyPgomZ3Q7IEFQSXMgYXJl
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG5vIG1vcmUgc3RhbmRhbG9uZSwgSSBoYXZlIGludGVn
cmF0ZWQgaXQgaW4gYSBiaWdnZXIgY29kZSBiYXNlIGFuZDxicj4KJmd0OyBhZGRlZCB0aGU8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDsgZXN5cy10c3MyIGFuZCBvdGhlciBsaWJzIGluIG15IHBva3kg
YnVpbGQsIHNvIG5vdyBpdCBydW5zIGFzIGRpZmZlcmVudDxicj4KJmd0OyBwcm9jZXNzIHRoYXQ8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgaW52b2tlcyB0aGlzIGZ1bmN0aW9uLCBJIGNhbiBnZGIg
aW50byB0aGUgcHJvY2VzcyBidXQgSSBjYW4mIzM5O3Qgc2VlbSB0byBnZGI8YnI+CiZndDsgaW50
bzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBFc3lzX0FjdGl2YXRlLi4oICk8YnI+CiZndDsgPGJy
PgomZ3Q7wqAgwqAgwqAgwqBEaWQgeW91IGJ1aWxkIHRwbTItdHNzIHdpdGggZGVidWcgc3ltYm9s
cz88YnI+CiZndDvCoCDCoCDCoCDCoEFkZCAtLWVuYWJsZS1kZWJ1Zzxicj4KJmd0OyA8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDsgVGhhbmtzLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBSYWh1bDxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBPbiBU
aHUsIEFwciA5LCAyMDIwIGF0IDEwOjIzIEFNIFJvYmVydHMsIFdpbGxpYW0gQzxicj4KJmd0OyAm
bHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2ls
bGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4KJmd0OyAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRh
cmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZn
dDsgd3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEZyb206IFJh
aHVsIEhhcmRpa2FyIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+PGJyPgomZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWls
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0Ozxicj4KJmd0OyBdPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCA5
LCAyMDIwIDExOjE4IEFNPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFRv
OiBEZXNhaSwgSW1yYW4gJmx0OzxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20i
IHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+PGJyPgomZ3Q7ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlA
aW50ZWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IENjOiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0i
X2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4m
Z3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IFN1YmplY3Q6IFt0cG0yXSBSZTogRVN5c19BY3RpdmF0ZUNyZWRlbnRpYWw8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgSG93IGRvIEkga25vdyBpZsKgIFJNIGlzIGJlaW5nIHVzZWQ/PGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqBJZiB5b3Ugc2V0IHRoZSB0Y3RpIHRvIHRoZSBkZXZpY2UgdGN0aSwgaXQg
d2lsbCBvcGVuIC9kZXYvdHBtMCBieTxicj4KJmd0OyBkZWZhdWx0LiBBbmQ8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDsgdGhhdCB3b250PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBC
ZSBhbiBSTS4gWW91IGNhbiBhbHNvIGdpdmUgaXQgYW4gb3B0aW9uLiBFc3lzX0luaXRpYWxpemUo
KSB0YWtlcyBhIHRjdGk8YnI+CiZndDsgYXMgYW48YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgb3B0
aW9uLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgTlVMTCB3aWxsIGNhdXNlIGl0
IHRvIHVzZSB0aGUgZGVmYXVsdCBzZWFyY2ggYmVoYXZpb3Igb2YgdGhlPGJyPgomZ3Q7IFRzczJf
VGN0aUxkciw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgc2VlOjxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9n
aXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItPC9hPjxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0OyB0c3MvYmxvYi9tYXN0ZXIvbWFuLzxhIGhyZWY9Imh0dHA6Ly9Uc3My
X1RjdGlMZHJfSW5pdGlhbGl6ZS4zLmluIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5Uc3MyX1RjdGlMZHJfSW5pdGlhbGl6ZS4zLmluPC9hPjxicj4KJmd0OyAmbHQ7PGEgaHJlZj0i
aHR0cDovL1RzczJfVGN0aUxkcl9Jbml0aWFsaXplLjMuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9Uc3MyX1RjdGlMZHJfSW5pdGlhbGl6ZS4zLmluPC9hPiZndDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHVi
LmNvbS90cG0yLXNvZnR3YXJlL3RwbTItIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLTwvYT48YnI+CiZndDvCoCDC
oCDCoCDCoCZndDsgdHNzL2Jsb2IvbWFzdGVyL21hbi88YSBocmVmPSJodHRwOi8vVHNzMl9UY3Rp
X0RldmljZV9Jbml0LjMuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPlRzczJf
VGN0aV9EZXZpY2VfSW5pdC4zLmluPC9hPjxicj4KJmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL1Rz
czJfVGN0aV9EZXZpY2VfSW5pdC4zLmluIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW48L2E+Jmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29m
dHdhcmUvdHBtMi0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0
aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItPC9hPjxicj4KJmd0OyB0c3MvYmxvYi9tYXN0ZXIv
bWFuL3RzczItPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDxhIGhyZWY9Imh0dHA6Ly90Y3RpLWRl
dmljZS43LmluIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj50Y3RpLWRldmljZS43
LmluPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL3RjdGktZGV2aWNlLjcuaW4iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly90Y3RpLWRldmljZS43LmluPC9hPiZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFlv
dSBjYW4gdXNlIG1hbiBsb2NhbGx5IGlmIHlvdSBwcmVmZXIgYXMgd2VsbDo8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoG1hbiAzIFRzczJfVGN0aUxkcl9Jbml0aWFsaXplPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBtYW4gNyB0c3MyLXRjdGktZGV2aWNlPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBtYW4gMyBUc3MyX1RjdGlfRGV2aWNlX0luaXQ8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oE5vdGUgdGhhdCA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0y
LSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3Rw
bTItc29mdHdhcmUvdHBtMi08L2E+PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRzcy9ibG9iL21h
c3Rlci9tYW4vPGEgaHJlZj0iaHR0cDovL1RzczJfVGN0aV9EZXZpY2VfSW5pdC4zLmluIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMy5pbjwv
YT48YnI+CiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMy5p
biIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL1RzczJfVGN0aV9EZXZp
Y2VfSW5pdC4zLmluPC9hPiZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoEhh
cyBzYW1wbGUgY29kZSBpbiBpdC48YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoElmIHlvdSYjMzk7cmUgdXNpbmcgdGhlIHRvb2xzLCBpdCBz
dXBwb3J0cyBleHBsaWNpdGx5IGNob29zaW5nIHRoZSBUQ1RJOjxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUv
dHBtMi0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNv
bS90cG0yLXNvZnR3YXJlL3RwbTItPC9hPjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyB0b29scy9i
bG9iL21hc3Rlci9tYW4vY29tbW9uL3RjdGkubWQ8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoEFsc28gbm90ZSB0aGF0IHRoZSAvZGV2L3Rw
bXJtMCAoTm90aWNlIHRoZSBSTSkgaXMgYW4gaW4ta2VybmVsPGJyPgomZ3Q7IHJlc291cmNlPGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG1hbmFnZXIuPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IFdoZW4gSSBkbyBFU3lzX0luaXRpYWxpemUsIEkgc2VlIHRoZXNlIFdBUk5JTkdzLCB3b25k
ZXJpbmcgaWYgaXQmIzM5O3M8YnI+CiZndDsgb2theTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBm
b3IgbXVsdGktPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRocmVhZDxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBXQVJOSU5HOmVzeXM6c3JjL3Rz
czItPGJyPgomZ3Q7IGVzeXMvZXN5c190Y3RpX2RlZmF1bHQuYzoxMzc6dGN0aV9mcm9tX2ZpbGUo
KTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBDb3VsZCBub3Q8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgbG9hZCBUQ1RJIGZpbGU6IGxpYnRzczItdGN0aS1kZWZhdWx0LnNv
ICZsdDs8YSBocmVmPSJodHRwOi8vbGlidHNzMi10Y3RpLSIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYnRzczItdGN0aS08L2E+PGJyPgomZ3Q7IDxhIGhyZWY9Imh0
dHA6Ly9kZWZhdWx0LnNvLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+ZGVmYXVs
dC5zby88L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBsaWJ0c3MyLXRjdGktPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGRlZmF1bHQuc28gJmx0OzxhIGhyZWY9
Imh0dHA6Ly9saWJ0c3MyLXRjdGktZGVmYXVsdC5zby8iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9saWJ0c3MyLXRjdGktZGVmYXVsdC5zby88L2E+Jmd0Ozxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBXQVJOSU5HOmVzeXM6c3JjL3RzczItPGJy
PgomZ3Q7IGVzeXMvZXN5c190Y3RpX2RlZmF1bHQuYzoxMzc6dGN0aV9mcm9tX2ZpbGUoKTxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0OyBDb3VsZCBub3Q8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgbG9hZCBUQ1RJIGZpbGU6IGxpYnRzczItdGN0aS10YWJybWQuc28gJmx0Ozxh
IGhyZWY9Imh0dHA6Ly9saWJ0c3MyLXRjdGktIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGlidHNzMi10Y3RpLTwvYT48YnI+CiZndDsgPGEgaHJlZj0iaHR0cDovL3Rh
YnJtZC5zby8iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnRhYnJtZC5zby88L2E+
Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBJbiBteSBzaW5nbGUgdGhyZWFkZWQgcHJvY2Vzcywg
ZXZlcnl0aGluZyB3b3JrcyBzbyBzbW9vdGhseTxicj4KJmd0OyBbcm9vdF0jPGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IC4vdHBtPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IFdBUk5JTkc6ZXN5czpzcmMvdHNzMi08YnI+CiZndDsgZXN5cy9lc3lzX3RjdGlfZGVmYXVsdC5j
OjEzNzp0Y3RpX2Zyb21fZmlsZSgpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IENvdWxkIG5vdDxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBsb2FkIFRDVEkgZmlsZTogbGli
dHNzMi10Y3RpLWRlZmF1bHQuc28gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0c3MyLXRjdGktIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlidHNzMi10Y3RpLTwvYT48
YnI+CiZndDsgPGEgaHJlZj0iaHR0cDovL2RlZmF1bHQuc28vIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5kZWZhdWx0LnNvLzwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IFdBUk5JTkc6ZXN5czpzcmMvdHNzMi08YnI+CiZndDsgZXN5cy9lc3lz
X3RjdGlfZGVmYXVsdC5jOjEzNzp0Y3RpX2Zyb21fZmlsZSgpPGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IENvdWxkIG5vdDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBsb2Fk
IFRDVEkgZmlsZTogbGlidHNzMi10Y3RpLXRhYnJtZC5zbyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xp
YnRzczItdGN0aS0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0
c3MyLXRjdGktPC9hPjxicj4KJmd0OyA8YSBocmVmPSJodHRwOi8vdGFicm1kLnNvLyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dGFicm1kLnNvLzwvYT4mZ3Q7PGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IEVTWVM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
SW5pdGlhbGl6YXRpb246IFBhc3M8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgUmVhZCBUUE0gRUsgQ2Vy
dGlmaWNhdGU6IFBhc3M8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgVFBNIEVLIENlcnRpZmljYXRlIFJv
b3QtQ0EgVmVyaWZpY2F0aW9uOiBQYXNzPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IENsZWFyIFRQTSBT
dGF0ZTogUGFzczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBDcmVhdGVkIEVLIFByaW1hcnkgb2JqZWN0
OiBQYXNzPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICMjIyMjSGFuZGxl
IDB4NDE4MzY4PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IENyZWF0ZSBBdHRlc3RhdGlvbiBLZXk6IFBh
c3M8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgIyMjIyNBa19IYW5kbGUg
MHg0MTgzNmI8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgT3JpZ2luYWwgQ3JlZGVudGlhbD0mcXVvdDtk
ZWFkYmVlZmRlYWRiZWVmZGVhZCZxdW90Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBNYWtlIENyZWRl
bnRpYWw6IFBhc3M8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgIyMjIyNF
bmNyeXB0ZWQgQ3JlZGVudGlhbDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0OyBCbG9iPSZxdW90OzAwMjA1MDhlNDM5
YmM2NTEyZDA0NGJiODczOWU4ZDYxYzhjZTM2NjRkMjVmMzU3MjM4OWI0NmM4Nzk3ZTU2MmE8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgNDVjNDEyODY0ZjAyMGE3ZjFiYmNh
YjdhMzRmMCZxdW90Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjIyMjI0VuY3J5cHRlZDxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4KJmd0OyBTZWNyZXQ9JnF1b3Q7YjcwNjg5YmIwZWQ5ZmE4MzI0Y2ZhMDNkNzI3ZTZjNjc5NTA2
OWI0ZjA5NDMxMDg0MDliODkwMDliOWNjNzZjPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IDc2YmRkYjMxYTVjY2Yz
NGNmZWJjNWQzZmU3MTU4OTliYjcyNWE4YTNjOGZlNGE2MDQ2MjMzODY5MTIzZjNlOTc4MDUxYWVj
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPgomZ3Q7IGUwZDdhZjBhZDZmODUxNjRhMzJmZDJjNWFkNzU2ZThjM2I3MmY2MzEx
MTI2ZGU3OWEzMGMwZDcyYWEwYTZmM2Y0MzdmNmJjPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IDA3N2M0MWQzY2M2
NDUwYzcxZTgwM2NhNjA3NGQzNGNlM2RlYmY1MTE0ZjRiYWMyZmQ3ZWU2YTg3ZWY5ZjA3ZDgzMDc5
NDc3PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPgomZ3Q7IDVkZGE0Zjc3ZTQ2MjBjYmFmOWFlYjMwMjA0MGVlMmE2NmEzNTJi
OWZmZmFhNTQ0N2MwOWEyNDliYjIyZDlkOTg5YjdmMTQ8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgMDY2MTJhOTBi
OGQ4YmNlNmJiOTQwZmJmZDFkNTBmMzEzOTg0MDNhMjY0M2M3M2JlYzMzNmU2ZmNjYTQ2ZjI5Zjli
NmFhODc8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDs8YnI+CiZndDsgZmQxMWQ1M2VjNmYxNDVkNjFiMmE2MWRmZmM3ODNhZTJiMmM2
NjE4NDQzNWQ2MzNkMGI1YTQyMGVmYTAxNzQ4ZTM5ZDY4Nzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyBlMWViOWZjYzE3NTljMTg0OTcyNzc5YmZjJnF1b3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IEFjdGl2YXRpbmcgQ3JlZGVudGlhbDogUGFzczxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjIyMjI1JlY292ZXJlZCBDcmVkZW50aWFsPSZxdW90O2Rl
YWRiZWVmZGVhZGJlZWZkZWFkJnF1b3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFtyb290XSM8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgT24gV2VkLCBBcHIgOCwgMjAy
MCBhdCA3OjAyIFBNIFJhaHVsIEhhcmRpa2FyPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDs8
YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5y
YWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFo
dWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWls
LmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFy
ZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208
L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyAmZ3Q7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWth
ckBnbWFpbC5jb208L2E+PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVs
aGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5j
b208L2E+Jmd0O8KgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21h
aWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+PGJyPgom
Z3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmd0OyB3cm90ZTo8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFRoYW5rcyBn
dXlzLCBJJiMzOTtsbCB0cnkgdGhpcyBidXTCoCBpIGFsc28gd2FudGVkIHRvIGtub3cgaWYgdGhl
cmUgaXMgYTxicj4KJmd0OyB3YXkgdG88YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsga25vdyBpZiB0aGUgVFBNIHN0aWxsIGhhcyB0aGUgRUsgYW5kIEFLIGtleXMgbG9hZGVk
PyBJIGhhdmUgdGhlIEVLPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGhhbmRsZSBhbmQgQUs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgaGFuZGxlIChub3QgbWFkZSBpdCBw
ZXJzaXN0ZW50KSBidXQgSSB3YW50IHRvIG1ha2Ugc3VyZSBpdCYjMzk7czxicj4KJmd0OyBwcmVz
ZW50IGFzPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRoZXNlIGFyZTxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBuZWNlc3NhcnkgZm9yIEFjdGl2YXRlQ3JlZGVudGlhbCB0
byBzdWNjZWVkPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqBFU3lzX0FjdGl2YXRlQ3JlZGVudGlhbCBjb21wbGFpbmluZyBhYm91dCBzZWNyZXQgcGFyYW1l
dGVyPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGRvZXNuJiMzOTt0PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG1ha2Ugc2Vuc2UgdG8gbWUsIEkgdGVzdGVkIG9uIHNlcnZl
ciBzaWRlLCBha19uYW1lIGlzIHNhbWUgYXM8YnI+CiZndDsgdGhhdDxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0OyBzZW50IGFuZCBzbyBpczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyBFS19QVUIgb2JqZWN0IGFzIHdlbGwgYXPCoCBFS19DZXJ0IGluIG52cmFtLCBJIGNhbGwg
dGhlIHNhbWU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgZXh0ZXJuYWxf
bWFrZWNyZWRlbnRpYWwgY2FsbCB0aGF0JiMzOTtzIGluIHRoZSBHaXRIdWIgdG8gY3JlYXRlIHNl
Y3JldDxicj4KJmd0OyBhbmQ8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgbWFkZSBzdXJlPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHNlY3JldCxjcmVkYmxvYiBtYXRjaGVz
IG9uIHRoZSBjbGllbnQgc2lkZSB3aGVuIHJlY2VpdmVkIGZyb208YnI+CiZndDsgc2VydmVyLjxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVGhhbmtzLDxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgUmFodWw8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoE9uIFR1ZSwgTWFyIDE3LCAyMDIwIGF0IDY6MTkgQU0gSW1yYW4gRGVzYWk8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRl
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRl
c2FpQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlA
aW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsg
Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJh
bi5kZXNhaUBpbnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRl
c2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4m
Z3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4gJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDsgd3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBTZXQgdGhpcyB1cCB3
aXRoIGFsbCBoYW5kbGVzIGluIHVzZSBtYWRlIHBlcnNpc3RlbnQuIElmIHlvdTxicj4KJmd0OyBz
dGlsbCBzZWU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgaXNzdWVzLCBn
ZGItYnJlYWsgb3IgdHVybiBvbiBkZWJ1ZyBsb2dnaW5nIGF0IHRoZSBFc3lzIGNhbGwgYW5kPGJy
PgomZ3Q7IGNvbXBhcmU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgdGhlPGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGZ1bmN0aW9uIGFyZ3VtZW50cy48YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhy
ZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMu
MDEub3JnPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDvCoCAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
PnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9h
PiZndDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3Jn
PC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0
PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZndDsgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxp
c3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5v
cmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7ICZndDsgJmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1s
ZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9y
ZzwvYT48YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0
cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTIt
bGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5v
cmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2
ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVA
bGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+
Jmd0Ozxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJf
YmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAlKHdl
Yl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgo8YnI+CjwvYmxv
Y2txdW90ZT48L2Rpdj4K

--===============2612930674998058530==--

