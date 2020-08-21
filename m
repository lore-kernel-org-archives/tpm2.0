Content-Type: multipart/mixed; boundary="===============6800948211311450909=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-tools: 4.3.0-rc1
Date: Fri, 21 Aug 2020 18:03:23 +0000
Message-ID: <SN6PR11MB3437DAA254F7A5B326F2A198B85B0@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6800948211311450909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce tpm2-tools release candidate 4.3.0-rc1 with the fo=
llowing changes over rc0:
With the following changes between rc0:

tss2_pcrextend: fix extending PCR 0

tss2_quote: fix unused TSS2_RC in LOG_ERR

With the full changelog being:

4.3.0-rc1 - 2020-08-21
tss2_*: Fix double-free errors in commands asking for password authorization

tss2_*: Fix shorthand command -f that was falsely requiring an argument

tss2_*: Update tss2_encrypt to the new FAPI interface

The argument 'policyPath' is removed which was never read anyway
tss2_*: Remove the additional '\n' that was appended when redirecting to st=
dout

tss2_*: Update mandatory vs optional treatment of arguments according to la=
test Fapi spec

tss2_*: tss2_getinfo now retrieves the correct FAPI version from Fapi_GetIn=
fo

tss2_*: Fix the error handling in case of multiple inputs and/or outputs fr=
om stdin/stdout

tss2_*: Fix syntax errors and update content of man pages according to late=
st Fapi spec

tss2_*: Add parameter types to all man page

tss2_*: tss2_setappdata now reads from file or stdin allowing to store also=
 binary data

tss2_*: Memory leaks are fixed in cases when a returned empty non-char outp=
ut value was passed to file output

tss2_pcrextend: fix extending PCR 0

tss2_quote: fix unused TSS2_RC in LOG_ERR

The release can be found here:
https://github.com/tpm2-software/tpm2-tools/releases/tag/4.3.0-rc1

Thanks,
Bill
--===============6800948211311450909==--

