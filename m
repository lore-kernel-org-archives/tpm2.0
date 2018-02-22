Content-Type: multipart/mixed; boundary="===============2978363701612648860=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] TCTI initialization fails with error 0xc000b
Date: Thu, 22 Feb 2018 17:51:58 +0100
Message-ID: <09b4a528-26cb-8b26-786f-58b43276bf81@redhat.com>
In-Reply-To: 207C810BE4BA2440832668E0F208BFD3AF6317@ORSMSX108.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2978363701612648860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
> configure --enable-unit --with-simulatorbin=3D$HOME/tpm/simulator/src/tpm=
_server
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

tpm2-tools

$ ./configure --prefix=3D/usr

> I cannot believe that anyone has tpm2-abrmd working without special hand-=
copied fixes. The com.intel.tss2.tabrmd.service for example is not installe=
d in /usr/share/dbus-1/system-services/ but in /usr/local/share/dbus-1/syst=
em-services/.
>

I think this is because you didn't specify a correct --with-dbuspolicydir
as mentioned before. Another thing that you have to keep in mind, is that
the default D-Bus config only allows the tss and root user to acquire the
com.intel.tss2.Tabrmd D-Bus well-known name.

So after installing latest master with these configure options, I just do:

$ ./tpm_server

$ sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti socket

$ tpm2_pcrlist -L sha1:0 -T abrmd                           =

sha1:                      =

  0 : 0x0000000000000000000000000000000000000003

And using the device TCTI also works for me:

$ sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti device

$ tpm2_pcrlist -L sha1:0 -T abrmd                           =

sha1:                      =

  0 : 0xC72EC9E6CBC2B6A95F334DDDD6513981DA00F0C2

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============2978363701612648860==--

