Content-Type: multipart/mixed; boundary="===============6127680460171817364=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Mon, 13 Apr 2020 16:38:39 -0700
Message-ID: <CAP3jAwQvE+B3W3dq83a8oKhyFSA6MXDuewBRrgD0KCOrNMBAtw@mail.gmail.com>
In-Reply-To: CAP3jAwS7HV5nk7O5kAvuHjpuG8NoZUPhsjagDSVo0eVo5XxD5g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6127680460171817364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Looks like the version I have is old, the file tss2_tctildr.h does not exist



On Mon, Apr 13, 2020 at 12:31 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
wrote:

> Ok, got it. I'm using ESAPI C APIs. But its pretty much the same as the
> tpm2 tools implementation.
> How do i add debugs in my poky directory?  I have tpm2.0-tss_2.1.4.bb
> file.
> Also, how to add compile-time log flags to my src file that uses ESAPI
> calls? Running separately was easy, I just called
> TSS2_LOG=3D"all+ERROR,tcti+DEBUG"
>
> On Mon, Apr 13, 2020 at 7:20 AM Roberts, William C <
> william.c.roberts(a)intel.com> wrote:
>
>> > -----Original Message-----
>> > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
>> > Sent: Friday, April 10, 2020 4:15 PM
>> > To: Roberts, William C <william.c.roberts(a)intel.com>
>> > Cc: Desai, Imran <imran.desai(a)intel.com>; tpm2(a)lists.01.org
>> > Subject: Re: [tpm2] Re: ESys_ActivateCredential
>> >
>> > Hi Bill,
>> > I have this on my system: Is tpmrm0 same as tabrmd? I believe mine is
>> using this
>> > right now , i'm changing it to what you mentioned  to see if it helps.
>> > [root(a)nfvis ~]# ls -l /dev/tpm*
>> > crw-rw----. 1 tss root  10,   224 Apr  8 23:19 /dev/tpm0
>> > crw-rw----. 1 tss tss  254, 65536 Apr  8 23:19 /dev/tpmrm0 Thanks, Rah=
ul
>>
>> In theory, yes. In practice no.
>> /dev/tpmrm0 is the in kernel resource manager
>> tpm2-abrmd is the userspace resource manager
>>
>> tpm2-abrmd has a few features tpmrm0 doesn't have, but unless you're
>> using policy sessions with tpm2-tools, you shouldn't notice a difference.
>>
>> >
>> > On Fri, Apr 10, 2020 at 11:33 AM Roberts, William C <
>> william.c.roberts(a)intel.com
>> > <mailto:william.c.roberts(a)intel.com> > wrote:
>> >
>> >
>> >
>> >
>> >       > -----Original Message-----
>> >       > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
>> > <mailto:rahulhardikar(a)gmail.com> ]
>> >       > Sent: Friday, April 10, 2020 1:08 PM
>> >       > To: Roberts, William C <william.c.roberts(a)intel.com
>> > <mailto:william.c.roberts(a)intel.com> >
>> >       > Cc: Desai, Imran <imran.desai(a)intel.com
>> > <mailto:imran.desai(a)intel.com> >; tpm2(a)lists.01.org
>> > <mailto:tpm2(a)lists.01.org>
>> >       > Subject: Re: [tpm2] Re: ESys_ActivateCredential
>> >       >
>> >       > Thanks Bill, trying that.
>> >       >  I did not get debug build tpm2_tss, isn't it all prebuilt ? I
>> will have to see
>> > how to
>> >       > do it in poky.
>> >
>> >       If you're getting it from a package manager, yes. But there's
>> nothing
>> > stopping you
>> >       from using source builds. Some distro's will package debug
>> symbols for
>> > their
>> >       packages.
>> >
>> >       >
>> >       > On Fri, Apr 10, 2020 at 8:16 AM Roberts, William C
>> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
>> >       > <mailto:william.c.roberts(a)intel.com
>> > <mailto:william.c.roberts(a)intel.com> > > wrote:
>> >       >
>> >       >
>> >       >
>> >       >
>> >       >       > -----Original Message-----
>> >       >       > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
>> > <mailto:rahulhardikar(a)gmail.com>
>> >       > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmai=
l.com>
>> >
>> > ]
>> >       >       > Sent: Thursday, April 9, 2020 2:51 PM
>> >       >       > To: Roberts, William C <william.c.roberts(a)intel.com
>> > <mailto:william.c.roberts(a)intel.com>
>> >       > <mailto:william.c.roberts(a)intel.com
>> > <mailto:william.c.roberts(a)intel.com> > >
>> >       >       > Cc: Desai, Imran <imran.desai(a)intel.com
>> > <mailto:imran.desai(a)intel.com>
>> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m> >
>> >;
>> > tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
>> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
>> >       >       > Subject: Re: [tpm2] Re: ESys_ActivateCredential
>> >       >       >
>> >       >       > Thanks Bill. I use this
>> >       >       > Esys_Initialize( &ectx, NULL, NULL);
>> >       >       >
>> >       >       > so i'm assuming it would take the default
>> libtss2-tcti-tabrmd.so.0.
>> >       >
>> >       >       This should do it for you:
>> >       >       TSS2_RC
>> >       >       Tss2_TctiLdr_Initialize (const char *nameConf,
>> >       >                                TSS2_TCTI_CONTEXT **context);
>> >       >
>> >       >       Set nameConf to the string "tabrmd", that should give you
>> a tcti
>> > pointer
>> >       > you can
>> >       >       pass wot Esys_Initialize()
>> >       >
>> >       >       >
>> >       >       >
>> >       >       > If I need to debug Esys_ActivateCredential more, how
>> can I do it,
>> > these
>> >       > APIs are
>> >       >       > no more standalone, I have integrated it in a bigger
>> code base and
>> >       > added the
>> >       >       > esys-tss2 and other libs in my poky build, so now it
>> runs as
>> > different
>> >       > process that
>> >       >       > invokes this function, I can gdb into the process but I
>> can't seem to
>> > gdb
>> >       > into
>> >       >       > Esys_Activate..( )
>> >       >
>> >       >       Did you build tpm2-tss with debug symbols?
>> >       >       Add --enable-debug
>> >       >
>> >       >       >
>> >       >       >
>> >       >       > Thanks,
>> >       >       > Rahul
>> >       >       >
>> >       >       >
>> >       >       >
>> >       >       >
>> >       >       > On Thu, Apr 9, 2020 at 10:23 AM Roberts, William C
>> >       > <william.c.roberts(a)intel.com <mailto:
>> william.c.roberts(a)intel.com>
>> > <mailto:william.c.roberts(a)intel.com <mailto:william.c.roberts(a)inte=
l.com>
>> >
>> >       >       > <mailto:william.c.roberts(a)intel.com
>> > <mailto:william.c.roberts(a)intel.com>
>> >       > <mailto:william.c.roberts(a)intel.com
>> > <mailto:william.c.roberts(a)intel.com> > > > wrote:
>> >       >       >
>> >       >       >
>> >       >       >       > -----Original Message-----
>> >       >       >       > From: Rahul Hardikar [mailto:
>> rahulhardikar(a)gmail.com
>> > <mailto:rahulhardikar(a)gmail.com>
>> >       > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmai=
l.com>
>> >
>> >       >       > <mailto:rahulhardikar(a)gmail.com
>> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
>> > <mailto:rahulhardikar(a)gmail.com> > >
>> >       > ]
>> >       >       >       > Sent: Thursday, April 9, 2020 11:18 AM
>> >       >       >       > To: Desai, Imran <imran.desai(a)intel.com
>> > <mailto:imran.desai(a)intel.com>
>> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m> >
>> >       >       > <mailto:imran.desai(a)intel.com <mailto:
>> imran.desai(a)intel.com>
>> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
>> >       >       >       > Cc: tpm2(a)lists.01.org <mailto:tpm2(a)lists.0=
1.org
>> >
>> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
>> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
>> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
>> >       >       >       > Subject: [tpm2] Re: ESys_ActivateCredential
>> >       >       >       >
>> >       >       >       > How do I know if  RM is being used?
>> >       >       >
>> >       >       >
>> >       >       >       If you set the tcti to the device tcti, it will
>> open /dev/tpm0 by
>> >       > default. And
>> >       >       > that wont
>> >       >       >       Be an RM. You can also give it an option.
>> Esys_Initialize() takes a
>> > tcti
>> >       > as an
>> >       >       > option,
>> >       >       >       NULL will cause it to use the default search
>> behavior of the
>> >       > Tss2_TctiLdr,
>> >       >       > see:
>> >       >       >
>> >       >       >       https://github.com/tpm2-software/tpm2-
>> >       >       > tss/blob/master/man/Tss2_TctiLdr_Initialize.3.in
>> > <http://Tss2_TctiLdr_Initialize.3.in>
>> >       > <http://Tss2_TctiLdr_Initialize.3.in>
>> >       >       >       https://github.com/tpm2-software/tpm2-
>> >       >       > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
>> > <http://Tss2_Tcti_Device_Init.3.in>
>> >       > <http://Tss2_Tcti_Device_Init.3.in>
>> >       >       >       https://github.com/tpm2-software/tpm2-
>> >       > tss/blob/master/man/tss2-
>> >       >       > tcti-device.7.in <http://tcti-device.7.in>  <
>> http://tcti-device.7.in>
>> >       >       >
>> >       >       >       You can use man locally if you prefer as well:
>> >       >       >       man 3 Tss2_TctiLdr_Initialize
>> >       >       >       man 7 tss2-tcti-device
>> >       >       >       man 3 Tss2_Tcti_Device_Init
>> >       >       >
>> >       >       >       Note that https://github.com/tpm2-software/tpm2-
>> >       >       > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
>> > <http://Tss2_Tcti_Device_Init.3.in>
>> >       > <http://Tss2_Tcti_Device_Init.3.in>
>> >       >       >       Has sample code in it.
>> >       >       >
>> >       >       >       If you're using the tools, it supports explicitly
>> choosing the TCTI:
>> >       >       >       https://github.com/tpm2-software/tpm2-
>> >       >       > tools/blob/master/man/common/tcti.md
>> >       >       >
>> >       >       >       Also note that the /dev/tpmrm0 (Notice the RM) is
>> an in-kernel
>> >       > resource
>> >       >       > manager.
>> >       >       >
>> >       >       >
>> >       >       >       > When I do ESys_Initialize, I see these
>> WARNINGs, wondering
>> > if it's
>> >       > okay
>> >       >       > for multi-
>> >       >       >       > thread
>> >       >       >       > WARNING:esys:src/tss2-
>> >       > esys/esys_tcti_default.c:137:tcti_from_file()
>> >       >       > Could not
>> >       >       >       > load TCTI file: libtss2-tcti-default.so <
>> http://libtss2-tcti-
>> >       > default.so/ <http://default.so/> >
>> >       >       > libtss2-tcti-
>> >       >       >       > default.so <http://libtss2-tcti-default.so/>
>> >       >       >       > WARNING:esys:src/tss2-
>> >       > esys/esys_tcti_default.c:137:tcti_from_file()
>> >       >       > Could not
>> >       >       >       > load TCTI file: libtss2-tcti-tabrmd.so <
>> http://libtss2-tcti-
>> >       > tabrmd.so/ <http://tabrmd.so/> >
>> >       >       >       >
>> >       >       >       > In my single threaded process, everything works
>> so smoothly
>> >       > [root]#
>> >       >       > ./tpm
>> >       >       >       > WARNING:esys:src/tss2-
>> >       > esys/esys_tcti_default.c:137:tcti_from_file()
>> >       >       > Could not
>> >       >       >       > load TCTI file: libtss2-tcti-default.so <
>> http://libtss2-tcti-
>> >       > default.so/ <http://default.so/> >
>> >       >       >       > WARNING:esys:src/tss2-
>> >       > esys/esys_tcti_default.c:137:tcti_from_file()
>> >       >       > Could not
>> >       >       >       > load TCTI file: libtss2-tcti-tabrmd.so <
>> http://libtss2-tcti-
>> >       > tabrmd.so/ <http://tabrmd.so/> >
>> >       >       > ESYS
>> >       >       >       > Initialization: Pass
>> >       >       >       >
>> >       >       >       > Read TPM EK Certificate: Pass
>> >       >       >       >
>> >       >       >       > TPM EK Certificate Root-CA Verification: Pass
>> >       >       >       >
>> >       >       >       > Clear TPM State: Pass
>> >       >       >       >
>> >       >       >       > Created EK Primary object: Pass
>> >       >       >       > #####Handle 0x418368
>> >       >       >       >
>> >       >       >       > Create Attestation Key: Pass
>> >       >       >       > #####Ak_Handle 0x41836b
>> >       >       >       >
>> >       >       >       > Original Credential=3D"deadbeefdeadbeefdead"
>> >       >       >       >
>> >       >       >       > Make Credential: Pass
>> >       >       >       > #####Encrypted Credential
>> >       >       >       >
>> >       >       >
>> >       >
>> > Blob=3D"0020508e439bc6512d044bb8739e8d61c8ce3664d25f3572389b46c8797e56=
2a
>> >       >       >       > 45c412864f020a7f1bbcab7a34f0"
>> >       >       >       >
>> >       >       >       > #####Encrypted
>> >       >       >       >
>> >       >       >
>> >       >
>> > Secret=3D"b70689bb0ed9fa8324cfa03d727e6c6795069b4f0943108409b89009b9cc=
76c
>> >       >       >       >
>> >       >       >
>> >       >
>> > 76bddb31a5ccf34cfebc5d3fe715899bb725a8a3c8fe4a6046233869123f3e978051aec
>> >       >       >       >
>> >       >       >
>> >       >
>> > e0d7af0ad6f85164a32fd2c5ad756e8c3b72f6311126de79a30c0d72aa0a6f3f437f6bc
>> >       >       >       >
>> >       >       >
>> >       >
>> > 077c41d3cc6450c71e803ca6074d34ce3debf5114f4bac2fd7ee6a87ef9f07d83079477
>> >       >       >       >
>> >       >       >
>> >       >
>> > 5dda4f77e4620cbaf9aeb302040ee2a66a352b9fffaa5447c09a249bb22d9d989b7f14
>> >       >       >       >
>> >       >       >
>> >       >
>> > 06612a90b8d8bce6bb940fbfd1d50f31398403a2643c73bec336e6fcca46f29f9b6aa87
>> >       >       >       >
>> >       >       >
>> >       >
>> > fd11d53ec6f145d61b2a61dffc783ae2b2c66184435d633d0b5a420efa01748e39d687
>> >       >       >       > e1eb9fcc1759c184972779bfc"
>> >       >       >       >
>> >       >       >       > Activating Credential: Pass
>> >       >       >       > #####Recovered Credential=3D"deadbeefdeadbeefd=
ead"
>> >       >       >       >
>> >       >       >       > [root]#
>> >       >       >       >
>> >       >       >       >
>> >       >       >       >
>> >       >       >       > On Wed, Apr 8, 2020 at 7:02 PM Rahul Hardikar
>> >       >       > <rahulhardikar(a)gmail.com <mailto:
>> rahulhardikar(a)gmail.com>
>> > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
>> >       > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmai=
l.com
>> >
>> > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >=
 >
