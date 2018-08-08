Content-Type: multipart/mixed; boundary="===============1943243615747508341=="
MIME-Version: 1.0
From: martin doc <db1280 at hotmail.com>
Subject: Re: [tpm2] Cannot get tabrmd to run
Date: Wed, 08 Aug 2018 23:20:16 +0000
Message-ID: <SL2P216MB0266C39140905C27866BDE92C2260@SL2P216MB0266.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: SL2P216MB0266B495F6A0F43DCB568AD0C2260@SL2P216MB0266.KORP216.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1943243615747508341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So it seems that tpm2-abrmd cannot run concurrently with tcsd.


The reason for this is that open on /dev/tpm0 by tpm2-abrmd returns EBUSY i=
f tcsd is running and prints out this error:


/usr/sbin/tpm2-abrmd

** (tpm2-abrmd:35363): WARNING **: failed to initialize device TCTI context=
: 0xa000a

** (tpm2-abrmd:35363): CRITICAL **: TCTI initialization failed: 0xa000a


This is the error that is hidden:

[pid 35389] open("/dev/tpm0", O_RDWR)   =3D -1 EBUSY (Device or resource bu=
sy)


Now if I stop tcsd and try to start tpm2-abrmd, I still get an error:


/usr/sbin/tpm2-abrmd

** (tpm2-abrmd:35425): WARNING **: Tss2_Sys_Startup returned unexpected RC:=
 0xa

** (tpm2-abrmd:35425): ERROR **: access_broker_sent_tpm_startup failed: 0xa


________________________________
From: tpm2 <tpm2-bounces(a)lists.01.org> on behalf of martin doc <db1280(a)=
hotmail.com>
Sent: Wednesday, 8 August 2018 5:28:11 PM
To: tpm2(a)lists.01.org
Subject: [tpm2] Cannot get tabrmd to run


Hi,
I'm bring up TPM on a system for the first time and have run into a bit of =
a problem - tabrmd won't start.
=E2=80=A8
Part of this appears to be due to it not being present in dbus, e.g.:
=E2=80=A8
# dbus-send --system --dest=3Dcom.intel.tss2.Tabrmd --type=3Dmethod_call --=
print-reply /com/intel/tss2/Tabrmd/Tcti org.freedesktop.DBus.Introspectable=
.Introspect
Error org.freedesktop.DBus.Error.ServiceUnknown: The name com.intel.tss2.Ta=
brmd was not provided by any .service files


I don't know how to fix this. The service has been enabled in systemd:

# systemctl status tpm2-abrmd
=E2=97=8F tpm2-abrmd.service - TPM2 Access Broker and Resource Management D=
aemon
   Loaded: loaded (/usr/lib/systemd/system/tpm2-abrmd.service; enabled; ven=
dor preset: disabled)
   Active: activating (auto-restart) (Result: exit-code) since Wed 2018-08-=
08 17:19:54 AEST; 4s ago
  Process: 6350 ExecStart=3D/usr/sbin/tpm2-abrmd (code=3Dexited, status=3D1=
/FAILURE)
 Main PID: 6350 (code=3Dexited, status=3D1/FAILURE)

Aug 08 17:19:54 dhcp-1-252 systemd[1]: Failed to start TPM2 Access Broker a=
nd Resource Management Daemon.
Aug 08 17:19:54 dhcp-1-252 systemd[1]: Unit tpm2-abrmd.service entered fail=
ed state.
Aug 08 17:19:54 dhcp-1-252 systemd[1]: tpm2-abrmd.service failed.

I've tried pkill -HUP dbus-daemon and systemctl daemon-reload. No change.

