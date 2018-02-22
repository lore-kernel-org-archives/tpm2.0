Content-Type: multipart/mixed; boundary="===============1549491433959125210=="
MIME-Version: 1.0
From: Anderson, Daniel <daniel.anderson at intel.com>
Subject: Re: [tpm2] TCTI initialization fails with error 0xc000b
Date: Thu, 22 Feb 2018 16:01:10 +0000
Message-ID: <207C810BE4BA2440832668E0F208BFD3AF6317@ORSMSX108.amr.corp.intel.com>
In-Reply-To: b8c21126-da70-cf9c-ee01-ac0271418602@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1549491433959125210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Javier,
Thanks!

The version is the latest source as of the message--I pulled the latest sou=
rce and rebuilt several times.
I will try again today and see if there has been a fix in the past week.
There is no /dev/tpm--I am using the simulator and specify that in the opti=
ons.
There may be another option or setting that I am missing though.
Here is what I build with:

For tpm2-tss:
configure --enable-unit
        --with-simulatorbin=3D$TPM_SERVER
        --with-dbuspolicydir=3D/etc/dbus-1/system.d
        --with-systemdsystemunitdir=3D/lib/systemd/system
        --with-systemdpresetdir=3D/lib/systemd/system-preset
        --with-udevrulesdir=3D/etc/udev/rules.d
        --with-sysdefaultdir=3D/etc/default
        --with-dbusdatadir=3D/usr/share/dbus-1/system-services

For tpm2-abrmd:
configure --enable-unit --with-simulatorbin=3D$HOME/tpm/simulator/src/tpm_s=
erver

I cannot believe that anyone has tpm2-abrmd working without special hand-co=
pied fixes. The com.intel.tss2.tabrmd.service for example is not installed =
in /usr/share/dbus-1/system-services/ but in /usr/local/share/dbus-1/system=
-services/.

(no options for configuring tpm2-tools)

Dan

-----Original Message-----
From: Javier Martinez Canillas [mailto:javierm(a)redhat.com] =

Sent: Thursday, February 22, 2018 12:49 AM
To: Anderson, Daniel <daniel.anderson(a)intel.com>; tpm2(a)lists.01.org
Subject: Re: [tpm2] TCTI initialization fails with error 0xc000b

Hello Dan,

On 02/20/2018 08:40 PM, Anderson, Daniel wrote:
> I have been getting the same error and cannot start the tpm2-service:
> =

> $ sudo systemctl start tpm2-abrmd.service Job for tpm2-abrmd.service =

> failed because the control process exited with error code. See "systemctl=
 status tpm2-abrmd.service" and "journalctl -xe" for details.
> =

> $ systemctl status tpm2-abrmd.service
> tpm2-abrmd.service: Main process exited, code=3Dexited, status=3D1/FA =

> Failed to start TPM2 Access Broker and Resource Management Daemon Unit =

> entered failed state.
> Failed with result 'exit-code'.
> =

> # Start manually:
> $ /usr/local/sbin/tpm2-abrmd&
> ** (tpm2-abrmd:1596): WARNING **: failed to initialize device TCTI =

> context: 0xa000a
> ** (tpm2-abrmd:1596): CRITICAL **: TCTI Initializaiton: 0xa000a
> =

> $ tpm2_rc_decode 0xa000a
> tcti:IO failure
> =


What versions of the tpm2-tss, tools and abrmd are you using? I'll try to r=
eproduce the issue. But yes, the problem seems to be that it's defaulting t=
o the device TCTI instead of the socket TCTI. And since you don't have a /d=
ev/tpm? (or your user doesn't have access to it), the tpm2-abrmd dies.

> So it seems that this is a known bug:
> https://github.com/tpm2-software/tpm2-abrmd/issues/321
> https://github.com/tpm2-software/tpm2-abrmd/pull/330
>
> Is there a workaround?  The discussion is too cryptic for me. For example=
,  I can't find a tpm2_listpcrs command in  tpm2-tools (or -abrmd or -tss).=
 I am running on Ubuntu Linux with a simulator.
>

PR #300 has been merged already so if you think that's related, it may be w=
orth to give a try to master. I still didn't have time to catch up on all t=
he TCTI dynamic loading changes so I can't say if #330 is related to this i=
ssue or not.

> Dan

Best regards,
--
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement Red Hat

--===============1549491433959125210==--

