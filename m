Content-Type: multipart/mixed; boundary="===============0084566102310546314=="
MIME-Version: 1.0
From: Anderson, Daniel <daniel.anderson at intel.com>
Subject: Re: [tpm2] TCTI initialization fails with error 0xc000b
Date: Thu, 22 Feb 2018 22:13:51 +0000
Message-ID: <207C810BE4BA2440832668E0F208BFD3AF644B@ORSMSX108.amr.corp.intel.com>
In-Reply-To: 09b4a528-26cb-8b26-786f-58b43276bf81@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0084566102310546314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I finally got tpm2_tools talking to tpm2.

The remaining tpm2-abrmd problems:

1. To use the simulator, you do *NOT* use: tpm2-abrmd --tcti socket
This worked for me: tpm2-abrmd --tcti=3Dsocket
(it is mentioned in an example in the tpm2-abrmd(8) man page, although not =
mentioned that it's for the simulator).

2. Also, I had to su to tss to start it (another non-root user or root user=
 does not work).

$ tpm2-tools/tools/tpm2_getrandom 8
0x6F 0xA7 0xE0 0x28 0x98 0x33 0x62 0x78

-----Original Message-----
From: Anderson, Daniel =

Sent: Thursday, February 22, 2018 9:18 AM
To: 'Javier Martinez Canillas' <javierm(a)redhat.com>; tpm2(a)lists.01.org
Subject: RE: [tpm2] TCTI initialization fails with error 0xc000b

Javier,
Thanks for your reply--it is really useful as there are multiple undocument=
ed options I need to use.  I am using MS Outlook which is lame for inline r=
eplies,  so I'll manually mark it with "dan> "

Dan

-----Original Message-----
From: Javier Martinez Canillas [mailto:javierm(a)redhat.com] =

Sent: Thursday, February 22, 2018 8:52 AM
To: Anderson, Daniel <daniel.anderson(a)intel.com>; tpm2(a)lists.01.org
Subject: Re: [tpm2] TCTI initialization fails with error 0xc000b

Hello Dan,

On 02/22/2018 05:01 PM, Anderson, Daniel wrote:
> Javier,
> Thanks!
> =

> The version is the latest source as of the message--I pulled the latest s=
ource and rebuilt several times.

Ok, I'm also building today's master branch for all projects.

> I will try again today and see if there has been a fix in the past week.
> There is no /dev/tpm--I am using the simulator and specify that in the op=
tions.

I didn't see the option specified in the command you shared in this thread.
You have to run with tpm2-abrmd --tcti socket.

dan> OK. That may be the missing option.  The "tpm2-abrmd --tcti socket" op=
tion is not mentioned anywhere in dan> the INSTALL.md or README.md files.  =

dan> I found a tpm2-abrmd man page with several examples, but it doesn't me=
ntion which one to use for the dan> simulator.

dan> Also, since tpm2-abrmd is started automatically by systemd, apparently=
, how does one add this option dan> (whatever the correct syntax) to the sy=
stem configuration?


> There may be another option or setting that I am missing though.
> Here is what I build with:
> =

> For tpm2-tss:
> configure --enable-unit
>         --with-simulatorbin=3D$TPM_SERVER

Only these are valid options for tpm2-tss, from here are tpm2-abrmd options:

>         --with-dbuspolicydir=3D/etc/dbus-1/system.d
>         --with-systemdsystemunitdir=3D/lib/systemd/system
>         --with-systemdpresetdir=3D/lib/systemd/system-preset
>         --with-udevrulesdir=3D/etc/udev/rules.d
>         --with-sysdefaultdir=3D/etc/default
>         --with-dbusdatadir=3D/usr/share/dbus-1/system-services
>
> For tpm2-abrmd:
> configure --enable-unit =

> --with-simulatorbin=3D$HOME/tpm/simulator/src/tpm_server
>

As mentioned, you either got the configure options mixed up or are using it=
 wrong.

There are my configure options for tpm2-tss, tpm2-abrmd and tpm2-tools:

tpm2-tss:

$ ./configure --prefix=3D/usr

tpm2-abrmd:

$ ./configure --with-dbuspolicydir=3D/etc/dbus-1/system.d --with-udevrulesd=
ir=3D/usr/lib/udev/rules.d --with-systemdsystemunitdir=3D/usr/lib/systemd/s=
ystem --libdir=3D/usr/lib64

dan> This is useful. The systemdsystemunitdir (not mentioned in the README =
or INSTALL) should help.

tpm2-tools

$ ./configure --prefix=3D/usr

> I cannot believe that anyone has tpm2-abrmd working without special hand-=
copied fixes. The com.intel.tss2.tabrmd.service for example is not installe=
d in /usr/share/dbus-1/system-services/ but in /usr/local/share/dbus-1/syst=
em-services/.
>

I think this is because you didn't specify a correct --with-dbuspolicydir a=
s mentioned before. Another thing that you have to keep in mind, is that th=
e default D-Bus config only allows the tss and root user to acquire the com=
.intel.tss2.Tabrmd D-Bus well-known name.

So after installing latest master with these configure options, I just do:

$ ./tpm_server

$ sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti socket

dan> so you do not use system to start tpm2-abrmd.

$ tpm2_pcrlist -L sha1:0 -T abrmd                           =

sha1:                      =

  0 : 0x0000000000000000000000000000000000000003

And using the device TCTI also works for me:

$ sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti device

dan> neither tpm2-abrmd --tcti socket or tpm2-abrmd --tcti device is mentio=
ned in the README.md, INSTALL.md, or tpm2-abrmd(8) man page, so I'll add th=
ose.

$ tpm2_pcrlist -L sha1:0 -T abrmd                           =

sha1:                      =

  0 : 0xC72EC9E6CBC2B6A95F334DDDD6513981DA00F0C2

Best regards,
--
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement Red Hat

--===============0084566102310546314==--

