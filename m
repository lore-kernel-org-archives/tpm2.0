Content-Type: multipart/mixed; boundary="===============3039165195337914405=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Mysterious Keys -- where are they?
Date: Wed, 04 Dec 2019 10:02:40 +0000
Message-ID: <CALtZhhM5LpYy7-kPwm6T6sygw5npyBnNdtYycQ1CiJ8h=d3+pg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3039165195337914405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I run the following at the command line:

    ssh-keygen -D libtpm2_pkcs11.so

And here's the output I get:

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrxtObHB3IwZi4HB5+DX2Cvc1P/2ttZqRP5rF=
zcpEdAjR7/sqjSWGEzldnxA1l1xygqkKYBUkCleo+LPbylBFrinahmxVpSemT/Vk75gwAwGeUdf=
shrnl03kyneRWgF/0jkpK98hqXTNBEamuCRdKnpNAjXP4EqYyKUwLOewq29l5aaIsYo1XGdl2MD=
dt3xlVzQ/3QVKxPI0Kx1bWrtyLM1yc6hz2bwDC/mhlIagLQJp5fChHblhfrqk0yY0s6PvZKeC2l=
Y+11s4Ytg4ab4xjTaKH6CY43/Ihnjhm9QqJ4v2+9VmPHi/s4LjyVMTnUBVdrmPnGguKSZz1QjGX=
TUtP9
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjDU0id40tF8/h5NtkuxCTEaUhy38ZMMcHOlR=
UtCRkiZyZeAJ9guuhO49DkLBtc24p5VWMVg52irodqTLRvDKbq8o+CP5m7eXMJX+LtNaHogRH0y=
7n2T1mCZlFxC+IqfXcTJQG1RDQjXsyaWvsEwQrzPGXGv7ij0vONYOSLMVNk84vn3VaB/jtDwJs0=
bjymQW1ulNYryCG0P/XyK10E9A7eP9rT7JZh8P6LazTt2+1KuzEwfb299zV3E8U49AyzLRHq2L3=
cbsCcG94oIMAJsXWQJxqP4IfK3no57zLpSpPaSWGjuVOLP6fG/xCjjhPjA3kXgrhKgsMeqVypdZ=
zn4vH
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4bsueeBzYNAa5gIzt9Q3qk3rzpFqvayZw8hW=
EHVfVpCW+MMervLVSeAq9tapm+vwt3kH2CINAB5uUQeq3pxt1BB72isfwGAFJBvfXRNC+6Pvu+6=
jiYqDBMWQ+2TjF7bLPPHA+GYacol/eiQUmhT6pGoSJk0GuH83fmfV8dD8Zz5mKZbQlkdW4fvKpC=
tlf9kvN9rUkLEL0zSkYL1vZ5KUqtO9Aae6dgbiuocKgrDdfPPgxNvKUvUGLFTEbALgSGHEWZGAo=
i2O0MkyS9CxhyfRsNmOOMA+i8AfVNlYTwreyOD0qAOGzBdczVUM9207nwGvXHDkO8t8QHRslXvN=
WGanl
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfBbPT1ARqFc9QGGNIW9wZoXYnYl5tyW1UwrO=
WosF18GEc1AUcq/qIauqIvZTXbhD3wz0h3ZJXaTU59Mno33hH0yJzOMxEVO8QQwjE+q+PB58mdn=
4odZbq3hiAH9I+IX9Q3ZvmzG3i54MLeckbFX4FIie7x5Yz9E6y6ZQPsJUc+qO2PVg1FL375GJa+=
clPpI9eGCA7gwrQNq6EMHa0D07Nkn5ZoSGYl1pY/4DV8k1+WEtyVE629H0GAzsvppQwOxpaAjmG=
nZCl8KwkT+uylPIn3qc38o8NicMcojuFGTRynmYjrbTC9p0ehTBuYOYZpZZ9h5QmArgdIPlv+XU=
DkA3V
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCT0TSE2zcxcQ/asJxHfxbCS/jJPyitrDhlnN=
J8sNV4Q5FKoSx1gjPbOpjZ035JInBIR17VeMpBzvBD6d1ylebDAkFuuCaUTaGbxwMRa2grg0nuB=
fA0V1wvOH9NetXjTNDdREUvi4JJGVOyi4D6pErSjf8CO5Ph6WPdT3TtOZAzh+7TsE3lbf/cqgK9=
60N+qtoyTulGXQIu7vI+w8SAvWGDDugM7gZFP6H8yrsVpl6UkQdOKfhkx75y698tYSBQUgyXkrN=
B5oKl4qINfI2DWT8woME0n8H7Le3r2WTZESpp6ntPR6duiqcs6WY+R/4sn2bi7Sm5KSuV+4khNT=
VbzwJ


