Content-Type: multipart/mixed; boundary="===============4823929177765905089=="
MIME-Version: 1.0
From: martin doc <db1280 at hotmail.com>
Subject: [tpm2] Cannot get tabrmd to run
Date: Wed, 08 Aug 2018 07:28:11 +0000
Message-ID: <SL2P216MB0266B495F6A0F43DCB568AD0C2260@SL2P216MB0266.KORP216.PROD.OUTLOOK.COM>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4823929177765905089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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


--===============4823929177765905089==
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
YXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowIj48L3A+DQo8ZGl2PkhpLDwvZGl2Pg0KPGRpdj5J
J20gYnJpbmcgdXAgVFBNIG9uIGEgc3lzdGVtIGZvciB0aGUgZmlyc3QgdGltZSBhbmQgaGF2ZSBy
dW4gaW50byBhIGJpdCBvZiBhIHByb2JsZW0gLSB0YWJybWQgd29uJ3Qgc3RhcnQuPC9kaXY+DQo8
ZGl2PuKAqDwvZGl2Pg0KPGRpdj5QYXJ0IG9mIHRoaXMgYXBwZWFycyB0byBiZSBkdWUgdG8gaXQg
bm90IGJlaW5nIHByZXNlbnQgaW4gZGJ1cywgZS5nLjo8L2Rpdj4NCjxkaXY+4oCoPC9kaXY+DQo8
ZGl2PiMgZGJ1cy1zZW5kIC0tc3lzdGVtIC0tZGVzdD1jb20uaW50ZWwudHNzMi5UYWJybWQgLS10
eXBlPW1ldGhvZF9jYWxsIC0tcHJpbnQtcmVwbHkgL2NvbS9pbnRlbC90c3MyL1RhYnJtZC9UY3Rp
IG9yZy5mcmVlZGVza3RvcC5EQnVzLkludHJvc3BlY3RhYmxlLkludHJvc3BlY3Q8L2Rpdj4NCjxk
aXY+RXJyb3Igb3JnLmZyZWVkZXNrdG9wLkRCdXMuRXJyb3IuU2VydmljZVVua25vd246IFRoZSBu
YW1lIGNvbS5pbnRlbC50c3MyLlRhYnJtZCB3YXMgbm90IHByb3ZpZGVkIGJ5IGFueSAuc2Vydmlj
ZSBmaWxlczwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2
PkkgZG9uJ3Qga25vdyBob3cgdG8gZml4IHRoaXMuIFRoZSBzZXJ2aWNlIGhhcyBiZWVuIGVuYWJs
ZWQgaW4gc3lzdGVtZDo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PiMgc3lzdGVtY3Rs
IHN0YXR1cyB0cG0yLWFicm1kPC9kaXY+DQo8ZGl2PuKXjyB0cG0yLWFicm1kLnNlcnZpY2UgLSBU
UE0yIEFjY2VzcyBCcm9rZXIgYW5kIFJlc291cmNlIE1hbmFnZW1lbnQgRGFlbW9uPC9kaXY+DQo8
ZGl2PiZuYnNwOyAmbmJzcDtMb2FkZWQ6IGxvYWRlZCAoL3Vzci9saWIvc3lzdGVtZC9zeXN0ZW0v
dHBtMi1hYnJtZC5zZXJ2aWNlOyBlbmFibGVkOyB2ZW5kb3IgcHJlc2V0OiBkaXNhYmxlZCk8L2Rp
dj4NCjxkaXY+Jm5ic3A7ICZuYnNwO0FjdGl2ZTogYWN0aXZhdGluZyAoYXV0by1yZXN0YXJ0KSAo
UmVzdWx0OiBleGl0LWNvZGUpIHNpbmNlIFdlZCAyMDE4LTA4LTA4IDE3OjE5OjU0IEFFU1Q7IDRz
IGFnbzwvZGl2Pg0KPGRpdj4mbmJzcDsgUHJvY2VzczogNjM1MCBFeGVjU3RhcnQ9L3Vzci9zYmlu
L3RwbTItYWJybWQgKGNvZGU9ZXhpdGVkLCBzdGF0dXM9MS9GQUlMVVJFKTwvZGl2Pg0KPGRpdj4m
bmJzcDtNYWluIFBJRDogNjM1MCAoY29kZT1leGl0ZWQsIHN0YXR1cz0xL0ZBSUxVUkUpPC9kaXY+
DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5BdWcgMDggMTc6MTk6NTQgZGhjcC0xLTI1MiBzeXN0
ZW1kWzFdOiBGYWlsZWQgdG8gc3RhcnQgVFBNMiBBY2Nlc3MgQnJva2VyIGFuZCBSZXNvdXJjZSBN
YW5hZ2VtZW50IERhZW1vbi48L2Rpdj4NCjxkaXY+QXVnIDA4IDE3OjE5OjU0IGRoY3AtMS0yNTIg
c3lzdGVtZFsxXTogVW5pdCB0cG0yLWFicm1kLnNlcnZpY2UgZW50ZXJlZCBmYWlsZWQgc3RhdGUu
PC9kaXY+DQo8ZGl2PkF1ZyAwOCAxNzoxOTo1NCBkaGNwLTEtMjUyIHN5c3RlbWRbMV06IHRwbTIt
YWJybWQuc2VydmljZSBmYWlsZWQuPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5JJ3Zl
IHRyaWVkIHBraWxsIC1IVVAgZGJ1cy1kYWVtb24gYW5kIHN5c3RlbWN0bCBkYWVtb24tcmVsb2Fk
LiBObyBjaGFuZ2UuPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5BdWcgMDggMTc6MjM6
NDMgZGhjcC0xLTI1MiBzeXN0ZW1kWzFdOiBSZWxvYWRpbmcuPC9kaXY+DQo8ZGl2PkF1ZyAwOCAx
NzoyMzo0MyBkaGNwLTEtMjUyIHBvbGtpdGRbMTIxN106IFVucmVnaXN0ZXJlZCBBdXRoZW50aWNh
dGlvbiBBZ2VudCBmb3IgdW5peC1wcm9jZXNzOjY2NTg6NjcxNDM0IChzeXN0ZW0gYnVzIG5hbWUg
OjEuOTMsIG9iamVjdCBwYXRoIC9vcmcvZnJlZWRlc2t0b3AvUG9saWN5S2l0MS9BdXRoZW50aWNh
dGlvbkFnZW50LCBsb2NhbGUgZW5fQVUuVVRGLTgpIChkaXNjb25uZWN0ZWQgZnJvbSBidXMpPC9k
aXY+DQo8ZGl2PkF1ZyAwOCAxNzoyMzo1NCBkaGNwLTEtMjUyIHBvbGtpdGRbMTIxN106IFJlZ2lz
dGVyZWQgQXV0aGVudGljYXRpb24gQWdlbnQgZm9yIHVuaXgtcHJvY2Vzczo2Njc2OjY3MjQ3NSAo
c3lzdGVtIGJ1cyBuYW1lIDoxLjk0IFsvdXNyL2Jpbi9wa3R0eWFnZW50IC0tbm90aWZ5LWZkIDUg
LS1mYWxsYmFja10sIG9iamVjdCBwYXRoIC9vcmcvZnJlZWRlc2t0b3AvUG9saWN5S2l0MS9BdXRo
ZW50aWNhdGlvbkFnZW50LCBsb2NhbGUgZW5fQVUuVVRGLTgpPC9kaXY+DQo8ZGl2PkF1ZyAwOCAx
NzoyMzo1NCBkaGNwLTEtMjUyIHN5c3RlbWRbMV06IFN0YXJ0aW5nIFRQTTIgQWNjZXNzIEJyb2tl
ciBhbmQgUmVzb3VyY2UgTWFuYWdlbWVudCBEYWVtb24uLi48L2Rpdj4NCjxkaXY+LS0gU3ViamVj
dDogVW5pdCB0cG0yLWFicm1kLnNlcnZpY2UgaGFzIGJlZ3VuIHN0YXJ0LXVwPC9kaXY+DQo8ZGl2
Pi0tIERlZmluZWQtQnk6IHN5c3RlbWQ8L2Rpdj4NCjxkaXY+LS0gU3VwcG9ydDogaHR0cDovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3N5c3RlbWQtZGV2ZWw8L2Rpdj4N
CjxkaXY+LS08L2Rpdj4NCjxkaXY+LS0gVW5pdCB0cG0yLWFicm1kLnNlcnZpY2UgaGFzIGJlZ3Vu
IHN0YXJ0aW5nIHVwLjwvZGl2Pg0KPGRpdj5BdWcgMDggMTc6MjM6NTQgZGhjcC0xLTI1MiB0cG0y
LWFicm1kWzY2ODJdOiBmYWlsZWQgdG8gaW5pdGlhbGl6ZSBkZXZpY2UgVENUSSBjb250ZXh0OiAw
eGEwMDBhPC9kaXY+DQo8ZGl2PkF1ZyAwOCAxNzoyMzo1NCBkaGNwLTEtMjUyIHRwbTItYWJybWRb
NjY4Ml06IFRDVEkgaW5pdGlhbGl6YXRpb24gZmFpbGVkOiAweGEwMDBhPC9kaXY+DQo8ZGl2PkF1
ZyAwOCAxNzoyMzo1NCBkaGNwLTEtMjUyIHN5c3RlbWRbMV06IHRwbTItYWJybWQuc2VydmljZTog
bWFpbiBwcm9jZXNzIGV4aXRlZCwgY29kZT1leGl0ZWQsIHN0YXR1cz0xL0ZBSUxVUkU8L2Rpdj4N
CjxkaXY+QXVnIDA4IDE3OjIzOjU0IGRoY3AtMS0yNTIgc3lzdGVtZFsxXTogRmFpbGVkIHRvIHN0
YXJ0IFRQTTIgQWNjZXNzIEJyb2tlciBhbmQgUmVzb3VyY2UgTWFuYWdlbWVudCBEYWVtb24uPC9k
aXY+DQo8ZGl2Pi0tIFN1YmplY3Q6IFVuaXQgdHBtMi1hYnJtZC5zZXJ2aWNlIGhhcyBmYWlsZWQ8
L2Rpdj4NCjxkaXY+LS0gRGVmaW5lZC1CeTogc3lzdGVtZDwvZGl2Pg0KPGRpdj4tLSBTdXBwb3J0
OiBodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vc3lzdGVtZC1k
ZXZlbDwvZGl2Pg0KPGRpdj4tLTwvZGl2Pg0KPGRpdj4tLSBVbml0IHRwbTItYWJybWQuc2Vydmlj
ZSBoYXMgZmFpbGVkLjwvZGl2Pg0KPGRpdj4tLTwvZGl2Pg0KPGRpdj4tLSBUaGUgcmVzdWx0IGlz
IGZhaWxlZC48L2Rpdj4NCjxkaXY+QXVnIDA4IDE3OjIzOjU0IGRoY3AtMS0yNTIgc3lzdGVtZFsx
XTogVW5pdCB0cG0yLWFicm1kLnNlcnZpY2UgZW50ZXJlZCBmYWlsZWQgc3RhdGUuPC9kaXY+DQo8
ZGl2PkF1ZyAwOCAxNzoyMzo1NCBkaGNwLTEtMjUyIHN5c3RlbWRbMV06IHRwbTItYWJybWQuc2Vy
dmljZSBmYWlsZWQuPC9kaXY+DQo8ZGl2PkF1ZyAwOCAxNzoyMzo1NCBkaGNwLTEtMjUyIHBvbGtp
dGRbMTIxN106IFVucmVnaXN0ZXJlZCBBdXRoZW50aWNhdGlvbiBBZ2VudCBmb3IgdW5peC1wcm9j
ZXNzOjY2NzY6NjcyNDc1IChzeXN0ZW0gYnVzIG5hbWUgOjEuOTQsIG9iamVjdCBwYXRoIC9vcmcv
ZnJlZWRlc2t0b3AvUG9saWN5S2l0MS9BdXRoZW50aWNhdGlvbkFnZW50LCBsb2NhbGUgZW5fQVUu
VVRGLTgpIChkaXNjb25uZWN0ZWQgZnJvbSBidXMpPC9kaXY+DQo8ZGl2Pltyb290QGRoY3AtMS0y
NTIgfl0jICFkYnVzPC9kaXY+DQo8ZGl2PmRidXMtc2VuZCAtLXN5c3RlbSAtLWRlc3Q9Y29tLmlu
dGVsLnRzczIuVGFicm1kIC0tdHlwZT1tZXRob2RfY2FsbCAtLXByaW50LXJlcGx5IC9jb20vaW50
ZWwvdHNzMi9UYWJybWQvVGN0aSBvcmcuZnJlZWRlc2t0b3AuREJ1cy5JbnRyb3NwZWN0YWJsZS5J
bnRyb3NwZWN0PC9kaXY+DQo8ZGl2PkVycm9yIG9yZy5mcmVlZGVza3RvcC5EQnVzLkVycm9yLlNl
cnZpY2VVbmtub3duOiBUaGUgbmFtZSBjb20uaW50ZWwudHNzMi5UYWJybWQgd2FzIG5vdCBwcm92
aWRlZCBieSBhbnkgLnNlcnZpY2UgZmlsZXM8L2Rpdj4NCjxkaXY+W3Jvb3RAZGhjcC0xLTI1MiB+
XSMmbmJzcDsgcnBtIC1xIC1hIHwgZ3JlcCB0cG0yPC9kaXY+DQo8ZGl2PnRwbTItdHNzLWRldmVs
LTEuMy4wLTIuZWw3Lng4Nl82NDwvZGl2Pg0KPGRpdj50cG0yLXRzcy0xLjMuMC0yLmVsNy54ODZf
NjQ8L2Rpdj4NCjxkaXY+dHBtMi1hYnJtZC0xLjEuMC04LmVsNy54ODZfNjQ8L2Rpdj4NCjxicj4N
CjxwPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--===============4823929177765905089==--

