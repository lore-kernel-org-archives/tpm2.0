Content-Type: multipart/mixed; boundary="===============5260240163971546067=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] unable to take ownership of TPM2.0 device
Date: Wed, 09 Sep 2020 21:49:21 +0000
Message-ID: <20200909214921.2828.69714@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5260240163971546067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
--===============5260240163971546067==--