So it looks like there's 5 keys inside my TPM2 chip somewhere. I wish
I knew were.

So now I try to get a list of all keys, by calling "tpm2_getcap" with
every kind of parameter, as follows:

    tpm2_getcap --list | cut -d ' ' -f 2 | xargs -n1 -r -t tpm2_getcap

The output I get from this command shows that there are no transient,
persistent, loaded session, or saved session keys. If this is true
then where are my 5 keys?

And here's the ENTIRE output I get:

tpm2_getcap algorithms
rsa:
  value:      0x1
  asymmetric: 1
  symmetric:  0
  hash:       0
  object:     1
  reserved:   0x0
  signing:    0
  encrypting: 0
  method:     0
sha1:
  value:      0x4
  asymmetric: 0
  symmetric:  0
  hash:       1
  object:     0
  reserved:   0x0
  signing:    0
  encrypting: 0
  method:     0
hmac:
  value:      0x5
  asymmetric: 0
  symmetric:  0
  hash:       1
  object:     0
  reserved:   0x0
  signing:    1
  encrypting: 0
  method:     0
aes:
  value:      0x6
  asymmetric: 0
  symmetric:  1
  hash:       0
  object:     0
  reserved:   0x0
  signing:    0
  encrypting: 0
  method:     0
keyedhash:
  value:      0x8
  asymmetric: 0
  symmetric:  0
  hash:       1
  object:     1
  reserved:   0x0
  signing:    1
  encrypting: 1
  method:     0
xor:
  value:      0xA
  asymmetric: 0
  symmetric:  1
  hash:       1
  object:     0
  reserved:   0x0
  signing:    0
  encrypting: 0
  method:     0
sha256:
  value:      0xB
  asymmetric: 0
  symmetric:  0
  hash:       1
  object:     0
  reserved:   0x0
  signing:    0
  encrypting: 0
  method:     0
rsassa:
  value:      0x14
  asymmetric: 1
  symmetric:  0
  hash:       0
  object:     0
  reserved:   0x0
  signing:    1
  encrypting: 0
  method:     0
rsaes:
  value:      0x15
  asymmetric: 1
  symmetric:  0
  hash:       0
  object:     0
  reserved:   0x0
  signing:    0
  encrypting: 1
  method:     0
rsapss:
  value:      0x16
  asymmetric: 1
  symmetric:  0
  hash:       0
  object:     0
  reserved:   0x0
  signing:    1
  encrypting: 0
  method:     0
oaep:
  value:      0x17
  asymmetric: 1
  symmetric:  0
  hash:       0
  object:     0
  reserved:   0x0
  signing:    0
  encrypting: 1
  method:     0
ecdsa:
  value:      0x18
  asymmetric: 1
  symmetric:  0
  hash:       0
  object:     0
  reserved:   0x0
  signing:    1
  encrypting: 0
  method:     1
ecdh:
  value:      0x19
  asymmetric: 1
  symmetric:  0
  hash:       0
  object:     0
  reserved:   0x0
  signing:    0
  encrypting: 0
  method:     1
ecdaa:
  value:      0x1A
  asymmetric: 1
  symmetric:  0
  hash:       0
  object:     0
  reserved:   0x0
  signing:    1
  encrypting: 0
  method:     0
