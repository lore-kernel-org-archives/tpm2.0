Content-Type: multipart/mixed; boundary="===============0163061737229718843=="
MIME-Version: 1.0
From: Zhao, Shirley <shirley.zhao at intel.com>
Subject: [tpm2] The script of make credential met error
Date: Tue, 12 May 2020 09:30:51 +0000
Message-ID: <BL0PR11MB3252980F41F3066E3938FEEA8DBE0@BL0PR11MB3252.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0163061737229718843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, all, =


Met the following error when running make credential script as below: =

$ tpm2_createek -c 0x81010009 -G rsa -u ek.pub --tcti=3Dmssim
$ tpm2_getcap handles-persistent --tcti=3Dmssim
- 0x81010009
$ tpm2_getcap handles-transient --tcti=3Dmssim
$ tpm2_createak -C 0x81010009 -c ak.ctx -G rsa -g sha256 -s rsassa -u ak.pu=
b -n ak.name --tcti=3Dmssim
loaded-key:
  name: 000b57d43d757f62362402a6d473f622a28916b8289ef49dc2e52daf13174a2c9e7e
$ tpm2_getcap handles-persistent --tcti=3Dmssim
- 0x81010009
$ tpm2_getcap handles-transient --tcti=3Dmssim
- 0x80000001
$ echo 12345678 > secret.data
$ tpm2_makecredential -e ek.pub -s secret.data -n 000b57d43d757f62362402a6d=
473f622a28916b8289ef49dc2e52daf13174a2c9e7e -o mkcred.out --tcti=3Dmssim
ERROR:esys:src/tss2-esys/esys_iutil.c:389:iesys_handle_to_tpm_handle() Erro=
r: Esys invalid ESAPI handle (40000007).
ERROR:esys:src/tss2-esys/api/Esys_LoadExternal.c:85:Esys_LoadExternal() Err=
or in async function ErrorCode (0x0007000b)
ERROR: Esys_LoadExternal(0x7000B) - esapi:A parameter has a bad value
ERROR: Unable to run tpm2_makecredential

The script is from tpm2-tools/test/integration/tests/Activecredential.sh. =

Please help check. =

Thanks. =


- Shirley=20
--===============0163061737229718843==--

