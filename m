Content-Type: multipart/mixed; boundary="===============1444686252152607267=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Need assistance to encrypt/decrypt data using tpm2-tss
Date: Mon, 05 Nov 2018 15:03:09 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C7953C@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CANva-dxWzMEZUzsKEMBJuBqpjsUxzS+cHOz9Q34RON0hM-nzKA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1444686252152607267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Could you use the tpm2-tools as sample code?
https://github.com/tpm2-software/tpm2-tools/blob/master/tools/tpm2_encryptd=
ecrypt.c

In general you need to get a:
TCTI context to the simulator
SAPI context using the aforementioned TCTI
Call TPM2_EncryptDecrypt() or TPM2_EncryptDecrypt2(), see:
https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-3-Com=
mands-01.38.pdf

See Section 15.2 on the command fields.

As an aside, I often times compile everything with debugging flags and run =
both the simulator and client
Application in debuggers so I can see what's actually going on. I've found =
that to be invaluable when I am
Lost.



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Sourajit
> Mukhopadhyay
> Sent: Monday, November 5, 2018 6:41 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Need assistance to encrypt/decrypt data using tpm2-tss
> =

> Dear team,
> =

> I am a beginner trying to learn more about the TPM and its functionalitie=
s. I am
> trying to write a basic code using the SAPI to make the TPM generate a ke=
y and
> encrypt some data/file, and then later decrypt the same.
> So far I have been unable to perform the desired task. I have referred to=
 the
> sapi-assymetric-encrypt-decrypt test module. I am using the IBM TPM simul=
ator
> on Linux. So far searching on the internet for anything relevant ended wi=
th
> nothing positive. I would be highly grateful if someone could give a short
> description/steps to guide me through this.
> =

> Regards,
> Sourajit Mukhopadhyay

--===============1444686252152607267==--