kdf1_sp800_56a:
  value:      0x20
  asymmetric: 0
  symmetric:  0
  hash:       1
  object:     0
  reserved:   0x0
  signing:    0
  encrypting: 0
  method:     1
kdf1_sp800_108:
  value:      0x22
  asymmetric: 0
  symmetric:  0
  hash:       1
  object:     0
  reserved:   0x0
  signing:    0
  encrypting: 0
  method:     1
ecc:
  value:      0x23
  asymmetric: 1
  symmetric:  0
  hash:       0
  object:     1
  reserved:   0x0
  signing:    0
  encrypting: 0
  method:     0
symcipher:
  value:      0x25
  asymmetric: 0
  symmetric:  0
  hash:       0
  object:     1
  reserved:   0x0
  signing:    0
  encrypting: 0
  method:     0
cfb:
  value:      0x43
  asymmetric: 0
  symmetric:  1
  hash:       0
  object:     0
  reserved:   0x0
  signing:    0
  encrypting: 1
  method:     0
tpm2_getcap commands
TPM2_CC_NV_UndefineSpaceSpecial:
  value: 0x440011F
  commandIndex: 0x11f
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_EvictControl:
  value: 0x4400120
  commandIndex: 0x120
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_HierarchyControl:
  value: 0x2C00121
  commandIndex: 0x121
  reserved1:    0x0
  nv:           1
  extensive:    1
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_NV_UndefineSpace:
  value: 0x4400122
  commandIndex: 0x122
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_Clear:
  value: 0x2C00126
  commandIndex: 0x126
  reserved1:    0x0
  nv:           1
  extensive:    1
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_ClearControl:
  value: 0x2400127
  commandIndex: 0x127
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_ClockSet:
  value: 0x2400128
  commandIndex: 0x128
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_HierarchyChangeAuth:
  value: 0x2400129
  commandIndex: 0x129
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_NV_DefineSpace:
  value: 0x240012A
  commandIndex: 0x12a
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PCR_Allocate:
  value: 0x240012B
  commandIndex: 0x12b
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_SetPrimaryPolicy:
  value: 0x240012E
  commandIndex: 0x12e
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_ClockRateAdjust:
  value: 0x2000130
  commandIndex: 0x130
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_CreatePrimary:
  value: 0x12000131
  commandIndex: 0x131
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      1
  V:            0
  Res:          0x0
TPM2_CC_NV_Increment:
  value: 0x4400134
  commandIndex: 0x134
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_NV_SetBits:
  value: 0x4400135
  commandIndex: 0x135
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_NV_Extend:
  value: 0x4400136
  commandIndex: 0x136
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_NV_Write:
  value: 0x4400137
  commandIndex: 0x137
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_NV_WriteLock:
  value: 0x4400138
  commandIndex: 0x138
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_DictionaryAttackLockReset:
  value: 0x2400139
  commandIndex: 0x139
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_DictionaryAttackParameters:
  value: 0x240013A
  commandIndex: 0x13a
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_NV_ChangeAuth:
  value: 0x240013B
  commandIndex: 0x13b
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PCR_Event:
  value: 0x240013C
  commandIndex: 0x13c
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PCR_Reset:
  value: 0x240013D
  commandIndex: 0x13d
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_SequenceComplete:
  value: 0x300013E
  commandIndex: 0x13e
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      1
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_IncrementalSelfTest:
  value: 0x400142
  commandIndex: 0x142
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_SelfTest:
  value: 0x400143
  commandIndex: 0x143
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_Startup:
  value: 0x400144
  commandIndex: 0x144
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_Shutdown:
  value: 0x400145
  commandIndex: 0x145
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_StirRandom:
  value: 0x400146
  commandIndex: 0x146
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_ActivateCredential:
  value: 0x4000147
  commandIndex: 0x147
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_Certify:
  value: 0x4000148
  commandIndex: 0x148
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyNV:
  value: 0x6000149
  commandIndex: 0x149
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x3
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_CertifyCreation:
  value: 0x400014A
  commandIndex: 0x14a
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_Duplicate:
  value: 0x400014B
  commandIndex: 0x14b
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_GetSessionAuditDigest:
  value: 0x600014D
  commandIndex: 0x14d
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x3
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_NV_Read:
  value: 0x400014E
  commandIndex: 0x14e
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_NV_ReadLock:
  value: 0x400014F
  commandIndex: 0x14f
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_ObjectChangeAuth:
  value: 0x4000150
  commandIndex: 0x150
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicySecret:
  value: 0x4000151
  commandIndex: 0x151
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_Create:
  value: 0x2000153
  commandIndex: 0x153
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_ECDH_ZGen:
  value: 0x2000154
  commandIndex: 0x154
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_HMAC:
  value: 0x2000155
  commandIndex: 0x155
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_Import:
  value: 0x2000156
  commandIndex: 0x156
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_Load:
  value: 0x12000157
  commandIndex: 0x157
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      1
  V:            0
  Res:          0x0
