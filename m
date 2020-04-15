Content-Type: multipart/mixed; boundary="===============1712441618383162052=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Wed, 15 Apr 2020 11:05:45 -0700
Message-ID: <CAP3jAwQPtNTHmaTE1NSgP+Nw5zhki0a_kF-jMiAB2_sNap-Tvw@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649ECED19@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1712441618383162052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Bill. I am taking help from the poky team on this.
Getting back to the Activate Credential issue, since my code worked fine as
a single application as well as being run inside another process but as a
single thread (including makeCredential and activateCred).
My guess for failing is:
1. When server sends secret/credBlob, they dont match ---> But i ran gdb
and checked all bytes and they match, so thats not an issue, server is
running same OpenSSL as client, so no mismatch in version for
single-threaded vs multi-threaded
2. Probably AK key or EK key is not loaded or changed
--> to prove this, i would need to use Esys_ReadPublic , if it fails,
implies its not loaded, if it succeeds, I need to verify ek_pub and ak_name
is same when we created it
Assuming I have the ESYS_CONTEXT saved as well as the ESYS_TR handle for
both AK and EK saved,  Esys_ReadPublic should still work right, as it only
needs these 2?

Any other reason for failing?
Thanks,
Rahul

On Wed, Apr 15, 2020 at 8:25 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> > -----Original Message-----
> > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
> > Sent: Monday, April 13, 2020 6:55 PM
> > To: Roberts, William C <william.c.roberts(a)intel.com>
> > Cc: Desai, Imran <imran.desai(a)intel.com>; tpm2(a)lists.01.org
> > Subject: Re: [tpm2] Re: ESys_ActivateCredential
> >
> > What is the latest stable release for tpm2_tss ?
>
> Really? Github has a releases tab, use it.
> https://github.com/tpm2-software/tpm2-tss/releases
>
>
> >
> > Thanks,
> > Rahul
> >
> > On Mon, Apr 13, 2020 at 4:38 PM Rahul Hardikar <rahulhardikar(a)gmail.c=
om
> > <mailto:rahulhardikar(a)gmail.com> > wrote:
> >
> >
> >       Looks like the version I have is old, the file tss2_tctildr.h does
> not exist
> >
> >
> >       On Mon, Apr 13, 2020 at 12:31 PM Rahul Hardikar
> > <rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> > wrote:
> >
> >
> >               Ok, got it. I'm using ESAPI C APIs. But its pretty much
> the same as
> > the tpm2 tools implementation.
> >               How do i add debugs in my poky directory?  I have tpm2.0-
> > tss_2.1.4.bb <http://tpm2.0-tss_2.1.4.bb>  file.
> >               Also, how to add compile-time log flags to my src file
> that uses
> > ESAPI calls? Running separately was easy, I just called
> > TSS2_LOG=3D"all+ERROR,tcti+DEBUG"
> >
> >               On Mon, Apr 13, 2020 at 7:20 AM Roberts, William C
> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com> >
> wrote:
> >
> >
> >                       > -----Original Message-----
> >                       > From: Rahul Hardikar [mailto:
> rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> ]
> >                       > Sent: Friday, April 10, 2020 4:15 PM
> >                       > To: Roberts, William C <
> william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> >
> >                       > Cc: Desai, Imran <imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> >; tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>
> >                       > Subject: Re: [tpm2] Re: ESys_ActivateCredential
> >                       >
> >                       > Hi Bill,
> >                       > I have this on my system: Is tpmrm0 same as
> tabrmd? I
> > believe mine is using this
> >                       > right now , i'm changing it to what you
> mentioned  to
> > see if it helps.
> >                       > [root(a)nfvis ~]# ls -l /dev/tpm*
> >                       > crw-rw----. 1 tss root  10,   224 Apr  8 23:19
> /dev/tpm0
> >                       > crw-rw----. 1 tss tss  254, 65536 Apr  8 23:19
> > /dev/tpmrm0 Thanks, Rahul
> >
> >                       In theory, yes. In practice no.
> >                       /dev/tpmrm0 is the in kernel resource manager
> >                       tpm2-abrmd is the userspace resource manager
> >
> >                       tpm2-abrmd has a few features tpmrm0 doesn't have,
> > but unless you're
> >                       using policy sessions with tpm2-tools, you
> shouldn't
> > notice a difference.
> >
> >                       >
> >                       > On Fri, Apr 10, 2020 at 11:33 AM Roberts,
> William C
> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> >                       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > > wrote:
> >                       >
> >                       >
> >                       >
> >                       >
> >                       >       > -----Original Message-----
> >                       >       > From: Rahul Hardikar
> > [mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> >                       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> > ]
> >                       >       > Sent: Friday, April 10, 2020 1:08 PM
> >                       >       > To: Roberts, William C
> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> >                       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > >
> >                       >       > Cc: Desai, Imran <imran.desai(a)intel.c=
om
> > <mailto:imran.desai(a)intel.com>
> >                       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> > >; tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>
> >                       > <mailto:tpm2(a)lists.01.org <mailto:
> tpm2(a)lists.01.org>
> > >
> >                       >       > Subject: Re: [tpm2] Re:
> ESys_ActivateCredential
> >                       >       >
> >                       >       > Thanks Bill, trying that.
> >                       >       >  I did not get debug build tpm2_tss,
> isn't it all
> > prebuilt ? I will have to see
> >                       > how to
> >                       >       > do it in poky.
> >                       >
> >                       >       If you're getting it from a package
> manager, yes. But
> > there's nothing
> >                       > stopping you
> >                       >       from using source builds. Some distro's
> will package
> > debug symbols for
> >                       > their
> >                       >       packages.
> >                       >
> >                       >       >
> >                       >       > On Fri, Apr 10, 2020 at 8:16 AM Roberts,
> William C
> >                       > <william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com>  <mailto:
> william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> >
> >                       >       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com>
> >                       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > > > wrote:
> >                       >       >
> >                       >       >
> >                       >       >
> >                       >       >
> >                       >       >       > -----Original Message-----
> >                       >       >       > From: Rahul Hardikar
> > [mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> >                       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> >
> >                       >       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> > >
> >                       > ]
> >                       >       >       > Sent: Thursday, April 9, 2020
> 2:51 PM
> >                       >       >       > To: Roberts, William C
> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> >                       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> >
> >                       >       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com>
> >                       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > > >
> >                       >       >       > Cc: Desai, Imran <
> imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>
> >                       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> >
> >                       >       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> > > >;
> >                       > tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> >                       >       > <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org> > >
> >                       >       >       > Subject: Re: [tpm2] Re:
> > ESys_ActivateCredential
> >                       >       >       >
> >                       >       >       > Thanks Bill. I use this
> >                       >       >       > Esys_Initialize( &ectx, NULL,
> NULL);
> >                       >       >       >
> >                       >       >       > so i'm assuming it would take
> the default
> > libtss2-tcti-tabrmd.so.0.
> >                       >       >
> >                       >       >       This should do it for you:
> >                       >       >       TSS2_RC
> >                       >       >       Tss2_TctiLdr_Initialize (const
> char *nameConf,
> >                       >       >
> TSS2_TCTI_CONTEXT **context);
> >                       >       >
> >                       >       >       Set nameConf to the string
> "tabrmd", that
> > should give you a tcti
> >                       > pointer
> >                       >       > you can
> >                       >       >       pass wot Esys_Initialize()
> >                       >       >
> >                       >       >       >
> >                       >       >       >
> >                       >       >       > If I need to debug
> Esys_ActivateCredential
> > more, how can I do it,
> >                       > these
> >                       >       > APIs are
> >                       >       >       > no more standalone, I have
> integrated it in a
> > bigger code base and
> >                       >       > added the
> >                       >       >       > esys-tss2 and other libs in my
> poky build, so
> > now it runs as
> >                       > different
> >                       >       > process that
> >                       >       >       > invokes this function, I can gdb
> into the
> > process but I can't seem to
> >                       > gdb
> >                       >       > into
> >                       >       >       > Esys_Activate..( )
> >                       >       >
> >                       >       >       Did you build tpm2-tss with debug
> symbols?
> >                       >       >       Add --enable-debug
> >                       >       >
> >                       >       >       >
> >                       >       >       >
> >                       >       >       > Thanks,
> >                       >       >       > Rahul
> >                       >       >       >
> >                       >       >       >
> >                       >       >       >
> >                       >       >       >
> >                       >       >       > On Thu, Apr 9, 2020 at 10:23 AM
> Roberts,
> > William C
> >                       >       > <william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com>  <mailto:
> william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> >
> >                       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com>  <mailto:
> william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > >
> >                       >       >       > <mailto:
> william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com>
> >                       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> >
> >                       >       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com>
> >                       > <mailto:william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > > > > wrote:
> >                       >       >       >
> >                       >       >       >
> >                       >       >       >       > -----Original
> Message-----
> >                       >       >       >       > From: Rahul Hardikar
> > [mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> >                       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> >
> >                       >       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> > >
> >                       >       >       > <mailto:rahulhardikar(a)gmail.c=
om
> > <mailto:rahulhardikar(a)gmail.com>
> >                       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> >  <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>
> >                       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> > > >
> >                       >       > ]
> >                       >       >       >       > Sent: Thursday, April 9,
> 2020 11:18 AM
> >                       >       >       >       > To: Desai, Imran <
> imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>
> >                       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> >
> >                       >       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> > >
> >                       >       >       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> >
> >                       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> > > > >
> >                       >       >       >       > Cc: tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org> >
> >                       > <mailto:tpm2(a)lists.01.org <mailto:
> tpm2(a)lists.01.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> >                       >       > <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org> >
> >                       > <mailto:tpm2(a)lists.01.org <mailto:
> tpm2(a)lists.01.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> >                       >       >       >       > Subject: [tpm2] Re:
> > ESys_ActivateCredential
> >                       >       >       >       >
> >                       >       >       >       > How do I know if  RM is
> being used?
> >                       >       >       >
> >                       >       >       >
> >                       >       >       >       If you set the tcti to the
> device tcti, it will
> > open /dev/tpm0 by
> >                       >       > default. And
> >                       >       >       > that wont
> >                       >       >       >       Be an RM. You can also
> give it an option.
> > Esys_Initialize() takes a
> >                       > tcti
> >                       >       > as an
> >                       >       >       > option,
> >                       >       >       >       NULL will cause it to use
> the default search
> > behavior of the
> >                       >       > Tss2_TctiLdr,
> >                       >       >       > see:
> >                       >       >       >
> >                       >       >       >
> https://github.com/tpm2-software/tpm2-
> >                       >       >       >
> > tss/blob/master/man/Tss2_TctiLdr_Initialize.3.in
> > <http://Tss2_TctiLdr_Initialize.3.in>
> >                       > <http://Tss2_TctiLdr_Initialize.3.in>
> >                       >       > <http://Tss2_TctiLdr_Initialize.3.in>
> >                       >       >       >
> https://github.com/tpm2-software/tpm2-
> >                       >       >       >
> > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> > <http://Tss2_Tcti_Device_Init.3.in>
> >                       > <http://Tss2_Tcti_Device_Init.3.in>
> >                       >       > <http://Tss2_Tcti_Device_Init.3.in>
> >                       >       >       >
> https://github.com/tpm2-software/tpm2-
> >                       >       > tss/blob/master/man/tss2-
> >                       >       >       > tcti-device.7.in <
> http://tcti-device.7.in>
> > <http://tcti-device.7.in>  <http://tcti-device.7.in>
> >                       >       >       >
> >                       >       >       >       You can use man locally if
> you prefer as
> > well:
> >                       >       >       >       man 3
> Tss2_TctiLdr_Initialize
> >                       >       >       >       man 7 tss2-tcti-device
> >                       >       >       >       man 3 Tss2_Tcti_Device_In=
it
> >                       >       >       >
> >                       >       >       >       Note that
> https://github.com/tpm2-
> > software/tpm2-
> >                       >       >       >
> > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> > <http://Tss2_Tcti_Device_Init.3.in>
> >                       > <http://Tss2_Tcti_Device_Init.3.in>
> >                       >       > <http://Tss2_Tcti_Device_Init.3.in>
> >                       >       >       >       Has sample code in it.
> >                       >       >       >
> >                       >       >       >       If you're using the tools,
> it supports
> > explicitly choosing the TCTI:
> >                       >       >       >
> https://github.com/tpm2-software/tpm2-
> >                       >       >       >
> tools/blob/master/man/common/tcti.md
> >                       >       >       >
> >                       >       >       >       Also note that the
> /dev/tpmrm0 (Notice
> > the RM) is an in-kernel
> >                       >       > resource
> >                       >       >       > manager.
> >                       >       >       >
> >                       >       >       >
> >                       >       >       >       > When I do
> ESys_Initialize, I see these
> > WARNINGs, wondering
> >                       > if it's
> >                       >       > okay
> >                       >       >       > for multi-
> >                       >       >       >       > thread
> >                       >       >       >       > WARNING:esys:src/tss2-
> >                       >       >
> esys/esys_tcti_default.c:137:tcti_from_file()
> >                       >       >       > Could not
> >                       >       >       >       > load TCTI file:
> libtss2-tcti-default.so
> > <http://libtss2-tcti-
> >                       >       > default.so/ <http://default.so/>
> > <http://default.so/> >
> >                       >       >       > libtss2-tcti-
> >                       >       >       >       > default.so <
> http://libtss2-tcti-
> > default.so/>
> >                       >       >       >       > WARNING:esys:src/tss2-
> >                       >       >
> esys/esys_tcti_default.c:137:tcti_from_file()
> >                       >       >       > Could not
> >                       >       >       >       > load TCTI file:
> libtss2-tcti-tabrmd.so
> > <http://libtss2-tcti-
> >                       >       > tabrmd.so/ <http://tabrmd.so/>
> > <http://tabrmd.so/> >
> >                       >       >       >       >
> >                       >       >       >       > In my single threaded
> process,
> > everything works so smoothly
> >                       >       > [root]#
> >                       >       >       > ./tpm
> >                       >       >       >       > WARNING:esys:src/tss2-
> >                       >       >
> esys/esys_tcti_default.c:137:tcti_from_file()
> >                       >       >       > Could not
> >                       >       >       >       > load TCTI file:
> libtss2-tcti-default.so
> > <http://libtss2-tcti-
> >                       >       > default.so/ <http://default.so/>
> > <http://default.so/> >
> >                       >       >       >       > WARNING:esys:src/tss2-
> >                       >       >
> esys/esys_tcti_default.c:137:tcti_from_file()
> >                       >       >       > Could not
> >                       >       >       >       > load TCTI file:
> libtss2-tcti-tabrmd.so
> > <http://libtss2-tcti-
> >                       >       > tabrmd.so/ <http://tabrmd.so/>
> > <http://tabrmd.so/> >
> >                       >       >       > ESYS
> >                       >       >       >       > Initialization: Pass
> >                       >       >       >       >
> >                       >       >       >       > Read TPM EK Certificate:
> Pass
> >                       >       >       >       >
> >                       >       >       >       > TPM EK Certificate
> Root-CA Verification:
> > Pass
> >                       >       >       >       >
> >                       >       >       >       > Clear TPM State: Pass
> >                       >       >       >       >
> >                       >       >       >       > Created EK Primary
> object: Pass
> >                       >       >       >       > #####Handle 0x418368
> >                       >       >       >       >
> >                       >       >       >       > Create Attestation Key:
> Pass
> >                       >       >       >       > #####Ak_Handle 0x41836b
> >                       >       >       >       >
> >                       >       >       >       > Original
> > Credential=3D"deadbeefdeadbeefdead"
> >                       >       >       >       >
> >                       >       >       >       > Make Credential: Pass
> >                       >       >       >       > #####Encrypted Credenti=
al
> >                       >       >       >       >
> >                       >       >       >
> >                       >       >
> >                       >
> > Blob=3D"0020508e439bc6512d044bb8739e8d61c8ce3664d25f3572389b46c8797e562a
> >                       >       >       >       >
> 45c412864f020a7f1bbcab7a34f0"
> >                       >       >       >       >
> >                       >       >       >       > #####Encrypted
> >                       >       >       >       >
> >                       >       >       >
> >                       >       >
> >                       >
> > Secret=3D"b70689bb0ed9fa8324cfa03d727e6c6795069b4f0943108409b89009b9cc7=
6c
> >                       >       >       >       >
> >                       >       >       >
> >                       >       >
> >                       >
> > 76bddb31a5ccf34cfebc5d3fe715899bb725a8a3c8fe4a6046233869123f3e978051aec
> >                       >       >       >       >
> >                       >       >       >
> >                       >       >
> >                       >
> > e0d7af0ad6f85164a32fd2c5ad756e8c3b72f6311126de79a30c0d72aa0a6f3f437f6bc
> >                       >       >       >       >
> >                       >       >       >
> >                       >       >
> >                       >
> > 077c41d3cc6450c71e803ca6074d34ce3debf5114f4bac2fd7ee6a87ef9f07d83079477
> >                       >       >       >       >
> >                       >       >       >
> >                       >       >
> >                       >
> > 5dda4f77e4620cbaf9aeb302040ee2a66a352b9fffaa5447c09a249bb22d9d989b7f14
> >                       >       >       >       >
> >                       >       >       >
> >                       >       >
> >                       >
> > 06612a90b8d8bce6bb940fbfd1d50f31398403a2643c73bec336e6fcca46f29f9b6aa87
> >                       >       >       >       >
> >                       >       >       >
> >                       >       >
> >                       >
> > fd11d53ec6f145d61b2a61dffc783ae2b2c66184435d633d0b5a420efa01748e39d687
> >                       >       >       >       >
> e1eb9fcc1759c184972779bfc"
> >                       >       >       >       >
> >                       >       >       >       > Activating Credential:
> Pass
> >                       >       >       >       > #####Recovered
> > Credential=3D"deadbeefdeadbeefdead"
> >                       >       >       >       >
> >                       >       >       >       > [root]#
> >                       >       >       >       >
> >                       >       >       >       >
> >                       >       >       >       >
> >                       >       >       >       > On Wed, Apr 8, 2020 at
> 7:02 PM Rahul
> > Hardikar
> >                       >       >       > <rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> >
> >                       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> > >
> >                       >       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> >
> >                       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> > > >
> >                       >       >       >       > <mailto:
> rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>
> >                       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> >
> >                       >       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> > >
> >                       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> >
> >                       >       > <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> > <mailto:rahulhardikar(a)gmail.com> > >
> >                       > > >
> >                       >       >       > > wrote:
> >                       >       >       >       >
> >                       >       >       >       >
> >                       >       >       >       >       Thanks guys, I'll
> try this but  i also
> > wanted to know if there
> >                       > is a
> >                       >       > way to
> >                       >       >       >       > know if the TPM still
> has the EK and AK
> > keys loaded? I have
> >                       > the EK
> >                       >       >       > handle and AK
> >                       >       >       >       > handle (not made it
> persistent) but I
> > want to make sure it's
> >                       >       > present as
> >                       >       >       > these are
> >                       >       >       >       > necessary for
> ActivateCredential to
> > succeed
> >                       >       >       >       >
>  ESys_ActivateCredential complaining
> > about secret
> >                       > parameter
> >                       >       >       > doesn't
> >                       >       >       >       > make sense to me, I
> tested on server
> > side, ak_name is same
> >                       > as
> >                       >       > that
> >                       >       >       > sent and so is
> >                       >       >       >       > EK_PUB object as well
> as  EK_Cert in
> > nvram, I call the same
> >                       >       >       >       > external_makecredential
> call that's in the
> > GitHub to create
> >                       > secret
> >                       >       > and
> >                       >       >       > made sure
> >                       >       >       >       > secret,credblob matches
> on the client
> > side when received
> >                       > from
> >                       >       > server.
> >                       >       >       >       >
> >                       >       >       >       >       Thanks,
> >                       >       >       >       >       Rahul
> >                       >       >       >       >
> >                       >       >       >       >       On Tue, Mar 17,
> 2020 at 6:19 AM Imran
> > Desai
> >                       >       >       > <imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> >
> >                       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> > >
> >                       >       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> >
> >                       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> > > >
> >                       >       >       >       > <mailto:
> imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>
> >                       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> >  <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>
> >                       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> > >
> >                       >       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> >
> >                       > <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
> > <mailto:imran.desai(a)intel.com> > > > > >
> >                       >       >       > wrote:
> >                       >       >       >       >
> >                       >       >       >       >
> >                       >       >       >       >               Set this
> up with all handles in use
> > made persistent. If
> >                       > you
> >                       >       > still see
> >                       >       >       >       > issues, gdb-break or
> turn on debug
> > logging at the Esys call and
> >                       >       > compare
> >                       >       >       > the
> >                       >       >       >       > function arguments.
> >                       >       >       >       >
> >                       >       >
> > _______________________________________________
> >                       >       >       >       >               tpm2
> mailing list --
> > tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> >                       > <mailto:tpm2(a)lists.01.org <mailto:
> tpm2(a)lists.01.org>
> > >
> >                       >       > <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org> > >
> >                       > <mailto:tpm2(a)lists.01.org <mailto:
> tpm2(a)lists.01.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> >                       >       > <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org> > > >
> >                       >       >       > <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org> >
> >                       > <mailto:tpm2(a)lists.01.org <mailto:
> tpm2(a)lists.01.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> >                       >       > <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>  <mailto:tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org> >
> >                       > <mailto:tpm2(a)lists.01.org <mailto:
> tpm2(a)lists.01.org>
> > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > > >
> >                       >       >       >       >               To
> unsubscribe send an email to
> > tpm2-
> >                       > leave(a)lists.01.org <mailto:leave(a)lists.01.o=
rg>
> > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >
> >                       >       > <mailto:tpm2-leave(a)lists.01.org <mail=
to:
> tpm2-
> > leave(a)lists.01.org>  <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> > leave(a)lists.01.org> > >
> >                       >       >       > <mailto:tpm2-leave(a)lists.01.o=
rg
> > <mailto:tpm2-leave(a)lists.01.org>  <mailto:tpm2-leave(a)lists.01.org
> > <mailto:tpm2-leave(a)lists.01.org> >
> >                       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> > leave(a)lists.01.org>  <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> > leave(a)lists.01.org> > > >
> >                       >       >       >       > <mailto:
> tpm2-leave(a)lists.01.org
> > <mailto:tpm2-leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> >                       > leave(a)lists.01.org <mailto:leave(a)lists.01.o=
rg> >
> > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>
> > <mailto:tpm2- <mailto:tpm2->
> >                       > leave(a)lists.01.org <mailto:leave(a)lists.01.o=
rg>
> > >
> >                       >       > <mailto:tpm2-leave(a)lists.01.org <mail=
to:
> tpm2-
> > leave(a)lists.01.org>  <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> > leave(a)lists.01.org> >
> >                       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> > leave(a)lists.01.org>  <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> > leave(a)lists.01.org> > > > >
> >                       >       >       >       >
> >                       >
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >                       >       >       >       >
> >                       >       >       >
> >                       >       >       >
> >                       >       >
> >                       >       >
> >                       >
> >                       >
> >
> >
>
>

