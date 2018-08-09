Content-Type: multipart/mixed; boundary="===============7112338781044864252=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] Cannot get tabrmd to run
Date: Thu, 09 Aug 2018 09:20:21 -0700
Message-ID: <20180809162021.GA14957@intel.com>
In-Reply-To: SL2P216MB02669BC3C3E4341C67FC5F6DC2250@SL2P216MB0266.KORP216.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7112338781044864252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Martin,

If you have tcsd running on this system it's likely that your TPM is a
version 1.2 device. The daemon (or maybe the device TCTI?) can and
should handle this case more gracefully. Just created a ticket here:
https://github.com/tpm2-software/tpm2-abrmd/issues/512

Also for future reference the library used by the tabrmd for
communicating with the device driver has a logging mechanism that can be
enabled through the environment. I just spent a few minutes digging
through github and it looks like this variable isn't documented anywhere
(not a great look for us). We've now got an issue tracking this as well:
https://github.com/tpm2-software/tpm2-tss/issues/1122

Thanks for the useful data,
Philip

On Thu, Aug 09, 2018 at 12:36:06AM +0000, martin doc wrote:
> Newbie shoes on here.
> =

> =

> It would seem that this problem is due to TPM2 support not being in my ke=
rnel (3.10.0-862.9.1.el7.x86_64).
> =

> =

> Apologies for the disruption.
> =

> =

> =

> ________________________________
> From: tpm2 <tpm2-bounces(a)lists.01.org> on behalf of martin doc <db1280(=
a)hotmail.com>
> Sent: Thursday, 9 August 2018 9:20:16 AM
> To: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Cannot get tabrmd to run
> =

> =

> So it seems that tpm2-abrmd cannot run concurrently with tcsd.
> =

> =

> The reason for this is that open on /dev/tpm0 by tpm2-abrmd returns EBUSY=
 if tcsd is running and prints out this error:
> =

> =

> /usr/sbin/tpm2-abrmd
> =

> ** (tpm2-abrmd:35363): WARNING **: failed to initialize device TCTI conte=
xt: 0xa000a
> =

> ** (tpm2-abrmd:35363): CRITICAL **: TCTI initialization failed: 0xa000a
> =

> =

> This is the error that is hidden:
> =

> [pid 35389] open("/dev/tpm0", O_RDWR)   =3D -1 EBUSY (Device or resource =
busy)
> =

> =

> Now if I stop tcsd and try to start tpm2-abrmd, I still get an error:
> =

> =

> /usr/sbin/tpm2-abrmd
> =

> ** (tpm2-abrmd:35425): WARNING **: Tss2_Sys_Startup returned unexpected R=
C: 0xa
> =

> ** (tpm2-abrmd:35425): ERROR **: access_broker_sent_tpm_startup failed: 0=
xa
> =

> =

> ________________________________
> From: tpm2 <tpm2-bounces(a)lists.01.org> on behalf of martin doc <db1280(=
a)hotmail.com>
> Sent: Wednesday, 8 August 2018 5:28:11 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Cannot get tabrmd to run
> =

> =

> Hi,
> I'm bring up TPM on a system for the first time and have run into a bit o=
f a problem - tabrmd won't start.
> =E2=80=A8
> Part of this appears to be due to it not being present in dbus, e.g.:
> =E2=80=A8
> # dbus-send --system --dest=3Dcom.intel.tss2.Tabrmd --type=3Dmethod_call =
--print-reply /com/intel/tss2/Tabrmd/Tcti org.freedesktop.DBus.Introspectab=
le.Introspect
> Error org.freedesktop.DBus.Error.ServiceUnknown: The name com.intel.tss2.=
Tabrmd was not provided by any .service files
> =

> =

> I don't know how to fix this. The service has been enabled in systemd:
> =

> # systemctl status tpm2-abrmd
> =E2=97=8F tpm2-abrmd.service - TPM2 Access Broker and Resource Management=
 Daemon
