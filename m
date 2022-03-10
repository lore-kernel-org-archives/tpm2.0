Content-Type: multipart/mixed; boundary="===============8481080547779339208=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How do I use Microsoft's sim (TSS.MSR) with lib tss2-esys
Date: Thu, 10 Mar 2022 16:08:13 +0000
Message-ID: <1415184b6ee4715a0026deef74ea2620e392d4da.camel@intel.com>
In-Reply-To: CAMs2GAqF=oqPqqC53+QCA0xySrwbdR-wgwDD2DZj1-2DZGDQdw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8481080547779339208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-03-10 at 07:44 -0800, Markus Willhelm Schmid wrote:
> I made an error in my previous email, I pasted in the URL to IBM's
> TCC stack and not to IBM's SW TPM. This is what I am trying to
> compile.
> https://sourceforge.net/projects/ibmswtpm2/


FYI Ken has a staged version that's ready to go with OpenSSL 3.0.1:
https://github.com/kgoldman/ibmswtpm2/tree/next

> =

> On Windows, my OpenSSL version is 3.0.1 and on Linux, it's 1.1.1f
>  (31 Mar 2020). The version number triggers when I compile SW TPM on
> Windows and when I bypass this version check, the following fails:
> #if    defined THIRTY_TWO_BIT && (RADIX_BITS !=3D 32) \
>     || ((defined SIXTY_FOUR_BIT_LONG || defined SIXTY_FOUR_BIT) \
> && (RADIX_BITS !=3D 64))
> #   error Ossl library is using different radix
> #endif
> =

> The above compiles after changing the Visual Studio project from 32
> bit to 64 bit. In other words, there appears to be a problem with
> this project file.
> =

> So I managed to compile for both Linux and Windows. When I run the
> simulator on Linux and try the test program I mentioned in my first
> email, I see this being printed by the simulator:
> =

> Command IPv4 client accepted
> Platform IPv4 client accepted

That's good, that means you have connected from your application to the
TPM 2.0 simulator.

> =

> However, the client still prints:
> ERROR:tcti:src/tss2-tcti/tcti-device.c:439:Tss2_Tcti_Device_Init()
> Failed to open device file /dev/tpmrm0: No such file or directory
> WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init
> for function 0x7f56f5701fb0 failed with a000a
> WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not
> initialize TCTI named: tcti-device
> ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not
> initialize TCTI file: libtss2-tcti-device.so.0
> ERROR:tcti:src/tss2-tcti/tcti-device.c:439:Tss2_Tcti_Device_Init()
> Failed to open device file /dev/tpm0: No such file or directory
> WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init
> for function 0x7f56f5701fb0 failed with a000a
> WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not
> initialize TCTI named: tcti-device
> ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not
> initialize TCTI file: libtss2-tcti-device.so.0

So based on tpm2-tss version, you'll get some noise from the auto
discovery failing on probes, IIUC it was fixed in

commit 860a2cc628fe775a74b88d71b6df631b0ad3dc42
Author: Tadeusz Struk <tadeusz.struk(a)intel.com>
Date:   Mon Mar 22 17:53:25 2021 -0700

    tcti: quiet tcti ldr noise
    =

    Fixes: #2009
    Signed-off-by: Tadeusz Struk <tadeusz.struk(a)intel.com>


Which is included in releases 3.1.0 and higher (so those releases will
be quiet and not make this noise), which version of tpm2-tss are you
using?

> WARNING:esys:src/tss2-
> esys/api/Esys_GetRandom.c:277:Esys_GetRandom_Finish() Received TPM
> Error
> ERROR:esys:src/tss2-esys/api/Esys_GetRandom.c:95:Esys_GetRandom()
> Esys Finish ErrorCode (0x00000100)
> Error: Esys_GetRandom
> =

> The last error is from my test program:
>     Esys_Initialize ..... this seems to be OK
>     r =3D Esys_GetRandom(ctx, ESYS_TR_NONE, ESYS_TR_NONE, ESYS_TR_NONE,
> 20,
>                        &random_bytes);
> =

>     if (r !=3D TSS2_RC_SUCCESS){
>         printf("\nError: Esys_GetRandom\n");
>         exit(1);
>     }
> =

> Questions: =

> How do I make the test program work (Esys_GetRandom) with the
> simulator?

So this is the error:
tpm2 rc_decode 0x00000100
tpm:error(2.0): TPM not initialized by TPM2_Startup or already
initialized

This code was written assuming a resource manager, which sends the
startup command. If you add the startup command it should work, between
Initialize and GetRandom do:

rc - Esys_Startup(ctx, TPM2_SU_CLEAR);

The other option would be to run a resource manager.


> if the IBM simulator is required (IBM SW TPM), why does the
> documentation state that I have to use the Microsoft simulator (ref: =

> https://github.com/tpm2-software/tpm2-tss/blob/master/README.md)?
> If tpm2-tss library is compliant, should the stack not work with any
> compatible TPM 2.0 simulator, including Microsoft's simulator and
> IBM's simulator?
> =

> On Thu, Mar 10, 2022 at 6:11 AM Kenneth Goldman <kgoldman(a)us.ibm.com>
> wrote:
> >  =

> > =

> >  =

> > =

> > From: Markus Willhelm Schmid <willhelm.schmid(a)gmail.com> =

> > Sent: Wednesday, March 9, 2022 4:08 PM
> > Cc: tpm2(a)lists.01.org
> > Subject: [EXTERNAL] [tpm2] Re: How do I use Microsoft's sim
> > (TSS.MSR) with lib tss2-esys
> > =

> >  =

> > =

> > When you say IBM simulator, are you referring to: =

> > https://sourceforge.net/projects/ibmtpm20tss/
> > =

> > If so, this code will not compile on Windows or Linux. I tried to
> > bypass the ifdef for OpenSSL version check in the headers, but I
> > then got a lot of errors. I believe this code requires an ancient
> > (unspecified) OpenSSL version. Also, I could not find anything pre-
> > built.
> > =

> > [kgold]
> > =

> > [kgold] I support the IBM SW TPM.  I test it on Windows and many
> > Linux, with various OpenSS, gcc, mingw, Visual Studio.  If
> > something doesn't work, file a bug report, email me, post here, but
> > don't just give up.  It's widely used.
> > =

> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============8481080547779339208==--

