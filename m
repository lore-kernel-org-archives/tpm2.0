Content-Type: multipart/mixed; boundary="===============4453895515227101857=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Mon, 13 Apr 2020 12:31:32 -0700
Message-ID: <CAP3jAwS7HV5nk7O5kAvuHjpuG8NoZUPhsjagDSVo0eVo5XxD5g@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EC993B@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4453895515227101857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ok, got it. I'm using ESAPI C APIs. But its pretty much the same as the
tpm2 tools implementation.
How do i add debugs in my poky directory?  I have tpm2.0-tss_2.1.4.bb file.
Also, how to add compile-time log flags to my src file that uses ESAPI
calls? Running separately was easy, I just called
TSS2_LOG=3D"all+ERROR,tcti+DEBUG"

On Mon, Apr 13, 2020 at 7:20 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> > -----Original Message-----
> > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
> > Sent: Friday, April 10, 2020 4:15 PM
> > To: Roberts, William C <william.c.roberts(a)intel.com>
> > Cc: Desai, Imran <imran.desai(a)intel.com>; tpm2(a)lists.01.org
> > Subject: Re: [tpm2] Re: ESys_ActivateCredential
> >
> > Hi Bill,
> > I have this on my system: Is tpmrm0 same as tabrmd? I believe mine is
> using this
> > right now , i'm changing it to what you mentioned  to see if it helps.
> > [root(a)nfvis ~]# ls -l /dev/tpm*
> > crw-rw----. 1 tss root  10,   224 Apr  8 23:19 /dev/tpm0
> > crw-rw----. 1 tss tss  254, 65536 Apr  8 23:19 /dev/tpmrm0 Thanks, Rahul
>
> In theory, yes. In practice no.
> /dev/tpmrm0 is the in kernel resource manager
> tpm2-abrmd is the userspace resource manager
>
> tpm2-abrmd has a few features tpmrm0 doesn't have, but unless you're
> using policy sessions with tpm2-tools, you shouldn't notice a difference.
>
> >
> > On Fri, Apr 10, 2020 at 11:33 AM Roberts, William C <
> william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > wrote:
> >
> >
> >
> >
> >       > -----Original Message-----
> >       > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> ]
> >       > Sent: Friday, April 10, 2020 1:08 PM
> >       > To: Roberts, William C <william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> >
> >       > Cc: Desai, Imran <imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> >; tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>
> >       > Subject: Re: [tpm2] Re: ESys_ActivateCredential
> >       >
> >       > Thanks Bill, trying that.
> >       >  I did not get debug build tpm2_tss, isn't it all prebuilt ? I
> will have to see
> > how to
> >       > do it in poky.
> >
> >       If you're getting it from a package manager, yes. But there's
> nothing
> > stopping you
> >       from using source builds. Some distro's will package debug symbols
> for
> > their
> >       packages.
> >
> >       >
> >       > On Fri, Apr 10, 2020 at 8:16 AM Roberts, William C
> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> >       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > > wrote:
> >       >
> >       >
> >       >
> >       >
> >       >       > -----Original Message-----
> >       >       > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>
> >       > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail=
.com>
> >
> > ]
> >       >       > Sent: Thursday, April 9, 2020 2:51 PM
> >       >       > To: Roberts, William C <william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com>
> >       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > >
> >       >       > Cc: Desai, Imran <imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>
> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com=
> >
> >;
> > tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> >       >       > Subject: Re: [tpm2] Re: ESys_ActivateCredential
> >       >       >
> >       >       > Thanks Bill. I use this
> >       >       > Esys_Initialize( &ectx, NULL, NULL);
> >       >       >
> >       >       > so i'm assuming it would take the default
> libtss2-tcti-tabrmd.so.0.
> >       >
> >       >       This should do it for you:
> >       >       TSS2_RC
> >       >       Tss2_TctiLdr_Initialize (const char *nameConf,
> >       >                                TSS2_TCTI_CONTEXT **context);
> >       >
> >       >       Set nameConf to the string "tabrmd", that should give you
> a tcti
> > pointer
> >       > you can
> >       >       pass wot Esys_Initialize()
> >       >
> >       >       >
> >       >       >
> >       >       > If I need to debug Esys_ActivateCredential more, how can
> I do it,
> > these
> >       > APIs are
> >       >       > no more standalone, I have integrated it in a bigger
> code base and
> >       > added the
> >       >       > esys-tss2 and other libs in my poky build, so now it
> runs as
> > different
> >       > process that
> >       >       > invokes this function, I can gdb into the process but I
> can't seem to
> > gdb
> >       > into
> >       >       > Esys_Activate..( )
> >       >
> >       >       Did you build tpm2-tss with debug symbols?
> >       >       Add --enable-debug
> >       >
> >       >       >
> >       >       >
> >       >       > Thanks,
> >       >       > Rahul
> >       >       >
> >       >       >
> >       >       >
> >       >       >
> >       >       > On Thu, Apr 9, 2020 at 10:23 AM Roberts, William C
> >       > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)inte=
l.com
> >
> > <mailto:william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel=
.com>
> >
> >       >       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com>
> >       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > > > wrote:
> >       >       >
> >       >       >
> >       >       >       > -----Original Message-----
> >       >       >       > From: Rahul Hardikar [mailto:
> rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>
> >       > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail=
.com>
> >
> >       >       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> > >
> >       > ]
> >       >       >       > Sent: Thursday, April 9, 2020 11:18 AM
> >       >       >       > To: Desai, Imran <imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>
> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com=
> >
> >       >       > <mailto:imran.desai(a)intel.com <mailto:
> imran.desai(a)intel.com>
> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> >       >       >       > Cc: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01=
.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> >       >       >       > Subject: [tpm2] Re: ESys_ActivateCredential
> >       >       >       >
> >       >       >       > How do I know if  RM is being used?
> >       >       >
> >       >       >
> >       >       >       If you set the tcti to the device tcti, it will
> open /dev/tpm0 by
> >       > default. And
> >       >       > that wont
> >       >       >       Be an RM. You can also give it an option.
> Esys_Initialize() takes a
> > tcti
> >       > as an
> >       >       > option,
> >       >       >       NULL will cause it to use the default search
> behavior of the
> >       > Tss2_TctiLdr,
> >       >       > see:
> >       >       >
> >       >       >       https://github.com/tpm2-software/tpm2-
> >       >       > tss/blob/master/man/Tss2_TctiLdr_Initialize.3.in
> > <http://Tss2_TctiLdr_Initialize.3.in>
> >       > <http://Tss2_TctiLdr_Initialize.3.in>
> >       >       >       https://github.com/tpm2-software/tpm2-
> >       >       > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> > <http://Tss2_Tcti_Device_Init.3.in>
> >       > <http://Tss2_Tcti_Device_Init.3.in>
> >       >       >       https://github.com/tpm2-software/tpm2-
> >       > tss/blob/master/man/tss2-
> >       >       > tcti-device.7.in <http://tcti-device.7.in>  <
> http://tcti-device.7.in>
> >       >       >
> >       >       >       You can use man locally if you prefer as well:
> >       >       >       man 3 Tss2_TctiLdr_Initialize
> >       >       >       man 7 tss2-tcti-device
> >       >       >       man 3 Tss2_Tcti_Device_Init
> >       >       >
> >       >       >       Note that https://github.com/tpm2-software/tpm2-
> >       >       > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> > <http://Tss2_Tcti_Device_Init.3.in>
> >       > <http://Tss2_Tcti_Device_Init.3.in>
> >       >       >       Has sample code in it.
> >       >       >
> >       >       >       If you're using the tools, it supports explicitly
> choosing the TCTI:
> >       >       >       https://github.com/tpm2-software/tpm2-
> >       >       > tools/blob/master/man/common/tcti.md
> >       >       >
> >       >       >       Also note that the /dev/tpmrm0 (Notice the RM) is
> an in-kernel
> >       > resource
> >       >       > manager.
> >       >       >
> >       >       >
> >       >       >       > When I do ESys_Initialize, I see these WARNINGs,
> wondering
> > if it's
> >       > okay
> >       >       > for multi-
> >       >       >       > thread
> >       >       >       > WARNING:esys:src/tss2-
> >       > esys/esys_tcti_default.c:137:tcti_from_file()
> >       >       > Could not
> >       >       >       > load TCTI file: libtss2-tcti-default.so <
> http://libtss2-tcti-
> >       > default.so/ <http://default.so/> >
> >       >       > libtss2-tcti-
> >       >       >       > default.so <http://libtss2-tcti-default.so/>
> >       >       >       > WARNING:esys:src/tss2-
> >       > esys/esys_tcti_default.c:137:tcti_from_file()
> >       >       > Could not
> >       >       >       > load TCTI file: libtss2-tcti-tabrmd.so <
> http://libtss2-tcti-
> >       > tabrmd.so/ <http://tabrmd.so/> >
> >       >       >       >
> >       >       >       > In my single threaded process, everything works
> so smoothly
> >       > [root]#
> >       >       > ./tpm
> >       >       >       > WARNING:esys:src/tss2-
> >       > esys/esys_tcti_default.c:137:tcti_from_file()
> >       >       > Could not
> >       >       >       > load TCTI file: libtss2-tcti-default.so <
> http://libtss2-tcti-
> >       > default.so/ <http://default.so/> >
> >       >       >       > WARNING:esys:src/tss2-
> >       > esys/esys_tcti_default.c:137:tcti_from_file()
> >       >       > Could not
> >       >       >       > load TCTI file: libtss2-tcti-tabrmd.so <
> http://libtss2-tcti-
> >       > tabrmd.so/ <http://tabrmd.so/> >
> >       >       > ESYS
> >       >       >       > Initialization: Pass
> >       >       >       >
> >       >       >       > Read TPM EK Certificate: Pass
> >       >       >       >
> >       >       >       > TPM EK Certificate Root-CA Verification: Pass
> >       >       >       >
> >       >       >       > Clear TPM State: Pass
> >       >       >       >
> >       >       >       > Created EK Primary object: Pass
> >       >       >       > #####Handle 0x418368
> >       >       >       >
> >       >       >       > Create Attestation Key: Pass
> >       >       >       > #####Ak_Handle 0x41836b
> >       >       >       >
> >       >       >       > Original Credential=3D"deadbeefdeadbeefdead"
> >       >       >       >
> >       >       >       > Make Credential: Pass
> >       >       >       > #####Encrypted Credential
> >       >       >       >
> >       >       >
> >       >
> > Blob=3D"0020508e439bc6512d044bb8739e8d61c8ce3664d25f3572389b46c8797e562a
> >       >       >       > 45c412864f020a7f1bbcab7a34f0"
> >       >       >       >
> >       >       >       > #####Encrypted
> >       >       >       >
> >       >       >
> >       >
> > Secret=3D"b70689bb0ed9fa8324cfa03d727e6c6795069b4f0943108409b89009b9cc7=
6c
> >       >       >       >
> >       >       >
> >       >
> > 76bddb31a5ccf34cfebc5d3fe715899bb725a8a3c8fe4a6046233869123f3e978051aec
> >       >       >       >
> >       >       >
> >       >
> > e0d7af0ad6f85164a32fd2c5ad756e8c3b72f6311126de79a30c0d72aa0a6f3f437f6bc
> >       >       >       >
> >       >       >
> >       >
> > 077c41d3cc6450c71e803ca6074d34ce3debf5114f4bac2fd7ee6a87ef9f07d83079477
> >       >       >       >
> >       >       >
> >       >
> > 5dda4f77e4620cbaf9aeb302040ee2a66a352b9fffaa5447c09a249bb22d9d989b7f14
> >       >       >       >
> >       >       >
> >       >
> > 06612a90b8d8bce6bb940fbfd1d50f31398403a2643c73bec336e6fcca46f29f9b6aa87
> >       >       >       >
> >       >       >
> >       >
> > fd11d53ec6f145d61b2a61dffc783ae2b2c66184435d633d0b5a420efa01748e39d687
> >       >       >       > e1eb9fcc1759c184972779bfc"
> >       >       >       >
> >       >       >       > Activating Credential: Pass
> >       >       >       > #####Recovered Credential=3D"deadbeefdeadbeefde=
ad"
> >       >       >       >
> >       >       >       > [root]#
> >       >       >       >
> >       >       >       >
> >       >       >       >
> >       >       >       > On Wed, Apr 8, 2020 at 7:02 PM Rahul Hardikar
> >       >       > <rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmai=
l.com
> >
> > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> >       > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail=
.com>
> > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> > >
> >       >       >       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>
> >       > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail=
.com>
> >
> > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> >       > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail=
.com>
> >
> > > >
> >       >       > > wrote:
> >       >       >       >
> >       >       >       >
> >       >       >       >       Thanks guys, I'll try this but  i also
> wanted to know if there
> > is a
> >       > way to
> >       >       >       > know if the TPM still has the EK and AK keys
> loaded? I have
> > the EK
> >       >       > handle and AK
> >       >       >       > handle (not made it persistent) but I want to
> make sure it's
> >       > present as
> >       >       > these are
> >       >       >       > necessary for ActivateCredential to succeed
> >       >       >       >       ESys_ActivateCredential complaining about
> secret
> > parameter
> >       >       > doesn't
> >       >       >       > make sense to me, I tested on server side,
> ak_name is same
> > as
> >       > that
> >       >       > sent and so is
> >       >       >       > EK_PUB object as well as  EK_Cert in nvram, I
> call the same
> >       >       >       > external_makecredential call that's in the
> GitHub to create
> > secret
> >       > and
> >       >       > made sure
> >       >       >       > secret,credblob matches on the client side when
> received
> > from
> >       > server.
> >       >       >       >
> >       >       >       >       Thanks,
> >       >       >       >       Rahul
> >       >       >       >
> >       >       >       >       On Tue, Mar 17, 2020 at 6:19 AM Imran Des=
ai
> >       >       > <imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> >       >       >       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> >
> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > > >
> >       >       > wrote:
> >       >       >       >
> >       >       >       >
> >       >       >       >               Set this up with all handles in
> use made persistent. If
> > you
> >       > still see
> >       >       >       > issues, gdb-break or turn on debug logging at
> the Esys call and
> >       > compare
> >       >       > the
> >       >       >       > function arguments.
> >       >       >       >
> >       > _______________________________________________
> >       >       >       >               tpm2 mailing list --
> tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>
> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> >       >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> >       >       >       >               To unsubscribe send an email to
> tpm2-
> > leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>
> >       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01=
.org>
> >
> >       >       > <mailto:tpm2-leave(a)lists.01.org <mailto:
> tpm2-leave(a)lists.01.org>
> > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> > >
> >       >       >       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> > leave(a)lists.01.org>  <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> > leave(a)lists.01.org> >
> >       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01=
.org>
> > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> > =
> >
> >       >       >       >
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >       >       >       >
> >       >       >
> >       >       >
> >       >
> >       >
> >
> >
>
>

