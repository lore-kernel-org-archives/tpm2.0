Content-Type: multipart/mixed; boundary="===============2666286589917296160=="
MIME-Version: 1.0
From: Shiv Dev <shivfsdev at gmail.com>
Subject: [tpm2] Creating TPM2 primary key failed!
Date: Mon, 06 May 2019 11:19:30 +0530
Message-ID: <CACX8e9P2Z4iP=BBgOCZe6_21hAqr5wQ4ooLEC703qLMtze_V0Q@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2666286589917296160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

 I am facing an issue with tpm2 with PTT.  The  configuration is RHEL
8 on an intel compute stick.

Using clevis-luks-bind  to add a key to the root partition..

sudo clevis-luks-bind -f -s 4 -k mykeyfile -d /dev/mmcblk0p3 tpm2
'{"pcr_bank":"sha1", "pcr_ids":"4,5,6,7,8,9,10"}'
ERROR:
CreatePrimary Failed ! ErrorCode: 0x902

ERROR: Unable to run tpm2_createprimary
Creating TPM2 primary key failed!

I believe it is a resource management issue as the abrmd is not being
used. I considered the following options.

1.   As tpm2-flushcontext is not there in the tpm-tools 3.1.1, I built
it from the master branch.

[ubuntu(a)localhost luks]$ tpm2_getcap -c handles-persistent
0x81000001
0x81010001
[ubuntu(a)localhost luks]$ ./tpm2_flushcontext.orig -c 0x81000001
WARNING:esys:src/tss2-esys/api/Esys_ReadPublic.c:316:Esys_ReadPublic_Finish=
()
Received TPM Error
ERROR:esys:src/tss2-esys/esys_tr.c:217:Esys_TR_FromTPMPublic_Finish()
Error ReadPublic ErrorCode (0x00000902)
ERROR:esys:src/tss2-esys/esys_tr.c:307:Esys_TR_FromTPMPublic() Error
TR FromTPMPublic ErrorCode (0x00000902)
ERROR: Esys_TR_FromTPMPublic(0x902) - tpm:warn(2.0): out of memory for
object contexts
ERROR: Unable to run ./tpm2_flushcontext.orig

2. I started the tpm2-abrmd process, and then tried the above command.

[ubuntu(a)localhost luks]$ sudo systemctl start tpm2-abrmd
[sudo] password for ubuntu:
[ubuntu(a)localhost luks]$ ps -ef | grep abrmd
tss       8014     1  0 10:44 ?        00:00:00 /usr/sbin/tpm2-abrmd
ubuntu    8571  7931  0 11:17 pts/0    00:00:00 grep --color=3Dauto abrmd
[ubuntu(a)localhost luks]$ ./tpm2_flushcontext.orig -c 0x81000001
WARNING:esys:src/tss2-esys/api/Esys_ReadPublic.c:316:Esys_ReadPublic_Finish=
()
Received TPM Error
ERROR:esys:src/tss2-esys/esys_tr.c:217:Esys_TR_FromTPMPublic_Finish()
Error ReadPublic ErrorCode (0x00000902)
ERROR:esys:src/tss2-esys/esys_tr.c:307:Esys_TR_FromTPMPublic() Error
TR FromTPMPublic ErrorCode (0x00000902)
ERROR: Esys_TR_FromTPMPublic(0x902) - tpm:warn(2.0): out of memory for
object contexts
ERROR: Unable to run ./tpm2_flushcontext.orig

Not sure if the above approaches are correct. Request you to suggest
any thing else that I can try.

Regards,
Shiv

--===============2666286589917296160==--

