Content-Type: multipart/mixed; boundary="===============2194821534861947900=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Mon, 13 Apr 2020 16:54:50 -0700
Message-ID: <CAP3jAwS4hPs3xceD19mYBgs1-t_mjRsuT+yey3gM6-nECPg1Vg@mail.gmail.com>
In-Reply-To: CAP3jAwQvE+B3W3dq83a8oKhyFSA6MXDuewBRrgD0KCOrNMBAtw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2194821534861947900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

What is the latest stable release for tpm2_tss ?

Thanks,
Rahul

On Mon, Apr 13, 2020 at 4:38 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
wrote:

> Looks like the version I have is old, the file tss2_tctildr.h does not
> exist
>
>
>
> On Mon, Apr 13, 2020 at 12:31 PM Rahul Hardikar <rahulhardikar(a)gmail.co=
m>
> wrote:
>
>> Ok, got it. I'm using ESAPI C APIs. But its pretty much the same as the
>> tpm2 tools implementation.
>> How do i add debugs in my poky directory?  I have tpm2.0-tss_2.1.4.bb
>> file.
>> Also, how to add compile-time log flags to my src file that uses ESAPI
>> calls? Running separately was easy, I just called
>> TSS2_LOG=3D"all+ERROR,tcti+DEBUG"
>>
>> On Mon, Apr 13, 2020 at 7:20 AM Roberts, William C <
>> william.c.roberts(a)intel.com> wrote:
>>
>>> > -----Original Message-----
>>> > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
>>> > Sent: Friday, April 10, 2020 4:15 PM
>>> > To: Roberts, William C <william.c.roberts(a)intel.com>
>>> > Cc: Desai, Imran <imran.desai(a)intel.com>; tpm2(a)lists.01.org
>>> > Subject: Re: [tpm2] Re: ESys_ActivateCredential
>>> >
>>> > Hi Bill,
>>> > I have this on my system: Is tpmrm0 same as tabrmd? I believe mine is
>>> using this
>>> > right now , i'm changing it to what you mentioned  to see if it helps.
>>> > [root(a)nfvis ~]# ls -l /dev/tpm*
>>> > crw-rw----. 1 tss root  10,   224 Apr  8 23:19 /dev/tpm0
>>> > crw-rw----. 1 tss tss  254, 65536 Apr  8 23:19 /dev/tpmrm0 Thanks,
>>> Rahul
>>>
>>> In theory, yes. In practice no.
>>> /dev/tpmrm0 is the in kernel resource manager
>>> tpm2-abrmd is the userspace resource manager
>>>
>>> tpm2-abrmd has a few features tpmrm0 doesn't have, but unless you're
>>> using policy sessions with tpm2-tools, you shouldn't notice a differenc=
e.
>>>
>>> >
>>> > On Fri, Apr 10, 2020 at 11:33 AM Roberts, William C <
>>> william.c.roberts(a)intel.com
>>> > <mailto:william.c.roberts(a)intel.com> > wrote:
>>> >
>>> >
>>> >
>>> >
>>> >       > -----Original Message-----
>>> >       > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
>>> > <mailto:rahulhardikar(a)gmail.com> ]
>>> >       > Sent: Friday, April 10, 2020 1:08 PM
>>> >       > To: Roberts, William C <william.c.roberts(a)intel.com
>>> > <mailto:william.c.roberts(a)intel.com> >
>>> >       > Cc: Desai, Imran <imran.desai(a)intel.com
>>> > <mailto:imran.desai(a)intel.com> >; tpm2(a)lists.01.org
>>> > <mailto:tpm2(a)lists.01.org>
>>> >       > Subject: Re: [tpm2] Re: ESys_ActivateCredential
>>> >       >
>>> >       > Thanks Bill, trying that.
>>> >       >  I did not get debug build tpm2_tss, isn't it all prebuilt ? I
>>> will have to see
>>> > how to
>>> >       > do it in poky.
>>> >
>>> >       If you're getting it from a package manager, yes. But there's
>>> nothing
>>> > stopping you
>>> >       from using source builds. Some distro's will package debug
>>> symbols for
>>> > their
>>> >       packages.
>>> >
>>> >       >
>>> >       > On Fri, Apr 10, 2020 at 8:16 AM Roberts, William C
>>> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
>>> >       > <mailto:william.c.roberts(a)intel.com
>>> > <mailto:william.c.roberts(a)intel.com> > > wrote:
>>> >       >
>>> >       >
>>> >       >
>>> >       >
>>> >       >       > -----Original Message-----
>>> >       >       > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
>>> > <mailto:rahulhardikar(a)gmail.com>
>>> >       > <mailto:rahulhardikar(a)gmail.com <mailto:
>>> rahulhardikar(a)gmail.com> >
>>> > ]
>>> >       >       > Sent: Thursday, April 9, 2020 2:51 PM
>>> >       >       > To: Roberts, William C <william.c.roberts(a)intel.com
>>> > <mailto:william.c.roberts(a)intel.com>
>>> >       > <mailto:william.c.roberts(a)intel.com
>>> > <mailto:william.c.roberts(a)intel.com> > >
>>> >       >       > Cc: Desai, Imran <imran.desai(a)intel.com
>>> > <mailto:imran.desai(a)intel.com>
>>> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.c=
om>
>>> > >;
>>> > tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
>>> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
>>> >       >       > Subject: Re: [tpm2] Re: ESys_ActivateCredential
>>> >       >       >
>>> >       >       > Thanks Bill. I use this
>>> >       >       > Esys_Initialize( &ectx, NULL, NULL);
>>> >       >       >
>>> >       >       > so i'm assuming it would take the default
>>> libtss2-tcti-tabrmd.so.0.
>>> >       >
>>> >       >       This should do it for you:
>>> >       >       TSS2_RC
>>> >       >       Tss2_TctiLdr_Initialize (const char *nameConf,
>>> >       >                                TSS2_TCTI_CONTEXT **context);
>>> >       >
>>> >       >       Set nameConf to the string "tabrmd", that should give
>>> you a tcti
>>> > pointer
>>> >       > you can
>>> >       >       pass wot Esys_Initialize()
>>> >       >
>>> >       >       >
>>> >       >       >
>>> >       >       > If I need to debug Esys_ActivateCredential more, how
>>> can I do it,
>>> > these
>>> >       > APIs are
>>> >       >       > no more standalone, I have integrated it in a bigger
>>> code base and
>>> >       > added the
>>> >       >       > esys-tss2 and other libs in my poky build, so now it
>>> runs as
>>> > different
>>> >       > process that
>>> >       >       > invokes this function, I can gdb into the process but
>>> I can't seem to
>>> > gdb
>>> >       > into
>>> >       >       > Esys_Activate..( )
>>> >       >
>>> >       >       Did you build tpm2-tss with debug symbols?
>>> >       >       Add --enable-debug
>>> >       >
>>> >       >       >
>>> >       >       >
>>> >       >       > Thanks,
>>> >       >       > Rahul
>>> >       >       >
>>> >       >       >
>>> >       >       >
>>> >       >       >
>>> >       >       > On Thu, Apr 9, 2020 at 10:23 AM Roberts, William C
>>> >       > <william.c.roberts(a)intel.com <mailto:
>>> william.c.roberts(a)intel.com>
>>> > <mailto:william.c.roberts(a)intel.com <mailto:
>>> william.c.roberts(a)intel.com> >
>>> >       >       > <mailto:william.c.roberts(a)intel.com
>>> > <mailto:william.c.roberts(a)intel.com>
>>> >       > <mailto:william.c.roberts(a)intel.com
>>> > <mailto:william.c.roberts(a)intel.com> > > > wrote:
>>> >       >       >
>>> >       >       >
>>> >       >       >       > -----Original Message-----
>>> >       >       >       > From: Rahul Hardikar [mailto:
>>> rahulhardikar(a)gmail.com
>>> > <mailto:rahulhardikar(a)gmail.com>
>>> >       > <mailto:rahulhardikar(a)gmail.com <mailto:
>>> rahulhardikar(a)gmail.com> >
>>> >       >       > <mailto:rahulhardikar(a)gmail.com
>>> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
>>> > <mailto:rahulhardikar(a)gmail.com> > >
>>> >       > ]
>>> >       >       >       > Sent: Thursday, April 9, 2020 11:18 AM
>>> >       >       >       > To: Desai, Imran <imran.desai(a)intel.com
>>> > <mailto:imran.desai(a)intel.com>
>>> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.c=
om> >
>>> >       >       > <mailto:imran.desai(a)intel.com <mailto:
>>> imran.desai(a)intel.com>
>>> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
>>> >       >       >       > Cc: tpm2(a)lists.01.org <mailto:
>>> tpm2(a)lists.01.org>
>>> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
>>> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
>>> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
>>> >       >       >       > Subject: [tpm2] Re: ESys_ActivateCredential
>>> >       >       >       >
>>> >       >       >       > How do I know if  RM is being used?
>>> >       >       >
>>> >       >       >
>>> >       >       >       If you set the tcti to the device tcti, it will
>>> open /dev/tpm0 by
>>> >       > default. And
>>> >       >       > that wont
>>> >       >       >       Be an RM. You can also give it an option.
>>> Esys_Initialize() takes a
>>> > tcti
>>> >       > as an
>>> >       >       > option,
>>> >       >       >       NULL will cause it to use the default search
>>> behavior of the
>>> >       > Tss2_TctiLdr,
>>> >       >       > see:
>>> >       >       >
>>> >       >       >       https://github.com/tpm2-software/tpm2-
>>> >       >       > tss/blob/master/man/Tss2_TctiLdr_Initialize.3.in
>>> > <http://Tss2_TctiLdr_Initialize.3.in>
>>> >       > <http://Tss2_TctiLdr_Initialize.3.in>
>>> >       >       >       https://github.com/tpm2-software/tpm2-
>>> >       >       > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
>>> > <http://Tss2_Tcti_Device_Init.3.in>
>>> >       > <http://Tss2_Tcti_Device_Init.3.in>
>>> >       >       >       https://github.com/tpm2-software/tpm2-
>>> >       > tss/blob/master/man/tss2-
>>> >       >       > tcti-device.7.in <http://tcti-device.7.in>  <
>>> http://tcti-device.7.in>
>>> >       >       >
>>> >       >       >       You can use man locally if you prefer as well:
>>> >       >       >       man 3 Tss2_TctiLdr_Initialize
>>> >       >       >       man 7 tss2-tcti-device
>>> >       >       >       man 3 Tss2_Tcti_Device_Init
>>> >       >       >
>>> >       >       >       Note that https://github.com/tpm2-software/tpm2-
>>> >       >       > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
>>> > <http://Tss2_Tcti_Device_Init.3.in>
>>> >       > <http://Tss2_Tcti_Device_Init.3.in>
>>> >       >       >       Has sample code in it.
>>> >       >       >
>>> >       >       >       If you're using the tools, it supports
>>> explicitly choosing the TCTI:
>>> >       >       >       https://github.com/tpm2-software/tpm2-
>>> >       >       > tools/blob/master/man/common/tcti.md
>>> >       >       >
>>> >       >       >       Also note that the /dev/tpmrm0 (Notice the RM)
>>> is an in-kernel
>>> >       > resource
>>> >       >       > manager.
>>> >       >       >
>>> >       >       >
>>> >       >       >       > When I do ESys_Initialize, I see these
>>> WARNINGs, wondering
>>> > if it's
>>> >       > okay
>>> >       >       > for multi-
>>> >       >       >       > thread
>>> >       >       >       > WARNING:esys:src/tss2-
>>> >       > esys/esys_tcti_default.c:137:tcti_from_file()
>>> >       >       > Could not
>>> >       >       >       > load TCTI file: libtss2-tcti-default.so <
>>> http://libtss2-tcti-
>>> >       > default.so/ <http://default.so/> >
>>> >       >       > libtss2-tcti-
>>> >       >       >       > default.so <http://libtss2-tcti-default.so/>
>>> >       >       >       > WARNING:esys:src/tss2-
>>> >       > esys/esys_tcti_default.c:137:tcti_from_file()
>>> >       >       > Could not
>>> >       >       >       > load TCTI file: libtss2-tcti-tabrmd.so <
>>> http://libtss2-tcti-
>>> >       > tabrmd.so/ <http://tabrmd.so/> >
>>> >       >       >       >
>>> >       >       >       > In my single threaded process, everything
>>> works so smoothly
>>> >       > [root]#
>>> >       >       > ./tpm
>>> >       >       >       > WARNING:esys:src/tss2-
>>> >       > esys/esys_tcti_default.c:137:tcti_from_file()
>>> >       >       > Could not
>>> >       >       >       > load TCTI file: libtss2-tcti-default.so <
>>> http://libtss2-tcti-
>>> >       > default.so/ <http://default.so/> >
>>> >       >       >       > WARNING:esys:src/tss2-
>>> >       > esys/esys_tcti_default.c:137:tcti_from_file()
>>> >       >       > Could not
>>> >       >       >       > load TCTI file: libtss2-tcti-tabrmd.so <
>>> http://libtss2-tcti-
>>> >       > tabrmd.so/ <http://tabrmd.so/> >
>>> >       >       > ESYS
>>> >       >       >       > Initialization: Pass
>>> >       >       >       >
>>> >       >       >       > Read TPM EK Certificate: Pass
>>> >       >       >       >
>>> >       >       >       > TPM EK Certificate Root-CA Verification: Pass
>>> >       >       >       >
>>> >       >       >       > Clear TPM State: Pass
>>> >       >       >       >
>>> >       >       >       > Created EK Primary object: Pass
>>> >       >       >       > #####Handle 0x418368
>>> >       >       >       >
>>> >       >       >       > Create Attestation Key: Pass
>>> >       >       >       > #####Ak_Handle 0x41836b
>>> >       >       >       >
>>> >       >       >       > Original Credential=3D"deadbeefdeadbeefdead"
>>> >       >       >       >
>>> >       >       >       > Make Credential: Pass
>>> >       >       >       > #####Encrypted Credential
>>> >       >       >       >
>>> >       >       >
>>> >       >
>>> > Blob=3D"0020508e439bc6512d044bb8739e8d61c8ce3664d25f3572389b46c8797e5=
62a
>>> >       >       >       > 45c412864f020a7f1bbcab7a34f0"
>>> >       >       >       >
>>> >       >       >       > #####Encrypted
>>> >       >       >       >
>>> >       >       >
>>> >       >
>>> > Secret=3D"b70689bb0ed9fa8324cfa03d727e6c6795069b4f0943108409b89009b9c=
c76c
>>> >       >       >       >
>>> >       >       >
>>> >       >
>>> > 76bddb31a5ccf34cfebc5d3fe715899bb725a8a3c8fe4a6046233869123f3e978051a=
ec
>>> >       >       >       >
>>> >       >       >
>>> >       >
>>> > e0d7af0ad6f85164a32fd2c5ad756e8c3b72f6311126de79a30c0d72aa0a6f3f437f6=
bc
>>> >       >       >       >
>>> >       >       >
>>> >       >
>>> > 077c41d3cc6450c71e803ca6074d34ce3debf5114f4bac2fd7ee6a87ef9f07d830794=
77
>>> >       >       >       >
>>> >       >       >
>>> >       >
>>> > 5dda4f77e4620cbaf9aeb302040ee2a66a352b9fffaa5447c09a249bb22d9d989b7f14
>>> >       >       >       >
>>> >       >       >
>>> >       >
>>> > 06612a90b8d8bce6bb940fbfd1d50f31398403a2643c73bec336e6fcca46f29f9b6aa=
87
>>> >       >       >       >
>>> >       >       >
>>> >       >
>>> > fd11d53ec6f145d61b2a61dffc783ae2b2c66184435d633d0b5a420efa01748e39d687
>>> >       >       >       > e1eb9fcc1759c184972779bfc"
>>> >       >       >       >
>>> >       >       >       > Activating Credential: Pass
>>> >       >       >       > #####Recovered
>>> Credential=3D"deadbeefdeadbeefdead"
>>> >       >       >       >
>>> >       >       >       > [root]#
>>> >       >       >       >
>>> >       >       >       >
>>> >       >       >       >
>>> >       >       >       > On Wed, Apr 8, 2020 at 7:02 PM Rahul Hardikar
>>> >       >       > <rahulhardikar(a)gmail.com <mailto:
>>> rahulhardikar(a)gmail.com>
>>> > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
>>> >       > <mailto:rahulhardikar(a)gmail.com <mailto:
>>> rahulhardikar(a)gmail.com>
>>> > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> =
> >
>>> >       >       >       > <mailto:rahulhardikar(a)gmail.com
>>> > <mailto:rahulhardikar(a)gmail.com>
>>> >       > <mailto:rahulhardikar(a)gmail.com <mailto:
>>> rahulhardikar(a)gmail.com> >
>>> > <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
>>> >       > <mailto:rahulhardikar(a)gmail.com <mailto:
>>> rahulhardikar(a)gmail.com> >
>>> > > >
>>> >       >       > > wrote:
>>> >       >       >       >
>>> >       >       >       >
>>> >       >       >       >       Thanks guys, I'll try this but  i also
>>> wanted to know if there
>>> > is a
>>> >       > way to
>>> >       >       >       > know if the TPM still has the EK and AK keys
>>> loaded? I have
>>> > the EK
>>> >       >       > handle and AK
>>> >       >       >       > handle (not made it persistent) but I want to
>>> make sure it's
>>> >       > present as
>>> >       >       > these are
>>> >       >       >       > necessary for ActivateCredential to succeed
>>> >       >       >       >       ESys_ActivateCredential complaining
>>> about secret
>>> > parameter
>>> >       >       > doesn't
>>> >       >       >       > make sense to me, I tested on server side,
>>> ak_name is same
>>> > as
>>> >       > that
>>> >       >       > sent and so is
>>> >       >       >       > EK_PUB object as well as  EK_Cert in nvram, I
>>> call the same
>>> >       >       >       > external_makecredential call that's in the
>>> GitHub to create
>>> > secret
>>> >       > and
>>> >       >       > made sure
>>> >       >       >       > secret,credblob matches on the client side
>>> when received
>>> > from
>>> >       > server.
>>> >       >       >       >
>>> >       >       >       >       Thanks,
>>> >       >       >       >       Rahul
>>> >       >       >       >
>>> >       >       >       >       On Tue, Mar 17, 2020 at 6:19 AM Imran
>>> Desai
>>> >       >       > <imran.desai(a)intel.com <mailto:imran.desai(a)intel.=
com>
>>> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
>>> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.c=
om>
>>> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
>>> >       >       >       > <mailto:imran.desai(a)intel.com
>>> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
>>> > <mailto:imran.desai(a)intel.com> >
>>> >       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.c=
om>
>>> > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > =
> >
>>> >       >       > wrote:
>>> >       >       >       >
>>> >       >       >       >
>>> >       >       >       >               Set this up with all handles in
>>> use made persistent. If
>>> > you
>>> >       > still see
>>> >       >       >       > issues, gdb-break or turn on debug logging at
>>> the Esys call and
>>> >       > compare
>>> >       >       > the
>>> >       >       >       > function arguments.
>>> >       >       >       >
>>> >       > _______________________________________________
>>> >       >       >       >               tpm2 mailing list --
>>> tpm2(a)lists.01.org
>>> > <mailto:tpm2(a)lists.01.org>
>>> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
>>> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
>>> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
>>> >       >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.o=
rg>
>>> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
>>> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
>>> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
>>> >       >       >       >               To unsubscribe send an email to
>>> tpm2-
>>> > leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>
>>> >       > <mailto:tpm2-leave(a)lists.01.org <mailto:
>>> tpm2-leave(a)lists.01.org> >
>>> >       >       > <mailto:tpm2-leave(a)lists.01.org <mailto:
>>> tpm2-leave(a)lists.01.org>
>>> > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> =
> >
>>> >       >       >       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm=
2-
>>> > leave(a)lists.01.org>  <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
>>> > leave(a)lists.01.org> >
>>> >       > <mailto:tpm2-leave(a)lists.01.org <mailto:
>>> tpm2-leave(a)lists.01.org>
>>> > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> =
> > >
>>> >       >       >       >
>>> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>>> >       >       >       >
>>> >       >       >
>>> >       >       >
>>> >       >
>>> >       >
>>> >
>>> >
>>>
>>>