--===============4453895515227101857==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+T2ssIGdvdCBpdC4gSSYjMzk7bSB1c2luZyBFU0FQSSBDIEFQSXMuIEJ1
dCBpdHMgcHJldHR5IG11Y2ggdGhlIHNhbWUgYXMgdGhlIHRwbTIgdG9vbHMgaW1wbGVtZW50YXRp
b24uPGRpdj5Ib3cgZG8gaSBhZGQgZGVidWdzIGluIG15IHBva3kgZGlyZWN0b3J5P8KgIEkgaGF2
ZSA8YSBocmVmPSJodHRwOi8vdHBtMi4wLXRzc18yLjEuNC5iYiI+dHBtMi4wLXRzc18yLjEuNC5i
YjwvYT4gZmlsZS48L2Rpdj48ZGl2PkFsc28sIGhvdyB0byBhZGQgY29tcGlsZS10aW1lIGxvZyBm
bGFncyB0byBteSBzcmMgZmlsZSB0aGF0IHVzZXMgRVNBUEkgY2FsbHM/IFJ1bm5pbmcgc2VwYXJh
dGVseSB3YXMgZWFzeSwgSSBqdXN0IGNhbGxlZCBUU1MyX0xPRz0mcXVvdDthbGwrRVJST1IsdGN0
aStERUJVRyZxdW90OzwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRp
diBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1vbiwgQXByIDEzLCAyMDIwIGF0IDc6
MjAgQU0gUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJv
YmVydHNAaW50ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyB3cm90
ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2lu
OjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1zdHls
ZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDox
ZXgiPiZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+CiZndDsgRnJvbTogUmFodWwg
SGFyZGlrYXIgW21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20i
IHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT5dPGJyPgomZ3Q7IFNl
bnQ6IEZyaWRheSwgQXByaWwgMTAsIDIwMjAgNDoxNSBQTTxicj4KJmd0OyBUbzogUm9iZXJ0cywg
V2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+
CiZndDsgQ2M6IERlc2FpLCBJbXJhbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7OyA8
YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxp
c3RzLjAxLm9yZzwvYT48YnI+CiZndDsgU3ViamVjdDogUmU6IFt0cG0yXSBSZTogRVN5c19BY3Rp
dmF0ZUNyZWRlbnRpYWw8YnI+CiZndDsgPGJyPgomZ3Q7IEhpIEJpbGwsPGJyPgomZ3Q7IEkgaGF2
ZSB0aGlzIG9uIG15IHN5c3RlbTogSXMgdHBtcm0wIHNhbWUgYXMgdGFicm1kPyBJIGJlbGlldmUg
bWluZSBpcyB1c2luZyB0aGlzPGJyPgomZ3Q7IHJpZ2h0IG5vdyAsIGkmIzM5O20gY2hhbmdpbmcg
aXQgdG8gd2hhdCB5b3UgbWVudGlvbmVkwqAgdG8gc2VlIGlmIGl0IGhlbHBzLjxicj4KJmd0OyBb
cm9vdEBuZnZpcyB+XSMgbHMgLWwgL2Rldi90cG0qPGJyPgomZ3Q7IGNydy1ydy0tLS0uIDEgdHNz
IHJvb3TCoCAxMCzCoCDCoDIyNCBBcHLCoCA4IDIzOjE5IC9kZXYvdHBtMDxicj4KJmd0OyBjcnct
cnctLS0tLiAxIHRzcyB0c3PCoCAyNTQsIDY1NTM2IEFwcsKgIDggMjM6MTkgL2Rldi90cG1ybTAg
VGhhbmtzLCBSYWh1bDxicj4KPGJyPgpJbiB0aGVvcnksIHllcy4gSW4gcHJhY3RpY2Ugbm8uPGJy
PgovZGV2L3RwbXJtMCBpcyB0aGUgaW4ga2VybmVsIHJlc291cmNlIG1hbmFnZXI8YnI+CnRwbTIt
YWJybWQgaXMgdGhlIHVzZXJzcGFjZSByZXNvdXJjZSBtYW5hZ2VyPGJyPgo8YnI+CnRwbTItYWJy
bWQgaGFzIGEgZmV3IGZlYXR1cmVzIHRwbXJtMCBkb2VzbiYjMzk7dCBoYXZlLCBidXQgdW5sZXNz
IHlvdSYjMzk7cmU8YnI+CnVzaW5nIHBvbGljeSBzZXNzaW9ucyB3aXRoIHRwbTItdG9vbHMsIHlv
dSBzaG91bGRuJiMzOTt0IG5vdGljZSBhIGRpZmZlcmVuY2UuPGJyPgo8YnI+CiZndDsgPGJyPgom
Z3Q7IE9uIEZyaSwgQXByIDEwLCAyMDIwIGF0IDExOjMzIEFNIFJvYmVydHMsIFdpbGxpYW0gQyAm
bHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+CiZndDsgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0OyB3cm90ZTo8YnI+
CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEZy
b206IFJhaHVsIEhhcmRpa2FyIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJA
Z21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+PGJy
PgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyBdPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IFNlbnQ6IEZyaWRheSwgQXByaWwgMTAsIDIwMjAgMTowOCBQTTxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBUbzogUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVm
PSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2ls
bGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxs
aWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IENjOiBEZXNhaSwgSW1yYW4gJmx0OzxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRl
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+PGJyPgomZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZndDs7IDxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3Jn
PC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9y
ZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDsgU3ViamVjdDogUmU6IFt0cG0yXSBSZTogRVN5c19BY3RpdmF0ZUNyZWRlbnRp
YWw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgVGhhbmtz
IEJpbGwsIHRyeWluZyB0aGF0Ljxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIEkgZGlkIG5vdCBn
ZXQgZGVidWcgYnVpbGQgdHBtMl90c3MsIGlzbiYjMzk7dCBpdCBhbGwgcHJlYnVpbHQgPyBJIHdp
bGwgaGF2ZSB0byBzZWU8YnI+CiZndDsgaG93IHRvPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGRv
IGl0IGluIHBva3kuPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgSWYgeW91JiMzOTtyZSBn
ZXR0aW5nIGl0IGZyb20gYSBwYWNrYWdlIG1hbmFnZXIsIHllcy4gQnV0IHRoZXJlJiMzOTtzIG5v
dGhpbmc8YnI+CiZndDsgc3RvcHBpbmcgeW91PGJyPgomZ3Q7wqAgwqAgwqAgwqBmcm9tIHVzaW5n
IHNvdXJjZSBidWlsZHMuIFNvbWUgZGlzdHJvJiMzOTtzIHdpbGwgcGFja2FnZSBkZWJ1ZyBzeW1i
b2xzIGZvcjxicj4KJmd0OyB0aGVpcjxicj4KJmd0O8KgIMKgIMKgIMKgcGFja2FnZXMuPGJyPgom
Z3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBPbiBG
cmksIEFwciAxMCwgMjAyMCBhdCA4OjE2IEFNIFJvYmVydHMsIFdpbGxpYW0gQzxicj4KJmd0OyAm
bHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2ls
bGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4KJmd0OyAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRh
cmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZn
dDsgd3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEZyb206IFJhaHVsIEhhcmRp
a2FyIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+PGJyPgomZ3Q7ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVs
aGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0Ozxicj4KJmd0OyBdPGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCA5LCAyMDIwIDI6
NTEgUE08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgVG86IFJvYmVydHMs
IFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+CiZn
dDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5j
LnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50
ZWwuY29tPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMu
cm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgQ2M6IERlc2FpLCBJbXJhbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+CiZn
dDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJh
bi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs7PGJyPgomZ3Q7IDxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3Jn
PC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0
PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0i
X2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4m
Z3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgU3ViamVjdDog
UmU6IFt0cG0yXSBSZTogRVN5c19BY3RpdmF0ZUNyZWRlbnRpYWw8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgVGhhbmtzIEJpbGwuIEkgdXNlIHRoaXM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgRXN5c19Jbml0aWFsaXplKCAmYW1wO2VjdHgsIE5VTEwsIE5VTEwpOzxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyBzbyBpJiMzOTttIGFzc3VtaW5nIGl0IHdvdWxkIHRha2UgdGhlIGRlZmF1
bHTCoCBsaWJ0c3MyLXRjdGktdGFicm1kLnNvLjAuPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBUaGlzIHNob3VsZCBkbyBpdCBmb3IgeW91
Ojxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVFNTMl9SQzxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgVHNzMl9UY3RpTGRyX0luaXRpYWxpemUgKGNvbnN0IGNoYXIg
Km5hbWVDb25mLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFRTUzJfVENUSV9DT05URVhUICoqY29udGV4dCk7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBT
ZXQgbmFtZUNvbmYgdG8gdGhlIHN0cmluZyAmcXVvdDt0YWJybWQmcXVvdDssIHRoYXQgc2hvdWxk
IGdpdmUgeW91IGEgdGN0aTxicj4KJmd0OyBwb2ludGVyPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IHlvdSBjYW48YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHBhc3Mgd290IEVzeXNf
SW5pdGlhbGl6ZSgpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IElmIEkgbmVlZCB0byBkZWJ1
ZyBFc3lzX0FjdGl2YXRlQ3JlZGVudGlhbCBtb3JlLCBob3cgY2FuIEkgZG8gaXQsPGJyPgomZ3Q7
IHRoZXNlPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEFQSXMgYXJlPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG5vIG1vcmUgc3RhbmRhbG9uZSwgSSBoYXZlIGludGVncmF0
ZWQgaXQgaW4gYSBiaWdnZXIgY29kZSBiYXNlIGFuZDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBh
ZGRlZCB0aGU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgZXN5cy10c3My
IGFuZCBvdGhlciBsaWJzIGluIG15IHBva3kgYnVpbGQsIHNvIG5vdyBpdCBydW5zIGFzPGJyPgom
Z3Q7IGRpZmZlcmVudDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBwcm9jZXNzIHRoYXQ8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgaW52b2tlcyB0aGlzIGZ1bmN0aW9uLCBJ
IGNhbiBnZGIgaW50byB0aGUgcHJvY2VzcyBidXQgSSBjYW4mIzM5O3Qgc2VlbSB0bzxicj4KJmd0
OyBnZGI8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgaW50bzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyBFc3lzX0FjdGl2YXRlLi4oICk8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoERpZCB5b3UgYnVpbGQgdHBtMi10
c3Mgd2l0aCBkZWJ1ZyBzeW1ib2xzPzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
QWRkIC0tZW5hYmxlLWRlYnVnPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFRoYW5rcyw8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgUmFodWw8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgT24gVGh1LCBBcHIgOSwgMjAyMCBhdCAxMDoyMyBBTSBSb2JlcnRzLCBXaWxsaWFt
IEM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMu
cm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4m
Z3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRz
QGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwv
YT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0
Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndp
bGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+CiZndDsg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0OyAm
Z3Q7ICZndDsgd3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IEZyb206IFJhaHVsIEhhcmRpa2FyIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+
PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRp
a2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9h
PiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0Ozxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJA
Z21haWwuY29tPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhh
cmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29t
PC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWls
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPjxicj4KJmd0
OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IF08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgU2VudDogVGh1cnNkYXksIEFwcmlsIDksIDIwMjAgMTE6MTgg
QU08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
VG86IERlc2FpLCBJbXJhbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+CiZndDsgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNh
aUBpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4u
ZGVzYWlAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50
ZWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5j
b20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZn
dDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyBDYzogPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJA
bGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxi
cj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3Jn
PC9hPiZndDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEu
b3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZndDsgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0y
QGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7ICZndDsgJmd0
Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBT
dWJqZWN0OiBbdHBtMl0gUmU6IEVTeXNfQWN0aXZhdGVDcmVkZW50aWFsPGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEhvdyBkbyBJIGtub3cgaWbCoCBS
TSBpcyBiZWluZyB1c2VkPzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYgeW91IHNldCB0aGUgdGN0aSB0byB0aGUg
ZGV2aWNlIHRjdGksIGl0IHdpbGwgb3BlbiAvZGV2L3RwbTAgYnk8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDsgZGVmYXVsdC4gQW5kPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IHRoYXQgd29udDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgQmUgYW4gUk0uIFlvdSBjYW4gYWxzbyBnaXZlIGl0IGFuIG9wdGlvbi4gRXN5c19Jbml0aWFs
aXplKCkgdGFrZXMgYTxicj4KJmd0OyB0Y3RpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGFzIGFu
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG9wdGlvbiw8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoE5VTEwgd2lsbCBjYXVzZSBp
dCB0byB1c2UgdGhlIGRlZmF1bHQgc2VhcmNoIGJlaGF2aW9yIG9mIHRoZTxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0OyBUc3MyX1RjdGlMZHIsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IHNlZTo8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoDxhIGhyZWY9Imh0dHBz
Oi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLTwvYT48YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdHNzL2Jsb2IvbWFzdGVyL21hbi88
YSBocmVmPSJodHRwOi8vVHNzMl9UY3RpTGRyX0luaXRpYWxpemUuMy5pbiIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+VHNzMl9UY3RpTGRyX0luaXRpYWxpemUuMy5pbjwvYT48YnI+
CiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9Uc3MyX1RjdGlMZHJfSW5pdGlhbGl6ZS4zLmluIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vVHNzMl9UY3RpTGRyX0luaXRp
YWxpemUuMy5pbjwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDs8YSBocmVmPSJo
dHRwOi8vVHNzMl9UY3RpTGRyX0luaXRpYWxpemUuMy5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL1RzczJfVGN0aUxkcl9Jbml0aWFsaXplLjMuaW48L2E+Jmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgPGEgaHJlZj0i
aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi0iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItPC9h
Pjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB0c3MvYmxvYi9tYXN0ZXIv
bWFuLzxhIGhyZWY9Imh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMy5pbiIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+VHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW48L2E+PGJy
PgomZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW4iIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0lu
aXQuMy5pbjwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDs8YSBocmVmPSJodHRw
Oi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMy5pbjwvYT4mZ3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqA8YSBocmVmPSJodHRwczov
L2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi08L2E+PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IHRzcy9ibG9iL21hc3Rlci9tYW4vdHNzMi08YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgPGEgaHJlZj0iaHR0cDovL3RjdGktZGV2aWNlLjcu
aW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnRjdGktZGV2aWNlLjcuaW48L2E+
ICZsdDs8YSBocmVmPSJodHRwOi8vdGN0aS1kZXZpY2UuNy5pbiIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL3RjdGktZGV2aWNlLjcuaW48L2E+Jmd0O8KgICZsdDs8YSBo
cmVmPSJodHRwOi8vdGN0aS1kZXZpY2UuNy5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL3RjdGktZGV2aWNlLjcuaW48L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgWW91IGNhbiB1c2UgbWFuIGxvY2FsbHkgaWYgeW91IHByZWZlciBhcyB3ZWxs
Ojxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgbWFuIDMg
VHNzMl9UY3RpTGRyX0luaXRpYWxpemU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoG1hbiA3IHRzczItdGN0aS1kZXZpY2U8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoG1hbiAzIFRzczJfVGN0aV9EZXZpY2VfSW5p
dDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgTm90ZSB0aGF0IDxhIGhyZWY9Imh0dHBz
Oi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLTwvYT48YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdHNzL2Jsb2IvbWFzdGVyL21hbi88
YSBocmVmPSJodHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW4iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPlRzczJfVGN0aV9EZXZpY2VfSW5pdC4zLmluPC9hPjxicj4KJmd0
OyAmbHQ7PGEgaHJlZj0iaHR0cDovL1RzczJfVGN0aV9EZXZpY2VfSW5pdC4zLmluIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMu
aW48L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL1Rz
czJfVGN0aV9EZXZpY2VfSW5pdC4zLmluIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW48L2E+Jmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSGFzIHNhbXBsZSBjb2RlIGluIGl0
Ljxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYgeW91JiMzOTtyZSB1c2luZyB0aGUg
dG9vbHMsIGl0IHN1cHBvcnRzIGV4cGxpY2l0bHkgY2hvb3NpbmcgdGhlIFRDVEk6PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqA8YSBocmVmPSJodHRwczov
L2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi08L2E+PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRvb2xzL2Jsb2IvbWFzdGVyL21hbi9j
b21tb24vdGN0aS5tZDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgQWxzbyBub3RlIHRo
YXQgdGhlIC9kZXYvdHBtcm0wIChOb3RpY2UgdGhlIFJNKSBpcyBhbiBpbi1rZXJuZWw8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDsgcmVzb3VyY2U8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgbWFuYWdlci48YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgV2hlbiBJIGRvIEVTeXNfSW5pdGlh
bGl6ZSwgSSBzZWUgdGhlc2UgV0FSTklOR3MsIHdvbmRlcmluZzxicj4KJmd0OyBpZiBpdCYjMzk7
czxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBva2F5PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IGZvciBtdWx0aS08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgdGhyZWFkPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFdBUk5JTkc6ZXN5czpzcmMvdHNzMi08YnI+CiZndDvC
oCDCoCDCoCDCoCZndDsgZXN5cy9lc3lzX3RjdGlfZGVmYXVsdC5jOjEzNzp0Y3RpX2Zyb21fZmls
ZSgpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IENvdWxkIG5vdDxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBsb2FkIFRD
VEkgZmlsZTogbGlidHNzMi10Y3RpLWRlZmF1bHQuc28gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0
c3MyLXRjdGktIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlidHNz
Mi10Y3RpLTwvYT48YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgPGEgaHJlZj0iaHR0cDovL2RlZmF1
bHQuc28vIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5kZWZhdWx0LnNvLzwvYT4g
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9kZWZhdWx0LnNvLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovL2RlZmF1bHQuc28vPC9hPiZndDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBsaWJ0c3MyLXRjdGktPGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGRlZmF1bHQuc28gJmx0OzxhIGhyZWY9
Imh0dHA6Ly9saWJ0c3MyLXRjdGktZGVmYXVsdC5zby8iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9saWJ0c3MyLXRjdGktZGVmYXVsdC5zby88L2E+Jmd0Ozxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBXQVJOSU5HOmVz
eXM6c3JjL3RzczItPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGVzeXMvZXN5c190Y3RpX2RlZmF1
bHQuYzoxMzc6dGN0aV9mcm9tX2ZpbGUoKTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyBDb3VsZCBub3Q8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgbG9hZCBUQ1RJIGZpbGU6IGxpYnRzczItdGN0aS10YWJybWQuc28gJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJ0c3MyLXRjdGktIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vbGlidHNzMi10Y3RpLTwvYT48YnI+CiZndDvCoCDCoCDCoCDCoCZndDsg
PGEgaHJlZj0iaHR0cDovL3RhYnJtZC5zby8iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPnRhYnJtZC5zby88L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vdGFicm1kLnNvLyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3RhYnJtZC5zby88L2E+Jmd0OyAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEluIG15
IHNpbmdsZSB0aHJlYWRlZCBwcm9jZXNzLCBldmVyeXRoaW5nIHdvcmtzIHNvIHNtb290aGx5PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFtyb290XSM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgLi90cG08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgV0FSTklORzplc3lzOnNyYy90c3MyLTxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0OyBlc3lzL2VzeXNfdGN0aV9kZWZhdWx0LmM6MTM3OnRjdGlfZnJvbV9maWxlKCk8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQ291bGQgbm90PGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGxvYWQgVENUSSBmaWxlOiBs
aWJ0c3MyLXRjdGktZGVmYXVsdC5zbyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnRzczItdGN0aS0i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0c3MyLXRjdGktPC9h
Pjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyA8YSBocmVmPSJodHRwOi8vZGVmYXVsdC5zby8iIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmRlZmF1bHQuc28vPC9hPiAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2RlZmF1bHQuc28vIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwOi8vZGVmYXVsdC5zby88L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFdBUk5JTkc6ZXN5czpzcmMvdHNzMi08YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDsgZXN5cy9lc3lzX3RjdGlfZGVmYXVsdC5jOjEzNzp0Y3RpX2Zyb21f
ZmlsZSgpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IENvdWxkIG5vdDxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBsb2Fk
IFRDVEkgZmlsZTogbGlidHNzMi10Y3RpLXRhYnJtZC5zbyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xp
YnRzczItdGN0aS0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0
c3MyLXRjdGktPC9hPjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyA8YSBocmVmPSJodHRwOi8vdGFi
cm1kLnNvLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dGFicm1kLnNvLzwvYT4g
Jmx0OzxhIGhyZWY9Imh0dHA6Ly90YWJybWQuc28vIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vdGFicm1kLnNvLzwvYT4mZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgRVNZUzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBJbml0aWFsaXphdGlvbjogUGFzczxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBSZWFkIFRQTSBFSyBDZXJ0aWZp
Y2F0ZTogUGFzczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyBUUE0gRUsgQ2VydGlmaWNhdGUgUm9vdC1DQSBWZXJpZmljYXRpb246IFBhc3M8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQ2xlYXIgVFBNIFN0
YXRlOiBQYXNzPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IENyZWF0ZWQgRUsgUHJpbWFyeSBvYmplY3Q6IFBhc3M8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgIyMjIyNIYW5kbGUgMHg0MTgzNjg8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQ3JlYXRlIEF0
dGVzdGF0aW9uIEtleTogUGFzczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyAjIyMjI0FrX0hhbmRsZSAweDQxODM2Yjxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBPcmlnaW5hbCBDcmVkZW50aWFsPSZx
dW90O2RlYWRiZWVmZGVhZGJlZWZkZWFkJnF1b3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE1ha2UgQ3JlZGVudGlhbDogUGFzczxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjIyMjI0VuY3J5cHRl
ZCBDcmVkZW50aWFsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IEJsb2I9JnF1b3Q7MDAyMDUwOGU0MzliYzY1MTJkMDQ0
YmI4NzM5ZThkNjFjOGNlMzY2NGQyNWYzNTcyMzg5YjQ2Yzg3OTdlNTYyYTxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyA0NWM0MTI4NjRmMDIwYTdm
MWJiY2FiN2EzNGYwJnF1b3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7ICMjIyMjRW5jcnlwdGVkPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IFNlY3JldD0mcXVvdDtiNzA2
ODliYjBlZDlmYTgzMjRjZmEwM2Q3MjdlNmM2Nzk1MDY5YjRmMDk0MzEwODQwOWI4OTAwOWI5Y2M3
NmM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDs8YnI+CiZndDsgNzZiZGRiMzFhNWNjZjM0Y2ZlYmM1ZDNmZTcxNTg5OWJiNzI1YThhM2M4
ZmU0YTYwNDYyMzM4NjkxMjNmM2U5NzgwNTFhZWM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgZTBkN2FmMGFkNmY4NTE2
NGEzMmZkMmM1YWQ3NTZlOGMzYjcyZjYzMTExMjZkZTc5YTMwYzBkNzJhYTBhNmYzZjQzN2Y2YmM8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+CiZndDsgMDc3YzQxZDNjYzY0NTBjNzFlODAzY2E2MDc0ZDM0Y2UzZGViZjUxMTRmNGJh
YzJmZDdlZTZhODdlZjlmMDdkODMwNzk0Nzc8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgNWRkYTRmNzdlNDYyMGNiYWY5
YWViMzAyMDQwZWUyYTY2YTM1MmI5ZmZmYWE1NDQ3YzA5YTI0OWJiMjJkOWQ5ODliN2YxNDxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4KJmd0OyAwNjYxMmE5MGI4ZDhiY2U2YmI5NDBmYmZkMWQ1MGYzMTM5ODQwM2EyNjQzYzczYmVj
MzM2ZTZmY2NhNDZmMjlmOWI2YWE4Nzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0OyBmZDExZDUzZWM2ZjE0NWQ2MWIyYTYx
ZGZmYzc4M2FlMmIyYzY2MTg0NDM1ZDYzM2QwYjVhNDIwZWZhMDE3NDhlMzlkNjg3PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGUxZWI5ZmNjMTc1
OWMxODQ5NzI3NzliZmMmcXVvdDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgQWN0aXZhdGluZyBDcmVkZW50aWFsOiBQYXNzPGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICMjIyMjUmVjb3ZlcmVkIENy
ZWRlbnRpYWw9JnF1b3Q7ZGVhZGJlZWZkZWFkYmVlZmRlYWQmcXVvdDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgW3Jvb3RdIzxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBPbiBXZWQsIEFwciA4LCAyMDIwIGF0IDc6
MDIgUE0gUmFodWwgSGFyZGlrYXI8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgJmx0OzxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tPC9hPiZndDs8YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdt
YWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFp
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7ICZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFo
dWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWls
LmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5j
b20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPgom
Z3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFo
dWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRp
a2FyQGdtYWlsLmNvbTwvYT48YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFo
dWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWls
LmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJk
aWthckBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+
Jmd0OyAmZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWls
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7ICZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmd0OyB3cm90ZTo8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFRo
YW5rcyBndXlzLCBJJiMzOTtsbCB0cnkgdGhpcyBidXTCoCBpIGFsc28gd2FudGVkIHRvIGtub3cg
aWYgdGhlcmU8YnI+CiZndDsgaXMgYTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyB3YXkgdG88YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsga25vdyBp
ZiB0aGUgVFBNIHN0aWxsIGhhcyB0aGUgRUsgYW5kIEFLIGtleXMgbG9hZGVkPyBJIGhhdmU8YnI+
CiZndDsgdGhlIEVLPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGhhbmRs
ZSBhbmQgQUs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgaGFuZGxlIChub3QgbWFkZSBpdCBwZXJzaXN0ZW50KSBidXQgSSB3YW50IHRvIG1ha2Ug
c3VyZSBpdCYjMzk7czxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBwcmVzZW50IGFzPGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRoZXNlIGFyZTxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBuZWNlc3NhcnkgZm9yIEFjdGl2
YXRlQ3JlZGVudGlhbCB0byBzdWNjZWVkPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBFU3lzX0FjdGl2YXRlQ3JlZGVudGlhbCBj
b21wbGFpbmluZyBhYm91dCBzZWNyZXQ8YnI+CiZndDsgcGFyYW1ldGVyPGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGRvZXNuJiMzOTt0PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG1ha2Ugc2Vuc2UgdG8gbWUsIEkgdGVz
dGVkIG9uIHNlcnZlciBzaWRlLCBha19uYW1lIGlzIHNhbWU8YnI+CiZndDsgYXM8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDsgdGhhdDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyBzZW50IGFuZCBzbyBpczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyBFS19QVUIgb2JqZWN0IGFzIHdlbGwgYXPCoCBFS19DZXJ0IGluIG52cmFt
LCBJIGNhbGwgdGhlIHNhbWU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgZXh0ZXJuYWxfbWFrZWNyZWRlbnRpYWwgY2FsbCB0aGF0JiMzOTtzIGlu
IHRoZSBHaXRIdWIgdG8gY3JlYXRlPGJyPgomZ3Q7IHNlY3JldDxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0OyBhbmQ8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbWFkZSBzdXJl
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHNl
Y3JldCxjcmVkYmxvYiBtYXRjaGVzIG9uIHRoZSBjbGllbnQgc2lkZSB3aGVuIHJlY2VpdmVkPGJy
PgomZ3Q7IGZyb208YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgc2VydmVyLjxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVGhhbmtzLDxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgUmFodWw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoE9uIFR1ZSwgTWFyIDE3LCAyMDIwIGF0IDY6MTkgQU0gSW1yYW4gRGVz
YWk8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0OzxhIGhyZWY9Im1h
aWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBp
bnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgom
Z3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVz
YWlAaW50ZWwuY29tPC9hPiZndDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5r
Ij5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmlt
cmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNv
bTwvYT4mZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2Fp
QGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4gJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFu
LmRlc2FpQGludGVsLmNvbTwvYT48YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwu
Y29tPC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRl
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+PGJyPgomZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZndDs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5p
bXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNh
aUBpbnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZn
dDsgJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
d3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBTZXQgdGhpcyB1cCB3aXRoIGFsbCBoYW5kbGVzIGluIHVzZSBt
YWRlIHBlcnNpc3RlbnQuIElmPGJyPgomZ3Q7IHlvdTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBz
dGlsbCBzZWU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgaXNzdWVzLCBnZGItYnJlYWsgb3IgdHVybiBvbiBkZWJ1ZyBsb2dnaW5nIGF0IHRoZSBF
c3lzIGNhbGwgYW5kPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGNvbXBhcmU8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdGhlPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGZ1bmN0aW9uIGFyZ3VtZW50cy48YnI+CiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDsgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X188YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0
bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9h
Pjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIg
dGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRh
cmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9y
ZzwvYT4mZ3Q7ICZndDs8YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50
cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBt
MkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMu
MDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7ICZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3Rz
LjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmci
IHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+
dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJA
bGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+
dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3Jn
PC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0
PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0OyAmZ3Q7ICZndDs8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gdHBtMi08YnI+CiZn
dDsgPGEgaHJlZj0ibWFpbHRvOmxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmxl
YXZlQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2
ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwv
YT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0
cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMu
MDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAm
Z3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBt
Mi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTIt
bGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5v
cmc8L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZl
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9h
PiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0OyAmZ3Q7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9i
bGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnRwbTItIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi08L2E+PGJyPgomZ3Q7IDxhIGhyZWY9Im1h
aWx0bzpsZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj5sZWF2ZUBsaXN0cy4wMS5v
cmc8L2E+Jmd0O8KgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMu
MDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi08L2E+PGJy
PgomZ3Q7IDxhIGhyZWY9Im1haWx0bzpsZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5r
Ij5sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJn
ZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1s
ZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVA
bGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxp
c3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiZn
dDsgJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+CiZndDsgJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQp
cy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KPGJy
Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============4453895515227101857==--