Aug 08 17:23:43 dhcp-1-252 systemd[1]: Reloading.
Aug 08 17:23:43 dhcp-1-252 polkitd[1217]: Unregistered Authentication Agent=
 for unix-process:6658:671434 (system bus name :1.93, object path /org/free=
desktop/PolicyKit1/AuthenticationAgent, locale en_AU.UTF-8) (disconnected f=
rom bus)
Aug 08 17:23:54 dhcp-1-252 polkitd[1217]: Registered Authentication Agent f=
or unix-process:6676:672475 (system bus name :1.94 [/usr/bin/pkttyagent --n=
otify-fd 5 --fallback], object path /org/freedesktop/PolicyKit1/Authenticat=
ionAgent, locale en_AU.UTF-8)
Aug 08 17:23:54 dhcp-1-252 systemd[1]: Starting TPM2 Access Broker and Reso=
urce Management Daemon...
-- Subject: Unit tpm2-abrmd.service has begun start-up
-- Defined-By: systemd
-- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
--
-- Unit tpm2-abrmd.service has begun starting up.
Aug 08 17:23:54 dhcp-1-252 tpm2-abrmd[6682]: failed to initialize device TC=
TI context: 0xa000a
Aug 08 17:23:54 dhcp-1-252 tpm2-abrmd[6682]: TCTI initialization failed: 0x=
a000a
Aug 08 17:23:54 dhcp-1-252 systemd[1]: tpm2-abrmd.service: main process exi=
ted, code=3Dexited, status=3D1/FAILURE
Aug 08 17:23:54 dhcp-1-252 systemd[1]: Failed to start TPM2 Access Broker a=
nd Resource Management Daemon.
-- Subject: Unit tpm2-abrmd.service has failed
-- Defined-By: systemd
-- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
--
-- Unit tpm2-abrmd.service has failed.
--
-- The result is failed.
Aug 08 17:23:54 dhcp-1-252 systemd[1]: Unit tpm2-abrmd.service entered fail=
ed state.
Aug 08 17:23:54 dhcp-1-252 systemd[1]: tpm2-abrmd.service failed.
Aug 08 17:23:54 dhcp-1-252 polkitd[1217]: Unregistered Authentication Agent=
 for unix-process:6676:672475 (system bus name :1.94, object path /org/free=
desktop/PolicyKit1/AuthenticationAgent, locale en_AU.UTF-8) (disconnected f=
rom bus)
[root(a)dhcp-1-252 ~]# !dbus
dbus-send --system --dest=3Dcom.intel.tss2.Tabrmd --type=3Dmethod_call --pr=
int-reply /com/intel/tss2/Tabrmd/Tcti org.freedesktop.DBus.Introspectable.I=
ntrospect
Error org.freedesktop.DBus.Error.ServiceUnknown: The name com.intel.tss2.Ta=
brmd was not provided by any .service files
[root(a)dhcp-1-252 ~]#  rpm -q -a | grep tpm2
tpm2-tss-devel-1.3.0-2.el7.x86_64
tpm2-tss-1.3.0-2.el7.x86_64
tpm2-abrmd-1.1.0-8.el7.x86_64


