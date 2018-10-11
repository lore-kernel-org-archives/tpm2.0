Content-Type: multipart/mixed; boundary="===============2225061307986176348=="
MIME-Version: 1.0
From: Tomasz Przybysz <tomaszp at mikronika.pl>
Subject: [tpm2] How to clear DA lockout mode ?
Date: Thu, 11 Oct 2018 08:36:11 +0000
Message-ID: <d25dc0c3-5811-7d66-16d9-c2ecb1894f5c@mikronika.pl>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2225061307986176348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,
How to clear DA lockout mode ?

I did:
tpm2_takeownership -c
tpm2_takeownership -o ownerpasswd
tpm2_takeownership -e endorsepasswd
tpm2_takeownership -l lockpasswd

Then I removed:

tpm2_takeownership -O ownerpasswd
tpm2_takeownership -E endorsepasswd

but I can' remove lock pasword



tpm2_getcap -c properties-variable
TPM_PT_PERSISTENT:
=C2=A0 ownerAuthSet:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 clear
=C2=A0 endorsementAuthSet:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clear
=C2=A0 lockoutAuthSet:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 set
=C2=A0 reserved1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clear
=C2=A0 disableClear:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 clear
=C2=A0 inLockout:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clear
=C2=A0 tpmGeneratedEPS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 clear
=C2=A0 reserved2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clear
TPM_PT_STARTUP_CLEAR:
=C2=A0 phEnable:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set
=C2=A0 shEnable:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set
=C2=A0 ehEnable:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set
=C2=A0 phEnableNV:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set
=C2=A0 reserved1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clear
=C2=A0 orderly:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clear
TPM_PT_TPM2_HR_NV_INDEX:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00000002
TPM_PT_HR_LOADED:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00000000
TPM_PT_HR_LOADED_AVAIL:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000003
TPM_PT_HR_ACTIVE:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00000000
TPM_PT_HR_ACTIVE_AVAIL:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000040
TPM_PT_TPM2_HR_TRANSIENT_AVAIL:=C2=A0=C2=A0 0x00000003
TPM_PT_TPM2_HR_PERSISTENT:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000=
0000
TPM_PT_TPM2_HR_PERSISTENT_AVAIL:=C2=A0 0x00000012
TPM_PT_NV_COUNTERS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
x00000000
TPM_PT_NV_COUNTERS_AVAIL:=C2=A0=C2=A0=C2=A0 0x0000000d
TPM_PT_ALGORITHM_SET:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000000
TPM_PT_LOADED_CURVES:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000002
TPM_PT_LOCKOUT_COUNTER:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000001
TPM_PT_MAX_AUTH_FAIL:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000020
TPM_PT_LOCKOUT_INTERVAL:=C2=A0=C2=A0=C2=A0=C2=A0 0x00001c20
TPM_PT_LOCKOUT_RECOVERY:=C2=A0=C2=A0=C2=A0=C2=A0 0x00015180
TPM_PT_AUDIT_COUNTER_0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000000
TPM_PT_AUDIT_COUNTER_1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000000


After execute:
tpm2_takeownership -c -L lockpasswd
RROR: Clearing Failed! TPM error code: 0x921
ERROR: Unable to run tpm2_takeownership

tpm2_dictionarylockout -c -P lockpasswd
ERROR: 0x921 Error clearing dictionary lockout.
ERROR: Unable to run tpm2_dictionarylockout

tpm2-tss: 2.1.0
tpm2-abrmd: 2.0.2
tpm2-tools: 3.1.3-rc1
TMP dev: Infineon SLB9670

Thanks,
Tom




--===============2225061307986176348==--

