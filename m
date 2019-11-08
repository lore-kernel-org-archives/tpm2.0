Content-Type: multipart/mixed; boundary="===============3923677105058781871=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Release notice: tpm2-tools 4.1-rc0
Date: Fri, 08 Nov 2019 11:52:25 -0800
Message-ID: <CAOCvsSkp8UOrdrMEv-9+Jg62p+pWGaEfzWF3UeSfFYg0sWKztQ@mail.gmail.com>
In-Reply-To: 688D07BB9E3A9E4A852BA1336D1910FF967EEAE9@fmsmsx104.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3923677105058781871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I needed this fix to build ia32 packages, I think it's right but I'm
unlear if I met the original intent:
Also setting a counter NV index and then attempting to use
tpm2_policynv to compare it crashes my TPM (code 0x101).
I can't even flush my session file until I've rebooted.

---
 lib/tpm2_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tpm2_util.c b/lib/tpm2_util.c
index d8d3855a..69c9811b 100644
--- a/lib/tpm2_util.c
+++ b/lib/tpm2_util.c
@@ -165,7 +165,7 @@ bool tpm2_util_string_to_int32(const char *str,
int32_t *value) {
     /* clear errno before the call, should be 0 afterwards */
     errno =3D 0;
     signed long int tmp =3D strtol(str, &endptr, 0);
-    if (errno || tmp > UINT32_MAX) {
+    if (errno || tmp > INT32_MAX) {
         return false;
     }
--===============3923677105058781871==--

