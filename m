Content-Type: multipart/mixed; boundary="===============5394044150713014052=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-tools 4.3.0-rc0
Date: Thu, 13 Aug 2020 17:03:45 +0000
Message-ID: <DM6PR11MB343470E04FF0A83A14DE39C5B8430@DM6PR11MB3434.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5394044150713014052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce tpm2-tools release 4.3.0-rc0, with the following c=
hangelog:
4.3.0-rc0 - 2020-08-13

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

The release can be found here:
  - https://github.com/tpm2-software/tpm2-tools/releases/tag/4.3.0-rc0

Bill

--===============5394044150713014052==--

