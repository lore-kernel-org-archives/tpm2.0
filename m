Content-Type: multipart/mixed; boundary="===============1165415230179390173=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] how to gracefuly stop tpm2-abrmd daemon
Date: Tue, 15 Dec 2020 23:09:31 +0000
Message-ID: <20201215230931.4749.8812@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1165415230179390173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Can I know how to gracefully stop tpm2-abrmd daemon or force to stop it?
From the log below, I see the deamon was not able to be stopped and auto re=
started.


[root(a)hostname-1 ~]# service tpm2-abrmd stop
Redirecting to /bin/systemctl stop tpm2-abrmd.service
(It takes about 3-5 minutes and returns back to console)

[root(a)hostname-1 ~]# service tpm2-abrmd status
=E2=97=8F tpm2-abrmd.service - TPM2 Access Broker and Resource Management D=
aemon
     Loaded: loaded (/usr/lib/systemd/system/tpm2-abrmd.service; enabled; v=
endor preset: disabled)
     Active: active (running) since Tue 2020-12-15 15:02:49 PST; 1min 36s a=
go
   Main PID: 3389167 (tpm2-abrmd)
         IO: 0B read, 0B written
      Tasks: 4
     Memory: 1.5M
        CPU: 16ms
     CGroup: /system.slice/tpm2-abrmd.service
             =E2=94=94=E2=94=803389167 /usr/sbin/tpm2-abrmd
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: ipc_frontend_connect
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: tcti_set_property
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: Allocating 0x1050 bytes for=
 SAPI context
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: tpm2_set_property
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: tpm2_set_property
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: tpm2_init_tpm
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: Got proxy object for DBus d=
aemon.
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: on_bus_acquired: com.intel.=
tss2.Tabrmd
Dec 15 15:02:49 hostname-1 systemd[1]: Started TPM2 Access Broker and Resou=
rce Management Daemon
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: on_name_acquired: com.intel=
.tss2.Tabrmd
~



[root(a)hostname-1~]# journalctl -u tpm2-abrmd -e
-- Logs begin at Tue 2020-12-15 15:00:03 PST, end at Tue 2020-12-15 15:03:2=
4 PST. --
Dec 15 15:01:15 hostname-1 systemd[1]: Stopping TPM2 Access Broker and Reso=
urce Management Daemon...
Dec 15 15:02:45 hostname-1 systemd[1]: tpm2-abrmd.service: State 'stop-sigt=
erm' timed out. Killing.
Dec 15 15:02:45 hostname-1 systemd[1]: tpm2-abrmd.service: Killing process =
3370307 (tpm2-abrmd) with signal SIGKILL.
Dec 15 15:02:45 hostname-1 systemd[1]: tpm2-abrmd.service: Killing process =
3370308 (tpm2-abrmd) with signal SIGKILL.
Dec 15 15:02:45 hostname-1 systemd[1]: tpm2-abrmd.service: Killing process =
3370309 (gmain) with signal SIGKILL.
Dec 15 15:02:45 hostname-1 systemd[1]: tpm2-abrmd.service: Killing process =
3370311 (gdbus) with signal SIGKILL.
Dec 15 15:02:45 hostname-1 systemd[1]: tpm2-abrmd.service: Main process exi=
ted, code=3Dkilled, status=3D9/KILL
Dec 15 15:02:45 hostname-1 systemd[1]: tpm2-abrmd.service: Failed with resu=
lt 'timeout'.
Dec 15 15:02:45 hostname-1 systemd[1]: Stopped TPM2 Access Broker and Resou=
rce Management Daemon.
Dec 15 15:02:49 hostname-1 systemd[1]: Starting TPM2 Access Broker and Reso=
urce Management Daemon...   <=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94 =
tpm2-abrmd auto restarted here
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: tabrmd startup
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: tcti_conf before: "device:/=
dev/tpm0"
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: logging to stdout
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: tcti_conf after: "device:/d=
ev/tpm0"
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: entering g_main_loop
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: init_thread_func start
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: random_class_init
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: opening entropy source: /de=
v/urandom
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: reading from entropy source=
: /dev/urandom
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: connection_manager_set_prop=
erty
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]:   max_connections: 27
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: IpcFrontendDbus set bus_nam=
e: com.intel.tss2.Tabrmd
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: ipc_frontend_connect
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: tcti_set_property
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: Allocating 0x1050 bytes for=
 SAPI context
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: tpm2_set_property
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: tpm2_set_property
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: tpm2_init_tpm
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: Got proxy object for DBus d=
aemon.
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: on_bus_acquired: com.intel.=
tss2.Tabrmd
Dec 15 15:02:49 hostname-1 systemd[1]: Started TPM2 Access Broker and Resou=
rce Management Daemon.
Dec 15 15:02:49 hostname-1 tpm2-abrmd[3389167]: on_name_acquired: com.intel=
.tss2.Tabrmd




[root(a)hostname-1~]# rpm -qa | grep tpm2
tpm2-tss-2.4.3.x86_64
tpm2-tools-4.3.0.x86_64
tpm2-abrmd-2.3.3.x86_64

[root(a)hostname-1 ~]# cat /etc/os-release
NAME=3D"CentOS Linux"
VERSION=3D"8 (Core)"
ID=3D"centos"
ID_LIKE=3D"rhel fedora"
VERSION_ID=3D"8"
... ...
--===============1165415230179390173==--

