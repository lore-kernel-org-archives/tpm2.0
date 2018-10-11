Content-Type: multipart/mixed; boundary="===============6956950043084430278=="
MIME-Version: 1.0
From: Scheie, Peter M <Petre.Scheie at gd-ms.com>
Subject: Re: [tpm2] How to clear DA lockout mode ?
Date: Thu, 11 Oct 2018 13:02:37 +0000
Message-ID: <a537ec611c2e461ead54db5ef4945b82@AZDC-MMB02.GD-MS.US>
In-Reply-To: 848b1467-f06e-f99b-1af2-f4e117056a78@mikronika.pl
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6956950043084430278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think you may have to use -c and -L together to clear the lockout passwor=
d:

tpm2_takeownership -c -L lockpassword

Note that this will also clear any NVRAM indexes you've setup with the owne=
r password.

Peter

-----Original Message-----
From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Tomasz Przybysz
Sent: Thursday, October 11, 2018 4:00 AM
To: tpm2(a)lists.01.org
Subject: Re: [tpm2] How to clear DA lockout mode ?

Also:
tpm2_takeownership -c
ERROR: Clearing Failed! TPM error code: 0x921
ERROR: Unable to run tpm2_takeownership

_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://lists.01.org/mailman/listinfo/tpm2

--===============6956950043084430278==--

