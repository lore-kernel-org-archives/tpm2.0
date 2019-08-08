Content-Type: multipart/mixed; boundary="===============2343194735542536936=="
MIME-Version: 1.0
From: Zhu, Bing <bing.zhu at intel.com>
Subject: [tpm2] how to upgrade the TPM access control policy when a particular
 PCR is changed.
Date: Thu, 08 Aug 2019 05:49:26 +0000
Message-ID: <A3DEEEBB19900C48B49572CB9C2891C98791046B@SHSMSX108.ccr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2343194735542536936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I have a use case like this: =


We create a TPM2.0 NV index, provision a secret into that NV index in TPM, =
and gate its access control with PCR[7] policy, which means that only when =
PCR[7] value matches the expected value, the read access to this NV index i=
s allowed. =


In a PC compliant machine, PCR[7] is used by BIOS to extend Secure Boot pol=
icies/configurations, and verification public key db settings (PK, KEK, DB/=
DBx). The reason that we do it like this because we would like to set acces=
s control to the secret value stored in that NV index. When someone (attack=
er) is going to disable secure boot, then PCR[7] value changes and doesn't =
match the value that the original policy was created on that NV index, then=
 accessing to that secret value will be denied. This is expected behavior t=
hat I want.

Now the problem is that when secure boot configurations (like DB/DBx) are c=
hanged due to OS software upgrade, the PCR[7] will be changed too, then acc=
ess to that secret in NV index will be denied too. =


So we'd like to figure out how to upgrade the associated PCR[7] policy on t=
hat NV Index, in order to make sure the access to this NV index is still be=
 available after upgrade (because this is a legitimate upgrade usage).

we don't know how exactly to do that although I'm aware of that the API TPM=
2_PolicyAuthorize() would probably do this. However, I didn't see anyone wh=
o ever did this before somewhere. =


So is this possible for someone to implement this as a sample in TPM usage?=
 Just give me a clue to do that, then we can contribute it.

Any comment is appreciated! Thanks.


Bing


--===============2343194735542536936==--

