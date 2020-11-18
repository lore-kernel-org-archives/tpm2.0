Content-Type: multipart/mixed; boundary="===============7044074889309594141=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] tpm2_getekcertificate: certificate not found on Infineon SLB
 9670
Date: Wed, 18 Nov 2020 19:20:15 +0000
Message-ID: <20201118192015.2865.73157@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7044074889309594141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I had some problems getting the Endorsement Key Certificate on a server usi=
ng a TPM 2.0 Infineon SLB 9670.
Version of the TPM2 Tools are 4.3 tagged release, compiled from source.
The TPM seems to have the cert in the expected handle (0x1C00002 RSA, 0x1C0=
000a ECC)

$ tpm2_getcap handles-nv-index
- 0x1C00002                 =

- 0x1C0000A

I initially tried to get that with the tpm2_getekcertificate, but when I ru=
n the tool, it returns an exit code 0, and a string saying that the cert co=
uld not be found

$ tpm2_createek -G rsa -u ek.pub -c key.ctx
$ ls
ek.pub  key.ctx

$ tpm2_getekcertificate -u ek.pub
Certificate not found

$ echo $?
0

Then, I executed the tool with --verbose mode, and I saw that is trying to =
pull the cert from ekop.intel.com. =

I could not find the url for Infineon.

Later, I found this post https://www.infineonforums.com/threads/6044-Optiga=
-Endorsement-Credential-Certificate-%28tpm2_getmanufec-URL%29
and I could use that to retrieve the cert from the handle:

$ tpm2_nvread 0x1c00002 > nvread.1c00002.crt          =

$ tpm2_nvread 0x1c0000a > nvread.1c0000a.crt

So, a couple of questions and comments:

1. I noticed that the latest master tpm2_getekcertificate man page specifie=
s that it will fetch the cert from the nvindex now. So, with the next relea=
se, getting the nvindex cert with tpm2_getekcertificate should work right? =
Also, is this version returning non 0 exit code if the cert was not found? =

2. Does Infineon provides a server for fetching the EK Cert? Having that se=
rvice is important if you are doing bulk operations over several servers. =


It took some time to get this figured out for us, so I think any help futur=
e users can get in the UX of using this tools is valuable!
--===============7044074889309594141==--