>> >       >       >       > <mailto:rahulhardikar(a)gmail.com
>> > <mailto:rahulhardikar(a)gmail.com>
>> >       > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmai=
l.com>
>> >
>> > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
>> >       > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmai=
l.com>
>> >
>> > > >
>> >       >       > > wrote:
>> >       >       >       >
>> >       >       >       >
>> >       >       >       >       Thanks guys, I'll try this but  i also
>> wanted to know if there
>> > is a
>> >       > way to
>> >       >       >       > know if the TPM still has the EK and AK keys
>> loaded? I have
>> > the EK
>> >       >       > handle and AK
>> >       >       >       > handle (not made it persistent) but I want to
>> make sure it's
>> >       > present as
>> >       >       > these are
>> >       >       >       > necessary for ActivateCredential to succeed
>> >       >       >       >       ESys_ActivateCredential complaining about
>> secret
>> > parameter
>> >       >       > doesn't
>> >       >       >       > make sense to me, I tested on server side,
>> ak_name is same
>> > as
>> >       > that
>> >       >       > sent and so is
>> >       >       >       > EK_PUB object as well as  EK_Cert in nvram, I
>> call the same
>> >       >       >       > external_makecredential call that's in the
>> GitHub to create
>> > secret
>> >       > and
>> >       >       > made sure
>> >       >       >       > secret,credblob matches on the client side when
>> received
>> > from
>> >       > server.
>> >       >       >       >
>> >       >       >       >       Thanks,
>> >       >       >       >       Rahul
>> >       >       >       >
>> >       >       >       >       On Tue, Mar 17, 2020 at 6:19 AM Imran
>> Desai
>> >       >       > <imran.desai(a)intel.com <mailto:imran.desai(a)intel.c=
om>
>> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
>> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
>> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
>> >       >       >       > <mailto:imran.desai(a)intel.com
>> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
>> > <mailto:imran.desai(a)intel.com> >
>> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
>> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >=
 >
