Content-Type: multipart/mixed; boundary="===============3305420620774502224=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] tpm2_pcrread is not working because of tcti-abrmd
Date: Tue, 15 Dec 2020 01:13:16 +0000
Message-ID: <20201215011316.4749.42@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3305420620774502224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Can I know why tpm2 tools is not working. Below are logs. Thank you for the=
 help in advace.

[root(a)myhost ~]# tpm2_pcrread

** (process:3459977): WARNING **: 17:05:49.915: Failed to create connection=
 with service: Timeout was reached
WARNING:tcti:src/tss2-tcti/tctildr.c:79:tcti_from_init() TCTI init for func=
tion 0x7f0481c01ac0 failed with a0008
WARNING:tcti:src/tss2-tcti/tctildr.c:109:tcti_from_info() Could not initial=
ize TCTI named: tcti-abrmd
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not initia=
lize TCTI file: libtss2-tcti-tabrmd.so.0

(and hangs)

[root(a)myhost ~]# cat /etc/os-release
NAME=3D"CentOS Linux"
VERSION=3D"8 (Core)"
ID=3D"centos"
ID_LIKE=3D"rhel fedora"
VERSION_ID=3D"8"
... ... =



Version info:

[root(a)myhost~]# rpm -qa | grep tpm2
tpm2-tss-2.4.3.x86_64
tpm2-tools-4.3.0.x86_64
tpm2-abrmd-2.3.3.x86_64



[root(a)myhost ~]# service tpm2-abrmd status
Redirecting to /bin/systemctl status tpm2-abrmd.service
=E2=97=8F tpm2-abrmd.service - TPM2 Access Broker and Resource Management D=
aemon
     Loaded: loaded (/usr/lib/systemd/system/tpm2-abrmd.service; enabled; v=
endor preset: disabled)
     Active: active (running) since Mon 2020-12-14 16:48:42 PST; 15min ago
   Main PID: 3422797 (tpm2-abrmd)
         IO: 0B read, 0B written
      Tasks: 4
     Memory: 2.0M
        CPU: 49ms
     CGroup: /system.slice/tpm2-abrmd.service
             =E2=94=94=E2=94=803422797 /usr/sbin/tpm2-abrmd

Warning: journal has been rotated since unit was started, output may be inc=
omplete.

Thanks,
Chenxi
--===============3305420620774502224==--