TPM2_CC_Quote:
  value: 0x2000158
  commandIndex: 0x158
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_RSA_Decrypt:
  value: 0x2000159
  commandIndex: 0x159
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_HMAC_Start:
  value: 0x1200015B
  commandIndex: 0x15b
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      1
  V:            0
  Res:          0x0
TPM2_CC_SequenceUpdate:
  value: 0x200015C
  commandIndex: 0x15c
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_Sign:
  value: 0x200015D
  commandIndex: 0x15d
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_Unseal:
  value: 0x200015E
  commandIndex: 0x15e
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicySigned:
  value: 0x4000160
  commandIndex: 0x160
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_ContextLoad:
  value: 0x10000161
  commandIndex: 0x161
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      1
  V:            0
  Res:          0x0
TPM2_CC_ContextSave:
  value: 0x2000162
  commandIndex: 0x162
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_ECDH_KeyGen:
  value: 0x2000163
  commandIndex: 0x163
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_FlushContext:
  value: 0x165
  commandIndex: 0x165
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_LoadExternal:
  value: 0x10000167
  commandIndex: 0x167
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      1
  V:            0
  Res:          0x0
TPM2_CC_MakeCredential:
  value: 0x2000168
  commandIndex: 0x168
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_NV_ReadPublic:
  value: 0x2000169
  commandIndex: 0x169
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyAuthorize:
  value: 0x200016A
  commandIndex: 0x16a
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyAuthValue:
  value: 0x200016B
  commandIndex: 0x16b
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyCommandCode:
  value: 0x200016C
  commandIndex: 0x16c
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyCounterTimer:
  value: 0x200016D
  commandIndex: 0x16d
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyCpHash:
  value: 0x200016E
  commandIndex: 0x16e
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyLocality:
  value: 0x200016F
  commandIndex: 0x16f
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyNameHash:
  value: 0x2000170
  commandIndex: 0x170
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyOR:
  value: 0x2000171
  commandIndex: 0x171
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyTicket:
  value: 0x2000172
  commandIndex: 0x172
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_ReadPublic:
  value: 0x2000173
  commandIndex: 0x173
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_RSA_Encrypt:
  value: 0x2000174
  commandIndex: 0x174
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_StartAuthSession:
  value: 0x14000176
  commandIndex: 0x176
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x2
  rHandle:      1
  V:            0
  Res:          0x0
TPM2_CC_VerifySignature:
  value: 0x2000177
  commandIndex: 0x177
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_ECC_Parameters:
  value: 0x178
  commandIndex: 0x178
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_GetCapability:
  value: 0x17A
  commandIndex: 0x17a
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_GetRandom:
  value: 0x17B
  commandIndex: 0x17b
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_GetTestResult:
  value: 0x17C
  commandIndex: 0x17c
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_Hash:
  value: 0x17D
  commandIndex: 0x17d
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PCR_Read:
  value: 0x17E
  commandIndex: 0x17e
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyPCR:
  value: 0x200017F
  commandIndex: 0x17f
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyRestart:
  value: 0x2000180
  commandIndex: 0x180
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_ReadClock:
  value: 0x181
  commandIndex: 0x181
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PCR_Extend:
  value: 0x2400182
  commandIndex: 0x182
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_EventSequenceComplete:
  value: 0x5400185
  commandIndex: 0x185
  reserved1:    0x0
  nv:           1
  extensive:    0
  flushed:      1
  cHandles:     0x2
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_HashSequenceStart:
  value: 0x10000186
  commandIndex: 0x186
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      1
  V:            0
  Res:          0x0
