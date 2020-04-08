Content-Type: multipart/mixed; boundary="===============3534535686473881319=="
MIME-Version: 1.0
From: muthu.smk at gmail.com
Subject: [tpm2] How to use tpm2_getrandom() as API and create a C library
Date: Wed, 08 Apr 2020 18:26:35 +0000
Message-ID: <20200408182635.2799.81092@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3534535686473881319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As a continuation of below thread , and suggested by @williamcroberts here =
i am sharing my observation on feedback shared by @willams
https://github.com/tpm2-software/tpm2-tools/issues/1971 =


Thanks a lot @williamcroberts for your quick response. Regarding your sampl=
e code , i cant able to use linux 'system' API or popen call to trigger the=
 executable. Basically its an limitation for me to use these two methods in=
side my aplication.

Coming to the below 3 methods , it was quite interesting and i have tried l=
ast two (Esys_GenRandom and Fapi_GetRandom() i could able to link it to my =
app with respective library and my application is compiled properly . But w=
hen i try to run it , am getting 'context' set with NULL (refer below error=
 log for more info) . Can you please guide me how and what to fill in the '=
context' argument .

ERROR:fapi:src/tss2-fapi/api/Fapi_GetRandom.c:66:Fapi_GetRandom() context i=
s NULL: BAD_REFERENCE
Get Random Number got Failed , the reason has been shared below
Failure reason : context or data is NULL

(good) Tss2_Sys_GetRandom
(better) Esys_GetRandom
(best) Fapi_GetRandom
--===============3534535686473881319==--

