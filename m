Content-Type: multipart/mixed; boundary="===============2010201662229250608=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Fri, 10 Apr 2020 11:07:36 -0700
Message-ID: <CAP3jAwTxDFnLqh2J-gugTK-B0dH+vaJ7BVnZ3Mx97GedtwwHMA@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EBC1A8@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2010201662229250608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Bill, trying that.
 I did not get debug build tpm2_tss, isn't it all prebuilt ? I will have to
see how to do it in poky.

On Fri, Apr 10, 2020 at 8:16 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

>
>
> > -----Original Message-----
> > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
> > Sent: Thursday, April 9, 2020 2:51 PM
> > To: Roberts, William C <william.c.roberts(a)intel.com>
> > Cc: Desai, Imran <imran.desai(a)intel.com>; tpm2(a)lists.01.org
> > Subject: Re: [tpm2] Re: ESys_ActivateCredential
> >
> > Thanks Bill. I use this
> > Esys_Initialize( &ectx, NULL, NULL);
> >
> > so i'm assuming it would take the default  libtss2-tcti-tabrmd.so.0.
>
> This should do it for you:
> TSS2_RC
> Tss2_TctiLdr_Initialize (const char *nameConf,
>                          TSS2_TCTI_CONTEXT **context);
>
> Set nameConf to the string "tabrmd", that should give you a tcti pointer
> you can
> pass wot Esys_Initialize()
>
> >
> >
> > If I need to debug Esys_ActivateCredential more, how can I do it, these
> APIs are
> > no more standalone, I have integrated it in a bigger code base and added
> the
> > esys-tss2 and other libs in my poky build, so now it runs as different
> process that
> > invokes this function, I can gdb into the process but I can't seem to
> gdb into
> > Esys_Activate..( )
>
> Did you build tpm2-tss with debug symbols?
> Add --enable-debug
>
> >
> >
> > Thanks,
> > Rahul
> >
> >
> >
> >
> > On Thu, Apr 9, 2020 at 10:23 AM Roberts, William C <
> william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > wrote:
> >
> >
> >       > -----Original Message-----
> >       > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> ]
> >       > Sent: Thursday, April 9, 2020 11:18 AM
> >       > To: Desai, Imran <imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> >
> >       > Cc: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> >       > Subject: [tpm2] Re: ESys_ActivateCredential
> >       >
> >       > How do I know if  RM is being used?
> >
> >
> >       If you set the tcti to the device tcti, it will open /dev/tpm0 by
> default. And
> > that wont
> >       Be an RM. You can also give it an option. Esys_Initialize() takes
> a tcti as an
> > option,
> >       NULL will cause it to use the default search behavior of the
> Tss2_TctiLdr,
> > see:
> >
> >       https://github.com/tpm2-software/tpm2-
> > tss/blob/master/man/Tss2_TctiLdr_Initialize.3.in
> >       https://github.com/tpm2-software/tpm2-
> > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> >       https://github.com/tpm2-software/tpm2-tss/blob/master/man/tss2-
> > tcti-device.7.in
> >
> >       You can use man locally if you prefer as well:
> >       man 3 Tss2_TctiLdr_Initialize
> >       man 7 tss2-tcti-device
> >       man 3 Tss2_Tcti_Device_Init
> >
> >       Note that https://github.com/tpm2-software/tpm2-
> > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> >       Has sample code in it.
> >
> >       If you're using the tools, it supports explicitly choosing the
> TCTI:
> >       https://github.com/tpm2-software/tpm2-
> > tools/blob/master/man/common/tcti.md
> >
> >       Also note that the /dev/tpmrm0 (Notice the RM) is an in-kernel
> resource
> > manager.
> >
> >
> >       > When I do ESys_Initialize, I see these WARNINGs, wondering if
> it's okay
> > for multi-
> >       > thread
> >       >
> WARNING:esys:src/tss2-esys/esys_tcti_default.c:137:tcti_from_file()
> > Could not
> >       > load TCTI file: libtss2-tcti-default.so <
> http://libtss2-tcti-default.so/>
> > libtss2-tcti-
> >       > default.so <http://libtss2-tcti-default.so/>
> >       >
> WARNING:esys:src/tss2-esys/esys_tcti_default.c:137:tcti_from_file()
> > Could not
> >       > load TCTI file: libtss2-tcti-tabrmd.so <
> http://libtss2-tcti-tabrmd.so/>
> >       >
> >       > In my single threaded process, everything works so smoothly
> [root]#
> > ./tpm
> >       >
> WARNING:esys:src/tss2-esys/esys_tcti_default.c:137:tcti_from_file()
> > Could not
> >       > load TCTI file: libtss2-tcti-default.so <
> http://libtss2-tcti-default.so/>
> >       >
> WARNING:esys:src/tss2-esys/esys_tcti_default.c:137:tcti_from_file()
> > Could not
> >       > load TCTI file: libtss2-tcti-tabrmd.so <
> http://libtss2-tcti-tabrmd.so/>
> > ESYS
> >       > Initialization: Pass
> >       >
> >       > Read TPM EK Certificate: Pass
> >       >
> >       > TPM EK Certificate Root-CA Verification: Pass
> >       >
> >       > Clear TPM State: Pass
> >       >
> >       > Created EK Primary object: Pass
> >       > #####Handle 0x418368
> >       >
> >       > Create Attestation Key: Pass
> >       > #####Ak_Handle 0x41836b
> >       >
> >       > Original Credential=3D"deadbeefdeadbeefdead"
> >       >
> >       > Make Credential: Pass
> >       > #####Encrypted Credential
> >       >
> > Blob=3D"0020508e439bc6512d044bb8739e8d61c8ce3664d25f3572389b46c8797e562a
> >       > 45c412864f020a7f1bbcab7a34f0"
> >       >
> >       > #####Encrypted
> >       >
> > Secret=3D"b70689bb0ed9fa8324cfa03d727e6c6795069b4f0943108409b89009b9cc7=
6c
> >       >
> > 76bddb31a5ccf34cfebc5d3fe715899bb725a8a3c8fe4a6046233869123f3e978051aec
> >       >
> > e0d7af0ad6f85164a32fd2c5ad756e8c3b72f6311126de79a30c0d72aa0a6f3f437f6bc
> >       >
> > 077c41d3cc6450c71e803ca6074d34ce3debf5114f4bac2fd7ee6a87ef9f07d83079477
> >       >
> > 5dda4f77e4620cbaf9aeb302040ee2a66a352b9fffaa5447c09a249bb22d9d989b7f14
> >       >
> > 06612a90b8d8bce6bb940fbfd1d50f31398403a2643c73bec336e6fcca46f29f9b6aa87
> >       >
> > fd11d53ec6f145d61b2a61dffc783ae2b2c66184435d633d0b5a420efa01748e39d687
> >       > e1eb9fcc1759c184972779bfc"
> >       >
> >       > Activating Credential: Pass
> >       > #####Recovered Credential=3D"deadbeefdeadbeefdead"
> >       >
> >       > [root]#
> >       >
> >       >
> >       >
> >       > On Wed, Apr 8, 2020 at 7:02 PM Rahul Hardikar
> > <rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> >       > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail=
.com>
> >
> > > wrote:
> >       >
> >       >
> >       >       Thanks guys, I'll try this but  i also wanted to know if
> there is a way to
> >       > know if the TPM still has the EK and AK keys loaded? I have the
> EK
> > handle and AK
> >       > handle (not made it persistent) but I want to make sure it's
> present as
> > these are
> >       > necessary for ActivateCredential to succeed
> >       >       ESys_ActivateCredential complaining about secret parameter
> > doesn't
> >       > make sense to me, I tested on server side, ak_name is same as
> that
> > sent and so is
> >       > EK_PUB object as well as  EK_Cert in nvram, I call the same
> >       > external_makecredential call that's in the GitHub to create
> secret and
> > made sure
> >       > secret,credblob matches on the client side when received from
> server.
> >       >
> >       >       Thanks,
> >       >       Rahul
> >       >
> >       >       On Tue, Mar 17, 2020 at 6:19 AM Imran Desai
> > <imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com=
> > >
> > wrote:
> >       >
> >       >
> >       >               Set this up with all handles in use made
> persistent. If you still see
> >       > issues, gdb-break or turn on debug logging at the Esys call and
> compare
> > the
> >       > function arguments.
> >       >               _______________________________________________
> >       >               tpm2 mailing list -- tpm2(a)lists.01.org <mailto:
> tpm2(a)lists.01.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> >       >               To unsubscribe send an email to
> tpm2-leave(a)lists.01.org
> > <mailto:tpm2-leave(a)lists.01.org>
> >       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01=
.org>
> >
> >       >
>  %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >       >
> >
> >
>
>