TPM2_CC_PolicyDuplicationSelect:
  value: 0x2000188
  commandIndex: 0x188
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyGetDigest:
  value: 0x2000189
  commandIndex: 0x189
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_TestParms:
  value: 0x18A
  commandIndex: 0x18a
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x0
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_Commit:
  value: 0x200018B
  commandIndex: 0x18b
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyPassword:
  value: 0x200018C
  commandIndex: 0x18c
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_PolicyNvWritten:
  value: 0x200018F
  commandIndex: 0x18f
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            0
  Res:          0x0
TPM2_CC_FieldUpgradeStart:
  value: 0x2200012F
  commandIndex: 0x12f
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            1
  Res:          0x0
0x22000400:
  value: 0x22000400
  commandIndex: 0x400
  reserved1:    0x0
  nv:           0
  extensive:    0
  flushed:      0
  cHandles:     0x1
  rHandle:      0
  V:            1
  Res:          0x0
tpm2_getcap pcrs
selected-pcrs:
  - sha1: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
17, 18, 19, 20, 21, 22, 23 ]
  - sha256: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
16, 17, 18, 19, 20, 21, 22, 23 ]
tpm2_getcap properties-fixed
TPM2_PT_FAMILY_INDICATOR:
  raw: 0x322E3000
  value: "2.0"
TPM2_PT_LEVEL:
  raw: 0
TPM2_PT_REVISION:
  value: 1.16
TPM2_PT_DAY_OF_YEAR:
  raw: 0xF
TPM2_PT_YEAR:
  raw: 0x7E0
TPM2_PT_MANUFACTURER:
  raw: 0x49465800
  value: "IFX"
TPM2_PT_VENDOR_STRING_1:
  raw: 0x534C4239
  value: "SLB9"
TPM2_PT_VENDOR_STRING_2:
  raw: 0x36363500
  value: "665"
TPM2_PT_VENDOR_STRING_3:
  raw: 0x0
  value: ""
TPM2_PT_VENDOR_STRING_4:
  raw: 0x0
  value: ""
TPM2_PT_VENDOR_TPM_TYPE:
  raw: 0x0
TPM2_PT_FIRMWARE_VERSION_1:
  raw: 0x5003E
TPM2_PT_FIRMWARE_VERSION_2:
  raw: 0xC3600
TPM2_PT_INPUT_BUFFER:
  raw: 0x400
TPM2_PT_HR_TRANSIENT_MIN:
  raw: 0x3
TPM2_PT_HR_PERSISTENT_MIN:
  raw: 0x7
TPM2_PT_HR_LOADED_MIN:
  raw: 0x3
TPM2_PT_ACTIVE_SESSIONS_MAX:
  raw: 0x40
TPM2_PT_PCR_COUNT:
  raw: 0x18
TPM2_PT_PCR_SELECT_MIN:
  raw: 0x3
TPM2_PT_CONTEXT_GAP_MAX:
  raw: 0xFFFF
TPM2_PT_NV_COUNTERS_MAX:
  raw: 0x8
TPM2_PT_NV_INDEX_MAX:
  raw: 0x680
TPM2_PT_MEMORY:
  raw: 0x6
TPM2_PT_CLOCK_UPDATE:
  raw: 0x80000
TPM2_PT_CONTEXT_HASH:
  raw: 0xB
TPM2_PT_CONTEXT_SYM:
  raw: 0x6
TPM2_PT_CONTEXT_SYM_SIZE:
  raw: 0x80
