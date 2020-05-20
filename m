Content-Type: multipart/mixed; boundary="===============3249047788803950613=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] trying duplication and then rsa_en/decrypt
Date: Tue, 19 May 2020 18:09:32 -0700
Message-ID: <cc54ff02-467f-e5a0-9a93-3b2470de3533@oracle.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3249047788803950613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Folks,

Sorry for what is probably an obvious question ...

I tried the examples in the tpm2_duplicate(1) and =

tpm2_policyduplicationselect(1) man pages. Afterwards, I just wanted to =

try out the duplicated keys. So I tried tpm2_rsaencrypt followed by =

tpm2_rsadecrypt. But when doing the latter, I got:

WARNING:esys:src/tss2-esys/api/Esys_RSA_Decrypt.c:305:Esys_RSA_Decrypt_Fini=
sh() =

Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_RSA_Decrypt.c:102:Esys_RSA_Decrypt() =

Esys Finish ErrorCode (0x0000012f)
ERROR: Esys_RSA_Decrypt(0x12F) - tpm:error(2.0): authValue or authPolicy =

is not available for selected entity
ERROR: Unable to run tpm2_rsadecrypt


Which I guess means I didn't satisfy the policy for the object. But if I =

try to run tpm2_startauthsession like those man page examples show, I =

get this error:

WARNING:esys:src/tss2-esys/api/Esys_RSA_Decrypt.c:305:Esys_RSA_Decrypt_Fini=
sh() =

Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_RSA_Decrypt.c:102:Esys_RSA_Decrypt() =

Esys Finish ErrorCode (0x000009a4)
ERROR: Esys_RSA_Decrypt(0x9A4) - tpm:session(1):the commandCode in the =

policy is not the commandCode of the command or the command code in a =

policy command references a command that is not implemented
ERROR: Unable to run tpm2_rsadecrypt


And so, I am confused now about what I need to do to get these =

duplicated keys to work with tpm2_rsadecrypt.


Thanks,
-ted



-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============3249047788803950613==--

