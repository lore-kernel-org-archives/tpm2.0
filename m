Content-Type: multipart/mixed; boundary="===============6766578104203358872=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: Error running tpm2_create: magic does not match!
Date: Wed, 02 Oct 2019 08:56:19 -0700
Message-ID: <7ce75601-b3d5-7d64-a720-50d798aae9e3@intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E0FDBA@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6766578104203358872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/2/19 7:16 AM, Roberts, William C wrote:
>> wait.. i should be doing "negmagic" and not -negmagic in the function ca=
ll! Maybe
>> that the cause of the bug!
> Yeah -- would make it positive and you would seek too far.
> =

> I'm not sure though why you have some unsigned issue on windows, fseek ta=
kes a long which is signed.

To avoid dealing with a negative offset you could do something like this:

diff --git a/lib/files.c b/lib/files.c
index d45ead87..9da1543a 100644
--- a/lib/files.c
+++ b/lib/files.c
@@ -335,7 +335,7 @@ static bool check_magic(FILE *fstream, bool seek_reset)=
 {
     bool match =3D magic =3D=3D MAGIC;
 =

     if (seek_reset) {
-        int rc =3D fseek(fstream, -sizeof(magic), SEEK_CUR);
+        int rc =3D fseek(fstream, ftell(fstream) - sizeof(magic), SEEK_SET=
);
         if (rc !=3D 0) {
             LOG_ERR("fseek failed: %s", strerror(errno));
             return false;
  =


-- =

Tadeusz
--===============6766578104203358872==--

