Content-Type: multipart/mixed; boundary="===============5522853172842217008=="
MIME-Version: 1.0
From: s.schwebel at uvensys.de
Subject: [tpm2] tpm2-pkcs11 and certificates, also Linux Networking
Date: Thu, 16 Jan 2020 11:51:39 +0000
Message-ID: <20200116115139.2574.47204@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5522853172842217008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello again,

Ive been trying for some time now to get this Linux machine to connect to a=
 802.1 Network, that is client certificates

As far as I can tell, that means using PKCS11, that seems to be supported i=
n wpa_suplicant at least.

Ive found a version of NetworkManager that seems to access TPM2 via tpm2-ts=
s -> https://gitlab.freedesktop.org/apatard/NetworkManager
but I cannot provided a custom build Networkmanager for users.

So, I try to use pcks11, which works fine up to the point where I have to i=
mport the signed cert into the store.
I think I need to do that, at least.

My steps:
1) create store =

tpm2_ptool init

2) create token
tpm2_ptool addtoken --pid=3D1 --label=3Dsoveryimportant --sopin=3D123123 --=
userpin=3D456456

Now, I can create Keys and I tested pretty much any way I know of
3) create key
tpm2_ptool addkey --label=3Dsoveryimportant --userpin=3D456456 --algorithm=
=3Drsa2048
p11tool --login --generate-rsa --bits=3D2048 --label=3Dsoveryimportant "pkc=
s11:model=3D;manufacturer=3DSTMicro;serial=3D0000000000000000;token=3Dsover=
yimportant"

and whatever the syntax of pkcs11-tool is, I tried that as well

I can generate a CSR just fine
openssl req -new -engine pkcs11 -keyform engine -key "$url" -out cert.csr


Adding the cert fails in a million ways:

tpm2pkcs11-tool -w hardware.crt  -y cert
Using slot 0 with a present token (0x1)
error: PKCS11 function C_CreateObject failed: rv =3D CKR_FUNCTION_NOT_SUPPO=
RTED (0x54)

p11tool just hangs..
 p11tool --login --write "pkcs11:model=3D;manufacturer=3DSTMicro;serial=3D0=
000000000000000;token=3Dsoveryimortant"  --load-certificate hardware.crt --=
label "soveryimportant"


/tpm2_ptool addcert --label soveryimportant --key-id  "f2:be:d0:ab:c3:81:72=
:8a:b5:40:69:31:d1:38:28:8c:9d:bb:ee:9e" /home/steffenschwebel/Projects/PKI=
_network/hardware.crt =


Traceback (most recent call last):                                         =
                                                                           =
                                                =

  File "/usr/lib/python3/dist-packages/pyasn1/type/constraint.py", line 32,=
 in __call__                                                               =
                                                =

    self._testValue(value, idx)                                            =
                                                                           =
                                                =

  File "/usr/lib/python3/dist-packages/pyasn1/type/constraint.py", line 297=
, in _testValue                                                            =
                                                =

    raise error.ValueConstraintError(value)                                =
                                                                           =
                                                =

pyasn1.type.error.ValueConstraintError: Extensions:



Any help?
I'll now try to get it working without having the cert in the store, only t=
he key

regards,
Steffen Schwebel
--===============5522853172842217008==--