--===============1943243615747508341==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPjwhLS0gUCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9IC0t
Pjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBkaXI9Imx0ciI+DQo8ZGl2IGlkPSJkaXZ0YWdkZWZh
dWx0d3JhcHBlciIgc3R5bGU9ImZvbnQtc2l6ZToxMnB0O2NvbG9yOiMwMDAwMDA7Zm9udC1mYW1p
bHk6Q2FsaWJyaSxIZWx2ZXRpY2Esc2Fucy1zZXJpZjsiIGRpcj0ibHRyIj4NCjxwIHN0eWxlPSJt
YXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowIj5TbyBpdCBzZWVtcyB0aGF0IHRwbTItYWJybWQg
Y2Fubm90IHJ1biBjb25jdXJyZW50bHkgd2l0aCB0Y3NkLjwvcD4NCjxwIHN0eWxlPSJtYXJnaW4t
dG9wOjA7bWFyZ2luLWJvdHRvbTowIj48YnI+DQo8L3A+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDow
O21hcmdpbi1ib3R0b206MCI+VGhlIHJlYXNvbiBmb3IgdGhpcyBpcyB0aGF0IG9wZW4gb24gL2Rl
di90cG0wIGJ5IHRwbTItYWJybWQgcmV0dXJucyBFQlVTWSBpZiB0Y3NkIGlzIHJ1bm5pbmcgYW5k
IHByaW50cyBvdXQgdGhpcyBlcnJvcjo8L3A+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDowO21hcmdp
bi1ib3R0b206MCI+PGJyPg0KPC9wPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6MDttYXJnaW4tYm90
dG9tOjAiPjwvcD4NCjxkaXY+L3Vzci9zYmluL3RwbTItYWJybWQ8L2Rpdj4NCjxkaXY+PGJyPg0K
PC9kaXY+DQo8ZGl2PioqICh0cG0yLWFicm1kOjM1MzYzKTogV0FSTklORyAqKjogZmFpbGVkIHRv
IGluaXRpYWxpemUgZGV2aWNlIFRDVEkgY29udGV4dDogMHhhMDAwYTwvZGl2Pg0KPGRpdj48YnI+
DQo8L2Rpdj4NCjxkaXY+KiogKHRwbTItYWJybWQ6MzUzNjMpOiBDUklUSUNBTCAqKjogVENUSSBp
bml0aWFsaXphdGlvbiBmYWlsZWQ6IDB4YTAwMGE8L2Rpdj4NCjxicj4NCjxwPjwvcD4NCjxwIHN0
eWxlPSJtYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowIj5UaGlzIGlzIHRoZSBlcnJvciB0aGF0
IGlzIGhpZGRlbjo8L3A+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MCI+
PHNwYW4+W3BpZCAzNTM4OV0gb3BlbigmcXVvdDsvZGV2L3RwbTAmcXVvdDssIE9fUkRXUikmbmJz
cDsgJm5ic3A7PSAtMSBFQlVTWSAoRGV2aWNlIG9yIHJlc291cmNlIGJ1c3kpPC9zcGFuPjxicj4N
CjwvcD4NCjxwIHN0eWxlPSJtYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowIj48c3Bhbj48YnI+
DQo8L3NwYW4+PC9wPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjAiPjxz
cGFuPk5vdyBpZiBJIHN0b3AgdGNzZCBhbmQgdHJ5IHRvIHN0YXJ0IHRwbTItYWJybWQsIEkgc3Rp
bGwgZ2V0IGFuIGVycm9yOjwvc3Bhbj48L3A+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDowO21hcmdp
bi1ib3R0b206MCI+PHNwYW4+PGJyPg0KPC9zcGFuPjwvcD4NCjxwIHN0eWxlPSJtYXJnaW4tdG9w
OjA7bWFyZ2luLWJvdHRvbTowIj48c3Bhbj48L3A+DQo8ZGl2Pi91c3Ivc2Jpbi90cG0yLWFicm1k
PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj4qKiAodHBtMi1hYnJtZDozNTQyNSk6IFdB
Uk5JTkcgKio6IFRzczJfU3lzX1N0YXJ0dXAgcmV0dXJuZWQgdW5leHBlY3RlZCBSQzogMHhhPC9k
aXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj4qKiAodHBtMi1hYnJtZDozNTQyNSk6IEVSUk9S
ICoqOiBhY2Nlc3NfYnJva2VyX3NlbnRfdHBtX3N0YXJ0dXAgZmFpbGVkOiAweGE8L2Rpdj4NCjxi
cj4NCjwvc3Bhbj4NCjxwPjwvcD4NCjwvZGl2Pg0KPGhyIHN0eWxlPSJkaXNwbGF5OmlubGluZS1i
bG9jazt3aWR0aDo5OCUiIHRhYmluZGV4PSItMSI+DQo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBk
aXI9Imx0ciI+PGZvbnQgZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6
ZToxMXB0IiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IHRwbTIgJmx0O3RwbTItYm91bmNl
c0BsaXN0cy4wMS5vcmcmZ3Q7IG9uIGJlaGFsZiBvZiBtYXJ0aW4gZG9jICZsdDtkYjEyODBAaG90
bWFpbC5jb20mZ3Q7PGJyPg0KPGI+U2VudDo8L2I+IFdlZG5lc2RheSwgOCBBdWd1c3QgMjAxOCA1
OjI4OjExIFBNPGJyPg0KPGI+VG86PC9iPiB0cG0yQGxpc3RzLjAxLm9yZzxicj4NCjxiPlN1Ympl
Y3Q6PC9iPiBbdHBtMl0gQ2Fubm90IGdldCB0YWJybWQgdG8gcnVuPC9mb250Pg0KPGRpdj4mbmJz
cDs8L2Rpdj4NCjwvZGl2Pg0KPG1ldGEgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04
Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9ImRpc3BsYXk6bm9uZSI+DQo8IS0tDQpw
DQoJe21hcmdpbi10b3A6MDsNCgltYXJnaW4tYm90dG9tOjB9DQotLT4NCjwvc3R5bGU+DQo8ZGl2
IGRpcj0ibHRyIj4NCjxkaXYgaWQ9InhfZGl2dGFnZGVmYXVsdHdyYXBwZXIiIGRpcj0ibHRyIiBz
dHlsZT0iZm9udC1zaXplOjEycHQ7IGNvbG9yOiMwMDAwMDA7IGZvbnQtZmFtaWx5OkNhbGlicmks
SGVsdmV0aWNhLHNhbnMtc2VyaWYiPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6MDsgbWFyZ2luLWJv
dHRvbTowIj48L3A+DQo8ZGl2PkhpLDwvZGl2Pg0KPGRpdj5JJ20gYnJpbmcgdXAgVFBNIG9uIGEg
c3lzdGVtIGZvciB0aGUgZmlyc3QgdGltZSBhbmQgaGF2ZSBydW4gaW50byBhIGJpdCBvZiBhIHBy
b2JsZW0gLSB0YWJybWQgd29uJ3Qgc3RhcnQuPC9kaXY+DQo8ZGl2PuKAqDwvZGl2Pg0KPGRpdj5Q
YXJ0IG9mIHRoaXMgYXBwZWFycyB0byBiZSBkdWUgdG8gaXQgbm90IGJlaW5nIHByZXNlbnQgaW4g
ZGJ1cywgZS5nLjo8L2Rpdj4NCjxkaXY+4oCoPC9kaXY+DQo8ZGl2PiMgZGJ1cy1zZW5kIC0tc3lz
dGVtIC0tZGVzdD1jb20uaW50ZWwudHNzMi5UYWJybWQgLS10eXBlPW1ldGhvZF9jYWxsIC0tcHJp
bnQtcmVwbHkgL2NvbS9pbnRlbC90c3MyL1RhYnJtZC9UY3RpIG9yZy5mcmVlZGVza3RvcC5EQnVz
LkludHJvc3BlY3RhYmxlLkludHJvc3BlY3Q8L2Rpdj4NCjxkaXY+RXJyb3Igb3JnLmZyZWVkZXNr
dG9wLkRCdXMuRXJyb3IuU2VydmljZVVua25vd246IFRoZSBuYW1lIGNvbS5pbnRlbC50c3MyLlRh
YnJtZCB3YXMgbm90IHByb3ZpZGVkIGJ5IGFueSAuc2VydmljZSBmaWxlczwvZGl2Pg0KPGRpdj48
YnI+DQo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PkkgZG9uJ3Qga25vdyBob3cgdG8g
Zml4IHRoaXMuIFRoZSBzZXJ2aWNlIGhhcyBiZWVuIGVuYWJsZWQgaW4gc3lzdGVtZDo8L2Rpdj4N
CjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PiMgc3lzdGVtY3RsIHN0YXR1cyB0cG0yLWFicm1kPC9k
aXY+DQo8ZGl2PuKXjyB0cG0yLWFicm1kLnNlcnZpY2UgLSBUUE0yIEFjY2VzcyBCcm9rZXIgYW5k
IFJlc291cmNlIE1hbmFnZW1lbnQgRGFlbW9uPC9kaXY+DQo8ZGl2PiZuYnNwOyAmbmJzcDtMb2Fk
ZWQ6IGxvYWRlZCAoL3Vzci9saWIvc3lzdGVtZC9zeXN0ZW0vdHBtMi1hYnJtZC5zZXJ2aWNlOyBl
bmFibGVkOyB2ZW5kb3IgcHJlc2V0OiBkaXNhYmxlZCk8L2Rpdj4NCjxkaXY+Jm5ic3A7ICZuYnNw
O0FjdGl2ZTogYWN0aXZhdGluZyAoYXV0by1yZXN0YXJ0KSAoUmVzdWx0OiBleGl0LWNvZGUpIHNp
bmNlIFdlZCAyMDE4LTA4LTA4IDE3OjE5OjU0IEFFU1Q7IDRzIGFnbzwvZGl2Pg0KPGRpdj4mbmJz
cDsgUHJvY2VzczogNjM1MCBFeGVjU3RhcnQ9L3Vzci9zYmluL3RwbTItYWJybWQgKGNvZGU9ZXhp
dGVkLCBzdGF0dXM9MS9GQUlMVVJFKTwvZGl2Pg0KPGRpdj4mbmJzcDtNYWluIFBJRDogNjM1MCAo
Y29kZT1leGl0ZWQsIHN0YXR1cz0xL0ZBSUxVUkUpPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0K
PGRpdj5BdWcgMDggMTc6MTk6NTQgZGhjcC0xLTI1MiBzeXN0ZW1kWzFdOiBGYWlsZWQgdG8gc3Rh
cnQgVFBNMiBBY2Nlc3MgQnJva2VyIGFuZCBSZXNvdXJjZSBNYW5hZ2VtZW50IERhZW1vbi48L2Rp
dj4NCjxkaXY+QXVnIDA4IDE3OjE5OjU0IGRoY3AtMS0yNTIgc3lzdGVtZFsxXTogVW5pdCB0cG0y
LWFicm1kLnNlcnZpY2UgZW50ZXJlZCBmYWlsZWQgc3RhdGUuPC9kaXY+DQo8ZGl2PkF1ZyAwOCAx
NzoxOTo1NCBkaGNwLTEtMjUyIHN5c3RlbWRbMV06IHRwbTItYWJybWQuc2VydmljZSBmYWlsZWQu
PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5JJ3ZlIHRyaWVkIHBraWxsIC1IVVAgZGJ1
cy1kYWVtb24gYW5kIHN5c3RlbWN0bCBkYWVtb24tcmVsb2FkLiBObyBjaGFuZ2UuPC9kaXY+DQo8
ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5BdWcgMDggMTc6MjM6NDMgZGhjcC0xLTI1MiBzeXN0ZW1k
WzFdOiBSZWxvYWRpbmcuPC9kaXY+DQo8ZGl2PkF1ZyAwOCAxNzoyMzo0MyBkaGNwLTEtMjUyIHBv
bGtpdGRbMTIxN106IFVucmVnaXN0ZXJlZCBBdXRoZW50aWNhdGlvbiBBZ2VudCBmb3IgdW5peC1w
cm9jZXNzOjY2NTg6NjcxNDM0IChzeXN0ZW0gYnVzIG5hbWUgOjEuOTMsIG9iamVjdCBwYXRoIC9v
cmcvZnJlZWRlc2t0b3AvUG9saWN5S2l0MS9BdXRoZW50aWNhdGlvbkFnZW50LCBsb2NhbGUgZW5f
QVUuVVRGLTgpIChkaXNjb25uZWN0ZWQgZnJvbSBidXMpPC9kaXY+DQo8ZGl2PkF1ZyAwOCAxNzoy
Mzo1NCBkaGNwLTEtMjUyIHBvbGtpdGRbMTIxN106IFJlZ2lzdGVyZWQgQXV0aGVudGljYXRpb24g
QWdlbnQgZm9yIHVuaXgtcHJvY2Vzczo2Njc2OjY3MjQ3NSAoc3lzdGVtIGJ1cyBuYW1lIDoxLjk0
IFsvdXNyL2Jpbi9wa3R0eWFnZW50IC0tbm90aWZ5LWZkIDUgLS1mYWxsYmFja10sIG9iamVjdCBw
YXRoIC9vcmcvZnJlZWRlc2t0b3AvUG9saWN5S2l0MS9BdXRoZW50aWNhdGlvbkFnZW50LCBsb2Nh
bGUgZW5fQVUuVVRGLTgpPC9kaXY+DQo8ZGl2PkF1ZyAwOCAxNzoyMzo1NCBkaGNwLTEtMjUyIHN5
c3RlbWRbMV06IFN0YXJ0aW5nIFRQTTIgQWNjZXNzIEJyb2tlciBhbmQgUmVzb3VyY2UgTWFuYWdl
bWVudCBEYWVtb24uLi48L2Rpdj4NCjxkaXY+LS0gU3ViamVjdDogVW5pdCB0cG0yLWFicm1kLnNl
cnZpY2UgaGFzIGJlZ3VuIHN0YXJ0LXVwPC9kaXY+DQo8ZGl2Pi0tIERlZmluZWQtQnk6IHN5c3Rl
bWQ8L2Rpdj4NCjxkaXY+LS0gU3VwcG9ydDogaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3N5c3RlbWQtZGV2ZWw8L2Rpdj4NCjxkaXY+LS08L2Rpdj4NCjxkaXY+
LS0gVW5pdCB0cG0yLWFicm1kLnNlcnZpY2UgaGFzIGJlZ3VuIHN0YXJ0aW5nIHVwLjwvZGl2Pg0K
PGRpdj5BdWcgMDggMTc6MjM6NTQgZGhjcC0xLTI1MiB0cG0yLWFicm1kWzY2ODJdOiBmYWlsZWQg
dG8gaW5pdGlhbGl6ZSBkZXZpY2UgVENUSSBjb250ZXh0OiAweGEwMDBhPC9kaXY+DQo8ZGl2PkF1
ZyAwOCAxNzoyMzo1NCBkaGNwLTEtMjUyIHRwbTItYWJybWRbNjY4Ml06IFRDVEkgaW5pdGlhbGl6
YXRpb24gZmFpbGVkOiAweGEwMDBhPC9kaXY+DQo8ZGl2PkF1ZyAwOCAxNzoyMzo1NCBkaGNwLTEt
MjUyIHN5c3RlbWRbMV06IHRwbTItYWJybWQuc2VydmljZTogbWFpbiBwcm9jZXNzIGV4aXRlZCwg
Y29kZT1leGl0ZWQsIHN0YXR1cz0xL0ZBSUxVUkU8L2Rpdj4NCjxkaXY+QXVnIDA4IDE3OjIzOjU0
IGRoY3AtMS0yNTIgc3lzdGVtZFsxXTogRmFpbGVkIHRvIHN0YXJ0IFRQTTIgQWNjZXNzIEJyb2tl
ciBhbmQgUmVzb3VyY2UgTWFuYWdlbWVudCBEYWVtb24uPC9kaXY+DQo8ZGl2Pi0tIFN1YmplY3Q6
IFVuaXQgdHBtMi1hYnJtZC5zZXJ2aWNlIGhhcyBmYWlsZWQ8L2Rpdj4NCjxkaXY+LS0gRGVmaW5l
ZC1CeTogc3lzdGVtZDwvZGl2Pg0KPGRpdj4tLSBTdXBwb3J0OiBodHRwOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vc3lzdGVtZC1kZXZlbDwvZGl2Pg0KPGRpdj4tLTwv
ZGl2Pg0KPGRpdj4tLSBVbml0IHRwbTItYWJybWQuc2VydmljZSBoYXMgZmFpbGVkLjwvZGl2Pg0K
PGRpdj4tLTwvZGl2Pg0KPGRpdj4tLSBUaGUgcmVzdWx0IGlzIGZhaWxlZC48L2Rpdj4NCjxkaXY+
QXVnIDA4IDE3OjIzOjU0IGRoY3AtMS0yNTIgc3lzdGVtZFsxXTogVW5pdCB0cG0yLWFicm1kLnNl
cnZpY2UgZW50ZXJlZCBmYWlsZWQgc3RhdGUuPC9kaXY+DQo8ZGl2PkF1ZyAwOCAxNzoyMzo1NCBk
aGNwLTEtMjUyIHN5c3RlbWRbMV06IHRwbTItYWJybWQuc2VydmljZSBmYWlsZWQuPC9kaXY+DQo8
ZGl2PkF1ZyAwOCAxNzoyMzo1NCBkaGNwLTEtMjUyIHBvbGtpdGRbMTIxN106IFVucmVnaXN0ZXJl
ZCBBdXRoZW50aWNhdGlvbiBBZ2VudCBmb3IgdW5peC1wcm9jZXNzOjY2NzY6NjcyNDc1IChzeXN0
ZW0gYnVzIG5hbWUgOjEuOTQsIG9iamVjdCBwYXRoIC9vcmcvZnJlZWRlc2t0b3AvUG9saWN5S2l0
MS9BdXRoZW50aWNhdGlvbkFnZW50LCBsb2NhbGUgZW5fQVUuVVRGLTgpIChkaXNjb25uZWN0ZWQg
ZnJvbSBidXMpPC9kaXY+DQo8ZGl2Pltyb290QGRoY3AtMS0yNTIgfl0jICFkYnVzPC9kaXY+DQo8
ZGl2PmRidXMtc2VuZCAtLXN5c3RlbSAtLWRlc3Q9Y29tLmludGVsLnRzczIuVGFicm1kIC0tdHlw
ZT1tZXRob2RfY2FsbCAtLXByaW50LXJlcGx5IC9jb20vaW50ZWwvdHNzMi9UYWJybWQvVGN0aSBv
cmcuZnJlZWRlc2t0b3AuREJ1cy5JbnRyb3NwZWN0YWJsZS5JbnRyb3NwZWN0PC9kaXY+DQo8ZGl2
PkVycm9yIG9yZy5mcmVlZGVza3RvcC5EQnVzLkVycm9yLlNlcnZpY2VVbmtub3duOiBUaGUgbmFt
ZSBjb20uaW50ZWwudHNzMi5UYWJybWQgd2FzIG5vdCBwcm92aWRlZCBieSBhbnkgLnNlcnZpY2Ug
ZmlsZXM8L2Rpdj4NCjxkaXY+W3Jvb3RAZGhjcC0xLTI1MiB+XSMmbmJzcDsgcnBtIC1xIC1hIHwg
Z3JlcCB0cG0yPC9kaXY+DQo8ZGl2PnRwbTItdHNzLWRldmVsLTEuMy4wLTIuZWw3Lng4Nl82NDwv
ZGl2Pg0KPGRpdj50cG0yLXRzcy0xLjMuMC0yLmVsNy54ODZfNjQ8L2Rpdj4NCjxkaXY+dHBtMi1h
YnJtZC0xLjEuMC04LmVsNy54ODZfNjQ8L2Rpdj4NCjxicj4NCjxwPjwvcD4NCjwvZGl2Pg0KPC9k
aXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--===============1943243615747508341==--

