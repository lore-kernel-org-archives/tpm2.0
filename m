Content-Type: multipart/mixed; boundary="===============8372544485429153267=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: CMP error: cannot duplicate context:2306 tpm:warn(2.0):
 out of memory for object contexts
Date: Tue, 12 Oct 2021 20:09:15 +0000
Message-ID: <SN6PR11MB3437FA7C3AFE75B0148E66E5B8B69@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20211008184442.5F056E84@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8372544485429153267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> From: Petr Gotthard <petr.gotthard(a)centrum.cz>
> Sent: Friday, October 8, 2021 11:44 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; Chris Newman <chr=
is(a)mode51.software>; tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> Subject: Re: [tpm2] Re: CMP error: cannot duplicate context:2306 tpm:warn=
(2.0): out of memory for object contexts =

=C2=A0
> Bill,
> we solved this particular issue, but I expect more resource-related troub=
les are yet to come.

Oh, how exciting :-p
=C2=A0
> Example 1: OpenSSL often duplicates hash sequences: To hash sequences A,B=
,C1 and then A,B,C2 they first hash A,B, then duplicate/fork the hash seque=
nce and then complete the hash first for C1 and then for C2. This is a grea=
t performance optimization, but when too many dup (forks) are made, the TPM=
 runs out of objects.
=C2=A0
Why are we doing hashing with the TPM? If we're in an OpenSSL provider cant=
 we just use software provided hashing routines? I see hashing is configura=
ble, but I would imagine off be default is what you want. Do we use validat=
ion tickets or anything like that or just the resulting digest? If all we u=
se are the digests, I would make TPM not hash and make that option a nop.

> Example 2: The CMP key update needs 4 objects to operate (old client key,=
 new client key, server key and hash sequence), but the kernel RM (tpm_spac=
e.context_tbl) allows only 3 objects. (If I am right.)
=C2=A0
It does seem that way, but TPM commands only ever need 3 objects alive at o=
nce, so that's likely why that was chosen.

https://github.com/torvalds/linux/commit/6c4e79d99e6f42b79040f1a33cd4018f54=
25030b#diff-7c47a49cbd705c6edb19c967c22c296f00d2391a3483ba849097e908c6513585

Does CMP key really need all 4 of those things in the TPM at once, because =
currently today that's not actually happening as abrmd is just swapping the=
m in and out.
Also, doesn't CMP use public objects (x509 certs) for some of it?

Looking at the code here:
  - https://github.com/tpm2-software/tpm2-openssl/blob/34c62521a359455b6c4c=
2bdf6b4e5e149b1a39ba/test/rsa_genpkey_x509_cmp.sh#L41

Are public key operations implemented in software? In tpm2-pkcs11 we implem=
ent them in software and hash in software and I have yet to have someone hi=
t a limit but perhaps they are all using abrmd but I thought some were usin=
g in-kernel RM.

> In general, the OpenSSL code often pre-loads or caches objects, which wil=
l be used later, which causes troubles with the space-constrained TPM. I wa=
s not sure whether the tpm2-openssl provider should act as another level of=
 a resource manager and swap the objects to simulate more space than availa=
ble on the TPM hardware, or whether this is something the resource manager =
could/should do.

It's something the RM should do, but the in-kernel RM will always be tightl=
y constrained by the amount of kernel memory space it can swap to. I wonder=
 if we could give it a real swap space :-p

> It's definitely a nice problem to think about and most likely something w=
hich will need to be addressed in the tpm2-openssl 2.0
=C2=A0
=C2=A0
Petr

______________________________________________________________
> Od: "Roberts, William C" <william.c.roberts(a)intel.com>
> Komu: "Chris Newman" <chris(a)mode51.software>, "tpm2(a)lists.01.org" <tp=
m2(a)lists.01.org>, "Petr Gotthard" <petr.gotthard(a)centrum.cz>
> Datum: 08.10.2021 17:46
> P=C5=99edm=C4=9Bt: [tpm2] Re: CMP error: cannot duplicate context:2306 tp=
m:warn(2.0): out of memory for object contexts
>
Thats:
tpm2_rc_decode 0x00000902
tpm:warn(2.0): out of memory for object contexts
Are you running against a resource manager? You should probably either use =
/dev/tpmrm0 or tpm2-abrmd.
You can set the TCTI via the=C2=A0TPM2OPENSSL_TCTI which AFAICT takes strin=
gs like tpm2-tools, so something like:
"device:/dev/tpmrm0" or "abrmd".

This also might be a bug, the provider is pretty new. Petr any other ideas =
I am missing?

Bill


From: Chris Newman <chris(a)mode51.software>
Sent: Sunday, October 3, 2021 6:40 PM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] CMP error: cannot duplicate context:2306 tpm:warn(2.0): out=
 of memory for object contexts =

=C2=A0
Hi,
I create an EK and AK using tpm2_createek, tpm2_createak and tpm2_evictcont=
rol to persist the AK in 0x81010002. The I use the following command with D=
igiCert's CMPv2 server:
openssl cmp -config /opt/sdk/openssl/current/ssl/openssl.cnf -provider tpm2=
 -provider default -propquery ?provider=3Dtpm2,tpm2.digest!=3Dyes -cmd ir -=
server https://demo.one.digicert.com/iot/api/v1/cmp/IOT_1234 -ref 1234 -sec=
ret pass:1234 -recipient "/CN=3Dmode51.software" -key handle:0x81010002 -su=
bject "/CN=3DTestTest" -cacertsout ./capubs.pem -certout ./cl_cert.pem -tls=
_used -verbosity 8
I get the following error:
DIGEST NEW
DIGEST INIT
DIGEST UPDATE
DIGEST DUP
DIGEST FINAL
DIGEST FREE
DIGEST NEW
DIGEST INIT
DIGEST UPDATE
DIGEST NEW
DIGEST INIT
DIGEST UPDATE
DIGEST DUP
WARNING:esys:src/tss2-esys/api/Esys_ContextLoad.c:279:Esys_ContextLoad_Fini=
sh() Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_ContextLoad.c:93:Esys_ContextLoad() Esys =
Finish ErrorCode (0x00000902)
DIGEST FREE
DIGEST FREE
DIGEST FREE
CMP DEBUG: disconnected from CMP server
CMP error: cannot duplicate context:2306 tpm:warn(2.0): out of memory for o=
bject contexts
CMP error: not able to copy ctx
CMP error: internal error
CMP error: error sending
CMP error: shutdown while in init
CMP error: transfer error:request sent: IR, expected response: IP
RSA FREE
RAND FREE
RAND FREE
RAND FREE
PROVIDER TEARDOWN
=C2=A0
I've tried tpm2_flushcontext -t.
I recompiled tpm2-openssl with the following option and that appears to hav=
e worked around the issue:
--disable-op-digest
Is this what "?provider=3Dtpm2,tpm2.digest!=3Dyes" should effectively do?
=C2=A0
-- =


Chris Newman =

https://mode51.software =

@mode51software
--===============8372544485429153267==--