--===============2194821534861947900==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+V2hhdCBpcyB0aGUgbGF0ZXN0IHN0YWJsZcKgcmVsZWFzZSBmb3IgdHBt
Ml90c3MgPzxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmtzLDwvZGl2PjxkaXY+UmFodWw8L2Rpdj48
L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJn
bWFpbF9hdHRyIj5PbiBNb24sIEFwciAxMywgMjAyMCBhdCA0OjM4IFBNIFJhaHVsIEhhcmRpa2Fy
ICZsdDs8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iPnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdC13
aWR0aDoxcHg7Ym9yZGVyLWxlZnQtc3R5bGU6c29saWQ7Ym9yZGVyLWxlZnQtY29sb3I6cmdiKDIw
NCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRy
Ij48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj5Mb29rcyBsaWtlIHRoZSB2ZXJzaW9uIEkg
aGF2ZSBpcyBvbGQsIHRoZSBmaWxlwqA8c3BhbiBzdHlsZT0iY29sb3I6cmdiKDAsMCwwKTtmb250
LWZhbWlseTotd2Via2l0LXN0YW5kYXJkO2ZvbnQtc2l6ZTptZWRpdW0iPnRzczJfdGN0aWxkci5o
IGRvZXMgbm90IGV4aXN0PC9zcGFuPjwvZGl2PjxwcmUgc3R5bGU9ImNvbG9yOnJnYigwLDAsMCk7
Zm9udC1zaXplOjE0cHgiPjxicj48L3ByZT48L2Rpdj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24s
IEFwciAxMywgMjAyMCBhdCAxMjozMSBQTSBSYWh1bCBIYXJkaWthciAmbHQ7PGEgaHJlZj0ibWFp
bHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWth
ckBnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdp
ZHRoOjFweDtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0
LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPk9rLCBnb3QgaXQuIEkm
IzM5O20gdXNpbmcgRVNBUEkgQyBBUElzLiBCdXQgaXRzIHByZXR0eSBtdWNoIHRoZSBzYW1lIGFz
IHRoZSB0cG0yIHRvb2xzIGltcGxlbWVudGF0aW9uLjxkaXY+SG93IGRvIGkgYWRkIGRlYnVncyBp
biBteSBwb2t5IGRpcmVjdG9yeT/CoCBJIGhhdmUgPGEgaHJlZj0iaHR0cDovL3RwbTIuMC10c3Nf
Mi4xLjQuYmIiIHRhcmdldD0iX2JsYW5rIj50cG0yLjAtdHNzXzIuMS40LmJiPC9hPiBmaWxlLjwv
ZGl2PjxkaXY+QWxzbywgaG93IHRvIGFkZCBjb21waWxlLXRpbWUgbG9nIGZsYWdzIHRvIG15IHNy
YyBmaWxlIHRoYXQgdXNlcyBFU0FQSSBjYWxscz8gUnVubmluZyBzZXBhcmF0ZWx5IHdhcyBlYXN5
LCBJIGp1c3QgY2FsbGVkIFRTUzJfTE9HPSZxdW90O2FsbCtFUlJPUix0Y3RpK0RFQlVHJnF1b3Q7
PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBj
bGFzcz0iZ21haWxfYXR0ciI+T24gTW9uLCBBcHIgMTMsIDIwMjAgYXQgNzoyMCBBTSBSb2JlcnRz
LCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5j
b20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyB3
cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1z
dHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPiZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+CiZndDsgRnJvbTogUmFo
dWwgSGFyZGlrYXIgW21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5j
b20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT5dPGJyPgomZ3Q7
IFNlbnQ6IEZyaWRheSwgQXByaWwgMTAsIDIwMjAgNDoxNSBQTTxicj4KJmd0OyBUbzogUm9iZXJ0
cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8
YnI+CiZndDsgQ2M6IERlc2FpLCBJbXJhbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2Fp
QGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7
OyA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0y
QGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgU3ViamVjdDogUmU6IFt0cG0yXSBSZTogRVN5c19B
Y3RpdmF0ZUNyZWRlbnRpYWw8YnI+CiZndDsgPGJyPgomZ3Q7IEhpIEJpbGwsPGJyPgomZ3Q7IEkg
aGF2ZSB0aGlzIG9uIG15IHN5c3RlbTogSXMgdHBtcm0wIHNhbWUgYXMgdGFicm1kPyBJIGJlbGll
dmUgbWluZSBpcyB1c2luZyB0aGlzPGJyPgomZ3Q7IHJpZ2h0IG5vdyAsIGkmIzM5O20gY2hhbmdp
bmcgaXQgdG8gd2hhdCB5b3UgbWVudGlvbmVkwqAgdG8gc2VlIGlmIGl0IGhlbHBzLjxicj4KJmd0
OyBbcm9vdEBuZnZpcyB+XSMgbHMgLWwgL2Rldi90cG0qPGJyPgomZ3Q7IGNydy1ydy0tLS0uIDEg
dHNzIHJvb3TCoCAxMCzCoCDCoDIyNCBBcHLCoCA4IDIzOjE5IC9kZXYvdHBtMDxicj4KJmd0OyBj
cnctcnctLS0tLiAxIHRzcyB0c3PCoCAyNTQsIDY1NTM2IEFwcsKgIDggMjM6MTkgL2Rldi90cG1y
bTAgVGhhbmtzLCBSYWh1bDxicj4KPGJyPgpJbiB0aGVvcnksIHllcy4gSW4gcHJhY3RpY2Ugbm8u
PGJyPgovZGV2L3RwbXJtMCBpcyB0aGUgaW4ga2VybmVsIHJlc291cmNlIG1hbmFnZXI8YnI+CnRw
bTItYWJybWQgaXMgdGhlIHVzZXJzcGFjZSByZXNvdXJjZSBtYW5hZ2VyPGJyPgo8YnI+CnRwbTIt
YWJybWQgaGFzIGEgZmV3IGZlYXR1cmVzIHRwbXJtMCBkb2VzbiYjMzk7dCBoYXZlLCBidXQgdW5s
ZXNzIHlvdSYjMzk7cmU8YnI+CnVzaW5nIHBvbGljeSBzZXNzaW9ucyB3aXRoIHRwbTItdG9vbHMs
IHlvdSBzaG91bGRuJiMzOTt0IG5vdGljZSBhIGRpZmZlcmVuY2UuPGJyPgo8YnI+CiZndDsgPGJy
PgomZ3Q7IE9uIEZyaSwgQXByIDEwLCAyMDIwIGF0IDExOjMzIEFNIFJvYmVydHMsIFdpbGxpYW0g
QyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+CiZndDsgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0OyB3cm90ZTo8
YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IEZyb206IFJhaHVsIEhhcmRpa2FyIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+
PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyBdPGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFNlbnQ6IEZyaWRheSwgQXByaWwgMTAsIDIwMjAgMTowOCBQ
TTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBUbzogUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBo
cmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IENjOiBEZXNhaSwgSW1yYW4gJmx0OzxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBp
bnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+PGJyPgom
Z3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZndDs7IDxhIGhyZWY9
Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEu
b3JnPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAx
Lm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDsgU3ViamVjdDogUmU6IFt0cG0yXSBSZTogRVN5c19BY3RpdmF0ZUNyZWRl
bnRpYWw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgVGhh
bmtzIEJpbGwsIHRyeWluZyB0aGF0Ljxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIEkgZGlkIG5v
dCBnZXQgZGVidWcgYnVpbGQgdHBtMl90c3MsIGlzbiYjMzk7dCBpdCBhbGwgcHJlYnVpbHQgPyBJ
IHdpbGwgaGF2ZSB0byBzZWU8YnI+CiZndDsgaG93IHRvPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IGRvIGl0IGluIHBva3kuPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgSWYgeW91JiMzOTty
ZSBnZXR0aW5nIGl0IGZyb20gYSBwYWNrYWdlIG1hbmFnZXIsIHllcy4gQnV0IHRoZXJlJiMzOTtz
IG5vdGhpbmc8YnI+CiZndDsgc3RvcHBpbmcgeW91PGJyPgomZ3Q7wqAgwqAgwqAgwqBmcm9tIHVz
aW5nIHNvdXJjZSBidWlsZHMuIFNvbWUgZGlzdHJvJiMzOTtzIHdpbGwgcGFja2FnZSBkZWJ1ZyBz
eW1ib2xzIGZvcjxicj4KJmd0OyB0aGVpcjxicj4KJmd0O8KgIMKgIMKgIMKgcGFja2FnZXMuPGJy
PgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBP
biBGcmksIEFwciAxMCwgMjAyMCBhdCA4OjE2IEFNIFJvYmVydHMsIFdpbGxpYW0gQzxicj4KJmd0
OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4KJmd0
OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20i
IHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7
ICZndDsgd3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEZyb206IFJhaHVsIEhh
cmRpa2FyIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+PGJyPgomZ3Q7ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJh
aHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0Ozxicj4KJmd0OyBdPGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCA5LCAyMDIw
IDI6NTEgUE08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgVG86IFJvYmVy
dHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+
CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlh
bS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNA
aW50ZWwuY29tPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFt
LmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0Bp
bnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgQ2M6IERlc2FpLCBJbXJhbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2Fp
QGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+
CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5p
bXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs7PGJyPgomZ3Q7IDxhIGhyZWY9
Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEu
b3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdl
dD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwv
YT4mZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgU3ViamVj
dDogUmU6IFt0cG0yXSBSZTogRVN5c19BY3RpdmF0ZUNyZWRlbnRpYWw8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgVGhhbmtzIEJpbGwuIEkgdXNlIHRoaXM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgRXN5c19Jbml0aWFsaXplKCAmYW1wO2VjdHgsIE5VTEwsIE5VTEwpOzxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyBzbyBpJiMzOTttIGFzc3VtaW5nIGl0IHdvdWxkIHRha2UgdGhlIGRl
ZmF1bHTCoCBsaWJ0c3MyLXRjdGktdGFicm1kLnNvLjAuPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBUaGlzIHNob3VsZCBkbyBpdCBmb3Ig
eW91Ojxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVFNTMl9SQzxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVHNzMl9UY3RpTGRyX0luaXRpYWxpemUgKGNvbnN0IGNo
YXIgKm5hbWVDb25mLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFRTUzJfVENUSV9DT05URVhUICoqY29udGV4dCk7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqBTZXQgbmFtZUNvbmYgdG8gdGhlIHN0cmluZyAmcXVvdDt0YWJybWQmcXVvdDssIHRoYXQgc2hv
dWxkIGdpdmUgeW91IGEgdGN0aTxicj4KJmd0OyBwb2ludGVyPGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IHlvdSBjYW48YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHBhc3Mgd290IEVz
eXNfSW5pdGlhbGl6ZSgpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IElmIEkgbmVlZCB0byBk
ZWJ1ZyBFc3lzX0FjdGl2YXRlQ3JlZGVudGlhbCBtb3JlLCBob3cgY2FuIEkgZG8gaXQsPGJyPgom
Z3Q7IHRoZXNlPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEFQSXMgYXJlPGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG5vIG1vcmUgc3RhbmRhbG9uZSwgSSBoYXZlIGludGVn
cmF0ZWQgaXQgaW4gYSBiaWdnZXIgY29kZSBiYXNlIGFuZDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
OyBhZGRlZCB0aGU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgZXN5cy10
c3MyIGFuZCBvdGhlciBsaWJzIGluIG15IHBva3kgYnVpbGQsIHNvIG5vdyBpdCBydW5zIGFzPGJy
PgomZ3Q7IGRpZmZlcmVudDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBwcm9jZXNzIHRoYXQ8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgaW52b2tlcyB0aGlzIGZ1bmN0aW9u
LCBJIGNhbiBnZGIgaW50byB0aGUgcHJvY2VzcyBidXQgSSBjYW4mIzM5O3Qgc2VlbSB0bzxicj4K
Jmd0OyBnZGI8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgaW50bzxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyBFc3lzX0FjdGl2YXRlLi4oICk8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoERpZCB5b3UgYnVpbGQgdHBt
Mi10c3Mgd2l0aCBkZWJ1ZyBzeW1ib2xzPzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgQWRkIC0tZW5hYmxlLWRlYnVnPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFRoYW5rcyw8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgUmFodWw8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgT24gVGh1LCBBcHIgOSwgMjAyMCBhdCAxMDoyMyBBTSBSb2JlcnRzLCBXaWxs
aWFtIEM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFt
LmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0Bp
bnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRz
QGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwv
YT4mZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2Jl
cnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNv
bTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsg
Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5r
Ij53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+CiZn
dDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0
OyAmZ3Q7ICZndDsgd3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IEZyb206IFJhaHVsIEhhcmRpa2FyIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFy
ZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208
L2E+PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21h
aWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhh
cmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29t
PC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tPC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1
bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwu
Y29tPC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdt
YWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPjxicj4K
Jmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IF08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgU2VudDogVGh1cnNkYXksIEFwcmlsIDksIDIwMjAgMTE6
MTggQU08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgVG86IERlc2FpLCBJbXJhbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+CiZndDsg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5k
ZXNhaUBpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1y
YW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlA
aW50ZWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRl
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7
ICZndDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyBDYzogPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9i
bGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRw
bTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0
Ozxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIg
dGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEu
b3JnPC9hPiZndDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMu
MDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIg
dGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZndDsgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50
cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0
cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7ICZndDsg
Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyBTdWJqZWN0OiBbdHBtMl0gUmU6IEVTeXNfQWN0aXZhdGVDcmVkZW50aWFsPGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEhvdyBkbyBJIGtub3cgaWbC
oCBSTSBpcyBiZWluZyB1c2VkPzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYgeW91IHNldCB0aGUgdGN0aSB0byB0
aGUgZGV2aWNlIHRjdGksIGl0IHdpbGwgb3BlbiAvZGV2L3RwbTAgYnk8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDsgZGVmYXVsdC4gQW5kPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IHRoYXQgd29udDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgQmUgYW4gUk0uIFlvdSBjYW4gYWxzbyBnaXZlIGl0IGFuIG9wdGlvbi4gRXN5c19Jbml0
aWFsaXplKCkgdGFrZXMgYTxicj4KJmd0OyB0Y3RpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGFz
IGFuPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG9wdGlvbiw8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoE5VTEwgd2lsbCBjYXVz
ZSBpdCB0byB1c2UgdGhlIGRlZmF1bHQgc2VhcmNoIGJlaGF2aW9yIG9mIHRoZTxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0OyBUc3MyX1RjdGlMZHIsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IHNlZTo8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoDxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLTwvYT48
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdHNzL2Jsb2IvbWFzdGVyL21h
bi88YSBocmVmPSJodHRwOi8vVHNzMl9UY3RpTGRyX0luaXRpYWxpemUuMy5pbiIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+VHNzMl9UY3RpTGRyX0luaXRpYWxpemUuMy5pbjwvYT48
YnI+CiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9Uc3MyX1RjdGlMZHJfSW5pdGlhbGl6ZS4zLmlu
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vVHNzMl9UY3RpTGRyX0lu
aXRpYWxpemUuMy5pbjwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDs8YSBocmVm
PSJodHRwOi8vVHNzMl9UY3RpTGRyX0luaXRpYWxpemUuMy5pbiIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL1RzczJfVGN0aUxkcl9Jbml0aWFsaXplLjMuaW48L2E+Jmd0
Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgPGEgaHJl
Zj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi0iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTIt
PC9hPjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB0c3MvYmxvYi9tYXN0
ZXIvbWFuLzxhIGhyZWY9Imh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMy5pbiIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+VHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW48L2E+
PGJyPgomZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW4i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNl
X0luaXQuMy5pbjwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDs8YSBocmVmPSJo
dHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMy5pbjwvYT4mZ3Q7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqA8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLSIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi08L2E+PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRzcy9ibG9iL21hc3Rlci9tYW4vdHNzMi08YnI+CiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgPGEgaHJlZj0iaHR0cDovL3RjdGktZGV2aWNl
LjcuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnRjdGktZGV2aWNlLjcuaW48
L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vdGN0aS1kZXZpY2UuNy5pbiIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3RjdGktZGV2aWNlLjcuaW48L2E+Jmd0O8KgICZsdDs8
YSBocmVmPSJodHRwOi8vdGN0aS1kZXZpY2UuNy5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovL3RjdGktZGV2aWNlLjcuaW48L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgWW91IGNhbiB1c2UgbWFuIGxvY2FsbHkgaWYgeW91IHByZWZlciBhcyB3
ZWxsOjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgbWFu
IDMgVHNzMl9UY3RpTGRyX0luaXRpYWxpemU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoG1hbiA3IHRzczItdGN0aS1kZXZpY2U8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoG1hbiAzIFRzczJfVGN0aV9EZXZpY2Vf
SW5pdDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgTm90ZSB0aGF0IDxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLTwvYT48
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdHNzL2Jsb2IvbWFzdGVyL21h
bi88YSBocmVmPSJodHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW4iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPlRzczJfVGN0aV9EZXZpY2VfSW5pdC4zLmluPC9hPjxicj4K
Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL1RzczJfVGN0aV9EZXZpY2VfSW5pdC4zLmluIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0
LjMuaW48L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDov
L1RzczJfVGN0aV9EZXZpY2VfSW5pdC4zLmluIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW48L2E+Jmd0Ozxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSGFzIHNhbXBsZSBjb2RlIGlu
IGl0Ljxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYgeW91JiMzOTtyZSB1c2luZyB0
aGUgdG9vbHMsIGl0IHN1cHBvcnRzIGV4cGxpY2l0bHkgY2hvb3NpbmcgdGhlIFRDVEk6PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqA8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLSIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi08L2E+PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRvb2xzL2Jsb2IvbWFzdGVyL21h
bi9jb21tb24vdGN0aS5tZDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgQWxzbyBub3Rl
IHRoYXQgdGhlIC9kZXYvdHBtcm0wIChOb3RpY2UgdGhlIFJNKSBpcyBhbiBpbi1rZXJuZWw8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDsgcmVzb3VyY2U8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgbWFuYWdlci48YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgV2hlbiBJIGRvIEVTeXNfSW5p
dGlhbGl6ZSwgSSBzZWUgdGhlc2UgV0FSTklOR3MsIHdvbmRlcmluZzxicj4KJmd0OyBpZiBpdCYj
Mzk7czxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBva2F5PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IGZvciBtdWx0aS08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdGhyZWFkPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFdBUk5JTkc6ZXN5czpzcmMvdHNzMi08YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDsgZXN5cy9lc3lzX3RjdGlfZGVmYXVsdC5jOjEzNzp0Y3RpX2Zyb21f
ZmlsZSgpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IENvdWxkIG5vdDxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBsb2Fk
IFRDVEkgZmlsZTogbGlidHNzMi10Y3RpLWRlZmF1bHQuc28gJmx0OzxhIGhyZWY9Imh0dHA6Ly9s
aWJ0c3MyLXRjdGktIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGli
dHNzMi10Y3RpLTwvYT48YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgPGEgaHJlZj0iaHR0cDovL2Rl
ZmF1bHQuc28vIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5kZWZhdWx0LnNvLzwv
YT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9kZWZhdWx0LnNvLyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2RlZmF1bHQuc28vPC9hPiZndDsgJmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBsaWJ0c3MyLXRjdGktPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGRlZmF1bHQuc28gJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJ0c3MyLXRjdGktZGVmYXVsdC5zby8iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0c3MyLXRjdGktZGVmYXVsdC5zby88L2E+Jmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBXQVJOSU5H
OmVzeXM6c3JjL3RzczItPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGVzeXMvZXN5c190Y3RpX2Rl
ZmF1bHQuYzoxMzc6dGN0aV9mcm9tX2ZpbGUoKTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyBDb3VsZCBub3Q8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgbG9hZCBUQ1RJIGZpbGU6IGxpYnRzczItdGN0aS10YWJybWQuc28g
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0c3MyLXRjdGktIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vbGlidHNzMi10Y3RpLTwvYT48YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDsgPGEgaHJlZj0iaHR0cDovL3RhYnJtZC5zby8iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPnRhYnJtZC5zby88L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vdGFicm1kLnNvLyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3RhYnJtZC5zby88L2E+Jmd0OyAm
Z3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IElu
IG15IHNpbmdsZSB0aHJlYWRlZCBwcm9jZXNzLCBldmVyeXRoaW5nIHdvcmtzIHNvIHNtb290aGx5
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFtyb290XSM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgLi90cG08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgV0FSTklORzplc3lzOnNyYy90c3MyLTxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0OyBlc3lzL2VzeXNfdGN0aV9kZWZhdWx0LmM6MTM3OnRjdGlfZnJvbV9maWxlKCk8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQ291bGQgbm90PGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGxvYWQgVENUSSBmaWxl
OiBsaWJ0c3MyLXRjdGktZGVmYXVsdC5zbyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnRzczItdGN0
aS0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0c3MyLXRjdGkt
PC9hPjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyA8YSBocmVmPSJodHRwOi8vZGVmYXVsdC5zby8i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmRlZmF1bHQuc28vPC9hPiAmbHQ7PGEg
aHJlZj0iaHR0cDovL2RlZmF1bHQuc28vIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vZGVmYXVsdC5zby88L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFdBUk5JTkc6ZXN5czpzcmMvdHNzMi08YnI+
CiZndDvCoCDCoCDCoCDCoCZndDsgZXN5cy9lc3lzX3RjdGlfZGVmYXVsdC5jOjEzNzp0Y3RpX2Zy
b21fZmlsZSgpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IENvdWxkIG5v
dDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBs
b2FkIFRDVEkgZmlsZTogbGlidHNzMi10Y3RpLXRhYnJtZC5zbyAmbHQ7PGEgaHJlZj0iaHR0cDov
L2xpYnRzczItdGN0aS0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9s
aWJ0c3MyLXRjdGktPC9hPjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyA8YSBocmVmPSJodHRwOi8v
dGFicm1kLnNvLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dGFicm1kLnNvLzwv
YT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly90YWJybWQuc28vIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vdGFicm1kLnNvLzwvYT4mZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgRVNZUzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBJbml0aWFsaXphdGlvbjogUGFzczxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBSZWFkIFRQTSBFSyBDZXJ0
aWZpY2F0ZTogUGFzczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyBUUE0gRUsgQ2VydGlmaWNhdGUgUm9vdC1DQSBWZXJpZmljYXRpb246IFBhc3M8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQ2xlYXIgVFBN
IFN0YXRlOiBQYXNzPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IENyZWF0ZWQgRUsgUHJpbWFyeSBvYmplY3Q6IFBhc3M8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgIyMjIyNIYW5kbGUgMHg0MTgzNjg8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQ3JlYXRl
IEF0dGVzdGF0aW9uIEtleTogUGFzczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyAjIyMjI0FrX0hhbmRsZSAweDQxODM2Yjxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBPcmlnaW5hbCBDcmVkZW50aWFs
PSZxdW90O2RlYWRiZWVmZGVhZGJlZWZkZWFkJnF1b3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE1ha2UgQ3JlZGVudGlhbDogUGFzczxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjIyMjI0VuY3J5
cHRlZCBDcmVkZW50aWFsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IEJsb2I9JnF1b3Q7MDAyMDUwOGU0MzliYzY1MTJk
MDQ0YmI4NzM5ZThkNjFjOGNlMzY2NGQyNWYzNTcyMzg5YjQ2Yzg3OTdlNTYyYTxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyA0NWM0MTI4NjRmMDIw
YTdmMWJiY2FiN2EzNGYwJnF1b3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7ICMjIyMjRW5jcnlwdGVkPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IFNlY3JldD0mcXVvdDti
NzA2ODliYjBlZDlmYTgzMjRjZmEwM2Q3MjdlNmM2Nzk1MDY5YjRmMDk0MzEwODQwOWI4OTAwOWI5
Y2M3NmM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDs8YnI+CiZndDsgNzZiZGRiMzFhNWNjZjM0Y2ZlYmM1ZDNmZTcxNTg5OWJiNzI1YThh
M2M4ZmU0YTYwNDYyMzM4NjkxMjNmM2U5NzgwNTFhZWM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgZTBkN2FmMGFkNmY4
NTE2NGEzMmZkMmM1YWQ3NTZlOGMzYjcyZjYzMTExMjZkZTc5YTMwYzBkNzJhYTBhNmYzZjQzN2Y2
YmM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDs8YnI+CiZndDsgMDc3YzQxZDNjYzY0NTBjNzFlODAzY2E2MDc0ZDM0Y2UzZGViZjUxMTRm
NGJhYzJmZDdlZTZhODdlZjlmMDdkODMwNzk0Nzc8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgNWRkYTRmNzdlNDYyMGNi
YWY5YWViMzAyMDQwZWUyYTY2YTM1MmI5ZmZmYWE1NDQ3YzA5YTI0OWJiMjJkOWQ5ODliN2YxNDxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
Ozxicj4KJmd0OyAwNjYxMmE5MGI4ZDhiY2U2YmI5NDBmYmZkMWQ1MGYzMTM5ODQwM2EyNjQzYzcz
YmVjMzM2ZTZmY2NhNDZmMjlmOWI2YWE4Nzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0OyBmZDExZDUzZWM2ZjE0NWQ2MWIy
YTYxZGZmYzc4M2FlMmIyYzY2MTg0NDM1ZDYzM2QwYjVhNDIwZWZhMDE3NDhlMzlkNjg3PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGUxZWI5ZmNj
MTc1OWMxODQ5NzI3NzliZmMmcXVvdDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgQWN0aXZhdGluZyBDcmVkZW50aWFsOiBQYXNzPGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICMjIyMjUmVjb3ZlcmVk
IENyZWRlbnRpYWw9JnF1b3Q7ZGVhZGJlZWZkZWFkYmVlZmRlYWQmcXVvdDs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgW3Jvb3RdIzxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBPbiBXZWQsIEFwciA4LCAyMDIwIGF0
IDc6MDIgUE0gUmFodWwgSGFyZGlrYXI8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFy
ZGlrYXJAZ21haWwuY29tPC9hPiZndDs8YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2Fy
QGdtYWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBn
bWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7
ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdt
YWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFp
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7PGJy
PgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhh
cmRpa2FyQGdtYWlsLmNvbTwvYT48YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdt
YWlsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxo
YXJkaWthckBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFy
ZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208
L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFy
ZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208
L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0Ozxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdt
YWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7
ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmd0OyB3cm90ZTo8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oFRoYW5rcyBndXlzLCBJJiMzOTtsbCB0cnkgdGhpcyBidXTCoCBpIGFsc28gd2FudGVkIHRvIGtu
b3cgaWYgdGhlcmU8YnI+CiZndDsgaXMgYTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyB3YXkgdG88
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsga25v
dyBpZiB0aGUgVFBNIHN0aWxsIGhhcyB0aGUgRUsgYW5kIEFLIGtleXMgbG9hZGVkPyBJIGhhdmU8
YnI+CiZndDsgdGhlIEVLPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGhh
bmRsZSBhbmQgQUs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgaGFuZGxlIChub3QgbWFkZSBpdCBwZXJzaXN0ZW50KSBidXQgSSB3YW50IHRvIG1h
a2Ugc3VyZSBpdCYjMzk7czxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBwcmVzZW50IGFzPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRoZXNlIGFyZTxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBuZWNlc3NhcnkgZm9yIEFj
dGl2YXRlQ3JlZGVudGlhbCB0byBzdWNjZWVkPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBFU3lzX0FjdGl2YXRlQ3JlZGVudGlh
bCBjb21wbGFpbmluZyBhYm91dCBzZWNyZXQ8YnI+CiZndDsgcGFyYW1ldGVyPGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGRvZXNuJiMzOTt0PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG1ha2Ugc2Vuc2UgdG8gbWUsIEkg
dGVzdGVkIG9uIHNlcnZlciBzaWRlLCBha19uYW1lIGlzIHNhbWU8YnI+CiZndDsgYXM8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDsgdGhhdDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyBzZW50IGFuZCBzbyBpczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyBFS19QVUIgb2JqZWN0IGFzIHdlbGwgYXPCoCBFS19DZXJ0IGluIG52
cmFtLCBJIGNhbGwgdGhlIHNhbWU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgZXh0ZXJuYWxfbWFrZWNyZWRlbnRpYWwgY2FsbCB0aGF0JiMzOTtz
IGluIHRoZSBHaXRIdWIgdG8gY3JlYXRlPGJyPgomZ3Q7IHNlY3JldDxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0OyBhbmQ8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbWFkZSBz
dXJlPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IHNlY3JldCxjcmVkYmxvYiBtYXRjaGVzIG9uIHRoZSBjbGllbnQgc2lkZSB3aGVuIHJlY2VpdmVk
PGJyPgomZ3Q7IGZyb208YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgc2VydmVyLjxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVGhhbmtz
LDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgUmFodWw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoE9uIFR1ZSwgTWFyIDE3LCAyMDIwIGF0IDY6MTkgQU0gSW1yYW4g
RGVzYWk8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0OzxhIGhyZWY9
Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNh
aUBpbnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7PGJy
PgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4u
ZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2Js
YW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVs
LmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRl
c2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4g
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmlt
cmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50
ZWwuY29tPC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBp
bnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+PGJyPgom
Z3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZndDs8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50
ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5r
Ij5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5k
ZXNhaUBpbnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2Fp
QGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7
ICZndDsgJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgd3JvdGU6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBTZXQgdGhpcyB1cCB3aXRoIGFsbCBoYW5kbGVzIGluIHVz
ZSBtYWRlIHBlcnNpc3RlbnQuIElmPGJyPgomZ3Q7IHlvdTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
OyBzdGlsbCBzZWU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgaXNzdWVzLCBnZGItYnJlYWsgb3IgdHVybiBvbiBkZWJ1ZyBsb2dnaW5nIGF0IHRo
ZSBFc3lzIGNhbGwgYW5kPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGNvbXBhcmU8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdGhlPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGZ1bmN0aW9uIGFyZ3VtZW50cy48YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDsgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX188YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3Jn
PC9hPjxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9y
ZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmci
IHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAx
Lm9yZzwvYT4mZ3Q7ICZndDs8YnI+CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBt
MkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5r
Ij50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+
dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7
ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxp
c3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5v
cmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJA
bGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAm
Z3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRw
bTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEu
b3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0OyAmZ3Q7ICZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gdHBtMi08YnI+
CiZndDsgPGEgaHJlZj0ibWFpbHRvOmxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
PmxlYXZlQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1s
ZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9y
ZzwvYT4mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBs
aXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0
OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+
dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRw
bTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4w
MS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxl
YXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3Jn
PC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIg
dGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0OyAmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9
Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnRwbTItIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi08L2E+PGJyPgomZ3Q7IDxhIGhyZWY9
Im1haWx0bzpsZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj5sZWF2ZUBsaXN0cy4w
MS5vcmc8L2E+Jmd0O8KgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi08L2E+
PGJyPgomZ3Q7IDxhIGhyZWY9Im1haWx0bzpsZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2Js
YW5rIj5sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0
YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBt
Mi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVh
dmVAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZl
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9h
PiZndDsgJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2ll
eHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4K
PGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+CjwvYmxvY2txdW90ZT48L2Rpdj4KPC9ibG9ja3F1b3Rl
PjwvZGl2Pgo=

--===============2194821534861947900==--

