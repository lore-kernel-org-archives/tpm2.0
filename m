Content-Type: multipart/mixed; boundary="===============5866659483683954261=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: writing in to NVRAM by using Tss2_Sys_NV_Write()API and
 create a C library
Date: Wed, 15 Apr 2020 15:14:28 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649ECECEB@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200414075330.2799.86716@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5866659483683954261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: muthu.smk(a)gmail.com [mailto:muthu.smk(a)gmail.com]
> Sent: Tuesday, April 14, 2020 2:54 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] writing in to NVRAM by using Tss2_Sys_NV_Write()API and
> create a C library
> =

> Hi @William Roberts,
> As you suggested i tired using "Tss2_Sys_NV_Write () API to write a data =
buffer
> to NV RAM. I make the code working and am getting core dump issue in sett=
ing
> up the argument of "Tss2_Sys_NV_Write()" . Please find below code snippet=
 that
> am currently working and throws "coredump" error after below print statem=
ent .
> *********NV INDEX TESTS*************
>  As i said above , the issue might be the args that am not setting up pro=
perly
> (except data buffer) . Can you guide on what am i missing here and make t=
his
> code working . Also i need to read the same buffer using "Tss2_Sys_NV_Rea=
d()
> API .
> =

> NOTE : Right now am using SIM to test this TPM stuff.
> =

> =

> TPM2B_DIGEST *bytes =3D NULL;
> =

> /* In main function iam using Esys_GetRandom() API to generate a Random
> number and passing that Esys_GetRandom()API output buffer as input to my
> another function tpm2_nv_write() to what that buffer in to NVRAM */ void
> main() {  TSS2_RC rc =3D Esys_Initialize(&ectx, NULL, NULL);
>         if (rc !=3D TSS2_RC_SUCCESS) {
>                 fprintf(stderr, "Esys_Initialize: %s\n", Tss2_RC_Decode(r=
c));
>                 exit(1);
>         }
> =

>         rc =3D Esys_GetRandom(ectx,
>                         ESYS_TR_NONE, ESYS_TR_NONE, ESYS_TR_NONE,
>                         64, &bytes);
>         if (rc !=3D TSS2_RC_SUCCESS) {
>                 fprintf(stderr, "Esys_GetRandom: %s\n", Tss2_RC_Decode(rc=
));
>                 exit(1);
>         }
> =

>     size_t i;
>     for (i =3D 0; i < bytes->size; i++) {
>         printf("%02x", bytes->buffer[i]);
>     }
> =

>     printf("\n");
> =

>     printf("Writing the RandomKey in to TPM using nvwrite API\n");
>     //tpm2_nvwrite -x 0x1c00002
> =

>     printf("***********Performing MemCopy to nv_write_data.buffer\n");
>     memcpy(nv_write_data.buffer, bytes->buffer,
>                sizeof(bytes->buffer));
> =

>     /*Calling my own below function to write the newly generated random
> number to nvRam*/
>     tpm2_nv_write(&nv_write_data.buffer);

You need to pass ectx. The Esys context pointer contains all the informatio=
n and
State for talking to the TPM.

> ..
> ...
> }
> =

> =

> /* my tpm2_nv_write funcation , which takes the input as "data buffer" . =
By
> which this "buffer" data has to be written in to NVRAM" */ void
> tpm2_nv_write(TPM2B_MAX_NV_BUFFER *nvWriteData) {
>     UINT32 rval;
>     TSS2_SYS_CONTEXT *sysContext;

Why would you switch from the ESYS (esapi) library to the SYS (sapi) librar=
y?
Generally you just pick one and stick with it.

>     TPM2B_NV_PUBLIC publicInfo;
>     TPM2B_AUTH  nvAuth;
>     TSS2L_SYS_AUTH_RESPONSE sessionsDataOut;
>     int i;
>    TPM2B_MAX_NV_BUFFER nvData;
> =

>     TPM2B_NV_PUBLIC nvPublic;
>     TPM2B_NAME nvName;
> =

>     TSS2L_SYS_AUTH_COMMAND sessionsData =3D { .count =3D 1, .auths =3D {{
>         .sessionHandle =3D TPM2_RS_PW,
>         .sessionAttributes =3D 0,
>         .nonce =3D {.size =3D 0},
>         .hmac =3D {.size =3D 0}}}};
> =

>     printf("*********NV INDEX TESTS*************\n" );
> =

>     nvAuth.size =3D 20;
> =

>         rval =3D Tss2_Sys_NV_Write( sysContext, TPM2_RH_PLATFORM,
> TPM20_INDEX_TEST1, &sessionsData, &nvWriteData, 0, &sessionsDataOut );

How did you initialize any of the input variables? It looks like you didn't.
sysContext is a pointer and it was never properly initialized, so its point=
ing
to whatever garbage value it has. Which means when the CPU attempts
to fetch memory, it's not allocated and you get a crash.

Switch your call to Esys_NV_Write.

TSS2_RC
Esys_NV_Write(
    ESYS_CONTEXT *esysContext,
    ESYS_TR authHandle,
    ESYS_TR nvIndex,
    ESYS_TR shandle1,
    ESYS_TR shandle2,
    ESYS_TR shandle3,
    const TPM2B_MAX_NV_BUFFER *data,
    UINT16 offset);

TPM2B_MAX_NV data =3D {
    .size =3D 4,
    .data =3D { 'h', 'e', 'l', 'p' }
};
TSS2_RC =3D Esys_NV_Write(ectx,
ESYS_TR_RH_PLATFORM, // what hierarchy to authenticate with, this can also =
be the same as the NV index itself (see notes below),
Nv_index, // The Esys TR of a nv index,
ESYS_TR_PASSWORD, // You want to authenticate with a password. Unless you s=
et the password, it assumes an empty password.
ESYS_TR_NONE,
ESYS_TR_NONE,
&data, // data to write
0); // start at beining of index location.

authHandle:
NV indices can be authenticated by their handle, or their associated hierar=
chy. This is all setup with you call Esys_NV_DefineSpace().
If you need to set a password, you call:
TSS2_RC
Esys_TR_SetAuth(
    ESYS_CONTEXT *esysContext,
    ESYS_TR handle,
    TPM2B_AUTH const *authValue);


nvIndex:
This has to be an Esys_TR, which is a different way of representing resourc=
es in the TPM. If you call Esys_NV_DefineSpace() to create
An NV index, it give you back in ESYS_TR, you can serialize these and save =
to disk with all you want via:
Esys_TR_Serialize
Esys_TR_Deserialize

However, if you start with a TPM NV handle, like 0x1000000, you need to con=
vert that to an ESYS TR via:
Esys_TR_FromTPMPublic().


The best place to look for complete, simple examples is in the test code:
https://github.com/tpm2-software/tpm2-tss/tree/master/test/integration


However, the fact that you're passing trivial unutilized wild pointers,  in=
dicates
That not only are you trying to figure out how to use the TPM, but also fig=
uring out
how to code and code in C. I would recommend conquering the learning to
program in C, and this TPM API will be much simpler, or just use the tpm2-t=
ools.

I can't help you learn how to program in C, but I wish you the best luck. T=
his
Will be my last lengthy reply. I'll continue to answer API and TPM questions
However.

> =

> =

> }
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============5866659483683954261==--

