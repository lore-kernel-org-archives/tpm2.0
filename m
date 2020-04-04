Content-Type: multipart/mixed; boundary="===============5408051955569503232=="
MIME-Version: 1.0
From: John S <sedigj at gmail.com>
Subject: [tpm2] Protecting symmetric keys / symmetric algorithms
Date: Sat, 04 Apr 2020 21:44:37 +0000
Message-ID: <20200404214437.2692.62906@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5408051955569503232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Other questions for which I am hopeful folks here can give some guidance on.

A little background on context/use cases. My Linux device which has the TPM=
2.0 on it, will be participating in communication protocols with other devi=
ces on the network. Think user-less, embedded devices and protocols. The di=
fferent devices will be performing key agreement and then authenticating th=
eir communication messages. =

We expect to involve CMAC for both key derivation and also MACing the messa=
ges, which is using AES128 keys. We are familiar with CMAC and other device=
s have support for this already.

In general too, having AES encypt/decrypt is useful for a wide variety of u=
se cases.

The problem: =

It appears my TPM2.0 device does not have support for symmetric operations.=
 Reading other threads here indicates only a minority of TPM2.0 devices do =
have symmetric support.
I can see how I can involve the TPM to share secrets between devices on the=
 network in a trusted and secure way. But once the TPM decrypts the secret =
(using asymmetric), what are my options for hardware protection of my AES k=
eys? I guess they can be encrypted at rest / until time of use by a TPM key=
. But when they're actually in use it seems I'm stuck with them in software=
.  =

Any other ideas I'm not thinking of?

-----Behavior on my specific TPM----
--I concluded my tpm does not support symmetric because these sequences hav=
e failed:

tpm2_getcap commands : output has nothing to do with 'sym' or 'aes'

tpm2_createprimary -Grsa2048:aes128cfb -C o -c parent.ctx
dd if=3D/dev/urandom of=3Dsym.key bs=3D1 count=3D16
tpm2_import -C parent.ctx -i sym.key -u key.pub -r key.priv -G aes
WARNING:esys:src/tss2-esys/api/Esys_Import.c:323:Esys_Import_Finish() Recei=
ved TPM Error
ERROR:esys:src/tss2-esys/api/Esys_Import.c:110:Esys_Import() Esys Finish Er=
rorCode (0x000002c9)
ERROR: Esys_HMAC(0x2C9) - tpm:parameter(2):mode of operation not supported
ERROR: Unable to run tpm2_import

tpm2_createprimary -o primary.ctx
tpm2_create -C primary.ctx -Ghmac -c hmac.key
WARNING:esys:src/tss2-esys/api/Esys_CreateLoaded.c:355:Esys_CreateLoaded_Fi=
nish() Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_CreateLoaded.c:129:Esys_CreateLoaded() Es=
ys Finish ErrorCode (0x000b0143)
ERROR: Esys_CreateLoaded(0xB0143) - rmt:error(2.0): command code not suppor=
ted

--From tpm2_getcap algorithms, I see I have:
aes, hmac, and cfb which all indicate they are symmetric.
But I have no way to use them? (They are just for tpm sessions?)

--From tpm2_getcap algorithms, I see 2 of my algorithms are:
kdf1_sp800_56a
kdf1_sp800_108
Both are noted as type 'hash'. =

Would I use tpm2_hash to use these? If so, how would the key for the kdf be=
 provided?

Thanks much in advance,
-John
--===============5408051955569503232==--

