Content-Type: multipart/mixed; boundary="===============1507528274284987169=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] Esys_Create Error
Date: Tue, 20 Nov 2018 08:48:12 -0800
Message-ID: <ac10b146-b552-c7a6-5fd4-50292b8bbf64@intel.com>
In-Reply-To: CANva-dxYnW=AnHTv=g8McCLM0r6SXZ9r-575353=uAi6zdp_bQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1507528274284987169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/20/18 5:56 AM, Sourajit Mukhopadhyay wrote:
> Dear team,
> =

> I am working on a test code to check the unseal functionality for educati=
onal purposes. I am following the test module for ESAPI unseal, and the tes=
t code is working on one system perfectly with the IBM simulator, but faili=
ng on another system running the same version of the simulator with:
> =

> WARNING:esys:src/tss2-esys/api/Esys_Create.c:421:Esys_Create_Finish() Rec=
eived TPM Error
> ERROR:esys:src/tss2-esys/api/Esys_Create.c:164:Esys_Create() Esys Finish =
ErrorCode (0x00000921)
> Esys_Create fail
> =

> I am unable to detect the cause of this=C2=A0error, since the same code i=
s running perfectly fine on a different system with same version of the sim=
ulator. Any advice on the cause of this issue would=C2=A0be highly apprecia=
ted.
> =


$ tpm2_rc_decode 0x00000921
tpm:warn(2.0): the command may require writing of NV and NV is not current =
accessible

Have you ran out of free NV indexes?
Try restarting the simulator with -rm option:
$ tpm_server -rm

Thanks,
-- =

Tadeusz

--===============1507528274284987169==--

