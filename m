Content-Type: multipart/mixed; boundary="===============2342729706549047071=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Wed, 15 Apr 2020 15:23:12 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649ECED04@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAP3jAwS7HV5nk7O5kAvuHjpuG8NoZUPhsjagDSVo0eVo5XxD5g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2342729706549047071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
> Sent: Monday, April 13, 2020 2:32 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: Desai, Imran <imran.desai(a)intel.com>; tpm2(a)lists.01.org
> Subject: Re: [tpm2] Re: ESys_ActivateCredential
> =

> Ok, got it. I'm using ESAPI C APIs. But its pretty much the same as the t=
pm2 tools
> implementation.
> How do i add debugs in my poky directory?  I have tpm2.0-tss_2.1.4.bb
> <http://tpm2.0-tss_2.1.4.bb>  file.

I've never touched Yocto, so we're probably not going to be able to help
much there.

> Also, how to add compile-time log flags to my src file that uses ESAPI ca=
lls?
> Running separately was easy, I just called TSS2_LOG=3D"all+ERROR,tcti+DEB=
UG"

That=E2=80=99s not a compile time flag, it's in the environment. All progra=
ms have access to
The environment, via getenv and setenv calls. See: https://linux.die.net/ma=
n/5/environ
So you could call setenv() in the program. However, usually if you're not s=
taring
The program directly on the shell, some type of execution environment, like=
 init
or system will allow you to add these values in. This sounds very yocto spe=
cific on
how to do that, thus you would probably want to discuss that on the Yocto p=
roject
mailing lists.

The log messages go to stderr and stdout, so you could redirect them. Doing=
 it in C:
https://stackoverflow.com/questions/584868/rerouting-stdin-and-stdout-from-c

But it would probably be easier just to alter the execution environment of =
the program,
How to do that is system specific. =


> =

> On Mon, Apr 13, 2020 at 7:20 AM Roberts, William C <william.c.roberts(a)i=
ntel.com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> 	> -----Original Message-----
> 	> From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> ]
> 	> Sent: Friday, April 10, 2020 4:15 PM
> 	> To: Roberts, William C <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	> Cc: Desai, Imran <imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com> >; tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 	> Subject: Re: [tpm2] Re: ESys_ActivateCredential
> 	>
> 	> Hi Bill,
> 	> I have this on my system: Is tpmrm0 same as tabrmd? I believe mine is
> using this
> 	> right now , i'm changing it to what you mentioned  to see if it helps.
> 	> [root(a)nfvis ~]# ls -l /dev/tpm*
> 	> crw-rw----. 1 tss root  10,   224 Apr  8 23:19 /dev/tpm0
> 	> crw-rw----. 1 tss tss  254, 65536 Apr  8 23:19 /dev/tpmrm0 Thanks, Rah=
ul
> =

> 	In theory, yes. In practice no.
> 	/dev/tpmrm0 is the in kernel resource manager
> 	tpm2-abrmd is the userspace resource manager
> =

> 	tpm2-abrmd has a few features tpmrm0 doesn't have, but unless you're
> 	using policy sessions with tpm2-tools, you shouldn't notice a difference.
> =

> 	>
> 	> On Fri, Apr 10, 2020 at 11:33 AM Roberts, William C
> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > wrote:
> 	>
> 	>
> 	>
> 	>
> 	>       > -----Original Message-----
> 	>       > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> ]
> 	>       > Sent: Friday, April 10, 2020 1:08 PM
> 	>       > To: Roberts, William C <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>       > Cc: Desai, Imran <imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >;
> tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > Subject: Re: [tpm2] Re: ESys_ActivateCredential
> 	>       >
> 	>       > Thanks Bill, trying that.
> 	>       >  I did not get debug build tpm2_tss, isn't it all prebuilt ? I=
 will have