>> >       >       > wrote:
>> >       >       >       >
>> >       >       >       >
>> >       >       >       >               Set this up with all handles in
>> use made persistent. If
>> > you
>> >       > still see
>> >       >       >       > issues, gdb-break or turn on debug logging at
>> the Esys call and
>> >       > compare
>> >       >       > the
>> >       >       >       > function arguments.
>> >       >       >       >
>> >       > _______________________________________________
>> >       >       >       >               tpm2 mailing list --
>> tpm2(a)lists.01.org
>> > <mailto:tpm2(a)lists.01.org>
>> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
>> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
>> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
>> >       >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.or=
g>
>> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
>> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
>> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
>> >       >       >       >               To unsubscribe send an email to
>> tpm2-
>> > leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>
>> >       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.0=
1.org>
>> >
>> >       >       > <mailto:tpm2-leave(a)lists.01.org <mailto:
>> tpm2-leave(a)lists.01.org>
>> > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >=
 >
>> >       >       >       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
>> > leave(a)lists.01.org>  <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
>> > leave(a)lists.01.org> >
>> >       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.0=
1.org
>> >
>> > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >=
 > >
>> >       >       >       >
>> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>> >       >       >       >
>> >       >       >
>> >       >       >
>> >       >
>> >       >
>> >
>> >
>>
>>