TPM2_PT_ORDERLY_COUNT:
  raw: 0xFF
TPM2_PT_MAX_COMMAND_SIZE:
  raw: 0x500
TPM2_PT_MAX_RESPONSE_SIZE:
  raw: 0x500
TPM2_PT_MAX_DIGEST:
  raw: 0x20
TPM2_PT_MAX_OBJECT_CONTEXT:
  raw: 0x3B8
TPM2_PT_MAX_SESSION_CONTEXT:
  raw: 0xEB
TPM2_PT_PS_FAMILY_INDICATOR:
  raw: 0x1
TPM2_PT_PS_LEVEL:
  raw: 0x0
TPM2_PT_PS_REVISION:
  raw: 0x100
TPM2_PT_PS_DAY_OF_YEAR:
  raw: 0x0
TPM2_PT_PS_YEAR:
  raw: 0x0
TPM2_PT_SPLIT_MAX:
  raw: 0x80
TPM2_PT_TOTAL_COMMANDS:
  raw: 0x5B
TPM2_PT_LIBRARY_COMMANDS:
  raw: 0x59
TPM2_PT_VENDOR_COMMANDS:
  raw: 0x2
TPM2_PT_NV_BUFFER_MAX:
  raw: 0x300
tpm2_getcap properties-variable
TPM2_PT_PERSISTENT:
  ownerAuthSet:              0
  endorsementAuthSet:        0
  lockoutAuthSet:            0
  reserved1:                 0
  disableClear:              0
  inLockout:                 0
  tpmGeneratedEPS:           0
  reserved2:                 0
TPM2_PT_STARTUP_CLEAR:
  phEnable:                  1
  shEnable:                  1
  ehEnable:                  1
  phEnableNV:                1
  reserved1:                 0
  orderly:                   1
TPM2_PT_HR_NV_INDEX: 0x2
TPM2_PT_HR_LOADED: 0x0
TPM2_PT_HR_LOADED_AVAIL: 0x3
TPM2_PT_HR_ACTIVE: 0x0
TPM2_PT_HR_ACTIVE_AVAIL: 0x40
TPM2_PT_HR_TRANSIENT_AVAIL: 0x3
TPM2_PT_HR_PERSISTENT: 0x0
TPM2_PT_HR_PERSISTENT_AVAIL: 0x12
TPM2_PT_NV_COUNTERS: 0x0
TPM2_PT_NV_COUNTERS_AVAIL: 0xD
TPM2_PT_ALGORITHM_SET: 0x0
TPM2_PT_LOADED_CURVES: 0x2
TPM2_PT_LOCKOUT_COUNTER: 0x0
TPM2_PT_MAX_AUTH_FAIL: 0x20
TPM2_PT_LOCKOUT_INTERVAL: 0x1C20
TPM2_PT_LOCKOUT_RECOVERY: 0x15180
TPM2_PT_AUDIT_COUNTER_0: 0x0
TPM2_PT_AUDIT_COUNTER_1: 0x0
tpm2_getcap ecc-curves
TPM2_ECC_NIST_P256: 0x3
TPM2_ECC_BN_P256: 0x10
tpm2_getcap handles-transient
tpm2_getcap handles-persistent
tpm2_getcap handles-permanent
- 0x40000001
- 0x40000007
- 0x40000009
- 0x4000000A
- 0x4000000B
- 0x4000000C
- 0x4000000D
tpm2_getcap handles-pcr
- 0x0
- 0x1
- 0x2
- 0x3
- 0x4
- 0x5
- 0x6
- 0x7
- 0x8
- 0x9
- 0xA
- 0xB
- 0xC
- 0xD
- 0xE
- 0xF
- 0x10
- 0x11
- 0x12
- 0x13
- 0x14
- 0x15
- 0x16
- 0x17
tpm2_getcap handles-nv-index
- 0x1C00002
- 0x1C0000A
tpm2_getcap handles-loaded-session
tpm2_getcap handles-saved-session
--===============3039165195337914405==--