--===============1712441618383162052==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzIEJpbGwuIEkgYW0gdGFraW5nIGhlbHAgZnJvbSB0aGUgcG9r
eSB0ZWFtIG9uIHRoaXMuPGRpdj5HZXR0aW5nIGJhY2sgdG8gdGhlIEFjdGl2YXRlIENyZWRlbnRp
YWwgaXNzdWUsIHNpbmNlIG15IGNvZGUgd29ya2VkIGZpbmUgYXMgYSBzaW5nbGUgYXBwbGljYXRp
b24gYXMgd2VsbCBhcyBiZWluZyBydW4gaW5zaWRlIGFub3RoZXIgcHJvY2VzcyBidXQgYXMgYSBz
aW5nbGUgdGhyZWFkIChpbmNsdWRpbmcgbWFrZUNyZWRlbnRpYWwgYW5kIGFjdGl2YXRlQ3JlZCku
PC9kaXY+PGRpdj5NeSBndWVzcyBmb3IgZmFpbGluZyBpczo8L2Rpdj48ZGl2PjEuIFdoZW4gc2Vy
dmVyIHNlbmRzIHNlY3JldC9jcmVkQmxvYiwgdGhleSBkb250wqBtYXRjaCAtLS0mZ3Q7IEJ1dCBp
IHJhbiBnZGIgYW5kIGNoZWNrZWQgYWxsIGJ5dGVzIGFuZCB0aGV5IG1hdGNoLCBzbyB0aGF0cyBu
b3QgYW4gaXNzdWUsIHNlcnZlciBpcyBydW5uaW5nIHNhbWUgT3BlblNTTCBhcyBjbGllbnQsIHNv
IG5vIG1pc21hdGNoIGluIHZlcnNpb24gZm9yIHNpbmdsZS10aHJlYWRlZCB2cyBtdWx0aS10aHJl
YWRlZDwvZGl2PjxkaXY+Mi4gUHJvYmFibHkgQUsga2V5IG9yIEVLIGtleSBpcyBub3QgbG9hZGVk
IG9yIGNoYW5nZWQ8L2Rpdj48ZGl2Pi0tJmd0OyB0byBwcm92ZSB0aGlzLCBpIHdvdWxkIG5lZWQg
dG8gdXNlIEVzeXNfUmVhZFB1YmxpYyAsIGlmIGl0IGZhaWxzLCBpbXBsaWVzIGl0cyBub3QgbG9h
ZGVkLCBpZiBpdCBzdWNjZWVkcywgSSBuZWVkIHRvIHZlcmlmeSBla19wdWIgYW5kIGFrX25hbWUg
aXMgc2FtZSB3aGVuIHdlIGNyZWF0ZWQgaXQ8L2Rpdj48ZGl2PkFzc3VtaW5nIEkgaGF2ZSB0aGUg
RVNZU19DT05URVhUIHNhdmVkIGFzIHdlbGwgYXMgdGhlIEVTWVNfVFIgaGFuZGxlIGZvciBib3Ro
IEFLIGFuZCBFSyBzYXZlZCwgwqBFc3lzX1JlYWRQdWJsaWMgc2hvdWxkIHN0aWxsIHdvcmsgcmln
aHQsIGFzIGl0IG9ubHkgbmVlZHMgdGhlc2UgMj88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFu
eSBvdGhlciByZWFzb24gZm9yIGZhaWxpbmc/PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5S
YWh1bDwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0
ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgQXByIDE1LCAyMDIwIGF0IDg6MjUgQU0gUm9i
ZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50
ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9k
aXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHgg
MHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDti
b3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPiZndDsg
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+DQomZ3Q7IEZyb206IFJhaHVsIEhhcmRpa2Fy
IFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+XTxicj4NCiZndDsgU2VudDogTW9u
ZGF5LCBBcHJpbCAxMywgMjAyMCA2OjU1IFBNPGJyPg0KJmd0OyBUbzogUm9iZXJ0cywgV2lsbGlh
bSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+DQomZ3Q7
IENjOiBEZXNhaSwgSW1yYW4gJmx0OzxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5j
b20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OzsgPGEgaHJl
Zj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+PGJyPg0KJmd0OyBTdWJqZWN0OiBSZTogW3RwbTJdIFJlOiBFU3lzX0FjdGl2YXRl
Q3JlZGVudGlhbDxicj4NCiZndDsgPGJyPg0KJmd0OyBXaGF0IGlzIHRoZSBsYXRlc3Qgc3RhYmxl
IHJlbGVhc2UgZm9yIHRwbTJfdHNzID88YnI+DQo8YnI+DQpSZWFsbHk/IEdpdGh1YiBoYXMgYSBy
ZWxlYXNlcyB0YWIsIHVzZSBpdC48YnI+DQo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBt
Mi1zb2Z0d2FyZS90cG0yLXRzcy9yZWxlYXNlcyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3MvcmVsZWFzZXM8
L2E+PGJyPg0KPGJyPg0KPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IFRoYW5rcyw8YnI+DQomZ3Q7IFJh
aHVsPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IE9uIE1vbiwgQXByIDEzLCAyMDIwIGF0IDQ6MzggUE0g
UmFodWwgSGFyZGlrYXIgJmx0OzxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPjxicj4NCiZndDsg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7ICZndDsgd3JvdGU6PGJy
Pg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoExvb2tzIGxpa2UgdGhlIHZl
cnNpb24gSSBoYXZlIGlzIG9sZCwgdGhlIGZpbGUgdHNzMl90Y3RpbGRyLmggZG9lcyBub3QgZXhp
c3Q8YnI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgT24gTW9uLCBBcHIg
MTMsIDIwMjAgYXQgMTI6MzEgUE0gUmFodWwgSGFyZGlrYXI8YnI+DQomZ3Q7ICZsdDs8YSBocmVm
PSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhh
cmRpa2FyQGdtYWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJk
aWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwv
YT4mZ3Q7ICZndDsgd3JvdGU6PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoE9rLCBnb3QgaXQuIEkmIzM5O20gdXNpbmcgRVNBUEkgQyBBUElzLiBC
dXQgaXRzIHByZXR0eSBtdWNoIHRoZSBzYW1lIGFzPGJyPg0KJmd0OyB0aGUgdHBtMiB0b29scyBp
bXBsZW1lbnRhdGlvbi48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBIb3cgZG8gaSBh
ZGQgZGVidWdzIGluIG15IHBva3kgZGlyZWN0b3J5P8KgIEkgaGF2ZSB0cG0yLjAtPGJyPg0KJmd0
OyA8YSBocmVmPSJodHRwOi8vdHNzXzIuMS40LmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj50c3NfMi4xLjQuYmI8L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vdHBtMi4wLXRzc18y
LjEuNC5iYiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3RwbTIuMC10
c3NfMi4xLjQuYmI8L2E+Jmd0O8KgIGZpbGUuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgQWxzbywgaG93IHRvIGFkZCBjb21waWxlLXRpbWUgbG9nIGZsYWdzIHRvIG15IHNyYyBmaWxl
IHRoYXQgdXNlczxicj4NCiZndDsgRVNBUEkgY2FsbHM/IFJ1bm5pbmcgc2VwYXJhdGVseSB3YXMg
ZWFzeSwgSSBqdXN0IGNhbGxlZDxicj4NCiZndDsgVFNTMl9MT0c9JnF1b3Q7YWxsK0VSUk9SLHRj
dGkrREVCVUcmcXVvdDs8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oE9uIE1vbiwgQXByIDEzLCAyMDIwIGF0IDc6MjAgQU0gUm9iZXJ0cywgV2lsbGlhbSBDPGJyPg0K
Jmd0OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0OyB3cm90ZTo8YnI+DQom
Z3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgRnJvbTogUmFodWwgSGFyZGlrYXIgW21haWx0bzo8
YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5y
YWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJk
aWthckBnbWFpbC5jb208L2E+Jmd0OyBdPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0OyBTZW50OiBGcmlkYXksIEFwcmlsIDEwLCAyMDIwIDQ6MTUgUE08YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IFRvOiBSb2JlcnRz
LCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5j
b20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+PGJyPg0K
Jmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5j
b20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBDYzog
RGVzYWksIEltcmFuICZsdDs8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgJmd0OzsgPGEgaHJlZj0ibWFpbHRvOnRw
bTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJy
Pg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IFN1YmplY3Q6IFJlOiBbdHBtMl0gUmU6IEVT
eXNfQWN0aXZhdGVDcmVkZW50aWFsPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDsgSGkgQmlsbCw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7IEkgaGF2ZSB0aGlzIG9uIG15IHN5c3RlbTogSXMgdHBtcm0wIHNhbWUgYXMgdGFicm1k
PyBJPGJyPg0KJmd0OyBiZWxpZXZlIG1pbmUgaXMgdXNpbmcgdGhpczxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgcmlnaHQgbm93ICwgaSYjMzk7bSBjaGFu
Z2luZyBpdCB0byB3aGF0IHlvdSBtZW50aW9uZWTCoCB0bzxicj4NCiZndDsgc2VlIGlmIGl0IGhl
bHBzLjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgW3Jv
b3RAbmZ2aXMgfl0jIGxzIC1sIC9kZXYvdHBtKjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDsgY3J3LXJ3LS0tLS4gMSB0c3Mgcm9vdMKgIDEwLMKgIMKgMjI0
IEFwcsKgIDggMjM6MTkgL2Rldi90cG0wPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0OyBjcnctcnctLS0tLiAxIHRzcyB0c3PCoCAyNTQsIDY1NTM2IEFwcsKg
IDggMjM6MTk8YnI+DQomZ3Q7IC9kZXYvdHBtcm0wIFRoYW5rcywgUmFodWw8YnI+DQomZ3Q7IDxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEluIHRoZW9yeSwgeWVz
LiBJbiBwcmFjdGljZSBuby48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAvZGV2L3RwbXJtMCBpcyB0aGUgaW4ga2VybmVsIHJlc291cmNlIG1hbmFnZXI8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cG0yLWFicm1kIGlzIHRoZSB1
c2Vyc3BhY2UgcmVzb3VyY2UgbWFuYWdlcjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHBtMi1hYnJtZCBoYXMgYSBmZXcgZmVhdHVyZXMgdHBt
cm0wIGRvZXNuJiMzOTt0IGhhdmUsPGJyPg0KJmd0OyBidXQgdW5sZXNzIHlvdSYjMzk7cmU8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1c2luZyBwb2xpY3kgc2Vz
c2lvbnMgd2l0aCB0cG0yLXRvb2xzLCB5b3Ugc2hvdWxkbiYjMzk7dDxicj4NCiZndDsgbm90aWNl
IGEgZGlmZmVyZW5jZS48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAmZ3Q7IE9uIEZyaSwgQXByIDEwLCAyMDIwIGF0IDExOjMzIEFNIFJvYmVydHMsIFdpbGxp
YW0gQzxicj4NCiZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDsgd3JvdGU6PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IEZyb206IFJhaHVsIEhhcmRpa2FyPGJyPg0KJmd0OyBbbWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJA
Z21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdt
YWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVs
aGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0OyBdPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBTZW50OiBGcmlkYXksIEFw
cmlsIDEwLCAyMDIwIDE6MDggUE08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFRvOiBSb2JlcnRzLCBXaWxsaWFtIEM8YnI+DQom
Z3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5r
Ij53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJv
YmVydHNAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJv
YmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBDYzogRGVzYWksIEltcmFu
ICZsdDs8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVz
YWlAaW50ZWwuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZndDsgJmd0OzsgPGEgaHJl
Zj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0
cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4NCiZndDsgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgU3ViamVjdDogUmU6IFt0cG0yXSBSZTogRVN5c19BY3RpdmF0ZUNyZWRlbnRpYWw8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyBUaGFua3MgQmlsbCwgdHJ5aW5nIHRoYXQuPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIEkgZGlkIG5v
dCBnZXQgZGVidWcgYnVpbGQgdHBtMl90c3MsIGlzbiYjMzk7dCBpdCBhbGw8YnI+DQomZ3Q7IHBy
ZWJ1aWx0ID8gSSB3aWxsIGhhdmUgdG8gc2VlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgJmd0OyBob3cgdG88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGRvIGl0IGluIHBva3kuPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoElmIHlvdSYjMzk7cmUg
Z2V0dGluZyBpdCBmcm9tIGEgcGFja2FnZSBtYW5hZ2VyLCB5ZXMuIEJ1dDxicj4NCiZndDsgdGhl
cmUmIzM5O3Mgbm90aGluZzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDsgc3RvcHBpbmcgeW91PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgZnJvbSB1c2luZyBzb3VyY2UgYnVpbGRzLiBTb21lIGRp
c3RybyYjMzk7cyB3aWxsIHBhY2thZ2U8YnI+DQomZ3Q7IGRlYnVnIHN5bWJvbHMgZm9yPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyB0aGVpcjxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHBhY2th
Z2VzLjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyBPbiBGcmksIEFwciAxMCwgMjAyMCBhdCA4OjE2IEFNIFJvYmVydHMsIFdpbGxp
YW0gQzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgJmx0
OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2Js
YW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2Js
YW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0O8KgICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFt
LmMucm9iZXJ0c0BpbnRlbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFt
LmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDsgJmd0OyB3cm90ZTo8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgRnJvbTogUmFodWwgSGFyZGlrYXI8
YnI+DQomZ3Q7IFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxo
YXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNv
bTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJA
Z21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0
OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdt
YWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPjxicj4N
CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20i
IHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7wqAgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2Js
YW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFo
dWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IF08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFNl
bnQ6IFRodXJzZGF5LCBBcHJpbCA5LCAyMDIwIDI6NTEgUE08YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IFRvOiBSb2JlcnRzLCBXaWxsaWFtIEM8YnI+DQomZ3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86d2ls
bGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVy
dHNAaW50ZWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5j
b208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4NCiZn
dDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50
ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxi
cj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50
ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7ICZndDsgJmd0OyAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBDYzogRGVzYWksIEltcmFuICZsdDs8YSBocmVmPSJt
YWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlA
aW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4u
ZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9h
PiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFu
LmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2Fp
QGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFu
LmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwv
YT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7ICZndDs7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyA8YSBocmVmPSJtYWls
dG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwv
YT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0i
X2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlz
dHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9y
ZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2Js
YW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5v
cmc8L2E+Jmd0O8KgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPg0KJmd0OyAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRw
bTJAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBT
dWJqZWN0OiBSZTogW3RwbTJdIFJlOjxicj4NCiZndDsgRVN5c19BY3RpdmF0ZUNyZWRlbnRpYWw8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBUaGFua3MgQmlsbC4g
SSB1c2UgdGhpczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgRXN5c19Jbml0aWFsaXplKCAmYW1wO2Vj
dHgsIE5VTEwsIE5VTEwpOzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IHNvIGkmIzM5O20gYXNzdW1pbmcgaXQgd291bGQgdGFrZSB0aGUgZGVmYXVsdDxicj4NCiZn
dDsgbGlidHNzMi10Y3RpLXRhYnJtZC5zby4wLjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBUaGlz
IHNob3VsZCBkbyBpdCBmb3IgeW91Ojxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFRTUzJfUkM8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqBUc3MyX1RjdGlMZHJfSW5pdGlhbGl6ZSAoY29uc3QgY2hhciAqbmFtZUNvbmYsPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFRTUzJf
VENUSV9DT05URVhUICoqY29udGV4dCk7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFNldCBuYW1l
Q29uZiB0byB0aGUgc3RyaW5nICZxdW90O3RhYnJtZCZxdW90OywgdGhhdDxicj4NCiZndDsgc2hv
dWxkIGdpdmUgeW91IGEgdGN0aTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDsgcG9pbnRlcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgeW91IGNhbjxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHBhc3Mg
d290IEVzeXNfSW5pdGlhbGl6ZSgpPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBJZiBJIG5lZWQgdG8gZGVidWcg
RXN5c19BY3RpdmF0ZUNyZWRlbnRpYWw8YnI+DQomZ3Q7IG1vcmUsIGhvdyBjYW4gSSBkbyBpdCw8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IHRoZXNlPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyBBUElzIGFyZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbm8gbW9yZSBzdGFuZGFsb25lLCBJ
IGhhdmUgaW50ZWdyYXRlZCBpdCBpbiBhPGJyPg0KJmd0OyBiaWdnZXIgY29kZSBiYXNlIGFuZDxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgYWRkZWQgdGhlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBlc3lzLXRzczIgYW5kIG90aGVy
IGxpYnMgaW4gbXkgcG9reSBidWlsZCwgc288YnI+DQomZ3Q7IG5vdyBpdCBydW5zIGFzPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBkaWZmZXJlbnQ8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IHByb2Nlc3MgdGhhdDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgaW52b2tlcyB0aGlzIGZ1bmN0
aW9uLCBJIGNhbiBnZGIgaW50byB0aGU8YnI+DQomZ3Q7IHByb2Nlc3MgYnV0IEkgY2FuJiMzOTt0
IHNlZW0gdG88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
IGdkYjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgaW50bzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgRXN5c19BY3RpdmF0ZS4uKCAp
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoERpZCB5b3UgYnVpbGQgdHBtMi10c3Mgd2l0aCBkZWJ1
ZyBzeW1ib2xzPzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoEFkZCAtLWVuYWJsZS1kZWJ1Zzxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgVGhhbmtzLDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgUmFodWw8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBPbiBUaHUsIEFwciA5LCAyMDIw
IGF0IDEwOjIzIEFNIFJvYmVydHMsPGJyPg0KJmd0OyBXaWxsaWFtIEM8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDs8YSBo
cmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxs
aWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxs
aWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb208L2E+Jmd0O8KgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxp
YW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRz
QGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxp
YW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRz
QGludGVsLmNvbTwvYT4mZ3Q7ICZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxp
YW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxp
YW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDsgJmd0OyAmZ3Q7IHdyb3RlOjxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgRnJvbTogUmFodWwgSGFyZGlrYXI8YnI+DQomZ3Q7IFtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWth
ckBnbWFpbC5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFp
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT48YnI+DQom
Z3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2Js
YW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhh
cmRpa2FyQGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBn
bWFpbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVs
aGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+
PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWls
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0
O8KgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBn
bWFpbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhh
cmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29t
PC9hPiZndDsgJmd0OyAmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IF08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCA5LCAyMDIwIDExOjE4IEFNPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBUbzogRGVzYWksIEltcmFuICZsdDs8YSBo
cmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4u
ZGVzYWlAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwu
Y29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAm
Z3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFu
LmRlc2FpQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVs
LmNvbTwvYT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50
ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPjxicj4NCiZn
dDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBp
bnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+PGJyPg0K
Jmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRh
cmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0O8KgICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmlt
cmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGlu
dGVsLmNvbTwvYT4mZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4u
ZGVzYWlAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwu
Y29tPC9hPiZndDsgJmd0OyAmZ3Q7ICZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgQ2M6IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0
PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3Rz
LjAxLm9yZzwvYT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+DQomZ3Q7ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0y
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
PnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5v
cmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJn
ZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3Jn
PC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIg
dGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4NCiZndDsgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0y
QGxpc3RzLjAxLm9yZzwvYT4mZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMu
MDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBs
aXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4g
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2Js
YW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7ICZndDsgJmd0OyAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBTdWJqZWN0OiBbdHBtMl0gUmU6PGJyPg0KJmd0OyBF
U3lzX0FjdGl2YXRlQ3JlZGVudGlhbDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEhvdyBkbyBJIGtub3cgaWbC
oCBSTSBpcyBiZWluZyB1c2VkPzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYgeW91IHNldCB0aGUgdGN0
aSB0byB0aGUgZGV2aWNlIHRjdGksIGl0IHdpbGw8YnI+DQomZ3Q7IG9wZW4gL2Rldi90cG0wIGJ5
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyBkZWZhdWx0LiBBbmQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRoYXQgd29udDxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoEJlIGFuIFJNLiBZb3UgY2FuIGFsc28gZ2l2ZSBp
dCBhbiBvcHRpb24uPGJyPg0KJmd0OyBFc3lzX0luaXRpYWxpemUoKSB0YWtlcyBhPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyB0Y3RpPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBhcyBh
bjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgb3B0aW9uLDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoE5VTEwgd2lsbCBjYXVzZSBpdCB0byB1c2UgdGhlIGRlZmF1bHQgc2VhcmNoPGJyPg0K
Jmd0OyBiZWhhdmlvciBvZiB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFRzczJfVGN0aUxkciw8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IHNlZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi0i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0y
LXNvZnR3YXJlL3RwbTItPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7IHRzcy9i
bG9iL21hc3Rlci9tYW4vPGEgaHJlZj0iaHR0cDovL1RzczJfVGN0aUxkcl9Jbml0aWFsaXplLjMu
aW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPlRzczJfVGN0aUxkcl9Jbml0aWFs
aXplLjMuaW48L2E+PGJyPg0KJmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL1RzczJfVGN0aUxkcl9J
bml0aWFsaXplLjMuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9U
c3MyX1RjdGlMZHJfSW5pdGlhbGl6ZS4zLmluPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vVHNzMl9UY3Rp
TGRyX0luaXRpYWxpemUuMy5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL1RzczJfVGN0aUxkcl9Jbml0aWFsaXplLjMuaW48L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9Uc3MyX1RjdGlMZHJfSW5pdGlhbGl6ZS4zLmluIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vVHNzMl9UY3RpTGRyX0luaXRpYWxpemUuMy5pbjwvYT4m
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9naXRo
dWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItPC9hPjxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7IHRzcy9ibG9iL21hc3Rlci9tYW4vPGEgaHJlZj0iaHR0cDov
L1RzczJfVGN0aV9EZXZpY2VfSW5pdC4zLmluIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMy5pbjwvYT48YnI+DQomZ3Q7ICZsdDs8YSBocmVm
PSJodHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMy5pbjwvYT4mZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAmbHQ7PGEgaHJl
Zj0iaHR0cDovL1RzczJfVGN0aV9EZXZpY2VfSW5pdC4zLmluIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW48L2E+Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMy5pbiIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL1RzczJfVGN0aV9EZXZpY2VfSW5p
dC4zLmluPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqA8YSBocmVmPSJo
dHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLSIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi08L2E+
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyB0c3MvYmxvYi9tYXN0ZXIvbWFuL3RzczItPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyA8
YSBocmVmPSJodHRwOi8vdGN0aS1kZXZpY2UuNy5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+dGN0aS1kZXZpY2UuNy5pbjwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly90Y3RpLWRl
dmljZS43LmluIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vdGN0aS1k
ZXZpY2UuNy5pbjwvYT4mZ3Q7PGJyPg0KJmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL3RjdGktZGV2
aWNlLjcuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly90Y3RpLWRl
dmljZS43LmluPC9hPiZndDvCoCAmbHQ7PGEgaHJlZj0iaHR0cDovL3RjdGktZGV2aWNlLjcuaW4i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly90Y3RpLWRldmljZS43Lmlu
PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgWW91IGNhbiB1c2UgbWFuIGxvY2FsbHkgaWYgeW91IHByZWZlciBhczxicj4NCiZndDsg
d2VsbDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBtYW4gMyBUc3MyX1RjdGlMZHJf
SW5pdGlhbGl6ZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoG1hbiA3IHRzczItdGN0
aS1kZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBtYW4gMyBUc3MyX1RjdGlf
RGV2aWNlX0luaXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgTm90ZSB0aGF0IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLSIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItPC9h
Pjxicj4NCiZndDsgc29mdHdhcmUvdHBtMi08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
OyB0c3MvYmxvYi9tYXN0ZXIvbWFuLzxhIGhyZWY9Imh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0lu
aXQuMy5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+VHNzMl9UY3RpX0Rldmlj
ZV9Jbml0LjMuaW48L2E+PGJyPg0KJmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL1RzczJfVGN0aV9E
ZXZpY2VfSW5pdC4zLmluIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
VHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW48L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9Uc3MyX1RjdGlf
RGV2aWNlX0luaXQuMy5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDov
L1RzczJfVGN0aV9EZXZpY2VfSW5pdC4zLmluPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDs8YSBocmVmPSJo
dHRwOi8vVHNzMl9UY3RpX0RldmljZV9Jbml0LjMuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMy5pbjwvYT4mZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSGFzIHNhbXBsZSBjb2RlIGluIGl0Ljxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBJZiB5b3UmIzM5
O3JlIHVzaW5nIHRoZSB0b29scywgaXQgc3VwcG9ydHM8YnI+DQomZ3Q7IGV4cGxpY2l0bHkgY2hv
b3NpbmcgdGhlIFRDVEk6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgPGEgaHJlZj0i
aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi0iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdG9vbHMvYmxvYi9tYXN0ZXIvbWFuL2NvbW1vbi90Y3Rp
Lm1kPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oEFsc28gbm90ZSB0aGF0IHRoZSAvZGV2L3RwbXJtMCAoTm90aWNlPGJyPg0KJmd0OyB0aGUgUk0p
IGlzIGFuIGluLWtlcm5lbDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgcmVzb3VyY2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG1h
bmFnZXIuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFdoZW4gSSBkbyBFU3lzX0luaXRpYWxpemUs
IEkgc2VlIHRoZXNlPGJyPg0KJmd0OyBXQVJOSU5Hcywgd29uZGVyaW5nPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBpZiBpdCYjMzk7czxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgb2th
eTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgZm9yIG11bHRpLTxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgdGhyZWFkPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyBXQVJOSU5HOmVzeXM6c3JjL3RzczItPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBlc3lzL2VzeXNfdGN0aV9kZWZhdWx0LmM6
MTM3OnRjdGlfZnJvbV9maWxlKCk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IENvdWxkIG5vdDxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbG9hZCBUQ1RJIGZpbGU6IGxpYnRzczIt
dGN0aS1kZWZhdWx0LnNvPGJyPg0KJmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnRzczItdGN0
aS0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0c3MyLXRjdGkt
PC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgPGEgaHJlZj0iaHR0cDovL2RlZmF1bHQuc28vIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5kZWZhdWx0LnNvLzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9kZWZh
dWx0LnNvLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2RlZmF1bHQu
c28vPC9hPiZndDs8YnI+DQomZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vZGVmYXVsdC5zby8iIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9kZWZhdWx0LnNvLzwvYT4mZ3Q7
ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGxpYnRzczItdGN0aS08YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGRlZmF1bHQuc28gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0
c3MyLXRjdGktIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlidHNz
Mi10Y3RpLTwvYT48YnI+DQomZ3Q7IDxhIGhyZWY9Imh0dHA6Ly9kZWZhdWx0LnNvLyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+ZGVmYXVsdC5zby88L2E+Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgV0FSTklORzplc3lzOnNyYy90c3MyLTxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
ZXN5cy9lc3lzX3RjdGlfZGVmYXVsdC5jOjEzNzp0Y3RpX2Zyb21fZmlsZSgpPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyBDb3VsZCBub3Q8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IGxvYWQgVENUSSBmaWxlOiBsaWJ0c3MyLXRjdGktdGFicm1kLnNvPGJyPg0KJmd0OyAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYnRzczItdGN0aS0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly9saWJ0c3MyLXRjdGktPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgPGEgaHJlZj0iaHR0cDovL3RhYnJt
ZC5zby8iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnRhYnJtZC5zby88L2E+ICZs
dDs8YSBocmVmPSJodHRwOi8vdGFicm1kLnNvLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL3RhYnJtZC5zby88L2E+Jmd0Ozxicj4NCiZndDsgJmx0OzxhIGhyZWY9Imh0
dHA6Ly90YWJybWQuc28vIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
dGFicm1kLnNvLzwvYT4mZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBJbiBteSBzaW5nbGUgdGhy
ZWFkZWQgcHJvY2Vzcyw8YnI+DQomZ3Q7IGV2ZXJ5dGhpbmcgd29ya3Mgc28gc21vb3RobHk8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IFtyb290XSM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IC4vdHBtPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyBXQVJOSU5HOmVzeXM6c3JjL3RzczItPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBlc3lzL2Vz
eXNfdGN0aV9kZWZhdWx0LmM6MTM3OnRjdGlfZnJvbV9maWxlKCk8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IENvdWxkIG5vdDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbG9hZCBU
Q1RJIGZpbGU6IGxpYnRzczItdGN0aS1kZWZhdWx0LnNvPGJyPg0KJmd0OyAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYnRzczItdGN0aS0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9saWJ0c3MyLXRjdGktPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgPGEgaHJlZj0iaHR0cDovL2RlZmF1bHQuc28v
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5kZWZhdWx0LnNvLzwvYT4gJmx0Ozxh
IGhyZWY9Imh0dHA6Ly9kZWZhdWx0LnNvLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2RlZmF1bHQuc28vPC9hPiZndDs8YnI+DQomZ3Q7ICZsdDs8YSBocmVmPSJodHRw
Oi8vZGVmYXVsdC5zby8iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9k
ZWZhdWx0LnNvLzwvYT4mZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IFdBUk5JTkc6ZXN5czpzcmMvdHNzMi08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGVzeXMvZXN5c190Y3RpX2RlZmF1bHQu
YzoxMzc6dGN0aV9mcm9tX2ZpbGUoKTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQ291bGQgbm90PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBsb2FkIFRDVEkgZmlsZTogbGlidHNz
Mi10Y3RpLXRhYnJtZC5zbzxicj4NCiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0c3MyLXRj
dGktIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlidHNzMi10Y3Rp
LTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IDxhIGhyZWY9Imh0dHA6Ly90YWJybWQuc28vIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj50YWJybWQuc28vPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL3RhYnJt
ZC5zby8iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly90YWJybWQuc28v
PC9hPiZndDs8YnI+DQomZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vdGFicm1kLnNvLyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3RhYnJtZC5zby88L2E+Jmd0OyAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBFU1lTPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyBJbml0aWFsaXphdGlvbjogUGFzczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFJlYWQgVFBNIEVL
IENlcnRpZmljYXRlOiBQYXNzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgVFBNIEVLIENlcnRpZmljYXRlIFJv
b3QtQ0EgVmVyaWZpY2F0aW9uOjxicj4NCiZndDsgUGFzczxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IENsZWFy
IFRQTSBTdGF0ZTogUGFzczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IENyZWF0ZWQgRUsgUHJpbWFyeSBvYmpl
Y3Q6IFBhc3M8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICMjIyMjSGFuZGxl
IDB4NDE4MzY4PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQ3JlYXRlIEF0dGVzdGF0aW9uIEtleTogUGFzczxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgIyMjIyNBa19IYW5kbGUgMHg0MTgz
NmI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyBPcmlnaW5hbDxicj4NCiZndDsgQ3JlZGVudGlhbD0mcXVvdDtk
ZWFkYmVlZmRlYWRiZWVmZGVhZCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE1ha2UgQ3JlZGVudGlh
bDogUGFzczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgIyMjIyNFbmNyeXB0
ZWQgQ3JlZGVudGlhbDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7IEJsb2I9JnF1b3Q7MDAyMDUwOGU0MzliYzY1MTJkMDQ0
YmI4NzM5ZThkNjFjOGNlMzY2NGQyNWYzNTcyMzg5YjQ2Yzg3OTdlNTYyYTxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgNDVjNDEyODY0ZjAyMGE3ZjFiYmNhYjdhMzRmMCZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7ICMjIyMjRW5jcnlwdGVkPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDsgU2VjcmV0PSZxdW90
O2I3MDY4OWJiMGVkOWZhODMyNGNmYTAzZDcyN2U2YzY3OTUwNjliNGYwOTQzMTA4NDA5Yjg5MDA5
YjljYzc2Yzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7IDc2YmRkYjMxYTVjY2YzNGNmZWJjNWQzZmU3MTU4OTliYjcyNWE4
YTNjOGZlNGE2MDQ2MjMzODY5MTIzZjNlOTc4MDUxYWVjPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDsgZTBkN2FmMGFkNmY4
NTE2NGEzMmZkMmM1YWQ3NTZlOGMzYjcyZjYzMTExMjZkZTc5YTMwYzBkNzJhYTBhNmYzZjQzN2Y2
YmM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0OyAwNzdjNDFkM2NjNjQ1MGM3MWU4MDNjYTYwNzRkMzRjZTNkZWJmNTExNGY0
YmFjMmZkN2VlNmE4N2VmOWYwN2Q4MzA3OTQ3Nzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7IDVkZGE0Zjc3ZTQ2MjBjYmFm
OWFlYjMwMjA0MGVlMmE2NmEzNTJiOWZmZmFhNTQ0N2MwOWEyNDliYjIyZDlkOTg5YjdmMTQ8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0OyAwNjYxMmE5MGI4ZDhiY2U2YmI5NDBmYmZkMWQ1MGYzMTM5ODQwM2EyNjQzYzczYmVj
MzM2ZTZmY2NhNDZmMjlmOWI2YWE4Nzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7IGZkMTFkNTNlYzZmMTQ1ZDYxYjJhNjFk
ZmZjNzgzYWUyYjJjNjYxODQ0MzVkNjMzZDBiNWE0MjBlZmEwMTc0OGUzOWQ2ODc8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGUxZWI5ZmNjMTc1OWMxODQ5NzI3NzliZmMmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyBBY3RpdmF0aW5nIENyZWRlbnRpYWw6IFBhc3M8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICMjIyMjUmVjb3ZlcmVkPGJyPg0KJmd0OyBDcmVk
ZW50aWFsPSZxdW90O2RlYWRiZWVmZGVhZGJlZWZkZWFkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
W3Jvb3RdIzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgT24gV2VkLCBBcHIgOCwg
MjAyMCBhdCA3OjAyIFBNIFJhaHVsPGJyPg0KJmd0OyBIYXJkaWthcjxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5r
Ij5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRp
a2FyQGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJh
aHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFp
bC5jb208L2E+Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWls
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPjxicj4NCiZn
dDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRh
cmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7wqAgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5r
Ij5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxo
YXJkaWthckBnbWFpbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFo
dWxoYXJkaWthckBnbWFpbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tPC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhh
cmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29t
PC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBn
bWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7
ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFo
dWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWls
LmNvbTwvYT4mZ3Q7ICZndDsgJmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPjxicj4NCiZndDsg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlr
YXJAZ21haWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFo
dWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWls
LmNvbTwvYT4mZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVs
aGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5j
b208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2Fy
QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZn
dDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPjxicj4NCiZndDsgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0i
X2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4mZ3Q7ICZndDsgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1
bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWth
ckBnbWFpbC5jb208L2E+Jmd0O8KgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFy
ZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208
L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdt
YWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVsaGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFodWxoYXJkaWthckBnbWFp
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT48YnI+DQom
Z3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+Jmd0O8KgICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+cmFodWxoYXJkaWthckBnbWFpbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpyYWh1bGhhcmRpa2FyQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhaHVs
aGFyZGlrYXJAZ21haWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7ICZndDsgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBUaGFua3MgZ3V5cywgSSYjMzk7bGwgdHJ5IHRoaXMgYnV0
wqAgaSBhbHNvPGJyPg0KJmd0OyB3YW50ZWQgdG8ga25vdyBpZiB0aGVyZTxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgaXMgYTxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgd2F5IHRvPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBrbm93IGlmIHRoZSBUUE0gc3RpbGwg
aGFzIHRoZSBFSyBhbmQgQUs8YnI+DQomZ3Q7IGtleXMgbG9hZGVkPyBJIGhhdmU8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IHRoZSBFSzxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgaGFuZGxlIGFuZCBBSzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgaGFuZGxlIChub3QgbWFkZSBpdCBwZXJzaXN0ZW50KSBidXQgSTxicj4NCiZndDsgd2Fu
dCB0byBtYWtlIHN1cmUgaXQmIzM5O3M8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHByZXNlbnQgYXM8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IHRoZXNlIGFyZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbmVj
ZXNzYXJ5IGZvciBBY3RpdmF0ZUNyZWRlbnRpYWwgdG88YnI+DQomZ3Q7IHN1Y2NlZWQ8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBFU3lzX0FjdGl2YXRlQ3Jl
ZGVudGlhbCBjb21wbGFpbmluZzxicj4NCiZndDsgYWJvdXQgc2VjcmV0PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBwYXJhbWV0ZXI8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IGRvZXNuJiMzOTt0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyBtYWtlIHNlbnNlIHRvIG1lLCBJIHRlc3RlZCBvbiBzZXJ2ZXI8YnI+DQomZ3Q7IHNpZGUsIGFr
X25hbWUgaXMgc2FtZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDsgYXM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IHRoYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHNlbnQgYW5kIHNvIGlz
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBFS19QVUIgb2JqZWN0IGFzIHdl
bGwgYXPCoCBFS19DZXJ0IGluPGJyPg0KJmd0OyBudnJhbSwgSSBjYWxsIHRoZSBzYW1lPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBleHRlcm5hbF9tYWtlY3JlZGVudGlhbCBj
YWxsIHRoYXQmIzM5O3MgaW4gdGhlPGJyPg0KJmd0OyBHaXRIdWIgdG8gY3JlYXRlPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBzZWNyZXQ8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGFu
ZDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbWFkZSBzdXJlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyBzZWNyZXQsY3JlZGJsb2IgbWF0Y2hlcyBvbiB0aGUgY2xpZW50PGJyPg0K
Jmd0OyBzaWRlIHdoZW4gcmVjZWl2ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmZ3Q7IGZyb208YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHNlcnZlci48YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgVGhhbmtzLDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoFJhaHVsPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoE9uIFR1ZSwgTWFyIDE3LCAyMDIw
IGF0IDY6MTkgQU0gSW1yYW48YnI+DQomZ3Q7IERlc2FpPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAm
bHQ7PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2Fp
QGludGVsLmNvbTwvYT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVz
YWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPjxi
cj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1y
YW4uZGVzYWlAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50
ZWwuY29tPC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBp
bnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+PGJyPg0K
Jmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRh
cmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50
ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVz
YWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZn
dDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1y
YW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDvCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpp
bXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5j
b208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBp
bnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OyAm
Z3Q7ICZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVz
YWlAaW50ZWwuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZndDvCoCAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5p
bXJhbi5kZXNhaUBpbnRlbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBp
bnRlbC5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2Js
YW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5k
ZXNhaUBpbnRlbC5jb208L2E+Jmd0O8KgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFu
LmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwv
YT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7ICZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOmltcmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmltcmFuLmRlc2Fp
QGludGVsLmNvbTwvYT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVz
YWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPjxi
cj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgJmd0OyAmZ3Q7
ICZndDsgJmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB3cm90ZTo8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoFNldCB0aGlzIHVwIHdpdGggYWxsIGhhbmRsZXMgaW4gdXNlPGJyPg0KJmd0OyBtYWRl
IHBlcnNpc3RlbnQuIElmPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0OyB5b3U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IHN0aWxsIHNlZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgaXNzdWVzLCBnZGItYnJlYWsgb3IgdHVybiBvbiBkZWJ1Zzxicj4NCiZndDsgbG9n
Z2luZyBhdCB0aGUgRXN5cyBjYWxsIGFuZDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgY29tcGFyZTxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgdGhlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBmdW5jdGlvbiBh
cmd1bWVudHMuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
dHBtMiBtYWlsaW5nIGxpc3QgLS08YnI+DQomZ3Q7IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJA
bGlzdHMuMDEub3JnPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+Jmd0Ozxicj4NCiZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9y
ZzwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0O8KgICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBt
MkBsaXN0cy4wMS5vcmc8L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0
cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZn
dDsgJmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Jmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0
PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9h
PiZndDs8YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0
cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0
cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxi
cj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRh
cmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3Rz
LjAxLm9yZzwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7
ICZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwv
YT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0O8KgICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBs
aXN0cy4wMS5vcmc8L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0y
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDsg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5r
Ij50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJy
Pg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3Jn
PC9hPiZndDsgJmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0y
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4N
CiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdl
dD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAx
Lm9yZzwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMu
MDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJA
bGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAx
Lm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+DQomZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9i
bGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRw
bTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0
OyAmZ3Q7ICZndDsgJmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0bzxi
cj4NCiZndDsgdHBtMi08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7IDxhIGhyZWY9Im1haWx0bzpsZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5r
Ij5sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmxlYXZl
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmxlYXZlQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7
PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAx
Lm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxh
bmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5r
Ij50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
dHBtMi0iIHRhcmdldD0iX2JsYW5rIj50cG0yLTwvYT48YnI+DQomZ3Q7IDxhIGhyZWY9Im1haWx0
bzpsZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj5sZWF2ZUBsaXN0cy4wMS5vcmc8
L2E+Jmd0O8KgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnRwbTItIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi08L2E+PGJyPg0K
Jmd0OyA8YSBocmVmPSJtYWlsdG86bGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+
bGVhdmVAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4NCiZndDsgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2Js
YW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxl
YXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0
cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLSIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItPC9hPjxi
cj4NCiZndDsgPGEgaHJlZj0ibWFpbHRvOmxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxh
bmsiPmxlYXZlQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7wqAgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxp
c3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi0iIHRhcmdldD0i
X2JsYW5rIj50cG0yLTwvYT48YnI+DQomZ3Q7IDxhIGhyZWY9Im1haWx0bzpsZWF2ZUBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj5sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7ICZn
dDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50
cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2
ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0O8KgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTIt
IiB0YXJnZXQ9Il9ibGFuayI+dHBtMi08L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRw
bTItIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi08L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgPGEgaHJlZj0ibWFpbHRvOmxlYXZlQGxpc3RzLjAx
Lm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmxlYXZlQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86bGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+bGVhdmVA
bGlzdHMuMDEub3JnPC9hPiZndDsgJmd0Ozxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZl
QGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4m
Z3Q7PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLSIgdGFyZ2V0PSJf
YmxhbmsiPnRwbTItPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLSIgdGFyZ2V0
PSJfYmxhbmsiPnRwbTItPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmZ3Q7IDxhIGhyZWY9Im1haWx0bzpsZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdl
dD0iX2JsYW5rIj5sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOmxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmxlYXZlQGxpc3RzLjAxLm9y
ZzwvYT4mZ3Q7ICZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBt
Mi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAx
Lm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi0iIHRhcmdldD0iX2JsYW5r
Ij50cG0yLTwvYT48YnI+DQomZ3Q7IDxhIGhyZWY9Im1haWx0bzpsZWF2ZUBsaXN0cy4wMS5vcmci
IHRhcmdldD0iX2JsYW5rIj5sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0O8KgICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+
dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRw
bTItIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi08L2E+PGJyPg0KJmd0OyA8YSBocmVmPSJtYWlsdG86
bGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+bGVhdmVAbGlzdHMuMDEub3JnPC9h
PiZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRh
cmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86dHBtMi0iIHRhcmdldD0iX2JsYW5rIj50cG0yLTwvYT48YnI+DQomZ3Q7IDxh
IGhyZWY9Im1haWx0bzpsZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj5sZWF2ZUBs
aXN0cy4wMS5vcmc8L2E+Jmd0O8KgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVh
dmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8
L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTItIiB0YXJnZXQ9Il9ibGFuayI+dHBt
Mi08L2E+PGJyPg0KJmd0OyA8YSBocmVmPSJtYWlsdG86bGVhdmVAbGlzdHMuMDEub3JnIiB0YXJn
ZXQ9Il9ibGFuayI+bGVhdmVAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0OyAmZ3Q7ICZndDsgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0OyAlKHdlYl9wYWdlX3VybClz
bGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0K

--===============1712441618383162052==--

