Content-Type: multipart/mixed; boundary="===============6160538356636075282=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] TCTI initialization fails with error 0xc000b
Date: Thu, 22 Feb 2018 21:38:34 +0100
Message-ID: <dcb9860d-3083-7712-151b-39096b5b0f39@redhat.com>
In-Reply-To: 207C810BE4BA2440832668E0F208BFD3AF6398@ORSMSX108.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6160538356636075282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On 02/22/2018 06:17 PM, Anderson, Daniel wrote:
> Javier,
> Thanks for your reply--it is really useful as there are multiple undocume=
nted options I need to use.  I am using MS Outlook which is lame for inline=
 replies,  so I'll manually mark it with "dan> "
> =


No worries.

> Dan
> =

> -----Original Message-----
> From: Javier Martinez Canillas [mailto:javierm(a)redhat.com] =

> Sent: Thursday, February 22, 2018 8:52 AM
> To: Anderson, Daniel <daniel.anderson(a)intel.com>; tpm2(a)lists.01.org
> Subject: Re: [tpm2] TCTI initialization fails with error 0xc000b
> =

> Hello Dan,
> =

> On 02/22/2018 05:01 PM, Anderson, Daniel wrote:
>> Javier,
>> Thanks!
>>
>> The version is the latest source as of the message--I pulled the latest =
source and rebuilt several times.
> =

> Ok, I'm also building today's master branch for all projects.
> =

>> I will try again today and see if there has been a fix in the past week.
>> There is no /dev/tpm--I am using the simulator and specify that in the o=
ptions.
> =

> I didn't see the option specified in the command you shared in this threa=
d.
> You have to run with tpm2-abrmd --tcti socket.
> =

> dan> OK. That may be the missing option.  The "tpm2-abrmd --tcti socket" =
option is not mentioned anywhere in dan> the INSTALL.md or README.md files.=
  =

> dan> I found a tpm2-abrmd man page with several examples, but it doesn't =
mention which one to use for the dan> simulator.
> =


Yeah, the master branches are a moving target and sometimes the docs fall b=
ehind.
I didn't pay attention to the project for a couple of weeks and I also need=
ed to
catch up since all the TCTI options handling changed :)

> dan> Also, since tpm2-abrmd is started automatically by systemd, apparent=
ly, how does one add this option dan> (whatever the correct syntax) to the =
system configuration?
>

Well, by adding the option to the command set in the ExecStart in the syste=
md
tpm2-abrmd.service unit file. The default is to use the device TCTI, which =
is
reasonable because that what most users will do. The socket TCTI is only us=
ed
for development purposes or to test if you don't have a real TPM2 device.

> =

>> There may be another option or setting that I am missing though.
>> Here is what I build with:
>>
>> For tpm2-tss:
>> configure --enable-unit
>>         --with-simulatorbin=3D$TPM_SERVER
> =

> Only these are valid options for tpm2-tss, from here are tpm2-abrmd optio=
ns:
> =

>>         --with-dbuspolicydir=3D/etc/dbus-1/system.d
>>         --with-systemdsystemunitdir=3D/lib/systemd/system
>>         --with-systemdpresetdir=3D/lib/systemd/system-preset
>>         --with-udevrulesdir=3D/etc/udev/rules.d
>>         --with-sysdefaultdir=3D/etc/default
>>         --with-dbusdatadir=3D/usr/share/dbus-1/system-services
>>
>> For tpm2-abrmd:
>> configure --enable-unit =

>> --with-simulatorbin=3D$HOME/tpm/simulator/src/tpm_server
>>
> =

> As mentioned, you either got the configure options mixed up or are using =
it wrong.
> =

> There are my configure options for tpm2-tss, tpm2-abrmd and tpm2-tools:
> =

> tpm2-tss:
> =

> $ ./configure --prefix=3D/usr
> =

> tpm2-abrmd:
> =

> $ ./configure --with-dbuspolicydir=3D/etc/dbus-1/system.d --with-udevrule=
sdir=3D/usr/lib/udev/rules.d --with-systemdsystemunitdir=3D/usr/lib/systemd=
/system --libdir=3D/usr/lib64
> =

> dan> This is useful. The systemdsystemunitdir (not mentioned in the READM=
E or INSTALL) should help.
>

Right, ./configure --help list them though.

> tpm2-tools
> =

> $ ./configure --prefix=3D/usr
> =

>> I cannot believe that anyone has tpm2-abrmd working without special hand=
-copied fixes. The com.intel.tss2.tabrmd.service for example is not install=
ed in /usr/share/dbus-1/system-services/ but in /usr/local/share/dbus-1/sys=
tem-services/.
>>
> =

> I think this is because you didn't specify a correct --with-dbuspolicydir=
 as mentioned before. Another thing that you have to keep in mind, is that =
the default D-Bus config only allows the tss and root user to acquire the c=
om.intel.tss2.Tabrmd D-Bus well-known name.
> =

> So after installing latest master with these configure options, I just do:
> =

> $ ./tpm_server
> =

> $ sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti socket
> =

> dan> so you do not use system to start tpm2-abrmd.
>

No, in fact I don't use the tpm2-abrmd at all but instead use the resource
manager that's in the kernel exposed as /dev/tpmrm0. So I just use the dev
TCTI directly from the tpm2-tools.

> $ tpm2_pcrlist -L sha1:0 -T abrmd                           =

> sha1:                      =

>   0 : 0x0000000000000000000000000000000000000003
> =

> And using the device TCTI also works for me:
> =

> $ sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti device
> =

> dan> neither tpm2-abrmd --tcti socket or tpm2-abrmd --tcti device is ment=
ioned in the README.md, INSTALL.md, or tpm2-abrmd(8) man page, so I'll add =
those.
>

I see, that should be fixed then.

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============6160538356636075282==--

