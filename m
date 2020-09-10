Content-Type: multipart/mixed; boundary="===============1474392509707082699=="
MIME-Version: 1.0
From: Diego Santa Cruz <Diego.SantaCruz at spinetix.com>
Subject: [tpm2] Re: unable to take ownership of TPM2.0 device
Date: Thu, 10 Sep 2020 09:46:53 +0000
Message-ID: <
 <HE1PR0102MB26344FB44EC4E0D1083140C388270@HE1PR0102MB2634.eurprd01.prod.exchangelabs.com>>
In-Reply-To: 20200909214921.2828.69714@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1474392509707082699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

If you have lost the lockout password then you can request the BIOS to clea=
r the TPM via the Physical Presence Interface (PPI), of course you will loo=
se all data on the TPM and any saved keys will be invalidated.

The clear operation is 5 and you can queue the requests are via /sys/class/=
tpm/tpm0/ppi/request, so the following should do it

echo 5 > /sys/class/tpm/tpm0/ppi/request
reboot

Upon reboot the BIOS may pause the boot and request a confirmation on the k=
eyboard, it depends on the BIOS settings.

Best,

Diego

-- =

Diego Santa Cruz, PhD
Technology Architect
spinetix.com

-----Original Message-----
From: Chenxi Z <cxzhang1981(a)hotmail.com> =

Sent: 09 September 2020 23:49
To: tpm2(a)lists.01.org
Subject: [tpm2] unable to take ownership of TPM2.0 device

Hi,

I am encountering an issue that TPM2 device in DA lockout mode, and I am un=
able to take ownership or unlock it.
Could anyone help me how to resolve it?

TPM2 tools version:
[root(a)myhost ~]# rpm -qa | grep tpm2
tpm2-tss-1.0.
tpm2-abrmd-1.0
tpm2-tools-1.1


[root(a)myhost ~]# tpm2_dump_capability -c properties-variable
TPM_PT_PERSISTENT:
  ownerAuthSet:              clear
  endorsementAuthSet:   clear
  lockoutAuthSet:            clear
  reserved1:                    clear
  disableClear:                clear
  inLockout:                     clear
  tpmGeneratedEPS:      clear
  reserved2:                 clear
TPM_PT_STARTUP_CLEAR:
  phEnable:                  set
  shEnable:                  set
  ehEnable:                  set
  phEnableNV:              set
  reserved1:                 clear
  orderly:                   clear
TPM_PT_HR_NV_INDEX:          0x00000008
TPM_PT_HR_LOADED:            0x00000000
TPM_PT_HR_LOADED_AVAIL:      0x00000004
TPM_PT_HR_ACTIVE:            0x00000000
TPM_PT_HR_ACTIVE_AVAIL:      0x00000040
TPM_PT_HR_TRANSIENT_AVAIL:   0x00000005
TPM_PT_HR_PERSISTENT:        0x00000001
TPM_PT_HR_PERSISTENT_AVAIL:  0x00000007
TPM_PT_NV_COUNTERS:          0x00000000
TPM_PT_NV_COUNTERS_AVAIL:    0x00000008
TPM_PT_ALGORITHM_SET:        0x00000000
TPM_PT_LOADED_CURVES:        0x00000003
TPM_PT_LOCKOUT_COUNTER:      0x00000000
TPM_PT_MAX_AUTH_FAIL:        0x00000020
TPM_PT_LOCKOUT_INTERVAL:     0x00001c20
TPM_PT_LOCKOUT_RECOVERY:     0x00015180
TPM_PT_NV_WRITE_RECOVERY:    0x00000000
TPM_PT_AUDIT_COUNTER_0:      0x00000000
TPM_PT_AUDIT_COUNTER_1:      0x00000000


Here is the issue:
[root(a)myhost ~]# tpm2_takeownership -c -L <PWD>  -O <PWD>  -E <PWD>
ERROR: Clearing Failed! TPM error code: 0x921


[root(a)myhost ~]# tpm2_dictionarylockout -c --lockout-passwd <PWD>
ERROR: 0x921 Error clearing dictionary lockout.
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org %(web_page_url)sl=
istinfo%(cgiext)s/%(_internal_name)s
--===============1474392509707082699==--

