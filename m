Content-Type: multipart/mixed; boundary="===============4204431265490361226=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE] tpm2-tools: 4.3.0
Date: Fri, 28 Aug 2020 14:45:30 +0000
Message-ID: <SN6PR11MB3437B56514C3E94E9E0CFA0DB8520@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4204431265490361226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce the release of tpm2-tools version 4.3.0 with the f=
ollowing changelog:

### 4.3.0 - 2020-08-24

 * tss2_*: Fix double-free errors in commands asking for password authoriza=
tion

 * tss2_*: Fix shorthand command -f that was falsely requiring an argument

 * tss2_*: Update tss2_encrypt to the new FAPI interface
   - The argument 'policyPath' is removed which was never read anyway

 * tss2_*: Remove the additional '\n' that was appended when redirecting to=
 stdout

 * tss2_*: Update mandatory vs optional treatment of arguments according to=
 latest Fapi spec

 * tss2_*: tss2_getinfo now retrieves the correct FAPI version from Fapi_Ge=
tInfo

 * tss2_*: Fix the error handling in case of multiple inputs and/or outputs=
 from stdin/stdout

 * tss2_*: Fix syntax errors and update content of man pages according to l=
atest Fapi spec

 * tss2_*: Add parameter types to all man page

 * tss2_*: tss2_setappdata now reads from file or stdin allowing to store a=
lso binary data

 * tss2_*: Memory leaks are fixed in cases when a returned empty non-char o=
utput value was passed to file output

 * tss2_pcrextend: fix extending PCR 0

 * tss2_quote: fix unused TSS2_RC in LOG_ERR


The release can be found here:
https://github.com/tpm2-software/tpm2-tools/releases/tag/4.3.0

Bill
--===============4204431265490361226==--