> to see
> 	> how to
> 	>       > do it in poky.
> 	>
> 	>       If you're getting it from a package manager, yes. But there's no=
thing
> 	> stopping you
> 	>       from using source builds. Some distro's will package debug symbo=
ls
> for
> 	> their
> 	>       packages.
> 	>
> 	>       >
> 	>       > On Fri, Apr 10, 2020 at 8:16 AM Roberts, William C
> 	> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> <mailto:william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.c=
om> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > > wrote:
> 	>       >
> 	>       >
> 	>       >
> 	>       >
> 	>       >       > -----Original Message-----
> 	>       >       > From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> ]
> 	>       >       > Sent: Thursday, April 9, 2020 2:51 PM
> 	>       >       > To: Roberts, William C <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > >
> 	>       >       > Cc: Desai, Imran <imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >;
> 	> tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       >       > Subject: Re: [tpm2] Re: ESys_ActivateCredential
> 	>       >       >
> 	>       >       > Thanks Bill. I use this
> 	>       >       > Esys_Initialize( &ectx, NULL, NULL);
> 	>       >       >
> 	>       >       > so i'm assuming it would take the default  libtss2-tct=
i-
> tabrmd.so.0.
> 	>       >
> 	>       >       This should do it for you:
> 	>       >       TSS2_RC
> 	>       >       Tss2_TctiLdr_Initialize (const char *nameConf,
> 	>       >                                TSS2_TCTI_CONTEXT **context);
> 	>       >
> 	>       >       Set nameConf to the string "tabrmd", that should give yo=
u a tcti
> 	> pointer
> 	>       > you can
> 	>       >       pass wot Esys_Initialize()
> 	>       >
> 	>       >       >
> 	>       >       >
> 	>       >       > If I need to debug Esys_ActivateCredential more, how c=
an I do
> it,
> 	> these
> 	>       > APIs are
> 	>       >       > no more standalone, I have integrated it in a bigger c=
ode base
> and
> 	>       > added the
> 	>       >       > esys-tss2 and other libs in my poky build, so now it r=
uns as
> 	> different
> 	>       > process that
> 	>       >       > invokes this function, I can gdb into the process but =
I can't
> seem to
> 	> gdb
> 	>       > into
> 	>       >       > Esys_Activate..( )
> 	>       >
> 	>       >       Did you build tpm2-tss with debug symbols?
> 	>       >       Add --enable-debug
> 	>       >
> 	>       >       >
> 	>       >       >
> 	>       >       > Thanks,
> 	>       >       > Rahul
> 	>       >       >
> 	>       >       >
> 	>       >       >
> 	>       >       >
> 	>       >       > On Thu, Apr 9, 2020 at 10:23 AM Roberts, William C
> 	>       > <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>  <mailto:william.c.roberts(a)intel=
.com
> <mailto:william.c.roberts(a)intel.com> >
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>  <mailto:william.c.roberts(a)intel=
.com
> <mailto:william.c.roberts(a)intel.com> > >
> 	>       >       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	>       > <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com>
> 	> <mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> > > > > wrote:
> 	>       >       >
> 	>       >       >
> 	>       >       >       > -----Original Message-----
> 	>       >       >       > From: Rahul Hardikar [mailto:rahulhardikar(a)g=
mail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	>       >       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> > >
> 	>       > ]
> 	>       >       >       > Sent: Thursday, April 9, 2020 11:18 AM
> 	>       >       >       > To: Desai, Imran <imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>       >       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>  <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com> >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > > >
> 	>       >       >       > Cc: tpm2(a)lists.01.org <mailto:tpm2(a)lists.0=
1.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> 	>       >       >       > Subject: [tpm2] Re: ESys_ActivateCredential
> 	>       >       >       >
> 	>       >       >       > How do I know if  RM is being used?
> 	>       >       >
> 	>       >       >
> 	>       >       >       If you set the tcti to the device tcti, it will =
open /dev/tpm0
> by
> 	>       > default. And
> 	>       >       > that wont
> 	>       >       >       Be an RM. You can also give it an option. Esys_I=
nitialize()
> takes a
> 	> tcti
> 	>       > as an
> 	>       >       > option,
> 	>       >       >       NULL will cause it to use the default search beh=
avior of the
> 	>       > Tss2_TctiLdr,
> 	>       >       > see:
> 	>       >       >
> 	>       >       >       https://github.com/tpm2-software/tpm2-
> 	>       >       > tss/blob/master/man/Tss2_TctiLdr_Initialize.3.in
> <http://Tss2_TctiLdr_Initialize.3.in>
> 	> <http://Tss2_TctiLdr_Initialize.3.in>
> 	>       > <http://Tss2_TctiLdr_Initialize.3.in>
> 	>       >       >       https://github.com/tpm2-software/tpm2-
> 	>       >       > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> <http://Tss2_Tcti_Device_Init.3.in>
> 	> <http://Tss2_Tcti_Device_Init.3.in>
> 	>       > <http://Tss2_Tcti_Device_Init.3.in>
> 	>       >       >       https://github.com/tpm2-software/tpm2-
> 	>       > tss/blob/master/man/tss2-
> 	>       >       > tcti-device.7.in <http://tcti-device.7.in>  <http://tc=
ti-
> device.7.in>  <http://tcti-device.7.in>
> 	>       >       >
> 	>       >       >       You can use man locally if you prefer as well:
> 	>       >       >       man 3 Tss2_TctiLdr_Initialize
> 	>       >       >       man 7 tss2-tcti-device
> 	>       >       >       man 3 Tss2_Tcti_Device_Init
> 	>       >       >
> 	>       >       >       Note that https://github.com/tpm2-software/tpm2-
> 	>       >       > tss/blob/master/man/Tss2_Tcti_Device_Init.3.in
> <http://Tss2_Tcti_Device_Init.3.in>
> 	> <http://Tss2_Tcti_Device_Init.3.in>
> 	>       > <http://Tss2_Tcti_Device_Init.3.in>
> 	>       >       >       Has sample code in it.
> 	>       >       >
> 	>       >       >       If you're using the tools, it supports explicitl=
y choosing the
> TCTI:
> 	>       >       >       https://github.com/tpm2-software/tpm2-
> 	>       >       > tools/blob/master/man/common/tcti.md
> 	>       >       >
> 	>       >       >       Also note that the /dev/tpmrm0 (Notice the RM) i=
s an in-
> kernel
> 	>       > resource
> 	>       >       > manager.
> 	>       >       >
> 	>       >       >
> 	>       >       >       > When I do ESys_Initialize, I see these WARNING=
s,
> wondering
> 	> if it's
> 	>       > okay
> 	>       >       > for multi-
> 	>       >       >       > thread
> 	>       >       >       > WARNING:esys:src/tss2-
> 	>       > esys/esys_tcti_default.c:137:tcti_from_file()
> 	>       >       > Could not
> 	>       >       >       > load TCTI file: libtss2-tcti-default.so <http:=
//libtss2-tcti-
> 	>       > default.so/ <http://default.so/>  <http://default.so/> >
> 	>       >       > libtss2-tcti-
> 	>       >       >       > default.so <http://libtss2-tcti-default.so/>
> 	>       >       >       > WARNING:esys:src/tss2-
> 	>       > esys/esys_tcti_default.c:137:tcti_from_file()
> 	>       >       > Could not
> 	>       >       >       > load TCTI file: libtss2-tcti-tabrmd.so <http:/=
/libtss2-tcti-
> 	>       > tabrmd.so/ <http://tabrmd.so/>  <http://tabrmd.so/> >
> 	>       >       >       >
> 	>       >       >       > In my single threaded process, everything work=
s so
> smoothly
> 	>       > [root]#
> 	>       >       > ./tpm
> 	>       >       >       > WARNING:esys:src/tss2-
> 	>       > esys/esys_tcti_default.c:137:tcti_from_file()
> 	>       >       > Could not
> 	>       >       >       > load TCTI file: libtss2-tcti-default.so <http:=
//libtss2-tcti-
> 	>       > default.so/ <http://default.so/>  <http://default.so/> >
> 	>       >       >       > WARNING:esys:src/tss2-
> 	>       > esys/esys_tcti_default.c:137:tcti_from_file()
> 	>       >       > Could not
> 	>       >       >       > load TCTI file: libtss2-tcti-tabrmd.so <http:/=
/libtss2-tcti-
> 	>       > tabrmd.so/ <http://tabrmd.so/>  <http://tabrmd.so/> >
> 	>       >       > ESYS
> 	>       >       >       > Initialization: Pass
> 	>       >       >       >
> 	>       >       >       > Read TPM EK Certificate: Pass
> 	>       >       >       >
> 	>       >       >       > TPM EK Certificate Root-CA Verification: Pass
> 	>       >       >       >
> 	>       >       >       > Clear TPM State: Pass
> 	>       >       >       >
> 	>       >       >       > Created EK Primary object: Pass
> 	>       >       >       > #####Handle 0x418368
> 	>       >       >       >
> 	>       >       >       > Create Attestation Key: Pass
> 	>       >       >       > #####Ak_Handle 0x41836b
> 	>       >       >       >
> 	>       >       >       > Original Credential=3D"deadbeefdeadbeefdead"
> 	>       >       >       >
> 	>       >       >       > Make Credential: Pass
> 	>       >       >       > #####Encrypted Credential
> 	>       >       >       >
> 	>       >       >
> 	>       >
> 	>
> Blob=3D"0020508e439bc6512d044bb8739e8d61c8ce3664d25f3572389b46c8797e562a
> 	>       >       >       > 45c412864f020a7f1bbcab7a34f0"
> 	>       >       >       >
> 	>       >       >       > #####Encrypted
> 	>       >       >       >
> 	>       >       >
> 	>       >
> 	>
> Secret=3D"b70689bb0ed9fa8324cfa03d727e6c6795069b4f0943108409b89009b9cc76c
> 	>       >       >       >
> 	>       >       >
> 	>       >
> 	>
> 76bddb31a5ccf34cfebc5d3fe715899bb725a8a3c8fe4a6046233869123f3e978051aec
> 	>       >       >       >
> 	>       >       >
> 	>       >
> 	>
> e0d7af0ad6f85164a32fd2c5ad756e8c3b72f6311126de79a30c0d72aa0a6f3f437f6bc
> 	>       >       >       >
> 	>       >       >
> 	>       >
> 	>
> 077c41d3cc6450c71e803ca6074d34ce3debf5114f4bac2fd7ee6a87ef9f07d83079477
> 	>       >       >       >
> 	>       >       >
> 	>       >
> 	>
> 5dda4f77e4620cbaf9aeb302040ee2a66a352b9fffaa5447c09a249bb22d9d989b7f14
> 	>       >       >       >
> 	>       >       >
> 	>       >
> 	>
> 06612a90b8d8bce6bb940fbfd1d50f31398403a2643c73bec336e6fcca46f29f9b6aa87
> 	>       >       >       >
> 	>       >       >
> 	>       >
> 	>
> fd11d53ec6f145d61b2a61dffc783ae2b2c66184435d633d0b5a420efa01748e39d687
> 	>       >       >       > e1eb9fcc1759c184972779bfc"
> 	>       >       >       >
> 	>       >       >       > Activating Credential: Pass
> 	>       >       >       > #####Recovered Credential=3D"deadbeefdeadbeefd=
ead"
> 	>       >       >       >
> 	>       >       >       > [root]#
> 	>       >       >       >
> 	>       >       >       >
> 	>       >       >       >
> 	>       >       >       > On Wed, Apr 8, 2020 at 7:02 PM Rahul Hardikar
> 	>       >       > <rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> > >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> > > >
> 	>       >       >       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com>
> <mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> >
> 	>       > <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com>  <mailto:rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > >
> 	> > >
> 	>       >       > > wrote:
> 	>       >       >       >
> 	>       >       >       >
> 	>       >       >       >       Thanks guys, I'll try this but  i also w=
anted to know if
> there
> 	> is a
> 	>       > way to
> 	>       >       >       > know if the TPM still has the EK and AK keys l=
oaded? I
> have
> 	> the EK
> 	>       >       > handle and AK
> 	>       >       >       > handle (not made it persistent) but I want to =
make sure
> it's
> 	>       > present as
> 	>       >       > these are
> 	>       >       >       > necessary for ActivateCredential to succeed
> 	>       >       >       >       ESys_ActivateCredential complaining abou=
t secret
> 	> parameter
> 	>       >       > doesn't
> 	>       >       >       > make sense to me, I tested on server side, ak_=
name is
> same
> 	> as
> 	>       > that
> 	>       >       > sent and so is
> 	>       >       >       > EK_PUB object as well as  EK_Cert in nvram, I =
call the
> same
> 	>       >       >       > external_makecredential call that's in the Git=
Hub to
> create
> 	> secret
> 	>       > and
> 	>       >       > made sure
> 	>       >       >       > secret,credblob matches on the client side when
> received
> 	> from
> 	>       > server.
> 	>       >       >       >
> 	>       >       >       >       Thanks,
> 	>       >       >       >       Rahul
> 	>       >       >       >
> 	>       >       >       >       On Tue, Mar 17, 2020 at 6:19 AM Imran De=
sai
> 	>       >       > <imran.desai(a)intel.com <mailto:imran.desai(a)intel.c=
om>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > >
> 	>       >       >       > <mailto:imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > >
> 	>       > <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.co=
m>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> >
> 	> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com>
> <mailto:imran.desai(a)intel.com <mailto:imran.desai(a)intel.com> > > > > >
> 	>       >       > wrote:
> 	>       >       >       >
> 	>       >       >       >
> 	>       >       >       >               Set this up with all handles in =
use made persistent.
> If
> 	> you
> 	>       > still see
> 	>       >       >       > issues, gdb-break or turn on debug logging at =
the Esys call
> and
> 	>       > compare
> 	>       >       > the
> 	>       >       >       > function arguments.
> 	>       >       >       >
> 	>       > _______________________________________________
> 	>       >       >       >               tpm2 mailing list -- tpm2(a)list=
s.01.org
> <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > >
> 	>       >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.or=
g>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > >
> 	>       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> > > > >
> 	>       >       >       >               To unsubscribe send an email to =
tpm2-
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org>  <mailto:tpm2-
> leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >
> 	>       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.0=
1.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> > >
> 	>       >       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> leave(a)lists.01.org>  <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> leave(a)lists.01.org> >
> 	> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> > > >
> 	>       >       >       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-
> leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> >  <mailto:tpm2-
> leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>  <mailto:tpm2-
> <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> > >
> 	>       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.0=
1.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >
> 	> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org>
> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> > > =
> >
> 	>       >       >       >
> 	> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> 	>       >       >       >
> 	>       >       >
> 	>       >       >
> 	>       >
> 	>       >
> 	>
> 	>
> =

> =



--===============2342729706549047071==--

