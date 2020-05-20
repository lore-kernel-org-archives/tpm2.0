Content-Type: multipart/mixed; boundary="===============6895857603937751690=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: authHandle issues
Date: Wed, 20 May 2020 14:59:10 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EEFEBF@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CANGCWd0wLxEi+NOeEoHx1_TLx8Sed6ekJ=PaEkfgt=gdBeXDMQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6895857603937751690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Muthukumar S [mailto:muthu.smk(a)gmail.com]
> Sent: Wednesday, May 20, 2020 4:29 AM
> To: tpm2(a)lists.01.org; Roberts, William C <william.c.roberts(a)intel.co=
m>
> Subject: authHandle issues
> =

> Hi Roberts,
> =

> Thanks a lot for your response. As per your suggestion , I remember that =
I set
> "authHandle" as ESYS_TR type. And the test code that I have shared also h=
as the
> same implementation.
> =

> Below is how I set the "authHandle" , which is of ESYS_TR type and passed=
 as
> argument to below Esys_NV_Read () API.
> =

> ESYS_TR authHandle =3D 0x40000001;

Just because the C type is an ESYS_TR doesn't mean the value you're assigni=
ng is
Correct. You're assigning the raw tpm handle to that ESYS_TR. ESYS doesn't =
understand
That. You need to assign either:
1. The value of nv_index2 (saying authorize me by using the authvalue for t=
he nv index)
2.  ESYS_TR_RH_OWNER (saying authorize me by using the authvalue of the own=
er)

You can find the definition for ESYS_TR_RH_OWNER here:
https://github.com/tpm2-software/tpm2-tss/blob/master/include/tss2/tss2_esy=
s.h#L54

In retrospect, we should have made ESYS_TR an enum to make this more explic=
it.

> rc =3D Esys_NV_Read(
>                 ectx,
> 		authHandle,
>                 nv_index2, /* the nv index to read from */
>                 ESYS_TR_PASSWORD,
>                 ESYS_TR_NONE,
>                 ESYS_TR_NONE,
> 		20,
>                 0,
>                 &read_data);
>                 if (rc !=3D TSS2_RC_SUCCESS) {
>                         printf("Esys_NV_Read <ERROR>: 0x%x\n", rc);
>                 	goto out;
> 		}
> Let me know , anything else am I missing?
> =

> BR,
> Muthukumar

--===============6895857603937751690==--