--===============6127680460171817364==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0
ciI+TG9va3MgbGlrZSB0aGUgdmVyc2lvbiBJIGhhdmUgaXMgb2xkLCB0aGUgZmlsZcKgPHNwYW4g
c3R5bGU9ImNvbG9yOnJnYigwLDAsMCk7Zm9udC1mYW1pbHk6LXdlYmtpdC1zdGFuZGFyZDtmb250
LXNpemU6bWVkaXVtIj50c3MyX3RjdGlsZHIuaCBkb2VzIG5vdCBleGlzdDwvc3Bhbj48L2Rpdj48
cHJlIHN0eWxlPSJjb2xvcjpyZ2IoMCwwLDApO2ZvbnQtc2l6ZToxNHB4Ij48YnI+PC9wcmU+PC9k
aXY+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRy
IiBjbGFzcz0iZ21haWxfYXR0ciI+T24gTW9uLCBBcHIgMTMsIDIwMjAgYXQgMTI6MzEgUE0gUmFo
dWwgSGFyZGlrYXIgJmx0OzxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSI+
cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVv
dGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2Jv
cmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtib3JkZXItbGVmdC1j
b2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPk9r
LCBnb3QgaXQuIEkmIzM5O20gdXNpbmcgRVNBUEkgQyBBUElzLiBCdXQgaXRzIHByZXR0eSBtdWNo
IHRoZSBzYW1lIGFzIHRoZSB0cG0yIHRvb2xzIGltcGxlbWVudGF0aW9uLjxkaXY+SG93IGRvIGkg
YWRkIGRlYnVncyBpbiBteSBwb2t5IGRpcmVjdG9yeT/CoCBJIGhhdmUgPGEgaHJlZj0iaHR0cDov
L3RwbTIuMC10c3NfMi4xLjQuYmIiIHRhcmdldD0iX2JsYW5rIj50cG0yLjAtdHNzXzIuMS40LmJi
PC9hPiBmaWxlLjwvZGl2PjxkaXY+QWxzbywgaG93IHRvIGFkZCBjb21waWxlLXRpbWUgbG9nIGZs
YWdzIHRvIG15IHNyYyBmaWxlIHRoYXQgdXNlcyBFU0FQSSBjYWxscz8gUnVubmluZyBzZXBhcmF0
ZWx5IHdhcyBlYXN5LCBJIGp1c3QgY2FsbGVkIFRTUzJfTE9HPSZxdW90O2FsbCtFUlJPUix0Y3Rp
K0RFQlVHJnF1b3Q7PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2
IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gTW9uLCBBcHIgMTMsIDIwMjAgYXQgNzoy
MCBBTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5j
b208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDti
b3JkZXItbGVmdC1zdHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQp
O3BhZGRpbmctbGVmdDoxZXgiPiZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+CiZn
dDsgRnJvbTogUmFodWwgSGFyZGlrYXIgW21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJk
aWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwv
YT5dPGJyPgomZ3Q7IFNlbnQ6IEZyaWRheSwgQXByaWwgMTAsIDIwMjAgNDoxNSBQTTxicj4KJmd0
OyBUbzogUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJv
YmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwu
Y29tPC9hPiZndDs8YnI+CiZndDsgQ2M6IERlc2FpLCBJbXJhbiAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVs
LmNvbTwvYT4mZ3Q7OyA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0i
X2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgU3ViamVjdDogUmU6IFt0cG0y
XSBSZTogRVN5c19BY3RpdmF0ZUNyZWRlbnRpYWw8YnI+CiZndDsgPGJyPgomZ3Q7IEhpIEJpbGws
PGJyPgomZ3Q7IEkgaGF2ZSB0aGlzIG9uIG15IHN5c3RlbTogSXMgdHBtcm0wIHNhbWUgYXMgdGFi
cm1kPyBJIGJlbGlldmUgbWluZSBpcyB1c2luZyB0aGlzPGJyPgomZ3Q7IHJpZ2h0IG5vdyAsIGkm
IzM5O20gY2hhbmdpbmcgaXQgdG8gd2hhdCB5b3UgbWVudGlvbmVkwqAgdG8gc2VlIGlmIGl0IGhl
bHBzLjxicj4KJmd0OyBbcm9vdEBuZnZpcyB+XSMgbHMgLWwgL2Rldi90cG0qPGJyPgomZ3Q7IGNy
dy1ydy0tLS0uIDEgdHNzIHJvb3TCoCAxMCzCoCDCoDIyNCBBcHLCoCA4IDIzOjE5IC9kZXYvdHBt
MDxicj4KJmd0OyBjcnctcnctLS0tLiAxIHRzcyB0c3PCoCAyNTQsIDY1NTM2IEFwcsKgIDggMjM6
MTkgL2Rldi90cG1ybTAgVGhhbmtzLCBSYWh1bDxicj4KPGJyPgpJbiB0aGVvcnksIHllcy4gSW4g
cHJhY3RpY2Ugbm8uPGJyPgovZGV2L3RwbXJtMCBpcyB0aGUgaW4ga2VybmVsIHJlc291cmNlIG1h
bmFnZXI8YnI+CnRwbTItYWJybWQgaXMgdGhlIHVzZXJzcGFjZSByZXNvdXJjZSBtYW5hZ2VyPGJy
Pgo8YnI+CnRwbTItYWJybWQgaGFzIGEgZmV3IGZlYXR1cmVzIHRwbXJtMCBkb2VzbiYjMzk7dCBo
YXZlLCBidXQgdW5sZXNzIHlvdSYjMzk7cmU8YnI+CnVzaW5nIHBvbGljeSBzZXNzaW9ucyB3aXRo
IHRwbTItdG9vbHMsIHlvdSBzaG91bGRuJiMzOTt0IG5vdGljZSBhIGRpZmZlcmVuY2UuPGJyPgo8
YnI+CiZndDsgPGJyPgomZ3Q7IE9uIEZyaSwgQXByIDEwLCAyMDIwIGF0IDExOjMzIEFNIFJvYmVy
dHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+
CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsg
Jmd0OyB3cm90ZTo8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IEZyb206IFJhaHVsIEhhcmRpa2FyIFttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBn
bWFpbC5jb208L2E+PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFy
ZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208
L2E+Jmd0OyBdPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFNlbnQ6IEZyaWRheSwgQXByaWwgMTAs
IDIwMjAgMTowOCBQTTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBUbzogUm9iZXJ0cywgV2lsbGlh
bSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4KJmd0OyAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IENjOiBEZXNhaSwgSW1yYW4gJmx0OzxhIGhyZWY9Im1haWx0bzpp
bXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5j
b208L2E+PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZn
dDs7IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRw
bTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0
cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgU3ViamVjdDogUmU6IFt0cG0yXSBSZTogRVN5c19B
Y3RpdmF0ZUNyZWRlbnRpYWw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDsgVGhhbmtzIEJpbGwsIHRyeWluZyB0aGF0Ljxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIEkgZGlkIG5vdCBnZXQgZGVidWcgYnVpbGQgdHBtMl90c3MsIGlzbiYjMzk7dCBpdCBhbGwg
cHJlYnVpbHQgPyBJIHdpbGwgaGF2ZSB0byBzZWU8YnI+CiZndDsgaG93IHRvPGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IGRvIGl0IGluIHBva3kuPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKg
SWYgeW91JiMzOTtyZSBnZXR0aW5nIGl0IGZyb20gYSBwYWNrYWdlIG1hbmFnZXIsIHllcy4gQnV0
IHRoZXJlJiMzOTtzIG5vdGhpbmc8YnI+CiZndDsgc3RvcHBpbmcgeW91PGJyPgomZ3Q7wqAgwqAg
wqAgwqBmcm9tIHVzaW5nIHNvdXJjZSBidWlsZHMuIFNvbWUgZGlzdHJvJiMzOTtzIHdpbGwgcGFj
a2FnZSBkZWJ1ZyBzeW1ib2xzIGZvcjxicj4KJmd0OyB0aGVpcjxicj4KJmd0O8KgIMKgIMKgIMKg
cGFja2FnZXMuPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0OyBPbiBGcmksIEFwciAxMCwgMjAyMCBhdCA4OjE2IEFNIFJvYmVydHMsIFdpbGxp
YW0gQzxicj4KJmd0OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4gJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVy
dHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
PC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0
c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208
L2E+Jmd0OyAmZ3Q7ICZndDsgd3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEZy
b206IFJhaHVsIEhhcmRpa2FyIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJA
Z21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+PGJy
PgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0Ozxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2Fy
QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0Ozxicj4KJmd0OyBd
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFNlbnQ6IFRodXJzZGF5LCBB
cHJpbCA5LCAyMDIwIDI6NTEgUE08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgVG86IFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5y
b2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVs
LmNvbTwvYT48YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJv
YmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwu
Y29tPC9hPiZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlh
bS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFt
LmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgQ2M6IERlc2FpLCBJbXJhbiAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVs
LmNvbTwvYT48YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlA
aW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4u
ZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9h
PiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs7PGJyPgom
Z3Q7IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRw
bTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxp
c3RzLjAxLm9yZzwvYT4mZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgU3ViamVjdDogUmU6IFt0cG0yXSBSZTogRVN5c19BY3RpdmF0ZUNyZWRlbnRpYWw8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgVGhhbmtzIEJpbGwuIEkgdXNlIHRoaXM8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgRXN5c19Jbml0aWFsaXplKCAmYW1wO2VjdHgsIE5VTEws
IE5VTEwpOzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBzbyBpJiMzOTttIGFzc3VtaW5nIGl0IHdvdWxk
IHRha2UgdGhlIGRlZmF1bHTCoCBsaWJ0c3MyLXRjdGktdGFicm1kLnNvLjAuPGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBUaGlzIHNob3Vs
ZCBkbyBpdCBmb3IgeW91Ojxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVFNTMl9S
Qzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVHNzMl9UY3RpTGRyX0luaXRpYWxp
emUgKGNvbnN0IGNoYXIgKm5hbWVDb25mLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFRTUzJfVENUSV9DT05URVhU
ICoqY29udGV4dCk7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqBTZXQgbmFtZUNvbmYgdG8gdGhlIHN0cmluZyAmcXVvdDt0YWJybWQmcXVv
dDssIHRoYXQgc2hvdWxkIGdpdmUgeW91IGEgdGN0aTxicj4KJmd0OyBwb2ludGVyPGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IHlvdSBjYW48YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oHBhc3Mgd290IEVzeXNfSW5pdGlhbGl6ZSgpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IElm
IEkgbmVlZCB0byBkZWJ1ZyBFc3lzX0FjdGl2YXRlQ3JlZGVudGlhbCBtb3JlLCBob3cgY2FuIEkg
ZG8gaXQsPGJyPgomZ3Q7IHRoZXNlPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEFQSXMgYXJlPGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG5vIG1vcmUgc3RhbmRhbG9uZSwg
SSBoYXZlIGludGVncmF0ZWQgaXQgaW4gYSBiaWdnZXIgY29kZSBiYXNlIGFuZDxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0OyBhZGRlZCB0aGU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgZXN5cy10c3MyIGFuZCBvdGhlciBsaWJzIGluIG15IHBva3kgYnVpbGQsIHNvIG5vdyBp
dCBydW5zIGFzPGJyPgomZ3Q7IGRpZmZlcmVudDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBwcm9j
ZXNzIHRoYXQ8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgaW52b2tlcyB0
aGlzIGZ1bmN0aW9uLCBJIGNhbiBnZGIgaW50byB0aGUgcHJvY2VzcyBidXQgSSBjYW4mIzM5O3Qg
c2VlbSB0bzxicj4KJmd0OyBnZGI8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgaW50bzxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBFc3lzX0FjdGl2YXRlLi4oICk8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoERpZCB5
b3UgYnVpbGQgdHBtMi10c3Mgd2l0aCBkZWJ1ZyBzeW1ib2xzPzxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgQWRkIC0tZW5hYmxlLWRlYnVnPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IFRoYW5rcyw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgUmFodWw8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgT24gVGh1LCBBcHIgOSwgMjAyMCBhdCAxMDoyMyBBTSBS
b2JlcnRzLCBXaWxsaWFtIEM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0OzxhIGhyZWY9Im1h
aWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFt
LmMucm9iZXJ0c0BpbnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxp
YW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRz
QGludGVsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndp
bGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2Jl
cnRzQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJv
YmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwu
Y29tPC9hPiZndDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRh
cmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+PGJyPgomZ3Q7ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2Jl
cnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNv
bTwvYT48YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVy
dHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
PC9hPiZndDsgJmd0OyAmZ3Q7ICZndDsgd3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IEZyb206IFJhaHVsIEhhcmRpa2FyIFttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWth
ckBnbWFpbC5jb208L2E+PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVs
aGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5j
b208L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2Fy
QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZn
dDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFy
ZGlrYXJAZ21haWwuY29tPC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1
bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwu
Y29tPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2Fy
QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZn
dDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IF08YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgU2VudDogVGh1cnNkYXksIEFwcmls
IDksIDIwMjAgMTE6MTggQU08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgVG86IERlc2FpLCBJbXJhbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmltcmFu
LmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwv
YT48YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlA
aW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2Js
YW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRl
c2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4g
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDsgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJh
bi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208
L2E+Jmd0OyAmZ3Q7ICZndDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyBDYzogPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxp
c3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRw
bTJAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
PnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxp
c3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+
CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdl
dD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwv
YT4mZ3Q7ICZndDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyBTdWJqZWN0OiBbdHBtMl0gUmU6IEVTeXNfQWN0aXZhdGVDcmVkZW50aWFs
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEhvdyBk
byBJIGtub3cgaWbCoCBSTSBpcyBiZWluZyB1c2VkPzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYgeW91IHNldCB0
aGUgdGN0aSB0byB0aGUgZGV2aWNlIHRjdGksIGl0IHdpbGwgb3BlbiAvZGV2L3RwbTAgYnk8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDsgZGVmYXVsdC4gQW5kPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IHRoYXQgd29udDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgQmUgYW4gUk0uIFlvdSBjYW4gYWxzbyBnaXZlIGl0IGFuIG9wdGlv
bi4gRXN5c19Jbml0aWFsaXplKCkgdGFrZXMgYTxicj4KJmd0OyB0Y3RpPGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IGFzIGFuPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG9w
dGlvbiw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoE5V
TEwgd2lsbCBjYXVzZSBpdCB0byB1c2UgdGhlIGRlZmF1bHQgc2VhcmNoIGJlaGF2aW9yIG9mIHRo
ZTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBUc3MyX1RjdGlMZHIsPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHNlZTo8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2Fy
ZS90cG0yLTwvYT48YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdHNzL2Js
b2IvbWFzdGVyL21hbi88YSBocmVmPSJodHRwOi8vVHNzMl9UY3RpTGRyX0luaXRpYWxpemUuMy5p
biIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+VHNzMl9UY3RpTGRyX0luaXRpYWxp
emUuMy5pbjwvYT48YnI+CiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9Uc3MyX1RjdGlMZHJfSW5p
dGlhbGl6ZS4zLmluIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vVHNz
Ml9UY3RpTGRyX0luaXRpYWxpemUuMy5pbjwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
ICZsdDs8YSBocmVmPSJodHRwOi8vVHNzMl9UY3RpTGRyX0luaXRpYWxpemUuMy5pbiIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL1RzczJfVGN0aUxkcl9Jbml0aWFsaXpl
LjMuaW48L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi0iIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNv
ZnR3YXJlL3RwbTItPC9hPjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB0
c3MvYmxvYi9tYXN0ZXIvbWFuLzxhIGhyZWY9Imh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0luaXQu
My5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+VHNzMl9UY3RpX0RldmljZV9J
bml0LjMuaW48L2E+PGJyPgomZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vVHNzMl9UY3RpX0Rldmlj
ZV9Jbml0LjMuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9Uc3My
X1RjdGlfRGV2aWNlX0luaXQuMy5pbjwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZs
dDs8YSBocmVmPSJodHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW4iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMy5pbjwv
YT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqA8
YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLSIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUv
dHBtMi08L2E+PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRzcy9ibG9iL21hc3Rlci9tYW4vdHNz
Mi08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgPGEgaHJlZj0iaHR0cDov
L3RjdGktZGV2aWNlLjcuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnRjdGkt
ZGV2aWNlLjcuaW48L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vdGN0aS1kZXZpY2UuNy5pbiIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3RjdGktZGV2aWNlLjcuaW48L2E+
Jmd0O8KgICZsdDs8YSBocmVmPSJodHRwOi8vdGN0aS1kZXZpY2UuNy5pbiIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3RjdGktZGV2aWNlLjcuaW48L2E+Jmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgWW91IGNhbiB1c2UgbWFuIGxvY2FsbHkgaWYgeW91
IHByZWZlciBhcyB3ZWxsOjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgbWFuIDMgVHNzMl9UY3RpTGRyX0luaXRpYWxpemU8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoG1hbiA3IHRzczItdGN0aS1kZXZpY2U8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoG1hbiAzIFRzczJf
VGN0aV9EZXZpY2VfSW5pdDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgTm90ZSB0aGF0
IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2Fy
ZS90cG0yLTwvYT48YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdHNzL2Js
b2IvbWFzdGVyL21hbi88YSBocmVmPSJodHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW4i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPlRzczJfVGN0aV9EZXZpY2VfSW5pdC4z
LmluPC9hPjxicj4KJmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL1RzczJfVGN0aV9EZXZpY2VfSW5p
dC4zLmluIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vVHNzMl9UY3Rp
X0RldmljZV9Jbml0LjMuaW48L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7PGEg
aHJlZj0iaHR0cDovL1RzczJfVGN0aV9EZXZpY2VfSW5pdC4zLmluIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW48L2E+Jmd0
Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSGFzIHNh
bXBsZSBjb2RlIGluIGl0Ljxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYgeW91JiMz
OTtyZSB1c2luZyB0aGUgdG9vbHMsIGl0IHN1cHBvcnRzIGV4cGxpY2l0bHkgY2hvb3NpbmcgdGhl
IFRDVEk6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqA8
YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLSIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUv
dHBtMi08L2E+PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRvb2xzL2Js
b2IvbWFzdGVyL21hbi9jb21tb24vdGN0aS5tZDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgQWxzbyBub3RlIHRoYXQgdGhlIC9kZXYvdHBtcm0wIChOb3RpY2UgdGhlIFJNKSBpcyBhbiBp
bi1rZXJuZWw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgcmVzb3VyY2U8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbWFuYWdlci48YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgV2hlbiBJ
IGRvIEVTeXNfSW5pdGlhbGl6ZSwgSSBzZWUgdGhlc2UgV0FSTklOR3MsIHdvbmRlcmluZzxicj4K
Jmd0OyBpZiBpdCYjMzk7czxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBva2F5PGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGZvciBtdWx0aS08YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdGhyZWFkPGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFdBUk5JTkc6ZXN5czpzcmMv
dHNzMi08YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgZXN5cy9lc3lzX3RjdGlfZGVmYXVsdC5jOjEz
Nzp0Y3RpX2Zyb21fZmlsZSgpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IENvdWxkIG5vdDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyBsb2FkIFRDVEkgZmlsZTogbGlidHNzMi10Y3RpLWRlZmF1bHQuc28gJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJ0c3MyLXRjdGktIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vbGlidHNzMi10Y3RpLTwvYT48YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgPGEgaHJl
Zj0iaHR0cDovL2RlZmF1bHQuc28vIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5k
ZWZhdWx0LnNvLzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9kZWZhdWx0LnNvLyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2RlZmF1bHQuc28vPC9hPiZndDsgJmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBsaWJ0c3MyLXRjdGktPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGRlZmF1bHQu
c28gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0c3MyLXRjdGktZGVmYXVsdC5zby8iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0c3MyLXRjdGktZGVmYXVsdC5zby88
L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyBXQVJOSU5HOmVzeXM6c3JjL3RzczItPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGVzeXMv
ZXN5c190Y3RpX2RlZmF1bHQuYzoxMzc6dGN0aV9mcm9tX2ZpbGUoKTxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBDb3VsZCBub3Q8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbG9hZCBUQ1RJIGZpbGU6IGxpYnRzczItdGN0
aS10YWJybWQuc28gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0c3MyLXRjdGktIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlidHNzMi10Y3RpLTwvYT48YnI+CiZndDvC
oCDCoCDCoCDCoCZndDsgPGEgaHJlZj0iaHR0cDovL3RhYnJtZC5zby8iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPnRhYnJtZC5zby88L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vdGFi
cm1kLnNvLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3RhYnJtZC5z
by88L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IEluIG15IHNpbmdsZSB0aHJlYWRlZCBwcm9jZXNzLCBldmVyeXRoaW5nIHdvcmtz
IHNvIHNtb290aGx5PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFtyb290XSM8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgLi90cG08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgV0FSTklORzplc3lzOnNyYy90c3MyLTxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0OyBlc3lzL2VzeXNfdGN0aV9kZWZhdWx0LmM6MTM3OnRjdGlfZnJv
bV9maWxlKCk8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQ291bGQgbm90
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGxv
YWQgVENUSSBmaWxlOiBsaWJ0c3MyLXRjdGktZGVmYXVsdC5zbyAmbHQ7PGEgaHJlZj0iaHR0cDov
L2xpYnRzczItdGN0aS0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9s
aWJ0c3MyLXRjdGktPC9hPjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyA8YSBocmVmPSJodHRwOi8v
ZGVmYXVsdC5zby8iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmRlZmF1bHQuc28v
PC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL2RlZmF1bHQuc28vIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vZGVmYXVsdC5zby88L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFdBUk5JTkc6ZXN5czpz
cmMvdHNzMi08YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgZXN5cy9lc3lzX3RjdGlfZGVmYXVsdC5j
OjEzNzp0Y3RpX2Zyb21fZmlsZSgpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IENvdWxkIG5vdDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyBsb2FkIFRDVEkgZmlsZTogbGlidHNzMi10Y3RpLXRhYnJtZC5zbyAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYnRzczItdGN0aS0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly9saWJ0c3MyLXRjdGktPC9hPjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyA8YSBo
cmVmPSJodHRwOi8vdGFicm1kLnNvLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
dGFicm1kLnNvLzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly90YWJybWQuc28vIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vdGFicm1kLnNvLzwvYT4mZ3Q7ICZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgRVNZUzxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBJbml0aWFsaXphdGlvbjogUGFz
czxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBSZWFk
IFRQTSBFSyBDZXJ0aWZpY2F0ZTogUGFzczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyBUUE0gRUsgQ2VydGlmaWNhdGUgUm9vdC1DQSBWZXJpZmljYXRp
b246IFBhc3M8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgQ2xlYXIgVFBNIFN0YXRlOiBQYXNzPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IENyZWF0ZWQgRUsgUHJpbWFyeSBvYmplY3Q6IFBhc3M8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgIyMjIyNIYW5k
bGUgMHg0MTgzNjg8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgQ3JlYXRlIEF0dGVzdGF0aW9uIEtleTogUGFzczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjIyMjI0FrX0hhbmRsZSAweDQxODM2Yjxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBPcmlnaW5h
bCBDcmVkZW50aWFsPSZxdW90O2RlYWRiZWVmZGVhZGJlZWZkZWFkJnF1b3Q7PGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE1ha2UgQ3JlZGVudGlhbDog
UGFzczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyAjIyMjI0VuY3J5cHRlZCBDcmVkZW50aWFsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IEJsb2I9JnF1b3Q7MDAyMDUw
OGU0MzliYzY1MTJkMDQ0YmI4NzM5ZThkNjFjOGNlMzY2NGQyNWYzNTcyMzg5YjQ2Yzg3OTdlNTYy
YTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyA0
NWM0MTI4NjRmMDIwYTdmMWJiY2FiN2EzNGYwJnF1b3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICMjIyMjRW5jcnlwdGVkPGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IFNl
Y3JldD0mcXVvdDtiNzA2ODliYjBlZDlmYTgzMjRjZmEwM2Q3MjdlNmM2Nzk1MDY5YjRmMDk0MzEw
ODQwOWI4OTAwOWI5Y2M3NmM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgNzZiZGRiMzFhNWNjZjM0Y2ZlYmM1ZDNmZTcx
NTg5OWJiNzI1YThhM2M4ZmU0YTYwNDYyMzM4NjkxMjNmM2U5NzgwNTFhZWM8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsg
ZTBkN2FmMGFkNmY4NTE2NGEzMmZkMmM1YWQ3NTZlOGMzYjcyZjYzMTExMjZkZTc5YTMwYzBkNzJh
YTBhNmYzZjQzN2Y2YmM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgMDc3YzQxZDNjYzY0NTBjNzFlODAzY2E2MDc0ZDM0
Y2UzZGViZjUxMTRmNGJhYzJmZDdlZTZhODdlZjlmMDdkODMwNzk0Nzc8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgNWRk
YTRmNzdlNDYyMGNiYWY5YWViMzAyMDQwZWUyYTY2YTM1MmI5ZmZmYWE1NDQ3YzA5YTI0OWJiMjJk
OWQ5ODliN2YxNDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4KJmd0OyAwNjYxMmE5MGI4ZDhiY2U2YmI5NDBmYmZkMWQ1MGYzMTM5
ODQwM2EyNjQzYzczYmVjMzM2ZTZmY2NhNDZmMjlmOWI2YWE4Nzxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0OyBmZDExZDUz
ZWM2ZjE0NWQ2MWIyYTYxZGZmYzc4M2FlMmIyYzY2MTg0NDM1ZDYzM2QwYjVhNDIwZWZhMDE3NDhl
MzlkNjg3PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IGUxZWI5ZmNjMTc1OWMxODQ5NzI3NzliZmMmcXVvdDs8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQWN0aXZhdGluZyBDcmVkZW50aWFsOiBQYXNz
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICMj
IyMjUmVjb3ZlcmVkIENyZWRlbnRpYWw9JnF1b3Q7ZGVhZGJlZWZkZWFkYmVlZmRlYWQmcXVvdDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgW3Jvb3Rd
Izxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBPbiBXZWQsIEFw
ciA4LCAyMDIwIGF0IDc6MDIgUE0gUmFodWwgSGFyZGlrYXI8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWls
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDs8YnI+CiZndDsgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5y
YWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFo
dWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWls
LmNvbTwvYT4mZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1
bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxo
YXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNv
bTwvYT4mZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2Js
YW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT48YnI+CiZndDsgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1
bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWth
ckBnbWFpbC5jb208L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWth
ckBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJA
Z21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0
Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1
bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwu
Y29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0Ozxi
cj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
Jmd0OyB3cm90ZTo8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoFRoYW5rcyBndXlzLCBJJiMzOTtsbCB0cnkgdGhpcyBidXTCoCBpIGFsc28g
d2FudGVkIHRvIGtub3cgaWYgdGhlcmU8YnI+CiZndDsgaXMgYTxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0OyB3YXkgdG88YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsga25vdyBpZiB0aGUgVFBNIHN0aWxsIGhhcyB0aGUgRUsgYW5kIEFLIGtleXMgbG9h
ZGVkPyBJIGhhdmU8YnI+CiZndDsgdGhlIEVLPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IGhhbmRsZSBhbmQgQUs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgaGFuZGxlIChub3QgbWFkZSBpdCBwZXJzaXN0ZW50KSBidXQg
SSB3YW50IHRvIG1ha2Ugc3VyZSBpdCYjMzk7czxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBwcmVz
ZW50IGFzPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRoZXNlIGFyZTxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBuZWNl
c3NhcnkgZm9yIEFjdGl2YXRlQ3JlZGVudGlhbCB0byBzdWNjZWVkPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBFU3lzX0FjdGl2
YXRlQ3JlZGVudGlhbCBjb21wbGFpbmluZyBhYm91dCBzZWNyZXQ8YnI+CiZndDsgcGFyYW1ldGVy
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGRvZXNuJiMzOTt0PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG1ha2Ugc2Vu
c2UgdG8gbWUsIEkgdGVzdGVkIG9uIHNlcnZlciBzaWRlLCBha19uYW1lIGlzIHNhbWU8YnI+CiZn
dDsgYXM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgdGhhdDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyBzZW50IGFuZCBzbyBpczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBFS19QVUIgb2JqZWN0IGFzIHdlbGwgYXPCoCBF
S19DZXJ0IGluIG52cmFtLCBJIGNhbGwgdGhlIHNhbWU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgZXh0ZXJuYWxfbWFrZWNyZWRlbnRpYWwgY2Fs
bCB0aGF0JiMzOTtzIGluIHRoZSBHaXRIdWIgdG8gY3JlYXRlPGJyPgomZ3Q7IHNlY3JldDxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0OyBhbmQ8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgbWFkZSBzdXJlPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IHNlY3JldCxjcmVkYmxvYiBtYXRjaGVzIG9uIHRoZSBjbGllbnQgc2lkZSB3
aGVuIHJlY2VpdmVkPGJyPgomZ3Q7IGZyb208YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgc2VydmVy
Ljxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgVGhhbmtzLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgUmFodWw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoE9uIFR1ZSwgTWFyIDE3LCAyMDIwIGF0IDY6
MTkgQU0gSW1yYW4gRGVzYWk8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
Jmx0OzxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5r
Ij5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmlt
cmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNv
bTwvYT4mZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2Fp
QGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4gJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20i
IHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFu
LmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGlu
dGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgJmd0OyAm
Z3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+CiZndDsgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1y
YW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpp
bXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5j
b208L2E+PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1y
YW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29t
PC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRh
cmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2Js
YW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVs
LmNvbTwvYT4mZ3Q7ICZndDsgJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgd3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBTZXQgdGhpcyB1cCB3aXRoIGFsbCBo
YW5kbGVzIGluIHVzZSBtYWRlIHBlcnNpc3RlbnQuIElmPGJyPgomZ3Q7IHlvdTxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0OyBzdGlsbCBzZWU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgaXNzdWVzLCBnZGItYnJlYWsgb3IgdHVybiBvbiBkZWJ1ZyBs
b2dnaW5nIGF0IHRoZSBFc3lzIGNhbGwgYW5kPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGNvbXBh
cmU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdGhlPGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGZ1bmN0aW9uIGFyZ3Vt
ZW50cy48YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX188YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRwbTIgbWFpbGluZyBsaXN0IC0t
IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJA
bGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0y
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50
cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7ICZndDs8YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAx
Lm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRh
cmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJn
ZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8
L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2Js
YW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBt
MkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7
PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0
YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5v
cmc8L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0
YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRw
bTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0OyAm
Z3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwg
dG8gdHBtMi08YnI+CiZndDsgPGEgaHJlZj0ibWFpbHRvOmxlYXZlQGxpc3RzLjAxLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPmxlYXZlQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZl
QGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+
dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRw
bTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4w
MS5vcmc8L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJn
ZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1s
ZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVA
bGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxp
c3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiZn
dDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnRwbTItIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi08L2E+PGJyPgom
Z3Q7IDxhIGhyZWY9Im1haWx0bzpsZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj5s
ZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0O8KgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRw
bTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4w
MS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItIiB0YXJnZXQ9Il9ibGFu
ayI+dHBtMi08L2E+PGJyPgomZ3Q7IDxhIGhyZWY9Im1haWx0bzpsZWF2ZUBsaXN0cy4wMS5vcmci
IHRhcmdldD0iX2JsYW5rIj5sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9
Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxh
bmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlz
dHMuMDEub3JnPC9hPiZndDsgJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgJSh3ZWJfcGFnZV91cmwpc2xp
c3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgPGJy
PgomZ3Q7IDxicj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============6127680460171817364==--

