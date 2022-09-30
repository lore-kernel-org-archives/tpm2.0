Content-Type: multipart/mixed; boundary="===============4089630097282134191=="
MIME-Version: 1.0
From: burnsds.accounts at protonmail.com
Subject: [tpm2] Clearing TPM
Date: Fri, 30 Sep 2022 16:26:56 +0000
Message-ID: <20220930162656.2030.79430@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4089630097282134191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I am working a Linux IoT integration with TPM 2.0 and want to write a provi=
sioning script for ensuring the TPM is setup consistently on the device.  T=
he script uses tpm2_clear and tpm2_changeauth.  Some of my devices show the=
 following error message when calling tpm2_clear:

dhub(a)dhub336:~$ sudo tpm2_clear
[sudo] password for dhub:
WARNING:esys:src/tss2-esys/api/Esys_Clear.c:291:Esys_Clear_Finish() Receive=
d TPM Error
ERROR:esys:src/tss2-esys/api/Esys_Clear.c:97:Esys_Clear() Esys Finish Error=
Code (0x00000921)
ERROR: Esys_Clear(0x921) - tpm:warn(2.0): authorizations for objects subjec=
t to DA protection are not allowed at this time because the TPM is in DA lo=
ckout mode
ERROR: Unable to run tpm2_clear

This makes me nervous as some of the devices need to be provisioned in the =
field.  Why is the DA lockout preventing me from clearing the TPM?  This is=
 occurring on a NUC10 where the TPM is implemented in the PTT.

Thanks,
Dan Burns
--===============4089630097282134191==--