--===============2010201662229250608==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzIEJpbGwsIHRyeWluZyB0aGF0LjxkaXY+wqBJIGRpZCBub3Qg
Z2V0IGRlYnVnIGJ1aWxkIHRwbTJfdHNzLCBpc24mIzM5O3QgaXQgYWxsIHByZWJ1aWx0ID8gSSB3
aWxsIGhhdmUgdG8gc2VlIGhvdyB0byBkbyBpdCBpbiBwb2t5LjwvZGl2PjwvZGl2Pjxicj48ZGl2
IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9u
IEZyaSwgQXByIDEwLCAyMDIwIGF0IDg6MTYgQU0gUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBo
cmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0
c0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdp
ZHRoOjFweDtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0
LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxicj4KPGJyPgomZ3Q7IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tPGJyPgomZ3Q7IEZyb206IFJhaHVsIEhhcmRpa2FyIFttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxo
YXJkaWthckBnbWFpbC5jb208L2E+XTxicj4KJmd0OyBTZW50OiBUaHVyc2RheSwgQXByaWwgOSwg
MjAyMCAyOjUxIFBNPGJyPgomZ3Q7IFRvOiBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9
Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxs
aWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0Ozxicj4KJmd0OyBDYzogRGVzYWksIEltcmFu
ICZsdDs8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDs7IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxp
c3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0
OyBTdWJqZWN0OiBSZTogW3RwbTJdIFJlOiBFU3lzX0FjdGl2YXRlQ3JlZGVudGlhbDxicj4KJmd0
OyA8YnI+CiZndDsgVGhhbmtzIEJpbGwuIEkgdXNlIHRoaXM8YnI+CiZndDsgRXN5c19Jbml0aWFs
aXplKCAmYW1wO2VjdHgsIE5VTEwsIE5VTEwpOzxicj4KJmd0OyA8YnI+CiZndDsgc28gaSYjMzk7
bSBhc3N1bWluZyBpdCB3b3VsZCB0YWtlIHRoZSBkZWZhdWx0wqAgbGlidHNzMi10Y3RpLXRhYnJt
ZC5zby4wLjxicj4KPGJyPgpUaGlzIHNob3VsZCBkbyBpdCBmb3IgeW91Ojxicj4KVFNTMl9SQzxi
cj4KVHNzMl9UY3RpTGRyX0luaXRpYWxpemUgKGNvbnN0IGNoYXIgKm5hbWVDb25mLDxicj4KwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBUU1MyX1RDVElfQ09OVEVYVCAqKmNv
bnRleHQpOzxicj4KPGJyPgpTZXQgbmFtZUNvbmYgdG8gdGhlIHN0cmluZyAmcXVvdDt0YWJybWQm
cXVvdDssIHRoYXQgc2hvdWxkIGdpdmUgeW91IGEgdGN0aSBwb2ludGVyIHlvdSBjYW48YnI+CnBh
c3Mgd290IEVzeXNfSW5pdGlhbGl6ZSgpPGJyPgo8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0
OyBJZiBJIG5lZWQgdG8gZGVidWcgRXN5c19BY3RpdmF0ZUNyZWRlbnRpYWwgbW9yZSwgaG93IGNh
biBJIGRvIGl0LCB0aGVzZSBBUElzIGFyZTxicj4KJmd0OyBubyBtb3JlIHN0YW5kYWxvbmUsIEkg
aGF2ZSBpbnRlZ3JhdGVkIGl0IGluIGEgYmlnZ2VyIGNvZGUgYmFzZSBhbmQgYWRkZWQgdGhlPGJy
PgomZ3Q7IGVzeXMtdHNzMiBhbmQgb3RoZXIgbGlicyBpbiBteSBwb2t5IGJ1aWxkLCBzbyBub3cg
aXQgcnVucyBhcyBkaWZmZXJlbnQgcHJvY2VzcyB0aGF0PGJyPgomZ3Q7IGludm9rZXMgdGhpcyBm
dW5jdGlvbiwgSSBjYW4gZ2RiIGludG8gdGhlIHByb2Nlc3MgYnV0IEkgY2FuJiMzOTt0IHNlZW0g
dG8gZ2RiIGludG88YnI+CiZndDsgRXN5c19BY3RpdmF0ZS4uKCApPGJyPgo8YnI+CkRpZCB5b3Ug
YnVpbGQgdHBtMi10c3Mgd2l0aCBkZWJ1ZyBzeW1ib2xzPzxicj4KQWRkIC0tZW5hYmxlLWRlYnVn
PGJyPgo8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBUaGFua3MsPGJyPgomZ3Q7IFJhaHVs
PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBPbiBUaHUs
IEFwciA5LCAyMDIwIGF0IDEwOjIzIEFNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0i
bWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxp
YW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlh
bS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0OyB3cm90ZTo8YnI+CiZndDsgPGJyPgom
Z3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBGcm9tOiBSYWh1bCBIYXJkaWthciBbbWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVs
aGFyZGlrYXJAZ21haWwuY29tPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJA
Z21haWwuY29tPC9hPiZndDsgXTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBTZW50OiBUaHVyc2Rh
eSwgQXByaWwgOSwgMjAyMCAxMToxOCBBTTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBUbzogRGVz
YWksIEltcmFuICZsdDs8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5p
bXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IENjOiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50
cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0
cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IFN1YmplY3Q6IFt0cG0yXSBSZTogRVN5c19BY3RpdmF0ZUNyZWRl
bnRpYWw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgSG93
IGRvIEkga25vdyBpZsKgIFJNIGlzIGJlaW5nIHVzZWQ/PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+
CiZndDvCoCDCoCDCoCDCoElmIHlvdSBzZXQgdGhlIHRjdGkgdG8gdGhlIGRldmljZSB0Y3RpLCBp
dCB3aWxsIG9wZW4gL2Rldi90cG0wIGJ5IGRlZmF1bHQuIEFuZDxicj4KJmd0OyB0aGF0IHdvbnQ8
YnI+CiZndDvCoCDCoCDCoCDCoEJlIGFuIFJNLiBZb3UgY2FuIGFsc28gZ2l2ZSBpdCBhbiBvcHRp
b24uIEVzeXNfSW5pdGlhbGl6ZSgpIHRha2VzIGEgdGN0aSBhcyBhbjxicj4KJmd0OyBvcHRpb24s
PGJyPgomZ3Q7wqAgwqAgwqAgwqBOVUxMIHdpbGwgY2F1c2UgaXQgdG8gdXNlIHRoZSBkZWZhdWx0
IHNlYXJjaCBiZWhhdmlvciBvZiB0aGUgVHNzMl9UY3RpTGRyLDxicj4KJmd0OyBzZWU6PGJyPgom
Z3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTIt
c29mdHdhcmUvdHBtMi0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
Z2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItPC9hPjxicj4KJmd0OyB0c3MvYmxvYi9tYXN0
ZXIvbWFuLzxhIGhyZWY9Imh0dHA6Ly9Uc3MyX1RjdGlMZHJfSW5pdGlhbGl6ZS4zLmluIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5Uc3MyX1RjdGlMZHJfSW5pdGlhbGl6ZS4zLmlu
PC9hPjxicj4KJmd0O8KgIMKgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTIt
c29mdHdhcmUvdHBtMi0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
Z2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItPC9hPjxicj4KJmd0OyB0c3MvYmxvYi9tYXN0
ZXIvbWFuLzxhIGhyZWY9Imh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMy5pbiIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+VHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW48L2E+
PGJyPgomZ3Q7wqAgwqAgwqAgwqA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0
d2FyZS90cG0yLXRzcy9ibG9iL21hc3Rlci9tYW4vdHNzMi0iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzL2Js
b2IvbWFzdGVyL21hbi90c3MyLTwvYT48YnI+CiZndDsgPGEgaHJlZj0iaHR0cDovL3RjdGktZGV2
aWNlLjcuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnRjdGktZGV2aWNlLjcu
aW48L2E+PGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgWW91IGNhbiB1c2UgbWFuIGxvY2Fs
bHkgaWYgeW91IHByZWZlciBhcyB3ZWxsOjxicj4KJmd0O8KgIMKgIMKgIMKgbWFuIDMgVHNzMl9U
Y3RpTGRyX0luaXRpYWxpemU8YnI+CiZndDvCoCDCoCDCoCDCoG1hbiA3IHRzczItdGN0aS1kZXZp
Y2U8YnI+CiZndDvCoCDCoCDCoCDCoG1hbiAzIFRzczJfVGN0aV9EZXZpY2VfSW5pdDxicj4KJmd0
OyA8YnI+CiZndDvCoCDCoCDCoCDCoE5vdGUgdGhhdCA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5j
b20vdHBtMi1zb2Z0d2FyZS90cG0yLSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi08L2E+PGJyPgomZ3Q7IHRzcy9i
bG9iL21hc3Rlci9tYW4vPGEgaHJlZj0iaHR0cDovL1RzczJfVGN0aV9EZXZpY2VfSW5pdC4zLmlu
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5Uc3MyX1RjdGlfRGV2aWNlX0luaXQu
My5pbjwvYT48YnI+CiZndDvCoCDCoCDCoCDCoEhhcyBzYW1wbGUgY29kZSBpbiBpdC48YnI+CiZn
dDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBJZiB5b3UmIzM5O3JlIHVzaW5nIHRoZSB0b29scywgaXQg
c3VwcG9ydHMgZXhwbGljaXRseSBjaG9vc2luZyB0aGUgVENUSTo8YnI+CiZndDvCoCDCoCDCoCDC
oDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2Fy
ZS90cG0yLTwvYT48YnI+CiZndDsgdG9vbHMvYmxvYi9tYXN0ZXIvbWFuL2NvbW1vbi90Y3RpLm1k
PGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgQWxzbyBub3RlIHRoYXQgdGhlIC9kZXYvdHBt
cm0wIChOb3RpY2UgdGhlIFJNKSBpcyBhbiBpbi1rZXJuZWwgcmVzb3VyY2U8YnI+CiZndDsgbWFu
YWdlci48YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBXaGVuIEkg
ZG8gRVN5c19Jbml0aWFsaXplLCBJIHNlZSB0aGVzZSBXQVJOSU5Hcywgd29uZGVyaW5nIGlmIGl0
JiMzOTtzIG9rYXk8YnI+CiZndDsgZm9yIG11bHRpLTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyB0
aHJlYWQ8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgV0FSTklORzplc3lzOnNyYy90c3MyLWVzeXMv
ZXN5c190Y3RpX2RlZmF1bHQuYzoxMzc6dGN0aV9mcm9tX2ZpbGUoKTxicj4KJmd0OyBDb3VsZCBu
b3Q8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgbG9hZCBUQ1RJIGZpbGU6IGxpYnRzczItdGN0aS1k
ZWZhdWx0LnNvICZsdDs8YSBocmVmPSJodHRwOi8vbGlidHNzMi10Y3RpLWRlZmF1bHQuc28vIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlidHNzMi10Y3RpLWRlZmF1
bHQuc28vPC9hPiZndDs8YnI+CiZndDsgbGlidHNzMi10Y3RpLTxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0OyBkZWZhdWx0LnNvICZsdDs8YSBocmVmPSJodHRwOi8vbGlidHNzMi10Y3RpLWRlZmF1bHQu
c28vIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlidHNzMi10Y3Rp
LWRlZmF1bHQuc28vPC9hPiZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgV0FSTklORzplc3lz
OnNyYy90c3MyLWVzeXMvZXN5c190Y3RpX2RlZmF1bHQuYzoxMzc6dGN0aV9mcm9tX2ZpbGUoKTxi
cj4KJmd0OyBDb3VsZCBub3Q8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgbG9hZCBUQ1RJIGZpbGU6
IGxpYnRzczItdGN0aS10YWJybWQuc28gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0c3MyLXRjdGkt
dGFicm1kLnNvLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnRz
czItdGN0aS10YWJybWQuc28vPC9hPiZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDsgSW4gbXkgc2luZ2xlIHRocmVhZGVkIHByb2Nlc3MsIGV2ZXJ5dGhp
bmcgd29ya3Mgc28gc21vb3RobHkgW3Jvb3RdIzxicj4KJmd0OyAuL3RwbTxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0OyBXQVJOSU5HOmVzeXM6c3JjL3RzczItZXN5cy9lc3lzX3RjdGlfZGVmYXVsdC5j
OjEzNzp0Y3RpX2Zyb21fZmlsZSgpPGJyPgomZ3Q7IENvdWxkIG5vdDxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0OyBsb2FkIFRDVEkgZmlsZTogbGlidHNzMi10Y3RpLWRlZmF1bHQuc28gJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJ0c3MyLXRjdGktZGVmYXVsdC5zby8iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0c3MyLXRjdGktZGVmYXVsdC5zby88L2E+Jmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0OyBXQVJOSU5HOmVzeXM6c3JjL3RzczItZXN5cy9lc3lzX3RjdGlf
ZGVmYXVsdC5jOjEzNzp0Y3RpX2Zyb21fZmlsZSgpPGJyPgomZ3Q7IENvdWxkIG5vdDxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0OyBsb2FkIFRDVEkgZmlsZTogbGlidHNzMi10Y3RpLXRhYnJtZC5zbyAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYnRzczItdGN0aS10YWJybWQuc28vIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlidHNzMi10Y3RpLXRhYnJtZC5zby88L2E+Jmd0
Ozxicj4KJmd0OyBFU1lTPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEluaXRpYWxpemF0aW9uOiBQ
YXNzPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFJlYWQg
VFBNIEVLIENlcnRpZmljYXRlOiBQYXNzPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IFRQTSBFSyBDZXJ0aWZpY2F0ZSBSb290LUNBIFZlcmlmaWNhdGlvbjog
UGFzczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBDbGVh
ciBUUE0gU3RhdGU6IFBhc3M8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDsgQ3JlYXRlZCBFSyBQcmltYXJ5IG9iamVjdDogUGFzczxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0OyAjIyMjI0hhbmRsZSAweDQxODM2ODxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0OyBDcmVhdGUgQXR0ZXN0YXRpb24gS2V5OiBQYXNzPGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7ICMjIyMjQWtfSGFuZGxlIDB4NDE4MzZiPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE9yaWdpbmFsIENyZWRlbnRpYWw9JnF1b3Q7
ZGVhZGJlZWZkZWFkYmVlZmRlYWQmcXVvdDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDsgTWFrZSBDcmVkZW50aWFsOiBQYXNzPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7ICMjIyMjRW5jcnlwdGVkIENyZWRlbnRpYWw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8
YnI+CiZndDsgQmxvYj0mcXVvdDswMDIwNTA4ZTQzOWJjNjUxMmQwNDRiYjg3MzllOGQ2MWM4Y2Uz
NjY0ZDI1ZjM1NzIzODliNDZjODc5N2U1NjJhPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDQ1YzQx
Mjg2NGYwMjBhN2YxYmJjYWI3YTM0ZjAmcXVvdDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDsgIyMjIyNFbmNyeXB0ZWQ8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+CiZndDsgU2VjcmV0PSZxdW90O2I3MDY4OWJiMGVkOWZhODMyNGNmYTAzZDcyN2U2YzY3
OTUwNjliNGYwOTQzMTA4NDA5Yjg5MDA5YjljYzc2Yzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4KJmd0OyA3NmJkZGIzMWE1Y2NmMzRjZmViYzVkM2ZlNzE1ODk5YmI3MjVhOGEzYzhmZTRhNjA0
NjIzMzg2OTEyM2YzZTk3ODA1MWFlYzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0OyBl
MGQ3YWYwYWQ2Zjg1MTY0YTMyZmQyYzVhZDc1NmU4YzNiNzJmNjMxMTEyNmRlNzlhMzBjMGQ3MmFh
MGE2ZjNmNDM3ZjZiYzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0OyAwNzdjNDFkM2Nj
NjQ1MGM3MWU4MDNjYTYwNzRkMzRjZTNkZWJmNTExNGY0YmFjMmZkN2VlNmE4N2VmOWYwN2Q4MzA3
OTQ3Nzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0OyA1ZGRhNGY3N2U0NjIwY2JhZjlh
ZWIzMDIwNDBlZTJhNjZhMzUyYjlmZmZhYTU0NDdjMDlhMjQ5YmIyMmQ5ZDk4OWI3ZjE0PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IDA2NjEyYTkwYjhkOGJjZTZiYjk0MGZiZmQxZDUw
ZjMxMzk4NDAzYTI2NDNjNzNiZWMzMzZlNmZjY2E0NmYyOWY5YjZhYTg3PGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPgomZ3Q7IGZkMTFkNTNlYzZmMTQ1ZDYxYjJhNjFkZmZjNzgzYWUyYjJjNjYx
ODQ0MzVkNjMzZDBiNWE0MjBlZmEwMTc0OGUzOWQ2ODc8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsg
ZTFlYjlmY2MxNzU5YzE4NDk3Mjc3OWJmYyZxdW90Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBBY3RpdmF0aW5nIENyZWRlbnRpYWw6IFBhc3M8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDsgIyMjIyNSZWNvdmVyZWQgQ3JlZGVudGlhbD0mcXVvdDtkZWFkYmVl
ZmRlYWRiZWVmZGVhZCZxdW90Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0OyBbcm9vdF0jPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IE9uIFdlZCwgQXByIDgsIDIwMjAgYXQgNzowMiBQTSBSYWh1bCBIYXJkaWthcjxicj4KJmd0OyAm
bHQ7PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBn
bWFpbC5jb208L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVs
aGFyZGlrYXJAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhh
cmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29t
PC9hPiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IHdyb3RlOjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgVGhhbmtzIGd1eXMsIEkmIzM5O2xsIHRyeSB0aGlzIGJ1dMKgIGkgYWxzbyB3YW50ZWQgdG8g
a25vdyBpZiB0aGVyZSBpcyBhIHdheSB0bzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBrbm93IGlm
IHRoZSBUUE0gc3RpbGwgaGFzIHRoZSBFSyBhbmQgQUsga2V5cyBsb2FkZWQ/IEkgaGF2ZSB0aGUg
RUs8YnI+CiZndDsgaGFuZGxlIGFuZCBBSzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBoYW5kbGUg
KG5vdCBtYWRlIGl0IHBlcnNpc3RlbnQpIGJ1dCBJIHdhbnQgdG8gbWFrZSBzdXJlIGl0JiMzOTtz
IHByZXNlbnQgYXM8YnI+CiZndDsgdGhlc2UgYXJlPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG5l
Y2Vzc2FyeSBmb3IgQWN0aXZhdGVDcmVkZW50aWFsIHRvIHN1Y2NlZWQ8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoEVTeXNfQWN0aXZhdGVDcmVkZW50aWFsIGNvbXBsYWluaW5nIGFi
b3V0IHNlY3JldCBwYXJhbWV0ZXI8YnI+CiZndDsgZG9lc24mIzM5O3Q8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDsgbWFrZSBzZW5zZSB0byBtZSwgSSB0ZXN0ZWQgb24gc2VydmVyIHNpZGUsIGFrX25h
bWUgaXMgc2FtZSBhcyB0aGF0PGJyPgomZ3Q7IHNlbnQgYW5kIHNvIGlzPGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IEVLX1BVQiBvYmplY3QgYXMgd2VsbCBhc8KgIEVLX0NlcnQgaW4gbnZyYW0sIEkg
Y2FsbCB0aGUgc2FtZTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBleHRlcm5hbF9tYWtlY3JlZGVu
dGlhbCBjYWxsIHRoYXQmIzM5O3MgaW4gdGhlIEdpdEh1YiB0byBjcmVhdGUgc2VjcmV0IGFuZDxi
cj4KJmd0OyBtYWRlIHN1cmU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgc2VjcmV0LGNyZWRibG9i
IG1hdGNoZXMgb24gdGhlIGNsaWVudCBzaWRlIHdoZW4gcmVjZWl2ZWQgZnJvbSBzZXJ2ZXIuPGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBU
aGFua3MsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBSYWh1bDxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgT24gVHVlLCBN
YXIgMTcsIDIwMjAgYXQgNjoxOSBBTSBJbXJhbiBEZXNhaTxicj4KJmd0OyAmbHQ7PGEgaHJlZj0i
bWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2Fp
QGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50
ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVz
YWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0i
X2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+CiZndDsg
d3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBTZXQgdGhpcyB1cCB3
aXRoIGFsbCBoYW5kbGVzIGluIHVzZSBtYWRlIHBlcnNpc3RlbnQuIElmIHlvdSBzdGlsbCBzZWU8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgaXNzdWVzLCBnZGItYnJlYWsgb3IgdHVybiBvbiBkZWJ1
ZyBsb2dnaW5nIGF0IHRoZSBFc3lzIGNhbGwgYW5kIGNvbXBhcmU8YnI+CiZndDsgdGhlPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IGZ1bmN0aW9uIGFyZ3VtZW50cy48YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxp
c3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRw
bTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxh
IGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRw
bTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVA
bGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50
cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBt
Mi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAx
Lm9yZzwvYT4mZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFt
ZSlzPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+Cjxicj4K
PC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============2010201662229250608==--

