Content-Type: multipart/mixed; boundary="===============0904612922079639374=="
MIME-Version: 1.0
From: Yasuhiro Hosoda <hosoda-yasuhiro at ntt-el.com>
Subject: [tpm2] tpm2-tss question
Date: Mon, 23 Jul 2018 13:44:43 +0900
Message-ID: <51a65cc4-ae2f-a776-66af-2486c4491ad8@ntt-el.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D010EB03568@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0904612922079639374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I found one problem about the TPM Dictionary Attack Lock mechanism.

I executed the following command sequence to check the functionality of =

DictionaryAttackLockReset.

(1) DictionaryAttackLockReset (right authValue) , rval=3D0

(2) DictionaryAttackParameters=C2=A0 (wrong authValue), rval=3D98e

(3) DictionaryAttackParameters=C2=A0 (right authValue), rval=3D921

<StartAuthSession(Policy)>

<Compute Policy>

(4) DictionaryAttackLockReset=C2=A0 (lockoutPolicy), rval=3D0

(5) DictionaryAttackLockReset=C2=A0 (right authValue), rval=3D921

 From the following document

"TCG Library Specification 1.38 Part1 19.8.5 Authorization Failures =

Involving lockoutAuth"

 >>When in this special lockout state, the TPM will not allow use of =

lockoutAuth. The TPM will exit this state when =

TPM2_DictionaryAttackLockReset() is used with a successful lockoutPolicy =

or after the TPM is powered for a configurable time period =

(lockoutRecovery).

I assume that in (1) and (5), the result will be the same.
However, different return codes is produced

I would like to know why they are different..

-----
 =C2=A0Yasuhiro Hosoda

NTT Electronics Corporation =EF=BC=88NEL)

--===============0904612922079639374==--