>    Loaded: loaded (/usr/lib/systemd/system/tpm2-abrmd.service; enabled; v=
endor preset: disabled)
>    Active: activating (auto-restart) (Result: exit-code) since Wed 2018-0=
8-08 17:19:54 AEST; 4s ago
>   Process: 6350 ExecStart=3D/usr/sbin/tpm2-abrmd (code=3Dexited, status=
=3D1/FAILURE)
>  Main PID: 6350 (code=3Dexited, status=3D1/FAILURE)
> =

> Aug 08 17:19:54 dhcp-1-252 systemd[1]: Failed to start TPM2 Access Broker=
 and Resource Management Daemon.
> Aug 08 17:19:54 dhcp-1-252 systemd[1]: Unit tpm2-abrmd.service entered fa=
iled state.
> Aug 08 17:19:54 dhcp-1-252 systemd[1]: tpm2-abrmd.service failed.
> =

> I've tried pkill -HUP dbus-daemon and systemctl daemon-reload. No change.
> =

> Aug 08 17:23:43 dhcp-1-252 systemd[1]: Reloading.
> Aug 08 17:23:43 dhcp-1-252 polkitd[1217]: Unregistered Authentication Age=
nt for unix-process:6658:671434 (system bus name :1.93, object path /org/fr=
eedesktop/PolicyKit1/AuthenticationAgent, locale en_AU.UTF-8) (disconnected=
 from bus)
> Aug 08 17:23:54 dhcp-1-252 polkitd[1217]: Registered Authentication Agent=
 for unix-process:6676:672475 (system bus name :1.94 [/usr/bin/pkttyagent -=
-notify-fd 5 --fallback], object path /org/freedesktop/PolicyKit1/Authentic=
ationAgent, locale en_AU.UTF-8)
> Aug 08 17:23:54 dhcp-1-252 systemd[1]: Starting TPM2 Access Broker and Re=
source Management Daemon...
> -- Subject: Unit tpm2-abrmd.service has begun start-up
> -- Defined-By: systemd
> -- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
> --
> -- Unit tpm2-abrmd.service has begun starting up.
> Aug 08 17:23:54 dhcp-1-252 tpm2-abrmd[6682]: failed to initialize device =
TCTI context: 0xa000a
> Aug 08 17:23:54 dhcp-1-252 tpm2-abrmd[6682]: TCTI initialization failed: =
0xa000a
> Aug 08 17:23:54 dhcp-1-252 systemd[1]: tpm2-abrmd.service: main process e=
xited, code=3Dexited, status=3D1/FAILURE
> Aug 08 17:23:54 dhcp-1-252 systemd[1]: Failed to start TPM2 Access Broker=
 and Resource Management Daemon.
> -- Subject: Unit tpm2-abrmd.service has failed
> -- Defined-By: systemd
> -- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
> --
> -- Unit tpm2-abrmd.service has failed.
> --
> -- The result is failed.
> Aug 08 17:23:54 dhcp-1-252 systemd[1]: Unit tpm2-abrmd.service entered fa=
iled state.
> Aug 08 17:23:54 dhcp-1-252 systemd[1]: tpm2-abrmd.service failed.
> Aug 08 17:23:54 dhcp-1-252 polkitd[1217]: Unregistered Authentication Age=
nt for unix-process:6676:672475 (system bus name :1.94, object path /org/fr=
eedesktop/PolicyKit1/AuthenticationAgent, locale en_AU.UTF-8) (disconnected=
 from bus)
> [root(a)dhcp-1-252 ~]# !dbus
> dbus-send --system --dest=3Dcom.intel.tss2.Tabrmd --type=3Dmethod_call --=
print-reply /com/intel/tss2/Tabrmd/Tcti org.freedesktop.DBus.Introspectable=
.Introspect
> Error org.freedesktop.DBus.Error.ServiceUnknown: The name com.intel.tss2.=
Tabrmd was not provided by any .service files
> [root(a)dhcp-1-252 ~]#  rpm -q -a | grep tpm2
> tpm2-tss-devel-1.3.0-2.el7.x86_64
> tpm2-tss-1.3.0-2.el7.x86_64
> tpm2-abrmd-1.1.0-8.el7.x86_64
> =


> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2


--===============7112338781044864252==--

