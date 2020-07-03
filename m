Content-Type: multipart/mixed; boundary="===============1580128084251745156=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] tpm2_createak fails. Error code: 0x184. Reboot doesn't help!
Date: Fri, 03 Jul 2020 18:55:48 +0000
Message-ID: <20200703185548.2663.46334@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1580128084251745156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Could anyone help me take a look at this issue?
I am not able to create an AIK. Even if I reboot the host, still getting th=
e same issue.


[root(a)myhost ~/tpm]# tpm2_getcap handles-persistent
- 0x81010001


[root(a)myhost ~/tpm/]# tpm2_createak -C 0x81010001 -c ak.ctx -u ak.pub -r =
ak.priv -n ak.name -P <PWD>
loaded-key:
  name: 000b8881c45aa9b9f217976deb7ede8154c5859f3461685115221668803eecf2f7e6
WARNING:esys:src/tss2-esys/api/Esys_ContextSave.c:247:Esys_ContextSave_Fini=
sh() Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_ContextSave.c:92:Esys_ContextSave() Esys =
Finish ErrorCode (0x00000184)
ERROR: Esys_ContextSave(0x184) - tpm:handle(1):value is out of range or is =
not correct for the context
ERROR: Error saving tpm context for handle
ERROR: Unable to run tpm2_createak

TPM tools version that I am using:
 tpm2-tools-4.1.1 [link (https://github.com/tpm2-software/tpm2-tools/releas=
es/tag/4.1.1)] =

 tpm2-abrmd-2.3.1 [link (https://github.com/tpm2-software/tpm2-abrmd/releas=
es/tag/2.3.1)]
 tpm2-tss-2.3.2 [link (https://github.com/tpm2-software/tpm2-tss/releases/t=
ag/2.3.2)] =



Thanks,
Chenxi
--===============1580128084251745156==--

